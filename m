Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17C9CFA478
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 21:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1lAHpDFttttSTMwqQwaJvp8oaLXdhV2Hu+WvPMVdZ0=; b=uMK3VlQ7vjCK9MXmu5RsnaAX/a
	UlMzEwjegkFH94hGSq7+vqLf8biOwi0lfcne9pAGmIN+jMp/GON4afMDmAzYAfQ4t+rBKrsrdwwnA
	Tm5d5ZLO2OltYydDKX4LJGHNcdwzzPRnMAEX6iNc+NxuLFZIjMR+ymgecguEqsixfyeZVa/60NdRx
	xpgaspWgPUkDMWI4t8rCcwcWf49FxAxX/1Dj2Xg9XRKY2t34cYIikWFCnaCEkfqMdUDa2H6oqgOPN
	pgZf8SNdajMaYaYB+SxFJjO7QntaY/wHEgKjoFEFbD7jNnQIgVdY+oJR6zjFkA30aBhkBZ61owx5O
	Vt7ipq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3inp-0000000Fxlo-3ZCJ;
	Wed, 23 Oct 2024 21:22:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3imH-0000000FxYH-2UDj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 21:20:27 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e49ef3bb9so187330b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 14:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729718424; x=1730323224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1lAHpDFttttSTMwqQwaJvp8oaLXdhV2Hu+WvPMVdZ0=;
        b=DvRaHcQbSXFl92ajEYEEOv1ROLEXf/HCk2IpjgjVML2jCRVGSlMfFVz0zaIlk5+lza
         FzhMJR69ByqvhWMoDfnexVVYsKHOSrHa4f64lo1CvIbZfrPBpHjNCzAxjWQBp13tcd/1
         cbsklpF6cltf4jMM0AUvXebC9clKSJUHLaXTCaMmm0gakndYHBzFPg/40vRBY0YGjsS7
         kVtrgpwK9lLpx5oUFsdY3iMUeRsGHRQfXAdXv0vFA6W0HZhNlh6t7hFwN8inoBEoO4Kz
         XgSIrxdCK6N1zXUd6+Ixv3gk/STtQg+nfgZZMsny80bRLcqe7HyF8KrtFZhzA73eU9Lc
         AKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718424; x=1730323224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1lAHpDFttttSTMwqQwaJvp8oaLXdhV2Hu+WvPMVdZ0=;
        b=KPXZ5DQtOLHWUKS0fZLpk2EQWjz5eCSe582RQYdFKf0licg+8xE/fxB2a+b+y6ws7s
         q1Ill8S5dHdl7iiygtRRvlUBWT+93WvmVrjlWKUzbCdwR1CorGhofIIxrCB+eqXPYdTo
         tC/0MZFP1Uqn3Qz3q8mM8DhoP7tk/FeI9KvUZulaHZGNWd8cNv/rV+OmmUmx7zyzHi6I
         za/hEAF7ZqC0boIT1WM8knWhXECL6jmKhexLUx7J4lYN6pNLYD0vSPwyjs849mOsfXcB
         OEZt+t1WnDznUpSjOXSbe1KFlzqVUr2LuM6V5nBfl3pnyprwcuhOb0Wkxvza2w0gbU5r
         Gr+g==
X-Forwarded-Encrypted: i=1; AJvYcCX7A0/btf0/eMq+tvnlZS9Hgl/+RlwaJsZIJbVKj5DoL77ojKhpNDhaTmAcF5ZTpXwnzl7ogPQg/EW3/jSld2u2@lists.infradead.org
X-Gm-Message-State: AOJu0YwsFXJFPyhu1wCnQwW7lVypPXVxoHQyQ3/z/kiES7Gj1GVM6kIe
	VrM1Lx9EJ8/4U/63cffFWTPyaqHlPUDYfjSQSqzHd1zOfQyvuLYM
X-Google-Smtp-Source: AGHT+IH9lsubsqgOfViHSHfwZvkUoMgkcDtKjmFeIC358iYHJ4HQ11dviFSWXPn6DEyl51MymmjZZw==
X-Received: by 2002:a05:6a00:4654:b0:71e:4dc5:259a with SMTP id d2e1a72fcca58-72030f9af50mr5868173b3a.7.1729718423536;
        Wed, 23 Oct 2024 14:20:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:84b7:953b:674b:513c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1407d8dsm6799039b3a.186.2024.10.23.14.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:20:23 -0700 (PDT)
Date: Wed, 23 Oct 2024 14:20:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: mjchen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com,
	arnd@arndb.de, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <ZxlolCdLGoD820uA@google.com>
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-3-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022063158.5910-3-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_142025_670621_09E2EBA6 
X-CRM114-Status: GOOD (  42.80  )
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

Hi,

On Tue, Oct 22, 2024 at 06:31:58AM +0000, mjchen wrote:
> From: mjchen <mjchen@nuvoton.com>
> 
> Adds a new keypad driver for the MA35D1 platform.
> The driver supports key scanning and interrupt handling.
> 
> Signed-off-by: mjchen <mjchen@nuvoton.com>
> ---
>  drivers/input/keyboard/Kconfig         |  10 +
>  drivers/input/keyboard/Makefile        |   1 +
>  drivers/input/keyboard/ma35d1_keypad.c | 312 +++++++++++++++++++++++++
>  3 files changed, 323 insertions(+)
>  create mode 100644 drivers/input/keyboard/ma35d1_keypad.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 721ab69e84ac..ce9bd5cc13a1 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -797,4 +797,14 @@ config KEYBOARD_CYPRESS_SF
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called cypress-sf.
>  
> +config KEYBOARD_MA35D1
> +	tristate "Nuvoton MA35D1 keypad driver"
> +	depends on ARCH_MA35
> +	select INPUT_MATRIXKMAP
> +	help
> +	  Say Y here if you want to use Nuvoton MA35D1 keypad.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ma35d1-keypad.
> +
>  endif
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 1e0721c30709..9b858cdd1b6b 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -70,3 +70,4 @@ obj-$(CONFIG_KEYBOARD_TEGRA)		+= tegra-kbc.o
>  obj-$(CONFIG_KEYBOARD_TM2_TOUCHKEY)	+= tm2-touchkey.o
>  obj-$(CONFIG_KEYBOARD_TWL4030)		+= twl4030_keypad.o
>  obj-$(CONFIG_KEYBOARD_XTKBD)		+= xtkbd.o
> +obj-$(CONFIG_KEYBOARD_MA35D1)		+= ma35d1_keypad.o
> diff --git a/drivers/input/keyboard/ma35d1_keypad.c b/drivers/input/keyboard/ma35d1_keypad.c
> new file mode 100644
> index 000000000000..20b5b1b91127
> --- /dev/null
> +++ b/drivers/input/keyboard/ma35d1_keypad.c
> @@ -0,0 +1,312 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  MA35D1 keypad driver
> + *  Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/input.h>
> +#include <linux/platform_device.h>
> +#include <linux/input/matrix_keypad.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +
> +/* Keypad Interface Registers */
> +#define KPI_CONF		0x00
> +#define KPI_3KCONF		0x04
> +#define KPI_STATUS		0x08
> +#define KPI_RSTC		0x0C
> +#define KPI_KEST		0x10
> +#define KPI_KPE0		0x18
> +#define KPI_KPE1		0x1C
> +#define KPI_KRE0		0x20
> +#define KPI_KRE1		0x24
> +#define KPI_PRESCALDIV	0x28
> +
> +/* KPI_CONF - Keypad Configuration Register */
> +#define KROW		GENMASK(30, 28) /* Keypad Matrix ROW number */
> +#define KCOL		GENMASK(26, 24) /* Keypad Matrix COL Number */
> +#define DB_CLKSEL	GENMASK(19, 16) /* De-bounce sampling cycle selection */
> +#define PRESCALE	GENMASK(15, 8)  /* Row Scan Cycle Pre-scale Value */
> +#define WAKEUP		BIT(5) /* Lower Power Wakeup Enable */
> +#define INTEN		BIT(3) /* Key Interrupt Enable Control */
> +#define RKINTEN		BIT(2) /* Release Key Interrupt Enable */
> +#define PKINTEN		BIT(1) /* Press Key Interrupt Enable Control */
> +#define ENKP		BIT(0) /* Keypad Scan Enable */
> +
> +/* KPI_STATUS - Keypad Status Register */
> +#define PKEY_INT	BIT(4) /* Press key interrupt */
> +#define RKEY_INT	BIT(3) /* Release key interrupt */
> +#define KEY_INT		BIT(2) /* Key Interrupt */
> +#define RST_3KEY	BIT(1) /* 3-Keys Reset Flag */
> +#define PDWAKE		BIT(0) /* Power Down Wakeup Flag */
> +
> +#define DEFAULT_DEBOUNCE		1
> +#define DEFAULT_PRE_SCALE		1
> +#define DEFAULT_PRE_SCALEDIV	32
> +
> +struct ma35d1_keypad {
> +	struct clk *clk;
> +	struct input_dev *input_dev;
> +	void __iomem *mmio_base;
> +	int irq;
> +	unsigned int kpi_row;
> +	unsigned int kpi_col;
> +	unsigned int debounce_val;
> +	unsigned int pre_scale;
> +	unsigned int pre_scale_divider;
> +};
> +
> +static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad,	unsigned int status)
> +{
> +	struct input_dev *input_dev = keypad->input_dev;
> +	unsigned int i, j;
> +	unsigned int row_add = 0;
> +	unsigned int code;
> +	unsigned int key;
> +	unsigned int press_key;
> +	unsigned long KeyEvent[4];

No camel-casing please.

> +	unsigned int row_shift = get_count_order(keypad->kpi_col);
> +	unsigned short *keymap = input_dev->keycode;
> +
> +	/* Read key event status */
> +	KeyEvent[0] = readl(keypad->mmio_base + KPI_KPE0);
> +	KeyEvent[1] = readl(keypad->mmio_base + KPI_KPE1);
> +	KeyEvent[2] = readl(keypad->mmio_base + KPI_KRE0);
> +	KeyEvent[3] = readl(keypad->mmio_base + KPI_KRE1);
> +
> +	/* Clear key event status */
> +	writel(KeyEvent[0], (keypad->mmio_base + KPI_KPE0));
> +	writel(KeyEvent[1], (keypad->mmio_base + KPI_KPE1));
> +	writel(KeyEvent[2], (keypad->mmio_base + KPI_KRE0));
> +	writel(KeyEvent[3], (keypad->mmio_base + KPI_KRE1));
> +
> +	for (j = 0; j < 4; j++) {
> +		if (KeyEvent[j] != 0) {
> +			row_add = (j % 2) ? 4 : 0;
> +			press_key = (j < 2) ? 1 : 0;

So you have first 64 bits to indicate pressed keys, followed by 64 bits
of released keys, right?

I wonder if you could declare 2 bitmaps of 64 bits and then used
for_each_set_bit() for each of them.

> +
> +			for (i = 0; i < 32; i++) {
> +				if (KeyEvent[j] & (1<<i)) {
> +					code = MATRIX_SCAN_CODE(((i/8) + row_add), (i % 8), row_shift);
> +					key = keymap[code];
> +
> +					input_event(input_dev, EV_MSC, MSC_SCAN, code);
> +					input_report_key(input_dev, key, press_key);
> +				}
> +			}
> +		}
> +	}
> +
> +	input_sync(input_dev);
> +}
> +
> +static irqreturn_t ma35d1_keypad_interrupt(int irq, void *dev_id)
> +{
> +	struct ma35d1_keypad *keypad = dev_id;
> +	unsigned int  kstatus;
> +
> +	kstatus = readl(keypad->mmio_base + KPI_STATUS);
> +
> +	if (kstatus & (PKEY_INT|RKEY_INT)) {
> +		ma35d1_keypad_scan_matrix(keypad, kstatus);
> +	} else {

Is this really "else"? Can it be that all 3 bits will be set?

> +		if (kstatus & PDWAKE)
> +			writel(PDWAKE, (keypad->mmio_base + KPI_STATUS));
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ma35d1_keypad_open(struct input_dev *dev)
> +{
> +	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
> +	unsigned int val, config;
> +
> +	val = RKINTEN | PKINTEN | INTEN | ENKP;
> +	val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
> +
> +	if (keypad->debounce_val > 0)
> +		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1)) |
> +				 FIELD_PREP(DB_CLKSEL, keypad->debounce_val);
> +	else
> +		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1));
> +
> +	val |= config;
> +
> +	writel(val, keypad->mmio_base + KPI_CONF);
> +	writel((keypad->pre_scale_divider - 1),	keypad->mmio_base + KPI_PRESCALDIV);
> +
> +	return 0;
> +}
> +
> +static void ma35d1_keypad_close(struct input_dev *dev)
> +{
> +	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
> +
> +	clk_disable(keypad->clk);

This is broken. What will happen if you open and close the device twice?
If you disable the clock in close() you need to enable it in open().

> +}
> +
> +static int ma35d1_keypad_probe(struct platform_device *pdev)
> +{
> +	struct ma35d1_keypad *keypad;
> +	struct input_dev *input_dev;
> +	struct resource *res;
> +	int error = 0;
> +
> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> +	if (!keypad)
> +		return -ENOMEM;
> +
> +
> +	input_dev = input_allocate_device();

devm_input_allocate_device().

> +	if (!input_dev) {
> +		dev_err(&pdev->dev, "failed to allocate input device\n");
> +		return -ENOMEM;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "failed to get I/O memory\n");
> +		error = -ENXIO;
> +		goto failed_free_input;
> +	}
> +
> +	keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(keypad->mmio_base)) {
> +		dev_err(&pdev->dev, "failed to remap I/O memory\n");
> +		return PTR_ERR(keypad->mmio_base);

Leaking input device (but OK if you switch to devm for it).

> +	}
> +
> +	keypad->irq = platform_get_irq(pdev, 0);
> +	if (keypad->irq < 0) {
> +		dev_err(&pdev->dev, "failed to get IRQ\n");
> +		return keypad->irq;
> +	}
> +
> +	keypad->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(keypad->clk)) {
> +		dev_err(&pdev->dev, "failed to get core clk: %ld\n", PTR_ERR(keypad->clk));
> +		return PTR_ERR(keypad->clk);
> +	}
> +
> +	error = matrix_keypad_parse_properties(&pdev->dev,
> +										   &(keypad->kpi_row),
> +										   &(keypad->kpi_col));

What tab stop are you using?

> +	if (error) {
> +		dev_err(&pdev->dev, "failed to parse kp params\n");
> +		return error;
> +	}
> +
> +	error = matrix_keypad_build_keymap(NULL, NULL,
> +									   keypad->kpi_row,
> +									   keypad->kpi_col,
> +									   NULL, input_dev);
> +	if (error) {
> +		dev_err(&pdev->dev, "failed to build keymap\n");
> +		return error;
> +	}
> +
> +	keypad->input_dev = input_dev;
> +	input_dev->name = pdev->name;
> +	input_dev->id.bustype = BUS_HOST;
> +	input_dev->open = ma35d1_keypad_open;
> +	input_dev->close = ma35d1_keypad_close;
> +	input_dev->dev.parent = &pdev->dev;
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "debounce-period", &(keypad->debounce_val)))
> +		keypad->debounce_val = DEFAULT_DEBOUNCE;

Please use generic device property API (device_property_read_u32() and
others).

> +
> +	if (of_property_read_u32(pdev->dev.of_node, "per-scale", &(keypad->pre_scale)))
> +		keypad->pre_scale = DEFAULT_PRE_SCALE;
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "per-scalediv", &(keypad->pre_scale_divider)))
> +		keypad->pre_scale_divider = DEFAULT_PRE_SCALEDIV;
> +
> +	__set_bit(EV_REP, input_dev->evbit);
> +	input_set_drvdata(input_dev, keypad);
> +	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
> +
> +	error = input_register_device(input_dev);
> +	if (error) {
> +		dev_err(&pdev->dev, "failed to register input device\n");
> +		goto failed_free_input;
> +	}
> +
> +	error = devm_request_irq(&pdev->dev, keypad->irq,
> +							 ma35d1_keypad_interrupt,
> +							 IRQF_NO_SUSPEND, pdev->name, keypad);

Why IRQF_NO_SUSPEND?

> +	if (error) {
> +		dev_err(&pdev->dev, "failed to request IRQ\n");
> +		goto failed_unregister_input;
> +	}
> +
> +	platform_set_drvdata(pdev, keypad);
> +	device_init_wakeup(&pdev->dev, 1);
> +	clk_prepare_enable(keypad->clk);

Too late preparing clock here.

> +
> +	return 0;
> +
> +failed_unregister_input:
> +	input_unregister_device(input_dev);
> +failed_free_input:
> +	input_free_device(input_dev);

Do not mix up devm and non-devm resources.

> +	return error;
> +}
> +
> +static void ma35d1_keypad_remove(struct platform_device *pdev)
> +{
> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
> +
> +	input_unregister_device(keypad->input_dev);
> +	clk_disable_unprepare(keypad->clk);
> +}
> +
> +static int ma35d1_keypad_suspend(struct platform_device *pdev,
> +									pm_message_t state)

Oof, this is so old style. Use DEFINE_SIMPLE_DEV_PM_OPS().

> +{
> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
> +
> +	if (device_may_wakeup(&pdev->dev)) {
> +		writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
> +		enable_irq_wake(keypad->irq);

Can you mark the interrupt as a wakeup interrupt in probe by calling
dev_pm_set_wake_irq()? Then you do not need to call enable_irq_wake()
here.

> +	}
> +
> +	return 0;
> +}
> +
> +static int ma35d1_keypad_resume(struct platform_device *pdev)
> +{
> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
> +
> +	if (device_may_wakeup(&pdev->dev)) {
> +		writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
> +						keypad->mmio_base + KPI_CONF);
> +		disable_irq_wake(keypad->irq);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ma35d1_kpi_of_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-kpi"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ma35d1_kpi_of_match);
> +
> +static struct platform_driver ma35d1_keypad_driver = {
> +	.probe		= ma35d1_keypad_probe,
> +	.remove		= ma35d1_keypad_remove,
> +	.suspend	= ma35d1_keypad_suspend,
> +	.resume		= ma35d1_keypad_resume,
> +	.driver		= {
> +		.name	= "ma35d1-kpi",
> +		.of_match_table = of_match_ptr(ma35d1_kpi_of_match),
> +	},
> +};
> +module_platform_driver(ma35d1_keypad_driver);
> +
> +MODULE_AUTHOR("Ming-Jen Chen");
> +MODULE_DESCRIPTION("MA35D1 Keypad Driver");
> +MODULE_LICENSE("GPL");
> +
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry

