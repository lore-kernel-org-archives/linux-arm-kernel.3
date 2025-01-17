Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE74C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 02:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UziHbSF8WfndcUms+/PlZrK9Xuka7vaeBvfuVNRCKfk=; b=ckhL8ncBYz2Iw9C1oA8lHSTv0e
	EaljIzX9QaEAvI9GnPLy36XoQhQEmzDgvZyou6PkBv55NCporH0LqULBqAItNpr051PGA0ZFdzEVi
	YXyBMJEzfTyfuQPXRXxPoGOMTKT5+0Rc+HAhL+9nXq30qf6/1eenj1NCyzH3+kymhGn7bPqfQqj+J
	QKolTKWdeUKKDEbFB/jlzKCBCG3DvRW/ASqL7rflE0TCBlHVTNOjkQieRfZdRbtkTaV4UYCUwmTeM
	sLx7V5wcdKvRLRvtIyBUFoEUVopb4U9bDGW8N4otJCA2dYXIII/4GmeNMVgWe0G11SbbyUMMxOxZB
	wkZDQ9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYcB2-0000000Grdc-2eNT;
	Fri, 17 Jan 2025 02:33:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYc9l-0000000GrVs-0A6q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 02:32:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H2S2Wv030122;
	Fri, 17 Jan 2025 02:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UziHbSF8WfndcUms+/PlZrK9Xuka7vaeBvfuVNRCKfk=; b=D7RUCdgeKaqQ5R3X
	FdvfveFs1FjldoxLQts0WOXRrF5ZXqWltC7SESvv3F06AMIcv8PuQisJCqcmA52v
	qj1PXJV/OLqmQqrGsac2uR3g63rS6Sk7xF6Uw2VdZV3t7HQyt7hRFGXBSGBvHjmn
	enQdGQaVuD/CApkPK97BsKBS/rfxJDxwTb9sDJq/T7ggB2T22rYpzudz4OAYnDhx
	ENQjxlv6b69UdrOf3sKkFZZmqEspdBbC944zZ8J/25tpRctZ24H9kC+5lMDFrXiS
	mttzBjJJ91GGcgv78UqO3GZUn1U/Hj9lKbTq/w+bQ4HSOF+b5lwLYn4LkK1n5d/B
	OfJyxw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447eemr0ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 02:32:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H2W57i017865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 02:32:05 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 Jan
 2025 18:32:00 -0800
Message-ID: <31a9a84e-c22d-446e-9082-12b74a1c82e0@quicinc.com>
Date: Fri, 17 Jan 2025 10:31:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] Coresight: Add trace_id function to retrieving the
 trace ID
To: James Clark <james.clark@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
 <20241226011022.1477160-3-quic_jiegan@quicinc.com>
 <64731493-4bd1-4707-9452-5ca86744875b@linaro.org>
 <a2d995bc-02ff-4374-968e-2fa6d8f921dd@quicinc.com>
 <02f114b7-8654-4402-b105-7aef41d487f0@linaro.org>
 <e3a29406-075d-41f6-888c-ebe168162134@quicinc.com>
 <b8fd3d5a-fc61-4ab0-8fb1-7cacf4cab9f5@linaro.org>
 <5c0827ce-cf25-43d0-a160-5f99e82f582c@quicinc.com>
 <49f6619d-f042-42b9-9359-b7d78783a32e@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <49f6619d-f042-42b9-9359-b7d78783a32e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UEKC4_a0uBSOjTLVWUoGlfHiA-hWqM3K
X-Proofpoint-ORIG-GUID: UEKC4_a0uBSOjTLVWUoGlfHiA-hWqM3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_11,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_183221_091168_8858282B 
X-CRM114-Status: GOOD (  37.49  )
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



On 1/16/2025 6:17 PM, James Clark wrote:
> 
> 
> On 16/01/2025 3:01 am, Jie Gan wrote:
>>
>>
>> On 1/15/2025 8:29 PM, James Clark wrote:
>>>
>>>
>>> On 15/01/2025 1:44 am, Jie Gan wrote:
>>>>
>>>>
>>>> On 1/14/2025 6:07 PM, James Clark wrote:
>>>>>
>>>>>
>>>>> On 14/01/2025 2:51 am, Jie Gan wrote:
>>>>>>
>>>>>>
>>>>>> On 1/13/2025 8:02 PM, James Clark wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 26/12/2024 1:10 am, Jie Gan wrote:
>>>>>>>> Add 'trace_id' function pointer in ops. It's responsible for
>>>>>>>> retrieving the device's trace ID.
>>>>>>>>
>>>>>>>> Add 'struct cs_sink_data' to store the data that is needed by
>>>>>>>> coresight_enable_path/coresight_disable_path. The structure
>>>>>>>> will be transmitted to the helper and sink device to enable
>>>>>>>> related funcationalities.
>>>>>>>>
>>>>>>>
>>>>>>> The new cs_sink_data struct is quite specific to this change. Can 
>>>>>>> we start passing the path around to enable/disable functions, 
>>>>>>> that will allow devices to gather anything they want in the 
>>>>>>> future. Because we already have coresight_get_sink(path), 
>>>>>>> coresight_get_source(path) etc.
>>>>>>>
>>>>>>> And see below, but for this case we can also change the path 
>>>>>>> struct to contain the trace ID. Then all the new functions, 
>>>>>>> allocations and searches for the trace ID are unecessary. The 
>>>>>>> CTCU will have access to the path, and by the time its enable 
>>>>>>> function is called the trace ID is already assigned.
>>>>>>>
>>>>>>> It's also easier to understand at which point a trace ID is 
>>>>>>> allocated, rather than adding the trace_id() callbacks from 
>>>>>>> everywhere which could potentially either read or allocate. I 
>>>>>>> suppose that's "safer" because maybe it's not allocated, but I 
>>>>>>> can't see what case it would happen in reverse.
>>>>>>>
>>>>>> Thank you for comment. I will try this solution.
>>>>>> The biggest challenge for the patch is how to correctly read 
>>>>>> trace_id from source device and passthrough it to helper device as 
>>>>>> the source device always the last one to enable. I believe your 
>>>>>> proposed solution is better than mine and has minimal impact on 
>>>>>> the basic framework, but I think we still need read_trace in 
>>>>>> source_ops and link_ops. Then we can read the trace_id in 
>>>>>> coresight_build_path function and save it to the coresight_path to 
>>>>>> avoid redundant searching?
>>>>>>
>>>>>>
>>>>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>>>>> ---
>>>>>>>>   drivers/hwtracing/coresight/coresight-core.c  | 59 +++++++++++ 
>>>>>>>> + + + +----
>>>>>>>>   drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>>>>>>>>   .../hwtracing/coresight/coresight-etm-perf.c  | 37 ++++++++++--
>>>>>>>>   .../coresight/coresight-etm3x-core.c          | 30 ++++++++++
>>>>>>>>   .../coresight/coresight-etm4x-core.c          | 29 +++++++++
>>>>>>>>   drivers/hwtracing/coresight/coresight-priv.h  | 13 +++-
>>>>>>>>   drivers/hwtracing/coresight/coresight-stm.c   | 22 +++++++
>>>>>>>>   drivers/hwtracing/coresight/coresight-sysfs.c | 24 +++++++-
>>>>>>>>   .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>>>>>>>>   .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
>>>>>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 20 +++++++
>>>>>>>>   drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>>>>>>>>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>>>>>>>>   include/linux/coresight.h                     |  6 ++
>>>>>>>>   14 files changed, 234 insertions(+), 25 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/ 
>>>>>>>> drivers/ hwtracing/coresight/coresight-core.c
>>>>>>>> index 0a9380350fb5..2e560b425fd4 100644
>>>>>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>>>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>>>>>> @@ -23,6 +23,7 @@
>>>>>>>>   #include "coresight-etm-perf.h"
>>>>>>>>   #include "coresight-priv.h"
>>>>>>>>   #include "coresight-syscfg.h"
>>>>>>>> +#include "coresight-trace-id.h"
>>>>>>>>   /*
>>>>>>>>    * Mutex used to lock all sysfs enable and disable actions and 
>>>>>>>> loading and
>>>>>>>> @@ -331,12 +332,12 @@ static int coresight_enable_helper(struct 
>>>>>>>> coresight_device *csdev,
>>>>>>>>       return helper_ops(csdev)->enable(csdev, mode, data);
>>>>>>>>   }
>>>>>>>> -static void coresight_disable_helper(struct coresight_device 
>>>>>>>> *csdev)
>>>>>>>> +static void coresight_disable_helper(struct coresight_device 
>>>>>>>> *csdev, void *data)
>>>>>>>>   {
>>>>>>>> -    helper_ops(csdev)->disable(csdev, NULL);
>>>>>>>> +    helper_ops(csdev)->disable(csdev, data);
>>>>>>>>   }
>>>>>>>> -static void coresight_disable_helpers(struct coresight_device 
>>>>>>>> *csdev)
>>>>>>>> +static void coresight_disable_helpers(struct coresight_device 
>>>>>>>> *csdev, void *data)
>>>>>>>>   {
>>>>>>>>       int i;
>>>>>>>>       struct coresight_device *helper;
>>>>>>>> @@ -344,7 +345,7 @@ static void coresight_disable_helpers(struct 
>>>>>>>> coresight_device *csdev)
>>>>>>>>       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>>>>>>>>           helper = csdev->pdata->out_conns[i]->dest_dev;
>>>>>>>>           if (helper && coresight_is_helper(helper))
>>>>>>>> -            coresight_disable_helper(helper);
>>>>>>>> +            coresight_disable_helper(helper, data);
>>>>>>>>       }
>>>>>>>>   }
>>>>>>>> @@ -361,7 +362,7 @@ static void coresight_disable_helpers(struct 
>>>>>>>> coresight_device *csdev)
>>>>>>>>   void coresight_disable_source(struct coresight_device *csdev, 
>>>>>>>> void *data)
>>>>>>>>   {
>>>>>>>>       source_ops(csdev)->disable(csdev, data);
>>>>>>>> -    coresight_disable_helpers(csdev);
>>>>>>>> +    coresight_disable_helpers(csdev, NULL);
>>>>>>>>   }
>>>>>>>>   EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>>>>>> @@ -371,7 +372,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>>>>>>    * disabled.
>>>>>>>>    */
>>>>>>>>   static void coresight_disable_path_from(struct list_head *path,
>>>>>>>> -                    struct coresight_node *nd)
>>>>>>>> +                    struct coresight_node *nd,
>>>>>>>> +                    void *sink_data)
>>>>>>>>   {
>>>>>>>>       u32 type;
>>>>>>>>       struct coresight_device *csdev, *parent, *child;
>>>>>>>> @@ -417,13 +419,13 @@ static void 
>>>>>>>> coresight_disable_path_from(struct list_head *path,
>>>>>>>>           }
>>>>>>>>           /* Disable all helpers adjacent along the path last */
>>>>>>>> -        coresight_disable_helpers(csdev);
>>>>>>>> +        coresight_disable_helpers(csdev, sink_data);
>>>>>>>>       }
>>>>>>>>   }
>>>>>>>> -void coresight_disable_path(struct list_head *path)
>>>>>>>> +void coresight_disable_path(struct list_head *path, void 
>>>>>>>> *sink_data)
>>>>>>>>   {
>>>>>>>> -    coresight_disable_path_from(path, NULL);
>>>>>>>> +    coresight_disable_path_from(path, NULL, sink_data);
>>>>>>>>   }
>>>>>>>>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>>>>>>>> @@ -505,10 +507,47 @@ int coresight_enable_path(struct list_head 
>>>>>>>> *path, enum cs_mode mode,
>>>>>>>>   out:
>>>>>>>>       return ret;
>>>>>>>>   err:
>>>>>>>> -    coresight_disable_path_from(path, nd);
>>>>>>>> +    coresight_disable_path_from(path, nd, sink_data);
>>>>>>>>       goto out;
>>>>>>>>   }
>>>>>>>> +int coresight_read_traceid(struct list_head *path, enum cs_mode 
>>>>>>>> mode,
>>>>>>>> +               struct coresight_trace_id_map *id_map)
>>>>>>>> +{
>>>>>>>> +    int trace_id, type;
>>>>>>>> +    struct coresight_device *csdev;
>>>>>>>> +    struct coresight_node *nd;
>>>>>>>> +
>>>>>>>> +    list_for_each_entry(nd, path, link) {
>>>>>>>
>>>>>>> What do you think about also changing the path to this:
>>>>>>>
>>>>>>>   struct coresight_path {
>>>>>>>     struct list_head *path,
>>>>>>>     u8 trace_id
>>>>>>>   };
>>>>>>>
>>>>>> That's better, I can simplify the coresight_read_traceid function 
>>>>>> without traverse the path.
>>>>>>
>>>>>> But we still need to check the type of the coresight device, 
>>>>>> because the TPDM does not have traceid and we use the trace_id 
>>>>>> from the TPDA device that the TPDM connected. That's why I added 
>>>>>> trace_id to link_ops.
>>>>>>
>>>>>
>>>>> But if any device that allocates a trace ID saves it into the path, 
>>>>> then as long as any other device that needs the ID is enabled after 
>>>>> that it just reads it from the path directly. Assuming we pass the 
>>>>> path to every enable and disable function.
>>>>>
>>>>> We wouldn't need coresight_read_traceid() if it always happens that 
>>>>> way around, which I think it currently does?
>>>>>
>>>> I got your point here. You are right. If we passed path to the 
>>>> helper device, just use coresight_get_source to obtain the source 
>>>> device, then call the source_ops->trace_id to obtain the trace_id. 
>>>> So we definitely dont need a standalone function, 
>>>> coresight_read_traceid().
>>>>
>>>> Besides, I still need a function to retrive the trace_id of the TPDA 
>>>> device if the source device is TPDM, right?
>>>>
>>>>
>>>> Thanks,
>>>> Jie
>>>>
>>>
>>> Yes, and that would require a search as the TPDA not always at one 
>>> end of the path like coresight_get_source() and coresight_get_sink(). 
>>> Which is why I was thinking it might be good to save the trace ID in 
>>> the path struct to avoid it.
>>>
>> As you proposed, I created coresight_path structure as below:
>> struct coresight_path {
>>      struct perf_output_handle       *handle;
> 
> What's the perf handle for? Seems like this change for the CTCU only 
> requires access to the trace_id which is added below.
In perf mode, the handle as the "sink_data" has been transmitted to 
coresight_enable_path function.

etm_event_start:
struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
struct perf_output_handle *handle = &ctxt->handle;

...

if (coresight_enable_path(cs_path, CS_MODE_PERF, handle))

...

Then, the handle as the "sink_data", it will be transmitted to 
coresight_enable_helpers and coresight_enable_sink.

As I mentioned before, I modified following codes in coresight_enable_path:
coresight_enable_helpers(csdev, mode, sink_data) ->
coresight_enable_helpers(csdev, mode, cs_path)

So, I need to consider how to correctly to handle the "handle" 
parameter! That's why I added it to the coresight_path, ensure the 
'handle' is correctly referenced wherever necessary.

> 
>>      struct list_head                *path;
>>      u8                trace_id;
>> };
>>
>> In coresight_enable_path, I modified the parameters that transmitted 
>> to helper device:
>> struct coresight_path *cs_path;
>>
>> coresight_enable_helpers(csdev, mode, sink_data) ->
>> coresight_enable_helpers(csdev, mode, cs_path)
>>
>> The cs_path will be constructed and initialized in 
>> coresight_build_path function.
>>
>> For perf mode, the trace_id is collected within etm_setup_aux and 
>> stored in cs_path->trace_id to avoid extra cost of retrieving the 
>> trace_id;
>>
> 
> Looks good.
> 
>> For sysfs mode, I let the CTCU device to retrieving the trace_id with 
>> path. The TPDA device is located close to the TPDM, making the cost of 
>> searching for the TPDA device acceptable.
>>
>> The cs_path will be stored in the same manner as the previous path.
>>
>> How do you think about this solution?
>>
> 
> Can it not be done the same way as Perf, at least for consistency? If 
> the enable helper function already gets access to the path, and the path 
> already has the trace ID, why is any search required?
Hi, James

For sysfs mode, We need to retrieve the trace_id once within the enable 
function, then cache it to coresight_path. (As discussed before, there 
is a special case of the source device is TPDM!)

Consider the CTCU is the helper device of the TMC ETR device, not all 
path need the trace_id(other sink, etf), so I put the retrieving logic 
in the CTCU driver(within CTCU enable).

For the disable function, we just use the cached trace_id in 
coresight_path to disable the trace_id filter functionality.

Or I was thinking another solution in coresight_build_path, We assume 
only the sysfs mode needs to retrieve the trace_id when construct path. 
So we can call source_ops(csdev)->trace_id once, hopefully the source 
device is not TPDM! If not, we will try to locate the TPDA device, then 
call link_ops(csdev)->trace_id to read the trace_id. And for perf mode, 
we still use the solution I mentioned before.

How do you think about it, which one do you prefer? Or any other proposal?

Thanks,
Jie



