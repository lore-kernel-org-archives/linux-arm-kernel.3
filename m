Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A57BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 05:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mb7WuNDg/h+gcu1HzUJ0E+KuOjfSoXfih9L1QEr84h0=; b=YICAvoqfBhQvcyfCznTHGRGoct
	q88lfQiJq8naoNq533tcG/PFTlS4Dl+GT4hefNiYL2OQaZ6hedU4SXqw7vGuMWGpG1YCJVCVJIITG
	0n2tf4mN53971OJSJKPIfKZVbYJi1tJ9sdCPZEno+lOrw+IvL8pEQT+0Pd3iXzxdC7EmAeI2Od3h7
	QnwWNfkL+6VvYg7pIMx+V/wSNaX4QrEqmxmMlKKM9wGBkjPWSs6C4uC0cKxWncyZbPIFbZktt/rBg
	dJSHqWNj7X16bNp+5QMSGWiEc4gHWy76T+mK5fGO3jgHMk+Io55W60COs3l3I7AB/pM/v1IXcmLzE
	52yoTBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQK14-0000000DHQk-3KZz;
	Wed, 25 Dec 2024 05:33:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQJzp-0000000DHNJ-09EP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 05:31:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP2Zd0J028916;
	Wed, 25 Dec 2024 05:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mb7WuNDg/h+gcu1HzUJ0E+KuOjfSoXfih9L1QEr84h0=; b=FWAh0bEGdOvIWyL1
	K1VCwg4EXpGrycUs7WYlZoE/PKL+T+9jKK+6I0aloki1MwctgMYOnhKpaW/Vd3dJ
	9zjwLA4Mf5n0bF7xm6b/ZLt7pKMkSCsGOF4/3fCCZ9fYrOKb5tyd7nW+twdwyxdJ
	gnazOKJjTK2DVk+6uoCtxNZyRfui0Xe5LuBhwx/OZrEPpX30yne4oeMhP0gdLDVQ
	cZgO+FLXG1vK87LNdFGjM/RdStN3ZhcZxi8bJWQXe+GHge4ljIyz/I1DL/9+pzqR
	qXBSeUr8spCE/osS/wxeSa4nlpq8/Iw5eLzfY/MDWC0bBdd0+vZJEjGGTDzWwjLu
	HG7eaw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43r9dd8ttx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 05:31:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BP5VUHm000982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 05:31:30 GMT
Received: from [10.253.8.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 21:31:25 -0800
Message-ID: <bdab600c-82ec-4880-a0d0-cb0adc2123a0@quicinc.com>
Date: Wed, 25 Dec 2024 13:31:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <quic_luoj@quicinc.com>
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
References: <20241220-qcom_ipq_cmnpll-v7-0-438a1b5cb98e@quicinc.com>
 <20241220-qcom_ipq_cmnpll-v7-1-438a1b5cb98e@quicinc.com>
 <yngf4ngbnkcmohjfkd6muynfr72v5yhynmyqfjmxh6qbxidmo7@bsvimplmpwsl>
Content-Language: en-US
In-Reply-To: <yngf4ngbnkcmohjfkd6muynfr72v5yhynmyqfjmxh6qbxidmo7@bsvimplmpwsl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I3vJbnkRByZMZX6dqT7siyi529It5B8D
X-Proofpoint-GUID: I3vJbnkRByZMZX6dqT7siyi529It5B8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 clxscore=1015 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_213149_096538_0AA19A2B 
X-CRM114-Status: GOOD (  19.33  )
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



On 12/22/2024 4:19 PM, Krzysztof Kozlowski wrote:
> On Fri, Dec 20, 2024 at 09:22:42PM +0800, Luo Jie wrote:
>> The CMN PLL controller provides clocks to networking hardware blocks
>> and to GCC on Qualcomm IPQ9574 SoC. It receives input clock from the
>> on-chip Wi-Fi, and produces output clocks at fixed rates. These output
>> rates are predetermined, and are unrelated to the input clock rate.
>> The primary purpose of CMN PLL is to supply clocks to the networking
>> hardware such as PPE (packet process engine), PCS and the externally
>> connected switch or PHY device. The CMN PLL block also outputs fixed
>> rate clocks to GCC, such as 24 MHZ as XO clock and 32 KHZ as sleep
>> clock supplied to GCC.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 85 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 22 ++++++
>>   2 files changed, 107 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> new file mode 100644
>> index 000000000000..db8a3ee56067
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> @@ -0,0 +1,85 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CMN PLL Clock Controller on IPQ SoC
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Luo Jie <quic_luoj@quicinc.com>
>> +
>> +description:
>> +  The CMN (or common) PLL clock controller expects a reference
>> +  input clock. This reference clock is from the on-board Wi-Fi.
>> +  The CMN PLL supplies a number of fixed rate output clocks to
>> +  the devices providing networking functions and to GCC. These
>> +  networking hardware include PPE (packet process engine), PCS
>> +  and the externally connected switch or PHY devices. The CMN
>> +  PLL block also outputs fixed rate clocks to GCC. The PLL's
>> +  primary function is to enable fixed rate output clocks for
>> +  networking hardware functions used with the IPQ SoC.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq9574-cmn-pll
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: The reference clock. The supported clock rates include
>> +          25000000, 31250000, 40000000, 48000000, 50000000 and 96000000 HZ.
>> +      - description: The AHB clock
>> +      - description: The SYS clock
>> +    description:
>> +      The reference clock is the source clock of CMN PLL, which is from the
>> +      Wi-Fi. The AHB and SYS clocks must be enabled to access CMN PLL
>> +      clock registers.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: ahb
>> +      - const: sys
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  assigned-clocks:
> 
> Drop

OK.

> 
>> +    maxItems: 1
>> +
>> +  assigned-clock-rates-u64:
>> +    maxItems: 1
> 
> These wasn't here when you received review. Adding new properties always
> invalidates review.
> 
> No, drop them.

OK.

I will remove the reviewed-by tag next time when such modifications are
made.

> 
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - "#clock-cells"
>> +  - assigned-clocks
> 
> Drop

OK.

> 
>> +  - assigned-clock-rates-u64
> 
> Drop... or explain

I will drop it as the core DTS schema allows it for the clock
provider.

The DT property 'assigned-clock-rates-u64' is used for configuring the
clock rate of CMN PLL to 12 GHZ, which is the working clock rate of CMN
PLL on IPQ9574.

> 
> Drop all review tags after making significant changes like that.

Sure I will.

> 
> Best regards,
> Krzysztof
> 


