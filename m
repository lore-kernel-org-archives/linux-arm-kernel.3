Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1Qi8aaabkyU8mLYWdZ4vkmaNrhKLS+kwl7chKsoswg=; b=ln59iI7AUs2hC9oFPsI5b+BtKm
	rWJFmpljXr85WsiJJfvHSO4CxIKB/wYTiCth0rm6ThDoy69i8nY33gc2yJ/5H1aJw6Wn9c2jpj3Uh
	utZZ54lsXJyD/oiQImLcnFZjiO/Cb33sx6MeFyyDRGIiy8nYfYmp/Wkn51txHlJbv4aguU+WqVlai
	ju6E2P4YK0yY1Fa10sh85oMZ2iaBxi87uX5A3fJSrkeAz5PPFsWInW3XEttW/rcRaaIIZIG9m+1um
	DUycxM/PcxeRu4aHvS4KHae+eQcekz1orUy+tR/nEl2L2nHxtTPskz6Nh+NTeosKpgRR1fSylyWpf
	4aeETKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAet-0000000EVBT-25m2;
	Mon, 29 Jun 2026 12:00:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAen-0000000EV9m-0M3J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:00:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A703040825;
	Mon, 29 Jun 2026 12:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CC91F00A3A;
	Mon, 29 Jun 2026 12:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782734408;
	bh=L1Qi8aaabkyU8mLYWdZ4vkmaNrhKLS+kwl7chKsoswg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gkgpitWUSNEUB92fkfmyLjluF7YMPrr4yKIK2mnxxARELLKfmAbQe8nmDcoCvczRt
	 KzsNGnQ6DxslzxSRsVtgOjXosKBEDsnC7DUCOsRMyjZWOxhomRkbhcAAOuMRYOjt3M
	 4H12gQOoCI+xg9AUWKUnSuwH6RYPkKPppzrPoZ7K3wZsdrdiO0NOzoWv4ZlzKKsyXn
	 cw0pRh8rBsjnP0xnOM03NcFHL9xr0R00vl2kG8syIYrwZBxJ7at2Mlp7AaE4yxa+j9
	 mC7U2a3joRUvsYxxc87Ctu2NYK0T6DhvLd57wZWrRS7RRpcztDVlADXCHFtxgz040P
	 mlUpLbzKECTYQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Avoid eager DVMSync reclaim batches with C1-Pro SME erratum
Date: Mon, 29 Jun 2026 12:59:58 +0100
Message-ID: <178273083868.1015419.15360144659141801455.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610104829.1157497-1-catalin.marinas@arm.com>
References: <20260610104829.1157497-1-catalin.marinas@arm.com>
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

On Wed, 10 Jun 2026 11:37:16 +0100, Catalin Marinas wrote:
> The C1-Pro SME DVMSync workaround currently samples mm_cpumask() from
> arch_tlbbatch_add_pending(). It requires a DSB after every batched TLBI
> so that the mask read is ordered after the hardware DVMSync, defeating
> much of the reclaim batching benefit.
> 
> Introduce the sme_active_cpus mask tracking which CPUs run in user-space
> with SME enabled and use it for batch flushing instead of accumulating
> the mm_cpumask() of the unmapped pages.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Avoid eager DVMSync reclaim batches with C1-Pro SME erratum
      https://git.kernel.org/arm64/c/534eb6940a89

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

