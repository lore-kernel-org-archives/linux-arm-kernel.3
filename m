Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43683FEA808
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnbQXF6DaQ8H6OaOkbjOR+F6C4UMnmifQBy/ewm+atQ=; b=2WjsgeMeGqz5F0tcRNL0EaenzM
	3VwBxfNY+M+dkRyRLRH+obTsjYnVghORof/5BT2+727A87SHbcf8F0pb7SYqOHvFo7GSDyBEH6Fem
	RMaqHo9V+fSmIApRmR3pEM5K3xllJmQouvuMmsATndKtXR0aWgispTqy/RQjvjdZHjGGPj0vwjElT
	5p6bcyhW8+q2pzAfXfqDEdXx49W5oQZfE6HlKXfhbZyzAiH88X+aK5CQy4Bb/JDy3csPLThQjCwIi
	FNXgh+Tpcz8mOLwh+0IBRWnI5WG7bK7fvH3KntbEsDC6GoaII0GU/LniAOZWgXATQyYMgaA9aA01g
	z2eoirjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LWw-000000039kw-3pMY;
	Wed, 25 Mar 2026 10:32:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LWv-000000039k8-1iL9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BCE460123
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 10:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45846C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434724;
	bh=ocM1mdWqdcmXzLcIYmHxofHeePVA9vqDrQenuhbw7uQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=rQsLCgURkLIEosDEkWhGLHl2g1Ra6qaeLKzy2cRqqnyXRcXcVKKwx3toJni6EMrux
	 2yTlCjJ/KdtIfr9nJlV3R9Uyw8RZjwSCEWZZ46F6kW+ognCmhXZTt+4caRkrSnV4pJ
	 g4EKHg7lADOkIJM8Zy429vK7uL9pAvIYddbYoRTRMs0BHYvdVDX9uYgNCxGUfYD9zg
	 KwaTmNGmGRK3/Fgg/iLtZ3V1Oeowegn1mvk53dgavo/7O2ptF2VSu4l/gEOC/UGQ10
	 b27HeM60vA3MAPu4GdjcQl6p8kfoIuA4k6Bdijgtvn3EOmXmoLIi8zD+zePRhB70dz
	 j8GibjkFw3IsQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so6550560e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 03:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWxoCX8UeJVSH0WZaSwtnlnX5JGHhTya2EjH6qmHwA1axeFIXRhjzZmtaFtvrnGVs5qsGPob7QVb29a7ojtW10@lists.infradead.org
X-Gm-Message-State: AOJu0YwLmoI7ZoUzkwbvCYLQqt0RMY+VH9tNc8/62v9nbmT1KD/fg+gF
	yhvo5VQaSngRJvlgsMWufzd5c8AYjUjUP+pR9BBKAhfE2G0qQli7bebk9Wnz4t/Ru4eu6s9Svvo
	hzHZ3KKgVDFx2s3Cb9D46ndRo6NCnWKncNU7lIeEqeA==
X-Received: by 2002:a05:6512:220f:b0:5a1:34a3:757f with SMTP id
 2adb3069b0e04-5a29b9958e6mr1037060e87.25.1774434722860; Wed, 25 Mar 2026
 03:32:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Mar 2026 03:32:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Mar 2026 03:32:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260325100144.1696731-1-arnd@kernel.org>
MIME-Version: 1.0
References: <20260325100144.1696731-1-arnd@kernel.org>
Date: Wed, 25 Mar 2026 03:32:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
X-Gm-Features: AaiRm53MDlZLZwdTwMSs-omwMVxdmGT3F6ltQ_Yfx4HD4BKPWevgMv5IzNZGH1g
Message-ID: <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
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

On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
> to build on targets without CONFIG_OF:
>
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
>
> drivers/gpio/gpio-mt7621.c: In function 'mediatek_gpio_bank_probe':
> drivers/gpio/gpio-mt7621.c:254:20: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   254 |         rg->chip.gc.of_gpio_n_cells = 2;
>       |                    ^
> drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_of_xlate':
> drivers/gpio/gpio-tegra186.c:502:25: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   502 |         if (WARN_ON(chip->of_gpio_n_cells < 2))
>       |                         ^~
> drivers/gpio/gpio-lpc32xx.c: In function 'lpc32xx_gpio_probe':
> drivers/gpio/gpio-lpc32xx.c:523:49: error: 'struct gpio_chip' has no member named 'of_xlate'
>   523 |                         lpc32xx_gpiochip[i].chip.of_xlate = lpc32xx_of_xlate;
>       |                                                 ^
> drivers/gpio/gpio-spacemit-k1.c: In function 'spacemit_gpio_add_bank':
> drivers/gpio/gpio-spacemit-k1.c:234:11: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   234 |         gc->of_gpio_n_cells     = 3;
>       |           ^~
>
> Bring that back as a dependency.
>
> Fixes: 7803501e5754 ("gpio: drop unneeded Kconfig dependencies on OF_GPIO")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> There may be more fallout from the change, this is just what I found immediately,
> but you could already fold the changes into the broken patch while I look
> for additional ones.
> ---

Thanks and sorry for the breakage. However, I'm wondering if it wouldn't make
sense to do the following:

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 17511434ed077..ce0e0df68dbaa 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -473,7 +473,6 @@ struct gpio_chip {
 	struct gpio_irq_chip irq;
 #endif /* CONFIG_GPIOLIB_IRQCHIP */

-#if defined(CONFIG_OF_GPIO)
 	/*
 	 * If CONFIG_OF_GPIO is enabled, then all GPIO controllers described in
 	 * the device tree automatically may have an OF translation
@@ -516,7 +515,6 @@ struct gpio_chip {
 	 */
 	int (*of_xlate)(struct gpio_chip *gc,
 			const struct of_phandle_args *gpiospec, u32 *flags);
-#endif /* CONFIG_OF_GPIO */
 };

 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);

Symbols from linux/of.h are stubbed out and these drivers can build just fine
with !CONFIG_OF. This would naturally increase the build coverage.

Bartosz

