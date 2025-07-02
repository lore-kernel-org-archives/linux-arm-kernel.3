Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A38C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 11:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyuuEW55huNUHGYc+9oBljKgGuuKmVR8um5xHUVVKiE=; b=UWMjHmHgUQTHc1pIaKd4OnBGfc
	gbuFpMhCmbrwdLzwNKs8Mv88hkRe03PrJ4F43jzADW8Rsnx13dwcLxFi/F3Rd9HhkxpshXSX1O8uF
	0lxbpgRvPakO9WrHRXrEsWczbcak9v7cV14KXrfqQRBE+Eg53tOwknEGqriWKvw1KlYwdVgNUr+uc
	Fa8yIQ5faB6HAzaL0wqMnbtNqrVXKvQkiPUEhUD7DfmtNE5o3txqYj5RXm7yCAtBs5YMxI03PpYEo
	mqlVp4fMhGsaCbKCFL96NcwD5KRcY258CWLVuwZWDU681JQepV+YSwqa04xiGSSYvIRjMzsfoPgJi
	9tWH7+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvZA-000000087fu-1Soc;
	Wed, 02 Jul 2025 11:23:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWumh-00000007xwp-2FjA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 10:33:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56235evB020939;
	Wed, 2 Jul 2025 10:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tyuuEW55huNUHGYc+9oBljKgGuuKmVR8um5xHUVVKiE=; b=RQ0+mZIpNSh3Iz8A
	RhHHe/+V1EIUnRYRbCEqxvllc8tpS6BrYL8QMLhA00tqScPxK2S61Ajr5QW7IyHn
	69UqGMyj1bg7FxZXrArNwefXmRzc/8eEhUkmA6Yo5ibCoi4ScJ0tUqm97HP3yvkX
	sKP6xOJASdNFBdRp+pUSu9YELcP0ceE/Mpup9XSxnNB4QNvCnfjce4P8Lz6K8dX6
	LNVMWDwmrOLcztG1rROXp3+9ncHuXE+94fWNOCJyExgWIG3g/sZq8FKGoO09Y984
	1fJgj7HbYAxmP3doQUwjBWCjneo+ENIponHFK9sT3jLUYl4iMX8AGUwZLfyim+F4
	EE3Mmg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn2xt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 10:33:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562AXdZl022880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 10:33:39 GMT
Received: from [10.253.36.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 2 Jul
 2025 03:33:33 -0700
Message-ID: <ade0437b-3c23-4174-b4c5-6c90037abf14@quicinc.com>
Date: Wed, 2 Jul 2025 18:33:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] dt-bindings: clock: qcom: Add NSS clock controller
 for IPQ5424 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-5-8d392f65102a@quicinc.com>
 <20250701-optimistic-esoteric-swallow-d93fc6@krzk-bin>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <20250701-optimistic-esoteric-swallow-d93fc6@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4NSBTYWx0ZWRfX8ic95YwncjRA
 R4a/ZplQ4CcTmnpeSbBXjN38NorRfGm7Ty1Ot++Z+mRMrbEH9rm4bVxtycdNHSp9qs2NibUFiba
 kjc7NUW4FXBBu43LDB5pY51vR2GQA/dKl1FJsaseUplIdTgdZyMO3i7dTNjVgVkzjbfCIjE7Rl/
 3Ix9k4evJes1nmfqFZNw0lcj84C4dO0tuPZtHAFUUDLTXcJLlNRPYb7WGY+ysmlTfLV0c+sdl8v
 4YuekVKu7AqhaSS/CRFirak/41IDSoojDw/IqV/BmHWeTxChg4hDHYl/pW4QSyKyskU5l1B/EB3
 PF/ecM+oIhCfBcFQ7C35HXitpcR1HEUniMkTIPhtm+jEGrtmOWnBbEqGp9WeFC19yOHfYVQkzxc
 aUItSPNWmB+JABtSCmH/8jMDuGsSFA+COQfNGsMpKt2sxLzyGvq+yv1AF81Y2K2MGL2nXb7Z
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68650b04 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=l8XhYvs3ogmA2MLIGYEA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZJFKHmu4BoQDsqmwOJcsqj0rTrgYuXIn
X-Proofpoint-GUID: ZJFKHmu4BoQDsqmwOJcsqj0rTrgYuXIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_033347_722315_5E5ADE3F 
X-CRM114-Status: GOOD (  23.23  )
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



On 7/1/2025 4:22 PM, Krzysztof Kozlowski wrote:
> On Fri, Jun 27, 2025 at 08:09:21PM +0800, Luo Jie wrote:
>> NSS clock controller provides the clocks and resets to the networking
>> blocks such as PPE (Packet Process Engine) and UNIPHY (PCS) on IPQ5424
>> devices.
>>
>> Add the compatible "qcom,ipq5424-nsscc" support based on the current
>> IPQ9574 NSS clock controller DT binding file. ICC clocks are always
>> provided by the NSS clock controller of IPQ9574 and IPQ5424, so add
>> interconnect-cells as required DT property.
>>
>> Also add master/slave ids for IPQ5424 networking interfaces, which is
>> used by nss-ipq5424 driver for providing interconnect services using
>> icc-clk framework.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,ipq9574-nsscc.yaml         | 70 +++++++++++++++++++---
>>   include/dt-bindings/clock/qcom,ipq5424-nsscc.h     | 65 ++++++++++++++++++++
>>   include/dt-bindings/interconnect/qcom,ipq5424.h    | 13 ++++
>>   include/dt-bindings/reset/qcom,ipq5424-nsscc.h     | 46 ++++++++++++++
>>   4 files changed, 186 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>> index 17252b6ea3be..0029a148a397 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>> @@ -4,7 +4,7 @@
>>   $id: http://devicetree.org/schemas/clock/qcom,ipq9574-nsscc.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574
>> +title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IPQ5424
>>   
>>   maintainers:
>>     - Bjorn Andersson <andersson@kernel.org>
>> @@ -12,21 +12,29 @@ maintainers:
>>   
>>   description: |
>>     Qualcomm networking sub system clock control module provides the clocks,
>> -  resets on IPQ9574
>> +  resets on IPQ9574 and IPQ5424
>>   
>> -  See also::
>> +  See also:
>> +    include/dt-bindings/clock/qcom,ipq5424-nsscc.h
>>       include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>> +    include/dt-bindings/reset/qcom,ipq5424-nsscc.h
>>       include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,ipq9574-nsscc
>> +    enum:
>> +      - qcom,ipq5424-nsscc
>> +      - qcom,ipq9574-nsscc
>>   
>>     clocks:
>>       items:
>>         - description: Board XO source
>> -      - description: CMN_PLL NSS 1200MHz (Bias PLL cc) clock source
>> -      - description: CMN_PLL PPE 353MHz (Bias PLL ubi nc) clock source
>> +      - description: CMN_PLL NSS (Bias PLL cc) clock source. This clock rate
>> +          can vary for different IPQ SoCs. For example, it is 1200 MHz on the
>> +          IPQ9574 and 300 MHz on the IPQ5424.
>> +      - description: CMN_PLL PPE (Bias PLL ubi nc) clock source. The clock
>> +          rate can vary for different IPQ SoCs. For example, it is 353 MHz
>> +          on the IPQ9574 and 375 MHz on the IPQ5424
>>         - description: GCC GPLL0 OUT AUX clock source
>>         - description: Uniphy0 NSS Rx clock source
>>         - description: Uniphy0 NSS Tx clock source
>> @@ -42,8 +50,12 @@ properties:
>>     clock-names:
>>       items:
>>         - const: xo
>> -      - const: nss_1200
>> -      - const: ppe_353
>> +      - enum:
>> +          - nss_1200
>> +          - nss
> 
> No, that's the same clock.

OK.

> 
> 
>> +      - enum:
>> +          - ppe_353
>> +          - ppe
> 
> No, that's the same clock!
> 
> The frequencies are not part of input pin. Input pin tells you this is
> clock for PPE, not this is clock for PPE 353 and another for PPE xxx.
> 
> Best regards,
> Krzysztof
> 

Ok. Our only concern with dropping the suffix and using a common name
was renaming the existing property (initially added for IPQ9574 SoC)
from 'ppe_353' to 'ppe'. However I do agree that dropping suffix is the
better approach. Thanks for the suggestion.


