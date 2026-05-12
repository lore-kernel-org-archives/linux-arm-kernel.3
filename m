Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D780CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0ca3LAEbRWJ3A6cCMR5wjf2m0FIaAdQQXqh+wCxgA0=; b=sHe9ZDOAfJuU+HEbFoiKiTCpVh
	4xpEQMla3JBfupT+UZ0f6Hx8QaebV9IPKKBfX07uX9wYRGZuZfIh+Z3LM6tbwobCC4LdPUi2zZLAh
	8KsAarurfp4+w716akuawVVAvMDdSu4DmheLImh2FnjeQLVDGImdeSZnUKmbpCcUbQyr80aU4C36W
	LPO67LQwGS4Kiad+jwJYRLst3vSt3uhGeTHGlvQhX1STfCHKo1FlRw+C2nS8s7JumlzV9fFmTgFNU
	68boVDKg6uKfqqw1bz5IjZ5OytI/Yy/VB332dstCvHz24n2mdSFLp+YF6Jy1jNqppe1KU0fcB3sWR
	WPSuwdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlFp-0000000GYi9-0LzS;
	Tue, 12 May 2026 11:26:25 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlFm-0000000GYgY-3LH1;
	Tue, 12 May 2026 11:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778585183; x=1810121183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=53DBMlKkfiAeBOgRgTQe8lRFc8+g8uGxzl/ji6L+mVQ=;
  b=HIGTtJfhWQ3q4m+cho0P+GtyQDaKm55+n2FIQIVnF69j8/NQ9m7IItN2
   RRGUPIREDo7Ef0M9jwcRDM2CIhMIeLykX2N00e/+zvrwSKKPSWlg9Ioq2
   vMm2JtqzU92QyxocHJ6af41EVB2TOvosLnPMYWT+8jhmi3okyMSjwZF3T
   /POAF0GnSSyWuWNvzieiYWf9UR1rk5zB8AuwXCn7AN8F9Xazw9dO8FEI3
   5QwASJD0NmlCho28oyDGtxUrtqT+GQYlaY0x6FDKVwt06ezBDIKz+9wnx
   zhu1NfXAeW2PCC7ErdedloCV5rqyd7vT+5Nk4PXARqsoheZsOYQJRD17R
   g==;
X-CSE-ConnectionGUID: rPh1/ANdQjWydnjeDVO9qA==
X-CSE-MsgGUID: aahp01pEQvivk9bZ6/TeKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79512031"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79512031"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:26:21 -0700
X-CSE-ConnectionGUID: ziLjYj4/QpSJWTTVZ++n9w==
X-CSE-MsgGUID: FlPvWD+4QOuKYhoES0hRVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="237983683"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:26:13 -0700
Date: Tue, 12 May 2026 14:26:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com, wbg@kernel.org,
	mathieu.dubois-briand@bootlin.com, mwalle@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	nuno.sa@analog.com, andy@kernel.org, dlechner@baylibre.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, linux-iio@vger.kernel.org,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	james.tai@realtek.com, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Message-ID: <agMOVcg38vQ4GxAh@ashevche-desk.local>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-4-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512033317.1602537-4-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_042622_889200_B26D56B7 
X-CRM114-Status: GOOD (  16.15  )
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

On Tue, May 12, 2026 at 11:33:13AM +0800, Yu-Chun Lin wrote:
> Extend the reg_mask_xlate callback with an operation type parameter
> (gpio_regmap_operation) to allow drivers to return different
> register/mask combinations for different GPIO operations.
> 
> Also add write-enable mechanism for hardware that requires setting a
> write-enable bit before modifying GPIO control registers.
> 
> Consequently, update all existing drivers utilizing the gpio-regmap
> framework (across drivers/gpio, drivers/iio, and drivers/pinctrl)
> to accommodate the new reg_mask_xlate function signature.

Dunno if we want per-driver patches (in that case it will be a new name and
callback, conversion per driver, removal old name, and, if required, renaming
back). In any case looks reasonable change.

...

> -static int idi_48_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
> -				 unsigned int offset, unsigned int *reg,
> -				 unsigned int *mask)
> +static int idi_48_reg_mask_xlate(struct gpio_regmap *gpio,
> +				 enum gpio_regmap_operation op,
> +				 unsigned int base, unsigned int offset,
> +				 unsigned int *reg, unsigned int *mask)

In every case, use this logical split.

...

> -static int i8255_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
> -				unsigned int offset, unsigned int *reg,
> +static int i8255_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_operation op,
> +				unsigned int base, unsigned int offset, unsigned int *reg,
>  				unsigned int *mask)

Exempli gratia, this one looks illogical, harder to read.

...

> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP, base, offset, &reg,
> +				   &wren_mask);

Ditto. Easier to follow when

	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP, base, offset,
				   &reg, &wren_mask);

>  	if (ret)
>  		return ret;

...

> +/**
> + * enum gpio_regmap_operation - Operation type for reg_mask_xlate callback
> + *
> + * This enum is used to distinguish between different types of GPIO operations
> + * so that the reg_mask_xlate callback can return the appropriate mask for each
> + * operation type.
> + *
> + * Value operations:

Have you checked the rendered text (HTML, PDF)? I believe this will look awfully wrong.

> + * @GPIO_REGMAP_GET_OP: Mask for reading direction to detect if GPIO is input or output.
> + *                      Used in gpio_regmap_get() to determine the GPIO direction.
> + * @GPIO_REGMAP_IN: Mask for reading input value. Used when GPIO is configured as input.
> + * @GPIO_REGMAP_OUT: Mask for reading output value. Used when GPIO is configured as output.
> + *
> + * Output operations:
> + * @GPIO_REGMAP_SET_OP: Mask for setting GPIO output value.
> + * @GPIO_REGMAP_SET_WITH_CLEAR_OP: Mask for setting/clearing GPIO using separate registers.
> + * @GPIO_REGMAP_SET_WREN_OP: Write-enable mask for output operations. May be used to enable
> + *                           writes to protected registers.
> + *
> + * Direction operations:
> + * @GPIO_REGMAP_GET_DIR_OP: Mask for reading GPIO direction (input/output).
> + * @GPIO_REGMAP_SET_DIR_OP: Mask for setting GPIO direction (input/output).
> + * @GPIO_REGMAP_SET_DIR_WREN_OP: Write-enable mask for direction operations. May be used to
> + *                               enable writes to protected direction registers.
> + */

-- 
With Best Regards,
Andy Shevchenko



