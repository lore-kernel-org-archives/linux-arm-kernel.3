Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE5BD6206A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEV/1Fbbnm3qNVCaPeOCDZNyCQMeEFHRwtzZ/Mfe9Bw=; b=SP5Ihxl5G1PS+Aw5qXTFHCCCXK
	FvXypz2HWqDD//Jd4hhzjxLVj5B75eqSD3HcLDS56nVvcg4U5eibrYlwVj1Tqvm2sctf/qqxQrjMc
	cC5e6yPimXE2Hh/uzZpx4jmd8ETj5ghHHs3nOozjeY4RuReeV5jXLkk/PVaeqUPXK5MvF784E2ZQV
	JfJH653s2Tgndo2AqZ23VNXn33WboZTFqI9HQ6FrwpRgoKWM6guu+cDoRTD8ta2La1tLk0xMz0gcY
	PKD4wwzB7dTPWQnDE8xXIJWTddjpJZgohu+Jvj0EXcYRWFC25/+/87zPY/makBXpEMoTFrZoDsG3y
	/ob/0Z+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLdl-0000000C5QO-3jf4;
	Tue, 19 Nov 2024 10:39:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLcq-0000000C5Kq-15NX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 10:38:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7v6bQ027503;
	Tue, 19 Nov 2024 10:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QEV/1Fbbnm3qNVCaPeOCDZNyCQMeEFHRwtzZ/Mfe9Bw=; b=RdPk/WKN0FQkQ7Ym
	v+HRi0W0nc/+3LyMHkPkoU1MaakqMGduVnd6npIltAnwv/0Rzm1VjU5Ey0d2X8jb
	RsSuCKBJoOtw/qINli8fekXx657k0L+OJ+2rvWn25OPy5tela1aoUhxxmqaKsPyC
	WD9dc4ux7wq7T7Xz67v5Q1Hw6v/ZNTI/r045Wgji2J9H+QN8LuCboE4FMjR80q77
	qk5IWXqsNbuvTNHLOjIbHxdVkI8uOPSunh7bM6Cp6ZDBgv9o38DjqblFN7vmYKaA
	U/L0CMkN3io0SAGZw2baN8Y8l1yvLHHdYqhd+/qN52cs4WZTAETNdq43BsM9Kg7p
	nId7pg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6t8wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:38:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJAcJTA003467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:38:19 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 02:38:16 -0800
Message-ID: <ae1d4e9a-6273-407e-952c-aec38e5c7a4f@quicinc.com>
Date: Tue, 19 Nov 2024 18:38:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] coresight: Add support to get static id for system
 trace sources
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20241104115604.14522-1-quic_jinlmao@quicinc.com>
 <20241104115604.14522-3-quic_jinlmao@quicinc.com>
 <6424c536-2f2c-4a59-8b6d-f610201dc7a7@arm.com>
 <6a8e10fc-a231-467a-8056-d291e237fec1@quicinc.com>
 <ef057e19-1209-4a72-b223-ef3f1e2b4513@arm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <ef057e19-1209-4a72-b223-ef3f1e2b4513@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5y2WS9wdYUKqDwZ3D1ZCIyzUXk8uiacL
X-Proofpoint-GUID: 5y2WS9wdYUKqDwZ3D1ZCIyzUXk8uiacL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_023828_304329_797F4B16 
X-CRM114-Status: GOOD (  23.70  )
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



On 2024/11/18 18:18, Suzuki K Poulose wrote:
> On 18/11/2024 10:14, Jinlong Mao wrote:
>>
>>
>> On 2024/11/13 21:27, Suzuki K Poulose wrote:
>>> On 04/11/2024 11:56, Mao Jinlong wrote:
>>>> Dynamic trace id was introduced in coresight subsystem, so trace id is
>>>> allocated dynamically. However, some hardware ATB source has static 
>>>> trace
>>>> id and it cannot be changed via software programming. For such source,
>>>> it can call coresight_get_static_trace_id to get the fixed trace id 
>>>> from
>>>> device node and pass id to coresight_trace_id_get_static_system_id to
>>>> reserve the id.
>>>>
>>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>>> ---
>>>>   .../hwtracing/coresight/coresight-platform.c  |  6 +++
>>>>   .../hwtracing/coresight/coresight-trace-id.c  | 39 ++++++++++++ 
>>>> +------
>>>>   .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
>>>>   include/linux/coresight.h                     |  1 +
>>>>   4 files changed, 44 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/ 
>>>> drivers/hwtracing/coresight/coresight-platform.c
>>>> index 64e171eaad82..633d96b9577a 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>>>> @@ -796,6 +796,12 @@ int coresight_get_cpu(struct device *dev)
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(coresight_get_cpu);
>>>> +int coresight_get_static_trace_id(struct device *dev, u32 *id)
>>>> +{
>>>> +    return fwnode_property_read_u32(dev_fwnode(dev), "arm,static- 
>>>> trace-id", id);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
>>>> +
>>>>   struct coresight_platform_data *
>>>>   coresight_get_platform_data(struct device *dev)
>>>>   {
>>>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/ 
>>>> drivers/hwtracing/coresight/coresight-trace-id.c
>>>> index d98e12cb30ec..df8fe50b413f 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
>>>> @@ -12,6 +12,12 @@
>>>>   #include "coresight-trace-id.h"
>>>> +enum trace_id_flags {
>>>> +    TRACE_ID_ANY = 0x0,
>>>> +    TRACE_ID_PREFER_ODD = 0x1,
>>>> +    TRACE_ID_REQ_STATIC = 0x2,
>>>> +};
>>>> +
>>>>   /* Default trace ID map. Used in sysfs mode and for system sources */
>>>>   static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = 
>>>> ATOMIC_INIT(0);
>>>>   static struct coresight_trace_id_map id_map_default = {
>>>> @@ -74,16 +80,18 @@ static int coresight_trace_id_find_odd_id(struct 
>>>> coresight_trace_id_map *id_map)
>>>>    * Otherwise allocate next available ID.
>>>>    */
>>>>   static int coresight_trace_id_alloc_new_id(struct 
>>>> coresight_trace_id_map *id_map,
>>>> -                       int preferred_id, bool prefer_odd_id)
>>>> +                       int preferred_id, unsigned int flags)
>>>>   {
>>>>       int id = 0;
>>>>       /* for backwards compatibility, cpu IDs may use preferred 
>>>> value */
>>>> -    if (IS_VALID_CS_TRACE_ID(preferred_id) &&
>>>> -        !test_bit(preferred_id, id_map->used_ids)) {
>>>> -        id = preferred_id;
>>>> -        goto trace_id_allocated;
>>>> -    } else if (prefer_odd_id) {
>>>> +    if (IS_VALID_CS_TRACE_ID(preferred_id)) {
>>>> +        if (!test_bit(preferred_id, id_map->used_ids)) {
>>>> +            id = preferred_id;
>>>> +            goto trace_id_allocated;
>>>> +        } else if (flags & TRACE_ID_REQ_STATIC)
>>>> +            return -EINVAL;
>>>
>>> nit: EBUSY sounds like a better choice here ? Requested ID is not
>>> available.
>>>
>>> Additionally, do we need to handle a case where the preferred_id is
>>> not valid ? I think we silently allocate a new trace id in such case ?
>>>
>>> Rest looks good to me.
>>>
>>> Suzuki
>>>
>>>
>>
>> If preferred_id is not valid, a random id will be allocated for the 
>> source. For the normal source, 0 is provided here as preferred_id.
> 
> My point is : If preferred_id is not valid *and* TRACE_ID_REQ_STATIC
> flag is set, we go ahead and allocate a random different ID. Which is
> not preferred. We should return -EINVAL in that case.
> 
> Suzuki
> 
> 
Got your point. Thanks.

>>
>>>
>>>
>>>> +    } else if (flags & TRACE_ID_PREFER_ODD) {
>>>>       /* may use odd ids to avoid preferred legacy cpu IDs */
>>>>           id = coresight_trace_id_find_odd_id(id_map);
>>>>           if (id)
>>>> @@ -153,7 +161,7 @@ static int _coresight_trace_id_get_cpu_id(int 
>>>> cpu, struct coresight_trace_id_map
>>>>        */
>>>>       id = coresight_trace_id_alloc_new_id(id_map,
>>>>                            CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
>>>> -                         false);
>>>> +                         TRACE_ID_ANY);
>>>>       if (!IS_VALID_CS_TRACE_ID(id))
>>>>           goto get_cpu_id_out_unlock;
>>>> @@ -188,14 +196,14 @@ static void _coresight_trace_id_put_cpu_id(int 
>>>> cpu, struct coresight_trace_id_ma
>>>>       DUMP_ID_MAP(id_map);
>>>>   }
>>>> -static int coresight_trace_id_map_get_system_id(struct 
>>>> coresight_trace_id_map *id_map)
>>>> +static int coresight_trace_id_map_get_system_id(struct 
>>>> coresight_trace_id_map *id_map,
>>>> +                    int preferred_id, unsigned int traceid_flags)
>>>>   {
>>>>       unsigned long flags;
>>>>       int id;
>>>>       spin_lock_irqsave(&id_map->lock, flags);
>>>> -    /* prefer odd IDs for system components to avoid legacy CPU IDS */
>>>> -    id = coresight_trace_id_alloc_new_id(id_map, 0, true);
>>>> +    id = coresight_trace_id_alloc_new_id(id_map, preferred_id, 
>>>> traceid_flags);
>>>>       spin_unlock_irqrestore(&id_map->lock, flags);
>>>>       DUMP_ID(id);
>>>> @@ -255,10 +263,19 @@ 
>>>> EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
>>>>   int coresight_trace_id_get_system_id(void)
>>>>   {
>>>> -    return coresight_trace_id_map_get_system_id(&id_map_default);
>>>> +    /* prefer odd IDs for system components to avoid legacy CPU IDS */
>>>> +    return coresight_trace_id_map_get_system_id(&id_map_default, 0,
>>>> +            TRACE_ID_PREFER_ODD);
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
>>>> +int coresight_trace_id_get_static_system_id(int trace_id)
>>>> +{
>>>> +    return coresight_trace_id_map_get_system_id(&id_map_default,
>>>> +            trace_id, TRACE_ID_REQ_STATIC);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(coresight_trace_id_get_static_system_id);
>>>> +
>>>>   void coresight_trace_id_put_system_id(int id)
>>>>   {
>>>>       coresight_trace_id_map_put_system_id(&id_map_default, id);
>>>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/ 
>>>> drivers/hwtracing/coresight/coresight-trace-id.h
>>>> index 9aae50a553ca..db68e1ec56b6 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
>>>> @@ -116,6 +116,15 @@ int coresight_trace_id_read_cpu_id_map(int cpu, 
>>>> struct coresight_trace_id_map *i
>>>>    */
>>>>   int coresight_trace_id_get_system_id(void);
>>>> +/**
>>>> + * Allocate a CoreSight static trace ID for a system component.
>>>> + *
>>>> + * Used to allocate static IDs for system trace sources such as 
>>>> dummy source.
>>>> + *
>>>> + * return: Trace ID or -EINVAL if allocation is impossible.
>>>> + */
>>>> +int coresight_trace_id_get_static_system_id(int id);
>>>> +
>>>>   /**
>>>>    * Release an allocated system trace ID.
>>>>    *
>>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>>> index c13342594278..129795873072 100644
>>>> --- a/include/linux/coresight.h
>>>> +++ b/include/linux/coresight.h
>>>> @@ -662,6 +662,7 @@ void coresight_relaxed_write64(struct 
>>>> coresight_device *csdev,
>>>>   void coresight_write64(struct coresight_device *csdev, u64 val, 
>>>> u32 offset);
>>>>   extern int coresight_get_cpu(struct device *dev);
>>>> +extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
>>>>   struct coresight_platform_data *coresight_get_platform_data(struct 
>>>> device *dev);
>>>>   struct coresight_connection *
>>>
>>
> 


