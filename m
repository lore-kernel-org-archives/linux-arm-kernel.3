Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E58C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 01:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEWtjHoNU9NHeQt4i7TL5SjyB4mbjcKUSANV4HeIacY=; b=AOjhNEK7a3bEXfhCfR6NwzdJdm
	vi+aXqtHT0dtI8AzmGpEtZ3CZ3yyRIflJSpwg4/aAdDVqTZFALLimflVVg1LKoGJDADwJ22t+gREL
	ai6/GFHNwpGRGVs1uabdLmfaroXIUJ/bpkGL0TEr69mbRAvoKeCRZWFY5ciGluYQhenP8f+cZcSFB
	7RkdT/jvFhV3VLvsVbZ+ioJFxLLi0wdOXnQb3Ayei6rzLkGUUdjqAzlMSy979NQ1MeZU+h4nurShl
	AdtUAZNlODoNVh35EgVEqK49p4ak9er0nZGmHLjCaxrpr4/sJ4jXniYS4nl4CzsAsmqoK/cGjQ84Y
	lrvOTUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjplZ-00000002xOK-3n24;
	Mon, 17 Feb 2025 01:17:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjpjE-00000002x9H-064U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 01:15:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03ATu003101;
	Mon, 17 Feb 2025 01:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QEWtjHoNU9NHeQt4i7TL5SjyB4mbjcKUSANV4HeIacY=; b=iyT66gWyEWb+iNmP
	W0DOspffSWoDU+ma/fpk4gHVCpQWKKqngH/NAJQdvnsZ9eVuKwRBmaA1uw9e27/l
	sptmnes6vjQejj9mb66SntVkNIR4FdlhbfpH1GqM4bsbBhyhgL7qMzGMS+5xw3gm
	KaxIQpKn6ClN3IUrNDn/oVfctl6HeOu/iFsKgoTAREhgw3b753z8GjICBaE0VVUB
	M7Ap0WOq2+mW4Tvibpi4kjOfcgxo7URn3eXDHt3eTWF21tPgIJrTQpL+qLFaUJ8A
	M2aAN4U5L4bO+zvG4bSkus78SEqD/wsWh8kkGykXdRbkzdAclKx0sVlDBgxSOWHj
	42sbTw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7v839a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 01:14:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51H1EwWC029430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 01:14:58 GMT
Received: from [10.133.33.23] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Feb
 2025 17:14:54 -0800
Message-ID: <5e6edfce-ef2e-48d2-ad0c-0120606394fb@quicinc.com>
Date: Mon, 17 Feb 2025 09:14:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
To: James Clark <james.clark@linaro.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
 <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
 <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
 <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ncpn-UUadyPb6vXM7jc6XjlAZmOQIyol
X-Proofpoint-GUID: ncpn-UUadyPb6vXM7jc6XjlAZmOQIyol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=908 priorityscore=1501
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_171520_188463_D780614D 
X-CRM114-Status: GOOD (  19.99  )
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



On 2/14/2025 7:09 PM, James Clark wrote:
> 
> 
> On 14/02/2025 1:34 am, Jie Gan wrote:
>>
>>
>> On 2/14/2025 12:00 AM, James Clark wrote:
>>>
>>>
>>> On 07/02/2025 6:42 am, Jie Gan wrote:
>>>> Add 'struct coresight_path' to store the data that is needed by
>>>> coresight_enable_path/coresight_disable_path. The structure will be
>>>> transmitted to any required devices to enable related funcationalities.
>>>>
>>>> The trace_id will be allocated after the path is built. Consequently,
>>>> The ETM3x and ETM4x devices will directly read the trace_id from path
>>>> which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id
>>>> being deleted.
>>>>
>>>> Co-developed-by: James Clark <james.clark@linaro.org>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-core.c  | 106 ++++++++++++ 
>>>> +-----
>>>>   drivers/hwtracing/coresight/coresight-dummy.c |   5 +-
>>>>   .../hwtracing/coresight/coresight-etm-perf.c  |  30 +++--
>>>>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>>>>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>>>>   .../coresight/coresight-etm3x-core.c          |  54 ++-------
>>>>   .../coresight/coresight-etm4x-core.c          |  54 ++-------
>>>>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>>>>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>>>>   drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
>>>>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 ++-
>>>>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>>>>   include/linux/coresight.h                     |  12 +-
>>>>   13 files changed, 143 insertions(+), 157 deletions(-)
>>>>
>>> [...]
>>>> @@ -352,7 +352,7 @@ static void *etm_setup_aux(struct perf_event 
>>>> *event, void **pages,
>>>>        * CPUs, we can handle it and fail the session.
>>>>        */
>>>>       for_each_cpu(cpu, mask) {
>>>> -        struct list_head *path;
>>>> +        struct coresight_path *path;
>>>>           struct coresight_device *csdev;
>>>>           csdev = per_cpu(csdev_src, cpu);
>>>> @@ -405,15 +405,15 @@ static void *etm_setup_aux(struct perf_event 
>>>> *event, void **pages,
>>>>               cpumask_clear_cpu(cpu, mask);
>>>>               continue;
>>>>           }
>>>> -
>>>>           /* ensure we can allocate a trace ID for this CPU */
>>>> -        trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink- 
>>>> >perf_sink_id_map);
>>>> -        if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>>> +        trace_id = coresight_path_assign_trace_id(path, CS_MODE_PERF);
>>>> +
>>>> +        /* Can be 0 and valid, ETE doesn't need an ID */
>>>> +        if (trace_id < 0) {
>>>
>>> Not sure why I wrote it like this, but I think we should leave it as 
>>> it was with !IS_VALID_CS_TRACE_ID(). Even with ETE it calls the trace 
>>> ID allocator, so nothing has changed here.
>>>
>> Sure, Will restore. For ETE or ETM, we dont need traverse the path, 
>> just directly allocate the trace id based on cpu id.
>>
>> Jie
>>
>>
> 
> Sorry I meant to only keep the !IS_VALID_CS_TRACE_ID() bit. We still 
> need to call the new coresight_path_assign_trace_id() otherwise it 
> doesn't get assigned to the path. I saw that got removed in v11.
> 
> 
Sorry for the misunderstanding, I was focused on "nothing has changed 
here", lol.

I got your point here.
So the updated codes should be:
...
                 /* ensure we can allocate a trace ID for this CPU */
                 trace_id = coresight_path_assign_trace_id(path, 
CS_MODE_PERF);
                 if (!IS_VALID_CS_TRACE_ID(trace_id)) {
                         cpumask_clear_cpu(cpu, mask);
                         coresight_release_path(path);
                         continue;
                 }
...


Thanks,
Jie

