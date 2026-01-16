Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CDFD4A61A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=; b=3Soj/D+C3xq8d+zWfEQLn+3MWI
	4WKJtM7p7UtOrhxvh2TY7CCyBzzaWuPmbAgr3lMXAQha+Y4kLrE7O6liEqZaYsLzsZaxyAG4xJ/UI
	qBM4peU4MkgNhqPv2nuai8bm91aLIlDzUG2KKljiG/uaxx1JxhG2OQM+jLyLfObHntUKvyrsW4j87
	GykxrUJQ5pYymrmbAvZXUVv0hq0JJ+BcmzJL70eDb/4mZjclsOlcSYdWUFDcyB5j2YEAdhE/PURMZ
	q1IXVvxKWWxOgaHLxIgf7BXn5kBdoV75W3i9fK9fJwsFLyif2aM2b31S/BsnryojSRf/9rKZiMThB
	XEiDlC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggCR-0000000Driy-3jfr;
	Fri, 16 Jan 2026 09:32:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggCP-0000000Drib-3Hyb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:32:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7cV9w3076690
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 09:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=; b=fhMJDEgoNHMyq9oY
	W1rEXEsbFons1+UH1kZ8oyHfbxIXEFV8DzBubq16FLbeytjOV0b4HEbJx/8FHnTz
	6qP7a5TjXaZ4xm2uM0r/vet2FDVznVQ9AuoiBGcg9fz209FYZdZJ4oa3/1MbB8WG
	RjmnoLRCVd31ih0Ya9CABi2vjndlzCQQElmOaCoMoFXjFbDFNh8QvYTm18b6/VnL
	oXstbRDXUrcFKswPQ+p06yVWFkgm8/3yUQEJJsuefT0PKUGjZiFXEB00xxs3N1Z5
	EjXz7i8Mjk5Oe2eKE0j+6IXH9G4muJW1Cp9L14VNmf7dzaU+x+VKJfX25B6+9NOq
	haA5Wg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98jsmmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 09:32:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b234bae2a7so530268785a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 01:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768555976; x=1769160776; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=;
        b=U0Xg/m1CHJsYgXXU/z1uxiIqJTcSuwxxSH923SFtp7sScrHO9htdGuAiuPBxxY8BBR
         lw1YMEuBSacMySzxNoFwMhwQkZ/2VgO3uyyPauCwa/QipOq82HBQDo730099wKkGNrI9
         T81SDUBzSEfGHCGHhmwWi/T/BkbXGuVEWYs5eyVyh4bvgixjOW7Na14BIvJ3689M5vDE
         2PF0KEDMt/AnjoLaNiHsALAQctr8vx9MO8xhQv418a6wgi1/yvhyACcK4nMktYqBmTXj
         XTXwHsCa+rtRjmdAgVzYRuloNP3eV7OW9AmaxHtQPTtaf7tGTtQ6Dhf3b4wXzDvfbWhI
         7hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555976; x=1769160776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=;
        b=FcapzIlxbRyPCCSZAfAc1ZTGhVMm3LFtXMGzit4WXFGGN73jwNYhroTq45hDnqHiDW
         ujwqd2A7OIQxg8+2YWe1DOLnaHNDyHx8H1ftbFs6YQAIsKozVsjVo08/H5FfhiyCWNH0
         +tgtXPxMqKsLxBZCVlchJwQW2Nj3ekmRuhEKA4o216iXW43i0aqPKxaDUVZCFn2+uCcr
         qpswObWfv0onttzCdqAWszut4Zy98D9EIXLHqFfnB50vFJ52oQJ3VdTOcPjocoE0mHUC
         uggF65p7AcV99gcwgpvc2HCfBSiSpBsNDqPMZj9S+hkbByhu9nVSZ+raoh48KGfQdkyP
         C7cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJR5fjIaU6Jk1+wQZUqGhzJs2AZHWLrNBSQYpGhCcjjX7DewJcCtP9upf+MOVIVMtjUr/oAJ4y/bNrlxaqP3sK@lists.infradead.org
X-Gm-Message-State: AOJu0YzbkWy8GAN0mgKvuxYqYR/rLfjMCCQazNy2tcGC53lYqzTM+azu
	anedsdNBuoKpDzx4KutinfhQ7ZwpbRaqGk5ml9qrkUPH68wqSjpbs1n1uV5BiDHzGVIQrIB+dlj
	DbZfkH+5m4UkwHaqNEVhiysko4WUDr+fW6405c06ooCGo/KolCuqaHrOaGKRZy9/jd+YNBxPdob
	r2lw==
X-Gm-Gg: AY/fxX4fftdap4cUVcJLfTC3xP1KGiwi80AJXBBwSKfPBx7Y6qdlUGJhyE91webbupr
	LhRCVwWalLUgtcPbuxEJ8/4iscLuRhTv4QnD0b+vYsIebd0+I0lP+jbkHVWPuG6R692TqcQxZ6Y
	ajMhN+/qLpPCDc0Nl4m7czd2a02Mhi13tWNyyMOT0nc5+jA2vaF5XAuvrDXM2IZ7tBWHBK/U5WF
	6D2DNTKaQm16U0EXMnOFFVPbEzhXFe5rmC4Ln0iWyy24K0RBOGoSVAVwDDnQzoT3JtCfGmm/XNS
	P2tRY0dxtZnnPJeS0+dgQ/NND/6WZDWppHYhgFOSSjxu6T+iWNE+xsql5glYjyXgXR/h2sR/9EY
	exCsc/WaNsHgWbFpwcHwpg3SNrGBlgSP0lCukCugxovHfsHkIWf488AnVl55QHikTelTfsGuO1Q
	==
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr306190985a.67.1768555975731;
        Fri, 16 Jan 2026 01:32:55 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr306188385a.67.1768555975194;
        Fri, 16 Jan 2026 01:32:55 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72602f3sm186480285a.40.2026.01.16.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:32:54 -0800 (PST)
Message-ID: <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 17:32:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
 <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=asW/yCZV c=1 sm=1 tr=0 ts=696a05c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tQJASglR_GpgkQO9bp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dr4h7YzIlwUBTpLcS6sNGFHSkSfh6hgk
X-Proofpoint-GUID: dr4h7YzIlwUBTpLcS6sNGFHSkSfh6hgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MCBTYWx0ZWRfXxghD1dkU7aFv
 /+k/6UjxoxsNwp+rgcLddnhekd125WasRMZdWwQpdpq8/ZE4VzMyJBtt3vaiIdN9PJMpb35cyb0
 h160mEd8L+MbIOYVPJfQMKi0TgrNArC+h0t6l1H+M57L1DeceVUB9PcvR23mfWAzSnJxDMzq2eg
 1UgSLQcg31fWLvPWmxQWLb1b3EyVtHldhDb0vP9Z+EmPLGmDuGtqqzupyc0gmA307+VnbD+JFBn
 OnzohRGia7Y5vY16cbQX9cMo6KB3mmxHFnAFHjJlGBTiNqAzQL/gHmndUMUoz/T6KNv/E888iDt
 m7t2rmyST3luj93/z7YNuT+pg5NOEZUL83OQ9/6srykIW+FMk52f7lmLz4NLrMDp43XFO8amk6S
 eG+hQ9Ps9V2Jkwn7VJf6tF+qdfZVE6D+Rms4YgUhnPkIYUOatqtDH9BlbgRwBhv/aFCj3AKE4K5
 mzGKCCS8Cz68dv4V4PQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_013257_971487_2BC245A6 
X-CRM114-Status: GOOD (  16.36  )
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



On 1/16/2026 5:12 PM, Vladimir Zapolskiy wrote:
> On 1/15/26 12:12, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this DTSO has enabled the Arducam 12.3MP
>> IMX577 Mini Camera Module on the CSI-1 interface.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++ 
>> ++++++++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/ 
>> qcom/Makefile
>> index 
>> 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>> +dtbo-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtbo
> 
> Please remind me, what does dtbo-y Makefile target serve for?
Rob mentioned:
https://lore.kernel.org/all/20260106192609.GA2581379-robh@kernel.org/

I checked, dtbo- is not an upstream usage, it will be updated form 
dtbo-$(CONFIG_ARCH_QCOM) to dtb-$(CONFIG_ARCH_QCOM) in the next version.

Thanks,
Wenmeng>
>> +talos-evk-camera-imx577-dtbs    := talos-evk.dtb talos-evk-camera- 
>> imx577.dtbo
>>   talos-evk-lvds-auo,g133han01-dtbs    := \
>>       talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>   x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>   dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit- 
>> el2.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/ 
>> arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&camss {
>> +    vdd-csiphy-1p2-supply = <&vreg_l11a>;
>> +    vdd-csiphy-1p8-supply = <&vreg_l12a>;
>> +
>> +    status = "okay";
>> +
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@1 {
>> +            reg = <1>;
>> +
>> +            csiphy1_ep: endpoint {
>> +                data-lanes = <0 1 2 3>;
>> +                remote-endpoint = <&imx577_ep1>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&cci {
>> +    status = "okay";
>> +};
>> +
>> +&cci_i2c1 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    camera@1a {
>> +        compatible = "sony,imx577";
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>> +        pinctrl-0 = <&cam2_default>;
>> +        pinctrl-names = "default";
>> +
>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        avdd-supply = <&vreg_s4a>;
>> +
>> +        port {
>> +            imx577_ep1: endpoint {
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <1 2 3 4>;
>> +                remote-endpoint = <&csiphy1_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>>
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 




