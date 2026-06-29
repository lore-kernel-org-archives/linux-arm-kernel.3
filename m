Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D068C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CU8TMB46KVquqb6NZE+mjswOyduzrIxQL/Z45liuHG4=; b=3H43s8N6lQIgfQTIkUwoJ7bSnB
	5N3/wyCPE1OPy6wghE5SkM22PuezKFz5cQGagcMp9lqicntFfe2iHOlyHPl1g1MwyUTa6MhNsd9qr
	OYUyxYQndRxPqxjCPF/neOmTlcD7cXQwlA7DaJDrBz/UCLj7g2hoB+GNcM7FKarmoLcGcl5y497Tb
	nxippdWcbpV7ArkYHiRGubB+oM7J+PWFCt6dZ45QqLA6D5G+T8fRR9M7QyWTQ3qu2tqq3oYNIcPD7
	tYcg5BLKlYSxmBzCEvCjuKMu89LCxwWcIovGVsb1Lh9/8TgrG06P3OTndxTIcU6ObMJbgyWQmCjH3
	nqZg4o6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFRp-0000000FHVR-1oS4;
	Mon, 29 Jun 2026 17:07:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFRn-0000000FHV4-3KhE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 17:07:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE1F160123
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 17:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7682A1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782752822;
	bh=CU8TMB46KVquqb6NZE+mjswOyduzrIxQL/Z45liuHG4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Yrxvbo4XVFc+tkKdK7ym6mYWtieEBKFP4ZF/LfZmsMd+Q2sbjIohStqMyffYbb58m
	 fo2OjtDduxdHXaWy+Bev1CZcc8KNmm1GFXx+PhNrm7ZYumddHmBPQdHAbWbk70xjTA
	 AYXXm5/9uFyV1BJu5nILEbmvwZ5k2KrYToZBRfhRAUKYhvDT1mIDIZ1Rgvh3Jyc3s6
	 G6uFpkq84Tnqzhx50fgN0Zqmv+hftyHBlT9H1sVzLfpQXniz7880NHZEmkrJ2b9aL6
	 GyNQ2WIkGDusVbegI6YLTwu73CQV2IVb4o4/cnaVVQxgbH1FGChiBRSv3jBYoTpVog
	 MD9GRaLjSTOPA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b03d41976so14912471fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:07:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq11LSfmKORHCO+c96SdqHHJUGwndhKMpPalFibeJpEA89KwNg2zLvhb1qG0U6Q+LUIURXZTOy8KEwPrVlorvnf@lists.infradead.org
X-Gm-Message-State: AOJu0YyRWojUkYyh69ZMbSB9GdXJPA313JcqCkSFAbiNZbW/ghaIzTg6
	XL6TUrzSS71Sef7Dn0217ruLSbaLvFDazRU70jnUVarIlSSAvkHXAfbVjceyhRk/bnnRA74otBt
	0xOK6y0itdwzqZ3TjUhB/MNibBqz4rtfIDwziIGvhhg==
X-Received: by 2002:a05:651c:158c:b0:399:83a4:4f2c with SMTP id
 38308e7fff4ca-39b1daae071mr107701fa.18.1782752821184; Mon, 29 Jun 2026
 10:07:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 10:06:59 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 10:06:59 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260625115718.1678991-2-v@baodeep.com>
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-2-v@baodeep.com>
Date: Mon, 29 Jun 2026 10:06:59 -0700
X-Gmail-Original-Message-ID: <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
X-Gm-Features: AVVi8Cex4Km60qsC3nmt5H_9iHFU4BjDrOYA0iDy91F4RstIOAhIA0emnN3RoSU
Message-ID: <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
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

On Thu, 25 Jun 2026 13:57:17 +0200, Viacheslav Bocharov <v@baodeep.com> said:
> The shared GPIO descriptor used either a mutex or a spinlock, chosen at
> runtime from the underlying chip's can_sleep:
>
> 	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
> 	... if (can_sleep) mutex_lock(); else spin_lock_irqsave();
>
> can_sleep describes only the value path (->get/->set). Under the same
> lock, however, the proxy may call gpiod_set_config() and
> gpiod_direction_*(), which can reach pinctrl paths that take a mutex
> (e.g. gpiod_set_config() -> gpiochip_generic_config() ->
> pinctrl_gpio_set_config()), independent of can_sleep. On a controller
> with non-sleeping MMIO value ops the descriptor lock was a spinlock, so
> the sleeping pinctrl call ran from atomic context. Reproduced on an
> Amlogic A113X board with the workaround from commit 28f240683871
> ("pinctrl: meson: mark the GPIO controller as sleeping") reverted; the
> original Khadas VIM3 report hit the same path:
>
> 	BUG: sleeping function called from invalid context
> 	  __mutex_lock
> 	  pinctrl_get_device_gpio_range
> 	  pinctrl_gpio_set_config
> 	  gpiochip_generic_config
> 	  gpiod_set_config
> 	  gpio_shared_proxy_set_config   <- voting spinlock held
> 	  ...
> 	  mmc_pwrseq_simple_probe
>
> The spinlock existed to take the value vote from atomic context, but the
> vote and the (possibly sleeping) control operations share the same state
> and lock, so this scheme cannot serialize config under a mutex and still
> offer atomic value access. Always serialize the shared descriptor with a
> mutex instead and mark the proxy a sleeping gpiochip, driving the
> underlying GPIO through the cansleep value accessors: those are valid
> for both sleeping and non-sleeping chips, so value access keeps working
> on fast controllers, at the cost of no longer being atomic.
>
> This is observable: consumers gating on gpiod_cansleep() take their
> sleeping branch on a proxied GPIO (mmc-pwrseq-emmc skips its
> emergency-restart reset handler; its normal reset is unaffected), and
> consumers that reject sleeping GPIOs (pwm-gpio, ps2-gpio, ...) would
> fail to probe. Such atomic users do not share a pin through the proxy,
> whose purpose is voting on shared reset/enable lines. The same narrowing
> already applies on Amlogic since that workaround, and rockchip
> addressed the identical splat per-driver in commit 7ca497be0016 ("gpio:
> rockchip: Stop calling pinctrl for set_direction"); fixing the proxy
> addresses the locking error once, for every controller.
>
> The lock type was added by commit a060b8c511ab ("gpiolib: implement
> low-level, shared GPIO support"); the sleeping call under it arrived with
> the proxy driver.
>
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
> ---
> v1 -> v2: open-code the descriptor mutex; drop the gpio_shared_desc_lock
>           guard and the gpio_shared_lockdep_assert() helper, use
>           guard(mutex) and lockdep_assert_held() directly; move the
>           mutex rationale from the header to the can_sleep assignment in
>           probe.
>
> v1: https://lore.kernel.org/linux-gpio/20260610153329.937833-2-v@baodeep.com/
>
>  drivers/gpio/gpio-shared-proxy.c | 66 +++++++++++++-------------------
>  drivers/gpio/gpiolib-shared.c    |  9 +----
>  drivers/gpio/gpiolib-shared.h    | 28 +-------------
>  3 files changed, 29 insertions(+), 74 deletions(-)
>
> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> index 6941e4be6cf1..0cd52015b731 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@ -9,8 +9,10 @@
>  #include <linux/err.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/lockdep.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/string_choices.h>
>  #include <linux/types.h>
>
> @@ -32,7 +34,7 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,

I was about to apply it but then realized that it can be simplified further.
The set_func() argument in gpio_shared_proxy_set_unlocked() is no longer
needed and can be replaced with a direct call to gpiod_set_value_cansleep().

Would you mind sending a v3 with that included?

Thanks,
Bartosz

