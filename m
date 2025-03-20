Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F7BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5h6i5QlegtnsZKZNuCkYxic6SGx0oA7WXCgJZ9g/qk=; b=Ja+VK8NyD0QHp9q2FnPbyWHf/b
	pPmu/uVJ2Smv0fWZJAEgy0GZpEH8CdT22PDWlfHbHelfw1EKAO1PbSjgcHxN6k+lWqxml8ID9oWtn
	+GEJtDbq2UMG4jRi1yFmC1Pac1DACB+IhryqJZSlmd1AgXK95lkx8sT8BTZiFQjUBFW3YHRD9nrR0
	DXuSQJPdGz2NMDce9QfeOjd6cWjfflly00/40rKnxnkSXHXr8euxFnI0eB6vR+byRTxishpOuTl6p
	8MMfdJSjSRnBKG92viRiG7XSQD/ilvSLPIEGfrp6fHtwKsaICOnf1HhbarFs7dZf8ZC0GTHcAUyAk
	Pq/apUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvG73-0000000CGa3-2cEB;
	Thu, 20 Mar 2025 13:39:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvG5L-0000000CG8h-20RG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 13:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC9405C5401
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 13:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBE5C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742477842;
	bh=YR+i89cgDJ+s150iYLatiV4MlhOTZxfjkvujDA29uFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fwoqQ5HLZ1VTIv4pp9u1zn9oOLN3dSG3sx/P/sy41uT7XN3wzeFcPZHv3Aw8TZlGH
	 TgZZBQcKI58BpuyLRalpbDpYyzzo12B46vYImUa+oMchrjfRbAyK6QYG4GBxe68MaA
	 pdwr5VIehWFuGN0jbOvkV9fcBOom77L0n3wIppOdXETVRAjyKuyC8qDbTSUekmqXbG
	 ZXr2sjsoppIhKA2egUYpbGDgz+IAJzkENMUQV0ZVgC/4CXDNyhLDrCBPaTyCrk63jv
	 q8V42/2euTC/kBXP4w/rnvPdP8A5kiA6+UjyRa2Gsu+Slt00EMAdkB37inBkHtPpn9
	 uNxiHg6y/TSwA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549963b5551so903098e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 06:37:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfEa4KMDTrvIEPdypNfFyFf7pSGtr3Zu/rsy6psLuryflza3AoxCT2RFmUSEnXiE6AzY2cDn0WHxA5Jrlo6yba@lists.infradead.org
X-Gm-Message-State: AOJu0YzmTqXG8uY275Is83xG3wfwkHc+XAZ2Lg6vuIpFhOSPGULWFePR
	qzfJHKgy5cOmhmOiX1pAYYXjCmtim9+1Ai2jOIJPsUu5kigXwWoqE4aJSvhVnrtRNrceeW+VCxy
	o+MldDCSkGvi0XseepL1tkF1jx0c=
X-Google-Smtp-Source: AGHT+IH1uSkf2uM+LcoD4uBRdGz5SL3adFWbT+OYTJyNNWdRyQZyb0lE1rVKbKGGzWThpM6glOaALBN3j3flNNCBE0Y=
X-Received: by 2002:a05:6512:e86:b0:549:86c8:113a with SMTP id
 2adb3069b0e04-54acb1b6b01mr3023005e87.15.1742477840456; Thu, 20 Mar 2025
 06:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250319150533.37440-2-miko.lenczewski@arm.com> <20250319150533.37440-3-miko.lenczewski@arm.com>
In-Reply-To: <20250319150533.37440-3-miko.lenczewski@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 20 Mar 2025 14:37:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFOofRCiVHxxxBZMGQHRH-ghtqNxgd=uww9D4sr4vvjEQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoXEf-176DDZRbp16VKBYBsy3AsXn6mHxJRtBdSe3bLtcfpofqtWsvZ_8c
Message-ID: <CAMj1kXFOofRCiVHxxxBZMGQHRH-ghtqNxgd=uww9D4sr4vvjEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm64: Add BBM Level 2 cpu feature
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, suzuki.poulose@arm.com, yang@os.amperecomputing.com, 
	corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org, 
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org, 
	akpm@linux-foundation.org, mark.rutland@arm.com, joey.gouly@arm.com, 
	maz@kernel.org, james.morse@arm.com, broonie@kernel.org, 
	oliver.upton@linux.dev, baohua@kernel.org, david@redhat.com, 
	ioworker0@gmail.com, jgg@ziepe.ca, nicolinc@nvidia.com, mshavit@google.com, 
	jsnitsel@redhat.com, smostafa@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_063723_608008_4F7FE42D 
X-CRM114-Status: GOOD (  30.94  )
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

On Wed, 19 Mar 2025 at 16:06, Miko=C5=82aj Lenczewski
<miko.lenczewski@arm.com> wrote:
>
> The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
> and this commit adds a dedicated BBML2 cpufeature to test against
> support for, as well as a kernel commandline parameter to optionally
> disable BBML2 altogether.
>
> This is a system feature as we might have a big.LITTLE architecture
> where some cores support BBML2 and some don't, but we want all cores to
> be available and BBM to default to level 0 (as opposed to having cores
> without BBML2 not coming online).
>
> To support BBML2 in as wide a range of contexts as we can, we want not
> only the architectural guarantees that BBML2 makes, but additionally
> want BBML2 to not create TLB conflict aborts. Not causing aborts avoids
> us having to prove that no recursive faults can be induced in any path
> that uses BBML2, allowing its use for arbitrary kernel mappings.
> Support detection of such CPUs.
>
> Signed-off-by: Miko=C5=82aj Lenczewski <miko.lenczewski@arm.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  3 +
>  arch/arm64/Kconfig                            | 11 +++
>  arch/arm64/include/asm/cpucaps.h              |  2 +
>  arch/arm64/include/asm/cpufeature.h           |  5 ++
>  arch/arm64/kernel/cpufeature.c                | 68 +++++++++++++++++++
>  arch/arm64/kernel/pi/idreg-override.c         |  2 +
>  arch/arm64/tools/cpucaps                      |  1 +
>  7 files changed, 92 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index fb8752b42ec8..3e4cc917a07e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -453,6 +453,9 @@
>         arm64.no32bit_el0 [ARM64] Unconditionally disable the execution o=
f
>                         32 bit applications.
>
> +       arm64.nobbml2   [ARM64] Unconditionally disable Break-Before-Make=
 Level
> +                       2 support
> +
>         arm64.nobti     [ARM64] Unconditionally disable Branch Target
>                         Identification support
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 940343beb3d4..49deda2b22ae 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2057,6 +2057,17 @@ config ARM64_TLB_RANGE
>           The feature introduces new assembly instructions, and they were
>           support when binutils >=3D 2.30.
>
> +config ARM64_BBML2_NOABORT
> +       bool "Enable support for Break-Before-Make Level 2 detection and =
usage"
> +       default y
> +       help
> +         FEAT_BBM provides detection of support levels for break-before-=
make
> +         sequences. If BBM level 2 is supported, some TLB maintenance re=
quirements
> +         can be relaxed to improve performance. We additonally require t=
he
> +         property that the implementation cannot ever raise TLB Conflict=
 Aborts.
> +         Selecting N causes the kernel to fallback to BBM level 0 behavi=
our
> +         even if the system supports BBM level 2.
> +
>  endmenu # "ARMv8.4 architectural features"
>
>  menu "ARMv8.5 architectural features"
> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cp=
ucaps.h
> index 0b5ca6e0eb09..2d6db33d4e45 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -23,6 +23,8 @@ cpucap_is_possible(const unsigned int cap)
>                 return IS_ENABLED(CONFIG_ARM64_PAN);
>         case ARM64_HAS_EPAN:
>                 return IS_ENABLED(CONFIG_ARM64_EPAN);
> +       case ARM64_HAS_BBML2_NOABORT:
> +               return IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT);
>         case ARM64_SVE:
>                 return IS_ENABLED(CONFIG_ARM64_SVE);
>         case ARM64_SME:
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm=
/cpufeature.h
> index e0e4478f5fb5..108ef3fbbc00 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -866,6 +866,11 @@ static __always_inline bool system_supports_mpam_hcr=
(void)
>         return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
>  }
>
> +static inline bool system_supports_bbml2_noabort(void)
> +{
> +       return alternative_has_cap_unlikely(ARM64_HAS_BBML2_NOABORT);
> +}
> +
>  int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>  bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeatur=
e.c
> index d561cf3b8ac7..1a4adcda267b 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2176,6 +2176,67 @@ static bool hvhe_possible(const struct arm64_cpu_c=
apabilities *entry,
>         return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_H=
VHE);
>  }
>
> +static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
> +{

We generally start these block comments with just /* on the first line

> +       /* We want to allow usage of bbml2 in as wide a range of kernel c=
ontexts
> +        * as possible. This list is therefore an allow-list of known-goo=
d
> +        * implementations that both support bbml2 and additionally, fulf=
ill the
> +        * extra constraint of never generating TLB conflict aborts when =
using
> +        * the relaxed bbml2 semantics (such aborts make use of bbml2 in =
certain
> +        * kernel contexts difficult to prove safe against recursive abor=
ts).
> +        *
> +        * Note that implementations can only be considered "known-good" =
if their
> +        * implementors attest to the fact that the implementation never =
raises
> +        * TLBI conflict aborts for bbml2 mapping granularity changes.
> +        */
> +       static const struct midr_range supports_bbml2_noabort_list[] =3D =
{
> +               MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
> +               MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
> +               {}
> +       };
> +

Why on earth is this needed? Is there nothing in the architecture that
can inform us about this? That seems like a huge oversight to me ...

