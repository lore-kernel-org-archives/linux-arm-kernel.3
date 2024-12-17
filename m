Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7213E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9Plx0bNtmhuCufstSEhSAO/gEk2mv9F+4PnW9ec0Z0=; b=vAUjJ9CnFGtTzyX2K9zZxdRc1O
	kwYontanZy/sdCN/8c6CyMVbd4VnyHArBkjTiI8osIGYmnujMnIdLIYcByYH5GF3nJ178f8itoPpa
	3RVG01RQsJ+Bq+uZbSD6rWk3ddpHxE3PDtqWpVGOcY/BZJ5VmSOrAE7aBcHcFjIh1laCRjkkalWLw
	6fio/C1u54c9nwoDdnpKiLUrqS84e1edAgTsJvQm+Qt+Tv51tBlVh1cmksY7cjj9WkAG+0M9F5QLt
	QsPJ3BZeDj9x1WKShwfth+7OzzN04C0IKm+e1w3lLUJN4hEB6zpFmXARD+yq99zoeYZtG8zUQOXG8
	RuJY/K+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbza-0000000ET0q-1mUo;
	Tue, 17 Dec 2024 18:08:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbhO-0000000EPfx-16uY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:49:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHEpfEQ003754;
	Tue, 17 Dec 2024 17:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9Plx0bNtmhuCufstSEhSAO/gEk2mv9F+4PnW9ec0Z0=; b=nHI5CiiRmzFe/BbZ
	qb9ufp4rpgFDeuvZsDsnPrPAB2BXqneScgQKxYEwvwEb6lEh+pd9mjWB8pSAx+vb
	bmeZ4b4AJ8zF1gJfhQQDPMCuwZMsJuzHdnl2GuBnreryycnwZVYAFs8Q4H+Uhp3f
	Q9eltaMyaKCt2NlHG81ol8AbYC5V7Kgbfl09rmTZlY7gtrVieMInNGtWV3OArJYR
	zBgnBrYvyaKDwMyQfEowEpk0I9pYtzHLnuUIcuAedCSpHGZ026CwIALFhf+V+ljU
	95jENX7qERLKVfc3aERFvznl5w3E9H2cAfO7h34roUV+NuliW5gGyzfOw26FzUw0
	ed78LA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kbedrgsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:49:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHHnNU6014832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:49:23 GMT
Received: from [10.50.34.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 09:49:13 -0800
Message-ID: <3e6ab7aa-c606-49bc-8cc5-24c8a1edc081@quicinc.com>
Date: Tue, 17 Dec 2024 23:19:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
 <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LIEX0_8K3eKu5wFpoMUkSDZCo6_8Oee2
X-Proofpoint-ORIG-GUID: LIEX0_8K3eKu5wFpoMUkSDZCo6_8Oee2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_094934_300712_57C0398C 
X-CRM114-Status: GOOD (  23.52  )
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

On 12/17/2024 8:10 PM, Vladimir Zapolskiy wrote:
> On 12/17/24 16:06, Vikram Sharma wrote:
>> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
>> Enable the IMX577 on the vision mezzanine.
>>
>> An example media-ctl pipeline for the imx577 is:
>>
>> media-ctl --reset
>> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>
>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F 
>> /dev/video0
>>
>> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 109 ++++++++++++++++++
>>   2 files changed, 113 insertions(+)
>>   create mode 100644 
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>> b/arch/arm64/boot/dts/qcom/Makefile
>> index 4686f2a8ddd8..a7e88fcabded 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -115,6 +115,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += qcs404-evb-1000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs404-evb-4000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs615-ride.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs6490-rb3gen2.dtb
>> +
>> +qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb 
>> qcs6490-rb3gen2-vision-mezzanine.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_QCOM)    += qcs6490-rb3gen2-vision-mezzanine.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs8300-ride.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs8550-aim300-aiot.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs9100-ride.dtb
>> diff --git 
>> a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso 
>> b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
>> new file mode 100644
>> index 000000000000..7782c4aee576
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
>> @@ -0,0 +1,109 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +/*
>> + * Camera Sensor overlay on top of rb3gen2 core kit.
>> + */
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/clock/qcom,camcc-sc7280.h>
>
> Please sort the header files alphabetically.
Thanks for your comments Vladimir.
Will take care in next version.
>
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>
> Please put these two lines right after the comments header.
ACK.
>
>> +&camss {
>> +    vdda-phy-supply = <&vreg_l10c_0p88>;
>> +    vdda-pll-supply = <&vreg_l6b_1p2>;
>> +
>> +    status = "okay";
>> +
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        /* The port index denotes CSIPHY id i.e. csiphy3 */
>> +        port@3 {
>> +            reg = <3>;
>> +
>> +            csiphy3_ep: endpoint {
>> +                clock-lanes = <7>;
>> +                data-lanes = <0 1 2 3>;
>> +                remote-endpoint = <&imx577_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&cci1 {
>> +    status = "okay";
>> +};
>> +
>> +&cci1_i2c1 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    camera@1a {
>> +        compatible = "sony,imx577";
>> +
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
>> +        pinctrl-names = "default", "suspend";
>> +        pinctrl-0 = <&cam2_default>;
>> +        pinctrl-1 = <&cam2_suspend>;
>> +
>> +        clocks = <&camcc CAM_CC_MCLK3_CLK>;
>> +        assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        dovdd-supply  = <&vreg_l18b_1p8>;
>
> Please remove double space before '='.
Sure.
>
>> +        avdd-supply = <&vph_pwr>;
>> +        dvdd-supply = <&vph_pwr>;
>> +
>> +        port {
>> +            imx577_ep: endpoint {
>> +                clock-lanes = <7>;
>
> It is an invalid property/value of the sensor, please remove it.
Will check more on this internally and respond back.
>
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <0 1 2 3>;
>
> data-lanes = <1 2 3 4>;
Will check more on this internally and respond back
>
>> +                remote-endpoint = <&csiphy3_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&tlmm {
>> +    cam2_default: cam2-default-state {
>> +        mclk-pins {
>> +            pins = "gpio67";
>> +            function = "cam_mclk";
>> +            drive-strength = <2>;
>> +            bias-disable;
>> +        };
>> +
>> +        rst-pins {
>> +            pins = "gpio78";
>> +            function = "gpio";
>> +            drive-strength = <2>;
>> +            bias-disable;
>> +        };
>> +    };
>> +
>> +    cam2_suspend: cam2-suspend-state {
>> +        mclk-pins {
>> +            pins = "gpio67";
>> +            function = "cam_mclk";
>> +            drive-strength = <2>;
>> +            bias-pull-down;
>> +        };
>> +
>> +        rst-pins {
>> +            pins = "gpio78";
>> +            function = "gpio";
>> +            drive-strength = <2>;
>> +            bias-pull-down;
>> +            output-low;
>> +        };
>
> I have doubts that it's proper to embed a reset gpio into driver's
> pinctrl suspend/resume power management.
>
> Konrad, can you please confirm that it's really accepted?
>
> I'd rather ask to remove this reset pin control.
Will discuss this with Konrad and respond.
>> +    };
>> +};
>
> -- 
> Best wishes,
> Vladimir

Best Regards,
Vikram


