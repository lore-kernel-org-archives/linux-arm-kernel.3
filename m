Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261C0C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qsc4Zo5L3mZYLrR22r5vklXk172DOT+oMtWHGKxRgdg=; b=AXSg+yMytbB4zTarrLmLpUgMK7
	cDZFcSVRH+DZlm0oP0lbyhlQ7ZfbRclnJj+aPz8v1AjgrY+NkRWac2YqIxfx8MQRp/e23vcQaV0ck
	ZsJP+5vdsVFbPh8erMS5K0HHZhyY3THBEA4nEzQF5KuvYcr8YqLjr8Z5yUQpf8PG3X4CzFthPHDG0
	dgwWyo9/sWZQUPfEdXRt68Yib+Nf/mZGz7tJD4UgnDPpmge7LBohtNNWvRZtzXCkiP0qCsz1iEqbA
	3XcW3SCm6EwTdJOIX8FKzP0Uh9DTkBcHKQYpYBMlhRB1WOG24UyWlM8+gVlgH1H6Uix6lPtu9+KJc
	PxT2Dt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV4C-0000000Fbyg-1iQi;
	Sun, 02 Aug 2026 12:13:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV4B-0000000Fbxa-4Bf2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7238660A85;
	Sun,  2 Aug 2026 12:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759E31F000E9;
	Sun,  2 Aug 2026 12:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672799;
	bh=Qsc4Zo5L3mZYLrR22r5vklXk172DOT+oMtWHGKxRgdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ffQC1JMS3vcX0TUvo8a69tH1QjN4OBaTs0Q4LE9NZqS4bcz1oWIBESSfR/+c2o5SF
	 /+33zVE2SVYdBM9mVwc/GJksUAH4KpuGTsfOm7hJU3jprcLYPWfe+tLv8vwCTOoKY4
	 23QLacMIMQ1M/q2bAmfIf1B0aNHw6y8qleU1Tsx46YTQnUSqHJ0Hwqz8yjvl9MLnzm
	 f8SMn/f1awjJDohUYvBTT2EnYHaIdb51Arv57tVSs0c/WtL1j9bVHC5nrYFiONeLnm
	 lmINIoik3jF5QlHsX6d8LxngkTx3vEL13CBWIqbRwowt3vLb16QYXFe1Tg+3xDcXch
	 cJgdl7EjCbLtA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: mm: Treat all devices as dma-coherent when CLIDR_EL1.LoC == 0
Date: Sun,  2 Aug 2026 13:12:33 +0100
Message-ID: <178566220031.4127382.9712875539182363741.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723130322.3179-1-will@kernel.org>
References: <20260723130322.3179-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 23 Jul 2026 14:03:21 +0100, Will Deacon wrote:
> On systems where CLIDR_EL1.LoC == 0, no cache maintenance is required
> when cleaning or invalidating to the Point of Coherency and therefore
> all DMA agents can be treated as coherent.
> 
> Extend arch_setup_dma_ops() to take CLIDR_EL1.LoC into account when
> setting the DMA ops for a device, emitting a warning message if the
> firmware advertises a non-coherent device on a fully coherent system.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: mm: Treat all devices as dma-coherent when CLIDR_EL1.LoC == 0
      https://git.kernel.org/arm64/c/233b5554e07b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

