Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A000CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 00:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0icZwGq6l6trj5m8kiyot8z07Evuj931KewICxfmrA0=; b=NDM0i3RWVUGe8JMNEWe4VOEYnK
	xzQBmewbvXeQIeBECTFPfBiMbAsZ9wTMfJjiXs5e0SC3jkPbq/cDiPWSUueBz62k8a6GlyGplpa2d
	Gk1JK94nHkp4yBo2pe0yw5XWdfgrM1rlHE03Iwe5GKcutKNDIWO3NZCDr8FvUnx/gf/BOSLE8cxx1
	nSozw+st1qfimg0B3YqKHo+DuIDd0U939UzY8UZsUZ6NCUoik8Lim15TPR/Ps9Kj4GzxCrsIaCPUv
	eIg/ZxkAey7eKH7shaDitASh6gu2aqzY1YKBjulJh13hL+UpL5l8SS5xEiNQCxvJSuwdXpjhiSv6T
	3uhbRI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rIK-0000000BwWA-3785;
	Tue, 23 Sep 2025 00:54:12 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rIH-0000000BwUf-3Gsg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 00:54:12 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250923005401epoutp01040188d37a5b9abe7ceae9af0aa90cb7~nwzv4hinA2663426634epoutp01c
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 00:54:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250923005401epoutp01040188d37a5b9abe7ceae9af0aa90cb7~nwzv4hinA2663426634epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758588841;
	bh=0icZwGq6l6trj5m8kiyot8z07Evuj931KewICxfmrA0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=otohyrUYrfg89CB6iep/4Blgcw316CaCY9Ze4fGymgPL3NLb4lAHCkiqU7sQZGoBw
	 s8mB4UZjAndBJCZ09LyTRR5ofZz68puAE2yg7EZnBIba3fIKU0Sp3RixV1UzNpfGUu
	 WhY8w4lDG50mlvgjH63gHJhONoRrx6lOcqT1xB0I=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250923005400epcas2p4d217865e5715affdeab93832c32ea661~nwzu8bTEn1878118781epcas2p4R;
	Tue, 23 Sep 2025 00:54:00 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.70]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cW1h76Mw1z2SSKx; Tue, 23 Sep
	2025 00:53:59 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250923005359epcas2p419655d2bdb7de8ea6e0e60556660ac14~nwzte59Ee2370523705epcas2p4p;
	Tue, 23 Sep 2025 00:53:59 +0000 (GMT)
Received: from KORCO115296 (unknown [12.80.207.128]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250923005359epsmtip26a98a0660041a34e46c9d4ee172226d5~nwztZPk940718307183epsmtip27;
	Tue, 23 Sep 2025 00:53:59 +0000 (GMT)
From: =?ks_c_5601-1987?B?vNW9xQ==?= <shin.son@samsung.com>
To: "'Henrik Grimler'" <henrik@grimler.se>
Cc: "'Bartlomiej Zolnierkiewicz'" <bzolnier@gmail.com>, "'Krzysztof
 Kozlowski'" <krzk@kernel.org>, "'Rafael J . Wysocki'" <rafael@kernel.org>,
	"'Daniel Lezcano'" <daniel.lezcano@linaro.org>, "'Zhang Rui'"
	<rui.zhang@intel.com>, "'Lukasz Luba'" <lukasz.luba@arm.com>, "'Rob
	Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>, "'Alim
	Akhtar'" <alim.akhtar@samsung.com>, <linux-pm@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250922200430.GA4697@l14.localdomain>
Subject: RE: [PATCH v4 2/3] thermal: exynos_tmu: Support new hardware and
 update TMU interface
Date: Tue, 23 Sep 2025 09:53:53 +0900
Message-ID: <000001dc2c24$8be7a090$a3b6e1b0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQLNrO/s5c6r06mWwaZxWViDEkHfogKWIOg4AX/6Z7UBj0CC7bKPv5FA
Content-Language: ko
X-CMS-MailID: 20250923005359epcas2p419655d2bdb7de8ea6e0e60556660ac14
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250922041902epcas2p3e40ed58737b22b7af9d09f6ba362928d
References: <20250922041857.1107445-1-shin.son@samsung.com>
	<CGME20250922041902epcas2p3e40ed58737b22b7af9d09f6ba362928d@epcas2p3.samsung.com>
	<20250922041857.1107445-3-shin.son@samsung.com>
	<20250922200430.GA4697@l14.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_175410_486193_1A75B813 
X-CRM114-Status: GOOD (  49.22  )
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

Hello Henrik Grimler

> -----Original Message-----
> From: Henrik Grimler [mailto:henrik@grimler.se]
> Sent: Tuesday, September 23, 2025 5:05 AM
> To: Shin Son <shin.son@samsung.com>
> Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>; Krzysztof Kozlowski
> <krzk@kernel.org>; Rafael J . Wysocki <rafael@kernel.org>; Daniel Lezcano
> <daniel.lezcano@linaro.org>; Zhang Rui <rui.zhang@intel.com>; Lukasz Luba
> <lukasz.luba@arm.com>; Rob Herring <robh@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>; linux-
> pm@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v4 2/3] thermal: exynos_tmu: Support new hardware and
> update TMU interface
> 
> Hi Shin,
> 
> On Mon, Sep 22, 2025 at 01:18:56PM +0900, Shin Son wrote:
> > The Exynos tmu driver's private data structure has been extended to
> > support the exynosautov920 hardware, which requires per-sensor
> > interrupt enablement and multiple-zone handling:
> >
> > - Add 'slope_comp' : compensation parameter below 25 degrees.
> > - Add 'calib_temp' : stores the fused calibaration temperature.
> > - Add 'sensor_count' : reflects the maximum sensor numbers.
> > - Rename 'tzd' -> 'tzd_array' to register multiple thermal zones.
> >
> > Since splitting this patch causes runtime errors during temperature
> > emulation or problems where the read temperature feature fails to
> > retrieve values, I have submitted it as a single commit. To add
> > support for the exynosautov920 to the exisiting TMU interface, the
> > following changes are included:
> >
> > 1. Simplify "temp_to_code" and "code_to_temp" to one computation path
> >    by normalizing calib_temp.
> > 2. Loop over 'sensor_count' in critical-point setup.
> > 3. Introduce 'update_con_reg' for exynosautov920 control-register
> updates.
> > 4. Add exynosautov920-specific branch in 'exynos_tmu_update_temp'
> function.
> > 5. Skip high & low temperature threshold setup in exynosautov920.
> > 6. Enable interrupts via sensor_count in exynosautov920.
> > 7. Initialize all new members during 'exynosautov920_tmu_initialize'.
> > 8. Clear IRQs by iterating the sensor_count in exynosautov920.
> > 9. Register each zone with 'devm_thermal_of_zone_register()'
> >    based on 'sensor_count'.
> >
> > Signed-off-by: Shin Son <shin.son@samsung.com>
> > ---
> >  drivers/thermal/samsung/exynos_tmu.c | 322
> > ++++++++++++++++++++++++---
> >  1 file changed, 285 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/thermal/samsung/exynos_tmu.c
> > b/drivers/thermal/samsung/exynos_tmu.c
> > index 47a99b3c5395..ebcc38f3fff6 100644
> > --- a/drivers/thermal/samsung/exynos_tmu.c
> > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > @@ -121,8 +121,51 @@
> >
> >  #define EXYNOS_NOISE_CANCEL_MODE		4
> >
> > +/* ExynosAutov920 specific registers */
> > +#define EXYNOSAUTOV920_SLOPE_COMP		25
> > +#define EXYNOSAUTOV920_SLOPE_COMP_MASK		0xf
> > +#define EXYNOSAUTOV920_CALIB_SEL_TEMP		30
> > +#define EXYNOSAUTOV920_CALIB_SEL_TEMP_MASK	0x2
> > +
> > +#define EXYNOSAUTOV920_SENSOR0_TRIM_INFO	0x10
> > +#define EXYNOSAUTOV920_TRIM_MASK		0x1ff
> > +#define EXYNOSAUTOV920_TRIMINFO_25_SHIFT	0
> > +#define EXYNOSAUTOV920_TRIMINFO_85_SHIFT	9
> > +
> > +#define EXYNOSAUTOV920_TMU_REG_TRIMINFO2	0x04
> > +
> > +#define EXYNOSAUTOV920_TMU_REG_THRESHOLD(p)	(((p)) * 0x50 +
0x00d0)
> > +#define EXYNOSAUTOV920_TMU_REG_INTEN(p)		(((p)) * 0x50 +
> 0x00f0)
> > +#define EXYNOSAUTOV920_TMU_REG_INT_PEND(p)	(((p)) * 0x50 + 0x00f8)
> > +
> > +#define EXYNOSAUTOV920_CURRENT_TEMP_P1_P0	0x084
> > +#define EXYNOSAUTOV920_TMU_REG_EMUL_CON		0x0b0
> > +
> > +#define EXYNOSAUTOV920_TMU_REG_CONTROL		0x50
> > +#define EXYNOSAUTOV920_TMU_REG_CONTROL1		0x54
> > +#define EXYNOSAUTOV920_TMU_REG_AVG_CONTROL	0x58
> > +#define EXYNOSAUTOV920_TMU_SAMPLING_INTERVAL	0x70
> > +#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE0	0x74
> > +#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE1	0x78
> > +
> > +#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_SHIFT		8
> > +#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_MASK		0x1f
> > +#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_SHIFT	3
> > +#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_MASK		0xf
> > +#define EXYNOSAUTOV920_TMU_NUM_PROBE_MASK		0xf
> > +#define EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT		16
> > +#define EXYNOSAUTOV920_TMU_LPI_MODE_MASK		1
> > +#define EXYNOSAUTOV920_TMU_LPI_MODE_SHIFT		10
> > +
> > +#define EXYNOSAUTOV920_TMU_AVG_CON_UPDATE		0x0008011a
> > +#define EXYNOSAUTOV920_TMU_COUNTER_VALUE0_UPDATE	0x030003c0
> > +#define EXYNOSAUTOV920_TMU_COUNTER_VALUE1_UPDATE	0x03c0004d
> > +
> >  #define MCELSIUS	1000
> >
> > +#define EXYNOS_DEFAULT_SENSOR_COUNT			1
> > +#define EXYNOS_MAX_SENSOR_COUNT				16
> 
> In patch 1, sensor count is described as a value 0 <= sensor_count <= 15,
> but here max sensor count value is set to 16. Shouldn't max value be the
> same in these two places, what is the maximum number of thermal sensors
> that the hardware can have?

Sorry for the confusion. It actually refers to the maximum number of remote
sensors.
I'll change it to 15.

> 
> >  enum soc_type {
> >  	SOC_ARCH_EXYNOS3250 = 1,
> >  	SOC_ARCH_EXYNOS4210,
> > @@ -133,6 +176,7 @@ enum soc_type {
> >  	SOC_ARCH_EXYNOS5420_TRIMINFO,
> >  	SOC_ARCH_EXYNOS5433,
> >  	SOC_ARCH_EXYNOS7,
> > +	SOC_ARCH_EXYNOSAUTOV920,
> >  };
> >

...

> >  static int temp_to_code(struct exynos_tmu_data *data, u8 temp)  {
> > +	s32 temp_diff, code;
> > +
> >  	if (data->cal_type == TYPE_ONE_POINT_TRIMMING)
> >  		return temp + data->temp_error1 - EXYNOS_FIRST_POINT_TRIM;
> >
> > -	return (temp - EXYNOS_FIRST_POINT_TRIM) *
> > -		(data->temp_error2 - data->temp_error1) /
> > -		(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) +
> > -		data->temp_error1;
> > +	temp_diff = temp - EXYNOS_FIRST_POINT_TRIM;
> > +
> > +	code = temp_diff * (data->temp_error2 - data->temp_error1) *
> MCELSIUS /
> > +	       (data->calib_temp - EXYNOS_FIRST_POINT_TRIM);
> > +
> > +	if (data->soc == SOC_ARCH_EXYNOSAUTOV920 && temp_diff < 0)
> > +		code = code * (57 + data->slope_comp) / 65;
> > +
> > +	return code / MCELSIUS + data->temp_error1;
> >  }
> >
> >  /*
> > @@ -220,13 +277,20 @@ static int temp_to_code(struct exynos_tmu_data
> *data, u8 temp)
> >   */
> >  static int code_to_temp(struct exynos_tmu_data *data, u16 temp_code)
> > {
> > +	s32 code_diff, temp;
> > +
> >  	if (data->cal_type == TYPE_ONE_POINT_TRIMMING)
> >  		return temp_code - data->temp_error1 +
> EXYNOS_FIRST_POINT_TRIM;
> >
> > -	return (temp_code - data->temp_error1) *
> > -		(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) /
> > -		(data->temp_error2 - data->temp_error1) +
> > -		EXYNOS_FIRST_POINT_TRIM;
> > +	code_diff = temp_code - data->temp_error1;
> > +
> > +	temp = code_diff * (data->calib_temp - EXYNOS_FIRST_POINT_TRIM) *
> MCELSIUS /
> > +	       (data->temp_error2 - data->temp_error1);
> > +
> > +	if (data->soc == SOC_ARCH_EXYNOSAUTOV920 && code_diff < 0)
> > +		temp = temp * 65 / (57 + data->slope_comp);
> > +
> > +	return temp / MCELSIUS + EXYNOS_FIRST_POINT_TRIM;
> >  }
> 
> Nice, these two functions looks much better compared to v2!

Thank you for your advice!

> 
> >  static void sanitize_temp_error(struct exynos_tmu_data *data, u32
> > trim_info) @@ -262,6 +326,9 @@ static int exynos_tmu_initialize(struct
> platform_device *pdev)

...

> > @@ -865,6 +1079,10 @@ static int exynos_map_dt_data(struct
> > platform_device *pdev)
> >
> >  	data->soc = (uintptr_t)of_device_get_match_data(&pdev->dev);
> >
> > +	data->sensor_count = EXYNOS_DEFAULT_SENSOR_COUNT;
> > +
> > +	data->calib_temp = EXYNOS_SECOND_POINT_TRIM;
> > +
> >  	switch (data->soc) {
> >  	case SOC_ARCH_EXYNOS4210:
> >  		data->tmu_set_low_temp = exynos4210_tmu_set_low_temp; @@ -
> 945,6
> > +1163,19 @@ static int exynos_map_dt_data(struct platform_device *pdev)
> >  		data->min_efuse_value = 15;
> >  		data->max_efuse_value = 100;
> >  		break;
> > +	case SOC_ARCH_EXYNOSAUTOV920:
> > +		data->tmu_set_low_temp = exynosautov920_tmu_set_low_temp;
> > +		data->tmu_set_high_temp = exynosautov920_tmu_set_high_temp;
> > +		data->tmu_disable_low = exynosautov920_tmu_disable_low;
> > +		data->tmu_disable_high = exynosautov920_tmu_disable_high;
> > +		data->tmu_set_crit_temp = exynosautov920_tmu_set_crit_temp;
> > +		data->tmu_initialize = exynosautov920_tmu_initialize;
> > +		data->tmu_control = exynosautov920_tmu_control;
> > +		data->tmu_read = exynosautov920_tmu_read;
> > +		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
> > +		data->tmu_clear_irqs = exynosautov920_tmu_clear_irqs;
> > +		data->sensor_count = EXYNOS_MAX_SENSOR_COUNT;
> > +		break;
> >  	default:
> >  		dev_err(&pdev->dev, "Platform not supported\n");
> >  		return -EINVAL;
> > @@ -952,6 +1183,14 @@ static int exynos_map_dt_data(struct
> > platform_device *pdev)
> >
> >  	data->cal_type = TYPE_ONE_POINT_TRIMMING;
> >
> > +	if (data->soc == SOC_ARCH_EXYNOSAUTOV920) {
> > +		if (of_property_read_u32(pdev->dev.of_node,
> "samsung,sensors",
> > +					 &data->sensor_count)) {
> > +			dev_err(&pdev->dev, "failed to get sensor count\n");
> > +			return -ENODEV;
> > +		}
> > +	}
> 
> Do we really need the `if (data->soc == SOC_ARCH_EXYNOSAUTOV920)` here, I
> am sure there will be more socs that use samsung,sensors. Can't we simply
> read samsung,sensors for all socs and use EXYNOS_DEFAULT_SENSOR_COUNT if
> it fails, or would it be potentially dangerous if samsung,sensors is
> missing for autov920 dtb and default value of 1 is used?
> 
> Best regards,
> Henrik Grimler
> 

Yes. Incorrect remote-sensor settings can affect TMU operation. For
example, when the sensor count is set to 1,
The thermal zone doesn't function properly and the hardware trip doesn't
assert on the v920 variant.
I consider that configuration unsafe, so I added variant-specific handling
for that SoC.
Meanwhile, the other variant legitimately uses only a single sensor.



