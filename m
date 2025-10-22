Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9A3CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxX0M8Q9AeR4bXwnooJF10CMIgG9FjWwDoGlh/evr1M=; b=mpKOB32/RxdjxB1q2ZH6H3ThFR
	QKfdnZoYD9GobKRAV7v5IkZVtMydGIjFljH4mrXOYl86pjjFKB2u7a5Dc5BEwbyZiFkqFc9nvT3Pf
	GvtJGqapYAGmdmx/sI7hu2o64XwB8R7bj82lLOk+aFRKuRP5JyixZ+eeoRNDSHoTc2Yo1t6YHSiyF
	711UBngUoJKDEkmbWX6tNtRIQhEZPmCvz5jTu+qPUsAlezJpRbxU20leQblJsPtphmZ1zZmMkZmTE
	nm1DlsAMUtDiR0zuyCCCSRlPKfR1yk66aqynNmd/AItdL7uFR0zIzPEjgyAJnskXohkgoYioFUOci
	qYVW2jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdCM-00000003vsI-2kpB;
	Wed, 22 Oct 2025 18:04:34 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdCK-00000003vqm-3BQv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761156273; x=1792692273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LX84Ld6O6Uc5VIZ8xp7cMpdz1V/yl1HsOQOPlaYWJeQ=;
  b=YafrLs3EEa/RZEE8/msz9g0SsdlTEv8oKB+PKVWQr6u7zYnr9l+OTiiH
   /n5lJDXqq0iP6aNhejZg5nL2zBDbOqYvD/fRQIRp14WsZ9ujy5U7QR9Sf
   z4KKwDMLWu1cmG+KyEzzoApESzTI2Z/OC/uLzIcSXnPpHtzBaKzhS/7bN
   JcoFxD+q+6b+DgXhDb5w3TUJYTFLcTY7HD3ihbrspWV6GpDLgx0ZBBbyz
   Q0P1ca6/tMKfW+u+i16zHF6lYIIQaBU32PDBU01NgmwhXyE2oZKoAQLja
   JD7ATCd1gqLU40wUERh7HsGqA3A1VvulZnxaRNNRliMsHL5JbCx+HZoDS
   g==;
X-CSE-ConnectionGUID: iYop8lVNQOmJ11/bBZdnDA==
X-CSE-MsgGUID: 9/dQf9WOQp6UX5lXeEStNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80752964"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="80752964"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:04:31 -0700
X-CSE-ConnectionGUID: hQfoa2/xR6+4lGjcBV8xAQ==
X-CSE-MsgGUID: ZsI4OgiDTWux522dWpJ23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="184332231"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:04:25 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBdC9-00000001lJ5-3WrO;
	Wed, 22 Oct 2025 21:04:21 +0300
Date: Wed, 22 Oct 2025 21:04:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
Message-ID: <aPkcpTWfTb0HOF51@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-4-d34aa1fbdf06@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-4-d34aa1fbdf06@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_110432_843485_AD740CA3 
X-CRM114-Status: GOOD (  24.47  )
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

On Wed, Oct 22, 2025 at 03:10:43PM +0200, Bartosz Golaszewski wrote:
> 
> Add a virtual GPIO proxy driver which arbitrates access to a single
> shared GPIO by multiple users. It works together with the core shared
> GPIO support from GPIOLIB and functions by acquiring a reference to a
> shared GPIO descriptor exposed by gpiolib-shared and making sure that
> the state of the GPIO stays consistent.
> 
> In general: if there's only one user at the moment: allow it to do
> anything as if this was a normal GPIO (in essence: just propagate calls
> to the underlying real hardware driver). If there are more users: don't
> allow to change the direction set by the initial user, allow to change
> configuration options but warn about possible conflicts and finally:
> treat the output-high value as a reference counted, logical "GPIO
> enabled" setting, meaning: the GPIO value is set to high when the first
> user requests it to be high and back to low once the last user stops
> "voting" for high.

I have two Q:s about the design:
1) why can't the value be counted on the struct gpio_desc level?
2) can gpio-aggregator facilities be reused (to some extent)?

...

> +#include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>

+ types.h

> +#include "gpiolib-shared.h"

...

> +out:
> +	if (shared_desc->highcnt)
> +		dev_dbg(proxy->dev,
> +			"Voted for value '%s', effective value is 'high', number of votes for 'high': %u\n",
> +			value ? "high" : "low", shared_desc->highcnt);
> +	else
> +		dev_dbg(proxy->dev, "Voted for value 'low', effective value is 'low'\n");

You can unify and maybe save a few bytes here and there by doing something like
this:

	const char *tmp; // name is a placeholder

	tmp = str_high_low(shared_desc->highcnt);
	dev_dbg(proxy->dev,
		"Voted for value '%s', effective value is '%s', number of votes for '%s': %u\n",
		str_high_low(value), tmp, tmp, shared_desc->highcnt);

...

> +		dev_dbg(proxy->dev,
> +			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
> +			value ? "high" : "low");

str_high_low() ?

> +		ret = gpiod_direction_output(desc, value);
> +		if (ret)
> +			return ret;
> +
> +		if (value) {
> +			proxy->voted_high = true;
> +			shared_desc->highcnt = 1;
> +		} else {
> +			proxy->voted_high = false;
> +			shared_desc->highcnt = 0;
> +		}
> +
> +		return 0;
> +	}

-- 
With Best Regards,
Andy Shevchenko



