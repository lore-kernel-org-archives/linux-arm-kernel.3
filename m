Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F38C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRIL/yzBaSepZA/UwYNIC/ghy8IP0My0Od5m5XYXB48=; b=eKYD4+wcbOzI1zHmrAvrsvvkU9
	b0p0Gywszv0DjR++i7pRoieBzh6CO9EkUESgk9fFgKHuP7I5uBX+mGqOUCfnJbXhlZxhuCR1VvzHA
	YvlzSNgp0ECVB6Jg2K0/hNYN8nluVJ8rig6e0riyU/ON+RClYx5zFuAyCGdtKUac3GxkDo7OhkZS0
	OgBZfN+BsX6zlfHrsFGu+Es0wCjCkTXf8NhGXMGYFGP2yihwq38/VerrQ9zAIVYsKlkqQ7wzW+POO
	zdrzHxSNGzvXP8b04HvVznmvtRHwWxZ0o/QykuKQBU4hqK9ninBxQBlRGLnnj2tN9WXuXPPB5NgxS
	egN3bp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmi6-00000003D9g-1Xfv;
	Tue, 11 Feb 2025 09:37:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmge-00000003CNA-3IDG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 09:36:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38ddc36b81dso1422670f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 01:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739266571; x=1739871371; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRIL/yzBaSepZA/UwYNIC/ghy8IP0My0Od5m5XYXB48=;
        b=JCBphnx2Kh44EHCGZWP94IcKp9iweSX4L2Sf7lCbT4TBkAwwySlilrKifxYYLXOKRl
         L1kgAg1mzDre8A4u0JZ6+KLP+nQMlC3xgntE6xMcp1IB0f5kKRYn8BGKX7OB/GuTiCiY
         O9Sru9lDUQ/ceL1sYtNYcUcmJNJVSQfHOnDnt5+8UO5XZAfjt3ERyEDnMZqp3EoBVbq4
         4sg+3GwNVrTXWLXLCAA3fa+XgFIf+qAK8x2m/4fIBW4nouASzbN1lKe4gmj74fM17/R2
         xe27lMxTUI7PMlZnt2K+i1+saCnHd9QJRbfLN3OcaKLOdSfkdP0lU61QgaKrAdE2/sTP
         NrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266571; x=1739871371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRIL/yzBaSepZA/UwYNIC/ghy8IP0My0Od5m5XYXB48=;
        b=bmeWyKwOe4XC1bDi6GaaVPN1GELrnDicgbEPUQLL+pK0QIjXDV3DOvol/qOuDlVLvN
         cK7fFiNkt0Ltv+HhOmawE8o5nZ/ddPSZdXqUaMnTgrZwNuYlwM/cWt0qtAWXP9VimvPe
         CaSJqMKxa6dsDXdyYYjeFVXmOfKM+VNMQKu6HRkCxnrYOIZ2+s7DEAkJI+EYtcD9StTs
         gHBVroTSdD9GB0VFZ6qweJ0i/3i+qoKWvQu+CWEa8X+jsjg4MOydRD3ItN/wlIqO27gX
         0wkC9NlCvuYNIZEiouvL+Wl88KndgEkvB2GoMWOtXJgNKRtO0CQq3qSgI6aFUiNRvoj+
         28Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWK1PocY9Sj4X3dfG1mKMSlxuYaFmkvn8EGtaWN2/vv1Ou7MpJtFTsqQhY1U0jU1I+zeB3WY8BjsIWoHEM+Cgee@lists.infradead.org
X-Gm-Message-State: AOJu0YzYF2xaCM/L9zRyoX04Nkc4eu+Hg6BxEhLjHo4K8j7pKXw+bdXy
	/mV1puP5Artr6Gc5zSBqR/bHMZD3l+3+XoxpodTFm/nDUyrjhZjYGsvGlGo+CEg=
X-Gm-Gg: ASbGncuWnmsrL9+Uf+1PTqYvZuLtyBJhgut6ZKxio03u2FgoaIZ1Mh3YhFeWtDRKDaj
	l8IqNEP3+m9mhlle19ZqUulcoNgnU3p+gUQtIUrW+lP+qbE4nU+Mb+yOu6jA96n0oED7B1D7BxI
	qdtO1K5DfoZR8DwYaLyHp0/nJKeAzft0cSOOA5wU+H7PacsIoG8/p36iOZT854EJjbNRdu7jSHz
	gmSMaeCEPtVF90QdCxtemaExNm352hX/ryJEWqFoineLDka96oFw4MTjkl8dXez5qBwZsTNyRDB
	jOG9T3w+xScxroNrg3bOVmsIzxlNaAHjJg1XE/f3HXiJ4fPeX5xzCCM=
X-Google-Smtp-Source: AGHT+IFMZ1pKShIvwsLqT2YFSCvSRKsdHNHy86URkgTJ51eGtiPfoPHKZ+vrVH5UXF4X2AkG0HdYOQ==
X-Received: by 2002:a5d:47c2:0:b0:386:374b:e8bc with SMTP id ffacd0b85a97d-38de43a5bf1mr2011347f8f.15.1739266571151;
        Tue, 11 Feb 2025 01:36:11 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc98844f6sm11773513f8f.42.2025.02.11.01.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:36:10 -0800 (PST)
Message-ID: <7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org>
Date: Tue, 11 Feb 2025 10:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: rockchip: Support the rk3562 SoC in thermal
 driver
To: Kever Yang <kever.yang@rock-chips.com>, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
 Shaohan Yao <shaohan.yao@rock-chips.com>, linux-pm@vger.kernel.org,
 Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20241224094015.3816301-1-kever.yang@rock-chips.com>
 <20241224094015.3816301-2-kever.yang@rock-chips.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241224094015.3816301-2-kever.yang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_013612_830048_EAC50336 
X-CRM114-Status: GOOD (  22.45  )
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

On 24/12/2024 10:40, Kever Yang wrote:
> From: Shaohan Yao <shaohan.yao@rock-chips.com>
> 
> There are one Temperature Sensor on rk3562, channel 0 is for chip.

A bit stingy in terms of description, no ?


> Signed-off-by: Shaohan Yao <shaohan.yao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
>   drivers/thermal/rockchip_thermal.c | 112 ++++++++++++++++++++++++++++-
>   1 file changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
> index f551df48eef9..aec0e634bd1f 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2014-2016, Fuzhou Rockchip Electronics Co., Ltd
> + * Copyright (c) 2014-2021, Fuzhou Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2021-2024, Rockchip Electronics Co., Ltd.
>    * Caesar Wang <wxt@rock-chips.com>
>    */
>   
> @@ -185,6 +186,8 @@ struct rockchip_thermal_data {
>   #define TSADCV2_AUTO_PERIOD_HT			0x6c
>   #define TSADCV3_AUTO_PERIOD			0x154
>   #define TSADCV3_AUTO_PERIOD_HT			0x158
> +#define TSADCV9_Q_MAX				0x210
> +#define TSADCV9_FLOW_CON			0x218
>   
>   #define TSADCV2_AUTO_EN				BIT(0)
>   #define TSADCV2_AUTO_EN_MASK			BIT(16)
> @@ -195,6 +198,7 @@ struct rockchip_thermal_data {
>   #define TSADCV2_AUTO_TSHUT_POLARITY_MASK	BIT(24)
>   
>   #define TSADCV3_AUTO_Q_SEL_EN			BIT(1)
> +#define TSADCV3_AUTO_Q_SEL_EN_MASK		BIT(17)
>   
>   #define TSADCV2_INT_SRC_EN(chn)			BIT(chn)
>   #define TSADCV2_INT_SRC_EN_MASK(chn)		BIT(16 + (chn))
> @@ -220,6 +224,12 @@ struct rockchip_thermal_data {
>   #define TSADCV5_AUTO_PERIOD_HT_TIME		1622 /* 2.5ms */
>   #define TSADCV6_AUTO_PERIOD_TIME		5000 /* 2.5ms */
>   #define TSADCV6_AUTO_PERIOD_HT_TIME		5000 /* 2.5ms */
> +#define TSADCV7_AUTO_PERIOD_TIME		3000 /* 2.5ms */
> +#define TSADCV7_AUTO_PERIOD_HT_TIME		3000 /* 2.5ms */
> +#define TSADCV12_AUTO_PERIOD_TIME		3000 /* 2.5ms */
> +#define TSADCV12_AUTO_PERIOD_HT_TIME		3000 /* 2.5ms */
> +#define TSADCV3_Q_MAX_VAL			0x7ff /* 11bit 2047 */
> +#define TSADCV12_Q_MAX_VAL			0xfff /* 12bit 4095 */
>   
>   #define TSADCV2_USER_INTER_PD_SOC		0x340 /* 13 clocks */
>   #define TSADCV5_USER_INTER_PD_SOC		0xfc0 /* 97us, at least 90us */
> @@ -230,6 +240,8 @@ struct rockchip_thermal_data {
>   
>   #define PX30_GRF_SOC_CON2			0x0408
>   
> +#define RK3562_GRF_TSADC_CON			0x0580
> +
>   #define RK3568_GRF_TSADC_CON			0x0600
>   #define RK3568_GRF_TSADC_ANA_REG0		(0x10001 << 0)
>   #define RK3568_GRF_TSADC_ANA_REG1		(0x10001 << 1)
> @@ -497,6 +509,45 @@ static const struct tsadc_table rk3399_code_table[] = {
>   	{TSADCV3_DATA_MASK, 125000},
>   };
>   
> +static const struct tsadc_table rk3562_code_table[] = {
> +	{0, -40000},
> +	{1419, -40000},
> +	{1428, -35000},
> +	{1436, -30000},
> +	{1445, -25000},
> +	{1453, -20000},
> +	{1462, -15000},
> +	{1470, -10000},
> +	{1479, -5000},
> +	{1487, 0},
> +	{1496, 5000},
> +	{1504, 10000},
> +	{1512, 15000},
> +	{1521, 20000},
> +	{1529, 25000},
> +	{1538, 30000},
> +	{1546, 35000},
> +	{1555, 40000},
> +	{1563, 45000},
> +	{1572, 50000},
> +	{1580, 55000},
> +	{1589, 60000},
> +	{1598, 65000},
> +	{1606, 70000},
> +	{1615, 75000},
> +	{1623, 80000},
> +	{1632, 85000},
> +	{1640, 90000},
> +	{1648, 95000},
> +	{1657, 100000},
> +	{1666, 105000},
> +	{1674, 110000},
> +	{1682, 115000},
> +	{1691, 120000},
> +	{1699, 125000},
> +	{TSADCV2_DATA_MASK, 125000},
> +};

May be it is time to optimize all these tables out of the memory driver?

It is the 9th table introduced.

>   static const struct tsadc_table rk3568_code_table[] = {
>   	{0, -40000},
>   	{1584, -40000},
> @@ -834,6 +885,37 @@ static void rk_tsadcv8_initialize(struct regmap *grf, void __iomem *regs,
>   			       regs + TSADCV2_AUTO_CON);
>   }
>   
> +static void rk_tsadcv12_initialize(struct regmap *grf, void __iomem *regs,
> +				   enum tshut_polarity tshut_polarity)
> +{
> +	writel_relaxed(TSADCV12_AUTO_PERIOD_TIME, regs + TSADCV3_AUTO_PERIOD);
> +	writel_relaxed(TSADCV12_AUTO_PERIOD_HT_TIME,
> +		       regs + TSADCV3_AUTO_PERIOD_HT);
> +	writel_relaxed(TSADCV2_HIGHT_INT_DEBOUNCE_COUNT,
> +		       regs + TSADCV3_HIGHT_INT_DEBOUNCE);
> +	writel_relaxed(TSADCV2_HIGHT_TSHUT_DEBOUNCE_COUNT,
> +		       regs + TSADCV3_HIGHT_TSHUT_DEBOUNCE);
> +	writel_relaxed(TSADCV12_Q_MAX_VAL, regs + TSADCV9_Q_MAX);
> +	writel_relaxed(TSADCV3_AUTO_Q_SEL_EN | TSADCV3_AUTO_Q_SEL_EN_MASK,
> +		       regs + TSADCV2_AUTO_CON);
> +	if (tshut_polarity == TSHUT_HIGH_ACTIVE)
> +		writel_relaxed(TSADCV2_AUTO_TSHUT_POLARITY_HIGH |
> +			       TSADCV2_AUTO_TSHUT_POLARITY_MASK,
> +			       regs + TSADCV2_AUTO_CON);
> +	else
> +		writel_relaxed(TSADCV2_AUTO_TSHUT_POLARITY_MASK,
> +			       regs + TSADCV2_AUTO_CON);
> +
> +	if (!IS_ERR(grf)) {
> +		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_TSEN);
> +		udelay(15);
> +		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_ANA_REG0);
> +		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_ANA_REG1);
> +		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_ANA_REG2);
> +		usleep_range(100, 200);
> +	}
> +}
> +
>   static void rk_tsadcv2_irq_ack(void __iomem *regs)
>   {
>   	u32 val;
> @@ -1258,6 +1340,30 @@ static const struct rockchip_tsadc_chip rk3399_tsadc_data = {
>   	},
>   };
>   
> +static const struct rockchip_tsadc_chip rk3562_tsadc_data = {
> +	.chn_offset = 0,
> +	.chn_num = 1, /* one channels for tsadc */
> +
> +	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
> +	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
> +	.tshut_temp = 95000,
> +
> +	.initialize = rk_tsadcv12_initialize,
> +	.irq_ack = rk_tsadcv4_irq_ack,
> +	.control = rk_tsadcv4_control,
> +	.get_temp = rk_tsadcv4_get_temp,
> +	.set_alarm_temp = rk_tsadcv3_alarm_temp,
> +	.set_tshut_temp = rk_tsadcv3_tshut_temp,
> +	.set_tshut_mode = rk_tsadcv3_tshut_mode,
> +
> +	.table = {
> +		.id = rk3562_code_table,
> +		.length = ARRAY_SIZE(rk3562_code_table),
> +		.data_mask = TSADCV2_DATA_MASK,
> +		.mode = ADC_INCREMENT,
> +	},
> +};
> +
>   static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
>   	/* cpu, gpu */
>   	.chn_offset = 0,
> @@ -1337,6 +1443,10 @@ static const struct of_device_id of_rockchip_thermal_match[] = {
>   		.compatible = "rockchip,rk3399-tsadc",
>   		.data = (void *)&rk3399_tsadc_data,
>   	},
> +	{
> +		.compatible = "rockchip,rk3562-tsadc",
> +		.data = (void *)&rk3562_tsadc_data,
> +	},
>   	{
>   		.compatible = "rockchip,rk3568-tsadc",
>   		.data = (void *)&rk3568_tsadc_data,


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

