Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8937BCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL6irBHV0EkFeV7RZnEwyvVhGM05QTaBLxBLVAVya8A=; b=CCH1Y5d7al4harRF41OmSPc3kC
	Dp7Vvf3m4MnKYIzzRmnIFWYs5ywzgVrs4t4J5gKoNW4VYSN+IGnP35eohudFucV+qyPipeiQzydVV
	OY2PPhMCQuw07gbWqeNmkBb5hF48sJdSAucP284wE9RX1xX2Iwcw+NOXk2DSfa9prmErGfoP4czyL
	hSsLLxFBdNUvUh+PRR7sHd1uRB6Yd2aBgWmpzARP02qbn59XJRZ24/jDHD/fKwRIjy1HCHqSh2Spg
	/yhv4s7s49frl1CguzNU7kIunmk+MrDFObEDd53Y1hCkXBWLNsjh3Hhk1GO4ES1Z11eYTSarbo9Pp
	T84XNv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOWm-0000000AvNO-3MQZ;
	Tue, 19 Aug 2025 15:45:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLfr-0000000ATW1-0vtp;
	Tue, 19 Aug 2025 12:42:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 678E016A3;
	Tue, 19 Aug 2025 05:42:36 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 538723F63F;
	Tue, 19 Aug 2025 05:42:43 -0700 (PDT)
Message-ID: <2c7301cd-9c86-47fd-8b79-05f3e1a89e47@arm.com>
Date: Tue, 19 Aug 2025 13:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: rockchip: shut up GRF warning
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_054247_355704_1EE9DF97 
X-CRM114-Status: GOOD (  24.46  )
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

On 18/08/2025 6:26 pm, Sebastian Reichel wrote:
> Most of the recent Rockchip devices do not have a GRF associated
> with the tsadc IP. Let's avoid printing a warning on those devices.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/thermal/rockchip_thermal.c | 53 +++++++++++++++++++++++++++++++++-----
>   1 file changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
> index 3beff9b6fac3abe8948b56132b618ff1bed57217..1e8091cebd6673ab39fa0c4dee835c68aeb7e8b5 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -50,6 +50,18 @@ enum adc_sort_mode {
>   	ADC_INCREMENT,
>   };
>   
> +/*
> + * The GRF availability depends on the specific SoC
> + * GRF_NONE: the SoC does not have a GRF associated with the tsadc
> + * GRF_OPTIONAL: the SoC has a GRF, but the driver can work without it
> + * GRF_MANDATORY: the SoC has a GRF and it is required for proper operation
> + */
> +enum tsadc_grf_mode {
> +	GRF_NONE,
> +	GRF_OPTIONAL,
> +	GRF_MANDATORY,
> +};
> +
>   #include "thermal_hwmon.h"
>   
>   /**
> @@ -97,6 +109,9 @@ struct rockchip_tsadc_chip {
>   	enum tshut_mode tshut_mode;
>   	enum tshut_polarity tshut_polarity;
>   
> +	/* GRF availability */
> +	enum tsadc_grf_mode grf_mode;
> +
>   	/* Chip-wide methods */
>   	void (*initialize)(struct regmap *grf,
>   			   void __iomem *reg, enum tshut_polarity p);
> @@ -1099,6 +1114,8 @@ static const struct rockchip_tsadc_chip px30_tsadc_data = {
>   	.chn_offset = 0,
>   	.chn_num = 2, /* 2 channels for tsadc */
>   
> +	.grf_mode = GRF_MANDATORY,
> +
>   	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
>   	.tshut_temp = 95000,
>   
> @@ -1123,6 +1140,8 @@ static const struct rockchip_tsadc_chip rv1108_tsadc_data = {
>   	.chn_offset = 0,
>   	.chn_num = 1, /* one channel for tsadc */
>   
> +	.grf_mode = GRF_NONE,
> +
>   	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>   	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>   	.tshut_temp = 95000,
> @@ -1148,6 +1167,8 @@ static const struct rockchip_tsadc_chip rk3228_tsadc_data = {
>   	.chn_offset = 0,
>   	.chn_num = 1, /* one channel for tsadc */
>   
> +	.grf_mode = GRF_NONE,
> +
>   	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>   	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>   	.tshut_temp = 95000,
> @@ -1173,6 +1194,8 @@ static const struct rockchip_tsadc_chip rk3288_tsadc_data = {
>   	.chn_offset = 1,
>   	.chn_num = 2, /* two channels for tsadc */
>   
> +	.grf_mode = GRF_NONE,
> +
>   	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>   	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>   	.tshut_temp = 95000,
> @@ -1198,6 +1221,8 @@ static const struct rockchip_tsadc_chip rk3328_tsadc_data = {
>   	.chn_offset = 0,
>   	.chn_num = 1, /* one channels for tsadc */
>   
> +	.grf_mode = GRF_NONE,
> +
>   	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
>   	.tshut_temp = 95000,
>   
> @@ -1222,6 +1247,8 @@ static const struct rockchip_tsadc_chip rk3366_tsadc_data = {
>   	.chn_offset = 0,
>   	.chn_num = 2, /* two channels for tsadc */
>   
> +	.grf_mode = GRF_OPTIONAL,
> +
>   	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>   	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>   	.tshut_temp = 95000,
> @@ -1247,6 +1274,8 @@ static const struct rockchip_tsadc_chip rk3368_tsadc_data = {
>   	.chn_offset = 0,
>   	.chn_num = 2, /* two channels for tsadc */
>   
> +	.grf_mode = GRF_NONE,
> +
>   	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>   	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>   	.tshut_temp = 95000,
> @@ -1272,6 +1301,8 @@ static const struct rockchip_tsadc_chip rk3399_tsadc_data = {
>   	.chn_offset = 0,
>   	.chn_num = 2, /* two channels for tsadc */
>   
> +	.grf_mode = GRF_OPTIONAL,
> +
>   	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>   	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>   	.tshut_temp = 95000,
> @@ -1297,6 +1328,8 @@ static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
>   	.chn_offset = 0,
>   	.chn_num = 2, /* two channels for tsadc */
>   
> +	.grf_mode = GRF_OPTIONAL,
> +
>   	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>   	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>   	.tshut_temp = 95000,
> @@ -1321,6 +1354,7 @@ static const struct rockchip_tsadc_chip rk3576_tsadc_data = {
>   	/* top, big_core, little_core, ddr, npu, gpu */
>   	.chn_offset = 0,
>   	.chn_num = 6, /* six channels for tsadc */
> +	.grf_mode = GRF_NONE,
>   	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>   	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>   	.tshut_temp = 95000,
> @@ -1345,6 +1379,7 @@ static const struct rockchip_tsadc_chip rk3588_tsadc_data = {
>   	/* top, big_core0, big_core1, little_core, center, gpu, npu */
>   	.chn_offset = 0,
>   	.chn_num = 7, /* seven channels for tsadc */
> +	.grf_mode = GRF_NONE,
>   	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>   	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>   	.tshut_temp = 95000,
> @@ -1572,7 +1607,7 @@ static int rockchip_configure_from_dt(struct device *dev,
>   				      struct device_node *np,
>   				      struct rockchip_thermal_data *thermal)
>   {
> -	u32 shut_temp, tshut_mode, tshut_polarity;
> +	u32 shut_temp, tshut_mode, tshut_polarity, ret;
>   
>   	if (of_property_read_u32(np, "rockchip,hw-tshut-temp", &shut_temp)) {
>   		dev_warn(dev,
> @@ -1621,12 +1656,16 @@ static int rockchip_configure_from_dt(struct device *dev,
>   		return -EINVAL;
>   	}
>   
> -	/* The tsadc wont to handle the error in here since some SoCs didn't
> -	 * need this property.
> -	 */
> -	thermal->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> -	if (IS_ERR(thermal->grf))
> -		dev_warn(dev, "Missing rockchip,grf property\n");
> +	if (thermal->chip->grf_mode != GRF_NONE) {
> +		thermal->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> +		if (IS_ERR(thermal->grf)) {
> +			ret = PTR_ERR(thermal->grf);
> +			if (thermal->chip->grf_mode == GRF_OPTIONAL)
> +				dev_warn(dev, "Missing rockchip,grf property\n");
> +			else
> +				return dev_err_probe(dev, ret, "Missing rockchip,grf property\n");
> +		}
> +	}

Nit: Does the lookup itself need to be made conditional? I think I'd
also agree that the "optional" mode seems suspect, so potentially it
could be a whole lot simpler, e.g.:

	thermal->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
	if (IS_ERR(thermal->grf) && thermal->chip->grf_required)
		return dev_err_probe(dev, PTR_ERR(thermal->grf),
				     "Missing rockchip,grf property\n");

Thanks,
Robin.

>   
>   	rockchip_get_trim_configuration(dev, np, thermal);
>   
> 
> ---
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> change-id: 20250818-thermal-rockchip-grf-warning-05f7f56286a2
> 
> Best regards,


