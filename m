Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4DACDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 05:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QU9UUDIK6247cPDa+cwUVHsc1/gzZpOJAbSJDcml44I=; b=LPHiPJrr8saLXhHU2S9PYlr912
	T7OEGI5MYVJxakFWleVOuGUBI+jglwBCt/iAG6AYsHSkeyO2PRH9XusmA2K8ola3hlk1hYlfZ6FdH
	laxrTHE+jKIq9K1GnasR5lOJUMqVDvyG+D6O0jbf/VqjdV6aO4PtHWwjM4JM/FyDZr3S30oNNel4n
	KbUt3/QYlEv7/B7U5esQxxSibQ570Ail/TO4ia7R6lc9qSkjBVDl/zKrZL7cEcVAQWyB0wh3qucBm
	m2kORE9UbFgsI4e3USwhPptxofCUZv5zs2oXlTdl96krQ+1ZgOXUmlA1GQslqsAaJhuWzFxBjB6ha
	rzArxdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczW8-0000000AYg5-1tNB;
	Fri, 26 Jun 2026 05:54:20 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczW1-0000000AYdi-3agM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 05:54:19 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260626055410euoutp02d78161d37edeeadef043990f6ca0457d~8i8mdgxcH0929709297euoutp02T
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 05:54:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260626055410euoutp02d78161d37edeeadef043990f6ca0457d~8i8mdgxcH0929709297euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782453250;
	bh=QU9UUDIK6247cPDa+cwUVHsc1/gzZpOJAbSJDcml44I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=INZlesZFR/mN0zqsAnxGcb3NEk3Ey+tnlNOqROxyE/ijWPN4jEtNXasZqAzr4yjRE
	 UDqxXbutmBQUEHFWZNTBdus0TrvHh2P/OWQ2lU9eoM5GjQ8necsp/sWtlr4/TZ5a1X
	 UBgtcR+pz0h7KZV0H5C2nlHo7CeKp17OZp6qZdmw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260626055409eucas1p160d74a47e1ee0d16a738f48c40f1e6de~8i8ltmpLI0513105131eucas1p1p;
	Fri, 26 Jun 2026 05:54:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260626055409eusmtip23fedbfd2064e4857e35e7ab5dbdb2184~8i8lEXEMB3229032290eusmtip2V;
	Fri, 26 Jun 2026 05:54:09 +0000 (GMT)
Message-ID: <d8d407d5-ba6c-4197-9cf0-2fa7e6e17155@samsung.com>
Date: Fri, 26 Jun 2026 07:54:08 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Viacheslav Bocharov <v@baodeep.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
	Blumenstingl <martin.blumenstingl@googlemail.com>, Robin Murphy
	<robin.murphy@arm.com>, Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260625115718.1678991-2-v@baodeep.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260626055409eucas1p160d74a47e1ee0d16a738f48c40f1e6de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260625115817eucas1p10bfe0898d6cb2f6f51cff36a031946f9
X-EPHeader: CA
X-CMS-RootMailID: 20260625115817eucas1p10bfe0898d6cb2f6f51cff36a031946f9
References: <20260625115718.1678991-1-v@baodeep.com>
	<CGME20260625115817eucas1p10bfe0898d6cb2f6f51cff36a031946f9@eucas1p1.samsung.com>
	<20260625115718.1678991-2-v@baodeep.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_225414_499281_489BFA8B 
X-CRM114-Status: GOOD (  32.15  )
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

On 25.06.2026 13:57, Viacheslav Bocharov wrote:
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


Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


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
>  	struct gpio_desc *desc = shared_desc->desc;
>  	int ret = 0;
>  
> -	gpio_shared_lockdep_assert(shared_desc);
> +	lockdep_assert_held(&shared_desc->mutex);
>  
>  	if (value) {
>  	       /* User wants to set value to high. */
> @@ -89,7 +91,7 @@ static int gpio_shared_proxy_request(struct gpio_chip *gc, unsigned int offset)
>  	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
>  	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	proxy->shared_desc->usecnt++;
>  
> @@ -105,11 +107,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
>  	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
>  	int ret;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	if (proxy->voted_high) {
>  		ret = gpio_shared_proxy_set_unlocked(proxy,
> -			shared_desc->can_sleep ? gpiod_set_value_cansleep : gpiod_set_value, 0);
> +			gpiod_set_value_cansleep, 0);
>  		if (ret)
>  			dev_err(proxy->dev,
>  				"Failed to unset the shared GPIO value on release: %d\n", ret);
> @@ -129,7 +131,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
>  	struct gpio_desc *desc = shared_desc->desc;
>  	int ret;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	if (shared_desc->usecnt > 1) {
>  		if (shared_desc->cfg != cfg) {
> @@ -157,7 +159,7 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
>  	struct gpio_desc *desc = shared_desc->desc;
>  	int dir;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	if (shared_desc->usecnt == 1) {
>  		dev_dbg(proxy->dev,
> @@ -187,7 +189,7 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
>  	struct gpio_desc *desc = shared_desc->desc;
>  	int ret, dir;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	if (shared_desc->usecnt == 1) {
>  		dev_dbg(proxy->dev,
> @@ -222,13 +224,6 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
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
> @@ -237,29 +232,15 @@ static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
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
> +	guard(mutex)(&proxy->shared_desc->mutex);
> +
> +	return gpio_shared_proxy_set_unlocked(proxy, gpiod_set_value_cansleep,
> +					      value);
>  }
>  
>  static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
> @@ -302,20 +283,25 @@ static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
>  	gc->label = dev_name(dev);
>  	gc->parent = dev;
>  	gc->owner = THIS_MODULE;
> -	gc->can_sleep = shared_desc->can_sleep;
> +	/*
> +	 * Under the descriptor mutex the proxy may call
> +	 * gpiod_set_config()/gpiod_direction_*(), which can reach pinctrl
> +	 * paths that take a mutex (e.g. gpiod_set_config() ->
> +	 * gpiochip_generic_config() -> pinctrl_gpio_set_config()), independent
> +	 * of the underlying chip's can_sleep. So the descriptor lock must be a
> +	 * mutex and the proxy gpiochip is therefore always sleeping; drive the
> +	 * underlying GPIO through the cansleep value accessors, which are valid
> +	 * for both sleeping and non-sleeping chips.
> +	 */
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
> index 15e72a8dcdb1..bbdc0ab7b647 100644
> --- a/drivers/gpio/gpiolib-shared.h
> +++ b/drivers/gpio/gpiolib-shared.h
> @@ -3,10 +3,7 @@
>  #ifndef __LINUX_GPIO_SHARED_H
>  #define __LINUX_GPIO_SHARED_H
>  
> -#include <linux/cleanup.h>
> -#include <linux/lockdep.h>
>  #include <linux/mutex.h>
> -#include <linux/spinlock.h>
>  
>  struct gpio_device;
>  struct gpio_desc;
> @@ -42,35 +39,12 @@ static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
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
> -DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
> -	if (_T->lock->can_sleep)
> -		mutex_lock(&_T->lock->mutex);
> -	else
> -		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
> -	if (_T->lock->can_sleep)
> -		mutex_unlock(&_T->lock->mutex);
> -	else
> -		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
> -	unsigned long flags)
> -
> -static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
> -{
> -	if (shared_desc->can_sleep)
> -		lockdep_assert_held(&shared_desc->mutex);
> -	else
> -		lockdep_assert_held(&shared_desc->spinlock);
> -}
> -
>  #endif /* __LINUX_GPIO_SHARED_H */

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


