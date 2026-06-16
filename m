Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B643CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp1syzW1srOQcyb+eZQpIHaaqzeGgItPN+sOMv5L2Hg=; b=09QdINiiMdyR0EEKsl+vMbvrT3
	ljSeIsHGVAeqnKVdemovebrwPjEzC1FrdTFl3MZHkjZHl366Xq99wdm8K+Gw4KLtkFvyl9TrLpNcp
	wyfJlo+yoU2cRo9jh+GC04tSg4TLZBlGK7GiBZVWUgi7Cv0jSx7hEsWIs3yhw9zz63nT3yZHgcuOX
	ryS8PL8MNnPCboR8jzK0gDPJ7w9NevuGZXseO74jYn1JFv9nGDSakLkW9PKcd3BV7Y927LvwEK5pG
	JCfEGz3jxEgZX3I6jYCyoWzQsOjSYNEl+nDja9uUKiiQ45UiWU8tescS4LPuHKKvNGyQtx4JvND6H
	nbaz1fRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTIj-0000000FnaY-0Rr4;
	Tue, 16 Jun 2026 12:53:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTIh-0000000Fna4-2YV4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:53:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC86860172
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 12:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9451D1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781614434;
	bh=kp1syzW1srOQcyb+eZQpIHaaqzeGgItPN+sOMv5L2Hg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JUrsC+XKP0qscMP7HnDfrjRQ5ozuE9hbzBs0+iQMt0fT6UdRzpvOOtTYmVgwiQgo3
	 tl2PGkkWyGntRfGI47/vPqdpoKco0OMvD34hr7l5spnoO7bPndkY4IEu/XilC2eNnI
	 H9u2U7NpDdw5zdnWMcAx1ZThsxbefVoJN4ROv+nxQArO3IPIRGkf5hufb4ojt9SRgY
	 KyG0NvdvuQG7T1wBhhUfV/7A07FLTVvmyHUR6vZOpbBIg0ddZMDkGGYyGgKf7SGNMr
	 6uBVXZMLwgqVlT08MaZh5cM/DhT7JaR/sEh3tELaBROfyOPbrSSqSO7sTkHsksxhwA
	 8X9FwEViiLwVg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so4111274e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 05:53:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8epElGhAp35xtU8+B/mocWj+Y+o7EKkIfjVC6RR4WQpc8Nq7A1Gsay5y57MOmMcyjcaoDu3P4dYTGBl4N6RK7E@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3edK/acdGVTBThltij47kQs7G7TlEe5RrxTC2U9dLspYxlnUr
	U8y6e8vB8254QjRhTA+YnU14RwLlKunIIWqfz30MHBA49ebUyPNypy4NHCw3jDs1sfhiO06wB4I
	ZxtMHLPeLBGoe6NdBrkK2xAqLIJqmFBEqJqizdGwQ+w==
X-Received: by 2002:ac2:5df3:0:b0:5ad:3035:c2c2 with SMTP id
 2adb3069b0e04-5ad428bdd78mr855785e87.51.1781614433226; Tue, 16 Jun 2026
 05:53:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 12:53:51 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 12:53:51 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610153329.937833-2-v@baodeep.com>
MIME-Version: 1.0
References: <20260610153329.937833-1-v@baodeep.com> <20260610153329.937833-2-v@baodeep.com>
Date: Tue, 16 Jun 2026 12:53:51 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mf-nMWzTiP3vZQSBW_NQQ6OFPmMGGG0-VE_iWs-B-Q4_A@mail.gmail.com>
X-Gm-Features: AVVi8CfI5Xcsmf9X5ZMB8tIz5JfgYHEL15SP9-TSKbR6tUfKWWLJo7jfpnDNBRA
Message-ID: <CAMRc=Mf-nMWzTiP3vZQSBW_NQQ6OFPmMGGG0-VE_iWs-B-Q4_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: shared-proxy: always serialize with a sleeping mutex
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

On Wed, 10 Jun 2026 17:32:10 +0200, Viacheslav Bocharov <v@baodeep.com> said:
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

Sigh... Ok let's try this. This limits users of shared pins to using them from
process context exclusively but maybe there is in fact no need to do it from
atomic context. After all: bit-banging can't work if we're using the voting
mechanism.

>
>  drivers/gpio/gpio-shared-proxy.c | 43 +++++++-------------------------
>  drivers/gpio/gpiolib-shared.c    |  9 ++-----
>  drivers/gpio/gpiolib-shared.h    | 31 +++++++++--------------
>  3 files changed, 23 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> index 6941e4be6cf1..856e5b9d6163 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@ -109,7 +109,7 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
>
>  	if (proxy->voted_high) {
>  		ret = gpio_shared_proxy_set_unlocked(proxy,
> -			shared_desc->can_sleep ? gpiod_set_value_cansleep : gpiod_set_value, 0);
> +			gpiod_set_value_cansleep, 0);
>  		if (ret)
>  			dev_err(proxy->dev,
>  				"Failed to unset the shared GPIO value on release: %d\n", ret);
> @@ -222,13 +222,6 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
>  	return gpio_shared_proxy_set_unlocked(proxy, gpiod_direction_output, value);
>  }
>
> -static int gpio_shared_proxy_get(struct gpio_chip *gc, unsigned int offset)
> -{
> -	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
> -
> -	return gpiod_get_value(proxy->shared_desc->desc);
> -}
> -
>  static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
>  					  unsigned int offset)
>  {
> @@ -237,29 +230,15 @@ static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
>  	return gpiod_get_value_cansleep(proxy->shared_desc->desc);
>  }
>
> -static int gpio_shared_proxy_do_set(struct gpio_shared_proxy_data *proxy,
> -				    int (*set_func)(struct gpio_desc *desc, int value),
> -				    int value)
> -{
> -	guard(gpio_shared_desc_lock)(proxy->shared_desc);
> -
> -	return gpio_shared_proxy_set_unlocked(proxy, set_func, value);
> -}
> -
> -static int gpio_shared_proxy_set(struct gpio_chip *gc, unsigned int offset,
> -				 int value)
> -{
> -	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
> -
> -	return gpio_shared_proxy_do_set(proxy, gpiod_set_value, value);
> -}
> -
>  static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
>  					  unsigned int offset, int value)
>  {
>  	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
>
> -	return gpio_shared_proxy_do_set(proxy, gpiod_set_value_cansleep, value);
> +	guard(gpio_shared_desc_lock)(proxy->shared_desc);
> +
> +	return gpio_shared_proxy_set_unlocked(proxy, gpiod_set_value_cansleep,
> +					      value);
>  }
>
>  static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
> @@ -302,20 +281,16 @@ static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
>  	gc->label = dev_name(dev);
>  	gc->parent = dev;
>  	gc->owner = THIS_MODULE;
> -	gc->can_sleep = shared_desc->can_sleep;
> +	/* Always a sleeping gpiochip: see the lock comment in gpiolib-shared.h. */
> +	gc->can_sleep = true;
>
>  	gc->request = gpio_shared_proxy_request;
>  	gc->free = gpio_shared_proxy_free;
>  	gc->set_config = gpio_shared_proxy_set_config;
>  	gc->direction_input = gpio_shared_proxy_direction_input;
>  	gc->direction_output = gpio_shared_proxy_direction_output;
> -	if (gc->can_sleep) {
> -		gc->set = gpio_shared_proxy_set_cansleep;
> -		gc->get = gpio_shared_proxy_get_cansleep;
> -	} else {
> -		gc->set = gpio_shared_proxy_set;
> -		gc->get = gpio_shared_proxy_get;
> -	}
> +	gc->set = gpio_shared_proxy_set_cansleep;
> +	gc->get = gpio_shared_proxy_get_cansleep;
>  	gc->get_direction = gpio_shared_proxy_get_direction;
>  	gc->to_irq = gpio_shared_proxy_to_irq;
>
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index de72776fb154..495bd3d0ddf0 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -627,8 +627,7 @@ static void gpio_shared_release(struct kref *kref)
>
>  	shared_desc = entry->shared_desc;
>  	gpio_device_put(shared_desc->desc->gdev);
> -	if (shared_desc->can_sleep)
> -		mutex_destroy(&shared_desc->mutex);
> +	mutex_destroy(&shared_desc->mutex);
>  	kfree(shared_desc);
>  	entry->shared_desc = NULL;
>  }
> @@ -659,11 +658,7 @@ gpiod_shared_desc_create(struct gpio_shared_entry *entry)
>  	}
>
>  	shared_desc->desc = &gdev->descs[entry->offset];
> -	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
> -	if (shared_desc->can_sleep)
> -		mutex_init(&shared_desc->mutex);
> -	else
> -		spin_lock_init(&shared_desc->spinlock);
> +	mutex_init(&shared_desc->mutex);
>
>  	return shared_desc;
>  }
> diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
> index 15e72a8dcdb1..5c725118b1af 100644
> --- a/drivers/gpio/gpiolib-shared.h
> +++ b/drivers/gpio/gpiolib-shared.h
> @@ -6,7 +6,6 @@
>  #include <linux/cleanup.h>
>  #include <linux/lockdep.h>
>  #include <linux/mutex.h>
> -#include <linux/spinlock.h>
>
>  struct gpio_device;
>  struct gpio_desc;
> @@ -42,35 +41,29 @@ static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
>
>  struct gpio_shared_desc {
>  	struct gpio_desc *desc;
> -	bool can_sleep;
>  	unsigned long cfg;
>  	unsigned int usecnt;
>  	unsigned int highcnt;
> -	union {
> -		struct mutex mutex;
> -		spinlock_t spinlock;
> -	};
> +	struct mutex mutex; /* serializes all proxy operations on this descriptor */
>  };
>
>  struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev);
>
> +/*
> + * Under this lock the proxy may call gpiod_set_config()/gpiod_direction_*(),
> + * which can reach pinctrl paths that take a mutex (e.g. gpiod_set_config() ->
> + * gpiochip_generic_config() -> pinctrl_gpio_set_config()), independent of the
> + * underlying chip's can_sleep. A spinlock would run that sleeping call from
> + * atomic context, so the descriptor lock must be a mutex and the proxy
> + * gpiochip is therefore sleeping (can_sleep=true).
> + */
>  DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
> -	if (_T->lock->can_sleep)
> -		mutex_lock(&_T->lock->mutex);
> -	else
> -		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
> -	if (_T->lock->can_sleep)
> -		mutex_unlock(&_T->lock->mutex);
> -	else
> -		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
> -	unsigned long flags)
> +	mutex_lock(&_T->lock->mutex),
> +	mutex_unlock(&_T->lock->mutex))

Just drop these wrappers altogether then, let's open-code mutex locking in
the proxy.

>
>  static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
>  {
> -	if (shared_desc->can_sleep)
> -		lockdep_assert_held(&shared_desc->mutex);
> -	else
> -		lockdep_assert_held(&shared_desc->spinlock);
> +	lockdep_assert_held(&shared_desc->mutex);

Same here, move it to the proxy.

>  }
>
>  #endif /* __LINUX_GPIO_SHARED_H */
> --
> 2.54.0
>
>
>

Bart

