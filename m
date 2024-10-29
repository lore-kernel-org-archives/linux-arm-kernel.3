Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0C6D2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjNHLSsUGuFmGlERPGDh+LCYmNQGD33Ek78v1YDjssc=; b=KQWqxM/6/3qavPH9i0ad8IsV8Y
	Hg44VlT6Dr1b89n1QFhZwyvE47Rz89yZFewnCNo7ER+EW+wsgPpBeY2bhDYdzDEFlr6x3+/1G6c+R
	RZdbaLJD+2t4CigEqdwh3ILH8/knxy12BH3NIxP5lY7KSgaDMbtn1H3Ud3GSjLywee0npsjSeUxzY
	KbhMqBKa2zd4Bcbjaj0B/e5L8OhtGm81Cy8xDEh5Qsu8dCY+jd2Z/PYrMwbaMwg0QQ/0NrZ3xeHKy
	W5b3Elu13fkvgRmkH2AbDIYByPL/7VSoiWQsYrKoMD0eBkUovKHhoIZrsv/LdePnj2X+2FRceAolf
	dnKK9c1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mgA-0000000EdvU-0kuq;
	Tue, 29 Oct 2024 13:54:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mJf-0000000Ea40-0JWj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 13:31:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9PT2s007682;
	Tue, 29 Oct 2024 13:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjNHLSsUGuFmGlERPGDh+LCYmNQGD33Ek78v1YDjssc=; b=mAt5fIy0NEQ9tWLk
	sY8gQ2lZ1Bm9KGukV6aBh2zEo/BWcYTkqbV7yIPSHv6OByrEdQXu72tkqSO5YxLm
	FfVe0cdjlTUbteSWQoahuOXPjpnF2i59xOo+DhxB4v2DZgkYXzbPZomGSeo8LH+4
	wIYCuqBjYpz0ONvp9Ok1oLc4bs5aJ1flx3Ghr3SmqiOVcKntc/6oBLoFmqNee5nt
	HNmDh/LfEO1SShbAq6eMDj8vyzqSWZHfIadDM9vK03FDgKvWRjvfKaNhoinate9E
	zHaxRPZhqo7ZMfOekQo57cjHADfaH/Y6g54vAdUNrOjtmlIwznsCDnaL1tF3PyN3
	i7+8+w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt70f8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 13:31:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TDVEHD014690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 13:31:14 GMT
Received: from [10.253.37.153] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 06:31:08 -0700
Message-ID: <b5e6e81e-dab2-43d8-b52e-85b6cb0d0209@quicinc.com>
Date: Tue, 29 Oct 2024 21:31:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241028-qcom_ipq_cmnpll-v5-0-339994b0388d@quicinc.com>
 <20241028-qcom_ipq_cmnpll-v5-4-339994b0388d@quicinc.com>
 <crcbzpxjnbceilqccbwr7uyak6z6zdwr7mhfcyaw6vvpcce6ko@zrojbtqi4st4>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <crcbzpxjnbceilqccbwr7uyak6z6zdwr7mhfcyaw6vvpcce6ko@zrojbtqi4st4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nWv7Wst7ajudcR5l84aK1YXFfY-RmoFz
X-Proofpoint-GUID: nWv7Wst7ajudcR5l84aK1YXFfY-RmoFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_063123_270241_696B1870 
X-CRM114-Status: GOOD (  23.99  )
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



On 10/28/2024 11:39 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 28, 2024 at 10:04:11PM +0800, Luo Jie wrote:
>> The CMN PLL clock controller allows selection of an input clock rate
>> from a defined set of input clock rates. It in-turn supplies fixed
>> rate output clocks to the hardware blocks that provide the ethernet
>> functions such as PPE (Packet Process Engine) and connected switch or
>> PHY, and to GCC.
>>
>> The reference clock of CMN PLL is routed from XO to the CMN PLL through
>> the internal WiFi block.
>> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.
>>
>> The reference input clock from WiFi to CMN PLL is fully controlled by
>> the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
>> Based on this frequency, the divider in the internal Wi-Fi block is
>> automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
>> ensure output clock to CMN PLL is 48 MHZ.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 16 ++++++++++++++-
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 26 +++++++++++++++++++++++-
>>   2 files changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> index 91e104b0f865..f026c2a9d0c0 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> @@ -3,7 +3,7 @@
>>    * IPQ9574 RDP board common device tree source
>>    *
>>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   /dts-v1/;
>> @@ -164,6 +164,20 @@ &usb3 {
>>   	status = "okay";
>>   };
>>   
>> +/*
>> + * The bootstrap pins for the board select the XO clock frequency,
>> + * which automatically enables the right dividers to ensure the
>> + * reference clock output to CMNPLL is 48 MHZ.
>> + */
>> +&cmn_pll_ref_clk {
>> +	clock-div = <1>;
>> +	clock-mult = <1>;
>> +};
>> +
>>   &xo_board_clk {
>>   	clock-frequency = <24000000>;
>>   };
>> +
>> +&xo_clk {
>> +	clock-frequency = <48000000>;
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 14c7b3a78442..ad9cdb1f76db 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -3,10 +3,11 @@
>>    * IPQ9574 SoC device tree source
>>    *
>>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <dt-bindings/clock/qcom,apss-ipq.h>
>> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>>   #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>>   #include <dt-bindings/interconnect/qcom,ipq9574.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>> @@ -19,6 +20,12 @@ / {
>>   	#size-cells = <2>;
>>   
>>   	clocks {
>> +		cmn_pll_ref_clk: cmn-pll-ref-clk {
>> +			compatible = "fixed-factor-clock";
>> +			clocks = <&xo_clk>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>>   		sleep_clk: sleep-clk {
>>   			compatible = "fixed-clock";
>>   			#clock-cells = <0>;
>> @@ -28,6 +35,11 @@ xo_board_clk: xo-board-clk {
>>   			compatible = "fixed-clock";
>>   			#clock-cells = <0>;
>>   		};
>> +
>> +		xo_clk: xo-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
> 
> What is the difference between xo_clk and xo_board_clk? Are there two
> different crystals?

The xo_board_clk of 24 MHZ is generated by applying another divider in
HW (by 2), on top of the same 48 MHZ clock output from internal Wi-Fi.

XO (48 MHZ or 96 MHZ)-->WiFi (mul/div)-->48 MHZ-->fixed factor divider 2 
by HW ---> xo_board_clk (24 MHZ)

We may need to correct its clock chain representation. We will update
xo_board_clk as a fixed factor (div by 2) clock, and refer to the 48 MHZ
input clock, using a separate patch after the CMN PLL patch series
review is concluded. Hope this approach is fine.

> 
>>   	};
>>   
>>   	cpus {
> 


