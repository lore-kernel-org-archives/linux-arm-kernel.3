Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847CDD609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kcNR5wGVuWjMKxImEHU+F1cjyHO5MBFCkdLHhMDLn4=; b=gNobVyKGm4kLCEVg6LnVoBhGMo
	mauTrN0O6/jfy8ppLaauIHKeWKy3iA6HkPcOoC1nmignyNiAxNL3VoGQdFBCi/DZjaRYWKnWQIhNQ
	4S59+IaMGuIiYF3TrkKgq8C0CL8wo4L3FVrTiAwOoqn5K4Ci4SR4LuKKc0vOcEJpaVSJjUhTNdGMM
	tRwH1+2vymadLrzehUrXA4EOY5toqtEaPmJwOjz6jMEU0wz02dIqkuzYFl68OrX405RLO9kM1eBJM
	+0NYtCnPv3F6f5TAlAsBpW3RcyRlhW/TU84SDRs0qrcZTdcViCF445aa2xUghuClkNpcLAx0zD2J7
	I003E1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZYk-00000005hlL-41Qv;
	Tue, 16 Dec 2025 18:14:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZYi-00000005hke-1YUN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 18:14:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a1462573caso9915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 10:14:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765908843; cv=none;
        d=google.com; s=arc-20240605;
        b=Mf9WteTtiQGrSXoavjbW4vePZg3f11fuhyGDxhqvWVtIA2F0b6V0aGiHTjJO+k7j9A
         +2KaVXVXC0zNezTdhrNxqv+iR85v2iOWuG6wfnwmxKp+/36Rji+oTzI+NIpKQfMrIz/f
         dxZJ7pP4zch4ROvyxLrAFrKgbR6FZnRcAqVzZQ76RCf1AeqAYXMMT1BeyXVnXUs6lOOW
         i8fCDXWWRl9gnzKTH57+ZqoU2fb35fKJ6WLJRaFFETXIEM1zM0CUuOryUNzX+8zaVeaX
         dBCJGWAlzf1N/TETvTEh+1vGdem59THtpIEMPjypfxsBmz8o1BmS5Z2sJctJp/CO8tPM
         qvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7kcNR5wGVuWjMKxImEHU+F1cjyHO5MBFCkdLHhMDLn4=;
        fh=zgL0OwilRF6Sbk4pjD7fE9shQ9Fv39oni6l7/pMKrRg=;
        b=NmlaPYxIecQl0puL4ztTZoxgZJoElzVUPzAhMFl5mfXrQmVqTl4spbFOJO01GICCZg
         Omyrr3/YnmqmIP9eFIryOxXjllRsKoJnUzy3pwAh9pefHyZhzvlx+bHQm6DRTcY7RtkI
         94+ehfLkSLcXeBIVsx4pJfGDHXTR4ANqzCoOQeh1dbZc4DDOmwr/RnUt5Q4mqxm+Xgkw
         djirtEDGNLjMm9wEVpuiH2uc/578tNxeE553MCDF3FMLl5JfvSo8pHAuDicFTQNb/a8q
         E4f5gQbFMAlaWu7y4PUIVUksa8WaJuyK9IZbkt8ABz19+zWiMkAxdNolGH7zqLkAocyM
         On6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765908843; x=1766513643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kcNR5wGVuWjMKxImEHU+F1cjyHO5MBFCkdLHhMDLn4=;
        b=SFu9PgEdd3ksCflsCvGFr+FHJmHPy7pNWdYsmQH2Jcj4yU2phr1W+jo0SiYf0BtYpV
         c44/ZiUHDTotBH9BBv2kEttZ3w5gfaEiO7yqtB3b5nY3zUaTKZb58E492A79SkC0OTAV
         kPBMZI2/GXxHob7c1zO3No6kVa8YJTlKLvi5OQlXUlOHpVu7No8G9+MgNJgmmil8sRqi
         PGDhpcZz/QPGhAocQds3zKBCDBKeCw6Zr0NE4vsO9980q7qrbx+YsGazjG66eNVx8J9u
         eqL0D3jo+8H22UU6oCuwuvO4U9RdrRSjf2MOBxQWyERq3962fzIgbulxZlKtDRe0YARI
         wbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765908843; x=1766513643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7kcNR5wGVuWjMKxImEHU+F1cjyHO5MBFCkdLHhMDLn4=;
        b=e86XQlq+C3FgpHmUfDlMZpocJUtFtZ+9BAx2Ad+JXKYcxeSx3Qo+yAPNRZE0y1Q4Ik
         XCTN34eDmz+peX9t7++5Rf27PjKn0T5whZqso8uJF2aIfWQYwV0yohfNwVGK/UYaAvpM
         6Km3Q6Auigk6dP4T4DJp05SvzrWQzR8PN7P1u7gd3YPmhDkwBJBjJrypw8QGDcArV8kK
         k4/rKmqQsz7e9q0owbseHlXJrxyAe2tSLeWPxut/PVxJFm/oK7wqLnOLUMHUJNFoHnEi
         Fe5mEdDqqoHR+Hys8iJYGNfZJvemUK5hR/VyTtRkUe9eqaIuM0id27Bges8JuqcWrgW1
         bqzA==
X-Gm-Message-State: AOJu0YycNFQnp8JgMxa96miqGDum2W5B80Cp2NkEcA91ujfCWwjzYQU5
	kwSvgwXL1CcYUAwxPTtB1+jfHv6dw2AfLHa1S9eaQJb7Z2MlmBLXNr3saTNHQ2BWn1MDP2lO3HC
	OX04vBmGmhDe//+SM+2KEuIh46MBTNgvsmKockHyr
X-Gm-Gg: AY/fxX44XXGyEdfMIDgmpapFOOXVgmAh+fxsdU/1CAgNvDi9+rvq9yMcuxSclVxlqyK
	Ls6m9tP/gw3sY6u3kS4nbxIXoEucyPv03yHw5Z+UbPFKumIP4d7Q+oh9xhVd4CxUqh188U6VD5h
	Js9dyPcqB2iRqilrpX0Lu8y4FZZ73AkGSyHLNGJFPdNwKGoFsmukNEDD6sQiTDhrcVaddQe3thv
	PmNDQpcB4zcM1TvOVR3dpbDghNLpEUUHBkgbq5+JvwiSWo+CI4EX5t5cPAgoc88D/gTvkjg8MgN
	a5ENKfikYK52gnt6Sh7qBuLSMGI=
X-Google-Smtp-Source: AGHT+IFz9B92VX6sukrtIuHVb4LXaSaNzYcGWIckRzJ4If3SF7zpKb71wIV5qANCvXImX5qSEM4EWY8vj4XrfneDhvg=
X-Received: by 2002:a05:7022:428c:b0:11b:3bc:9ea0 with SMTP id
 a92af1059eb24-1205bc4365fmr4270c88.6.1765908842012; Tue, 16 Dec 2025 10:14:02
 -0800 (PST)
MIME-Version: 1.0
References: <20251211040935.1288349-2-ardb@kernel.org>
In-Reply-To: <20251211040935.1288349-2-ardb@kernel.org>
From: Seth Jenkins <sethjenkins@google.com>
Date: Tue, 16 Dec 2025 13:13:49 -0500
X-Gm-Features: AQt7F2r5U7ak827_4IL8EJxAnkohuSSPkBPxwYIQcx8SMuJ5ELLNxUxgU5JVPFU
Message-ID: <CALxfFW4gyv3gSc1JhkPNqk4LL6S6gZbDRJx2y21PFZ8-8_9s_A@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: Bring back linear map randomization using
 PArange override
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
	mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org, 
	kees@kernel.org, Liz Prucka <lizprucka@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_101404_437576_EDF29D36 
X-CRM114-Status: GOOD (  36.44  )
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

> This is posted as an RFC because there are obvious shortcomings to this
> approach. However, before I spend more time on this, I'd like to gauge
> if there is any consensus that bringing this back is a good idea.
I may be a minority, but I do think bringing this back is a good idea.
It has now been 9+ years since hardware side channels for bypassing
KASLR were discovered, and it still appears that real-world attackers
overwhelmingly prefer alternative strategies - such as this one.

I'm under no illusion that if we just do this one thing KASLR will be
secure again, but I think this patch would still have a meaningful
real-world impact in terms of making exploits significantly harder to
write.


On Wed, Dec 10, 2025 at 11:10=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> Commit
>
>   1db780bafa4ce ("arm64/mm: Remove randomization of the linear map")
>
> removed linear map randomization from the arm64 port, on the basis that
> a prior change to the logic rendered it non-functional on the majority
> of relevant CPU implementations.
>
> As has been reported numerous times now, the upshot of this is that the
> virtual addresses of statically allocated kernel data structures are
> highly predictable if the kernel is loaded at a known physical address.
> Any bootloader that still adheres to the original arm64 boot protocol,
> which stipulated that the kernel should be loaded at the lowest
> available physical address, is affected by this.
>
> So bring back the most recent version of linear map randomization, which
> is based on the CPU's physical address range, but this time, allow this
> PA range to be overridden on the kernel command line.
>
> E.g., by passing
>
>   id_aa64mmfr0.parange=3D1 # 36 bits
>   id_aa64mmfr0.parange=3D2 # 40 bits
>
> the CPU's supported physical range can be reduced to the point where
> linear map randomization becomes feasible again. It also means that
> nothing else is permitted to appear in that physical window, i.e.,
> hotplug memory but also non-memory peripherals, or stage-2 mappings on
> behalf of KVM guests.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> Cc: Liz Prucka <lizprucka@google.com>
> Cc: Seth Jenkins <sethjenkins@google.com>
>
> This is posted as an RFC because there are obvious shortcomings to this
> approach. However, before I spend more time on this, I'd like to gauge
> if there is any consensus that bringing this back is a good idea.
>
>  arch/arm64/include/asm/cpufeature.h   | 13 +++++++++++++
>  arch/arm64/kernel/image-vars.h        |  1 +
>  arch/arm64/kernel/kaslr.c             |  2 ++
>  arch/arm64/kernel/pi/idreg-override.c |  1 +
>  arch/arm64/kernel/pi/kaslr_early.c    |  4 ++++
>  arch/arm64/mm/init.c                  | 16 ++++++++++++++++
>  6 files changed, 37 insertions(+)
>
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm=
/cpufeature.h
> index 4de51f8d92cb..fdb1331c406d 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -1078,6 +1078,19 @@ static inline bool cpu_has_lpa2(void)
>  #endif
>  }
>
> +static inline u64 cpu_get_phys_range(void)
> +{
> +       u64 mmfr0 =3D read_sysreg(id_aa64mmfr0_el1);
> +
> +       mmfr0 &=3D ~id_aa64mmfr0_override.mask;
> +       mmfr0 |=3D id_aa64mmfr0_override.val;
> +
> +       int parange =3D cpuid_feature_extract_unsigned_field(mmfr0,
> +                                               ID_AA64MMFR0_EL1_PARANGE_=
SHIFT);
> +
> +       return BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
> +}
> +
>  #endif /* __ASSEMBLER__ */
>
>  #endif
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-var=
s.h
> index 85bc629270bd..263543ad6155 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -58,6 +58,7 @@ PI_EXPORT_SYM(id_aa64zfr0_override);
>  PI_EXPORT_SYM(arm64_sw_feature_override);
>  PI_EXPORT_SYM(arm64_use_ng_mappings);
>  PI_EXPORT_SYM(_ctype);
> +PI_EXPORT_SYM(memstart_offset_seed);
>
>  PI_EXPORT_SYM(swapper_pg_dir);
>
> diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> index c9503ed45a6c..1da3e25f9d9e 100644
> --- a/arch/arm64/kernel/kaslr.c
> +++ b/arch/arm64/kernel/kaslr.c
> @@ -10,6 +10,8 @@
>  #include <asm/cpufeature.h>
>  #include <asm/memory.h>
>
> +u16 __initdata memstart_offset_seed;
> +
>  bool __ro_after_init __kaslr_is_enabled =3D false;
>
>  void __init kaslr_init(void)
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi=
/idreg-override.c
> index bc57b290e5e7..a8351ba70300 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -43,6 +43,7 @@ static const struct ftr_set_desc mmfr0 __prel64_initcon=
st =3D {
>         .override       =3D &id_aa64mmfr0_override,
>         .fields         =3D {
>                 FIELD("ecv", ID_AA64MMFR0_EL1_ECV_SHIFT, NULL),
> +               FIELD("parange", ID_AA64MMFR0_EL1_PARANGE_SHIFT, NULL),
>                 {}
>         },
>  };
> diff --git a/arch/arm64/kernel/pi/kaslr_early.c b/arch/arm64/kernel/pi/ka=
slr_early.c
> index e0e018046a46..0257b43819db 100644
> --- a/arch/arm64/kernel/pi/kaslr_early.c
> +++ b/arch/arm64/kernel/pi/kaslr_early.c
> @@ -18,6 +18,8 @@
>
>  #include "pi.h"
>
> +extern u16 memstart_offset_seed;
> +
>  static u64 __init get_kaslr_seed(void *fdt, int node)
>  {
>         static char const seed_str[] __initconst =3D "kaslr-seed";
> @@ -51,6 +53,8 @@ u64 __init kaslr_early_init(void *fdt, int chosen)
>                         return 0;
>         }
>
> +       memstart_offset_seed =3D seed & U16_MAX;
> +
>         /*
>          * OK, so we are proceeding with KASLR enabled. Calculate a suita=
ble
>          * kernel image offset from the seed. Let's place the kernel in t=
he
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 524d34a0e921..6c55eca6ccad 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -275,6 +275,22 @@ void __init arm64_memblock_init(void)
>                 }
>         }
>
> +       if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
> +               extern u16 memstart_offset_seed;
> +               s64 range =3D linear_region_size - cpu_get_phys_range();
> +
> +               /*
> +                * If the size of the linear region exceeds, by a suffici=
ent
> +                * margin, the size of the region that the physical memor=
y can
> +                * span, randomize the linear region as well.
> +                */
> +               if (memstart_offset_seed > 0 && range >=3D (s64)ARM64_MEM=
START_ALIGN) {
> +                       range /=3D ARM64_MEMSTART_ALIGN;
> +                       memstart_addr -=3D ARM64_MEMSTART_ALIGN *
> +                                        ((range * memstart_offset_seed) =
>> 16);
> +               }
> +       }
> +
>         /*
>          * Register the kernel text, kernel data, initrd, and initial
>          * pagetables with memblock.
> --
> 2.47.3
>

