Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F36C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tj0r9h1K2TgurpxFryA4T10K1SMt2ovLYRkqdsps4hU=; b=FUTO5icLW/X5zndPn8WN3gR40j
	9fycZ5qLPSplXnJSbY9LQUDaIORdTQLhnmBhjQERM+8YdCgU1t5TmBp90FfMC5RtvAMTw6GYwN4do
	hrZOXd6JnTzh4mT7anZ0V3vfbZLFAiZNZJNkJ0UoGlIJTNneGXK8GJ/M8d6n8yaArd4jExDuWcL1w
	RPyY4I5e12hgRBku2S0Sfh+0tedWbuUJFNdMKrkrrOVsK1D1xgasTRC/TjD4YhfCFwsyl4IzSMthm
	/rxrUkyeT5awZfoWp5QZBFilPk1ZKBZc8JkwRg6zPWBYDvDVhrNNpPSVXgs4GN0GXjonje3cHTEd9
	WZIb3icA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcGg-00000002SAh-3xCm;
	Mon, 24 Mar 2025 07:30:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twc0n-00000002QAN-0HPS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:14:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6c1BF020445;
	Mon, 24 Mar 2025 07:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tj0r9h1K2TgurpxFryA4T10K1SMt2ovLYRkqdsps4hU=; b=KoJ8EIlgmQcaIFj3
	5z+hKw3v+RQY0W0OYPwAquc6fMewrLugCNvP8nFxgI9aIwxVKhYfc541L/Mb0ZYc
	4CGME+7Ej4uWKrFy3r+whCpxX9mNnRVnlUmiDoWXFF8lnHNdsj9Zp3hFZCmPO0JZ
	QwrvKYJOT1nX/mICK4LkMDZfXFDvK39T5IPygZbjxA2IMDsp80d4uu8CG8OmBJUw
	s2gObBuQj1WiH/1CvQB9cqmlBqqp82q0uIGd08po6aZf5Ho1cn7GH3X1dkDDdvOd
	jOSBpGU/2cZXgeItB+vgTRkZvLdHbLFsJxbTzvY3BdKNHmsHinAIX/DcyLZvGWEI
	sNmroQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmt03dab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:14:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O7E2KA004560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:14:02 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 00:13:57 -0700
Message-ID: <7707be54-5b42-42ea-b957-811fc45233c6@quicinc.com>
Date: Mon, 24 Mar 2025 15:13:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100-qcp: Add power control
 and sideband signals for PCIe3
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-4-quic_wenbyao@quicinc.com>
 <8379e009-9619-4c2b-986a-8ccb9ebaa083@kernel.org>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <8379e009-9619-4c2b-986a-8ccb9ebaa083@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jGFQE3zUtR8IV9CrrIlFYWbWTeE8gnYX
X-Proofpoint-ORIG-GUID: jGFQE3zUtR8IV9CrrIlFYWbWTeE8gnYX
X-Authority-Analysis: v=2.4 cv=aqGyCTZV c=1 sm=1 tr=0 ts=67e1063b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=B4APhY1HzHtPLpehiVQA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_001417_232051_F3E63B7A 
X-CRM114-Status: GOOD (  15.46  )
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

On 3/21/2025 3:39 PM, Krzysztof Kozlowski wrote:
> On 20/03/2025 06:55, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Add perst, wake and clkreq sideband signals and required regulators in
>> PCIe3 controller and PHY device tree node. Describe the voltage rails of
>> the x8 PCI slots for PCIe3 port.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 119 ++++++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
>> index 28086a2bc..9cd313802 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
>> @@ -318,6 +318,48 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
>>   		regulator-boot-on;
>>   	};
>>   
>> +	vreg_pcie_12v: regulator-pcie_12v {
> Don't send the downstream code.
>
> Underscore are not allowed in node names plus:
>
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]v[0-9]'
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=v6.11-rc1#n46
>
> Best regards,
> Krzysztof

Will fix in the next version.

-- 
With best wishes
Wenbin


