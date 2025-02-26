Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE041C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5jm8BJlnxG6jQ/vBUPzR+hIG6iR1oShUD5WfYSc/MA=; b=heSwuubhmDJCDSTyks8TdvuU9a
	Or+APOyBMPQtrZmT7/2eQwApvQJsi8riRPhg2qLbzeJMOUJxSE1rn+E4VFEDuZr7g1otYqXvcjMAe
	5gqKBAJfhtBIPqUII3d06ozyYwe6wV5TdUR5r4LD46lgOO9F8zVuBNxlmqFWJ2VTStNlCOVLp0Gs3
	Rpp5xxUK3IXRrjaVZ1tJj0bWcO8KSw5TyirPxhXuGrAygI8/mhSUIGcfaiMbKieHLFfDM0uN/v+05
	o95xJyhmZmVCbP59MOqtz9kZ3T/QA1L33ehZef+FCz6tC54CSdop8bvydOR73dxS2EoHpEBwis/Xw
	5Mrimiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnL4C-00000004hNR-3T2j;
	Wed, 26 Feb 2025 17:19:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnL03-00000004gH9-27EO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 17:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA7CC5C73C4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 17:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE14C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 17:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740590110;
	bh=yDq6FhiPks4Ni/UD3gdC1MXn9apoLwfXV3btFFdqudE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CSNucT1WVr6bhbaG/eNar7P4qAOsFQ8TrHKH3gaK9MwmmZRBaBSVTE43K6W3tQKb0
	 iqBYqLAG6yzC36vGRpTQvCrJmpfEasZgcZyU6aaSROMHRpmJYudFkYrE8hhZy6Rcvf
	 kSMIAYhUcauzMJsqTiu8MZI8VP2rwn5F/8P4JKfRyDbdS5fY6PDfNLWXMyQeLk4QHw
	 5SSTs89hh+e5LBgfI07SJ+CEqL+no3LlPdkQ14TsptCGbsJ0euYXYcRUJdAF+fDG1B
	 YjoT+TiBgyHchsYu0zqD/W7oYMfOUCEwtFBM4QltnDCgv7jt3bzIVEzvy3v6wORLqQ
	 UD/4Mksq5YO9g==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso11661990a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 09:15:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX04QDjTY+8eE+NT+ZI5Y/LnDAe8mGZHhuGGxlL2KtVTIvlHRIGxVhVBuKf9T3zMgun7J/nbfF7iAaPDB73W/hU@lists.infradead.org
X-Gm-Message-State: AOJu0YwHCyPfqUC1cPhR7l551Ntb2fgmJRbNm9z4rqHi3wIhsDJw0ic2
	acuMt81GIDA1ZYe29dzUeGxyvmrty0ReUatXYbzRAGqBc2o2tnY7JEWXPJQnNdBG0us//Q+ddFX
	P/FAmT6j3eYr/OUzlvLmxrpQIeA==
X-Google-Smtp-Source: AGHT+IG6ki3Nh3Jcc3+FNKhZ4DjyuMcfvS8JuUCdoIhctR7oFoNEKiasPTiCqnoci1e/I6F3G+94PRSzioyjymj83WE=
X-Received: by 2002:a05:6402:448f:b0:5e4:b874:3df7 with SMTP id
 4fb4d7f45d1cf-5e4b8743f06mr1681182a12.25.1740590108944; Wed, 26 Feb 2025
 09:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20250203050828.1049370-1-anshuman.khandual@arm.com>
 <20250203050828.1049370-8-anshuman.khandual@arm.com> <Z7x-EDH9QP7g4lC6@J2N7QTR9R3.cambridge.arm.com>
 <2ca1dc13-cd5a-4597-9733-2343e05f53b3@arm.com>
In-Reply-To: <2ca1dc13-cd5a-4597-9733-2343e05f53b3@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Feb 2025 11:14:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+dJiRLNM_QE_r6HOg7hEkJCPR6j-TGBpiJZLd+RDBbAA@mail.gmail.com>
X-Gm-Features: AQ5f1JpoZHEuOBz0soF4EZKCAojh2v6H8m90soOJSt-k1bfoGbHi4kDZ6Ti1chI
Message-ID: <CAL_Jsq+dJiRLNM_QE_r6HOg7hEkJCPR6j-TGBpiJZLd+RDBbAA@mail.gmail.com>
Subject: Re: [PATCH V2 7/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_091511_629397_05FD3B56 
X-CRM114-Status: GOOD (  46.50  )
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

On Tue, Feb 25, 2025 at 12:17=E2=80=AFAM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 2/24/25 19:41, Mark Rutland wrote:
> > On Mon, Feb 03, 2025 at 10:38:28AM +0530, Anshuman Khandual wrote:
> >> FEAT_PMUv3p9 registers such as PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_=
EL1
> >> access from EL1 requires appropriate EL2 fine grained trap configurati=
on
> >> via FEAT_FGT2 based trap control registers HDFGRTR2_EL2 and HDFGWTR2_E=
L2.
> >> Otherwise such register accesses will result in traps into EL2.
> >>
> >> Add a new helper __init_el2_fgt2() which initializes FEAT_FGT2 based f=
ine
> >> grained trap control registers HDFGRTR2_EL2 and HDFGWTR2_EL2 (setting =
the
> >> bits nPMICNTR_EL0, nPMICFILTR_EL0 and nPMUACR_EL1) to enable access in=
to
> >> PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 registers.
> >>
> >> Also update booting.rst with SCR_EL3.FGTEn2 requirement for all FEAT_F=
GT2
> >> based registers to be accessible in EL2.
> >>
> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> Cc: Will Deacon <will@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: Jonathan Corbet <corbet@lwn.net>
> >> Cc: Marc Zyngier <maz@kernel.org>
> >> Cc: Oliver Upton <oliver.upton@linux.dev>
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-doc@vger.kernel.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: kvmarm@lists.linux.dev
> >> Tested-by: Rob Herring (Arm) <robh@kernel.org>
> >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >> ---
> >>  Documentation/arch/arm64/booting.rst | 18 ++++++++++++++++++
> >>  arch/arm64/include/asm/el2_setup.h   | 25 +++++++++++++++++++++++++
> >>  2 files changed, 43 insertions(+)
> >
> > Three things to note here:
> >
> > (1) I think this is missing some other necessary register configuration=
.
> >
> >     From a quick scan, we also require MDCR_EL3.EnPM2 (bit [7]) to be
> >     configured, which is not described in mainline nor here. If that
>
> Will update the Documentation/arch/arm64/booting.rst.
>
> >     resets to 0, then EL{2,1,0} accesses to a number of registers such
> >     as PMUACR_EL1 may trap to EL3>
> >     AFAICT the boot-wrapper resets that bit to 0, so have we actually
> >     tested all of this with the boot-wrapper? Does TF-A set this bit?
>
> Right, boot wrapper resets the bit to 0. We will need the following chang=
es
> to set that up when PMUv3p9 is available. MDCR_EL3.EnPM2 also needs to be
> set when FEAT_SPMU, FEAT_EBEP, FEAT_PMUv3_SS or FEAT_SPMU2 are implemente=
d.
> Should those features be checked here as well ?

From Arm ARM:
If FEAT_SPMU is implemented, then FEAT_PMUv3p9 is implemented.
If FEAT_SPMU2 is implemented, then FEAT_SPMU is implemented.
If FEAT_PMUv3_SS is implemented, then FEAT_PMUv3p9 is implemented.

FEAT_EBEP is v9.3 and later. if FEAT_PMUv3p9 is implemented, FEAT_EBEP
is implemented.

So I don't think we need to check anything else.

>
> --- a/arch/aarch64/include/asm/cpu.h
> +++ b/arch/aarch64/include/asm/cpu.h
> @@ -56,6 +56,7 @@
>  #define MDCR_EL3_SBRBE_NOTRAP_NOPROHIBIT       (UL(3) << 32)
>  #define MDCR_EL3_ENPMSN                                BIT(36)
>  #define MDCR_EL3_EBWE                          BIT(43)
> +#define MDCR_EL3_EnPM2                         BIT(7)
>
>  #define SCR_EL3_RES1                   BITS(5, 4)
>  #define SCR_EL3_NS                     BIT(0)
> @@ -87,6 +88,7 @@
>  #define ID_AA64DFR0_EL1_PMSVER         BITS(35, 32)
>  #define ID_AA64DFR0_EL1_TRACEBUFFER    BITS(47, 44)
>  #define ID_AA64DFR0_EL1_BRBE           BITS(55, 52)
> +#define ID_AA64DFR0_EL1_PMUVER         BITS(11, 8)
>  #define ID_AA64DFR0_EL1_DEBUGVER       BITS(3, 0)
>
>  #define ID_AA64ISAR0_EL1_TME           BITS(27, 24)
> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
> index 54e4cc4..fe7ed5f 100644
> --- a/arch/aarch64/init.c
> +++ b/arch/aarch64/init.c
> @@ -152,6 +152,9 @@ static void cpu_init_el3(void)
>         if (mrs_field(ID_AA64DFR0_EL1, DEBUGVER) >=3D 11)
>                 mdcr |=3D MDCR_EL3_EBWE;
>
> +       if (mrs_field(ID_AA64DFR0_EL1, PMUVER) >=3D 0b1001)
> +               mdcr |=3D MDCR_EL3_EnPM2;
> +
>         msr(MDCR_EL3, mdcr);
>
>         if (mrs_field(ID_AA64PFR0_EL1, SVE)) {
>
> MDCR_EL2.EnPM2 does not seem to be set on TFA either, will double check a=
nd
> get it enabled.
>
> >
> >     Are we sure we've cpatured *all* requirements for FEAT_PMUv3p9? i.e=
.
> >     is there anything else that we've missed?

For FEAT_PMUv3_SS, there's MDCR_EL3.EnPMSS, MDCR_EL3.PMSSE, and MDCR_EL2.PM=
SSE.

For FEAT_EBEP (and SEBEP), there's  MDCR_EL3.PMEE and MDCR_EL2.PMEE

I would assume those become requirements when and if the kernel uses
those features.

>
> >
> > (2) This is a fix for !VHE support for PMUACR and ICNTR, where the host
> >     may run at EL1 and consequently will be affected by fine grained
> >     traps.
> >
> >     So this probably needs a CC stable and/or fixes tag, and backport.
>
> Fixes: 0bbff9ed8165 ("perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access =
control")
> Fixes: d8226d8cfbaf ("perf: arm_pmuv3: Add support for Armv9.4 PMU instru=
ction counter")
> Cc: stable@vger.kernel.org
>
> But is there a particular stable tree this patch should be addressed ?

It's 6.12+, but the Fixes tags are enough for the tooling to decide.

>
> >
> > (3) As there's no KVM changes, this is only safe provided that the
> >     registers affected by these fine grained traps are already
> >     unconditionally trapped by other traps when running a vCPU.
> >
> >     It looks like PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 are all
> >     trapped by MDCR_EL2.TPM, so that should work as long as we emulate
> >     the PMU. For direct access, FGT2 support will be a prerequisite.
> >
> > Ideally, we'd have added support for FGT2 before the PMU functionality
> > that implicitly depends upon it. We should pay more attention to trap
> > controls in future.
> >
> > Given (1) and (2) I think someone needs to look into this a bit more an=
d
> > figure out if this needs a fixup or a respin.
>
> To summarize
>
> - Update arm64/booting.rst regarding MDCR_EL3.EnPM2
> - Add above mentioned "Fixes:" tag and "CC: stable"
> - But should respin this patch or send a fix up instead ?

It is not applied yet, right? So respin.

Rob

