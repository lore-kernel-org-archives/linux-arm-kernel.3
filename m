Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31EBC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NqxrxK3xet8+h8NdpIJWE0d4FKW87vOgxxpkOISpEs=; b=e13Dgt9Rk2ICuQlohrNp4AKxnA
	lomA3Aod0xER2m1FMVg0OQgFwYrQGHNznB7Nd+FSp2Q5/FuTYRBmrDeWS6f2fCo0kYBrJvyX1F6BY
	CUOv4MEcEQo625LO277h5Wbv226XpnxHOmcCOnxfN3VQ6BpXupU4tJTl4eH1V8afT+vIztew4zTDr
	37GNykvyK6UjnElocl2ze69Y+kVBzkEpZeoKisxvuMFrQvvAz14Uq/j2mDgw2475cMhYbRTu0BCgz
	aCMvaAkTswNTNdcO1CqoJjnRq1rJnCXzBJ4fxUlmd86DB3KaALdzJTQBL1vfg+9Vg5jFkf58QrPU9
	r8sHxFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKi3-000000092LY-3kzG;
	Fri, 07 Feb 2025 09:31:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKfK-000000091cH-1SLF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:28:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770MJr016568
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Feb 2025 09:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NqxrxK3xet8+h8NdpIJWE0d4FKW87vOgxxpkOISpEs=; b=ntYJUBZBAEroMqow
	mnj8ab2Di391eqecP8vTQu5LJSa060xRl0VQGhxs+O6xRd8uaUSJcUl29fpAz5s8
	2Y7lmBlyW5/iTaKCBmCtVO0hdf70ViVbw6VLCz8b7EuYNLNDCC4d+n0VVdyY+dLK
	+ri611+AnFNBPJEOMvwwdmAZKgNr5umdwvs1JsTDbR4KQhHMuqDBTmXb8FjJ5yuo
	1DXxrMMZHK4fRBqVT2QeJAAv3QE3tu8s/0sTJ4A9ocWa1Or58+SYk06IetzoZ8BR
	7yo3+PU8POBIFbMzo13M1wkehrdCbZgd3uScAKcZRrdF+wAStF/uzYK2m0c3sR7i
	M9dsAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddh0ca1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 09:28:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21f5067e443so10202595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 01:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920528; x=1739525328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NqxrxK3xet8+h8NdpIJWE0d4FKW87vOgxxpkOISpEs=;
        b=dYvkR4Y/BS/W7V7A7oI4Jl7cnAD/Eki/qevq6QKKEuwkQGBN4wwy/XCgy+MiFIeT66
         WPQay2OLXY0FUnba/057EG+htXuBTerPfeWq2ez7Qjaj+ncSclpF13cES9WR51ShqUaD
         mmHGmBcajnlLgOyK2DKKhgeli/EANPLxqX39LK3rLv/ID0RXm/lwvw0iI4G2e03/U8ys
         yHylpBLfi92mA7Ljj6GM7Kn7U6osbba1/IyFtaFt7JjYNI5BbajAg5XjK4K4L1TCW67p
         25hm6J5A8gSP5XLxpGMoFiCKJAsqSpJq8ZURgpEUwZx+NhPblsYSBMFG8dHXRbell2aO
         ShYQ==
X-Gm-Message-State: AOJu0YylXcCm4EIBDwmOdEn/X5vb57l1wt8JKOxXUU+NGYiNym81vsk0
	UEhfdmN8updxfolpe0oBoJ9e8r7gIXMe1Beq9eAnGDlU4Ih+WM85oH5zP05bIV1dPAP6aO7hIJI
	6+HqTzj4Jow7JmEcz6Pk+XQmXpbgMIXltiDuoc1hv0LjYzML9BZ0k9TZohH035AhZyVMaoiWG6Q
	==
X-Gm-Gg: ASbGncuQsK2l4u2GNfwb29i7C8+j9nEzqUK5Wh2e8h+P2Z7SsrNF4a7zztWScNSWEbh
	wW1wkOM/09PbFdAvKiGnbTgsIqyVS/XC2DnEKS5gMknMkuBFHasy0d0Jsg/y4rhD1SKAJy9E8/T
	+jHJxDR9aD4zLaQaWF7lRhmmpT5yShFh3T0Ee5WLOtsvvIH/64Eu+RUmuc0ycyg0NG2SEfs7KLz
	Ud0tnMZOIkU6+e4ggCQ5zA9Q557D4Mv5y9npWg/tOxki6IDu8bcg9GEuyqkot/hNkP4VdvK48Il
	ds1Bq1DT3ZLlysYdVjZwG2sB5EdmOiCB9bcWDDYIFrjpRjJZQlQE7TjRFE9zQyY=
X-Received: by 2002:a17:902:fc4f:b0:21a:8769:302e with SMTP id d9443c01a7336-21f4e6ad349mr47724595ad.14.1738920527977;
        Fri, 07 Feb 2025 01:28:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdITSY3Xbsq3qeExulM7OKAMdr3dJ0xmAXSbW0AXp7CYFXVCNY98Q+WzzN9OaitkXgQXgptQ==
X-Received: by 2002:a17:902:fc4f:b0:21a:8769:302e with SMTP id d9443c01a7336-21f4e6ad349mr47724115ad.14.1738920527391;
        Fri, 07 Feb 2025 01:28:47 -0800 (PST)
Received: from [10.133.33.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36896b86sm26147275ad.212.2025.02.07.01.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:28:46 -0800 (PST)
Message-ID: <61045cc3-d030-4c63-8a1b-103ff8c374f3@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 17:28:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250207090422.1609260-1-quic_vikramsa@quicinc.com>
 <20250207090422.1609260-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250207090422.1609260-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g8v7uJKNX6ENQKp1o5wfmUO-ok2EN0Rz
X-Proofpoint-GUID: g8v7uJKNX6ENQKp1o5wfmUO-ok2EN0Rz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_012850_409843_AD9EFD96 
X-CRM114-Status: GOOD (  20.54  )
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



On 2/7/2025 5:04 PM, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  4 +
>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 89 +++++++++++++++++++
>   2 files changed, 93 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 140b0b2abfb5..213d941b1b79 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -116,6 +116,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +
> +qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> new file mode 100644
> index 000000000000..2a59d2f22eb8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
It's 2025 now, it should be 2024-2025.

Thanks,
Jie

> + */
> +
> +/*
> + * Camera Sensor overlay on top of rb3gen2 core kit.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* The port index denotes CSIPHY id i.e. csiphy3 */
> +		port@3 {
> +			reg = <3>;
> +
> +			csiphy3_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-1 = <&cam2_suspend>;
> +
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply = <&vreg_l18b_1p8>;
> +		avdd-supply = <&vph_pwr>;
> +		dvdd-supply = <&vph_pwr>;
> +
> +		port {
> +			imx577_ep: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam2_default: cam2-default-state {
> +		pins = "gpio67";
> +		function = "cam_mclk";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam2_suspend: cam2-suspend-state {
> +		pins = "gpio67";
> +		function = "cam_mclk";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +};


