Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829F3F99362
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvCi/CVpH88WMffYYZwdgbtLju43Phq8Lyjrsa4uQn4=; b=Kv8HzGEJ2VOieaAy/QpMeufyYl
	Ud9e4hzr1nLuegSUuC45cP2bIURNojqzzzryUVBXpEnKLxQyG9FD7fnLJVcPsfJ+fMNFZUpRIsyN/
	9DyCV9r7mhk3m2hVXdO3eyv7aZ8XHQ3HE9eeRj59I1TSDqJP7bPX3abAKhilCpDGGQqoP+UlRT/cu
	a2lwtPAaxn7Ssznn07ms1/XEDrz242c4Vd09yOKSZ0p0pHWMwiFalO3PHhKzEqvAVqdOHWDz6K7Js
	2Ht/ET3cFE0PlRAN0+Ops9xSpJT+i7ficnUtsyPomeaagm3UBWwbTkWA6KKYT7eGa9qwqy/uW/H/m
	lfCy2aUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrFS-0000000BTfn-31fO;
	Thu, 23 Apr 2026 10:25:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrFQ-0000000BTf7-1IIx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 10:25:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8toUV179235
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 10:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvCi/CVpH88WMffYYZwdgbtLju43Phq8Lyjrsa4uQn4=; b=Za4tqvfp6iYSc9Ls
	dTFiNSNp8QXlS9irMhg5nJ1t28Hbhk/E+NWH3KDKMjYJ6+iPwHccjZchewLuHs4z
	dGNMqEBdJpeGbuQy7TS5Z2ruavAoQxj7EqnNBUsgtHcseN8gAO0zBNlyYhiqp84c
	QI2v1bRKq2OF2FMkmk27G8dD9ft/Nd8s1hMiRaQl+2sbckGJFn5w7bGDV2RywIqr
	X2VooS4JCHmcGLs6XXAfhhaj2+TN7FamSjya73gqtSZCBKyac2e9Km0+xap6robE
	YWIQvCsz/egCD41xC13lGDJPzHxOLGQ1RNLDst6kncbw29Cf4BL4sY6glKr/qDDi
	wHqaNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62gxgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 10:25:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fbc70cfbdso61137101cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 03:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776939927; x=1777544727; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvCi/CVpH88WMffYYZwdgbtLju43Phq8Lyjrsa4uQn4=;
        b=UJbVc3m7w2sFJezSzNxaz9dJebRv0X2izkBehlcljG9riqz6Llt9xU+GZ+tkuVMh+l
         MWiKjSIXWoG79g4Zni6pCK8SzsARq4ovq7w5BunKzN7D2LyvUC+qanpHzs64w4Q3j48s
         ZXR7sMAFbumXVr4G5H0ODBF0y+j0VGJoSdx4Dd2rzrqIuhbJilygVtuf31d768VGZVz3
         4k2A+v3kuBHajf5jqHiWlLAbQQ5r7e3Y/bD2GBFNTjVDdKOfvzFBhWPjGoHZP4U6+Dgy
         VXmW5ALim4Ttbm0ZiFkdEdYFu8u4fQBI88YPLSIvlNN2BBdoEL9hlas2FBzDutudndBg
         4u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776939927; x=1777544727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvCi/CVpH88WMffYYZwdgbtLju43Phq8Lyjrsa4uQn4=;
        b=WwPGnCFCthFnxsSDy0AfrHpJDm1G76INHkoHwU+Pn93gjLe6zozxBRKpbgJWMruu9z
         Lt8nmO85qJQ7mhD4xNkZhkcekMmISXVUTtytOvKd5Q1w90wQWtUtwU8eIQsnoyA4DPBo
         YtJOOqA21SGh/5wCIorbq0blnGVjf3eEVkB6jmbH//skk5Jh1MC97nG/FEYbeGRmdNze
         VcWs2XM9ly8ADEutTJGJSFPBLn/zVpthpEOnmMIep7l+3lSxg+B/VNrPsm8dY2Ymtp48
         opfglj1vyClR04iEHh/BC3GEwcTXZQ4iryBmJhFfJGSL1zy4dMkwS3eaNCse/IiSA2X/
         J+mw==
X-Forwarded-Encrypted: i=1; AFNElJ8RXIeWBOVSWveRd1vpo1B3YXT+AfYcFFHWDCT2uq5f+g4TgYBCuH0POrv7Z2qoCEWZpBYKSh3sWIoM5B2hf9+s@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm+s1A/G3csHwru/RW+OXbMJ+3lX8wtJrTAZv6HucPKIS+lOXe
	ZDhLcMesOjDC3nxbxoB1wS2dnTmHurIyBAsYULx4QcwJfURpoF5yamvkWlKE6iMUvVYeAMTFjyP
	WKPUTeCJpXg2yKvta5ogY1pWiXXmOoqDT3MnuIO6q4kh+gKFmHQY13E2iAKU7I0lB9G7o7E4rJv
	MQ5Q==
X-Gm-Gg: AeBDietObxxuG6p0kXzwMRS1K+3zWHoZcpTareCCEow/2+Aflty/q5lSjk9hL0m2XpY
	d3u9aQoMuU8l3CCaQKXWGGBL8U7xurKsOj8NdEVka87re7BpWTFnjDu7N7VkxTYQNx0g2ZCCxFv
	gLHnV4QviOsg+hERy+7U9TYrvb15EoPEcBGCMPC/M+i2CU1bWtUICAe/zrIHYXh4v5m673iZ90y
	dieEF3KCPyrQT+0GxDb0l46jxgwQKvYLNrpqLX+u1E3nIfJBVFTeI2uHss4EqbNehW9jCPM/3HX
	J/kcV/bOKl14d2G8E9CxVv/GojFQdP6+zvE+M0viQ7LLNqJ6yfZkKzdIVGQHDeGXHaK2aYFX3SG
	RatS9+Huuxl9ax4Dzyff+ioynlx9nhqSdrypEknIdRsAHbTXSgQsSBAiv/GzDffgBtwnUk+XjKM
	sFZ2Rsvs7M54nUITjxbXM=
X-Received: by 2002:a05:622a:4d4c:b0:50b:4a84:aa8b with SMTP id d75a77b69052e-50e36b87666mr402905881cf.12.1776939926693;
        Thu, 23 Apr 2026 03:25:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4c:b0:50b:4a84:aa8b with SMTP id d75a77b69052e-50e36b87666mr402905491cf.12.1776939926181;
        Thu, 23 Apr 2026 03:25:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412e36ff8bsm3890201f8f.26.2026.04.23.03.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 03:25:25 -0700 (PDT)
Message-ID: <7aaa7873-9274-48d8-a6fe-cff4239b03b4@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
        Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
 <20260421-add-thermal-t7-vim4-v3-4-a2e7215ed003@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260421-add-thermal-t7-vim4-v3-4-a2e7215ed003@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p_oUlDLHumLDyOSk7NgL_7PGAVegwr_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwMiBTYWx0ZWRfXwjCxgHqCmfaH
 bajBhUZuQ2Qh9Tm6FFoc0nCAHWWu6jpQGgqY03x0fmsOc0AgZrMSHV6Deb3S2mi23DS3eLSUV6h
 PG+6NWTVJpKhbnLZXxZnW55que7kQn6WQBMO/UQzcMposhJtAXevYiQNuAWbkupPzi6aaA8QYdR
 gyzq+3I6JrhClpxUV0MkSEnv9KO7HSA7cTr7xgLoyrkGzPYrzFGuXl6MszHYmBIEj7exJT6IDUh
 yWN5Gw5TDOfRWt5+9lM9tA/3QtaHtsPwyjM1MhdLUW/Ea+MSBNgIrov5F9ERAJhi26r27vZ3JtL
 MN587t9Ndho5d7X1Qhp1M/bXYt9ZwAMDMzAf9gUjhnBmelcKCSVTf2nMWzKf0KG5hFOzB8tvE02
 UMlnZb6hv+2u3ScTS/mPaBtLLc7kaBrkIz6IHVALQ0ChVbLJ4NfBngvyAV/a7+SjNKwGgB2TZAj
 NaLrpJ+wWZjC629kUFA==
X-Proofpoint-ORIG-GUID: p_oUlDLHumLDyOSk7NgL_7PGAVegwr_R
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69e9f397 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=SxES-kZrre8EIFdHpqEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_032528_382617_6B89BD69 
X-CRM114-Status: GOOD (  31.56  )
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


Hi Ronald,

On 4/21/26 09:19, Ronald Claveau wrote:
> Some SoCs (e.g. T7) expose thermal calibration data through the secure
> monitor rather than a directly accessible eFuse register. Add a use_sm
> flag to amlogic_thermal_data to select this path, and retrieve the
> firmware handle and tsensor_id from the "amlogic,secure-monitor" DT
> phandle with one fixed argument.
> 
> Also introduce the amlogic,t7-thermal compatible using this new path.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/thermal/amlogic_thermal.c | 58 +++++++++++++++++++++++++++++++++++----
>   1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index 5448d772db12a..11e3948cc0669 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -25,6 +25,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/thermal.h>
> +#include <linux/firmware/meson/meson_sm.h>
>   
>   #include "thermal_hwmon.h"
>   
> @@ -84,12 +85,14 @@ struct amlogic_thermal_soc_calib_data {
>    * @u_efuse_off: register offset to read fused calibration value
>    * @calibration_parameters: calibration parameters structure pointer
>    * @regmap_config: regmap config for the device
> + * @use_sm: read data from secure monitor instead of efuse
>    * This structure is required for configuration of amlogic thermal driver.
>    */
>   struct amlogic_thermal_data {
>   	int u_efuse_off;
>   	const struct amlogic_thermal_soc_calib_data *calibration_parameters;
>   	const struct regmap_config *regmap_config;
> +	bool use_sm;
>   };
>   
>   struct amlogic_thermal {
> @@ -100,6 +103,8 @@ struct amlogic_thermal {
>   	struct clk *clk;
>   	struct thermal_zone_device *tzd;
>   	u32 trim_info;
> +	struct meson_sm_firmware *sm_fw;
> +	u32 tsensor_id;
>   };
>   
>   /*
> @@ -138,6 +143,12 @@ static int amlogic_thermal_initialize(struct amlogic_thermal *pdata)
>   	int ret = 0;
>   	int ver;
>   
> +	if (pdata->data->use_sm) {
> +		return meson_sm_get_thermal_calib(pdata->sm_fw,
> +						  &pdata->trim_info,
> +						  pdata->tsensor_id);
> +	}
> +
>   	regmap_read(pdata->sec_ao_map, pdata->data->u_efuse_off,
>   		    &pdata->trim_info);
>   
> @@ -226,6 +237,12 @@ static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
>   	.regmap_config = &amlogic_thermal_regmap_config_g12a,
>   };
>   
> +static const struct amlogic_thermal_data amlogic_thermal_t7_param = {
> +	.use_sm			= true,
> +	.calibration_parameters	= &amlogic_thermal_g12a,
> +	.regmap_config		= &amlogic_thermal_regmap_config_g12a,
> +};
> +
>   static const struct of_device_id of_amlogic_thermal_match[] = {
>   	{
>   		.compatible = "amlogic,g12a-ddr-thermal",
> @@ -239,6 +256,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
>   		.compatible = "amlogic,a1-cpu-thermal",
>   		.data = &amlogic_thermal_a1_cpu_param,
>   	},
> +	{
> +		.compatible = "amlogic,t7-thermal",
> +		.data = &amlogic_thermal_t7_param,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);
> @@ -271,11 +292,38 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>   	if (IS_ERR(pdata->clk))
>   		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");
>   
> -	pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
> -		(pdev->dev.of_node, "amlogic,ao-secure");
> -	if (IS_ERR(pdata->sec_ao_map)) {
> -		dev_err(dev, "syscon regmap lookup failed.\n");
> -		return PTR_ERR(pdata->sec_ao_map);
> +	if (pdata->data->use_sm) {
> +		struct device_node *sm_np;
> +		struct of_phandle_args ph_args;
> +
> +		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +						       "amlogic,secure-monitor",
> +						       1, 0, &ph_args);
> +		if (ret)
> +			return ret;
> +
> +		sm_np = ph_args.np;
> +		if (!sm_np) {
> +			dev_err(dev,
> +				"Failed to parse secure monitor phandle\n");
> +			return -ENODEV;
> +		}
> +
> +		pdata->sm_fw = meson_sm_get(sm_np);
> +		of_node_put(sm_np);
> +		if (!pdata->sm_fw) {
> +			dev_err(dev, "Failed to get secure monitor firmware\n");
> +			return -EPROBE_DEFER;
> +		}
> +
> +		pdata->tsensor_id = ph_args.args[0];
> +	} else {
> +		pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
> +			(pdev->dev.of_node, "amlogic,ao-secure");
> +		if (IS_ERR(pdata->sec_ao_map)) {
> +			dev_err(dev, "syscon regmap lookup failed.\n");
> +			return PTR_ERR(pdata->sec_ao_map);
> +		}
>   	}

I suggest to separate these two routines into functions. That will help 
the readability.

>   	pdata->tzd = devm_thermal_of_zone_register(&pdev->dev

The thermal zone is registered before calling 
amlogic_thermal_initialize(), thus pdata->trim_info is not initialized. 
When a thermal zone is registered the thermal framework reads the 
temperature, so it reads an invalid value because:

devm_thermal_of_zone_register()
  -> thermal_of_zone_register()
    -> thermal_zone_device_register_with_trips()
    -> thermal_zone_device_enable()
       -> __thermal_zone_device_update()
         -> __thermal_zone_get_temp()
           -> amlogic_thermal_get_temp()
              -> amlogic_thermal_code_to_millicelsius()
                  [ Use of uninitialized pdata->trim_info ]

Right ?

IIUC, amlogic_thermal_initialize() can be also split and moved the 
corresponding blocks to the functions to be created in the comment above.


> 


