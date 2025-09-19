Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C310CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/8dVOBVrCeSxVVM3XaYwl+wtLd9XoEkjy9Vo8s6qa8=; b=ET4SVL9VZC6N/yl935eWXIAtvJ
	emfkRxoXoBzVhRIWgKJSxikHGViE+hFMd0NAeanxOhHhAG3FzAPutF2yrvajxGHvA3PJ7GMrpHZYH
	rFGjOYOA5UDgbgZ0Od0h678O9BbxBzXnjJcIkuv2CaEDrp9Q4pdsxBp+o9kUaKT/vODgIUdZiK/cF
	ykiBmjyi2mtqdjK2BBn3NeGIUXGPckCd4MLorbG32pPk4X+PXSDYd+3qRHuPQnmZF3ZqjTVq19hHp
	78od7em21E0vJdBc/Gn7+ZMQLmr2mfrT7VNpAgq3iVWHvosuA5FiMcJdwjGau2UTak5aGt9HER5sz
	zEE/FxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVml-00000002750-1bmk;
	Fri, 19 Sep 2025 07:44:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVmi-0000000273U-1nDV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:44:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D02CD1692;
	Fri, 19 Sep 2025 00:43:50 -0700 (PDT)
Received: from [10.57.7.92] (unknown [10.57.7.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBD573F66E;
	Fri, 19 Sep 2025 00:43:57 -0700 (PDT)
Message-ID: <9d8f3a84-8c89-48a8-9996-4602bbabd446@arm.com>
Date: Fri, 19 Sep 2025 08:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Fix data argument to coresight_enable_helpers
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Carl Worth <carl@os.amperecomputing.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250916224441.3008824-1-carl@os.amperecomputing.com>
 <a331eceb-ec49-4396-a61d-78a75789b090@oss.qualcomm.com>
 <87frcj8kw7.fsf@rasp.cworth.amperemail.amperecomputing.com>
 <e1a2ee99-07bc-40f3-8742-a0cb1c273350@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <e1a2ee99-07bc-40f3-8742-a0cb1c273350@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_004400_516539_F50B1B78 
X-CRM114-Status: GOOD (  18.71  )
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

On 19/09/2025 02:20, Jie Gan wrote:
> 
> 
> On 9/19/2025 6:18 AM, Carl Worth wrote:
>> Jie Gan <jie.gan@oss.qualcomm.com> writes:
>>> I dont think we can change back to sink_data since we introduced
>>> coresight_path to wrap 'data' which is needed by the path.
>>>
>>> I suggest you to add the struct perf_output_handle to the
>>> coresight_path, then retrieving it with data->perf_handle in
>>> tmc_etr_get_buffer.
>> ...
>>> We can assign the perf_output_handle to the coresight_path after we
>>> constructed the coresight_path in perf mode.
>>
>> Thanks. That much makes sense to me, and I'll put together a patch along
>> those lines.
>>
>> But, further: with core coresight code assembling into the path all the
>> data that is necessary, is there any reason to be using void* in these
>> enable/disable functions?
> 
> In my opinion, yes, we can change void * to coresight_path * for 
> helper's enable/disable functions since we have everything in path so 
> the cast is not necessary now.
> 
>>
>> Could we also change these functions to accept a coresight_path* and
>> actually get some compiler help at finding mistakes like the one we're
>> fixing here?
> 


Yes, please. I was going to suggest that. May be we could do that as
a separate patch after fixing the problem here first (so that it
can be back ported).

This was initially a perf_handle only used for the perf mode, and
it didn't make sens to have a "perf" argument to "enable" which
could be used for both sysfs and perf. Now that the path
is a generic data structure, it makes sense to move everything
to accept the path.

Suzuki


> That's the only benefit in my mind so far.
> 
> Thanks,
> Jie
> 
>>
>> -Carl
> 


