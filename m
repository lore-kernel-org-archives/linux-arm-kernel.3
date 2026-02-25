Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07768FD3770
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8naiv9MpwJnQcSKoFZDRXWWNV1GP0ak4fy+cY+NHL0=; b=S1OhK+ON8CCx3odBkkX7U50P4X
	mxSObr+pP4346bZajYaL8o/hIt8ckJ+eQGlita6L1o3zL8P7qw0GN7Rv7/+MMjzSNGzYcsD99mLws
	pu6I0Gw9hR07RHkjTfNTTIR6WYB+UpOx824NxlcLu4BYz7zlYUABxryh4hkjgj9M4lMzsiS5B6q+r
	zrZGG9bETFmJVZaMW+PE1lsbmHd+V57mWHnscMj/WEbAt6btTSrjCqa0DVDpFb5rsfjSy6ZLMcHJl
	7kE/Vjg7/G7iO1Eka3A8Q/Q7ppNb/5TqcYjrPDufABxIWiM30e4oRJBTowCCuvTtZJgK0TjqMldzl
	SWfyvQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHUs-00000004So0-3q96;
	Wed, 25 Feb 2026 16:12:22 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHUq-00000004Sn7-3a4H;
	Wed, 25 Feb 2026 16:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772035941; x=1803571941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wedeh2zn78qjUF85GM07fBAVemxKGYvznw6h2yhq8x0=;
  b=T6W2RAnzcpDqF17E+8y/locY6qU/v1IyGgvmmJOUX42WkJZ3lWoQzU5Z
   D5e5D/ZpJJrvLqV5lopLKZj+N9fOtlFuujyRqo8RjA/5SMpMdoFSBWazD
   HV8wf5+wAqhYdIOiINhYjA68/n0PcI4xmG/W3rDeOVE4jXEh+COlwfyQo
   mLgbc4V24FGTTF7q6SGkUa/nxUHFT7m0jPbWMt3Rq4PHR/3Pfo7RZvODE
   lMNaPRfeXVJV+gKowx4zC0ceJDqBedRTnBME3Qh/8so5Hf0oBozo476TY
   qNieXdIISm0mmc9fLNHOm6uGuYyFa6fyHERwwd8GmpCGB9EvtvPGGA7PD
   A==;
X-CSE-ConnectionGUID: J7ySkOFdRBKnD8bidRXKwQ==
X-CSE-MsgGUID: shLCFUzNQbasye3dKFlK4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73056382"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="73056382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:12:20 -0800
X-CSE-ConnectionGUID: N1H3W0yqQaC9NQakEgQDOg==
X-CSE-MsgGUID: UG9Q9LZsSoqRjV1nJdIvdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="213380447"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.71])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:12:15 -0800
Date: Wed, 25 Feb 2026 18:12:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com,
	mkorpershoek@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lee@kernel.org,
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aZ8fXXGMx3fk7gKs@smile.fi.intel.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
 <20260225155409.612478-5-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225155409.612478-5-hugo@hugovil.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_081220_956315_A2B80F2B 
X-CRM114-Status: GOOD (  24.10  )
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

On Wed, Feb 25, 2026 at 10:54:01AM -0500, Hugo Villeneuve wrote:

> Add support for GPIO-based charlieplex keypad, allowing to control
> N^2-N keys using N GPIO lines.
> 
> Reuse matrix keypad keymap to simplify, even if there is no concept
> of rows and columns in this type of keyboard.

...

> +/*
> + *  GPIO driven charlieplex keypad driver
> + *
> + *  Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>
> + *
> + *  Based on matrix_keyboard.c

A single space after asterisk is enough.

> + */

...

+ bitops.h

> +#include <linux/delay.h>

+ dev_printk.h
+ device/devres.h
+ err.h

> +#include <linux/gpio/consumer.h>
> +#include <linux/input.h>
> +#include <linux/input/matrix_keypad.h>

+ math.h

> +#include <linux/module.h>

> +#include <linux/of.h>

Is this in use? Or you wanted mod_devicetable.h for OF ID table?

> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/types.h>

...

> +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> +		int iline;

> +		int rc;

I think Dmitry prefers 'error' name for this kind of variables.

> +		/* Activate only one line as output at a time. */
> +		gpiod_direction_output(keypad->line_gpios->desc[oline], 1);
> +
> +		if (keypad->settling_time_us)
> +			fsleep(keypad->settling_time_us);
> +
> +		/* Read input on all other lines. */
> +		rc = gpiod_get_array_value_cansleep(keypad->line_gpios->ndescs,
> +						    keypad->line_gpios->desc,
> +						    keypad->line_gpios->info, values);
> +		if (rc)
> +			return;
> +
> +		for (iline = 0; iline < keypad->nlines; iline++) {
> +			if (iline == oline)
> +				continue; /* Do not read active output line. */
> +
> +			/* Check if GPIO is asserted. */
> +			if (test_bit(iline, values)) {
> +				code = MATRIX_SCAN_CODE(oline, iline,
> +							get_count_order(keypad->nlines));
> +				/*
> +				 * Exit loop immediately since we cannot detect
> +				 * more than one key press at a time.
> +				 */
> +				break;
> +			}
> +		}
> +
> +		gpiod_direction_input(keypad->line_gpios->desc[oline]);
> +
> +		if (code)
> +			break;
> +	}

...

> +static int charlieplex_keypad_init_gpio(struct platform_device *pdev,
> +					struct charlieplex_keypad *keypad)
> +{
> +	int i;

Why signed? But see below as well.

> +	keypad->line_gpios = devm_gpiod_get_array(&pdev->dev, "line", GPIOD_IN);
> +	if (IS_ERR(keypad->line_gpios))
> +		return PTR_ERR(keypad->line_gpios);
> +
> +	keypad->nlines = keypad->line_gpios->ndescs;
> +
> +	if (keypad->nlines > MATRIX_MAX_ROWS)
> +		return -EINVAL;

> +	for (i = 0; i < keypad->nlines; i++)

iterator is local to the loop, hence

	for (unsigned int i = 0; i < keypad->nlines; i++)

> +		gpiod_set_consumer_name(keypad->line_gpios->desc[i], "charlieplex_kbd_line");
> +
> +	return 0;
> +}

...

> +static int charlieplex_keypad_probe(struct platform_device *pdev)
> +{
> +	struct charlieplex_keypad *keypad;
> +	unsigned int debounce_interval_ms;
> +	unsigned int poll_interval_ms;
> +	struct input_dev *input_dev;

> +	int err;

The naming is even inconsistent between the functions...

> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> +	if (!keypad)
> +		return -ENOMEM;
> +
> +	input_dev = devm_input_allocate_device(&pdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	keypad->input_dev = input_dev;
> +
> +	device_property_read_u32(&pdev->dev, "poll-interval", &poll_interval_ms);
> +	device_property_read_u32(&pdev->dev, "debounce-delay-ms", &debounce_interval_ms);
> +	device_property_read_u32(&pdev->dev, "settling-time-us", &keypad->settling_time_us);
> +
> +	keypad->current_code = -1;
> +	keypad->debounce_code = -1;
> +	keypad->debounce_threshold = DIV_ROUND_UP(debounce_interval_ms, poll_interval_ms);
> +
> +	err = charlieplex_keypad_init_gpio(pdev, keypad);
> +	if (err)
> +		return err;
> +
> +	input_dev->name		= pdev->name;
> +	input_dev->id.bustype	= BUS_HOST;
> +
> +	err = matrix_keypad_build_keymap(NULL, NULL, keypad->nlines,
> +					 keypad->nlines, NULL, input_dev);
> +	if (err)
> +		dev_err_probe(&pdev->dev, -ENOMEM, "failed to build keymap\n");
> +
> +	if (device_property_read_bool(&pdev->dev, "autorepeat"))
> +		__set_bit(EV_REP, input_dev->evbit);
> +
> +	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
> +
> +	err = input_setup_polling(input_dev, charlieplex_keypad_poll);
> +	if (err)
> +		dev_err_probe(&pdev->dev, err, "unable to set up polling\n");
> +
> +	input_set_poll_interval(input_dev, poll_interval_ms);
> +
> +	input_set_drvdata(input_dev, keypad);
> +
> +	err = input_register_device(keypad->input_dev);
> +	if (err)
> +		return err;

> +	platform_set_drvdata(pdev, keypad);

Is this needed?

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



