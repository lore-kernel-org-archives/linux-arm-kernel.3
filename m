Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7616FC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azTNIlCbmCGpXULMZlMc8WlqU28SikR0twqNo8pc6mU=; b=eq7xZLd/gdeCtTd3LE3PpSLVdn
	AoLJ5jnoj2mPKbhUe8mbNmi7lLI5B4BlPPU6vD1pgeE668IgSWxF+1BYlSF72RifGzKvPyeaURDOr
	eDBR2bte3SCpbFMs61gCHQmNf1M/bSXFNnjQNhhnn0+23KR8027NGRel3UU88wmFj8LGf8A506ld7
	aKHmFhoJOBG7qRh6P7DQGtxr9Atq3nqx+Fn1Of9c168OZpngxFsIyY5N8QStNNAuxobCFYkge6gZQ
	5JQtVkgOun/dB337AZ/70zDH8oLgpmhSAf2VwDsYjOE72ooLfeyIYdxaENoP9leQQdJ5c6necOjcK
	M+jAkcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnUX-000000058W7-1pG8;
	Tue, 28 Jan 2025 15:27:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnTB-000000058MY-3Z5x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB6DD5C5FF2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 15:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF4EC4CEE6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738077940;
	bh=nV+FzWKbANZx9HgkidFwG5xrewDqm4kJlQ/F9Fw2IS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CjQUKk8tgxNT5FiUYgBP/EkH7tciprh6KefMogl3Po5J42mA3NXuFZi0diBTojoUc
	 8dehbYcAIgY1+RCViQd/qQrLPWw6Sr5NiNCPOH2Zt26btzxy5SF2dyEHjCzr/mVi2g
	 U5YsZURkMYZA5Ajf74Ykhuf5uAc6+UvVXSU1XpiiTLluENpKrp8UJ3zO2Rf1VOAC1B
	 yf0cVzboM9VEGvZehKjN1UTBQTY6oRiojzAiRao8mFyZSrQqKEw9Ez+EU0+ZquVV8t
	 /ixlbIXRNpi/g/TyT76quaBuGmBMlqqNg7cVdf/1CEItBggR9PxZdBr7iZ5hanR/QA
	 q/RK3c0WhfAiQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540201cfedbso5597489e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 07:25:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtlPlwxQWLfkFG1mQnMt+mFwq0zs4u5CtyEVFDvFolOQ2ii/P+P49Dg28zSFvbiYmX0aVhB+kuw+pPvMvVhJGV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7duoyFJ+XMkuaBdlw7zWYeW6HEIPhWSun8DEYZ2NE0adbvWgq
	DfARhkVH9tBa+JrOan8usQOasPQIUx7Mihzb4DmTVgLUPiDacmcNY3G5XaFcQhAq5u2Kh7RhY4f
	G6tC5PNfeqLXRRZBBLiuNElpuBg==
X-Google-Smtp-Source: AGHT+IEFby41Dzk8Di02mNOM5Cxy2EFRJLFUx7f25ID/UUfCbjR1gV58RWSxAT/uUFzd04BUgt4V0MNwsnwXgwYKw80=
X-Received: by 2002:a05:6512:3c92:b0:53e:39ed:85e6 with SMTP id
 2adb3069b0e04-5439c27fa73mr18344610e87.32.1738077938743; Tue, 28 Jan 2025
 07:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20250127222031.3078945-1-coltonlewis@google.com> <20250127222031.3078945-2-coltonlewis@google.com>
In-Reply-To: <20250127222031.3078945-2-coltonlewis@google.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Jan 2025 09:25:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLa9KmYjkVBpxwkQXfQyj53=dgj_9rijca5JGem46qZLg@mail.gmail.com>
X-Gm-Features: AWEUYZkt7YkAXKfFlHInNwyPOLFZ80Bbbmqn6_x8T3vnHAb5bp8zMcQevYuFBUs
Message-ID: <CAL_JsqLa9KmYjkVBpxwkQXfQyj53=dgj_9rijca5JGem46qZLg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] perf: arm_pmuv3: Introduce module param to
 partition the PMU
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_072541_981494_6D5C5DC0 
X-CRM114-Status: GOOD (  30.43  )
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

On Mon, Jan 27, 2025 at 4:26=E2=80=AFPM Colton Lewis <coltonlewis@google.co=
m> wrote:
>
> For PMUv3, the register MDCR_EL2.HPMN partitiones the PMU counters
> into two ranges where counters 0..HPMN-1 are accessible by EL1 and, if
> allowed, EL0 while counters HPMN..N are only accessible by EL2.
>
> Introduce a module parameter in the PMUv3 driver to set this
> register. The name reserved_guest_counters reflects the intent to
> reserve some counters for the guest so they may eventually be allowed
> direct access to a subset of PMU functionality for increased
> performance.
>
> Track HPMN and whether the pmu is partitioned in struct arm_pmu.
>
> While FEAT_HPMN0 does allow HPMN to be set to 0, this patch
> specifically disallows that case because it's not useful given the
> intention to allow guests access to their own counters.
>
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm/include/asm/arm_pmuv3.h   | 10 +++++++
>  arch/arm64/include/asm/arm_pmuv3.h | 10 +++++++
>  drivers/perf/arm_pmuv3.c           | 43 ++++++++++++++++++++++++++++--
>  include/linux/perf/arm_pmu.h       |  2 ++
>  include/linux/perf/arm_pmuv3.h     |  7 +++++
>  5 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_=
pmuv3.h
> index 2ec0e5e83fc9..49ad90486aa5 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -277,4 +277,14 @@ static inline u64 read_pmceid1(void)
>         return val;
>  }
>
> +static inline u32 read_mdcr(void)
> +{
> +       return read_sysreg(mdcr_el2);
> +}
> +
> +static inline void write_mdcr(u32 val)
> +{
> +       write_sysreg(val, mdcr_el2);
> +}
> +
>  #endif
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/=
arm_pmuv3.h
> index 8a777dec8d88..fc37e7e81e07 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -188,4 +188,14 @@ static inline bool is_pmuv3p9(int pmuver)
>         return pmuver >=3D ID_AA64DFR0_EL1_PMUVer_V3P9;
>  }
>
> +static inline u64 read_mdcr(void)
> +{
> +       return read_sysreg(mdcr_el2);
> +}
> +
> +static inline void write_mdcr(u64 val)
> +{
> +       write_sysreg(val, mdcr_el2);
> +}
> +
>  #endif
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index b5cc11abc962..55f9ae560715 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -325,6 +325,7 @@ GEN_PMU_FORMAT_ATTR(threshold_compare);
>  GEN_PMU_FORMAT_ATTR(threshold);
>
>  static int sysctl_perf_user_access __read_mostly;
> +static u8 reserved_guest_counters __read_mostly;
>
>  static bool armv8pmu_event_is_64bit(struct perf_event *event)
>  {
> @@ -500,6 +501,29 @@ static void armv8pmu_pmcr_write(u64 val)
>         write_pmcr(val);
>  }
>
> +static u64 armv8pmu_mdcr_read(void)
> +{
> +       return read_mdcr();
> +}
> +
> +static void armv8pmu_mdcr_write(u64 val)
> +{
> +       write_mdcr(val);
> +       isb();
> +}
> +
> +static void armv8pmu_partition(u8 hpmn)
> +{
> +       u64 mdcr =3D armv8pmu_mdcr_read();
> +
> +       mdcr &=3D ~MDCR_EL2_HPMN_MASK;
> +       mdcr |=3D FIELD_PREP(ARMV8_PMU_MDCR_HPMN, hpmn);
> +       /* Prevent guest counters counting at EL2 */
> +       mdcr |=3D ARMV8_PMU_MDCR_HPMD;
> +
> +       armv8pmu_mdcr_write(mdcr);
> +}
> +
>  static int armv8pmu_has_overflowed(u64 pmovsr)
>  {
>         return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
> @@ -1069,6 +1093,9 @@ static void armv8pmu_reset(void *info)
>
>         bitmap_to_arr64(&mask, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
>
> +       if (cpu_pmu->partitioned)
> +               armv8pmu_partition(cpu_pmu->hpmn);
> +
>         /* The counter and interrupt enable registers are unknown at rese=
t. */
>         armv8pmu_disable_counter(mask);
>         armv8pmu_disable_intens(mask);
> @@ -1205,6 +1232,7 @@ static void __armv8pmu_probe_pmu(void *info)
>  {
>         struct armv8pmu_probe_info *probe =3D info;
>         struct arm_pmu *cpu_pmu =3D probe->pmu;
> +       u8 pmcr_n;
>         u64 pmceid_raw[2];
>         u32 pmceid[2];
>         int pmuver;
> @@ -1215,10 +1243,19 @@ static void __armv8pmu_probe_pmu(void *info)
>
>         cpu_pmu->pmuver =3D pmuver;
>         probe->present =3D true;
> +       pmcr_n =3D FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read());
>
>         /* Read the nb of CNTx counters supported from PMNC */
> -       bitmap_set(cpu_pmu->cntr_mask,
> -                  0, FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read()));
> +       bitmap_set(cpu_pmu->cntr_mask, 0, pmcr_n);
> +
> +       if (reserved_guest_counters > 0 && reserved_guest_counters < pmcr=
_n) {
> +               cpu_pmu->hpmn =3D reserved_guest_counters;
> +               cpu_pmu->partitioned =3D true;

You're storing the same information 3 times. 'partitioned' is just
'reserved_guest_counters !=3D 0' or 'cpu_pmu->hpmn !=3D pmcr_n'.

> +       } else {
> +               reserved_guest_counters =3D 0;
> +               cpu_pmu->hpmn =3D pmcr_n;
> +               cpu_pmu->partitioned =3D false;
> +       }
>
>         /* Add the CPU cycles counter */
>         set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask);
> @@ -1516,3 +1553,5 @@ void arch_perf_update_userpage(struct perf_event *e=
vent,
>         userpg->cap_user_time_zero =3D 1;
>         userpg->cap_user_time_short =3D 1;
>  }
> +
> +module_param(reserved_guest_counters, byte, 0);

Module params are generally discouraged. Since this driver can't be a
module, this is a boot time only option. There's little reason this
can't be a sysfs setting. There's some complexity in changing this
when counters are in use (just reject the change) and when we have
asymmetric PMUs. Alternatively, it could be a sysctl like user access.

Rob

