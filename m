Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478D8E74AD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ib8G94CatERO5UDHdLFTsf8MdBfwleyWt4xBpYxb8iA=; b=Q87MKmiQY/i901UVYC9Q46t+/6
	mn/HlFr5ngxaQIEJe7JVHn0nkY25NeQLjb5QQz9X25wjAQZPf/B8/0b9fXJOb5ZTfVdX/fZFVFQY1
	RnB3WtCUwCaqKaRRnSP6gYd7JXF7vQzU2we2g1GKZh1lnj0rlJemKIWA0oahtSr4h5JXKt1o04Nvk
	MeWOpCSTWaYi+MH1X4JHShX3S437jgviofYRf0v8qDHAIxSkQqvflxvLH3qttCXYGFtsOBURFpaZC
	f/tp0K4t5Q1vch5JVm1hjwA7C+pfbfQe3fHogGusiRaMMcAKIYN+Qq2sB7b8gJJ5HHXwaXF/UylKe
	DaQ7M03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaM9-0000000Amdh-181P;
	Tue, 03 Dec 2024 21:22:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaJa-0000000Am02-32vL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 21:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 435FD5C6D82;
	Tue,  3 Dec 2024 21:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC51C4CECF;
	Tue,  3 Dec 2024 21:20:12 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	baruch@tkos.co.il,
	ptesarik@suse.com,
	hch@lst.de,
	Yang Shi <yang@os.amperecomputing.com>
Cc: jiangyutang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: fix zone_dma_limit calculation
Date: Tue,  3 Dec 2024 21:20:10 +0000
Message-Id: <173326077457.517002.14427872059455527771.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125171650.77424-1-yang@os.amperecomputing.com>
References: <20241125171650.77424-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_132014_806838_7FC94240 
X-CRM114-Status: UNSURE (   9.55  )
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

On Mon, 25 Nov 2024 09:16:50 -0800, Yang Shi wrote:
> The commit ba0fb44aed47 ("dma-mapping: replace zone_dma_bits by
> zone_dma_limit") changed how zone_dma_limit was calculated.  Now it
> returns the memsize limit in IORT or device tree instead of U32_MAX if
> the memsize limit is greater than U32_MAX.
> 
> This resulted in DMA allocations may use GFP_DMA even though the devices
> don't require it.  It caused regression on our two sockets systems due
> to excessive remote memory access.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: fix zone_dma_limit calculation
      https://git.kernel.org/arm64/c/56a708742a8b

-- 
Catalin


