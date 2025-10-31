Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1079CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCQNcQncDV0pig2wQUB4eR+mXGNrWHfstydWTHE+XYM=; b=GDrniPS4hJc1T9Usm0JEYtrERj
	RSFiQHtDVrEXDhmsHH0N+fgfWtjbewLEIP5oq8PuWiEVz05kbpvDHaDTtBmFzDf8mMat6YJsWojId
	HUuGJfAEzfrJebly3Px/lHYtyQPPKBtd//yfTjayNuCKcaXM9P8L+Wc8P8Cgue20jGK3f6hKu1/Jj
	7Vh8gWSBGuVR5vsb2vnNmTyDwfNa8aXzDXGwq16L7WgpqxV1lRrkqwPEWQicPN+lz68FnIkwQG4s0
	cTZDSRJoRmA3/rD5vOsaBbWDqBdFs6syaLoJTKfs+GOtqeSwNC0sqHvZoih4Gg2Ou5dC31WgKWgyY
	pSMxbFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnhR-000000062Wn-1kKN;
	Fri, 31 Oct 2025 11:53:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnhO-000000062Vd-1tQA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:53:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so3327364a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761911620; x=1762516420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCQNcQncDV0pig2wQUB4eR+mXGNrWHfstydWTHE+XYM=;
        b=caML6EUL/P4jTKEcsGQ3HF694yow3wi0QWlw2usrSBg63S46a6OScYlIUdARWSJVI7
         tgKBp677NlVw0K16qeGEOQBHXos9INk4kuXD6ABWsZjmwrhAWLTzj41sNAFR4ezN2rUw
         RxkTW/mbhA4M/GNkvz4vytx9EHeeB9nlbTmqw48vKV1I9MqLrXpa835TqjsNS3KQw/dI
         usI9NDIcyXS7w+bXP8UzIiEhwCm5cazsSPzR6223yZDO1Mq/LLp9RuRzxqlgsaFDCiK2
         UnpfsO5kD6xP5H/qZm6apkNiRLOPxjCy/PUCnQdWu+kVUHYWzUv5AQPCMi5NITA6iwEY
         /e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911620; x=1762516420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCQNcQncDV0pig2wQUB4eR+mXGNrWHfstydWTHE+XYM=;
        b=saQ2BeP6Ub1CnY0ia13IRoEvQK3tqeExKCwS/7E0uiRkhBRxAydcCgPddxluSi/csj
         3LRTs8aXOch6R2T2pjqgyjNmZ86WGOP4CcsxqsO9m1gXbiV+tpasnKl0vPOAu+Wz9n5o
         r8uoW0O33sUgDnO5O+5coU2/YSz8bMugjLOniCP6tHb7Zy/TYj5EDDFdObGaumIYLa1C
         yiHUAc2WM1DQ3NJlQMx1ZI/STgJdofFQSkZOi52jQa+UujYa9IbWa3/YV0iPTCYvGlC0
         Bg1qDDewjzbiEQ3XiDGs2GMr+wOgQHa3O3gMfWEx2PBlPdpMAKM8zvG1VbDWBYgMwDHq
         ISyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGzvlWvdgM18/9CxXOcmlmChPxmgwa9I99pAXAA5H5YJyK+kkHe9+RIfyg0jHUJSuyoYdWEh82MChqJ4qFwq1+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5iXYq/EuzcS4V9A0OIxhPsDYXEzRPWto+LBrg2FxWKDX9NkVa
	rgMuaLhPKWfGMrRUrSKmCVnTkTYlL8hewBOwr16ocJ+WLtUlPjje+HCo
X-Gm-Gg: ASbGncuoXHHWS4uOdxzT9DkLTQhPG2Mis+Mv6NJxA6DAwU95+DJcup6h9dEoZH1oj0x
	FaBYgf655hqXgxcLdyxw+3o42VkfGNjf5lun6Q9idjNQJExn6E3smalwrHrKKeSpKf6L++VFwTw
	YRCQQpswMbKQcsJpMh7eAr5A+EQgJgWu9Z86k42MyOc2XAI4uOakjnE9aGBWA/rmcqJtFuvg1wJ
	A5tIFxdvIYQ6vie0Gz5thxAHsA8jnl+50ttUNnb/agJhNhTEeDOU/WxSWeQ3JKVxOrUD8JnThva
	3o3cZGEx+MnF20fe2QBOUbWY7aUToRiP/5I9I+fSUKZE6CkQx+9UTvdMsfwzLn7YqxVx3FraIo6
	z2lHbAaxuH93MaUWcqGx+zmZwo+owIq39SCyN9HSW23SI9nY/ue/+dyPKVb1PurkEXnHJhq4Nv9
	jiVHBMgb/YFiYJ8PVdyQhEULY2e3xWz+HmdVSKJpgKaGk=
X-Google-Smtp-Source: AGHT+IGxIlFPS8hS595Xkfumk9wGbCOJQPHRYRtPAuDqD8SnR4VGwjFq2oqrDoT+nBuHOhjxEg9Krw==
X-Received: by 2002:a05:6402:1e94:b0:640:7529:b8b9 with SMTP id 4fb4d7f45d1cf-640770820e2mr2209238a12.30.1761911620065;
        Fri, 31 Oct 2025 04:53:40 -0700 (PDT)
Received: from [10.25.210.164] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b448ed9sm1418859a12.35.2025.10.31.04.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:53:39 -0700 (PDT)
Message-ID: <19ef0124-9a61-455d-8402-70e840309cf5@gmail.com>
Date: Fri, 31 Oct 2025 04:53:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] reset: imx8mp-audiomix: Switch to using regmap API
To: Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
 <20251029135229.890-6-laurentiumihalcea111@gmail.com>
 <105ed81ed67d8e4cacb63a83a606e206a4d6f310.camel@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <105ed81ed67d8e4cacb63a83a606e206a4d6f310.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_045342_536155_E7504446 
X-CRM114-Status: GOOD (  30.05  )
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


On 10/30/2025 6:06 AM, Philipp Zabel wrote:
> On Mi, 2025-10-29 at 06:52 -0700, Laurentiu Mihalcea wrote:
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
> Drop base as well, better let devres handle this.
>
> [...]
>
>> +/* assumption: registered only if not using parent regmap */
>> +static void imx8mp_audiomix_reset_iounmap(void *data)
> Pass base instead of dev.


ACK. Will need some extra casts/annotations though as sparse will definitely

not be happy with this.


>
>> +{
>> +	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(data);
>> +
>> +	iounmap(priv->base);
> 	void __iomem *base = data;
>
> 	iounmap(base);
>
>> +}
>> +
>> +/* assumption: dev_set_drvdata() is called before this */
> Why not just pass priv instead of dev?
>
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
> Make base a local variable ...
>
>> +	if (!priv->base)
>> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, dev);
> ... and pass it as data instead of dev.
>
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
> Not needed if priv is passed to it directly.


right, somehow I forgot that rcdev holds a pointer to our "struct device" even though it's right there....

will make the change, thanks!


>
> regards
> Philipp

