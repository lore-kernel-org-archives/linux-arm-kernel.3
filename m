Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F58BD5D683
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 18:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7/6FmrRIsYFag6C9xznoeLcu2eDTw94Tic9c7jHBrU=; b=T9xakHRtIduUF/qBq1FbllOy9K
	rI/kOhTta44TpN9LQQU9Ymcn9HBzcFDCJvTv2AS051qgOTxZM9s4PJk+gkDI94+hRON6x9e5kkev9
	Wa/+I2ocBRfmqbEoSp6J0qWX6PrOUXEpYnn935WuOoY+2w9xjQVuhnAymQvjvafUOMuWTpoipKMtR
	q6G07UlsBtKvckYZ19/zHaaif55sSD7ATollBQD7D9vHhhqOep/k8EdGLCVMzUTDp0JuQfvBFWxmU
	dtJK+Rf8SdaARSLXutgFxjkNU3QVooIlfgWh0g29s0xguLoIcXclbxBJqj2H8amna1K5yLu1jUd8+
	hteg4EQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97OB-00000007wta-0NYy;
	Thu, 07 Nov 2024 18:37:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97MP-00000007we0-3rJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 18:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BC5C5C4AC4;
	Thu,  7 Nov 2024 18:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8FCC4CECC;
	Thu,  7 Nov 2024 18:35:59 +0000 (UTC)
Date: Thu, 7 Nov 2024 18:35:57 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Liao, Chang" <liaochang1@huawei.com>
Cc: mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	will@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: uprobes: Optimize cache flushes for xol slot
Message-ID: <Zy0IjTkqlCZ9DRWN@arm.com>
References: <20240919121719.2148361-1-liaochang1@huawei.com>
 <3d166642-4062-42ed-9e24-1771cd819110@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d166642-4062-42ed-9e24-1771cd819110@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_103602_022100_8084B4DB 
X-CRM114-Status: GOOD (  13.69  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Nov 06, 2024 at 05:55:16PM +0800, Liao, Chang wrote:
> 在 2024/9/19 20:17, Liao Chang 写道:
> > On 09/23, Will Deacon wrote:
> >> However, we should use __GFP_ZERO anyway
> >> because I don't think it's a good idea to map an uninitialised page into
> >> userspace.
> > Agreed, and imo this even needs a separate "fix info leak" patch.
> > 
> > Oleg.
> 
> Given that Oleg's fix info leak patch has been merged [1], the risk of leakage
> is gone. So I am looking forward to your options about this patch. As many
> functions start with same instructions like 'stp fp, lr, [sp, #imm]' or
> 'paciasp'. So I think this patch could avoid unnecessary D/I cache synchronization.
> 
> [1] https://lore.kernel.org/all/20240929162047.GA12611@redhat.com/

The patch is fine with the fix in __create_xol_area(). But please add a
comment on why it is safe to skip the cache maintenance, something like
"the initial cache maintenance was done via set_pte_at()" (well, I can
do this when applying).

-- 
Catalin

