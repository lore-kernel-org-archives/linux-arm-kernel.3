Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDE6CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7e3L53sUW1d+Bfoqg00mDuEDj9VIp+PBNSFY8qeoFE=; b=Chw7MDmxTunvXoBpHWRJ5ir0ye
	z5FY94pKw1bDVKmCclbfzqT00hrqLQeDRNdUFKsgaTAG98MdehrAXQanBn7YVhyVikaHyVeA5qyZF
	M158cMycFROJ8MeENlKhIjFWwM+I+V627TViILMwHTHdm6QzjdjemuLTf12LPEqtnFMT4nixNUPwH
	R95hXXy9+Pel33D5Ah+Q6VJTQqIQWNFsY84f5nLGAusY/uCcx1cwvl9EY5WCZt2+XwCdFX0cPDCxz
	2k8Nfs89B9OxwBAAnBzwxpox+emyvn/4vO/uzwlAo4x1IncpeDDiWvvkJEtmk7Zs7sAVJTuOaLtes
	jIgCN77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6NL-00000008Vpj-0QTv;
	Thu, 21 May 2026 16:35:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6NI-00000008Vou-0Dw4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:35:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F61A2681;
	Thu, 21 May 2026 09:35:49 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 062CD3F85F;
	Thu, 21 May 2026 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779381354; bh=jlfJeKJm1hTnJq4v7hEIhthbbG3WNZvPoQtYgMWg1gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIIwLzUmpq7MmzvqVw16Yu78GwgTsuL9j/0etSfc8+L7Y1ukE/V4S07CZw9znmrcy
	 MgciPkvdhNDpzqbu2C8z7XvTK8aXbwTiHba/K3LSNfEA9/nVhDLtXmhBAP+61MPqI8
	 xjCieJATeIg8qe28gwnIXxRsaE05QtQqUUz4cA1o=
Date: Thu, 21 May 2026 17:35:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Srirangan Madhavan <smadhavan@nvidia.com>, will@kernel.org,
	mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@arm.com,
	conor@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, vsethi@nvidia.com, jevans@nvidia.com,
	raghupathyk@nvidia.com, srikars@nvidia.com, nbenech@nvidia.com,
	alwilliamson@nvidia.com, Dan Williams <danwilliams@nvidia.com>
Subject: Re: [RFC PATCH 2/2] arm64: mm: add SMCCC-backed cache invalidate
 provider
Message-ID: <ag80YYdvyxOqb23j@arm.com>
References: <20260521073047.320614-1-smadhavan@nvidia.com>
 <20260521073047.320614-3-smadhavan@nvidia.com>
 <20260521121812.2e4abd71@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521121812.2e4abd71@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_093556_139417_A1F22D29 
X-CRM114-Status: GOOD (  19.84  )
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

On Thu, May 21, 2026 at 12:18:12PM +0100, Jonathan Cameron wrote:
> On Thu, 21 May 2026 07:30:47 +0000
> Srirangan Madhavan <smadhavan@nvidia.com> wrote:
> >  MAINTAINERS                 |   1 +
> >  arch/arm64/mm/Makefile      |   1 +
> >  arch/arm64/mm/cache_maint.c | 180 ++++++++++++++++++++++++++++++++++++
> 
> File location wise, this is a driver for a subsystem, be it one closely
> coupled to arm.  Arm maintainers, do you want it in there or in drivers/cache ?
> My personal preference is always to keep drivers with subsystems but I don't
> care that much.

Yes, it makes more sense to keep it under drivers/cache/. We have many
other users of the SMCCC interface under drivers/.

> 
> >  3 files changed, 182 insertions(+)
> >  create mode 100644 arch/arm64/mm/cache_maint.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2fb1c75afd16..33c35f8e6e40 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25383,6 +25383,7 @@ M:	Jonathan Cameron <jic23@kernel.org>
> >  S:	Maintained
> >  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> >  F:	Documentation/devicetree/bindings/cache/
> > +F:	arch/arm64/mm/cache_maint.c
> 
> I wonder if this should just have a separate maintainers entry? 
> We did that for the hisi driver.

Not needed if the code is moved to drivers/cache/.

> > +struct arm64_smccc_cache {
> > +	/* Must be first member */
> > +	struct cache_coherency_ops_inst cci;
> > +	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
> > +	u32 latency_us;
> > +	u32 rate_limit;
> > +	bool global_op;
> > +	u64 global_flush_gen;
> > +};
> > +
> > +static struct arm64_smccc_cache *arm64_smccc_cache;

Nit: if these are all static, does it still make sense to use the arm64_
prefix throughout this file?

-- 
Catalin

