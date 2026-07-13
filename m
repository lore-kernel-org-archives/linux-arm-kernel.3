Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435EEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hMtdAArjczPZqa9ds4fr5946Ny+pRcNj6uAylZWFTk=; b=kCNxAIehPoLK7wnn9C1U3pTA3y
	AlqbYHpJQ3tM5sEPEf0mhrdxcht1QQptk1ypLaMZ3+QKYcZQjtGMJZCjf5h8ElFYRj8PgT+zEJzC0
	WkZerDHGsAuE9lOr5mv5gpwEm+xncEDgxMoMhQRlE1z+3kVma+eqTZ0eQeG3+rtvtAsKZTdGAvTT/
	IhY5KJMwhmjOzqU0Zhuyn0sflGSnM2T5hh1IJdfSg6SKdlJBo7EctD+w6kRoM3T17oX8+2EsfZ9uB
	rAcEkdAlOJoG5xt72eLqci0jzMSuWdqfIltEPZvYmLov/+iWD4R3L9KHIBwdAtO2/MgeDiGReh7gs
	DoFYbEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHtB-00000009dFz-2aXO;
	Mon, 13 Jul 2026 14:44:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHtA-00000009dFh-0XEK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6hMtdAArjczPZqa9ds4fr5946Ny+pRcNj6uAylZWFTk=; b=OAuXH6M6JXRYuTKN2Qq102orff
	Iaqoo8rSfjM+hZGfDjGFJPKIiDfPOvq1QX+kmuf4LZkx4Wso5zes8/7ugAuYYWb53qe5f/xFvgQMo
	X8JosY3zQPwZ7+Zj2HWChuYppZmQ61YT2UpqccN/2XU4dvwKB85mOmAYM6prk+pW3cygu4v7arnWi
	2L2JuAAXiMn9Irw4VNhsYALdfmLqFPYpMOPPpY+eVFcSAGg5Ext3DI89zSgc9ryIjVz4kDdZkfYW8
	XQuz8aF1YLBLfDyryphZ9kR9Gkm08ldKrtLcNW1xIo6/JyYo4jyE1IwLc3iU35xL3yjMO3IjaKqSo
	snzZZySQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHt6-0000000BjDb-3jeh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:44:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B8F4152B;
	Mon, 13 Jul 2026 07:43:57 -0700 (PDT)
Received: from [10.57.2.209] (unknown [10.57.2.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85E653F7B4;
	Mon, 13 Jul 2026 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783953841; bh=jXWZ8N81s562nbqm4nTLQDKQENpJOc0VxLLomCZS08s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a9C2LSD8X8yHmHN+D+GlT2sIPTq2ZJUvevUK6QFmr/5dDC17Ad7pnQzrO+GRNMKDQ
	 T9tIEJ/00jdXBuHyT+gPWjGwlj1geWItx40qXWv0bDyUB/0RibtkVuwdFkhb6XI4vP
	 UbdjGdMltTuVOsrIwOTBZKpv0pfK2JF8IcvB9+EY=
Message-ID: <046d89e6-9837-4b59-bda8-070c6366b6fe@arm.com>
Date: Mon, 13 Jul 2026 15:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] thermal/drivers/imx: Add calibration offset
 support
To: Haoning.CHENG@cn.bosch.com
Cc: linux-pm@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v7-0-09b6b7669be1@cn.bosch.com>
 <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v7-2-09b6b7669be1@cn.bosch.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v7-2-09b6b7669be1@cn.bosch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_154405_355619_3C3AFB96 
X-CRM114-Status: GOOD (  24.02  )
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



On 7/13/26 11:22, Haoning CHENG via B4 Relay wrote:
> From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
> 
> Some boards need a small per-design correction to align the reported CPU
> temperature with board-level measurements.
> 
> Read the optional fsl,temp-calibration-offset-millicelsius property from
> DT and apply it to the i.MX6/6SX/7D calibration formulas. When the
> property is not present, the default offset remains 0, preserving the
> current behaviour.

s/behaviour/behavior/

Also, you can add a description in this patch header with an example
how this is going to be calculated. The full mechanism is split
into two components: this driver and the thermal framework.

When the IRQ (which was programmed for e.g. 'panic temp' value)
is triggered then thermal fwk is kicked. In that the 'get_temp'
will be called.

What this change effectively does is:
- program the IRQ firing temp level higher (based on dt example)
- provide the temp value lower to thermal fwk
then you don't touch other stuff which is generic in this
thermal scope (like trip points).

It's kind of tricky to grasp and I would suggest to describe it
somewhere. These are popular chips and many boards use them,
so many engineers might miss this bit.

> 
> Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
> ---
>   drivers/thermal/imx_thermal.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 38c993d1bcb3..0a443e608957 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -207,6 +207,7 @@ struct imx_thermal_data {
>   	struct regmap *tempmon;
>   	u32 c1, c2; /* See formula in imx_init_calib() */
>   	int temp_max;
> +	s32 calibration_offset;
>   	int alarm_temp;
>   	int last_temp;
>   	bool irq_enabled;
> @@ -223,6 +224,7 @@ static void imx_set_panic_temp(struct imx_thermal_data *data,
>   	struct regmap *map = data->tempmon;
>   	int critical_value;
>   
> +	panic_temp -= data->calibration_offset;
>   	critical_value = (data->c2 - panic_temp) / data->c1;
>   
>   	regmap_write(map, soc_data->panic_alarm_ctrl + REG_CLR,
> @@ -239,11 +241,14 @@ static void imx_set_alarm_temp(struct imx_thermal_data *data,
>   	int alarm_value;
>   
>   	data->alarm_temp = alarm_temp;
> +	alarm_temp -= data->calibration_offset;
>   
> -	if (data->socdata->version == TEMPMON_IMX7D)
> -		alarm_value = alarm_temp / 1000 + data->c1 - 25;
> -	else
> +	if (data->socdata->version == TEMPMON_IMX7D) {
> +		alarm_value = DIV_ROUND_UP(alarm_temp, 1000) + data->c1 - 25;
> +		alarm_value = clamp(alarm_value, 0, 0x1ff);

This doesn't belong to the $subject. Needs extra patch.

> +	} else {
>   		alarm_value = (data->c2 - alarm_temp) / data->c1;
> +	}
>   
>   	regmap_write(map, soc_data->high_alarm_ctrl + REG_CLR,
>   		     soc_data->high_alarm_mask);
> @@ -277,6 +282,7 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
>   		*temp = (n_meas - data->c1 + 25) * 1000;
>   	else
>   		*temp = data->c2 - n_meas * data->c1;
> +	*temp += data->calibration_offset;
>   
>   	/* Update alarm value to next higher trip point for TEMPMON_IMX6Q */
>   	if (data->socdata->version == TEMPMON_IMX6Q) {
> @@ -629,6 +635,10 @@ static int imx_thermal_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, data);
>   
> +	of_property_read_s32(dev->of_node,
> +			     "fsl,temp-calibration-offset-millicelsius",
> +			     &data->calibration_offset);
> +


No bounds check here or debug message?
Playing with raw registers which handle thermal safety net it's kind of
risky IMO (a typo by one digit and the board dies).
Done once in the setup code won't harm performance and something which
goes to the DT schema is quite stable to reuse.

Regards,
Lukasz



