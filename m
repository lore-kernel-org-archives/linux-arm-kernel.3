Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4A8D1358C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 06:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRVy7DUai2fxFK9mh+tB9AyWJ8hxKfsvG30fRZxPNmA=; b=zktJk+63eIZUkK8AuZKeTuU4Wr
	fTY8eUCyfPqqkSFWwLw5cZWGQ3fFVhn60yYG3+8tiBYSbuVuVFkNdgr36LDIye1HSFFG2+RP40Ead
	YIrMfc6bq+9Z39R6Z6GdBGZXjuy20fu4ekLcDKcHVkDMYnhzbPvv/ZSDOU2jHynJws1IjSxm2UtVm
	W85tC+0RGQE14aGAgjY+mZslNPugQtpNwcmF+oNFBEkmIpI84kGIcoysvxQJ6Xo5mBznWkUh6Znov
	0a+HDK9MazeWA+60k0N73+Mm4I3SzmZmyjkqV8T+8SXkCpgPdwRy8WT7rgkqY4M7udD/5VaISzm3+
	LCFkwWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JBr-00000009ikw-02wA;
	Mon, 28 Oct 2024 06:25:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JAC-00000009iUo-0lQf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 06:23:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-208cf673b8dso35114835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 23:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730096619; x=1730701419; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rRVy7DUai2fxFK9mh+tB9AyWJ8hxKfsvG30fRZxPNmA=;
        b=ebXd4pUAuiB7GaxmpLFVnaiIoIECEWuwUAoLyT+pGxy8y0XTkdZMe9kaWS7ncNyDEx
         JUP4bHFZ3Qovj6yOmsH5tIADnyTfLOq6rYcQrXt8O2AsoaqvAXtd2LoAW1wGS9ZG+px3
         YMAcMJW1BzkDlvxq2kUE/vMQwvqc03/DAIjBUpUZrwFKygKkdj0rF3a90D05VmeL1OJG
         KVBlXb5llYXpwixg7nQCNy2GJen6q3m+uFTzkESafmcwmYcDfdLcfDXSgn1LoDZkIiKY
         pogmOS3DvLIVJeNPNWPZkgmjDGNhelZZtb7rOizo4jpFWTThnfR0J/sbw1EXw2HaLLHr
         szjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730096619; x=1730701419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRVy7DUai2fxFK9mh+tB9AyWJ8hxKfsvG30fRZxPNmA=;
        b=XdGlqYrzfGChrk8j65vGcEIkLuK1hhcEKksOeGMApxUL9n+JmNTnMlzumNxDxt6/IJ
         1qrLpC73xURPWkEMG+4SCoqUkjg3gYZGGBCWeANk+UgP4tdEyippw0VcRY7z9w3YcgML
         UYbk2lkdR0nr6uvkc/xVgnqROfRiPYG/b1V8rdsfKGTPauyhlxzotRjauB33XDRRbTVS
         tnr07UBTrffiYT/4L8BAGcJm4Doz0+7RNZFxwad5+Dqnb1sB1y+E0xWKUHluZmwDa4dV
         1kPF0hrkOWzfJFblPLi1CnAXvyu0M/r0I6Yyvf8EkFaR2kIArJKKYYRRFw/FeeTNlT1g
         q6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZBWUCuCQPYwNpxssSgf5T0n5TyWLbQUqT7sLIXJoe7wkxgvlIlAxdKFk8nhcopZ7DJS/ZTVw+WBlFeOB9H+oG@lists.infradead.org
X-Gm-Message-State: AOJu0YyiDPgThmgwZqOa6NXiSgbgsqX81Huu1KxN1oiLON8yqa5bQsql
	jMPublrIOgeghOumkiUyK/TxBY76S8b2M0UgkyDLzhiUj3fa9JdH
X-Google-Smtp-Source: AGHT+IFJkDIyhBUI7lRSK3XPqc2b6hPLfZfRYqu6uCKR3bI+jjCdKuefAE13VYYLgL17H7Q8XAvh0A==
X-Received: by 2002:a17:903:283:b0:20c:6bff:fc84 with SMTP id d9443c01a7336-210c67271e3mr105693855ad.0.1730096618603;
        Sun, 27 Oct 2024 23:23:38 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc013410sm44405685ad.173.2024.10.27.23.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 23:23:38 -0700 (PDT)
Message-ID: <4964ab4f-58cc-42da-b0a6-56b79a7bb4b3@gmail.com>
Date: Mon, 28 Oct 2024 14:23:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] input: keypad: add new keypad driver for MA35D1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 dmitry.torokhov@gmail.com
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-3-mjchen0829@gmail.com>
 <xveh2z7at7ion3fljdcvbhuvfij7m54bb66rlhclmxot3l5ea5@nzgzed6jwhlt>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <xveh2z7at7ion3fljdcvbhuvfij7m54bb66rlhclmxot3l5ea5@nzgzed6jwhlt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_232340_251330_D9017A50 
X-CRM114-Status: GOOD (  34.43  )
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


On 2024/10/23 下午 04:45, Krzysztof Kozlowski wrote:
> On Tue, Oct 22, 2024 at 06:31:58AM +0000, mjchen wrote:
>> From: mjchen <mjchen@nuvoton.com>
>>
>> Adds a new keypad driver for the MA35D1 platform.
>> The driver supports key scanning and interrupt handling.
>>
>> Signed-off-by: mjchen <mjchen@nuvoton.com>
>> ---
>>   drivers/input/keyboard/Kconfig         |  10 +
>>   drivers/input/keyboard/Makefile        |   1 +
>>   drivers/input/keyboard/ma35d1_keypad.c | 312 +++++++++++++++++++++++++
>>   3 files changed, 323 insertions(+)
>>   create mode 100644 drivers/input/keyboard/ma35d1_keypad.c
>>
>> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
>> index 721ab69e84ac..ce9bd5cc13a1 100644
>> --- a/drivers/input/keyboard/Kconfig
>> +++ b/drivers/input/keyboard/Kconfig
>> @@ -797,4 +797,14 @@ config KEYBOARD_CYPRESS_SF
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called cypress-sf.
>>   
>> +config KEYBOARD_MA35D1
>> +	tristate "Nuvoton MA35D1 keypad driver"
>> +	depends on ARCH_MA35
> || COMPILE_TEST


I will modify to: depends on ARCH_MA35 || COMPILE_TEST

>
>> +	select INPUT_MATRIXKMAP
>> +	help
>> +	  Say Y here if you want to use Nuvoton MA35D1 keypad.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called ma35d1-keypad.
>> +
>>   endif
>> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
>> index 1e0721c30709..9b858cdd1b6b 100644
>> --- a/drivers/input/keyboard/Makefile
>> +++ b/drivers/input/keyboard/Makefile
>> @@ -70,3 +70,4 @@ obj-$(CONFIG_KEYBOARD_TEGRA)		+= tegra-kbc.o
>>   obj-$(CONFIG_KEYBOARD_TM2_TOUCHKEY)	+= tm2-touchkey.o
>>   obj-$(CONFIG_KEYBOARD_TWL4030)		+= twl4030_keypad.o
>>   obj-$(CONFIG_KEYBOARD_XTKBD)		+= xtkbd.o
>> +obj-$(CONFIG_KEYBOARD_MA35D1)		+= ma35d1_keypad.o
>> diff --git a/drivers/input/keyboard/ma35d1_keypad.c b/drivers/input/keyboard/ma35d1_keypad.c
>> new file mode 100644
>> index 000000000000..20b5b1b91127
>> --- /dev/null
>> +++ b/drivers/input/keyboard/ma35d1_keypad.c
>> @@ -0,0 +1,312 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + *  MA35D1 keypad driver
>> + *  Copyright (C) 2024 Nuvoton Technology Corp.
>> + */
>> +
>> +#include <linux/interrupt.h>
>> +#include <linux/input.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/input/matrix_keypad.h>
>> +#include <linux/clk.h>
>> +#include <linux/of.h>
>> +
>> +/* Keypad Interface Registers */
>> +#define KPI_CONF		0x00
>> +#define KPI_3KCONF		0x04
>> +#define KPI_STATUS		0x08
>> +#define KPI_RSTC		0x0C
>> +#define KPI_KEST		0x10
>> +#define KPI_KPE0		0x18
>> +#define KPI_KPE1		0x1C
>> +#define KPI_KRE0		0x20
>> +#define KPI_KRE1		0x24
>> +#define KPI_PRESCALDIV	0x28
>> +
>> +/* KPI_CONF - Keypad Configuration Register */
>> +#define KROW		GENMASK(30, 28) /* Keypad Matrix ROW number */
>> +#define KCOL		GENMASK(26, 24) /* Keypad Matrix COL Number */
>> +#define DB_CLKSEL	GENMASK(19, 16) /* De-bounce sampling cycle selection */
>> +#define PRESCALE	GENMASK(15, 8)  /* Row Scan Cycle Pre-scale Value */
>> +#define WAKEUP		BIT(5) /* Lower Power Wakeup Enable */
>> +#define INTEN		BIT(3) /* Key Interrupt Enable Control */
>> +#define RKINTEN		BIT(2) /* Release Key Interrupt Enable */
>> +#define PKINTEN		BIT(1) /* Press Key Interrupt Enable Control */
>> +#define ENKP		BIT(0) /* Keypad Scan Enable */
>> +
>> +/* KPI_STATUS - Keypad Status Register */
>> +#define PKEY_INT	BIT(4) /* Press key interrupt */
>> +#define RKEY_INT	BIT(3) /* Release key interrupt */
>> +#define KEY_INT		BIT(2) /* Key Interrupt */
>> +#define RST_3KEY	BIT(1) /* 3-Keys Reset Flag */
>> +#define PDWAKE		BIT(0) /* Power Down Wakeup Flag */
>> +
>> +#define DEFAULT_DEBOUNCE		1
>> +#define DEFAULT_PRE_SCALE		1
>> +#define DEFAULT_PRE_SCALEDIV	32
>> +
>> +struct ma35d1_keypad {
>> +	struct clk *clk;
>> +	struct input_dev *input_dev;
>> +	void __iomem *mmio_base;
>> +	int irq;
>> +	unsigned int kpi_row;
>> +	unsigned int kpi_col;
>> +	unsigned int debounce_val;
>> +	unsigned int pre_scale;
>> +	unsigned int pre_scale_divider;
>> +};
>> +
>> +static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad,	unsigned int status)
>> +{
>> +	struct input_dev *input_dev = keypad->input_dev;
>> +	unsigned int i, j;
>> +	unsigned int row_add = 0;
>> +	unsigned int code;
>> +	unsigned int key;
>> +	unsigned int press_key;
>> +	unsigned long KeyEvent[4];
> No Windows or C++ code, please.


I will modify to:unsigned long key_event[4];

>
>> +	unsigned int row_shift = get_count_order(keypad->kpi_col);
>> +	unsigned short *keymap = input_dev->keycode;
>> +
> ...
>
>> +static int ma35d1_keypad_probe(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_keypad *keypad;
>> +	struct input_dev *input_dev;
>> +	struct resource *res;
>> +	int error = 0;
>> +
>> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
>> +	if (!keypad)
>> +		return -ENOMEM;
>> +
>> +
>> +	input_dev = input_allocate_device();
>> +	if (!input_dev) {
>> +		dev_err(&pdev->dev, "failed to allocate input device\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res) {
>> +		dev_err(&pdev->dev, "failed to get I/O memory\n");
>> +		error = -ENXIO;
>> +		goto failed_free_input;
>> +	}
>> +
>> +	keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(keypad->mmio_base)) {
>> +		dev_err(&pdev->dev, "failed to remap I/O memory\n");
>> +		return PTR_ERR(keypad->mmio_base);
>> +	}
>> +
>> +	keypad->irq = platform_get_irq(pdev, 0);
>> +	if (keypad->irq < 0) {
>> +		dev_err(&pdev->dev, "failed to get IRQ\n");
>> +		return keypad->irq;
>> +	}
>> +
>> +	keypad->clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(keypad->clk)) {
>> +		dev_err(&pdev->dev, "failed to get core clk: %ld\n", PTR_ERR(keypad->clk));
> Syntax is: return dev_err_probe, except that your error handling code is a mess.
> Earlier you have gotos, now return. Organize it nicely, so this will
> follow some logical concept.


I will refactor the error handling in my driver to consistently use either the return dev_err_probe() statement
or the goto method, ensuring a clearer and more logical flow in the code.

>
>> +		return PTR_ERR(keypad->clk);
>> +	}
>> +
>> +	error = matrix_keypad_parse_properties(&pdev->dev,
>> +										   &(keypad->kpi_row),
>> +										   &(keypad->kpi_col));
> How did you aligned it?
>
>> +	if (error) {
>> +		dev_err(&pdev->dev, "failed to parse kp params\n");
>> +		return error;
>> +	}
>> +
>> +	error = matrix_keypad_build_keymap(NULL, NULL,
>> +									   keypad->kpi_row,
>> +									   keypad->kpi_col,
>> +									   NULL, input_dev);
>> +	if (error) {
>> +		dev_err(&pdev->dev, "failed to build keymap\n");
>> +		return error;
>> +	}
>> +
>> +	keypad->input_dev = input_dev;
>> +	input_dev->name = pdev->name;
>> +	input_dev->id.bustype = BUS_HOST;
>> +	input_dev->open = ma35d1_keypad_open;
>> +	input_dev->close = ma35d1_keypad_close;
>> +	input_dev->dev.parent = &pdev->dev;
>> +
>> +	if (of_property_read_u32(pdev->dev.of_node, "debounce-period", &(keypad->debounce_val)))
>> +		keypad->debounce_val = DEFAULT_DEBOUNCE;
> This is not used anywhere. Drop dead code.


In|ma35d1_keypad_open()|, I used|keypad->debounce_val|  to set the debounce length.

>
>> +
>> +	if (of_property_read_u32(pdev->dev.of_node, "per-scale", &(keypad->pre_scale)))
>> +		keypad->pre_scale = DEFAULT_PRE_SCALE;
> Not better...
>
>> +
>> +	if (of_property_read_u32(pdev->dev.of_node, "per-scalediv", &(keypad->pre_scale_divider)))
>> +		keypad->pre_scale_divider = DEFAULT_PRE_SCALEDIV;
> Still not better...
>
> So there are defaults? Why these are required by bindings? Why bindings do not say
> defaults?


I will remove the default values for pre-scale and pre-scalediv.

>
>> +
>> +	__set_bit(EV_REP, input_dev->evbit);
>> +	input_set_drvdata(input_dev, keypad);
>> +	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
>> +
>> +	error = input_register_device(input_dev);
>> +	if (error) {
>> +		dev_err(&pdev->dev, "failed to register input device\n");
>> +		goto failed_free_input;
>> +	}
>> +
>> +	error = devm_request_irq(&pdev->dev, keypad->irq,
>> +							 ma35d1_keypad_interrupt,
>> +							 IRQF_NO_SUSPEND, pdev->name, keypad);
> Totally mesed alignment.


I will review the editor settings and make the necessary adjustments to resolve this problem.

>
>> +	if (error) {
>> +		dev_err(&pdev->dev, "failed to request IRQ\n");
>> +		goto failed_unregister_input;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, keypad);
>> +	device_init_wakeup(&pdev->dev, 1);
>> +	clk_prepare_enable(keypad->clk);
>> +
>> +	return 0;
>> +
>> +failed_unregister_input:
>> +	input_unregister_device(input_dev);
>> +failed_free_input:
>> +	input_free_device(input_dev);
>> +	return error;
>> +}
>> +
>> +static void ma35d1_keypad_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
>> +
>> +	input_unregister_device(keypad->input_dev);
>> +	clk_disable_unprepare(keypad->clk);
> Why aren't you using devm_clk_get_enabled()?


I will update the code to utilize devm_clk_get_enabled() and remove the clk_disable_unprepare(keypad->clk)

>
>> +}
>> +
>> +static int ma35d1_keypad_suspend(struct platform_device *pdev,
>> +									pm_message_t state)
>> +{
>> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
>> +
>> +	if (device_may_wakeup(&pdev->dev)) {
>> +		writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
>> +		enable_irq_wake(keypad->irq);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35d1_keypad_resume(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
>> +
>> +	if (device_may_wakeup(&pdev->dev)) {
>> +		writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
>> +						keypad->mmio_base + KPI_CONF);
>> +		disable_irq_wake(keypad->irq);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id ma35d1_kpi_of_match[] = {
>> +	{ .compatible = "nuvoton,ma35d1-kpi"},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, ma35d1_kpi_of_match);
>> +
>> +static struct platform_driver ma35d1_keypad_driver = {
>> +	.probe		= ma35d1_keypad_probe,
>> +	.remove		= ma35d1_keypad_remove,
>> +	.suspend	= ma35d1_keypad_suspend,
>> +	.resume		= ma35d1_keypad_resume,
>> +	.driver		= {
>> +		.name	= "ma35d1-kpi",
>> +		.of_match_table = of_match_ptr(ma35d1_kpi_of_match),
> Drop of_match_ptr(), you have warnings here.


I will remove this line of code.

>
> Best regards,
> Krzysztof

Best regards,
Ming-Jen Chen


