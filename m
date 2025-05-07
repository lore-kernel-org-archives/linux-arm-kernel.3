Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FE2C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 04:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5+yz2q+hUjul7s+z3seVWpaNFf3JvMrntHxV3Q7ywU=; b=TrllNp8Y5Aco4BM4VNIjulgxaz
	x65XCsdzXfZXa8VxWbBCT/tsNVGgQutgWo/8sdrOJppwwHMWeisYwqv/wH3Bx63f0/02WD+4PlAjq
	8j/lNXMmGR4iBpf9PbFq7A7V2lny49mlnQSz6+vYogsNLuNNaWCuL1pq7ELwstze4lwQMAJMWh8I3
	GJJNGJWByloGslzdKTfrWBJj8uN0yBa3rqQ3KSLJOI0kTKEpom4utd+NGaeprtX6Mo1ZYi/ot8gWm
	YSm6T2tm2PdNb0UIB7dUJmYSVqQfW7arMSFQYn35SQbFccaI38uO+cesD6E+eY9SMweOVlKUyAcCz
	39umtCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWOS-0000000EBHX-3HGa;
	Wed, 07 May 2025 04:28:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWMU-0000000EB2C-0e7I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 04:26:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H7as022467;
	Wed, 7 May 2025 04:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5+yz2q+hUjul7s+z3seVWpaNFf3JvMrntHxV3Q7ywU=; b=cYsthnEgQT6uuH85
	voUoWZX9T64x/CmZfJIsMuSk+jtd0lhIB0416//UWsT1hlzD5fR2VepAo/O5VYBg
	ruRxySyVdsdkP1BsQtXtc5IgqGdqxyGekrLu1Si0iTVHdceA1YA5iBUux6psAw4V
	ihA/LhTzd9SCsJ1RPrnoNPVZkGNUwbRvtSV6m1kKXXRR3xiPVeil8lSqkxFT+AWe
	VFiunBxKhC3M7qPJ/VxQXjrxE6H4/cLQMaU82r+G84gN8zkpqCHZLSH7KE4P9M7q
	8twsANwqRlT9GNHFqJWj1si04dNWjDQSw7jo1Aviyonk7fLtZRXIHyIxL2Y0UiaM
	ilm6Rg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuvf4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 04:26:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5474QFb8006724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 04:26:15 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 21:26:12 -0700
Message-ID: <4a6a8bad-e5d9-4613-a839-5a21491ef7c4@quicinc.com>
Date: Wed, 7 May 2025 12:26:10 +0800
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
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <9b75b9d1-a9ed-46c9-9dba-8e3eb261dcc0@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681ae0e8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=8OJl2JkUM1ULYFJJg_AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kIw5FctbMkclmRq0boSizRbNIFFYcxRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAzOCBTYWx0ZWRfX7DEhrK4ha02a
 otfpaBPjG9HTwWMRjm99Wtn+0dYOimkZd+rNDcRZJEVJtvXkEKks21o6IDvUnC804FZZt9TuzPf
 BDU4wfBEPIacRrAMiHoJQE8OEbbipMmN4N9vIAEBBGiCOgSOQPbFHsqepeOGt0/yPF9o8+YgzpZ
 fyco5V+MbdIcvGKt7ITQCL3YXcFgUFUuOF67ThJMeciF86jQOmAUHMMD26cab/aOhcV5gnjvoUM
 DJBEDw4eHCHGr/r05169oX0BC5o9XvY6OdEPhp7+O6mAp/9mUnTYNDugH2kjU11XkEsqeyoU675
 ICDQdJNfU89az8rmdshWvSbub5CAninyNYPXZwl/7nEeSNsr35JJ0XwOIbLjFuG7Bn+hQFj6kGc
 yRebftKHoxCnPKSwRKAzDZZH64Tvmnzx3/XzuxZPLiC8QszAvIVHUUW9fhFRpmPKeqyyKm9U
X-Proofpoint-ORIG-GUID: kIw5FctbMkclmRq0boSizRbNIFFYcxRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_212626_319146_EEFD2907 
X-CRM114-Status: GOOD (  15.75  )
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



On 5/6/2025 7:20 PM, Suzuki K Poulose wrote:
> On 14/04/2025 10:16, Yuanfang Zhang wrote:
>>
>>
>> On 4/11/2025 5:59 PM, Suzuki K Poulose wrote:
>>> On 11/04/2025 09:57, Yuanfang Zhang wrote:
>>>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>>>> which is an integration hierarchy integrating functionalities of TPDA
>>>> and funnels. It aggregates the trace and transports to coresight trace
>>>> bus.
>>>>
>>>> Compared to current configuration, it has the following advantages:
>>>> 1. Reduce wires between subsystems.
>>>> 2. Continue cleaning the infrastructure.
>>>> 3. Reduce Data overhead by transporting raw data from source to target.
>>>>
>>>>     +------------------------+                +-------------------------+
>>>>     | Video Subsystem        |                |Video Subsystem          |
>>>>     |       +-------------+  |                |       +------------+    |
>>>>     |       | Video TPDM  |  |                |       | Video TPDM |    |
>>>>     |       +-------------+  |                |       +------------+    |
>>>>     |            |           |                |              |          |
>>>>     |            v           |                |              v          |
>>>>     |   +---------------+    |                |        +-----------+    |
>>>>     |   | Video funnel  |    |                |        |Video TNOC |    |
>>>>     |   +---------------+    |                |        +-----------+    |
>>>>     +------------|-----------+                +------------|------------+
>>>>                  |                                         |
>>>>                  v-----+                                   |
>>>> +--------------------|---------+                         |
>>>> |  Multimedia        v         |                         |
>>>> |  Subsystem   +--------+      |                         |
>>>> |              |  TPDA  |      |                         v
>>>> |              +----|---+      |              +---------------------+
>>>> |                   |          |              |    Aggregator TNOC  |
>>>> |                   |          |              +----------|----------+
>>>> |                   +--        |                         |
>>>> |                     |        |                         |
>>>> |                     |        |                         |
>>>> |              +------v-----+  |                         |
>>>> |              |  Funnel    |  |                         |
>>>> |              +------------+  |                         |
>>>> +----------------|-------------+                         |
>>>>                    |                                       |
>>>>                    v                                       v
>>>>         +--------------------+                    +------------------+
>>>>         |   Coresight Sink   |                    |  Coresight Sink  |
>>>>         +--------------------+                    +------------------+
>>>
>>> If each NOC has TraceID, how do you reliably decode the trace ?
>>> Is there a single NOC/TPDA in the path from Source to sink ?
>>
>> Not each TNOC has TraceID, there is only one TNOC has TraceID for one path
>> from Source to sink. In the example, only the aggregator TNOC has traceID.
>> Decode trace relying on TraceID + Inport number.
>> It can has mutiple TNOC/TPDA in one path.
> 
> So do we only describe the TNOCs that need traceId in the DT ? (e.g., Aggregator TNOC above ?) How about Video TNOC ? Don't we allocate a
> trace id for it by default, when it is described ?
> 
> Suzuki
> 
yes, now only describe the TNOCs which need traceID, Video TNOC is another type, it is interconnect TNOC which collects trace from subsystems
and transfers Aggr TNOC, it doesn't have ATID. Its driver is different from this patch, I want to describe it when upstream its driver.

Yuanfang







