Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB418C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oketx7tDIhcuG5rUx6z6XVclJQ29lq6S1BBw1NvvIew=; b=hpVReBB6OraGoOrCvIkMoWj4BN
	uEimcq/777HHsWw13bstcWcFgBIds91yv3N242+4+MzQLg/O6dkN4F4DoJp+1OO3VagLE3J+2qc8T
	T/P1ajX0jqESMhIUgSlN67+wbvll3lR7lKPWR7fiUIKabWXf81e+8P3y4zV79TUeh2ClKuNjPrUhO
	g3V8q1bzrRBtkZktk93KMnlpt7OpgTOY05UKsOoyNqfNjB3ahyA8JKyt0dPJIvnvf6y9iMf4+PvsZ
	yjBIMKOvSJgbg2VnaNqeWNEEeg3HrkJzGLCHSnRlAR/bJKfC/TZJqVce1DN1QRVNDaAgO6/n9lOgw
	HEV1BRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkqS-00000004N5X-1dB2;
	Wed, 05 Feb 2025 19:13:56 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkp2-00000004Mej-2hHr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:12:30 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso33592866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 11:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738782746; x=1739387546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oketx7tDIhcuG5rUx6z6XVclJQ29lq6S1BBw1NvvIew=;
        b=Nbd8v5RTs54W84mIbksOByIIufFdC3jtCtH8coviXHwoiORAx1eVkCWx+r9zK4Gr0y
         3YA9rjcfb8w9m7HVbE7+TOeyyHnMHFbLzy0VcvN+bSUK+TtDr1g3L8fvNG7G4Z5361UZ
         sUMk4wBQhDR20r68FZLvB/DVFoeIAyQ1g97MSH0+tSdulAAxMJvvB5jTK//QhFYLCRre
         5c1yqJ39bzDqHSjfkCW6otvtskNqNMEMwciD2ACj41j5YZMB1/KwMdzy9puint+J4w3b
         mo/kWQxQRpCbIfky2y1b4NkGcB9vJS6mn0CzEpjexQNwHbUeETUoLULb4RX0WhgJ7JB6
         p4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782746; x=1739387546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oketx7tDIhcuG5rUx6z6XVclJQ29lq6S1BBw1NvvIew=;
        b=Lp1d+QBx7VP6ziB8FJ0hYjxn87AjYlILkadfICQAPj3522XahTgqG2B7qU7k/GdQP7
         cPNqiNfG7W+2QB3ib2DfkACH2T5hUsjaplJasCDd0mXaFdPC2MCLXxoCn127ozR81aCs
         a1izRDYkZjkxHQqmiP0wDft5VRJ9+YMTCML7w5v9ytitHfMVluxTPmk79KQlzLUF0Zox
         x/4LG3+tFySQR2NT6wAE/ImCyx/lce03IJOpsqIN/y2xgzrBboT8oMkuKndUT1mgbhou
         b+dAv1n+6EVSCcYUUkFlwWJCWwLi4rePlGUS6eQEo62wRm0bbQdL6dekQ5e3Q/yIl8RF
         9edA==
X-Forwarded-Encrypted: i=1; AJvYcCWl7+irHYl1xoXn/AHSx92RdFSC/Fd1T6GZO+Gfk++XcHvdK++Y9Q2BhQXfFli6NIzhHrc28Ktbc7szGOi8qpZR@lists.infradead.org
X-Gm-Message-State: AOJu0YyXo/7muuYTUjF7vZxrfj+BX0ogedTGy7JUSkMOsnjEd26LngRf
	rIUxAUU5dYdYRwCgQqPzECKeCs7IEpBspdkKuoqfrckPn4WDgnFa
X-Gm-Gg: ASbGncvsPWPs2mYjKBI7fIpGNPXJGPzzToIxrR9vbqieuYlBF+3W3eunwDHz3po6L6q
	q5LQUvfHS9dqS7aZScFB+oKyBJ2/0MkPdBp4t1EEWyHci/5wlny5y1nr4EjQ9E5fhXA+TwjX8zG
	eis0QPxuTbsypIBQ+DQa5B8KGLcKZGZ+7HzjOpi6FQEPOqckdx2CbyQwQ+XPlG5WYf3OVvXaXgv
	wyLyxr6WrhpCPs5U6gOyILBG7/ur1LvKu2j14BoBi7rQqlMcAZKEuqZepLCVI7kl75Du5lWh0sH
	vE0MXmFP+NVzm9vVTWlLS2Clx+2dLAGN5lnJHsfBVLsgpgkbXn+An1M=
X-Google-Smtp-Source: AGHT+IGpray5ALEav7UkGYXtShsXqdt+BKxXBeppZNjOdLOI9uz6smW+xBNGlpUOsTJ1/IZIjY5H5g==
X-Received: by 2002:a17:907:1c29:b0:ab6:dd6b:2a3 with SMTP id a640c23a62f3a-ab75e248c8dmr387817266b.22.1738782746161;
        Wed, 05 Feb 2025 11:12:26 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcebe59ff3sm269102a12.62.2025.02.05.11.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:25 -0800 (PST)
Date: Wed, 5 Feb 2025 20:12:23 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 7/7] regulator: bcm590xx: Add support for BCM59054
 regulators
Message-ID: <Z6O4F1pCqwK2774W@standask-GA-A55M-S2HP>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-7-bbac52a84787@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-bcm59054-v3-7-bbac52a84787@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111228_684643_AC1DDF9E 
X-CRM114-Status: GOOD (  20.37  )
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

Hi Artur,

some notes below.

On Fri, Jan 31, 2025 at 07:13:55PM +0100, Artur Weber wrote:
> The BCM59056 and BCM59054 are very similar in terms of regulators. Add
> the register definitions for the BCM59054 and enable support for it in
> the driver.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

[snip]

> +	{
> +		.type = BCM590XX_REG_TYPE_LDO,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_LDO_DESC(MICLDO, micldo, ldo_1_table),
> +		},
> +	},

Downstream has MICLDO fixed at 1.8V.
Not sure if that isn't just some vendor hack though :/

https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/drivers/regulator/bcmpmu-rgltr-bcm59xxx.c#L83

> +
> +	{
> +		.type = BCM590XX_REG_TYPE_LDO,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_LDO_DESC(USBLDO, usbldo, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_LDO,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_LDO_DESC(VIBLDO, vibldo, ldo_2_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(CSR, csr, dcdc_csr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(IOSR1, iosr1, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(IOSR2, iosr2, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(MMSR, mmsr, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(SDSR1, sdsr1, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(SDSR2, sdsr2, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(VSR, vsr, dcdc_vsr_ranges),
> +		},
> +	},

VSR seems to be different between BCM59054(A0?) and BCM59054A1.
These are the A1 ranges.
Should we differentiate between the two versions, same as downstream?

https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/drivers/regulator/bcmpmu-rgltr-bcm59xxx.c#L736

> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(GPLDO1, gpldo1, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(GPLDO2, gpldo2, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(GPLDO3, gpldo3, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(TCXLDO, tcxldo, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(LVLDO1, lvldo1, ldo_1_table),

According to downstream, this should be ldo_3_table.

https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/drivers/regulator/bcmpmu-rgltr-bcm59xxx.c#L683

> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(LVLDO2, lvldo2, ldo_3_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_VBUS,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_REG_DESC(VBUS, vbus),
> +			.ops = &bcm590xx_ops_vbus,
> +			.n_voltages = 1,
> +			.fixed_uV = 5000000,
> +			.enable_reg = BCM59054_OTG_CTRL,
> +			.enable_mask = BCM590XX_VBUS_ENABLE,
> +		},
> +	},
> +};
> +
>  static int bcm590xx_probe(struct platform_device *pdev)
>  {
>  	struct bcm590xx *bcm590xx = dev_get_drvdata(pdev->dev.parent);
> @@ -487,8 +864,21 @@ static int bcm590xx_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	pmu->mfd = bcm590xx;
> -	pmu->n_regulators = BCM59056_NUM_REGS;
> -	pmu->regs = bcm59056_regs;
> +
> +	switch (pmu->mfd->device_type) {
> +	case BCM59054_TYPE:
> +		pmu->n_regulators = BCM59054_NUM_REGS;
> +		pmu->regs = bcm59054_regs;
> +		break;
> +	case BCM59056_TYPE:
> +		pmu->n_regulators = BCM59056_NUM_REGS;
> +		pmu->regs = bcm59056_regs;
> +		break;
> +	default:
> +		dev_err(bcm590xx->dev,
> +			"unknown device type, could not initialize");
> +		return -EINVAL;

Missing a '\n' in the error message.
Could use dev_err_probe as well. Maybe in other places in the driver too.

Regards,
Stanislav

> +	}
>  
>  	platform_set_drvdata(pdev, pmu);
>  
> 
> -- 
> 2.48.1
> 

