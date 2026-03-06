Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319E2F0183E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymvrjjPd//GaKYl9Ka0K/Hr4LIDzlDczwQ2BLU0KF2Q=; b=h+YOqc4oWlx/tQiSM3I34vK4El
	w/jqSUat7N9vFsxunZokWkuAotHtY9ZmPVdQuwR6rx9EePo7P4l59BASGuSDay2+PHeXXoX+PGcya
	8wqitKL5ajPjkK25hTqWDa8lZ9+1erJYcOjKVIrStbEhoSD9aWicLDdpS0STL5AwlYD/4zTXXfxhN
	jK28it0ZBtadKA1/8fDeKxV7kMu+6697mmo43dbtNlm6N9tfdnGcr4iMjk5MbKKNw6k+ULR6t7o+8
	k4GhhTJ3dlWS6p9V6wgkBwXCktl8JtdP4QbG9/x5XeISi038VzNI4n/biG5L7loRRFiBKbZ1ptyDz
	N8wL81ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyW3U-00000003tei-1XNo;
	Fri, 06 Mar 2026 14:21:28 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyW3N-00000003teI-1sfV;
	Fri, 06 Mar 2026 14:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772806881; x=1804342881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrSWEQCzYdDInjoygqfLYRngEipu0GaqBoIRMKJNN88=;
  b=beI8aZRrPiw57iTTUY+pmoGtR9Ni+IGO1x7GOWETJGZbdly0ODIyXtoP
   QBKmvzO0Xp6OTclcYxwArfzH4TlIYayjoUjTinYJHh0v5of8zvJREMtnL
   12mlwe6ww55Rii5ZctqNSgkasqna1DYP9tbIYPKOI2S7JcqodeK7pAW+X
   dtr57aAYcMymW72Nf88MHEukcnY7kJF90akgsKuXjmTGHmT2sNgVYokFK
   zaAV7IzBK++7UuFUCQeZa7JK/PyXW4IRVVJQXb9IaXTar/fkfB9yjiTkL
   hMYDpRF/uwgm9INHqeCQBAy2UWk6X7cARij9NZKeavJx+kU00G2puIgJR
   w==;
X-CSE-ConnectionGUID: oq/ZI5jLSGaHOsnrD3lLmA==
X-CSE-MsgGUID: pK0P/LxlRqqu5Grk7w0dDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="99385727"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="99385727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:21:18 -0800
X-CSE-ConnectionGUID: Z6Kp7Gz/TD6nsUrJkzKytg==
X-CSE-MsgGUID: 39iaiRcqTdiVpjYced1ksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218252442"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:21:12 -0800
Date: Fri, 6 Mar 2026 16:21:09 +0200
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
Subject: Re: [PATCH v4 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aari1Y1CPZSYEVj3@ashevche-desk.local>
References: <20260305192101.2125660-1-hugo@hugovil.com>
 <20260305192101.2125660-5-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305192101.2125660-5-hugo@hugovil.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_062121_528873_5BCF5CDB 
X-CRM114-Status: GOOD (  19.74  )
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

On Thu, Mar 05, 2026 at 02:20:50PM -0500, Hugo Villeneuve wrote:

> Add support for GPIO-based charlieplex keypad, allowing to control
> N^2-N keys using N GPIO lines.
> 
> Reuse matrix keypad keymap to simplify, even if there is no concept
> of rows and columns in this type of keyboard.

...

> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -40,6 +40,7 @@ obj-$(CONFIG_KEYBOARD_LOCOMO)		+= locomokbd.o
>  obj-$(CONFIG_KEYBOARD_LPC32XX)		+= lpc32xx-keys.o
>  obj-$(CONFIG_KEYBOARD_MAPLE)		+= maple_keyb.o
>  obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
> +obj-$(CONFIG_KEYBOARD_CHARLIEPLEX)	+= charlieplex_keypad.o

Seem unordered. At least the all around it is ordered AFAICS.

>  obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
>  obj-$(CONFIG_KEYBOARD_MAX7360)		+= max7360-keypad.o
>  obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o

...

> +/*
> + * GPIO driven charlieplex keypad driver
> + *
> + * Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>

2026?

> + *
> + * Based on matrix_keyboard.c
> + */

...

> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device/devres.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/input.h>
> +#include <linux/input/matrix_keypad.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/types.h>

> +static void charlieplex_keypad_poll(struct input_dev *input)
> +{
> +	struct charlieplex_keypad *keypad = input_get_drvdata(input);

> +	int oline;

Why signed?

> +	int code;
> +
> +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {

Can be like

	code = 0;
	for (unsigned int oline = 0; oline < keypad->nlines; oline++) {

as iterator is not used outside the loop.

> +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);

> +		int iline;

Why signed?

> +		int err;
> +
> +		/* Activate only one line as output at a time. */
> +		gpiod_direction_output(keypad->line_gpios->desc[oline], 1);
> +
> +		if (keypad->settling_time_us)
> +			fsleep(keypad->settling_time_us);
> +
> +		/* Read input on all other lines. */
> +		err = gpiod_get_array_value_cansleep(keypad->line_gpios->ndescs,
> +						     keypad->line_gpios->desc,
> +						     keypad->line_gpios->info, values);
> +		if (err)
> +			return;

> +		for (iline = 0; iline < keypad->nlines; iline++) {

Can be just

		for (unsigned int iline = 0; iline < keypad->nlines; iline++) {

as iterator is not used outside the loop.

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
> +
> +	charlieplex_keypad_check_switch_change(input, code);
> +}

...

> +	for (unsigned int i = 0; i < keypad->nlines; i++)
> +		gpiod_set_consumer_name(keypad->line_gpios->desc[i], "charlieplex_kbd_line");

Hmm... Don't you want to give it an index?

(In case you go this direction, see the kasprintf_strarray() or
 its managed variant.)

-- 
With Best Regards,
Andy Shevchenko



