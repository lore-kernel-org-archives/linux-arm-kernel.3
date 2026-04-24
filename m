Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBE9FE51FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrfueS0M3ksdEe4kTwzYyRrLHN8xQEsX3ULqrEC+KDU=; b=4mRsCgkRqZrbCRh5aV/mK/rg0b
	srzfNgoZEh4jsmqBJjIA6OSisIDZjRzKJQDG8VwSyhpafk5KGn+seMiujMSm9AAzwrtgIXlaVrhSx
	JvxmHg+T1OJ7GlunVQNAsT5iXtBUzY163XfJBcg4hNj2kx05nPP56ydQQCvg5kDZzqP0EOAN4k9XZ
	MXLJ8HFNaG7+GtiPSOrvRLD2TQaTuarWVsbc5ds8gK0KbaWZKYZpOv5zCxu2J3C3LJtqyf+Taz9sg
	nsJsfK66KT2Iw5SwFMbCIfY19ncWawj2HgCVXccoTgEYpzIc75X4YScttik8XW2huzlGm26xsfkBD
	fa+otErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDG1-0000000CyPw-41Ig;
	Fri, 24 Apr 2026 09:55:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDFw-0000000CyOL-34iq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:55:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43eada6d900so7454419f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 02:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024527; x=1777629327; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrfueS0M3ksdEe4kTwzYyRrLHN8xQEsX3ULqrEC+KDU=;
        b=HJ+OHtQi6iadCr14XNlkrtbaSGtIZlA8p89kvjKU6WiIqTmzOPWLiGPlLONsTN6rkd
         fKwedQxuVmakF5eNO6eZvBekhdcjw56nkQB3fGECFC5FSIempzwJeFetVY/zQeKwKZMb
         MUmT2lbg5kqr+zJnrKUR+Rlxk40Kzf8HMnfYyb3TzTr1pZoUQ/MHCNliaJL5j2rVnAG5
         MqM1CPuUhHMjmzGqojGb+wTY2y8pE0x1XuYBaLdfF0VfWcza9jq9wvYG4XPTir6Eg+kd
         vdQeITIio2RkayTI5icMWIAEsdgGdXfOEbArsimqJOMu5EUHkPauHTZh9YhwX0WNxmBO
         b/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024527; x=1777629327;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrfueS0M3ksdEe4kTwzYyRrLHN8xQEsX3ULqrEC+KDU=;
        b=JWntMXMK2FRRRRAb+7OYmlwuCPe9fwl6P+0tX3HByFoEfw03/bCRDAnWFTfZ5U1flG
         lDVJoXCi9yLgtJKsNlyBjeDSICFD8gNtxSppoOwkMtUnPg9dQPofHymxe0SJD4d8n2xo
         1zCOj659AIwGgbS4F0ngS1aYUj3M4Uy+WK5H2Fad668CjAzQfnBOAp2Hw20gBlYoz+GX
         0Wyaz+M4VYt2RDGV5pJ+6kRuyWKpPHPdYlooJE/Y8Xpr3t7883PeX2lI0YfvqYBPleds
         4qIoi6H940Iw9OmHOnWycrw7RieDFRVcRdtOP4ImY7oemzyzRS1RY5YBeG4hqsnrf7+4
         vJ3A==
X-Forwarded-Encrypted: i=1; AFNElJ9ZHc2pDA5X/CSTT8AEO1bbZibYKx0N+nJyvA74+vq6v0e/ZEfe8iSthHaGvjuXip07evvUTEYfQ1loK9aCI2WN@lists.infradead.org
X-Gm-Message-State: AOJu0YzjBgtfSSJPAh+mmSsAYZEq2BXBg2nas+K1thZpzmzErerGR58S
	UTMRJlYQy5tNZtPbSFQPWnSdbGQO5H+5FoaBgE47TME360Pr4/90oLHy0zTGtXG7H/0=
X-Gm-Gg: AeBDiesoYmhu3iN24LiY83vJD6flsWoRJn/q6F/bvfmRsodhLfUe673b+3XZ1hSvoGV
	LBN5UP9o1szAKANUrM04TLYko+jXla1rXF/tocSVs9ZlaaZGhhxaQRbWUI3Ojd0GdDq5+A6P1jo
	XBgLsaR58KlLrJvcX+x8R3HKNmV7Vi9Ool0Br0zCdMpodFkkobRpuwfeokCFyKDQHUIVphFDRzS
	qErKiMcsUjhcO2MKxfirAKZUZb4NaqDinXeci5PhZuujJAYudw9yp5AMVhwaIzRRZr8UWqLfo3X
	fz9ED34suqwrcFovo2eeNH93wVV1Do2k0c+KeyGxEyMQoEdAIO/Id9/wtxxa2Jvx0foVDaRta2v
	nTwjMM9n72siXNJTKFp8OAJej1WsO+fHbjtrsFko2e+qFpS/IcvCpo5V7O0mVHlNWY0bAtDOpqA
	/V6CDnCIoHfaI1+MUl73fCyUdJ+cIxjcUlHx55x46CxW/NFmcJ55yXqUu4QS/NeCjpvzfi70c2y
	O0iMY//8XTyTfQP1Q==
X-Received: by 2002:a05:600c:34c7:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-4891c32266amr308527675e9.15.1777024526813;
        Fri, 24 Apr 2026 02:55:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bb3d121sm583739045e9.14.2026.04.24.02.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:55:26 -0700 (PDT)
Message-ID: <4ba28eee-db47-436a-9008-605cae805f81@linaro.org>
Date: Fri, 24 Apr 2026 11:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/8] mfd: khadas-mcu: Add support for VIM4 MCU variant
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-4-447114a28f2d@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-4-447114a28f2d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025528_809937_861EBF54 
X-CRM114-Status: GOOD (  22.18  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Refactor probe() to use per-variant khadas_mcu_data
> instead of hardcoded globals.
> 
> Add dedicated regmap configuration and device data for the VIM4 MCU,
> with its own volatile/writeable registers.
> 
> Add the fan control register
> (0–100 levels vs 0–3 for previous supported boards).
> 
> Add a new compatible string "khadas,vim4-mcu".
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/mfd/khadas-mcu.c | 106 ++++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 95 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index ba981a7886921..b36b3b3ab73c0 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -75,15 +75,91 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>   	.cache_type	= REGCACHE_MAPLE,
>   };
>   
> +static const struct khadas_mcu_fan_pdata khadas_mcu_fan_pdata = {
> +	.fan_reg	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> +	.max_level	= 3,
> +};
> +
>   static struct mfd_cell khadas_mcu_fan_cells[] = {
>   	/* VIM1/2 Rev13+ and VIM3 only */
> -	{ .name = "khadas-mcu-fan-ctrl", },
> +	{
> +		.name = "khadas-mcu-fan-ctrl",
> +		.platform_data = &khadas_mcu_fan_pdata,
> +		.pdata_size    = sizeof(khadas_mcu_fan_pdata),
> +	},
>   };
>   
>   static struct mfd_cell khadas_mcu_cells[] = {
>   	{ .name = "khadas-mcu-user-mem", },
>   };
>   
> +static const struct khadas_mcu_data khadas_mcu_data = {
> +	.regmap_config	= &khadas_mcu_regmap_config,
> +	.cells		= khadas_mcu_cells,
> +	.ncells		= ARRAY_SIZE(khadas_mcu_cells),
> +	.fan_cells	= khadas_mcu_fan_cells,
> +	.nfan_cells	= ARRAY_SIZE(khadas_mcu_fan_cells),
> +};
> +
> +static bool khadas_mcu_vim4_reg_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case KHADAS_MCU_PWR_OFF_CMD_REG:
> +	case KHADAS_MCU_VIM4_REST_CONF_REG:
> +	case KHADAS_MCU_WOL_INIT_START_REG:
> +	case KHADAS_MCU_VIM4_LED_ON_RAM_REG:
> +	case KHADAS_MCU_VIM4_FAN_CTRL_REG:
> +	case KHADAS_MCU_VIM4_WDT_EN_REG:
> +	case KHADAS_MCU_VIM4_SYS_RST_REG:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool khadas_mcu_vim4_reg_writeable(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case KHADAS_MCU_VERSION_0_REG:
> +	case KHADAS_MCU_VERSION_1_REG:
> +	case KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static const struct regmap_config khadas_mcu_vim4_regmap_config = {
> +	.reg_bits	= 8,
> +	.reg_stride	= 1,
> +	.val_bits	= 8,
> +	.max_register	= KHADAS_MCU_VIM4_SYS_RST_REG,
> +	.volatile_reg	= khadas_mcu_vim4_reg_volatile,
> +	.writeable_reg	= khadas_mcu_vim4_reg_writeable,
> +	.cache_type	= REGCACHE_MAPLE,
> +};
> +
> +static const struct khadas_mcu_fan_pdata khadas_vim4_fan_pdata = {
> +	.fan_reg	= KHADAS_MCU_VIM4_FAN_CTRL_REG,
> +	.max_level	= 0x64,
> +};
> +
> +static const struct mfd_cell khadas_mcu_vim4_cells[] = {
> +	{
> +		.name		= "khadas-mcu-fan-ctrl",
> +		.platform_data	= &khadas_vim4_fan_pdata,
> +		.pdata_size	= sizeof(khadas_vim4_fan_pdata),
> +	},
> +};
> +
> +static const struct khadas_mcu_data khadas_vim4_mcu_data = {
> +	.regmap_config	= &khadas_mcu_vim4_regmap_config,
> +	.cells		= NULL,
> +	.ncells		= 0,
> +	.fan_cells	= khadas_mcu_vim4_cells,
> +	.nfan_cells	= ARRAY_SIZE(khadas_mcu_vim4_cells),
> +};
> +
>   static int khadas_mcu_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
> @@ -94,28 +170,35 @@ static int khadas_mcu_probe(struct i2c_client *client)
>   	if (!ddata)
>   		return -ENOMEM;
>   
> +	ddata->data = i2c_get_match_data(client);
> +	if (!ddata->data)
> +		return -EINVAL;
> +
>   	i2c_set_clientdata(client, ddata);
>   
>   	ddata->dev = dev;
>   
> -	ddata->regmap = devm_regmap_init_i2c(client, &khadas_mcu_regmap_config);
> +	ddata->regmap = devm_regmap_init_i2c(client,
> +					     ddata->data->regmap_config);
>   	if (IS_ERR(ddata->regmap)) {
>   		ret = PTR_ERR(ddata->regmap);
>   		dev_err(dev, "Failed to allocate register map: %d\n", ret);
>   		return ret;
>   	}
>   
> -	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> -				   khadas_mcu_cells,
> -				   ARRAY_SIZE(khadas_mcu_cells),
> -				   NULL, 0, NULL);
> -	if (ret)
> -		return ret;
> +	if (ddata->data->cells && ddata->data->ncells) {
> +		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> +					   ddata->data->cells,
> +					   ddata->data->ncells,
> +					   NULL, 0, NULL);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	if (of_property_present(dev->of_node, "#cooling-cells"))
>   		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> -					    khadas_mcu_fan_cells,
> -					    ARRAY_SIZE(khadas_mcu_fan_cells),
> +					    ddata->data->fan_cells,
> +					    ddata->data->nfan_cells,
>   					    NULL, 0, NULL);
>   
>   	return 0;
> @@ -123,7 +206,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
>   
>   #ifdef CONFIG_OF
>   static const struct of_device_id khadas_mcu_of_match[] = {
> -	{ .compatible = "khadas,mcu", },
> +	{ .compatible = "khadas,mcu", .data = &khadas_mcu_data },
> +	{ .compatible = "khadas,vim4-mcu", .data = &khadas_vim4_mcu_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

