Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE9CC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 05:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RsbbGYFvDIiMTNSkXUgQ8AuJQFETNnj8+Tfr9bN4Qw=; b=qx0MZOeMuWJEFjYkZWnF5B58U0
	jf683/HJA1JhTRhvmUik7wh3xjhAPa2woaFtsB2F4wbaOM3FoAaRVWUV3lxMEgLaWgtjxqIC1Sxn4
	GpqOvBZBi8BVP/mUIRrMdDANPVQEwc709RqAHzySd1UxM3/fyfCh/hw+hUvRC/wmtdjoxaSlFkJjN
	HQxpe36vkllToIEEq/fInP5z6kg+bIVmDRUcTuauLZvnUfcVbtQ1a5WNm4M29upkVbiC6weN46FLK
	9MaZF7GEXslOVvr5j2hkNEuKrF5HED7odPeQCgcGUhvVqw1EVSXPfrYIWa9WNzY7FSAXTf3N5YUwQ
	j41GqnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtzS-0000000HO6u-2mk6;
	Thu, 08 May 2025 05:40:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtxU-0000000HNyv-33ye
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 05:38:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484XWu2010664;
	Thu, 8 May 2025 05:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RsbbGYFvDIiMTNSkXUgQ8AuJQFETNnj8+Tfr9bN4Qw=; b=HCxL/0xlTmJOOhOG
	KQ5CHWWlWfdAU7oSPZjwNVvyJtkjATQBHnYfKSuusTgd8z6zuXv0xZLrAB2L1t+E
	sG/thAcrK5Vvf9TGfu/iKq1puvPFBY7PBfH84vBxq/sjh0PzcNONQXyJLc52QbTm
	5h3iVXCpU1lT8UkS6LHH0rL2x13DSp4QBVzzhlOjleblzVbKWYufSLQMh5wn0ay/
	YjW1Ukf3E+dqAsvNPB/xwHDvC0iDd261lFmqaCkNUj7w/MDQTJ85AXl0LvjUwOP9
	go4BeuumhOPWLYuhMKonGanKEtLN+jzA7gFEVi0Dm/aELcf2+/LOYEC/HKdS6H+j
	3vo7Vg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmg484-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 05:38:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5485c3UX009865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 05:38:03 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 22:38:00 -0700
Message-ID: <f9713d5e-68a8-497e-8a1a-9398ad1246cb@quicinc.com>
Date: Thu, 8 May 2025 13:37:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
 <20250411-trace-noc-v3-2-1f19ddf7699b@quicinc.com>
 <23d02991-3bc6-41e2-bb8b-a38786071c43@arm.com>
 <257fb0a5-7bf7-4a04-9f8d-d8759351584c@quicinc.com>
 <9b75b9d1-a9ed-46c9-9dba-8e3eb261dcc0@arm.com>
 <4a6a8bad-e5d9-4613-a839-5a21491ef7c4@quicinc.com>
 <069e920c-7023-4a6d-b1c6-dc87ac9d2360@arm.com>
 <f4db016a-0c57-4213-8eca-75a090d7aabb@arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <f4db016a-0c57-4213-8eca-75a090d7aabb@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681c433c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=hBx-iGXkYGsp8hSzPlMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CdtAznACIRqolIUGZt35ka06zW2wO9aN
X-Proofpoint-GUID: CdtAznACIRqolIUGZt35ka06zW2wO9aN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA0NiBTYWx0ZWRfX0DCTYt+Qzelh
 A80/lR57KgHYUiFT3DC85WMwJ5B5Zh2T+vQ1ijbXubaI/SVTVNWuEKuvZ+pu+4k35ZReiXWrnM+
 fBHD1dL4Z/fj4oIPwY11h+HIXFRruu10PobT+cNaRk06fYhsQH7dsZua46n0S4FagDn4uPSst+t
 PKN0nc+dE4fTSkQB3ryn9M2EBA3Uxc7NnYz3dCRPn7TUq9LR6DvTmGPxtssweyvPvKtHuH+OIvu
 r7sqelFsuYBBzlDNRuIQ2dDqE2tKG9UWutlYABt72rmXhLq+/NbJvKK7f9mc5P7uQiU9F/fxKVX
 87H709ufzvO5ML/+A+dq8tBrbS9jNWB10iiP/U6zT/y2AjnbAbDjxNmKEnhCW1jBtqDfOxROUxH
 CUvOBlvZdXywRj7m5V152ixfuPxzdibK1NtZsiHnNKuJlCTn3wuWVNJF2QiJfEYrFpNX67HZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_223812_777314_6DBBF74C 
X-CRM114-Status: GOOD (  20.76  )
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



On 5/7/2025 7:59 PM, Suzuki K Poulose wrote:
> On 07/05/2025 09:52, Suzuki K Poulose wrote:
>> On 07/05/2025 05:26, Yuanfang Zhang wrote:
>>>
>>>
>>> On 5/6/2025 7:20 PM, Suzuki K Poulose wrote:
>>>> On 14/04/2025 10:16, Yuanfang Zhang wrote:
>>>>>
>>>>>
>>>>> On 4/11/2025 5:59 PM, Suzuki K Poulose wrote:
>>>>>> On 11/04/2025 09:57, Yuanfang Zhang wrote:
>>>>>>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>>>>>>> which is an integration hierarchy integrating functionalities of TPDA
>>>>>>> and funnels. It aggregates the trace and transports to coresight trace
>>>>>>> bus.
>>>>>>>
>>>>>>> Compared to current configuration, it has the following advantages:
>>>>>>> 1. Reduce wires between subsystems.
>>>>>>> 2. Continue cleaning the infrastructure.
>>>>>>> 3. Reduce Data overhead by transporting raw data from source to target.
>>>>>>>
>>>>>>>      +------------------------+                +-------------------------+
>>>>>>>      | Video Subsystem        |                |Video Subsystem          |
>>>>>>>      |       +-------------+  |                |       +------------+    |
>>>>>>>      |       | Video TPDM  |  |                |       | Video TPDM |    |
>>>>>>>      |       +-------------+  |                |       +------------+    |
>>>>>>>      |            |           |                |              |           |
>>>>>>>      |            v           |                |              v          |
>>>>>>>      |   +---------------+    |                |        +-----------+    |
>>>>>>>      |   | Video funnel  |    |                |        |Video TNOC |    |
>>>>>>>      |   +---------------+    |                |        +-----------+    |
>>>>>>>      +------------|-----------+                +------------|------------+
>>>>>>>                   |                                         |
>>>>>>>                   v-----+                                   |
>>>>>>> +--------------------|---------+                         |
>>>>>>> |  Multimedia        v         |                         |
>>>>>>> |  Subsystem   +--------+      |                         |
>>>>>>> |              |  TPDA  |      |                         v
>>>>>>> |              +----|---+      |              +---------------------+
>>>>>>> |                   |          |              |    Aggregator TNOC  |
>>>>>>> |                   |          |              +----------|----------+
>>>>>>> |                   +--        |                         |
>>>>>>> |                     |        |                         |
>>>>>>> |                     |        |                         |
>>>>>>> |              +------v-----+  |                         |
>>>>>>> |              |  Funnel    |  |                         |
>>>>>>> |              +------------+  |                         |
>>>>>>> +----------------|-------------+                         |
>>>>>>>                     |                                       |
>>>>>>>                     v                                       v
>>>>>>>          +--------------------+                    +------------------+
>>>>>>>          |   Coresight Sink   |                    |  Coresight Sink  |
>>>>>>>          +--------------------+                    +------------------+
>>>>>>
>>>>>> If each NOC has TraceID, how do you reliably decode the trace ?
>>>>>> Is there a single NOC/TPDA in the path from Source to sink ?
>>>>>
>>>>> Not each TNOC has TraceID, there is only one TNOC has TraceID for one path
>>>>> from Source to sink. In the example, only the aggregator TNOC has traceID.
>>>>> Decode trace relying on TraceID + Inport number.
>>>>> It can has mutiple TNOC/TPDA in one path.
>>>>
>>>> So do we only describe the TNOCs that need traceId in the DT ? (e.g., Aggregator TNOC above ?) How about Video TNOC ? Don't we allocate a
>>>> trace id for it by default, when it is described ?
>>>>
>>>> Suzuki
>>>>
>>> yes, now only describe the TNOCs which need traceID, Video TNOC is another type, it is interconnect TNOC which collects trace from subsystems
>>> and transfers Aggr TNOC, it doesn't have ATID. Its driver is different from this patch, I want to describe it when upstream its driver.
> 
> So, if both are TNOC and there different types of them, how do you plan
> to identify, which is what ?
> 
I will describe interconnect TNOC as a platform device because it doesn't have PID register.
It will have a compatible "qcom,coresight-interconnect-tnoc".
 
> And we also have a dt-bindings which simply says "coresight-tnoc". Isn't too generic if it is meant to be "aggregator" ?
> 
aggregator TNOC is generic TNOC, the dt-bindings is for this generic TNOC. interconnect TNOC is special TNOC, There will be a separate dt-bindings to describe it.
> Suzuki
> 
> 
> 
>>
>> Thanks! Please could you make sure to describe all of this when sending
>> out a patch in the cover letter ?
>>
sure, will update the cover letter.
>> Cheers
>> Suzuki
>>
>>
>>>
>>> Yuanfang
>>>
>>>
>>>
>>>
>>>
>>>
>>
> 


