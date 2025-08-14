Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1028CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 05:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pW2IKQF7j9mZWFismjJbM7MyE155/GaGBWF52ohr4tg=; b=zh42P/FvklfY0uDAg77bbJuepZ
	tzuwK+JImVWnuu/EEXozxSthWbb0T/kmTrXqS+xMphbyHN9SzLPtGmU+yNCt6sQg+u25eJPjTZPwn
	T0yA3i51zYCqubb125n0JYDTkr5VBwu/xH4VoPE2mx4HJiCRCb1dZaOxMQ4UYZMsaPv8jfqGaWCNJ
	gBdleWgCdw7HfzVrnJlMGzkiC9bCByplmhoSP3IdAd+9P5j1mP8dFg/ayKbNatzf7oE7DztY99ZhE
	zIdZKeaXs5xUdVn5ZakUrCPJN5RZAO8M4QVbiZc/1oG8pzTb0hOzXnW5CiXObbVEW/FIEl2Z0TmfL
	mknfEqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQAX-0000000Fnnx-3BCE;
	Thu, 14 Aug 2025 05:06:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQ7w-0000000FnT3-3OJs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 05:03:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b9df0bffc3so241843f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 22:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755147826; x=1755752626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pW2IKQF7j9mZWFismjJbM7MyE155/GaGBWF52ohr4tg=;
        b=atSHrrPpEhbZlGfqINeGl6S/Pqbgxpxc7Mv5GPo9B2BMOHtONDNMck7PDGqSJdtxor
         a+QxvkVNBVqUN2YTYGumiFey4Y8nDVNaomCbS8CVotFaQKxgfQbJYgze2F5diiaaEf8i
         TlHHNLP+uQtPHrf3Wqc11Um1b4lGOlJfNjWgxQlgnTacvb9p8GqKoh0wZ3fhmiDLKOhH
         v3NdPtqrn/u1hVzq/mpfV6V89Kh3Z/LBdqUKwC/iJmX+NqB/rZj4IfDDhJMtFnkM7CZ5
         HBg9Y2FTKnljsNGmutwxH5UGNWX/IAVrh5um7lTek2xwslVKAbOgPmqxyAclRNeQjVaS
         Ihmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755147826; x=1755752626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pW2IKQF7j9mZWFismjJbM7MyE155/GaGBWF52ohr4tg=;
        b=k5vtqbcyMzu69XqnRWv+EjzebxrThYtfJkP3yaZK/kq/lIamezvBmN7r1FZwOy7RBO
         4frrHchdADnLS+CeDYm5EvPJee4Of1GbPGyEvtmp//9xDbYffoFOZXQVScNdyYP1EMAW
         VXaI/M+VhNHqsZYGFGkb4Cjqd2vjlKF/ydEUBB8ZhpXqDUReb5g2Ms9dRPvF/2u6TntW
         qCbq85XeoGM5AFiTOYtN3YGooTuLOAV+MA0YfgHVRk2lqLE04PC1H0EbfXvlrEGlesSb
         5TV/ieuT71CctlCqOyqwPwdOo68z0bt7ehUnKX1HT2o2r+sTkrVS0ES5NTk9nFqaLis6
         eSpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrxYE6lFWXk95s8LZcm7zqgGHGgikYbAb6Im+23GpBNUZiyv7G/pVHAATyfBJuCJDj4ZdVmeIQavIjCeEZps/R@lists.infradead.org
X-Gm-Message-State: AOJu0YzZf04LUu2u7fyJuiak8O4QHq34EQXGtKgO7xpODWQ2euwE7/CV
	qyzKb2NUl7SPmADgP3hL7RqA3uO/mORV8Cg9hLy4jdJegscplS1BUhVlCxt2iGE1cuNYqN5rYeZ
	b42SxuiBMaHdqxJbP825xSPQt5j0BHwA=
X-Gm-Gg: ASbGncuHZmYeHvRMT3ZGUO8IW8m5LcSYxRo7q/IAe+AkT/TOHHRMqAU2JAZ1xsj942i
	kKBj7tHK3h9WAfAKw/C1kO2ykFwe2owcqBPOvSl21izquC3beP6JQ8hWqmKeJgBaL4znk+Pk4lo
	eGdJJQp27+PVKFQMDCUmSSe+Ik+YSUvrWWBXR7MGrPsz2URx+nmbj4qURmjIIeLMH9HWwP9c+U2
	W33Rwnx5Q==
X-Google-Smtp-Source: AGHT+IEqGsCznIdsWiUNkmTT/k6ovR9nMFnO5FAhQ2CUZuGmxYnJakxuzLCMBAdtiX4aOx5ItmFn7auMNRJz0+3OENI=
X-Received: by 2002:a05:6000:24ca:b0:3a6:d93e:5282 with SMTP id
 ffacd0b85a97d-3b9edf7fdcbmr1203348f8f.59.1755147826108; Wed, 13 Aug 2025
 22:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250813175335.3980268-1-yeoreum.yun@arm.com> <20250813175335.3980268-2-yeoreum.yun@arm.com>
In-Reply-To: <20250813175335.3980268-2-yeoreum.yun@arm.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 14 Aug 2025 07:03:35 +0200
X-Gm-Features: Ac12FXxBGO26NYRCWV_AgLObziM7IFpY6wdJZ5x9xu9uGkMLHTUun4-BDhxGOCU
Message-ID: <CA+fCnZd=EQ+5b=rBQ66LkJ3Bz2GrKHvnYk0DQLbs=o9=k0C69g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kasan/hw-tags: introduce kasan.store_only option
To: Yeoreum Yun <yeoreum.yun@arm.com>, glider@google.com, Marco Elver <elver@google.com>
Cc: ryabinin.a.a@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, scott@os.amperecomputing.com, jhubbard@nvidia.com, 
	pankaj.gupta@amd.com, leitao@debian.org, kaleshsingh@google.com, 
	maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev, 
	james.morse@arm.com, ardb@kernel.org, hardevsinh.palaniya@siliconsignals.io, 
	david@redhat.com, yang@os.amperecomputing.com, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_220348_856109_894E9C6A 
X-CRM114-Status: GOOD (  41.98  )
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

On Wed, Aug 13, 2025 at 7:53=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.com> w=
rote:
>
> Since Armv8.9, FEATURE_MTE_STORE_ONLY feature is introduced to restrict
> raise of tag check fault on store operation only.
> Introcude KASAN store only mode based on this feature.
>
> KASAN store only mode restricts KASAN checks operation for store only and
> omits the checks for fetch/read operation when accessing memory.
> So it might be used not only debugging enviroment but also normal
> enviroment to check memory safty.
>
> This features can be controlled with "kasan.store_only" arguments.
> When "kasan.store_only=3Don", KASAN checks store only mode otherwise
> KASAN checks all operations.

I'm thinking if we should name this "kasan.write_only" instead of
"kasan.store_only". This would align the terms with the
"kasan.fault=3Dpanic_on_write" parameter we already have. But then it
would be different from "FEATURE_MTE_STORE_ONLY", which is what Arm
documentation uses (right?).

Marco, Alexander, any opinion?

>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  Documentation/dev-tools/kasan.rst  |  3 ++
>  arch/arm64/include/asm/memory.h    |  1 +
>  arch/arm64/include/asm/mte-kasan.h |  6 +++
>  arch/arm64/kernel/cpufeature.c     |  6 +++
>  arch/arm64/kernel/mte.c            | 14 ++++++
>  include/linux/kasan.h              |  2 +
>  mm/kasan/hw_tags.c                 | 76 +++++++++++++++++++++++++++++-
>  mm/kasan/kasan.h                   | 10 ++++
>  8 files changed, 116 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/=
kasan.rst
> index 0a1418ab72fd..fcb70dd821ec 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -143,6 +143,9 @@ disabling KASAN altogether or controlling its feature=
s:
>    Asymmetric mode: a bad access is detected synchronously on reads and
>    asynchronously on writes.
>
> +- ``kasan.store_only=3Doff`` or ``kasan.store_only=3Don`` controls wheth=
er KASAN
> +  checks the store (write) accesses only or all accesses (default: ``off=
``)
> +
>  - ``kasan.vmalloc=3Doff`` or ``=3Don`` disables or enables tagging of vm=
alloc
>    allocations (default: ``on``).
>
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/mem=
ory.h
> index 5213248e081b..ae29cd3db78d 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -308,6 +308,7 @@ static inline const void *__tag_set(const void *addr,=
 u8 tag)
>  #define arch_enable_tag_checks_sync()          mte_enable_kernel_sync()
>  #define arch_enable_tag_checks_async()         mte_enable_kernel_async()
>  #define arch_enable_tag_checks_asymm()         mte_enable_kernel_asymm()
> +#define arch_enable_tag_checks_store_only()    mte_enable_kernel_store_o=
nly()
>  #define arch_suppress_tag_checks_start()       mte_enable_tco()
>  #define arch_suppress_tag_checks_stop()                mte_disable_tco()
>  #define arch_force_async_tag_fault()           mte_check_tfsr_exit()
> diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/=
mte-kasan.h
> index 2e98028c1965..3e1cc341d47a 100644
> --- a/arch/arm64/include/asm/mte-kasan.h
> +++ b/arch/arm64/include/asm/mte-kasan.h
> @@ -200,6 +200,7 @@ static inline void mte_set_mem_tag_range(void *addr, =
size_t size, u8 tag,
>  void mte_enable_kernel_sync(void);
>  void mte_enable_kernel_async(void);
>  void mte_enable_kernel_asymm(void);
> +int mte_enable_kernel_store_only(void);
>
>  #else /* CONFIG_ARM64_MTE */
>
> @@ -251,6 +252,11 @@ static inline void mte_enable_kernel_asymm(void)
>  {
>  }
>
> +static inline int mte_enable_kenrel_store_only(void)

Typo in the function name. Please build/boot test without MTE/KASAN enabled=
.

> +{
> +       return -EINVAL;
> +}
> +
>  #endif /* CONFIG_ARM64_MTE */
>
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeatur=
e.c
> index 9ad065f15f1d..7b724fcf20a7 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2404,6 +2404,11 @@ static void cpu_enable_mte(struct arm64_cpu_capabi=
lities const *cap)
>
>         kasan_init_hw_tags_cpu();
>  }
> +
> +static void cpu_enable_mte_store_only(struct arm64_cpu_capabilities cons=
t *cap)
> +{
> +       kasan_late_init_hw_tags_cpu();
> +}
>  #endif /* CONFIG_ARM64_MTE */
>
>  static void user_feature_fixup(void)
> @@ -2922,6 +2927,7 @@ static const struct arm64_cpu_capabilities arm64_fe=
atures[] =3D {
>                 .capability =3D ARM64_MTE_STORE_ONLY,
>                 .type =3D ARM64_CPUCAP_SYSTEM_FEATURE,
>                 .matches =3D has_cpuid_feature,
> +               .cpu_enable =3D cpu_enable_mte_store_only,
>                 ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, MTESTOREONLY, IMP)
>         },
>  #endif /* CONFIG_ARM64_MTE */
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index e5e773844889..8eb1f66f2ccd 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -157,6 +157,20 @@ void mte_enable_kernel_asymm(void)
>                 mte_enable_kernel_sync();
>         }
>  }
> +
> +int mte_enable_kernel_store_only(void)
> +{
> +       if (!cpus_have_cap(ARM64_MTE_STORE_ONLY))
> +               return -EINVAL;
> +
> +       sysreg_clear_set(sctlr_el1, SCTLR_EL1_TCSO_MASK,
> +                        SYS_FIELD_PREP(SCTLR_EL1, TCSO, 1));
> +       isb();
> +
> +       pr_info_once("MTE: enabled stonly mode at EL1\n");
> +
> +       return 0;
> +}
>  #endif
>
>  #ifdef CONFIG_KASAN_HW_TAGS
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 890011071f2b..28951b29c593 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -552,9 +552,11 @@ static inline void kasan_init_sw_tags(void) { }
>  #ifdef CONFIG_KASAN_HW_TAGS
>  void kasan_init_hw_tags_cpu(void);
>  void __init kasan_init_hw_tags(void);
> +void kasan_late_init_hw_tags_cpu(void);
>  #else
>  static inline void kasan_init_hw_tags_cpu(void) { }
>  static inline void kasan_init_hw_tags(void) { }
> +static inline void kasan_late_init_hw_tags_cpu(void) { }
>  #endif
>
>  #ifdef CONFIG_KASAN_VMALLOC
> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> index 9a6927394b54..c2f90c06076e 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -41,9 +41,16 @@ enum kasan_arg_vmalloc {
>         KASAN_ARG_VMALLOC_ON,
>  };
>
> +enum kasan_arg_store_only {
> +       KASAN_ARG_STORE_ONLY_DEFAULT,
> +       KASAN_ARG_STORE_ONLY_OFF,
> +       KASAN_ARG_STORE_ONLY_ON,
> +};
> +
>  static enum kasan_arg kasan_arg __ro_after_init;
>  static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
>  static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
> +static enum kasan_arg_store_only kasan_arg_store_only __ro_after_init;
>
>  /*
>   * Whether KASAN is enabled at all.
> @@ -67,6 +74,9 @@ DEFINE_STATIC_KEY_FALSE(kasan_flag_vmalloc);
>  #endif
>  EXPORT_SYMBOL_GPL(kasan_flag_vmalloc);
>
> +DEFINE_STATIC_KEY_FALSE(kasan_flag_store_only);

Is there a reason to have this as a static key? I think a normal
global bool would work, just as a normal variable works for
kasan_mode.

> +EXPORT_SYMBOL_GPL(kasan_flag_store_only);
> +
>  #define PAGE_ALLOC_SAMPLE_DEFAULT      1
>  #define PAGE_ALLOC_SAMPLE_ORDER_DEFAULT        3
>
> @@ -141,6 +151,23 @@ static int __init early_kasan_flag_vmalloc(char *arg=
)
>  }
>  early_param("kasan.vmalloc", early_kasan_flag_vmalloc);
>
> +/* kasan.store_only=3Doff/on */
> +static int __init early_kasan_flag_store_only(char *arg)
> +{
> +       if (!arg)
> +               return -EINVAL;
> +
> +       if (!strcmp(arg, "off"))
> +               kasan_arg_store_only =3D KASAN_ARG_STORE_ONLY_OFF;
> +       else if (!strcmp(arg, "on"))
> +               kasan_arg_store_only =3D KASAN_ARG_STORE_ONLY_ON;
> +       else
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +early_param("kasan.store_only", early_kasan_flag_store_only);
> +
>  static inline const char *kasan_mode_info(void)
>  {
>         if (kasan_mode =3D=3D KASAN_MODE_ASYNC)
> @@ -219,6 +246,20 @@ void kasan_init_hw_tags_cpu(void)
>         kasan_enable_hw_tags();
>  }
>
> +/*
> + * kasan_late_init_hw_tags_cpu_post() is called for each CPU after
> + * all cpus are bring-up at boot.

"CPUs"
"brought up"

And please spell-check other comments.

> + * Not marked as __init as a CPU can be hot-plugged after boot.
> + */
> +void kasan_late_init_hw_tags_cpu(void)
> +{
> +       /*
> +        * Enable stonly mode only when explicitly requested through the =
command line.

"store-only"

> +        * If system doesn't support, kasan checks all operation.

"If the system doesn't support this mode, KASAN will check both load
and store operations."

> +        */
> +       kasan_enable_store_only();
> +}
> +
>  /* kasan_init_hw_tags() is called once on boot CPU. */
>  void __init kasan_init_hw_tags(void)
>  {
> @@ -257,15 +298,28 @@ void __init kasan_init_hw_tags(void)
>                 break;
>         }
>
> +       switch (kasan_arg_store_only) {
> +       case KASAN_ARG_STORE_ONLY_DEFAULT:
> +               /* Default is specified by kasan_flag_store_only definiti=
on. */
> +               break;
> +       case KASAN_ARG_STORE_ONLY_OFF:
> +               static_branch_disable(&kasan_flag_store_only);
> +               break;
> +       case KASAN_ARG_STORE_ONLY_ON:
> +               static_branch_enable(&kasan_flag_store_only);
> +               break;
> +       }

Let's move this part to kasan_late_init_hw_tags_cpu. Since that's
where the final decision of whether the store-only mode is enabled is
taken, we should just set the global flag there.

> +
>         kasan_init_tags();
>
>         /* KASAN is now initialized, enable it. */
>         static_branch_enable(&kasan_flag_enabled);
>
> -       pr_info("KernelAddressSanitizer initialized (hw-tags, mode=3D%s, =
vmalloc=3D%s, stacktrace=3D%s)\n",
> +       pr_info("KernelAddressSanitizer initialized (hw-tags, mode=3D%s, =
vmalloc=3D%s, stacktrace=3D%s store_only=3D%s\n",

Let's put "store_only" here next to "mode".

You're also missing a comma.

>                 kasan_mode_info(),
>                 str_on_off(kasan_vmalloc_enabled()),
> -               str_on_off(kasan_stack_collection_enabled()));
> +               str_on_off(kasan_stack_collection_enabled()),
> +               str_on_off(kasan_store_only_enabled()));
>  }
>
>  #ifdef CONFIG_KASAN_VMALLOC
> @@ -394,6 +448,22 @@ void kasan_enable_hw_tags(void)
>                 hw_enable_tag_checks_sync();
>  }
>
> +void kasan_enable_store_only(void)

Do we need this as a separate function? I think we can just move the
code to kasan_late_init_hw_tags_cpu.

> +{
> +       if (kasan_arg_store_only =3D=3D KASAN_ARG_STORE_ONLY_ON) {
> +               if (hw_enable_tag_checks_store_only()) {
> +                       static_branch_disable(&kasan_flag_store_only);
> +                       kasan_arg_store_only =3D KASAN_ARG_STORE_ONLY_OFF=
;
> +                       pr_warn_once("KernelAddressSanitizer: store only =
mode isn't supported (hw-tags)\n");

No need for the "KernelAddressSanitizer" prefix, it's already defined
via pr_fmt().

> +               }
> +       }
> +}
> +
> +bool kasan_store_only_enabled(void)
> +{
> +       return static_branch_unlikely(&kasan_flag_store_only);
> +}
> +
>  #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
>
>  EXPORT_SYMBOL_IF_KUNIT(kasan_enable_hw_tags);
> @@ -404,4 +474,6 @@ VISIBLE_IF_KUNIT void kasan_force_async_fault(void)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(kasan_force_async_fault);
>
> +EXPORT_SYMBOL_IF_KUNIT(kasan_store_only_enabled);
> +
>  #endif
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 129178be5e64..1d853de1c499 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -33,6 +33,7 @@ static inline bool kasan_stack_collection_enabled(void)
>  #include "../slab.h"
>
>  DECLARE_STATIC_KEY_TRUE(kasan_flag_vmalloc);
> +DECLARE_STATIC_KEY_FALSE(kasan_flag_stonly);

kasan_flag_store_only

Did you build test this at all?


>
>  enum kasan_mode {
>         KASAN_MODE_SYNC,
> @@ -428,6 +429,7 @@ static inline const void *arch_kasan_set_tag(const vo=
id *addr, u8 tag)
>  #define hw_enable_tag_checks_sync()            arch_enable_tag_checks_sy=
nc()
>  #define hw_enable_tag_checks_async()           arch_enable_tag_checks_as=
ync()
>  #define hw_enable_tag_checks_asymm()           arch_enable_tag_checks_as=
ymm()
> +#define hw_enable_tag_checks_store_only()      arch_enable_tag_checks_st=
ore_only()
>  #define hw_suppress_tag_checks_start()         arch_suppress_tag_checks_=
start()
>  #define hw_suppress_tag_checks_stop()          arch_suppress_tag_checks_=
stop()
>  #define hw_force_async_tag_fault()             arch_force_async_tag_faul=
t()
> @@ -437,10 +439,18 @@ static inline const void *arch_kasan_set_tag(const =
void *addr, u8 tag)
>                         arch_set_mem_tag_range((addr), (size), (tag), (in=
it))
>
>  void kasan_enable_hw_tags(void);
> +void kasan_enable_store_only(void);
> +bool kasan_store_only_enabled(void);
>
>  #else /* CONFIG_KASAN_HW_TAGS */
>
>  static inline void kasan_enable_hw_tags(void) { }
> +static inline void kasan_enable_store_only(void) { }
> +
> +static inline bool kasan_store_only_enabled(void)
> +{
> +       return false;
> +}
>
>  #endif /* CONFIG_KASAN_HW_TAGS */
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>
> --
> You received this message because you are subscribed to the Google Groups=
 "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kasan-dev=
/20250813175335.3980268-2-yeoreum.yun%40arm.com.

