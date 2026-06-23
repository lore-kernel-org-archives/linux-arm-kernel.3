Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00128CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmqc6zox7kUPN0doI4Ei7Wa2736WYuekcTFYBkdGOa4=; b=4jEmK9OvL5PxsbRSCZ2bw05Oya
	oPd3z/a/Fhzl5VsBsnxZLUaJa8qLFZ763OvVEcg+t8er13CyRrJjr/+J5xCrshtl7uyhVSRgSUQGc
	mVEVxSEXk+W492P80VX9JhnE0/B1gW6ixerIMci9/G1NtcvZfzE+sWuz6Hs0lk75DIUeZRuL5wLEu
	TwUHC56Oh72Ub0okFOl1kBTFlNtaBG6n3QkcOhGm/cmeMBHA/3H70OMnOWiDm1jgksb6f0rqBnSYK
	G8hwn+wR32cEqCou7lcDVED8icwXzKl9tY0IvNjQx4pBc9alTXsh0+pajTcOV+OuXwtpBtGAisISx
	Wkg7hm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzmW-00000006EAd-2ajP;
	Tue, 23 Jun 2026 11:59:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzmV-00000006EA7-3GR7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:59:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 396D542A8A;
	Tue, 23 Jun 2026 11:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C4D1F00A3A;
	Tue, 23 Jun 2026 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782215947;
	bh=rmqc6zox7kUPN0doI4Ei7Wa2736WYuekcTFYBkdGOa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P7KgAgew4Eyd8hZXRVB/BXrmiiQlM+/aVpMM0o1iDz0XZFHsUZoAPZFWtx541OekW
	 KXc4X3HeHxHtM+WH+Rb71Uf54xSC0/PJpnYF8u0KpicR7Jypsu1P39kfywjvBY70Da
	 FEXqkUnUxRQ/qlQFAGNW7nWDfNOauenYvELgwVD0Y3uffYxLT0MbKeNx0gJRSiCyLN
	 UPh3fle4WCT2ejc34rZbtGkHGfDNm1uCiarb40SXRxGf2zQ5mTBmVc27M4YVni+8zg
	 vUXJwQ4wNioWBTrxgjk/diwdikj+Lrhqt7pBlOWuAEnco66x3flVAxpIU4+aEn28h6
	 xinZUqbFblAxg==
Date: Tue, 23 Jun 2026 12:59:03 +0100
From: Will Deacon <will@kernel.org>
To: Joshua Liu <josliu@google.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Avoid eager DVMSync reclaim batches with C1-Pro
 SME erratum
Message-ID: <ajp1B0FIhtQsOitz@willie-the-truck>
References: <20260610104829.1157497-1-catalin.marinas@arm.com>
 <20260622125227.877198-1-josliu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622125227.877198-1-josliu@google.com>
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

On Mon, Jun 22, 2026 at 12:52:27PM +0000, Joshua Liu wrote:
> On Wed, Jun 10, 2026 at 11:37 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > Introduce the sme_active_cpus mask tracking which CPUs run in user-space
> > with SME enabled and use it for batch flushing instead of accumulating
> > the mm_cpumask() of the unmapped pages.
> > [...]
> > The dsb() in arch_tlbbatch_add_pending() -> sme_dvmsync_add_pending()
> > did introduce a performance regression for kswapd. This patch restores
> > the original behaviour with the barrier only issued when the TLB batch
> > is flushed. The trade-off is that the IPIs are now sent to all CPUs
> > running with SME enabled at EL0 even if the reclaimed pages do not
> > belong to SME tasks. This is acceptable for current SME deployments.
> 
> Profiling shows this solution has robust performance for common
> workloads and is the best among a few approaches we tested with Catalin,
> so we are happy to go with this solution.
> 
> Some sidenotes: for certain edge cases we still observe performance
> regression, specifically when a workload pegs multiple cores with SME
> status threads.
>
> Tested-by: Joshua Liu <josliu@google.com>

Thanks, Joshua, I'll pick this up at -rc1.

Will

