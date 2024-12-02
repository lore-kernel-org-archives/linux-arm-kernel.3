Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FD0D7831C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVcRxyuRJ9o0PpZfCQXbvPoEZO/Zd+vEJQ2dhoQh4YY=; b=1V9jQE6NR0nVqTanChNhSJ0/kn
	R5QvfWCSucacvLVDKbby4j1vQeArDOQPxVQzeayi28ONJfd+N7WlxHiUQvfn72q4Sw8Ly6akSkSeM
	LQyotmrqQvNtcZdWfP0qlJRc3K6f5LlSvarAjbvuMcuC2MM3ax8rosSD6lxAiSroDn3fSUhCcduv1
	v/kREAdcnVrvzyO041Y4yjEz5L+nXy8cX6OKVK7JsMCED44XsTWwjTBdsGl2IHZBJVyyhBAuB1AKr
	AzwfHZEG6qZzXdE79TN9QkSWGCvuQ8ylF263c/VemOFnX3Mv46pPSgiA8AM04tspqnHmZFYfvQtzq
	GgRk6MDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIALJ-000000072Oc-1WKx;
	Mon, 02 Dec 2024 17:36:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAFu-000000071Gt-48EG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D593BA41053;
	Mon,  2 Dec 2024 17:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7376EC4CED1;
	Mon,  2 Dec 2024 17:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160641;
	bh=9t0leaS86rWqt3K/XDpj7l3zbrInJ4E1oiE9CI0vFTo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AMPE6N/F4na0vxF7bUAB61asl3DqTUp4smImlJGg1xjcmJ4C4MPYjtZcoSZ9JGuH9
	 bUGrVR86PaDvuxheuOJJIh9gA2rHvI7pqEAgVWXnl6ZZhdNUmNTTEKe8qgbobueFZN
	 gLTq5Z9FzeRXgiAir8UXDoeI1ZMHyf/LyNgtn7cyrOiY7Eh4gLyk6u1AU5jERfFQEY
	 d4L1zfDOJokC90osA96acFpC5d1Kdtf/ijn0VH5j29dWfm+YbQ7D/wtVOwxS/Ph5mB
	 eBzbCTaCR6xvPGySUFVx2UVc8upIlgkoDplnZg81cerK0jPb5oasKMwAwVWl1QSNkK
	 RqtHo8XdzuKOQ==
From: Vinod Koul <vkoul@kernel.org>
To: ludovic.desroches@microchip.com, mripard@kernel.org, 
 Chen Ridong <chenridong@huaweicloud.com>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 chenridong@huawei.com, wangweiyang2@huawei.com
In-Reply-To: <20241029082845.1185380-1-chenridong@huaweicloud.com>
References: <20241029082845.1185380-1-chenridong@huaweicloud.com>
Subject: Re: [PATCH] dmaengine: at_xdmac: avoid null_prt_deref in
 at_xdmac_prep_dma_memset
Message-Id: <173316063896.537992.16601132301793620749.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 23:00:38 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_093043_086990_7E1ACED4 
X-CRM114-Status: UNSURE (   6.11  )
X-CRM114-Notice: Please train this message.
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


On Tue, 29 Oct 2024 08:28:45 +0000, Chen Ridong wrote:
> The at_xdmac_memset_create_desc may return NULL, which will lead to a
> null pointer dereference. For example, the len input is error, or the
> atchan->free_descs_list is empty and memory is exhausted. Therefore, add
> check to avoid this.
> 
> 

Applied, thanks!

[1/1] dmaengine: at_xdmac: avoid null_prt_deref in at_xdmac_prep_dma_memset
      commit: c43ec96e8d34399bd9dab2f2dc316b904892133f

Best regards,
-- 
~Vinod



