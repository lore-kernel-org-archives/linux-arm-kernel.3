Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EA8C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QT8G1UVbzpTbRLvZwmkB+akGdPhvpGnei6tcCmYvak=; b=OkHM7VdfzTc3t+7soWBFROKjSW
	ALLK1elsjIfyQRPnooV1ui7fNWSVaJrEPzl57+wUVp9plCCHfuCNNhL1DpbpNezTaKtJIChWjEYQl
	/DyPvGYCuIy/74Xm95OhRnbbRW9Fm3WqRI2GKCa5yTKv8ceTdKRIHz5ySeSgcdasqZn7nEvEjsvjX
	WglTGK9yhCK135ixUnq2LvrBO5RtAJBhuVvRptzZQvGLE3qwJeRUs1aK6O5YxO0b5U50tFxbGxvB+
	Zt1y2S3OdIB7SHK+9kwAXtKh57pFTD8eQHUvZQnXuYVTy9wCYZUASkLNhh+e0JNsKMwdl59RjV20l
	6Jz5TFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju4e-0000000E20H-2FiL;
	Wed, 15 Jul 2026 07:30:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju4b-0000000E1zX-0VUG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:30:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C183339;
	Wed, 15 Jul 2026 00:30:24 -0700 (PDT)
Received: from [10.57.2.177] (unknown [10.57.2.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AE453F915;
	Wed, 15 Jul 2026 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784100628; bh=4ya+7e7Gq+zYCLAtPdaipzA7BT6Sc/L0MJYPLfGGWEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQ9F4qkPn9tb7PtaqYn/7qPnch21Mul+K7fQNjLNWgOpnIKel1gNAKRYTC9uotjov
	 c3M5hpvDf55JmHNvw8uXlsl5hQH9luF44JI+2PvOFg22OABp05XBT23oTj/av73sY6
	 z2XaX3Sm0SU/mHP//r9Jf2FLW7ekkjiUJoMYC3cQ=
Message-ID: <a2dda094-4f91-4af8-a0d2-646e526dcb85@arm.com>
Date: Wed, 15 Jul 2026 08:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] thermal/drivers/imx: Add calibration offset
 support
To: Haoning.CHENG@cn.bosch.com
Cc: linux-pm@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
References: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com>
 <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-3-d54d8690e16e@cn.bosch.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-3-d54d8690e16e@cn.bosch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_003029_246274_501920EE 
X-CRM114-Status: GOOD (  27.65  )
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



On 7/14/26 11:28, Haoning CHENG via B4 Relay wrote:
> From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
> 
> Some boards need a small per-design correction to align the reported CPU
> temperature with board-level measurements. Read the optional
> fsl,temp-calibration-offset-millicelsius property from DT and apply it
> uniformly to the i.MX6/6SX/7D calibration formulas.
> 
> The offset is applied symmetrically at two points to ensure the thermal
> framework sees calibrated temperatures while hardware thresholds remain
> correctly positioned:
> 
> 1. In imx_set_alarm_temp() and imx_set_panic_temp(): the temperature
>     threshold is *subtracted* by the offset before being converted to a
>     hardware register value. This shifts the hardware IRQ trigger to the
>     physical temperature that corresponds to the intended threshold.
> 
> 2. In imx_get_temp(): after computing physical temperature from the
>     hardware register, the offset is *added* back. The thermal framework
>     always sees the calibrated temperature.
> 
> For example, if DT sets offset = +3000 m°C (board reads 3°C too low)
> and the passive trip is 95°C:
> 
>    imx_set_alarm_temp(95000):
>      alarm_temp = 95000 - 3000 = 92000
>      → hardware register programmed for 92°C physical
> 
>    Hardware IRQ fires at 92°C physical
> 
>    imx_get_temp():
>      reads hardware, computes 92°C physical
>      *temp = 92000 + 3000 = 95000
>      → thermal framework sees 95°C → correct trip
> 
> When the property is not present, the offset defaults to 0, preserving
> the current behavior.
> 
> Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
> ---
>   drivers/thermal/imx_thermal.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 7f7d1116b9d6..d471acc16bce 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -85,6 +85,10 @@ enum imx_thermal_trip {
>   #define TEMPMON_IMX6SX			2
>   #define TEMPMON_IMX7D			3
>   
> +/* Calibration offset limits (±20 °C in millicelsius) */
> +#define IMX_TEMP_CALIB_OFFSET_MIN	(-20000)
> +#define IMX_TEMP_CALIB_OFFSET_MAX	20000
> +
>   struct thermal_soc_data {
>   	u32 version;
>   
> @@ -207,6 +211,7 @@ struct imx_thermal_data {
>   	struct regmap *tempmon;
>   	u32 c1, c2; /* See formula in imx_init_calib() */
>   	int temp_max;
> +	s32 calibration_offset;
>   	int alarm_temp;
>   	int last_temp;
>   	bool irq_enabled;
> @@ -223,6 +228,7 @@ static void imx_set_panic_temp(struct imx_thermal_data *data,
>   	struct regmap *map = data->tempmon;
>   	int critical_value;
>   
> +	panic_temp -= data->calibration_offset;
>   	critical_value = (data->c2 - panic_temp) / data->c1;
>   
>   	regmap_write(map, soc_data->panic_alarm_ctrl + REG_CLR,
> @@ -239,6 +245,7 @@ static void imx_set_alarm_temp(struct imx_thermal_data *data,
>   	int alarm_value;
>   
>   	data->alarm_temp = alarm_temp;
> +	alarm_temp -= data->calibration_offset;
>   
>   	if (data->socdata->version == TEMPMON_IMX7D) {
>   		if (alarm_temp >= 0)
> @@ -283,6 +290,7 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
>   		*temp = (n_meas - data->c1 + 25) * 1000;
>   	else
>   		*temp = data->c2 - n_meas * data->c1;
> +	*temp += data->calibration_offset;
>   
>   	/* Update alarm value to next higher trip point for TEMPMON_IMX6Q */
>   	if (data->socdata->version == TEMPMON_IMX6Q) {
> @@ -635,6 +643,25 @@ static int imx_thermal_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, data);
>   
> +	if (of_property_present(dev->of_node,
> +				"fsl,temp-calibration-offset-millicelsius")) {
> +		ret = of_property_read_s32(dev->of_node,
> +					   "fsl,temp-calibration-offset-millicelsius",
> +					   &data->calibration_offset);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to read calibration offset\n");
> +
> +		if (data->calibration_offset < IMX_TEMP_CALIB_OFFSET_MIN ||
> +		    data->calibration_offset > IMX_TEMP_CALIB_OFFSET_MAX)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "calibration offset %d millicelsius out of range\n",
> +					     data->calibration_offset);
> +
> +		dev_dbg(dev, "calibration offset: %d millicelsius\n",
> +			data->calibration_offset);
> +	}
> +
>   	if (of_property_present(dev->of_node, "nvmem-cells")) {
>   		ret = imx_init_from_nvmem_cells(pdev);
>   		if (ret)
> 


Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

