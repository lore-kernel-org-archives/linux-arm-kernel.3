Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDF6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKOwVriGdl0zvdTEqmSNUZdZ6oXKMjOLE26QzLoBdqc=; b=FdnVzfMoUBoWCqSrKyZnZ1LLlU
	qYyIFB9hAY9+oa7wBhUpZvRKoFN1w029jAR+sf5vgYL+b5JzscyUvTlE11oyPF4ebsz9qlbco6+SZ
	vK1R81St4cVbpqszFM+71ZfSzPLhgGiBlPNjAlgRQiygL0n+Yj+6vQoGXYIu3a+27lT63XEveR49T
	lkMdwsTHSNCXSJg5Rkezd/s2mVKSh/chDjbVjAsjrm6b5DsCKnE7IvPjXhY/MRE3MYm2+kbr0kTwk
	jWMAtbLh4JCPuOCB/3hk02mS3hFlRa9gJhaxHmtLnZ1zj7+fKMPLOwxws6D+dmP1uksVETAwUmxIX
	G31dY3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgQS-00000005KQt-0xSS;
	Tue, 15 Jul 2025 14:14:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfDc-000000058LO-1p3U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CB8A61139;
	Tue, 15 Jul 2025 12:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33325C4CEE3;
	Tue, 15 Jul 2025 12:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752584231;
	bh=z5wyTPXmVEd1ZYkkyrXr7DhOnKLOMu2j6kn1bYNNu2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arXTtqQU+QSnwZtSgZFQUCRyEQe28EGJJWhN7GEFpPYP4LLlxjVqDlko/aH5ciQih
	 BJUm0djMUY9NLb2aHxpjqmV5efA2Zwtf7wPQJwJcVI+k5CinIK41kze1nNNu19fWd7
	 RLzpIUBjYsoNK3/UnFmcQahWeijRO5uuPY6L8gtAxUEFjwyVWpQBxFIJ/CZAAU45tl
	 ImaCL9/wM+2rG8Yk0As9LpjxmLXXQrhrUdlJQrLnw/0i2wHky4ym3U1jHHnXsRphLR
	 X6dVR1HCdjYkTidS0Aqj+2qK/8nuDV9hjBVkty62m0m6tvZ/PZ7OUV5rWNwqKlEnuj
	 ECohc5Eqn9d4g==
Date: Tue, 15 Jul 2025 13:57:03 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 04/10] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
Message-ID: <aHZQH7QGhi5pbXU8@willie-the-truck>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-4-71b0c9f98093@linaro.org>
 <aHUMMk9JUdK6luLN@willie-the-truck>
 <04d52182-6043-4eaf-a898-9f8ccc893e5f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04d52182-6043-4eaf-a898-9f8ccc893e5f@linaro.org>
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

On Tue, Jul 15, 2025 at 01:48:03PM +0100, James Clark wrote:
> 
> 
> On 14/07/2025 2:54 pm, Will Deacon wrote:
> > On Thu, Jun 05, 2025 at 11:49:02AM +0100, James Clark wrote:
> > > SPE data source filtering (optional from Armv8.8) requires that traps to
> > > the filter register PMSDSFR be disabled. Document the requirements and
> > > disable the traps if the feature is present.
> > > 
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > > Signed-off-by: James Clark <james.clark@linaro.org>
> > > ---
> > >   Documentation/arch/arm64/booting.rst | 11 +++++++++++
> > >   arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
> > >   2 files changed, 25 insertions(+)
> > > 
> > > diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> > > index dee7b6de864f..abd75085a239 100644
> > > --- a/Documentation/arch/arm64/booting.rst
> > > +++ b/Documentation/arch/arm64/booting.rst
> > > @@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
> > >       - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
> > >       - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
> > > +  For CPUs with SPE data source filtering (FEAT_SPE_FDS):
> > > +
> > > +  - If EL3 is present:
> > > +
> > > +    - MDCR_EL3.EnPMS3 (bit 42) must be initialised to 0b1.
> > > +
> > > +  - If the kernel is entered at EL1 and EL2 is present:
> > > +
> > > +    - HDFGRTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
> > > +    - HDFGWTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
> > > +
> > >     For CPUs with Memory Copy and Memory Set instructions (FEAT_MOPS):
> > >     - If the kernel is entered at EL1 and EL2 is present:
> > > diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> > > index 1e7c7475e43f..02b4a7fc016e 100644
> > > --- a/arch/arm64/include/asm/el2_setup.h
> > > +++ b/arch/arm64/include/asm/el2_setup.h
> > > @@ -279,6 +279,20 @@
> > >   	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
> > >   	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
> > >   .Lskip_pmuv3p9_\@:
> > > +	mrs	x1, id_aa64dfr0_el1
> > > +	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
> > > +	/* If SPE is implemented, */
> > > +	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
> > > +	b.lt	.Lskip_spefds_\@
> > > +	/* we can read PMSIDR and */
> > > +	mrs_s	x1, SYS_PMSIDR_EL1
> > > +	and	x1, x1,  #PMSIDR_EL1_FDS
> > > +	/* if FEAT_SPE_FDS is implemented, */
> > > +	cbz	x1, .Lskip_spefds_\@
> > > +	/* disable traps to PMSDSFR. */
> > > +	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
> > 
> > Why is this being done here rather than alongside the existing SPE
> > configuration of HDFGRTR_EL2 and HDFGWTR_EL2 near the start of
> > __init_el2_fgt?
> > 
> I thought everything was separated by which trap configs it writes to,
> rather than the feature. This SPE feature is in HDFGRTR2 so I put it in
> __init_el2_fgt2 rather than __init_el2_fgt.

That's fair; __init_el2_fgt isn't the right place. But the redundancy of
re-reading PMSVer from DFR0 is a little jarring.

> I suppose we could have a single __init_el2_spe that writes to both HDFGRTR
> and HDFGRTR2 but we'd have to be careful to not overwrite what was already
> done in the other sections.

Right, perhaps it would be clearer to have trap-preserving macros for
features in a specific ID register rather than per-trap configuration
register macros.

In other words, we have something like __init_fgt_aa64dfr0 which would
configure the FGT and FGT2 registers based on features in aa64dfr0. I
think you'd need to have a play to see how it ends up looking but the
main thing to avoid is having duplicate ID register parsing code for
setting up FGT and FGT2 traps.

Will

