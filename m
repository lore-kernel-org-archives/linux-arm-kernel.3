Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF474CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5dYCchirwA0swGEKp2a0hBjrtOTG8gMa9rTyBS0nSE=; b=yJO1fo3BlpXWP/Ofpxbauck2wj
	ArJvSpP/UGF+e/i9sxUrJLbwAPrtOed3xWJG/I04vzVstGt4UUTSpBVPb1voovtucJ5NL1h1XOGvg
	fTI57Z5wZqYbapV9x973G3x/+Q0Z2vMSVVa09GN0tO4JuCXFuxus5dbZpumXM0ABtHBCenY4FzxUQ
	qhwRQDod2tXYUpksP8x0rO53QLmqcZ0ms0KPHROgc7qz6I04lRM3ry7+c6gZR1tCsp7q7eVYVZZMV
	VITEhNygSbFW/SZwdSvr5+qO6vo83NBRe5PPZa+glU80wwktKbpC39SkBit5GsD52IDTTET9IyHkP
	hjaRDeSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CJ9-00000008S9p-2uCL;
	Fri, 10 Oct 2025 12:33:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CJ7-00000008S84-1HJG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:33:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WkfM009956;
	Fri, 10 Oct 2025 12:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5dYCchirwA0swGEKp2a0hBjrtOTG8gMa9rTyBS0nSE=; b=frwRGL8Zc+iusG1k
	28TArVtuyo2Kli1uBWfsaatHfLzSEZzZiHwkFSgfON32KkL/K3ZcLrULkr0C8n+r
	l/UPzXGfh//VzhjM2yjZjaWTOwqR4tVMFYG0QammoYysrBENXK2J+Z/b4rjVOFwG
	3cCtf4roA/oHvRchcnmLOkP5UuG8vR1S3U0ZesF+WMFiL4TvX/v6hPoJuoqHXK/H
	5mucpjUIM/8X1nkARFpSunVBBNZMTtKrE+wDOYrSjgtpXCCUsQ2EQYstA3qvR5on
	Ylb9sCl4t4/4cH6/vMnpZclLfzM28Qsbu4LP54Rn58f3bKqsfXpZMfC9DaVfuPLb
	3AjL9g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nxd1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 12:33:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59ACX40A021117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 12:33:04 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 10 Oct
 2025 05:32:58 -0700
Message-ID: <13f8e144-4aa3-4c9b-aea8-daabbe1ed643@quicinc.com>
Date: Fri, 10 Oct 2025 18:02:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ravi Shankar
	<quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-3-quic_vikramsa@quicinc.com>
 <1afcbf5c-f32a-4115-b2ed-583a10758045@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <1afcbf5c-f32a-4115-b2ed-583a10758045@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wjrwm1ez5Hfm8aj2lX_UH5qE5VwxYo1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwZYVm+3Sxpy9
 OEJri2opeXHaGFZrYlco812hO5dOgDzzHHjyjP3SuMWFkUoezk+tejRGZaLNgat1um6ZQFFCLCf
 PJQLUr3Y6E7GailVPL+nHjblhNJ21iU2Yav/v6ZDaV5sGUSfmjjWQa77ScbUyBeM+4NQpjzOJSA
 3qZEqiD+Q10WsNv57ScBqLC9eXHEGGbxFo7W/lO7rva67x4crR4T4sh3r5B8fp2neKCXdvCMtEH
 h/sE7xK09pC9pi/y6+UIorduZL91UwWmIZYnfSEB/3NjXnTBAeFKPlGtXVHL3TXwWAnqSiXBsdE
 BjLXMZkXW2MIq9EVHxdYoGvv4f4tIO/I7WEgJ1UP0kS3o5lyyRh5JZGHc83ltOYThjFbNoIp+r7
 GGgSLq4LEBA18XQgCek9HdC2nT8r8A==
X-Proofpoint-GUID: wjrwm1ez5Hfm8aj2lX_UH5qE5VwxYo1t
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e8fd02 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=NfVOzX4QbIYnm6znlmUA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_053313_451998_BE533C85 
X-CRM114-Status: GOOD (  10.28  )
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



On 08-10-2025 15:34, Konrad Dybcio wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index a248e269d72d..a69719e291ea 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -4681,6 +4681,123 @@ videocc: clock-controller@abf0000 {
>>  			#power-domain-cells = <1>;
>>  		};
>>  
>> +		cci0: cci@ac13000 {
>> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
>> +			reg = <0x0 0x0ac13000 0x0 0x1000>;
>> +
>> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
>> +
>> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> Does CCI really require all three of these clocks? AXI turned out
> not to be necessary on at least some platforms

No, the AXI clock is not required for CCI operation, will validate and address the changes in v4.

-- 
Regards,
Nihal Kumar Gupta


