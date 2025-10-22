Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB97FCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yO34qPsn7QHCTVDfDKcQas0jsSh3wLko8YufcBfx8as=; b=JzG9Kefcs2yi5pZTtWlSwPkNu6
	/w3USL7AZEgk8qpDyOn/2zXISzq25fzNjH/rRoaDZw53+IUgDCTeGQMugcL66VsrN3dVpbEJU701g
	3Ffxr9VY/LhZWMNEPqfwp2rERFMn06ZmI3uPS6wQgnfkLwLiC/amqHB4uVltgdFA0UiQGMHNTO17I
	qZx5Rd+FRq3ZGx1Tf6MmQs1hpwZGv3Woaa+VgobKB4uu+e1YNASROFE5+MQIHnKcMfg6W9CqTpo/9
	nZRbvr5kAYr8TbmcnZGDvTA/1J2pg8K/zZnOFlbg9joCCOXJa5cNKPcg4VZGIxAb4Ql8dneukuncn
	UlyM3uXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBX7Y-00000002fVM-2FND;
	Wed, 22 Oct 2025 11:35:12 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBX7Q-00000002fRD-2g7X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:35:07 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b5e19810703so1098919266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761132903; x=1761737703; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yO34qPsn7QHCTVDfDKcQas0jsSh3wLko8YufcBfx8as=;
        b=PrQ5zmIjkbY9LjbceJEt+mxQ+/cBFuwUzKZl9iYPm6tzBDUQbCHt5IxC7WJ5M5XtFj
         DnsuPDin1zMGfz0jvMeIDGLQgSF6RGTpY1bnJMmAls+sCt/UvwjCjimPdTCJrTOR0HQB
         lOZDXicFvFXYo8tR9VVzmj6e/1J4+PSOWco1lt9CXYozzvlMp421Fl4L+wy8xj+8VG4Q
         0Lb7hW0uXqtw8WkZSwYUZ0U0YS5c1z0Yr7SPz5YZ8FOCri/3ypDQI/aE3wsyZKznQ9Zr
         LufTBlSR3su0ItAL6sSRQcgwu0CE1sFOHGAn6Vqte9JtAXzL/M+NYcZbvoIl3Qo33I2J
         rVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761132903; x=1761737703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yO34qPsn7QHCTVDfDKcQas0jsSh3wLko8YufcBfx8as=;
        b=m42cyUbfKi9FOVZf4BuhoyKDbXwfjl1LC7Ancr+bZ/D0RL1enTu+DA9udNoUknOs0p
         zBG15mnyGwmNiLwY/kWUnoDv1Lfrl+7Mn637hoUxP/2MtA+EgbjypcDmwOcVtKo39qeV
         XKgHmtHj1rzosWnQmFA1xfB+/Pf7ryI5LVt05AgCrPUVmdq4pXCX1gbGGEomQaWQrrpN
         1OKT875oSnM7ldjyBRoU4taIy9L7l2hZKNNVGtjBtgWIaPtAGMMprUU4A7QDtEP00iVI
         kL0JHZvhO9iK287crppm0iBuOHJxguOHIH838E/ObS+1tkNZUYigcz4UtNAXfhhJBKjR
         WRig==
X-Forwarded-Encrypted: i=1; AJvYcCXqOd3LaU7qDmn6O0swK1OzBsJ/dnXY9/iwGfS6SxJ1ohhRaIFovg2F7HYjXWNikYr9BZlXuWwJEcDlgxtd1F4s@lists.infradead.org
X-Gm-Message-State: AOJu0YyQYxH/XD6/rLvFzH9iWGBNY7TKT/GTGOU6fem5KlmIHeoXBq+n
	i+jLvFMa5YS5UR900CV4E/uWQXNfdKtFkccEf3u8UCYDwn/Vxp1w4kLE
X-Gm-Gg: ASbGncsZMGnCvBcpmUwmyFoD/f1bV5LZxvQfUK2beXfgSBedydOGkAKzjuGEXOBy7rf
	aWaR6EDfrdQMhIe4UXFIUL9S2nNNke5KgeRebOTpv3InSR8DUDWIfGR9TRH+0uI3yTCxdqguY3p
	On/yOBkVWpOJ99QNgwYdCibzohbh+aMC1NzSXWW730EgeN/eIMRg3F3JaJt4tSjqKc+gYuvQHtg
	vH9tDjrTJnyGEfq5pHjTfZQNekCbkRIVUQnzHqcSeZ94ckhhxh1d1vTacIDRGJPxEsLLQzdzAkK
	KKdZnx1A0Nh7JQchz6FLgIOT4UNEr9nJ9KEyzno+e2R9sdSIQmNk3+Eo/fj60t0oTPmJ3TiMjr2
	WCVcS+inEpMEyWiKgrBolxrdAl/xFOZmdYYCwre9EqyOuSj9uARQPCVYFG+woiF/LiWXCEu7A/u
	QMtrA3DYwgpQJZvw/rEfxL+4rBzrovJOIlx8QKxhkCt/A=
X-Google-Smtp-Source: AGHT+IHfqiWBy7zfGoCqLQpI11jm6dwQ/WE7NiaPb8Gr8GzjB9HYaKJgVjiXf/jFs4wJwPRiCS9gYA==
X-Received: by 2002:a17:907:1c82:b0:b4e:a47f:715d with SMTP id a640c23a62f3a-b6472a6a145mr2430377866b.17.1761132902443;
        Wed, 22 Oct 2025 04:35:02 -0700 (PDT)
Received: from [10.25.209.134] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb4dcf2sm1303250766b.75.2025.10.22.04.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:35:02 -0700 (PDT)
Message-ID: <804dd1f5-7e79-4bfa-b777-c97bb89a713a@gmail.com>
Date: Wed, 22 Oct 2025 04:35:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] reset: imx8mp-audiomix: Switch to using regmap API
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
 <20251017112025.11997-6-laurentiumihalcea111@gmail.com>
 <aPJXdPVrofYGQgIP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJXdPVrofYGQgIP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_043504_748930_3BE42947 
X-CRM114-Status: GOOD (  32.00  )
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


On 10/17/2025 7:49 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:22AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> As far as the Linux kernel is concerned, block devices such as i.MX8MP's
>> AUDIOMIX block control or i.MX8ULP's SIM LPAV can simultaneously act as
>> clock controllers, reset controllers or mux controllers. Since these IPs
>> offer different functionalities through different subsystem APIs, it's
>> important to make sure that the register R-M-W cycles are performed under
>> the same lock across all subsystem APIs. This will ensure that registers
>> will not end up with the wrong values because of race conditions (e.g.
>> clock consumer tries to update block control register A, while, at the
>> same time, reset consumer tries to update the same block control register).
>>
>> However, the aforementioned race conditions will only impact block control
>> IPs which use the same register for multiple functionalities. For example,
>> i.MX8MP's AUDIOMIX block control IP provides clock gating functionalities
>> and reset control functionalities through different registers. This is why
>> the current approach (i.e. clock control and reset control work using
>> different locks) has worked well so far.
>>
>> Since we want to extend this driver to be usable for i.MX8ULP's SIM LPAV
>> block control IP, we need to make sure that clock control, reset control,
>> and mux control APIs use the same lock since all of these functionalities
>> are performed using the SYSCTRL0 register.
>>
>> To do so, we need to switch to the regmap API and, if possible, use the
>> parent device's regmap, which, in the case of i.MX8ULP, will be the clock
>> controller. This way, we can make sure that the clock gates and the reset
>> controller will use the same lock to perform the register R-M-W cycles.
>>
>> This change will also work fine for cases where we don't really need to
>> share the lock across multiple APIs (e.g. i.MX8MP's AUDIOMIX block
>> control) since regmap will take care of the locking we were previously
>> explicitly performing in the driver.
>>
>> The transition to the regmap API also involves some cleanup. Specifically,
>> we can make use of devres to unmap the device's memory and get rid of the
>> memory mapping-related error paths and the remove() function altogether.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 95 +++++++++++++++++----------
>>  1 file changed, 61 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index e9643365a62c..c74ce6e04177 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/of_address.h>
>> +#include <linux/regmap.h>
>>  #include <linux/reset-controller.h>
>>
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>> @@ -19,6 +20,7 @@
>>  struct imx8mp_reset_map {
>>  	unsigned int offset;
>>  	unsigned int mask;
>> +	unsigned int shift;
>>  	bool active_low;
>>  };
>>
>> @@ -26,24 +28,27 @@ static const struct imx8mp_reset_map reset_map[] = {
>>  	[IMX8MP_AUDIOMIX_EARC_RESET] = {
>>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>>  		.mask = BIT(0),
>> +		.shift = 0,
>>  		.active_low = true,
>>  	},
>>  	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
>>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>>  		.mask = BIT(1),
>> +		.shift = 1,
>>  		.active_low = true,
>>  	},
>>  	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
>>  		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
>>  		.mask = BIT(5),
>> +		.shift = 5,
> why need shift?  you can use ffs(mask) to get shift.
>
>>  		.active_low = false,
>>  	},
>>  };
>>
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>> -	spinlock_t lock; /* protect register read-modify-write cycle */
>>  	void __iomem *base;
>> +	struct regmap *regmap;
>>  };
>>
>>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
>> @@ -55,26 +60,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>>  				  unsigned long id, bool assert)
>>  {
>>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>> -	void __iomem *reg_addr = priv->base;
>> -	unsigned int mask, offset, active_low;
>> -	unsigned long reg, flags;
>> +	unsigned int mask, offset, active_low, shift, val;
>>
>>  	mask = reset_map[id].mask;
>>  	offset = reset_map[id].offset;
>>  	active_low = reset_map[id].active_low;
>> +	shift = reset_map[id].shift;
>> +	val = (active_low ^ assert) << shift;
>>
>> -	spin_lock_irqsave(&priv->lock, flags);
>> -
>> -	reg = readl(reg_addr + offset);
>> -	if (active_low ^ assert)
>> -		reg |= mask;
>> -	else
>> -		reg &= ~mask;
>> -	writel(reg, reg_addr + offset);
>> -
>> -	spin_unlock_irqrestore(&priv->lock, flags);
>> -
>> -	return 0;
>> +	return regmap_update_bits(priv->regmap, offset, mask, val);
>>  }
>>
>>  static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
>> @@ -94,6 +88,50 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
>>  	.deassert = imx8mp_audiomix_reset_deassert,
>>  };
>>
>> +static const struct regmap_config regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +};
>> +
>> +/* assumption: registered only if not using parent regmap */
>> +static void imx8mp_audiomix_reset_iounmap(void *data)
>> +{
>> +	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(data);
>> +
>> +	iounmap(priv->base);
>> +}
>> +
>> +/* assumption: dev_set_drvdata() is called before this */
>> +static int imx8mp_audiomix_reset_get_regmap(struct device *dev)
>> +{
>> +	struct imx8mp_audiomix_reset *priv;
>> +	int ret;
>> +
>> +	priv = dev_get_drvdata(dev);
>> +
>> +	/* try to use the parent's regmap */
>> +	priv->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (priv->regmap)
>> +		return 0;
>> +
>> +	/* ... if that's not possible then initialize the regmap right now */
>> +	priv->base = of_iomap(dev->parent->of_node, 0);
>> +	if (!priv->base)
>> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to register action\n");
>> +
>> +	priv->regmap = devm_regmap_init_mmio(dev, priv->base, &regmap_config);
>> +	if (IS_ERR(priv->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
>> +				     "failed to initialize regmap\n");
>> +
>> +	return 0;
>> +}
>> +
>>  static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  				       const struct auxiliary_device_id *id)
>>  {
>> @@ -105,36 +143,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  	if (!priv)
>>  		return -ENOMEM;
>>
>> -	spin_lock_init(&priv->lock);
>> -
>>  	priv->rcdev.owner     = THIS_MODULE;
>>  	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
>>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>>  	priv->rcdev.of_node   = dev->parent->of_node;
>>  	priv->rcdev.dev	      = dev;
>>  	priv->rcdev.of_reset_n_cells = 1;
>> -	priv->base            = of_iomap(dev->parent->of_node, 0);
>> -	if (!priv->base)
>> -		return -ENOMEM;
>>
>> +	/* keep before call to imx8mp_audiomix_reset_init_regmap() */
>>  	dev_set_drvdata(dev, priv);
>>
>> +	ret = imx8mp_audiomix_reset_get_regmap(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get regmap\n");
>> +
>>  	ret = devm_reset_controller_register(dev, &priv->rcdev);
>>  	if (ret)
>> -		goto out_unmap;
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to register reset controller\n");
>>
>>  	return 0;
>> -
>> -out_unmap:
>> -	iounmap(priv->base);
>> -	return ret;
>> -}
>> -
>> -static void imx8mp_audiomix_reset_remove(struct auxiliary_device *adev)
>> -{
>> -	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(&adev->dev);
>> -
>> -	iounmap(priv->base);
>>  }
>>
>>  static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>> @@ -147,7 +175,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>>
>>  static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
>>  	.probe		= imx8mp_audiomix_reset_probe,
>> -	.remove		= imx8mp_audiomix_reset_remove,
> cleanup imx8mp_audiomix_reset_remove need seperate patch.


as things stand now, this bit belongs in the same patch as the switch to the regmap

API because of the introduction of imx8mp_audiomix_reset_get_regmap(), which

uses devres. This makes the remove() function incorrect and, thus, needs to be dropped.


since the cleanup is quite trivial, I don't think this would justify purposely

making imx8mp_audiomix_reset_get_regmap() not use devres in this patch

and then transitioning to it in a subsequent patch.


>
> Frank
>
>>  	.id_table	= imx8mp_audiomix_reset_ids,
>>  };
>>
>> --
>> 2.43.0
>>

