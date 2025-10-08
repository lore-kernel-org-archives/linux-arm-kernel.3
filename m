Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CF5CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 21:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEmyrKTdVo56+b/Tyh73u1BP5jkBeN0eSir3I6ZA6yY=; b=CvZH7Cf2Hg2k3AQGGzi4jiHRQJ
	BiSTJKWjVa3dNotHKOhoHG7a9VDJG7FaeQNPD7Aaku/bpAF1RkP3fJmJKcv6xfP+4soKUK73u8Cv3
	ifFopYs/RofQMqENsLW2Kj7dS8DcfgQ7HX3bKGYHbpjBrOW/2G10EWQ3lCstnmlaGoTTqXw/8qPVf
	4Sf4/T9g/JKt0hRv/vS5O84aypNKNO+2KseqP0V96NP4gUBNynwWQjPnsCeo52gx88FWD/YBNCet5
	KC2q7y+w39OOgjwMpVYhQS9w/P0VOme/KjknYzJnNoLvHs6iHlppAOVi8v56GUNMBgT+nrQhqaXTd
	1+pftdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6bpo-00000004hzQ-1XKg;
	Wed, 08 Oct 2025 21:36:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6bpl-00000004hz5-3mb5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 21:36:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3fa528f127fso291775f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759959387; x=1760564187; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEmyrKTdVo56+b/Tyh73u1BP5jkBeN0eSir3I6ZA6yY=;
        b=Sz9TQ+1lCNI2PqGcTSQHwaybZddTI4C+6r6HZ6vUgWtcy/nuJFAHqTm2C+u0lEhnPv
         mEoC6uzDij3nlbh9nAoSXgrQgio/79zPcMxD5cOF22a2E+IYRm1MvIXFy8pBte4JX1Cm
         JHBg7yqjthvDQIr/ybN96hQ3mAOp14tAidq1bLLQgA8oygR81X9fCGuLrxVUKjjnAOCm
         JEl3fx5gy4XWUatqu+mYojvJMb87rbtTVdjvqXp2HroWVaJGqsUVxUsr8C5U0fTyIsCt
         DDp0yKlsrNUT0w376MJcVRT/H4JSm6SsCwA8GUJtF2myFmVMY6fqM/zBXz61rJPXmS9N
         jPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759959387; x=1760564187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEmyrKTdVo56+b/Tyh73u1BP5jkBeN0eSir3I6ZA6yY=;
        b=czL/yqgwBGRM86O4O7UN/pU7BjURAWnru67AHaCuFAkTSz+pHGlD+OdrWzrs0YfoDD
         06ah3ymMjerya4Oa1TjQozdiOY21GkSOXGTK3s7kitsZoDFgf4jLSI64Yak0AERrmjYB
         S56w26dHnweZvFGbDtCvFIj1RnbWaZL9VhMMY6449HvGMU+EW3rkatZYYwJQlqhWhALQ
         wbtRY++DkOLWHudScJ+carjvMwcx+HbQmolf7ZW/JdM3yCBZ4ecVeYu+sRFqmvdw7eK6
         /ZpqnXMVd2+rCqZiIlzhTy2G7RvFuTVN7eF1qz98Ry/ksuF/KiczppRr+b4HrH2U5JUP
         jbcw==
X-Forwarded-Encrypted: i=1; AJvYcCXpX74/oI5bqxWg0n2Nuc5UK1Xy+xWJfhGnf28fob+GcT/dI7fO/yPAlQ1RX5V45xzY7weQbOxR2SroaplM95JP@lists.infradead.org
X-Gm-Message-State: AOJu0YzUoKxgmtgf1vY+sR4yVFzSU6Nz91xmD1GxBto7xsjyW/l1VvD3
	WuEcTfEGFy83EbhOrmXaSU1CalfkLIFJqI59FCZZ8Y4IAq6sSiWFQH8ZiwG2pJo0OZhlb1fQBTQ
	iAOxalADR64q7A8erIiv9ExDJ+lpnp/U=
X-Gm-Gg: ASbGncvqpieY4UySaj23N/tmXKoEUpA21ZXq9XichY31EnT+RdoaW+kwulGd5gtnqwp
	lgDRhOZqEsPPrcJwoSB+Ihtgey1yU6Zj8yXRN1xyqWQh5dGauRKE/STta0QLRcwiYhW/hqtB/ch
	oCnaaXqdQgu5MdPwXxuXy9FScGaEM83NQfvTs4i6DTSr5/np21tITRxxCCwCAq+XkPm+pPSIZ5f
	jS+RG1MCQ4gq63vdf9RXBrAZ8GXbfWh
X-Google-Smtp-Source: AGHT+IHXDMXzRuIrjtVCYc8sacB+jXqu+5SuRp51RmL35yz4GrVsLEh/lQW5/Ztr3Zx0xXXl3nk8dBBNTp5RWCaCgp4=
X-Received: by 2002:a5d:64e8:0:b0:3e9:4fe4:2621 with SMTP id
 ffacd0b85a97d-42666aa6354mr3738354f8f.7.1759959387489; Wed, 08 Oct 2025
 14:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251008210425.125021-3-ysk@kzalloc.com>
In-Reply-To: <20251008210425.125021-3-ysk@kzalloc.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 8 Oct 2025 23:36:16 +0200
X-Gm-Features: AS18NWDr7cACmDmTAFMFA6336Xs4RqGaLFCrqQxRq3mWW-FZjr-4oeDaD1dmdEM
Message-ID: <CA+fCnZcknrhCOskgLLcTn_-o5jSiQsFni7ihMWuc1Qsd-Pu7gg@mail.gmail.com>
Subject: Re: [PATCH] arm64: cpufeature: Don't cpu_enable_mte() when
 KASAN_GENERIC is active
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Ard Biesheuvel <ardb@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_143630_014166_61CD9A75 
X-CRM114-Status: GOOD (  29.55  )
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

On Wed, Oct 8, 2025 at 11:13=E2=80=AFPM Yunseong Kim <ysk@kzalloc.com> wrot=
e:
>
> When a kernel built with CONFIG_KASAN_GENERIC=3Dy is booted on MTE-capabl=
e
> hardware, a kernel panic occurs early in the boot process. The crash
> happens when the CPU feature detection logic attempts to enable the Memor=
y
> Tagging Extension (MTE) via cpu_enable_mte().
>
> Because the kernel is instrumented by the software-only Generic KASAN,
> the code within cpu_enable_mte() itself is instrumented. This leads to
> a fatal memory access fault within KASAN's shadow memory region when
> the MTE initialization is attempted. Currently, the only workaround is
> to boot with the "arm64.nomte" kernel parameter.
>
> This bug was discovered during work on supporting the Debian debug kernel
> on the Arm v9.2 RADXA Orion O6 board:
>
>  https://salsa.debian.org/kernel-team/linux/-/merge_requests/1670
>
> Related kernel configs:
>
>  CONFIG_ARM64_AS_HAS_MTE=3Dy
>  CONFIG_ARM64_MTE=3Dy
>
>  CONFIG_KASAN_SHADOW_OFFSET=3D0xdfff800000000000
>  CONFIG_HAVE_ARCH_KASAN=3Dy
>  CONFIG_HAVE_ARCH_KASAN_SW_TAGS=3Dy
>  CONFIG_HAVE_ARCH_KASAN_HW_TAGS=3Dy
>  CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
>  CONFIG_CC_HAS_KASAN_GENERIC=3Dy
>  CONFIG_CC_HAS_KASAN_SW_TAGS=3Dy
>
>  CONFIG_KASAN=3Dy
>  CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=3Dy
>  CONFIG_KASAN_GENERIC=3Dy
>
> The panic log clearly shows the conflict:
>
> [    0.000000] kasan: KernelAddressSanitizer initialized (generic)
> [    0.000000] psci: probing for conduit method from ACPI.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.2
> [    0.000000] percpu: Embedded 486 pages/cpu s1950104 r8192 d32360 u1990=
656
> [    0.000000] pcpu-alloc: s1950104 r8192 d32360 u1990656 alloc=3D486*409=
6
> [    0.000000] pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] =
06 [0] 07
> [    0.000000] pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11
> [    0.000000] Detected PIPT I-cache on CPU0
> [    0.000000] CPU features: detected: Address authentication (architecte=
d QARMA3 algorithm)
> [    0.000000] CPU features: detected: GICv3 CPU interface
> [    0.000000] CPU features: detected: HCRX_EL2 register
> [    0.000000] CPU features: detected: Virtualization Host Extensions
> [    0.000000] CPU features: detected: Memory Tagging Extension
> [    0.000000] CPU features: detected: Asymmetric MTE Tag Check Fault
> [    0.000000] CPU features: detected: Spectre-v4
> [    0.000000] CPU features: detected: Spectre-BHB
> [    0.000000] CPU features: detected: SSBS not fully self-synchronizing
> [    0.000000] Unable to handle kernel paging request at virtual address =
dfff800000000005
> [    0.000000] KASAN: null-ptr-deref in range [0x0000000000000028-0x00000=
0000000002f]
> [    0.000000] Mem abort info:
> [    0.000000]   ESR =3D 0x0000000096000005
> [    0.000000]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    0.000000]   SET =3D 0, FnV =3D 0
> [    0.000000]   EA =3D 0, S1PTW =3D 0
> [    0.000000]   FSC =3D 0x05: level 1 translation fault
> [    0.000000] Data abort info:
> [    0.000000]   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
> [    0.000000]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [    0.000000]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [    0.000000] [dfff800000000005] address between user and kernel address=
 ranges
> [    0.000000] Internal error: Oops: 0000000096000005 [#1]  SMP
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.17+unrele=
ased-debug-arm64 #1 PREEMPTLAZY  Debian 6.17-1~exp1
> [    0.000000] pstate: 800000c9 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    0.000000] pc : cpu_enable_mte+0x104/0x440
> [    0.000000] lr : cpu_enable_mte+0xf4/0x440
> [    0.000000] sp : ffff800084f67d80
> [    0.000000] x29: ffff800084f67d80 x28: 0000000000000043 x27: 000000000=
0000001
> [    0.000000] x26: 0000000000000001 x25: ffff800084204008 x24: ffff80008=
4203da8
> [    0.000000] x23: ffff800084204000 x22: ffff800084203000 x21: ffff80008=
65a8000
> [    0.000000] x20: fffffffffffffffe x19: fffffdffddaa6a00 x18: 000000000=
0000011
> [    0.000000] x17: 0000000000000000 x16: 0000000000000000 x15: 000000000=
0000000
> [    0.000000] x14: 0000000000000000 x13: 0000000000000001 x12: ffff70001=
0a04829
> [    0.000000] x11: 1ffff00010a04828 x10: ffff700010a04828 x9 : dfff80000=
0000000
> [    0.000000] x8 : ffff800085024143 x7 : 0000000000000001 x6 : ffff70001=
0a04828
> [    0.000000] x5 : ffff800084f9d200 x4 : 0000000000000000 x3 : ffff80008=
00794ac
> [    0.000000] x2 : 0000000000000005 x1 : dfff800000000000 x0 : 000000000=
000002e
> [    0.000000] Call trace:
> [    0.000000]  cpu_enable_mte+0x104/0x440 (P)
> [    0.000000]  enable_cpu_capabilities+0x188/0x208
> [    0.000000]  setup_boot_cpu_features+0x44/0x60
> [    0.000000]  smp_prepare_boot_cpu+0x9c/0xb8
> [    0.000000]  start_kernel+0xc8/0x528
> [    0.000000]  __primary_switched+0x8c/0xa0
> [    0.000000] Code: 9100c280 d2d00001 f2fbffe1 d343fc02 (38e16841)
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle tas=
k!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the=
 idle task! ]---
>
> Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeatur=
e.c
> index 5ed401ff79e3..a0a9fa1b376d 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2340,6 +2340,24 @@ static void cpu_enable_mte(struct arm64_cpu_capabi=
lities const *cap)
>
>         kasan_init_hw_tags_cpu();
>  }
> +
> +static bool has_usable_mte(const struct arm64_cpu_capabilities *entry, i=
nt scope)
> +{
> +       if (!has_cpuid_feature(entry, scope))
> +               return false;
> +
> +       /*
> +        * MTE and Generic KASAN are mutually exclusive. Generic KASAN is=
 a
> +        * software-only mode that is incompatible with the MTE hardware.
> +        * Do not enable MTE if Generic KASAN is active.

I do not understand this. Why is Generic KASAN incompatible with MTE?
Running Generic KASAN in the kernel while having MTE enabled (and e.g.
used in userspace) seems like a valid combination.

The crash log above looks like a NULL-ptr-deref. On which line of code
does it happen?


> +        */
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC) && kasan_enabled()) {
> +               pr_warn_once("MTE capability disabled due to Generic KASA=
N conflict\n");
> +               return false;
> +       }
> +
> +       return true;
> +}
>  #endif /* CONFIG_ARM64_MTE */
>
>  static void user_feature_fixup(void)
> @@ -2850,7 +2868,7 @@ static const struct arm64_cpu_capabilities arm64_fe=
atures[] =3D {
>                 .desc =3D "Memory Tagging Extension",
>                 .capability =3D ARM64_MTE,
>                 .type =3D ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
> -               .matches =3D has_cpuid_feature,
> +               .matches =3D has_usable_mte,
>                 .cpu_enable =3D cpu_enable_mte,
>                 ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, MTE, MTE2)
>         },
> @@ -2858,21 +2876,21 @@ static const struct arm64_cpu_capabilities arm64_=
features[] =3D {
>                 .desc =3D "Asymmetric MTE Tag Check Fault",
>                 .capability =3D ARM64_MTE_ASYMM,
>                 .type =3D ARM64_CPUCAP_BOOT_CPU_FEATURE,
> -               .matches =3D has_cpuid_feature,
> +               .matches =3D has_usable_mte,
>                 ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, MTE, MTE3)
>         },
>         {
>                 .desc =3D "FAR on MTE Tag Check Fault",
>                 .capability =3D ARM64_MTE_FAR,
>                 .type =3D ARM64_CPUCAP_SYSTEM_FEATURE,
> -               .matches =3D has_cpuid_feature,
> +               .matches =3D has_usable_mte,
>                 ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, MTEFAR, IMP)
>         },
>         {
>                 .desc =3D "Store Only MTE Tag Check",
>                 .capability =3D ARM64_MTE_STORE_ONLY,
>                 .type =3D ARM64_CPUCAP_BOOT_CPU_FEATURE,
> -               .matches =3D has_cpuid_feature,
> +               .matches =3D has_usable_mte,
>                 ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, MTESTOREONLY, IMP)
>         },
>  #endif /* CONFIG_ARM64_MTE */
> --
> 2.51.0
>

