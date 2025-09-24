Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDDBCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHxeAqDAzgoIkP2Y0QjhiBY4j5SW4uvDF0I+i3WqG3E=; b=XdBN5qqaTiyLAIl2xZ85wEPTpP
	76jL7rCcrb/Qdy3rFFqht6siNRJfMTWbKBte3CkfIsAtD5FGKDSGhedj/CZXLLbHk671OOHw+I0vH
	x/fsMGj7aPBDKmoBdXFb9BrM9mvoEMmli3QRx8DYFLsZWotwV7k5OCiSbW53iBe57WjOnzD0w8QJb
	tbIQGHZDHFb76Ty46a1bTJsP5bzAy5jyd9FmlxC9HbkSXCncM/6yC7UtZ8A4+3LqYmgE7yGV17s+0
	UmlqlvysCKL4YUUhbPUqi1lDca/xmgTmUB5b3FM8WX0x4ysIoGydbdEhEG/lXXg8JugaiDHUKn9L6
	d/qujqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SZj-00000001nzL-0qFZ;
	Wed, 24 Sep 2025 16:42:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SZf-00000001nxT-3FKM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:42:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62A9C16A3;
	Wed, 24 Sep 2025 09:42:26 -0700 (PDT)
Received: from [10.57.1.72] (unknown [10.57.1.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 581953F66E;
	Wed, 24 Sep 2025 09:42:33 -0700 (PDT)
Message-ID: <3b16607f-8995-46b1-aecf-c6aa79f66f9d@arm.com>
Date: Wed, 24 Sep 2025 17:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
Content-Language: en-GB
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Carl Worth <carl@os.amperecomputing.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
 <874isuo0m2.fsf@rasp.cworth.amperemail.amperecomputing.com>
 <f7be3833-9b33-4935-b821-a2e0000a2557@oss.qualcomm.com>
 <CAJ9a7VjaUE+iy=FFwPhCdfXgoGR3rP9WSx-ZkKYeCHhqJ2yzMg@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAJ9a7VjaUE+iy=FFwPhCdfXgoGR3rP9WSx-ZkKYeCHhqJ2yzMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_094235_892375_AAF632E4 
X-CRM114-Status: GOOD (  32.81  )
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

On 24/09/2025 11:21, Mike Leach wrote:
> Hi,
> 
> On Tue, 23 Sept 2025 at 02:49, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 9/23/2025 1:31 AM, Carl Worth wrote:
>>> Jie Gan <jie.gan@oss.qualcomm.com> writes:
>>>> From: Carl Worth <carl@os.amperecomputing.com>
>>>>
>>>> The handle is essential for retrieving the AUX_EVENT of each CPU and is
>>>> required in perf mode. It has been added to the coresight_path so that
>>>> dependent devices can access it from the path when needed.
>>>
>>> I'd still like to have the original command I used to trigger the bug in
>>> the commit message. I really like having reproduction steps captured in
>>> commit messages when I look back at commits in the future. So, that was:
>>>
>>>         perf record -e cs_etm//k -C 0-9 dd if=/dev/zero of=/dev/null
>>>
>>
>> Sure, I’ll include your commit message in the formal patch series, I
>> think it's V3 since you have submitted two versions, if you're okay with
>> me sending it out.
>>
>>>>    /**
>>>>     * struct coresight_path - data needed by enable/disable path
>>>> - * @path_list:              path from source to sink.
>>>> - * @trace_id:          trace_id of the whole path.
>>>> + * @path_list:                      path from source to sink.
>>>> + * @trace_id:                       trace_id of the whole path.
>>>> + * struct perf_output_handle:       handle of the aux_event.
>>>>     */
>>>
>>> Fixing to "@handle" was mentioned in another comment already.
>>>
>>> Something about the above still feels a little off to me. It feels like
>>> we're throwing new data into a structure just because it happens to be
>>> conveniently at hand for the code paths we're needing, and not because
>>> it really _belongs_ there.
>>>
>>
> This data is perf specific - not path generic; so I agree that this
> structure should go elsewhere.
> 
> I would suggest in the csdev (coresight_device) structure itself. We
> already have some sink specific data in here e.g. perf_sink_id_map.
> 
> This could then be set/clear in the functions coresight-etm-perf.c
> file, where there is a significant amount of code dealing with the
> perf handle and ensuring it is valid and in scope.
> 
> This can then be set only when appropriate - for source / sink devices
> and only when in perf mode, and avoid the need to pass the handle
> around as API call parameters.

I think this data is specific to the session we are enabling the
device(s) in. e.g., we keep the trace-id in the path.
So, I don't mind having this in the path structure.
Instead of modifying csdev with additional locking from "etm-perf"
it is always cleaner to handle this in the path.


Suzuki


> 
> Regards
> 
> Mike.
> 
> 
> 
> 
>> The core idea behind coresight_path is that it can hold all the data
>> potentially needed by any device along the path.
>>
>> For example with the path ETM->Link->ETR->CATU:
>>
>> All the mentioned devices operate by forming a path, for which the
>> system constructs a coresight_path. This 'path' is then passed to each
>> device along the route, allowing any device to directly access the
>> required data from coresight_path instead of receiving it as a separate
>> argument.
>>
>> Imagine a device that requires more than two or three arguments, and you
>> want to pass them through coresight_enable_path or similar functions...
>>
>> For certain coresight_path instances, we may not need the handle or
>> other parameters. Since these values are initialized, it's acceptable to
>> leave them as NULL or 0.
>>
>>
>>> Or, maybe it's the right place for it, and the cause of my concern is
>>> that "path" is an overly-narrow name in struct coresight_path?
>>>
>>
>> It defines the direction of data flow—serving as the path for trace data.
>>
>> Thanks,
>> Jie
>>
>>> But if a renaming of this structure would improve the code, I'd also be
>>> fine with that happening in a subsequent commit, so I won't try to hold
>>> up the current series based on that.
>>>
>>> -Carl
>>
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK


