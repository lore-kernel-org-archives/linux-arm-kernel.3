Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6888CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTLbTnDNEmbTRZziI/6+iPmXc7b+EVu1h0J5YrQ5Xh8=; b=fgWVKGQBf/l9udzT2gt+jdcUWF
	MHZQli9ta5z1WUUat3qdxLKlFAQUaalzyGzjlB3bWaywbDbtV7n76J5HJGKoFLhKXKPxyxl8UMVlz
	L/2RAbIUsKgIFZL6KXWCjFqJr4xcCk8yfkqrn5mF772s7x94yjUMfLIBaPgqkkj12tos4r2xw/9CF
	qcL0SwdHkeHGrU5JHOC+ZDEAYGNMQVlxIPvesrKpIM4nU0uXTgRh7no09WnIrKCeZi9PB3g741DHB
	R0lOe+gtX8l6tmJTQP1Lr/vKQypoqz8M/TRtJTK+eWZTKBO1837rmpQWw1GTQuzIgy2wiqT1EyVNx
	NjubMaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0S-0000000HSrW-1UK1;
	Thu, 14 Aug 2025 15:36:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVVF-0000000GeMy-3d2c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:48:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E98poV013005;
	Thu, 14 Aug 2025 10:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qTLbTnDNEmbTRZziI/6+iPmXc7b+EVu1h0J5YrQ5Xh8=; b=hHOGvZNLJPov9+Mg
	U6xg6hcIYK60zHYuW0kGJ753bwXcvhKfZhJOtDjllEdJsEFpewLzuuH7JyUj2Op7
	nzY4DG9/5qQheq5E+kaIbK5bafYe2wUpxz/+yFrJ74lWU9SuCFbeeVtxGqty89is
	MxAZzXnHcI83eTKzAHds9glr+ArqtU4FMbkWIOuUA95CwkKKZoWQwU5raxQu5JqN
	8nBqle/SYQQcicgVR6UI0oKVQpPfFswA/OQC/MqoEHfMnxzDkIekwXhTe7w9cbdf
	70ssvKth52GS+/qhWyUKaTbH3MmfuEli5E5wiwN6B4Z5C7gN50nv1VqLvDNY4ykv
	GOEj8Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6u84f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:48:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EAm5da011327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:48:05 GMT
Received: from [10.216.10.193] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 03:47:59 -0700
Message-ID: <ce93ba16-e2a8-4015-bc01-139917d37782@quicinc.com>
Date: Thu, 14 Aug 2025 16:17:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/6] remoteproc: Add TEE support
To: Sumit Garg <sumit.garg@kernel.org>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jens
 Wiklander <jens.wiklander@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-3-arnaud.pouliquen@foss.st.com>
 <d4694157-a757-41f5-8874-4b67b262bc83@quicinc.com>
 <7c77dba4-27f9-4840-b9aa-253119308519@foss.st.com>
 <e5a234c7-0f8d-4b52-95fb-82371c8e4460@quicinc.com>
 <aJn6EPjXzq07aDTM@sumit-X1>
Content-Language: en-US
From: Harshal Dev <quic_hdev@quicinc.com>
In-Reply-To: <aJn6EPjXzq07aDTM@sumit-X1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfXwFPBb7p82dH/
 ioDG4c0t1jKQHiZFB8+PMqMvuPdAnj4OcJlt/rZgXkJpqH8gdtG7EuczpsoAs5eq00FVMzBPvSE
 /zkcOvKdTDm8fLs5mOWt8NLTIMxKdyl5HHjLkkGbAA2hOuSxqqq3hcWGtfCjXI6BMi0q3k8EQr/
 EjL4M38jQUqmXuT4TIsCobQ9tQm5sp1S9khTvKt8MXQRMeUApqja5GRj5kyeG1XqidvQYI+CC87
 +ZjxzVV0vb3xDPyjcFLDtt7iMPEEpsRllsvgLPisnjd5W9yeDeRNvIpjOXedzVbhl85HyGwvx4P
 7wlsDIkjE6wyBQr5WkHdpsfsrN2I3E+rNkM8RqaO2V4OCP5BjSLFpKh9k4KAGKZlGOgjoicn8VX
 KH9LCm95
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689dbee6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=8b9GpE9nAAAA:8
 a=5_XiphlS_4mscnRY6EoA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: GH4F1Vrdu5n--L2J1taw7XXDGW_saQSm
X-Proofpoint-ORIG-GUID: GH4F1Vrdu5n--L2J1taw7XXDGW_saQSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_034813_919215_B5FB7357 
X-CRM114-Status: GOOD (  38.49  )
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

Hi Sumit,

On 8/11/2025 7:41 PM, Sumit Garg wrote:
> Hi Harshal,
> 
> On Mon, Aug 04, 2025 at 02:56:18PM +0530, Harshal Dev wrote:
>> Hi Arnaud,
>>
>> On 8/1/2025 12:53 PM, Arnaud POULIQUEN wrote:
>>> Hello Harshal,
>>>
>>>
>>> On 7/31/25 12:25, Harshal Dev wrote:
>>>> Hello Arnaud,
>>>>
>>>> On 6/25/2025 3:10 PM, Arnaud Pouliquen wrote:
>>>>> Add a remoteproc TEE (Trusted Execution Environment) driver that will be
>>>>> probed by the TEE bus. If the associated Trusted application is supported
>>>>> on the secure part, this driver offers a client interface to load firmware
>>>>> by the secure part.
>>>>> This firmware could be authenticated by the secure trusted application.
>>>>>
>>>>> A specificity of the implementation is that the firmware has to be
>>>>> authenticated and optionally decrypted to access the resource table.
>>>>>
>>>>> Consequently, the boot sequence is:
>>>>>
>>>>> 1) rproc_parse_fw --> rproc_tee_parse_fw
>>>>>    remoteproc TEE:
>>>>>    - Requests the TEE application to authenticate and load the firmware
>>>>>      in the remote processor memories.
>>>>>    - Requests the TEE application for the address of the resource table.
>>>>>    - Creates a copy of the resource table stored in rproc->cached_table.
>>>>>
>>>>> 2) rproc_load_segments --> rproc_tee_load_fw
>>>>>    remoteproc TEE:
>>>>>    - Requests the TEE application to load the firmware. Nothing is done
>>>>>      at the TEE application as the firmware is already loaded.
>>>>>    - In case of recovery, the TEE application has to reload the firmware.
>>>>>
>>>>> 3) rproc_tee_get_loaded_rsc_table
>>>>>    remoteproc TEE requests the TEE application for the address of the
>>>>>    resource table.
>>>>>
>>>>> 4) rproc_start --> rproc_tee_start
>>>>>    - Requests the TEE application to start the remote processor.
>>>>>
>>>>> The shutdown sequence is:
>>>>>
>>>>> 5) rproc_stop --> rproc_tee_stop
>>>>>    - Requests the TEE application to stop the remote processor.
>>>>>
>>>>> 6) rproc_tee_release_fw
>>>>>    This function is used to request the TEE application to perform actions
>>>>>    to return to the initial state on stop or on error during the boot
>>>>>    sequence.
>>>>>
>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>> ---
>>>>> Updates vs version [18]:
>>>>> - rework/fix function headers
>>>>> - use memremap instead of ioremap for the resource table.
>>>>> - realign comments to 80 chars limit, with few exceptions for readability
>>>>> - replace spinlock by mutex and and protect APIs from concurrent access
>>>>> - add support of 64-bit address in rproc_tee_get_loaded_rsc_table()
>>>>> - Generalize teston rproc_tee_ctx.dev to prevent an unbind
>>>>> - update copyright year
>>>>>
>>>>> Updates vs version [17]:
>>>>> Fix warning:
>>>>> warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>>>>> ---
>>>>>  drivers/remoteproc/Kconfig          |  10 +
>>>>>  drivers/remoteproc/Makefile         |   1 +
>>>>>  drivers/remoteproc/remoteproc_tee.c | 708 ++++++++++++++++++++++++++++
>>>>>  include/linux/remoteproc_tee.h      |  87 ++++
>>>>>  4 files changed, 806 insertions(+)
>>>>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>>>>>  create mode 100644 include/linux/remoteproc_tee.h
>>>>>
> 
> <snip>
> 
>>>>> +
>>>>> +static int rproc_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
>>>>> +{
>>>>> +	/* Today we support only the OP-TEE, could be extend to other tees */
>>>>> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
>>>>> +}
>>>>> +
>>>>> +static int rproc_tee_probe(struct device *dev)
>>>>> +{
>>>>> +	struct tee_context *tee_ctx;
>>>>> +	int ret;
>>>>> +
>>>>> +	/* Open context with TEE driver */
>>>>> +	tee_ctx = tee_client_open_context(NULL, rproc_tee_ctx_match, NULL, NULL);
>>>>> +	if (IS_ERR(tee_ctx))
>>>>> +		return PTR_ERR(tee_ctx);
>>>>> +
>>>>> +	ret = mutex_lock_interruptible(&ctx_lock);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	rproc_tee_ctx.dev = dev;
>>>>> +	rproc_tee_ctx.tee_ctx = tee_ctx;
>>>>> +	INIT_LIST_HEAD(&rproc_tee_ctx.sessions);
>>>>> +	mutex_unlock(&ctx_lock);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>
>>>> As you mentioned above, this could be extended to other TEEs. If so, is it possible for probe
>>>> to be called multiple times if we we have other TEE devices exposing the firmware authentication
>>>> service? In that case, I think rproc_tee_ctx should be dynamically initializated instead of being
>>>> static. And since we are creating a link between the Rproc device and TEE device, a call to a
>>>> function like rproc_tee_start() could retreive the associated TEE device, and then the associated
>>>> rproc_tee? :)
>>>
>>> I have never seen a use case that requires multiple instances, but perhaps you
>>> have some?
>>>
>>> We can expect only one TEE, which could be OP-TEE, Trusty, or another.
>>> The device is associated with a unique UUID, so only one instance is expected.
>>>
>>> That said, making this driver support multiple instances seems like a valid
>>> future enhancement. However, I would suggest implementing it as a second step
>>> when there is a concrete need.
>>>
>>
>> My thought process on this stems from 1) the recent ARM FF-A developments and 2) from the current
>> implementation of the TEE subsystem which allows multiple back-end drivers to register themselves
>> via the tee_device_register() API. This means, that it's possible to have a configuration
>> where a platform supports multiple TEEs running as Secure Partitions via FF-A, and each of those
>> TEEs register their services as PTA devices on the TEE bus.
>>
>> However, I do not really know if it's possible to have a UUID collision in such a case, which
>> would lead to rproc_tee_probe() being called twice above, which is why I raised this question. :)
>>
>> All of this aside, I realize now that other TEE client drivers are also implemented with a static
>> private data similar to how you are doing it. So perhaps we can think of this as a later
>> enhancement if we believe that the scenario I am describing is not possible in the near future..
>>
> 
> Theoretically it is possible for multiple TEE services to be there but
> why should a platform/silicon vendor require 2 redundant remoteproc firmware
> loading services to be supported? It should either be a service hosted
> by the trusted OS or can rather be an independent platform service
> running as a FF-A secure partition.
> 
I agree that it doesn't make sense for a system integrator to have two remoteproc firmware
loading services supported from two different TEEs running as Secure Partitions.
After all, one service exposed by one TEE is good enough for fulfilling any use-case.

My concern is that ARM FF-A makes its possible to have a platform running two TEEs, which
each have their own remoteproc firmware authentication service implemented (as usually TEEs do).
In such a scenario, when both TEEs enumerate their services on the TEE bus, and find a match
because the rproc_tee_id_table has a UUID for say, both the TS-TEE remoteproc service and
OP-TEE remoteproc service, rproc_tee_probe() will be called twice, and the current implementation
will break because it uses a single static rproc_tee_ctx, whose contents would be overwritten
leading to unexpected scenarios.

And so, should TEE subsystem clients (like this one) be prepared to handle such as scenario?

Thanks,
Harshal
> -Sumit

