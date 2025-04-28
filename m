Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E3C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ol6Xl6i68ZLMmEDC7rOpaP6hA8OHqTiZTmpHuGCG2KI=; b=iFNu1/NMOEHWDOI7No+jW9uCsk
	ESFPhd1Rt40wldVRfPCbt1D4QuRyiJfP/4/0gFzqb+yxgM1tEEcdpRNOuM+Itl7Cr5Y2e0FsJGtSD
	e+VgEx3d3K5SQf2N5Kf/pJJghNkjL1dYJARi7z6qiS4fI+QVuQTpxefDNebIyJKyM/SAi/ZaHhFIR
	m+mrZOvI47J0j207oEsl8D5xXrStCxg+N7i5xKUNaHnBVEcEa0wNeaODjBWzJ2vtChvyczB33DcMH
	vC/n30jb26onPdJBphVqu0t0JHf+vcSO9sQCrIVQWgTIGJ4cYtmcygyHQth95w5i47ERmX1Q2s9Rq
	cQNECATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JgV-00000005Ngn-2KuI;
	Mon, 28 Apr 2025 08:17:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JZ5-00000005MS5-1TQ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:10:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6juTK018506;
	Mon, 28 Apr 2025 08:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ol6Xl6i68ZLMmEDC7rOpaP6hA8OHqTiZTmpHuGCG2KI=; b=GcIGvSa4eUsTamvs
	T8oTe7GYtlArMy9xuCHLE6m498iyx/ucGtpzzaKIXVsRupPcPXlb05q/09d8hw9m
	kTrWdq6LgFkDOSpez6svxmXG7Cc2rbyXQUccHvFu38tvtXADY+IpxYEzhSkvfHSK
	xFseIGUYFC8E2LE+BP1OSF4oQM1zj1WDV+0RAdVbLYpkRCQswOrRoWG3l0sHQYMh
	OHQRbWKYSMx7RTEVDRRbwb56vRLBWCwPu5YC7Gg1cZpjsNfEaAmOBDzvonmnJnq/
	Ds8RnGuFwBF93Cp1BwKbb63MX8LLaJtvKybc/LVXuXexQSgaU9A3Czjab1tc/qgx
	y6dyZA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jfbdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 08:10:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S8A2lT005357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 08:10:02 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 01:09:58 -0700
Message-ID: <b313ab73-850e-4d75-ae19-797a8c6a16f2@quicinc.com>
Date: Mon, 28 Apr 2025 16:09:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
 <20240903121847.6964-2-quic_jinlmao@quicinc.com>
 <8d203417-e3da-4969-87ea-f77cdb720756@kernel.org>
 <04d46109-d499-4e91-88aa-4187145b811d@quicinc.com>
 <cbb1191d-4e90-4887-9227-e4e8761a9b46@kernel.org>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <cbb1191d-4e90-4887-9227-e4e8761a9b46@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA2NiBTYWx0ZWRfX9eHyGZaWihej jfrUeqzbopu3ZaXzKip2Xx6PCy0Kt84KlXPp3AhQKqJewb9HkpbyqT8W8L2RbnP35rBcJy4jTiR 9Z0UMitfi6fjm+A7E4qoj1KLxT4kSPR0FY16MRs4PAAdFF+wLt6QYPAxb1VmljAi+xSW96ogPCc
 BtZOjD4v+zKib0vtdplC2aRmh4XtA51VnVQEgfH3iSBS1RSu+syQ/GqBtwLnq1uebjK7Yjti6L/ jakkRZ+4IADmGF1GrjwS/ivQd/YDVNhsNzJP7Grf1iCu6S1bG+VXJXcbkk7cg2R+3i8PP84PkxE FXi/NcpQzGZo1ya1y6CkH8T0fGbp5F5zPOWrrqOtrBes+Z52bnc/fgNNEcB3awXdcJt4NJhOR7b
 ha35vtMUz0gHLd/f9DrfPAJE+zcWFZx/5NfkwsOCXQPvdE1j+opFF1vHmlmDJn960INkDJVE
X-Proofpoint-GUID: dL9IIffQcO9w4mMrV81tiS6lhBQH1eiZ
X-Proofpoint-ORIG-GUID: dL9IIffQcO9w4mMrV81tiS6lhBQH1eiZ
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680f37da cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=BB5YKCej9nSSSTOgEYYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_011011_413426_C53A30CC 
X-CRM114-Status: GOOD (  12.66  )
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



On 2025/4/28 15:39, Krzysztof Kozlowski wrote:
> On 28/04/2025 09:31, Jinlong Mao wrote:
>>
>>
>> On 2024/9/3 20:42, Krzysztof Kozlowski wrote:
>>> On 03/09/2024 14:18, Mao Jinlong wrote:
>>>> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
>>>> extended CTI supports up to 128 triggers.
>>>>
>>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>>> ---
>>>>    .../devicetree/bindings/arm/arm,coresight-cti.yaml | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>>> index 6a73eaa66a42..141efba7c697 100644
>>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>>> @@ -87,6 +87,10 @@ properties:
>>>>              - const: arm,coresight-cti-v8-arch
>>>>              - const: arm,coresight-cti
>>>>              - const: arm,primecell
>>>> +      - items:
>>>> +          - const: qcom,coresight-cti-extended
>>>
>>> That's just enum in previous entry/list.
>> Sorry for the late response. This is a new CTI type. Need the three
>> items in compatible at the same time, just like other kind of CTIs.
> 
> 
> Comment stays valid, you did not address it at all.
Hi Krzysztof,

Do you mean we only need const: qcom,coresight-cti-extended here ?
No need const: arm,coresight-cti and const: arm,primecell as they are
in previous entry/list, right ?

> 
>>
>>>
>>>> +          - const: arm,coresight-cti
>>>> +          - const: arm,primecell
>>>>    
>>>>      reg:
>>>>        maxItems: 1
>>>> @@ -254,6 +258,16 @@ examples:
>>>>          clocks = <&soc_smc50mhz>;
>>>>          clock-names = "apb_pclk";
>>>>        };
>>>> +  # minimum extended CTI definition.
>>>> +  - |
>>>
>>> No need for new example. No differences here.
>> This is a new type CTI.
> 
> 
> Comment stays valid, you did not address it at all.
> 
> Best regards,
> Krzysztof


