Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7752CCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPl2Um7I2lBVEhg+iDB6W2BYLR9yy3oT8b4PVEgHMKA=; b=nMnKn0VAbpfiftU/2Yts5OBII9
	bK9NBjpcBq06m/SN55aFsI4gGDpjUcYfN/aVdqCYiOF3YHlDBs4FxIbR23IU1166MVM/TYg/YSFgy
	2iEG8+BFgvmB57d3oygFw8aLvpWTXK6jdtkNqL1m+rVp1dJaU9DhVHJ/OGLK7DTbpiOJgv2V+Z7uz
	FYkmZ97HdgbJCpmrdW3rr2D3jQONt5Dl6yEVshag9aooba3XZND5rYAVdHFZ7Tp1n93+ILWEIlfjs
	/aNHQgbzAElh3ZavSitFQ2q1Bu9ETrpQ3n+sChZ7YwFxrojvVHkwu0vMXYJOGPdNLwXl1qFi330RD
	NmNN95hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoFZ-0000000D6Pz-3J0G;
	Mon, 20 Oct 2025 11:40:29 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoFW-0000000D6OI-2LBk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:40:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-63bf76fc9faso7786239a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 04:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760960424; x=1761565224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPl2Um7I2lBVEhg+iDB6W2BYLR9yy3oT8b4PVEgHMKA=;
        b=LgbceCse+8hY6NSqfXMSF066dEyVqtFvwpk3k6MmOC+n8Vjfbj7xVuVi+x4I+d8KTw
         jpMP2dyvCxGXZnlYorHPuayxaBBZSM0zhXoTHFB6qA/k0skUXwecugzPG+xFIoBvtxZs
         2NKVfcDZ3uGg/BwbAUKmqyP/No8o4xy3cr1gmDQnkwdBlCyN6WLj4Ee9pufx9qpk4oEm
         8kXjZ7FTgHDeCTep33nmqfyaWj0irLb00orI0nQnyubbwfDPrnaGREtFGjVZ7P3OEbyq
         JaLaQzJKPg26057PmTIGoV3VJZLaHswk9v0seK/DfKhFLTSpb+nuO7vfHQ+/OPgJnrpX
         bRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760960424; x=1761565224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPl2Um7I2lBVEhg+iDB6W2BYLR9yy3oT8b4PVEgHMKA=;
        b=GMXL4eWF1+thaJ2UK+O6oFzaNUHIpZa6Sww3AXXiR2pIMrPKRJzlVeJJ4yANpJBxi/
         +Wy5irSxmg/ABjLdh0ZOZF6V+iEgc28mm+n7fRsMEkagBsTt++Ja8R967fNrznFpkSd/
         yPDGg1UtclWhUzD/gC99mSzoCkJy7pl1RggVq0pW3fmXHiUesBHHjs4ZDQPFZ/DBnT6F
         t+7EeBn+B+fLh5UuVz0VS4IO5bMGbd2Im+BSKRCBOahqUnBqlYWEhgILhaorLENDVFwM
         yUYIgUkJnwOcgV9xoMVkDFqjk6ehsK3Z4KcKM+QuedFH1S8eaHI1wyKScnxjLdW6iPx4
         h+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb+vqgSr3ReaM2gSTsryCfF0qeJd3CcIxmlhug5ZH08jSXdb7nN63/M/tz0TTKHSkK+SCwuec1d9nwvIubPXn/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw25UIo3FiqHQh7cBh0TeWd/6DjTNzAXjX1lGWmlF3aZE+pYy4J
	LLuywlwKB3GTu+qLb/09bhKz26vvwiD6mhNYrX12f5JIvDKPMC5Bbxxu
X-Gm-Gg: ASbGnct3dWXaHH95M32Asfo/C5HPMkPWODs73dByfhSmS7872xu2b3z3HQ6Uynu/0eY
	6VpCjNoD5oZqY89Y0GGeK0Ll23fClOf2JW/vDGC+lxj2d7yLGXe1nVyFMrAb7ceChgWRJtkpUEC
	OiEIefQQW5gIXeifUaYvZl9OUmSpjzPxbqLsQoICtfFVmNUTh6uF/ZdbWlulNEgE9wA3bZqFMNh
	FpkQqBP6YSCztzk9aUjBcAvDptqt1Wlrj5+9zEURfaDwD+G9JdSwY518oixrSXmT+SPz1M3KBSY
	BR55+SMFEn1qipTolYhsflL6jc5iODbvBlMpUAiwXD7+EIooHHyoycCiRgqas6zseVLVXXwQHJB
	XKlGyYwRw4a6mcIXA10idPaYauJX7OoVbXeoFMoGmmZPnsNTmj+kAGpYu6JkM1qOkJP/0I3CG26
	qqMMDSH+bpUeyNJpxAttrLdARh3xekpeVrhOGU284C5BQ=
X-Google-Smtp-Source: AGHT+IHv0Y0doSGXPi8HpPtRdOnJc4jNXqRl53GERgwAGtBO/cFV9LV248sfpWgTh1PM9QwVQ56tPg==
X-Received: by 2002:a05:6402:510b:b0:63b:f157:bc2d with SMTP id 4fb4d7f45d1cf-63c1f62af3emr12187142a12.1.1760960424268;
        Mon, 20 Oct 2025 04:40:24 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4949998csm6438734a12.38.2025.10.20.04.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:40:23 -0700 (PDT)
Message-ID: <07a3b881-9ddf-477d-a027-32b3f9ee3d36@gmail.com>
Date: Mon, 20 Oct 2025 04:40:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] clk: imx: add driver for imx8ulp's sim lpav
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-4-laurentiumihalcea111@gmail.com>
 <aPJVtzVyTYAhIFGp@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJVtzVyTYAhIFGp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_044026_655943_4169787A 
X-CRM114-Status: GOOD (  33.94  )
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


On 10/17/2025 7:41 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:20AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The i.MX8ULP System Integration Module (SIM) LPAV module is a block
>> control module found inside the LPAV subsystem, which offers some clock
>> gating options and reset line assertion/de-assertion capabilities.
>>
>> Therefore, the clock gate management is supported by registering the
>> module's driver as a clock provider, while the reset capabilities are
>> managed via the auxiliary device API to allow the DT node to act as a
>> reset and clock provider.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/clk/imx/Makefile               |   1 +
>>  drivers/clk/imx/clk-imx8ulp-sim-lpav.c | 211 +++++++++++++++++++++++++
>>  2 files changed, 212 insertions(+)
>>  create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
>>
>> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
>> index 03f2b2a1ab63..208b46873a18 100644
>> --- a/drivers/clk/imx/Makefile
>> +++ b/drivers/clk/imx/Makefile
>> @@ -41,6 +41,7 @@ clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
>>  clk-imx-acm-$(CONFIG_CLK_IMX8QXP) = clk-imx8-acm.o
>>
>>  obj-$(CONFIG_CLK_IMX8ULP) += clk-imx8ulp.o
>> +obj-$(CONFIG_CLK_IMX8ULP) += clk-imx8ulp-sim-lpav.o
>>
>>  obj-$(CONFIG_CLK_IMX1)   += clk-imx1.o
>>  obj-$(CONFIG_CLK_IMX25)  += clk-imx25.o
>> diff --git a/drivers/clk/imx/clk-imx8ulp-sim-lpav.c b/drivers/clk/imx/clk-imx8ulp-sim-lpav.c
>> new file mode 100644
>> index 000000000000..a67a0e50e1ce
>> --- /dev/null
>> +++ b/drivers/clk/imx/clk-imx8ulp-sim-lpav.c
>> @@ -0,0 +1,211 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright 2025 NXP
>> + */
>> +
>> +#include <dt-bindings/clock/imx8ulp-clock.h>
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#define SYSCTRL0 0x8
>> +
>> +#define IMX8ULP_HIFI_CLK_GATE(gname, cname, pname, bidx)	\
>> +	{							\
>> +		.name = gname "_cg",				\
>> +		.id = IMX8ULP_CLK_SIM_LPAV_HIFI_##cname,	\
>> +		.parent = { .fw_name = pname, .name = pname },	\
>> +		.bit = bidx,					\
>> +	}
>> +
>> +struct clk_imx8ulp_sim_lpav_data {
>> +	void __iomem *base;
>> +	struct regmap *regmap;
>> +	spinlock_t lock; /* shared by MUX, clock gate and reset */
>> +	unsigned long flags; /* for spinlock usage */
>> +	struct clk_hw_onecell_data clk_data; /*  keep last */
>> +};
>> +
>> +struct clk_imx8ulp_sim_lpav_gate {
>> +	const char *name;
>> +	int id;
>> +	const struct clk_parent_data parent;
>> +	u8 bit;
>> +};
>> +
>> +static struct clk_imx8ulp_sim_lpav_gate gates[] = {
>> +	IMX8ULP_HIFI_CLK_GATE("hifi_core", CORE, "hifi_core", 17),
>> +	IMX8ULP_HIFI_CLK_GATE("hifi_pbclk", PBCLK, "lpav_bus", 18),
>> +	IMX8ULP_HIFI_CLK_GATE("hifi_plat", PLAT, "hifi_plat", 19)
>> +};
>> +
>> +#ifdef CONFIG_RESET_CONTROLLER
> Needn't this ifdef because if CONFIG_RESET_CONTROLLER, reset driver will
> not probe, just register aux device is not harmful.


ah, yes, was meant to drop this. Will give it a try and do the change for V3 if everything

works well.


>
>> +static void clk_imx8ulp_sim_lpav_aux_reset_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> +
>> +	kfree(adev);
>> +}
>> +
>> +static void clk_imx8ulp_sim_lpav_unregister_aux_reset(void *data)
>> +{
>> +	struct auxiliary_device *adev = data;
>> +
>> +	auxiliary_device_delete(adev);
>> +	auxiliary_device_uninit(adev);
>> +}
>> +
>> +static int clk_imx8ulp_sim_lpav_register_aux_reset(struct platform_device *pdev)
>> +{
>> +	struct auxiliary_device *adev __free(kfree) = NULL;
>> +	int ret;
>> +
>> +	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> +	if (!adev)
>> +		return -ENOMEM;
>> +
>> +	adev->name = "reset";
>> +	adev->dev.parent = &pdev->dev;
>> +	adev->dev.release = clk_imx8ulp_sim_lpav_aux_reset_release;
>> +
>> +	ret = auxiliary_device_init(adev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to initialize aux dev\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = auxiliary_device_add(adev);
>> +	if (ret) {
>> +		auxiliary_device_uninit(adev);
>> +		dev_err(&pdev->dev, "failed to add aux dev\n");
>> +		return ret;
>> +	}
>> +
>> +	return devm_add_action_or_reset(&pdev->dev,
>> +					clk_imx8ulp_sim_lpav_unregister_aux_reset,
>> +					no_free_ptr(adev));
> use devm_auxiliary_device_create() to simple whole code.


good catch. Will give this a try and switch to it in next version if there's no issues.


>
>> +}
>> +#else
>> +static int clk_imx8ulp_sim_lpav_register_aux_reset(struct platform_device *pdev)
>> +{
>> +	return 0;
>> +}
>> +#endif /* CONFIG_RESET_CONTROLLER */
>> +
>> +static void clk_imx8ulp_sim_lpav_lock(void *arg) __acquires(&data->lock)
>> +{
>> +	struct clk_imx8ulp_sim_lpav_data *data = dev_get_drvdata(arg);
>> +
>> +	spin_lock_irqsave(&data->lock, data->flags);
>> +}
>> +
>> +static void clk_imx8ulp_sim_lpav_unlock(void *arg) __releases(&data->lock)
>> +{
>> +	struct clk_imx8ulp_sim_lpav_data *data = dev_get_drvdata(arg);
>> +
>> +	spin_unlock_irqrestore(&data->lock, data->flags);
>> +}
>> +
>> +static const struct regmap_config clk_imx8ulp_sim_lpav_regmap_cfg = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.lock = clk_imx8ulp_sim_lpav_lock,
>> +	.unlock = clk_imx8ulp_sim_lpav_unlock,
> why need lock/unlock here, regmap already have lock to access one register.


yeah but we want to share the lock with the clock gate. I know we can theoretically do

something like "&regmap->spinlock" but the lock initialization (i.e. which lock we initialize)

depends on how we configure "struct regmap_config", which is why I think my proposal is

more robust since we don't depend on how we fill in the fields of "struct regmap_config"

(other than lock/unlock/lock_arg).


But then again I'm not fixated on current approach so if more people think it would

be better to just use "&regmap->spinlock" then I'll give that a try.


>
> Frank
>> +};
>> +
>> +static int clk_imx8ulp_sim_lpav_probe(struct platform_device *pdev)
>> +{
>> +	struct clk_imx8ulp_sim_lpav_data *data;
>> +	struct regmap_config regmap_config;
>> +	struct clk_hw *hw;
>> +	int i, ret;
>> +
>> +	data = devm_kzalloc(&pdev->dev,
>> +			    struct_size(data, clk_data.hws, ARRAY_SIZE(gates)),
>> +			    GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(&pdev->dev, data);
>> +
>> +	memcpy(&regmap_config, &clk_imx8ulp_sim_lpav_regmap_cfg, sizeof(regmap_config));
>> +	regmap_config.lock_arg = &pdev->dev;
>> +
>> +	/*
>> +	 * this lock is used directly by the clock gate and indirectly
>> +	 * by the reset and mux controller via the regmap API
>> +	 */
>> +	spin_lock_init(&data->lock);
>> +
>> +	data->base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(data->base))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(data->base),
>> +				     "failed to ioremap base\n");
>> +	/*
>> +	 * although the clock gate doesn't use the regmap API to modify the
>> +	 * registers, we still need the regmap because of the reset auxiliary
>> +	 * driver and the MUX drivers, which use the parent device's regmap
>> +	 */
>> +	data->regmap = devm_regmap_init_mmio(&pdev->dev, data->base, &regmap_config);
>> +	if (IS_ERR(data->regmap))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(data->regmap),
>> +				     "failed to initialize regmap\n");
>> +
>> +	data->clk_data.num = ARRAY_SIZE(gates);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(gates); i++) {
>> +		hw = devm_clk_hw_register_gate_parent_data(&pdev->dev,
>> +							   gates[i].name,
>> +							   &gates[i].parent,
>> +							   CLK_SET_RATE_PARENT,
>> +							   data->base + SYSCTRL0,
>> +							   gates[i].bit,
>> +							   0x0, &data->lock);
>> +		if (IS_ERR(hw))
>> +			return dev_err_probe(&pdev->dev, PTR_ERR(hw),
>> +					     "failed to register %s gate\n",
>> +					     gates[i].name);
>> +
>> +		data->clk_data.hws[i] = hw;
>> +	}
>> +
>> +	ret = clk_imx8ulp_sim_lpav_register_aux_reset(pdev);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "failed to register aux reset\n");
>> +
>> +	ret = devm_of_clk_add_hw_provider(&pdev->dev,
>> +					  of_clk_hw_onecell_get,
>> +					  &data->clk_data);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "failed to register clk hw provider\n");
>> +
>> +	/* used to probe MUX child device */
>> +	return devm_of_platform_populate(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id clk_imx8ulp_sim_lpav_of_match[] = {
>> +	{ .compatible = "fsl,imx8ulp-sim-lpav" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, clk_imx8ulp_sim_lpav_of_match);
>> +
>> +static struct platform_driver clk_imx8ulp_sim_lpav_driver = {
>> +	.probe = clk_imx8ulp_sim_lpav_probe,
>> +	.driver = {
>> +		.name = "clk-imx8ulp-sim-lpav",
>> +		.of_match_table = clk_imx8ulp_sim_lpav_of_match,
>> +	},
>> +};
>> +module_platform_driver(clk_imx8ulp_sim_lpav_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("i.MX8ULP LPAV System Integration Module (SIM) clock driver");
>> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
>> --
>> 2.43.0
>>

