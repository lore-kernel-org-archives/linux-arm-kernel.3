Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0D0CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 20:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUleLLa8ND574xXra2RGEF6RaI7Xj9xpL5ZJVlCE2lI=; b=p8GWGN8xba7XzDssovIemk+q1G
	yWvQfIGJhDsJU1ZTUVSqFYZ8im6aA7kXJ1QomAb0BWMS0HeLC/H3JbGN92JTX2WR6t1MqgrbwUA01
	KOJU17evdOAUL3xizs8APxU3qUTii6VOE7Iu5/YGwWydVmwYNf41cxUCN2NYfElvbh9Grrhd84I1G
	iK2JICNg/Ghk1HNItBFI1hHaGkOMNY9rJDbX6sCH9Z/3+CDI98pvhj59HeW78A37LlG/6yEFIsgBG
	mK6mD10g3ZaGu88TjVNeF+NUL7ZDZ2EfoccS6eVPytSXwdq6tPLmEXvajrDiylYlhau6TdteSqXY5
	qpn7/edA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vED8e-00000002rPc-2aNw;
	Wed, 29 Oct 2025 20:51:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vED8b-00000002rOZ-47Ue
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 20:51:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso995869f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 13:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761771080; x=1762375880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUleLLa8ND574xXra2RGEF6RaI7Xj9xpL5ZJVlCE2lI=;
        b=PiKxOEzsHMo/9xx+0bhzp71cOoUskO/bbvnezF8RoMhLcrfouxLp4Ovu2UBFuhh4Hn
         o3FjKAB7I411rXIx4mY376JFGfCkdKdY83T7sDrpLM/ifj2odhTI5XuOVHLm71wKs4z5
         /5UWdcNMENPm7spJQvLkilrymUqb3NOL1oFV+rhEPq8IQvrgeDe9zwxR5nV+AC+9IKNR
         iRAWyq9aH2/e1JI6r2SZUnvI9NpQh7ipFuEwLqi2wEuEcldCtMKfobCHP8qYJPuwalI6
         td3OufflwQTzyYF4GvT6DTgDC7HbnS0OR77eqK1WLXkVcXKnXWEy/kaE+SbKgbenuNis
         /G7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761771080; x=1762375880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUleLLa8ND574xXra2RGEF6RaI7Xj9xpL5ZJVlCE2lI=;
        b=BAdBwYns9iZt1S6BlOxX7w3JQC/TNxk+z7UycKEHChVsvTMIhyfO4XZncFh6sQZnzr
         EC57MpGhEA1b1q0zOtkCXVr2IYeubb+E9xqdj9PsBIaORahZbOk6UplEKTg/OVMAFyC8
         nMNJ2FVXQ/iNs+woHu+sPLfIzkHJcTuRQTIkOvaZraar6xrXExXBlIDp7g335UCZzOiM
         od4cCrs8v4geFzv3dOQMQ81kz7JmpWp4vorAVTwlLwqvpg+hdhqtwnc65K0BrigFImsj
         WRX/o6PznpsxCIKSoGmpvdB2ZWPGm7xjcmwmQ7sJJiG6OcBSgLoiUFj61fD+SIeCOumO
         rbVw==
X-Forwarded-Encrypted: i=1; AJvYcCVZtWl8xjA1QwCXGYFD/09M51xjcy/+pvUYwLDc60b3WxHeT0fvkQC/OIqt/1mxqoudU5+olTefsS4yeougb9uH@lists.infradead.org
X-Gm-Message-State: AOJu0YytJoZfHu7uYfLC6zwr1mDLHnmfgfcK1m7PzlsUkiI+LEatnVyy
	I19E08ixsIKVZfBMSAjNkO8GkJjIsaET6jnBNtgxJC+6bIYc9EeJsAPe
X-Gm-Gg: ASbGncsKfYpokTcplrMAK2ctqwAptWeN3IWCcsv405j+5eQP6Pf3tDPIZWkZP9+LmUc
	qxgl5HdmzT6AE5JDcmWKEtRObagd6mi5yyO9qQn8HWiLEKzJIInEAS4CrqboxXnNk7y7gqgxrsG
	R1AifNvFtfzOiKUR9iOpk0OU3jfHYlmCnf+hEj+1bv0GzLB60gJaTkqcofuCsyB2TVSEPGQPl9m
	NeCbBOCf9NAjQBTZ2/evAoZ/0ak1vVXb4yKMA7dbjRUnN0I5ue5QgaMNBeEqrWW5l5euk5HBu9D
	MI/SXDke9bEVcwPyoDHxOv+nEgZjLZL/pdTo47RP7GR++LspJHBUgOCF9VAGP31RjSSfqazE7X3
	70m4aqQhKpDCBfNlUhwfH0hkshoBjt+7GoMz8DTHQJRSdvjhP6TDqmL8NGSFRSilQSOMdVYKf9v
	bD3xrfZLwoLG65pv4N0JTW/MirwO0Rs1s=
X-Google-Smtp-Source: AGHT+IFeQbHeDjZUFHA43UkkMBSaS+cIVCuepwH/xR58asrUxhv9+gT0KhY234gaLSA+Vobfb3QPkw==
X-Received: by 2002:a05:6000:3110:b0:426:ff91:2f25 with SMTP id ffacd0b85a97d-429b4c81d13mr953533f8f.21.1761771079656;
        Wed, 29 Oct 2025 13:51:19 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289b3956sm2680805e9.10.2025.10.29.13.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 13:51:19 -0700 (PDT)
Message-ID: <c8fdbb57-d152-4c85-be06-cfbc7e0b1550@gmail.com>
Date: Wed, 29 Oct 2025 22:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] reset: imx8mp-audiomix: Switch to using regmap API
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
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
 <20251029135229.890-6-laurentiumihalcea111@gmail.com>
 <aQJCtZjAGiQdzfDz@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aQJCtZjAGiQdzfDz@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_135122_102826_40C005FC 
X-CRM114-Status: GOOD (  32.99  )
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


On 10/29/2025 6:37 PM, Frank Li wrote:
> On Wed, Oct 29, 2025 at 06:52:26AM -0700, Laurentiu Mihalcea wrote:
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
> Can you simpifly commit message? The key points are 1: lock, 2: nice API.
> like regmap_update_bits().
>
> Switch to using the regmap API to simplify register access. The regmap
> infrastructure provides synchronized register access and richer helpers
> such as regmap_update_bits().


this change isn't about simplifying the register access, nor is it about synchronizing

the register access. Previous version was already doing that.


the key takeaway here is we want to have the SAME lock used across different APIs.

regmap is a way to do that.


>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 91 +++++++++++++++++----------
>>  1 file changed, 57 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index e9643365a62c..3f6d11270918 100644
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
>> @@ -42,8 +43,8 @@ static const struct imx8mp_reset_map reset_map[] = {
>>
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>> -	spinlock_t lock; /* protect register read-modify-write cycle */
>>  	void __iomem *base;
>> +	struct regmap *regmap;
>>  };
>>
>>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
>> @@ -55,26 +56,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
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
>> +	shift = ffs(mask) - 1;
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
>> @@ -94,6 +84,50 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
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
> Not sure why need map parent devices's ioresource here. You'd better use
> regmap_attach_dev() at parent devices, so dev_get_regmap() will get it.


why would we want to force the parent device to use regmap if it doesn't need to?


>
> Frank
>
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
>> @@ -105,36 +139,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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
>> @@ -147,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>>
>>  static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
>>  	.probe		= imx8mp_audiomix_reset_probe,
>> -	.remove		= imx8mp_audiomix_reset_remove,
>>  	.id_table	= imx8mp_audiomix_reset_ids,
>>  };
>>
>> --
>> 2.43.0
>>

