Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FD6C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/k3taZkFmb1E65Ysug6YAb3iu1BOXVPDS/i79D+w5w4=; b=vVsBlL5TziisKfqZfGCmjap9Lh
	o8bf5v/z9/nRUL9J8QN7BNtmqnqh9KcVYE53I4D75f4LfYq36U8SW7FRxIKZjbDSP2WOlhm70wZea
	Q5j9gWID/T+pcORrygwcH6HhdIvZyIQvXKjOd2QEwk5+Nf47ERK6ebUYf+EJsqKS/XLxXTcqQbvwv
	uD7jUHp4NkpEjJTX+vpz8uvZSlBApQpUB+4CQNTOyI/fV4RpQEdC0DrASQCEawAzfB19OgiicpcfH
	dAg0r0wnr4rvcfucchNEpy34keEBq8QE4LORa3G0RSsigSWroPJFj+bxLnC5NnSO5WGmZyEC5nYaW
	OvRvAMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KbD-00000008VLA-40AE;
	Tue, 22 Apr 2025 20:52:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7If8-00000008Dg1-0ETU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 18:48:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43690d4605dso45481735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 11:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745347684; x=1745952484; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/k3taZkFmb1E65Ysug6YAb3iu1BOXVPDS/i79D+w5w4=;
        b=YcHJWKYj0LJ5/uOnxgSPc+13l42Kr/oz1ejAo6E/qTxkh7TsZoVfK+Cr++JNV0d8eq
         kebp7cumrk3X9mWsndG1P57mr+Pkd+yb5StcJyx9/xeYGrwRCZ/NlcrdkLbiIM9QKuE5
         9xLuJV6un9L4+ZXADEfd7Pq+/XyPzXvefHPrbjJgv49f14pEwuFlaaA+gAHgvmPhAaGe
         sSajWdFtH9WHBfOeDYLKu6H7VCqVEXjKxjZbpkDAxGO8Do0KlS3MjGQlpJjYZrNtOQ3j
         ZHDRHKiD6YraOcNgeH7oQ/Q30RAVG7XNd1Rmy6qkKdP5RwXywEuBhnRr6YjWfpNhTgID
         7maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347684; x=1745952484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/k3taZkFmb1E65Ysug6YAb3iu1BOXVPDS/i79D+w5w4=;
        b=CDsV0ZnygsMqRmaCvQQvafZUJCKtfqgvlQ06GUbu8hgjmi/sBYJSdpVsiEFUeWjzg0
         mN1qWxX5HzMnPB+4QuQrjTCZlj4fP80vREMCd2cmtvIPHEWJL6lrg0FQHqZwBRbxEIZs
         hW5MgkUJocaKwmLAk7anUWiMUJE1Kl8NfZEdUKngOsHqQaIiJDDwYhG0flb8aHpZq8BT
         AjVfP8rvINBNQw776SwwHKdGlBSvN6+X6M+PcTPonTtFS536zedzWa0/1+kTSb0pUOeT
         Nx7t7JJshsFtKfH771d23+gpfmCHhUrpw1AMYGLGhrFCnwby4wd1HtJcZUlNcWxZWaLk
         7aGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUglhkNP+e5nyjTtqRxGy7pP9VNlNxq5lGvWJyGbq8Nch+h5NOxLdCMnQMW4RP6yZRqgM8NaIjEFWmFyujTtxzY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0d6eexR3fFASSXjbVyJ1EYYKvWD+SOsstjKGe7Vc7zgL1xxo6
	WoD0ytNjR6GDBLgl5tE/t40x2sKlfsNJqr0+CoprRKC6GY1bscDb
X-Gm-Gg: ASbGncuhBtKNp1Rq5kVrX7uflXvpro4NEU83FsG62CxBrxBgF+O87mn+szIc3iGcNzm
	o4yieW8plMofSzGPUlh1ZpUga+faAafJkQyuwQg6DCaWGnQJjTatGnXg89fLNP2yOPwp79E3smO
	iPwpTaXBq5GW22s55/bCHwVXp7zf77zz4ph3ulkAxqPdkePD3E630BdR8o1IVum0jdhFg/Hr/C5
	8v/0FZzSbTi86Eqx5OD/NMmpS34eJgqjr6kVpD75c+4c7gnTqO4m34NtQOPOxr8edSQiKk5p5UP
	FM7dJiO/4viA0jIYe+UjZ0AUlZUcs4mbNjvHYz4=
X-Google-Smtp-Source: AGHT+IG2j3VHoVL2M2AJ10p+sbssgxi4HaLuJQ31gFdOBcHjdA9awEAW09YZ0ryNYevSH+x3j+8Hxg==
X-Received: by 2002:a05:600c:3583:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-4406abb3bd9mr125898075e9.19.1745347683820;
        Tue, 22 Apr 2025 11:48:03 -0700 (PDT)
Received: from legfed1 ([2a00:79c0:6a3:c300:22ea:3d6a:5919:85f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acc9esm187337825e9.13.2025.04.22.11.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:48:03 -0700 (PDT)
Date: Tue, 22 Apr 2025 20:48:01 +0200
From: Dimitri Fedrau <dima.fedrau@gmail.com>
To: t.antoine@uclouvain.be
Cc: Rob Herring <robh@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/5] power: supply: add support for max77759 fuel gauge
Message-ID: <20250422184801.GA395455@legfed1>
References: <20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be>
 <20250421-b4-gs101_max77759_fg-v3-2-50cd8caf9017@uclouvain.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-b4-gs101_max77759_fg-v3-2-50cd8caf9017@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_114806_102572_9EDF050E 
X-CRM114-Status: GOOD (  45.52  )
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

Hi Thomas,

On Mon, Apr 21, 2025 at 08:13:33PM +0200, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
> 
> The interface of the Maxim MAX77759 fuel gauge has a lot of common with the
> Maxim MAX1720x. A major difference is the lack of non-volatile memory
> slave address. No slave is available at address 0xb of the i2c bus, which
> is coherent with the following driver from google: line 5836 disables
> non-volatile memory for m5 gauge.
> 
> Link: https://android.googlesource.com/kernel/google-modules/bms/+/1a68c36bef474573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
> 
> Other differences include the lack of V_BATT register to read the battery
> level. The voltage must instead be read from V_CELL, the lowest voltage of
> all cells. The mask to identify the chip is different. The computation of
> the charge must also be changed to take into account TASKPERIOD, which
> can add a factor 2 to the result.
> 
> Add support for the MAX77759 by taking into account all of those
> differences based on chip type.
> 
> Do not advertise temp probes using the non-volatile memory as those are
> not available.
> 
> The regmap was proposed by André Draszik in
> 
> Link: https://lore.kernel.org/all/d1bade77b5281c1de6b2ddcb4dbbd033e455a116.camel@linaro.org/
> 
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
>  drivers/power/supply/max1720x_battery.c | 270 ++++++++++++++++++++++++++++----
>  1 file changed, 237 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/power/supply/max1720x_battery.c b/drivers/power/supply/max1720x_battery.c
> index cca5f8b5071fb731f9b60420239ea03d46cb1bf3..969d3a7c2baa7e1d23c5175942d975b277c8554c 100644
> --- a/drivers/power/supply/max1720x_battery.c
> +++ b/drivers/power/supply/max1720x_battery.c
> @@ -37,6 +37,7 @@
>  #define MAX172XX_REPCAP			0x05	/* Average capacity */
>  #define MAX172XX_REPSOC			0x06	/* Percentage of charge */
>  #define MAX172XX_TEMP			0x08	/* Temperature */
> +#define MAX172XX_VCELL			0x09	/* Lowest cell voltage */
>  #define MAX172XX_CURRENT		0x0A	/* Actual current */
>  #define MAX172XX_AVG_CURRENT		0x0B	/* Average current */
>  #define MAX172XX_FULL_CAP		0x10	/* Calculated full capacity */
> @@ -50,19 +51,32 @@
>  #define MAX172XX_DEV_NAME_TYPE_MASK	GENMASK(3, 0)
>  #define MAX172XX_DEV_NAME_TYPE_MAX17201	BIT(0)
>  #define MAX172XX_DEV_NAME_TYPE_MAX17205	(BIT(0) | BIT(2))
> +#define MAX77759_DEV_NAME_TYPE_MASK	GENMASK(15, 9)
> +#define MAX77759_DEV_NAME_TYPE_MAX77759	0x31
>  #define MAX172XX_QR_TABLE10		0x22
> +#define MAX77759_TASKPERIOD		0x3C
> +#define MAX77759_TASKPERIOD_175MS	0x1680
> +#define MAX77759_TASKPERIOD_351MS	0x2D00

I think it would be more readable if MAX77759_ defines are separated to
the MAX172XX defines instead of mixing them up.

>  #define MAX172XX_BATT			0xDA	/* Battery voltage */
>  #define MAX172XX_ATAVCAP		0xDF
>  
>  static const char *const max1720x_manufacturer = "Maxim Integrated";
>  static const char *const max17201_model = "MAX17201";
>  static const char *const max17205_model = "MAX17205";
> +static const char *const max77759_model = "MAX77759";
> +
> +enum chip_id {
> +	MAX1720X_ID,
> +	MAX77759_ID,
> +};
>  
>  struct max1720x_device_info {
>  	struct regmap *regmap;
>  	struct regmap *regmap_nv;
>  	struct i2c_client *ancillary;
>  	int rsense;
> +	int charge_full_design;

Don't see charge_full_design is used somewhere besides reading it from
device-tree and it isn't part of the bindings. If not needed, remove it.

> +	enum chip_id id;
>  };
>  
> 

[...]

> +static int max172xx_cell_voltage_to_ps(unsigned int reg)
> +{
> +	return reg * 625 / 8;	/* in uV */
> +}
> +
>  static int max172xx_capacity_to_ps(unsigned int reg,
> -				   struct max1720x_device_info *info)
> +				   struct max1720x_device_info *info,
> +				   int *intval)
>  {
> -	return reg * (500000 / info->rsense);	/* in uAh */
> +	int lsb = 1;
> +	int reg_val;

The naming of reg_val is somehow confusing because of reg. Better rename
it to something like reg_task_period or similar and reg_val should be of
type unsigned int. 

> +	int ret;
> +
> +	if (info->id == MAX77759_ID) {
> +		ret = regmap_read(info->regmap, MAX77759_TASKPERIOD, &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		switch (reg_val) {
> +		case MAX77759_TASKPERIOD_175MS:
> +			break;
> +		case MAX77759_TASKPERIOD_351MS:
> +			lsb = 2;
> +			break;
> +		default:
> +			return -ENODEV;
> +		}
> +	}
> +	*intval = reg * (500000 / info->rsense) * lsb;	/* in uAh */
> +	return 0;

nit: add newline before return.

>  }
>  
>  /*
> @@ -306,6 +420,28 @@ static int max172xx_temperature_to_ps(unsigned int reg)
>  	return val * 10 / 256; /* in tenths of deg. C */
>  }
>  
> +static const char *max1720x_devname_to_model(unsigned int reg_val,
> +					     union power_supply_propval *val,
> +					     struct max1720x_device_info *info)
> +{
> +	switch (info->id) {
> +	case MAX1720X_ID:
> +		reg_val = FIELD_GET(MAX172XX_DEV_NAME_TYPE_MASK, reg_val);
> +		if (reg_val == MAX172XX_DEV_NAME_TYPE_MAX17201)
> +			return max17201_model;
> +		else if (reg_val == MAX172XX_DEV_NAME_TYPE_MAX17205)
> +			return max17205_model;
> +		return NULL;

nit: return NULL in else case.

> +	case MAX77759_ID:
> +		reg_val = FIELD_GET(MAX77759_DEV_NAME_TYPE_MASK, reg_val);
> +		if (reg_val == MAX77759_DEV_NAME_TYPE_MAX77759)
> +			return max77759_model;
> +		return NULL;

nit: return NULL in else case.

> +	default:
> +		return NULL;
> +	}
> +}
> +
>  /*
>   * Calculating current registers resolution:
>   *
> @@ -390,19 +526,31 @@ static int max1720x_battery_get_property(struct power_supply *psy,
>  		val->intval = max172xx_percent_to_ps(reg_val);
>  		break;
>  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> -		ret = regmap_read(info->regmap, MAX172XX_BATT, &reg_val);
> -		val->intval = max172xx_voltage_to_ps(reg_val);
> +		if (info->id == MAX1720X_ID) {
> +			ret = regmap_read(info->regmap, MAX172XX_BATT, &reg_val);
> +			val->intval = max172xx_voltage_to_ps(reg_val);
> +		} else if (info->id == MAX77759_ID) {
> +			ret = regmap_read(info->regmap, MAX172XX_VCELL, &reg_val);
> +			val->intval = max172xx_cell_voltage_to_ps(reg_val);
> +		} else
> +			return -ENODEV;
>  		break;
>  	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
>  		ret = regmap_read(info->regmap, MAX172XX_DESIGN_CAP, &reg_val);
> -		val->intval = max172xx_capacity_to_ps(reg_val);
> +		if (ret)
> +			break;

I would keep max172xx_capacity_to_ps as it was before and add the
calculation for the MAX77759 after handling the MAX1720X case. Creating
a function max77759_capacity_to_ps that further processes the value
calculated by max172xx_capacity_to_ps or just inline this code.
Otherwise the naming of the function is somehow confusing.

> +		ret = max172xx_capacity_to_ps(reg_val, info, &val->intval);
>  		break;
>  	case POWER_SUPPLY_PROP_CHARGE_AVG:
>  		ret = regmap_read(info->regmap, MAX172XX_REPCAP, &reg_val);
> -		val->intval = max172xx_capacity_to_ps(reg_val);
> +		if (ret)
> +			break;
> +

Same as above.

> +		ret = max172xx_capacity_to_ps(reg_val, info, &val->intval);
>  		break;
>  	case POWER_SUPPLY_PROP_TIME_TO_EMPTY_AVG:
>  		ret = regmap_read(info->regmap, MAX172XX_TTE, &reg_val);
> +		pr_info("RAW TTE: %d", reg_val);

Remove pr_info.

>  		val->intval = max172xx_time_to_ps(reg_val);
>  		break;
>  	case POWER_SUPPLY_PROP_TIME_TO_FULL_AVG:
> @@ -423,17 +571,15 @@ static int max1720x_battery_get_property(struct power_supply *psy,
>  		break;
>  	case POWER_SUPPLY_PROP_CHARGE_FULL:
>  		ret = regmap_read(info->regmap, MAX172XX_FULL_CAP, &reg_val);
> -		val->intval = max172xx_capacity_to_ps(reg_val);

...

> +		if (ret)
> +			break;
> +		ret = max172xx_capacity_to_ps(reg_val, info, &val->intval);
>  		break;
>  	case POWER_SUPPLY_PROP_MODEL_NAME:
>  		ret = regmap_read(info->regmap, MAX172XX_DEV_NAME, &reg_val);
> -		reg_val = FIELD_GET(MAX172XX_DEV_NAME_TYPE_MASK, reg_val);
> -		if (reg_val == MAX172XX_DEV_NAME_TYPE_MAX17201)
> -			val->strval = max17201_model;
> -		else if (reg_val == MAX172XX_DEV_NAME_TYPE_MAX17205)
> -			val->strval = max17205_model;
> -		else
> -			return -ENODEV;
> +		val->strval = max1720x_devname_to_model(reg_val, val, info);

Wouldn't it be better to just inline this function ?

> +		if (!val->strval)
> +			ret = -ENODEV;
>  {

[...]

>  	struct power_supply_config psy_cfg = {};
>  	struct device *dev = &client->dev;
>  	struct max1720x_device_info *info;
>  	struct power_supply *bat;
> +	const struct chip_data *data;
> +	const struct power_supply_desc *bat_desc;
>  	int ret;
>  
>  	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;
>  
> +	data = device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get chip data\n");
> +
>  	psy_cfg.drv_data = info;
>  	psy_cfg.fwnode = dev_fwnode(dev);
> -	psy_cfg.attr_grp = max1720x_groups;
> +	switch (data->id) {
> +	case MAX1720X_ID:
> +		psy_cfg.attr_grp = max1720x_groups;
> +		bat_desc = &max1720x_bat_desc;
> +		break;
> +	case MAX77759_ID:
> +		bat_desc = &max77759_bat_desc;
> +		break;
> +	default:
> +		return dev_err_probe(dev, -EINVAL, "Unsupported chip\n");
> +	}

nit: add empty line

>  	i2c_set_clientdata(client, info);
> -	info->regmap = devm_regmap_init_i2c(client, &max1720x_regmap_cfg);
> +
> +	info->id = data->id;
> +	info->regmap = devm_regmap_init_i2c(client, data->regmap_cfg);
>  	if (IS_ERR(info->regmap))
>  		return dev_err_probe(dev, PTR_ERR(info->regmap),
>  				     "regmap initialization failed\n");
>  
> -	ret = max1720x_probe_nvmem(client, info);
> +	if (data->has_nvmem) {
> +		ret = max1720x_probe_nvmem(client, info);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to probe nvmem\n");
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node,
> +				   "charge-full-design-microamp-hours", &info->charge_full_design);
> +	if (ret)
> +		info->charge_full_design = 0;
> +
> +	ret = max1720x_get_rsense(dev, info, data);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to probe nvmem\n");
> +		return dev_err_probe(dev, ret, "Failed to get RSense\n");
>  
> -	bat = devm_power_supply_register(dev, &max1720x_bat_desc, &psy_cfg);
> +	bat = devm_power_supply_register(dev, bat_desc, &psy_cfg);
>  	if (IS_ERR(bat))
>  		return dev_err_probe(dev, PTR_ERR(bat),
>  				     "Failed to register power supply\n");
> @@ -613,7 +816,8 @@ static int max1720x_probe(struct i2c_client *client)
>  }
>  
>  static const struct of_device_id max1720x_of_match[] = {
> -	{ .compatible = "maxim,max17201" },
> +	{ .compatible = "maxim,max17201", .data = (void *) &max1720x_data },
> +	{ .compatible = "maxim,max77759-fg", .data = (void *) &max77759_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, max1720x_of_match);
> 
> -- 
> 2.49.0
> 
> 

Best regards,
Dimitri Fedrau

