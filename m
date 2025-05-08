Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B8C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 11:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw/r3S/tQHl8OprxQoQ+hobIMGW7AGYYimbxjl6nQVQ=; b=tgKgeZD6YFfbLl5ZVgfe/Nb7TD
	0sphOEXioOg3qWmBIdc29XD7kB/HZd/Ae0hVGQ9M+iTFMESiVAg5jTAYD1lVc/CKajDw62dwtbjMR
	TS5fGQowDHJ7bAR9f8fIN4N7FIQ2rZvcPiYeqA6XdmsLV1IPzeO+XJhjnHv0zB0+PSm61qRYbempe
	jLo/aT0gD8Wg16ONVMNJWGrQeWsgkp6chIcT+KZlxC5pX6njJkEIb4FmAe8HQ/EkupbEiLwTLY4gc
	LU76gxfmJm3ROK0kob0bLcAOy99qIh74Ym2z3ljmQ/UgI4yh0zwfTl0Y9IEN8EcBlusfOH7bKrI2M
	0BgbJcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzD8-00000000Srt-1ItU;
	Thu, 08 May 2025 11:14:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzBB-00000000SiK-3yjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 11:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E41F629EA
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 May 2025 11:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AE6C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 May 2025 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746702761;
	bh=dQv4VZZjttjwpAYaN2Cr2j22vzgaZy27VORq9EYvLaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CV9TL5+tLhI/kBY4HRz4UYQxpsR4bXCnb0ZNiqtYiav5pvzlUEPLA2BVeRgjBMo8s
	 xxrojTH2jQnX3lpoRzhgPZOpbJcidKfLxwQDnXykQveiu5u0bUSLxMkdZVMK9q5Dop
	 EisJ+TOF7S8iozeZyWghtaANIs0kEG4gaVw82NYNWnEZdIvA6CYxDp14Aqq/Z5jvDT
	 KksbmddqX1K53NnoWLo/FCU6/cUYfWdVJnHnVUVHXSfR9cgnNNzCCFahw7t199HXzB
	 T68teNWa7Ypop+lyoIcvTujV1SNglzFyG/O4Muw2/+8Cth2uCBPvvVoGnlftg2BVKY
	 ruFRP/ep+qjsQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so6363271fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 04:12:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYaG/5PxFonWr0ofo/mLwTimP3975aY/PbbXxI7+PSYUVJF3Jq2BYYbuNT3fp49bowIYoD7/RfNMQEbphEXCWw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8PxGilKnJjUH7K3I07T2fKG7AbPyE2TInLuHmAO2Ca6Q0rQ1x
	9QdFNu69W8PpGv3kmneLgIUROA+gdyMqHjQG6KGWCuRH2uKY07IVfOVKMtLduXuczBYq//nB5BG
	WjoVRw0YO1Y9FwrZMjwY8q7i7t/E=
X-Google-Smtp-Source: AGHT+IFGPDtvLpdITsEEqjXGSwOWV9roUGQMbaVqW0JaYrTV9EEgDYm6kB01vuz+QWi2eIIHHp2FwS1dEfhjWc9mkg8=
X-Received: by 2002:a05:651c:512:b0:30c:2ff9:913f with SMTP id
 38308e7fff4ca-326b87a07b1mr10358451fa.2.1746702759412; Thu, 08 May 2025
 04:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250507170901.151548-1-ebiggers@kernel.org>
In-Reply-To: <20250507170901.151548-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 May 2025 13:12:28 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEPvPKg3i9NkaYN+m4pGfw6P05g-H6_Dmb3AsQyRmU7MA@mail.gmail.com>
X-Gm-Features: ATxdqUFYGxXGhZglYKPIAlc9mrcFsSZRZtD9O4OPJJK-YwuYX3afTt3dDfEH5W4
Message-ID: <CAMj1kXEPvPKg3i9NkaYN+m4pGfw6P05g-H6_Dmb3AsQyRmU7MA@mail.gmail.com>
Subject: Re: [PATCH] crypto: arm64/sha256 - fix build when CONFIG_PREEMPT_VOLUNTARY=y
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Thorsten Leemhuis <linux@leemhuis.info>, kernel test robot <lkp@intel.com>
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

On Wed, 7 May 2025 at 19:09, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Fix the build of sha256-ce.S when CONFIG_PREEMPT_VOLUNTARY=y by passing
> the correct label to the cond_yield macro.  Also adjust the code to
> execute only one branch instruction when CONFIG_PREEMPT_VOLUNTARY=n.
>
> Fixes: 6e36be511d28 ("crypto: arm64/sha256 - implement library instead of shash")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505071811.yYpLUbav-lkp@intel.com/
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/lib/crypto/sha256-ce.S | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/lib/crypto/sha256-ce.S b/arch/arm64/lib/crypto/sha256-ce.S
> index a8461d6dad634..f3e21c6d87d2e 100644
> --- a/arch/arm64/lib/crypto/sha256-ce.S
> +++ b/arch/arm64/lib/crypto/sha256-ce.S
> @@ -121,14 +121,15 @@ CPU_LE(   rev32           v19.16b, v19.16b        )
>
>         /* update state */
>         add             dgav.4s, dgav.4s, dg0v.4s
>         add             dgbv.4s, dgbv.4s, dg1v.4s
>
> +       /* return early if voluntary preemption is needed */
> +       cond_yield      1f, x5, x6
> +

This will yield needlessly when the condition hits during the final iteration.

>         /* handled all input blocks? */
> -       cbz             x2, 1f
> -       cond_yield      3f, x5, x6
> -       b               0b
> +       cbnz            x2, 0b
>
>         /* store new state */
>  1:     st1             {dgav.4s, dgbv.4s}, [x0]
>         mov             x0, x2
>         ret
>
> base-commit: 20e9579f11b6cbdf0556d9cd85a0aa7653caf341
> --
> 2.49.0
>

