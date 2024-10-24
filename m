Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7EECE8E94
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZPq1KrR7SYos79el8KISO0pmuuIleWoBM2uoj5GNDk=; b=Cufi6MsaJ28NxrEZ4y5ks7968O
	qXPifZnOlPbcxMPqkpIGsSCEVIAuu22sz5RXQK2ShKZAzDFcBKXgxSyHxtXIUcN+wxN/hz2jpQ8Dn
	Op+SLy0S8rPT9D/kC0cQLaEsPFWWoUL3oEMy+iT591VV3thzpsqtt2h2RPHslNJk86NCcVqjE6DaQ
	ldPgje4O+ynksgR7f9WEe0eEfK9a8UI7/qqcFXJC2HW3ZZ4ASTfqn9VwzH9HzvA7NgMvqrb3B/ePF
	weuvblt0ZGd3XHtz8A6zjWvFfxpJSuWKS3LEz/31N2xEBi23PijKsCrkIuRuJe3zDyZ1b+zuEyG6i
	MqWCA/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40yK-000000018z9-0oXV;
	Thu, 24 Oct 2024 16:46:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40tq-0000000186v-38ev
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 495E95C1027
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 16:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924B5C4CEC7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729788085;
	bh=fB3Bqhulio4oeEbXLI7xhxRhEbXIEi7cRasK1RGg5QE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e88Esj0jfEICU7Sl1VG9pIb1+zNMaVgTNwBovHPweskMwJ/uUodosRgv/zceeFD2l
	 MFVBR7Y4mcTCEXd5kNqw6HztHrzVXxj2oYHDBd3f1AmNS0mkVOV/E3d+LypH4NRhAE
	 OefZtY6OFgtzAJ7YJNcMRKomCNzjEbj4mD9HBF/p4g9rY2CP3P/notewAI6irSWrlT
	 5PAaj1EkWwmXT2jlrgrXEgCRPZ1otvTLCxmqqnOIss8WqPeN8aJgEskisfs3EZYBv3
	 /sBfeghniGpasmOMESsRB0KQNWxFwBASOaskEqQc/p9beDLDKQ2Rz1mfN+Y54S9RPz
	 mQFSAu8wsZs7g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539fe02c386so2259255e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:41:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTbpcZxhzwhHjcheiKOh8UNoQPfYET1rdMIKi5LNMAxLYXeM8+gtOZ2ab7LMFoL0KnrB7JlLN57saaf/2cR54e@lists.infradead.org
X-Gm-Message-State: AOJu0YwDVG3hgNOK83MwsUKL6iZ9d3brcJ044czWSTwFyphlBNqauL9k
	7BZS8c5uqLcmhaPUb7aCvpEoED/MN4dW43A2R+IbqJNfAR30a+SuPx97EI3jrP9Hg8FIiIoWXek
	id0+Y/q0vD9MaqniV0UrJ2/D8jQ==
X-Google-Smtp-Source: AGHT+IFhEH5Iuzz3zLnfcaOM/T80rmHaBHiY3VgQzfeBVc8qO/dfDdRth63D7okUEyWQoMBVcW2HfX19qeWCECDv//E=
X-Received: by 2002:a05:6512:1153:b0:539:fde9:4bca with SMTP id
 2adb3069b0e04-53b2375d2d5mr988229e87.29.1729788083832; Thu, 24 Oct 2024
 09:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241002184326.1105499-1-robh@kernel.org> <20241024103953.GA30206@willie-the-truck>
In-Reply-To: <20241024103953.GA30206@willie-the-truck>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Oct 2024 11:41:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKT3gXJQLNr+H8D8nmEeGuDxS8iOje6yaCs+ne-4FcCvg@mail.gmail.com>
Message-ID: <CAL_JsqKT3gXJQLNr+H8D8nmEeGuDxS8iOje6yaCs+ne-4FcCvg@mail.gmail.com>
Subject: Re: [PATCH] perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access control
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_094126_904992_7BE7C723 
X-CRM114-Status: GOOD (  27.94  )
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

On Thu, Oct 24, 2024 at 5:40=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, Oct 02, 2024 at 01:43:24PM -0500, Rob Herring (Arm) wrote:
> > Armv8.9/9.4 PMUv3.9 adds per counter EL0 access controls. Per counter
> > access is enabled with the UEN bit in PMUSERENR_EL1 register. Individua=
l
> > counters are enabled/disabled in the PMUACR_EL1 register. When UEN is
> > set, the CR/ER bits control EL0 write access and must be set to disable
> > write access.
> >
> > With the access controls, the clearing of unused counters can be
> > skipped.
> >
> > KVM also configures PMUSERENR_EL1 in order to trap to EL2. UEN does not
> > need to be set for it since only PMUv3.5 is exposed to guests.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  arch/arm/include/asm/arm_pmuv3.h   |  6 ++++++
> >  arch/arm64/include/asm/arm_pmuv3.h | 10 ++++++++++
> >  arch/arm64/tools/sysreg            |  8 ++++++++
> >  drivers/perf/arm_pmuv3.c           | 29 +++++++++++++++++++----------
> >  include/linux/perf/arm_pmuv3.h     |  1 +
> >  5 files changed, 44 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/ar=
m_pmuv3.h
> > index f63ba8986b24..d242b5e1ca0d 100644
> > --- a/arch/arm/include/asm/arm_pmuv3.h
> > +++ b/arch/arm/include/asm/arm_pmuv3.h
> > @@ -231,6 +231,7 @@ static inline void kvm_vcpu_pmu_resync_el0(void) {}
> >  #define ARMV8_PMU_DFR_VER_V3P1      0x4
> >  #define ARMV8_PMU_DFR_VER_V3P4      0x5
> >  #define ARMV8_PMU_DFR_VER_V3P5      0x6
> > +#define ARMV8_PMU_DFR_VER_V3P9      0x9
> >  #define ARMV8_PMU_DFR_VER_IMP_DEF   0xF
> >
> >  static inline bool pmuv3_implemented(int pmuver)
> > @@ -249,6 +250,11 @@ static inline bool is_pmuv3p5(int pmuver)
> >       return pmuver >=3D ARMV8_PMU_DFR_VER_V3P5;
> >  }
> >
> > +static inline bool is_pmuv3p9(int pmuver)
> > +{
> > +     return pmuver >=3D ARMV8_PMU_DFR_VER_V3P9;
> > +}
> > +
> >  static inline u64 read_pmceid0(void)
> >  {
> >       u64 val =3D read_sysreg(PMCEID0);
> > diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/as=
m/arm_pmuv3.h
> > index 468a049bc63b..8a777dec8d88 100644
> > --- a/arch/arm64/include/asm/arm_pmuv3.h
> > +++ b/arch/arm64/include/asm/arm_pmuv3.h
> > @@ -152,6 +152,11 @@ static inline void write_pmuserenr(u32 val)
> >       write_sysreg(val, pmuserenr_el0);
> >  }
> >
> > +static inline void write_pmuacr(u64 val)
> > +{
> > +     write_sysreg_s(val, SYS_PMUACR_EL1);
> > +}
> > +
> >  static inline u64 read_pmceid0(void)
> >  {
> >       return read_sysreg(pmceid0_el0);
> > @@ -178,4 +183,9 @@ static inline bool is_pmuv3p5(int pmuver)
> >       return pmuver >=3D ID_AA64DFR0_EL1_PMUVer_V3P5;
> >  }
> >
> > +static inline bool is_pmuv3p9(int pmuver)
> > +{
> > +     return pmuver >=3D ID_AA64DFR0_EL1_PMUVer_V3P9;
> > +}
> > +
> >  #endif
> > diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> > index 8d637ac4b7c6..74fb5af91d4f 100644
> > --- a/arch/arm64/tools/sysreg
> > +++ b/arch/arm64/tools/sysreg
> > @@ -1238,6 +1238,7 @@ UnsignedEnum    11:8    PMUVer
> >       0b0110  V3P5
> >       0b0111  V3P7
> >       0b1000  V3P8
> > +     0b1001  V3P9
> >       0b1111  IMP_DEF
> >  EndEnum
> >  UnsignedEnum 7:4     TraceVer
> > @@ -2178,6 +2179,13 @@ Field  4       P
> >  Field        3:0     ALIGN
> >  EndSysreg
> >
> > +Sysreg       PMUACR_EL1      3       0       9       14      4
> > +Res0 63:33
> > +Field        32      F0
> > +Field        31      C
> > +Field        30:0    P
> > +EndSysreg
> > +
> >  Sysreg       PMSELR_EL0      3       3       9       12      5
> >  Res0 63:5
> >  Field        4:0     SEL
> > diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> > index 0afe02f879b4..bb93d32b86ea 100644
> > --- a/drivers/perf/arm_pmuv3.c
> > +++ b/drivers/perf/arm_pmuv3.c
> > @@ -770,18 +770,27 @@ static void armv8pmu_enable_user_access(struct ar=
m_pmu *cpu_pmu)
> >       int i;
> >       struct pmu_hw_events *cpuc =3D this_cpu_ptr(cpu_pmu->hw_events);
> >
> > -     /* Clear any unused counters to avoid leaking their contents */
> > -     for_each_andnot_bit(i, cpu_pmu->cntr_mask, cpuc->used_mask,
> > -                         ARMPMU_MAX_HWEVENTS) {
> > -             if (i =3D=3D ARMV8_PMU_CYCLE_IDX)
> > -                     write_pmccntr(0);
> > -             else if (i =3D=3D ARMV8_PMU_INSTR_IDX)
> > -                     write_pmicntr(0);
> > -             else
> > -                     armv8pmu_write_evcntr(i, 0);
> > +     if (is_pmuv3p9(cpu_pmu->pmuver)) {
> > +             u64 mask =3D 0;
> > +             for_each_set_bit(i, cpuc->used_mask, ARMPMU_MAX_HWEVENTS)=
 {
> > +                     if (armv8pmu_event_has_user_read(cpuc->events[i])=
)
> > +                             mask |=3D BIT(i);
> > +             }
> > +             write_pmuacr(mask);
>
> Since this is a new register, should we be zeroing it as part of our
> reset callback?

That should not be necessary since EL0 access is gated off in PMUSEREN
in general and enabling this register additionally requires setting
the UEN bit. That's only done right after this.

But if the policy is to initialize all registers with unknown reset
state, then yes, I can add that.

Rob

