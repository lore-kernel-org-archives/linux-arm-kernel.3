Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5426ED60CEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJNsNXFftV73a7f1HlGoO9KUog+cN+4rISawA+ehEYI=; b=abzNY2PMmBnrEnEXwXqB7bAyp3
	RmrT8PuAwId3uDOWMvFMb//yB+xj8JtSBQVXe/QazPZNhnJTjzxsxNfZR+bKIctiOQHjqbZzQPrJA
	lpoa08+1fCE09rBXpJU3pMGygmwWpmBSJEfaSSThZE2m5qsu4MY+k2chBJcjA8qBxPrX1sxVGcFC5
	jCxakpNMyJKVJjXlnqVF7TXepHNTFfTdtD7dmeq0qzqg89jTZ1WH5xRGWCisQzLtMBk4Ymu/dsrCC
	2KGVzYR64ZCmF3dFRlaSFyLcj4XhMbfjSjbae9hrFGRKZ/lq+By0F6yXTY+iyAqpopHRdH4+OTX9I
	i20FxZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDA3j-0000000Ak1I-2xhg;
	Mon, 18 Nov 2024 22:17:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDA2n-0000000AjtP-3pTg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 22:16:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGpkX006018;
	Mon, 18 Nov 2024 22:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJNsNXFftV73a7f1HlGoO9KUog+cN+4rISawA+ehEYI=; b=LUKlTLWnHdiiqCAP
	CsNY9tbAK+DLSLDayvQefHLy/B6Q7r6X9cYT44c7fBsl4jVlV5aEeFeAAXcGR8tZ
	5Vw2zoW10l2Vj2ORIitP7hHHGpt7ztISw3pUFkxK1BVPqpUUt67eNMvOJI1ME6bP
	LIiE+ouAZ5Vl/2PNw5uWE7YtUbC8XTZ5WgFCUie8yxsHxA8G1HVeV20TaTPwp3QM
	xLImPnNr6Hg84O+mi97QWGdkmUeJVpS7z8vReBXY3DvGkFiP+hc9S5VK62sgTfzi
	m8ocRzcWrKw9DjQmYakuarSwcZrevA7731a0VY4iNg4JGwLLrSYSPNqBtmMidTik
	itWe5g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8grm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 22:16:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AIMGAsb007634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 22:16:10 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 14:16:09 -0800
Message-ID: <7062700e-1e96-4856-816a-ceefa0afd75c@quicinc.com>
Date: Mon, 18 Nov 2024 14:16:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: Add pmd8028 and pmih0108 PMICs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Arnd
 Bergmann" <arnd@arndb.de>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
	<nfraprado@collabora.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
References: <20241112004936.2810509-1-quic_molvera@quicinc.com>
 <20241112004936.2810509-3-quic_molvera@quicinc.com>
 <r4slda74u7rpqiybsylrnoqiqo5qm4442rfwzhtjkwkkgqt25g@n5idmspl7sfd>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <r4slda74u7rpqiybsylrnoqiqo5qm4442rfwzhtjkwkkgqt25g@n5idmspl7sfd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s2vAzRuX-8NLCGbpzQenK-qU99mxDK-3
X-Proofpoint-GUID: s2vAzRuX-8NLCGbpzQenK-qU99mxDK-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=878 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_141629_966270_B96D9DD6 
X-CRM114-Status: GOOD (  16.51  )
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



On 11/15/2024 6:58 AM, Dmitry Baryshkov wrote:
> On Mon, Nov 11, 2024 at 04:49:32PM -0800, Melody Olvera wrote:
>> From: Jishnu Prakash <quic_jprakash@quicinc.com>
>>
>> Add descriptions of pmd8028 and pmih0108 PMICs used on SM8750
>> platforms.
> Up/lower case?

Up; will change.

>
>> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pmd8028.dtsi  | 56 +++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/pmih0108.dtsi | 62 ++++++++++++++++++++++++++
> Those two are independent changes. Please use two separate patches.

Sure thing. Will split.

>
>>   2 files changed, 118 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
>>   create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pmd8028.dtsi b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
>> new file mode 100644
>> index 000000000000..f8ef8e133854
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
>> @@ -0,0 +1,56 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +/ {
>> +	thermal-zones {
>> +		pmd8028-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmd8028_temp_alarm>;
>> +
>> +			trips {
>> +				pmd8028_trip0: trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				pmd8028_trip1: trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "hot";
> "critical" ?

Will add.

>
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&spmi_bus {
>> +	pmd8028: pmic@4 {
>> +		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
>> +		reg = <0x4 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		pmd8028_temp_alarm: temp-alarm@a00 {
>> +			compatible = "qcom,spmi-temp-alarm";
>> +			reg = <0xa00>;
>> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>> +			#thermal-sensor-cells = <0>;
>> +		};
>> +
>> +		pmd8028_gpios: gpio@8800 {
>> +			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
>> +			reg = <0x8800>;
>> +			gpio-controller;
>> +			gpio-ranges = <&pmd8028_gpios 0 0 4>;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
>> new file mode 100644
>> index 000000000000..3907d8fbcf78
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
>> @@ -0,0 +1,62 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +/ {
>> +	thermal-zones {
>> +		pmih0108-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmih0108_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "hot";
> "critical" ?

Will add.

Thanks,
Melody

>
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +[...]

