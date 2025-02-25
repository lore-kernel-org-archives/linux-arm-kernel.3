Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17172C19777
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U53klamnmt9FmtniEybcv7fEcN/AwSDLKnQ6pj0K+y8=; b=b+Fwgg3TByU01KrUEAH+VbAdtw
	iIWt+k77cex71xAGh3EgdwCQTUevg9jAt8/4UTO50dZuQYdLMgjeKeixTX2ERF3Fg0vSLxbeLr4yJ
	TPNl4ETtPmdpYUkPO/qaBizS/2XX802yWTlDaDqm3OD8vNmRlT3QSZVQpS+YMI2KWTIXZ9bZXmTaL
	2X2iIjOFoPeYHYpfAg/vfSnbnnLPD6q0snFMPq6j0Q/5gfusZ4ju1W5jTLC82HmQ+qf3Wck3qyKKz
	PB/VSxyam12KVpdTO0guwKkXIMqgT75U7DeXu6gVrIzIA6jDwhpuHMFp+3eXBlADhlPj1LqTOPR5y
	/hl/3X7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eX-000000019BW-1iy6;
	Tue, 25 Feb 2025 19:31:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzJV-00000000p5g-3NMN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47F556129B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 18:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F0BC4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740506748;
	bh=BRAREsQXttfbBaJFNuuJoLHpW/7Cxotknsm4alcWLf8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bcfg/emXAAOowC9dB0ZdhMCIauBHKkqUUQu/7a62f5kWvR1rOqiAgFNjI12HIFZvu
	 7Ld8HnJ9mHYVhh/eODAUjJkuSiHPBZgLfzpiD7JHydGii/DdMti7BjAqZSgNRB/gn1
	 1m8Cs84udkMI4pMEGiL33GnowC07sq+ztAeWveMCT0JamPTKEyrn3B4GURzPU8o1lW
	 QXqIKV4rRX8AlBh8fgJu/96zQDqxdYiLyllRGPSwXcz9GfQsiy/hD0YiAIm7TLlmwR
	 uqgFe+wqlrdS/NZw1aBTDu77TsFgoH3xhXL/Zww53JZbpYisKtX7Ca68Ey1J0a0pFj
	 yFtIp5iKXyBRw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so46123241fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 10:05:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVpjxqxfaNutNj36iHBQJstIuyxhmlNPGW/sDG05GhJq3NN9mKi8XGutkd+Js6UC7JfYvinH+X+7OhjqfSlVV8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh4Fll+9fEgHz0lzIw6KJj9OC4fardf5Of9G3HEyiSPw4iUkha
	bf0gprZm7y61EQ9laSCeRgkeCA1Qp1VZ1qCg3qWr+jCLhUBqny2xsB4R1492Rgg8ee+RxHoeqab
	AMw6+4+Rf71wz+nstj9hJCKnUrAk=
X-Google-Smtp-Source: AGHT+IG/KcteHG+7CrMPvm+W3JNssD87+CU129hdHkUloxYU+76h0fMOYVd6Z9x/EzKMffybLgg3O8vDCe+HCJs+JnE=
X-Received: by 2002:a05:6512:2256:b0:545:280e:4b7f with SMTP id
 2adb3069b0e04-54839145111mr8485935e87.27.1740506747092; Tue, 25 Feb 2025
 10:05:47 -0800 (PST)
MIME-Version: 1.0
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
In-Reply-To: <20250225114638.2038006-1-ryan.roberts@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 25 Feb 2025 19:05:35 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com>
X-Gm-Features: AWEUYZm9KwJjXrKlLld_fAKtjjBFnw9EUOBb72VNhsnHv5iLxQagVJUeFUPPgtE
Message-ID: <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Luiz Capitulino <luizcap@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 25 Feb 2025 at 12:46, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> When the range of present physical memory is sufficiently small enough
> and the reserved address space for the linear map is sufficiently large
> enough, The linear map base address is randomized in
> arm64_memblock_init().
>
> Prior to commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and
> use it consistently"), we decided if the sizes were suitable with the
> help of the raw mmfr0.parange. But the commit changed this to use the
> sanitized version instead. But the function runs before the register has
> been sanitized so this returns 0, interpreted as a parange of 32 bits.
> Some fun wrapping occurs and the logic concludes that there is enough
> room to randomize the linear map base address, when really there isn't.
> So the top of the linear map ends up outside the reserved address space.
>
> Fix this by intoducing a helper, cpu_get_parange() which reads the raw
> parange value and overrides it with any early override (e.g. due to
> arm64.nolva).
>
> Reported-by: Luiz Capitulino <luizcap@redhat.com>
> Closes: https://lore.kernel.org/all/a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com/
> Fixes: 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and use it consistently")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>
> This applies on top of v6.14-rc4. I'm hoping this can be merged for v6.14 since
> it's fixing a regression introduced in v6.14-rc1.
>
> Luiz, are you able to test this to make sure it's definitely fixing your
> original issue. The symptom I was seeing was slightly different.
>
> I'm going to see if it's possible for read_sanitised_ftr_reg() to warn about use
> before initialization. I'll send a follow up patch for that.
>

Apologies for the breakage, and thanks for the fix.

I have to admit that I was a bit overzealous here: there is no point
yet in using the sanitised value, given that we don't actually
override the PA range in the first place. This is something I've
prototyped for Android use, so that linear map randomization can be
force enabled on CPUs with a wide PArange, but right now, mainline
does not have that capability, and so I'd be inclined to just revert
the hunk that introduces the call to read_sanitised_ftr_reg() into
arm64_memblock_init(), especially given the fact that commit
62cffa496aac was tagged for stable, and was already pulled into 6.13
and 6.12

In any case, it would be good if we could get a fix into Linus's tree asap


>
>  arch/arm64/include/asm/cpufeature.h | 9 +++++++++
>  arch/arm64/mm/init.c                | 8 +-------
>  2 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index e0e4478f5fb5..2335f44b9a4d 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -1066,6 +1066,15 @@ static inline bool cpu_has_lpa2(void)
>  #endif
>  }
>
> +static inline u64 cpu_get_parange(void)
> +{
> +       u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
> +
> +       return arm64_apply_feature_override(mmfr0,
> +                                           ID_AA64MMFR0_EL1_PARANGE_SHIFT, 4,
> +                                           &id_aa64mmfr0_override);
> +}
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 9c0b8d9558fc..1b1a61191b9f 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -280,13 +280,7 @@ void __init arm64_memblock_init(void)
>         if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
>                 extern u16 memstart_offset_seed;
>
> -               /*
> -                * Use the sanitised version of id_aa64mmfr0_el1 so that linear
> -                * map randomization can be enabled by shrinking the IPA space.
> -                */
> -               u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
> -               int parange = cpuid_feature_extract_unsigned_field(
> -                                       mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
> +               int parange = cpu_get_parange();
>                 s64 range = linear_region_size -
>                             BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
>
> --
> 2.43.0
>

