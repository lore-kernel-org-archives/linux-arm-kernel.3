Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33A6CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2WSpAMKaQOkxC3E99SUaGzHoFyxhF3z7Ff1YT5yNss=; b=M0sod1pjNNNhB45EyPqqI82Twz
	X4dZTWR+ipHoYYZSQBgaJASsPcFLRwAYbWrxrvKM2jacbsmEiQZkIYX0vtrTMVZFNTjIX7CFu1NAl
	fWGPU3VNQTzBPKULvaqeftAO3T2208KqKXFT8bUwOXw2lFkRI/EkAgHzradZkLllg+XeKguevClLE
	woJxnNB5W+RqZsePkffgjR8tFufXdlLGzSMYhWRg5G9YuvC6AOhfqndzBlvxc0/a9RhYb70STTjtj
	OyRphqlaI7Dq2FoDygyOSD4DtabY3BQVTl+gE0H7gZfH/ktjjFIzoxZ5iArHyFh5nnUfDdvdvISl5
	jAjLZelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMgy-0000000Gk0A-1R4c;
	Wed, 27 Aug 2025 20:24:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJgQ-0000000GH3X-2DIj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 17:11:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB08115A1;
	Wed, 27 Aug 2025 10:11:27 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FE913F694;
	Wed, 27 Aug 2025 10:11:27 -0700 (PDT)
Message-ID: <17675117-79ef-42e3-9c21-4bc46e73d6b1@arm.com>
Date: Wed, 27 Aug 2025 18:11:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/33] cacheinfo: Expose the code to generate a cache-id
 from a device_node
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-2-james.morse@arm.com>
 <aK7h6seHNWs5rO9Q@e133380.arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aK7h6seHNWs5rO9Q@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_101138_666615_3A36547A 
X-CRM114-Status: GOOD (  27.64  )
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

Hi Dave,

On 27/08/2025 11:46, Dave Martin wrote:
> On Fri, Aug 22, 2025 at 03:29:42PM +0000, James Morse wrote:
>> The MPAM driver identifies caches by id for use with resctrl. It
>> needs to know the cache-id when probe-ing, but the value isn't set
>> in cacheinfo until device_initcall().
>>
>> Expose the code that generates the cache-id. The parts of the MPAM
>> driver that run early can use this to set up the resctrl structures
>> before cacheinfo is ready in device_initcall().

> Why can't the MPAM driver just consume the precomputed cache-id
> information?

Because it would need to wait until cacheinfo was ready, and it would still
need a way of getting the cache-id for caches where all the CPUs are offline.

The resctrl glue code has a waitqueue to wait for device_initcall_sync(), but that is
asynchronous to driver probing, its triggered by the schedule_work() from the cpuhp
callbacks. This bit is about the driver's use, which just gets probed whenever the core
code feels like it.

I toyed with always using cacheinfo for everything, and just waiting - but the MPAM driver
already has to parse the PPTT to find the information it needs on ACPI platforms, so the
wait would only happen on DT.

It seemed simpler to grab what the value would be, instead of waiting (or probe defer) -
especially as this is also needed for caches where all the CPUs are offline.

(I'll add the offline-cpus angle to the commit message)


> Possible reasons are that the MPAM driver probes too early,

yup,

> or that it
> must parse the PPTT directly (which is true) and needs to label caches
> consistently with the way the kernel does it.

It needs to match what will be exposed to user-space from cacheinfo.
This isn't about the PPTT, its the value that is generated for DT systems.
The driver has to know if its ACPI or DT to call the appropriate thing to get cache-ids
before cacheinfo is ready.


>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>> index 613410705a47..f6289d142ba9 100644
>> --- a/drivers/base/cacheinfo.c
>> +++ b/drivers/base/cacheinfo.c
>> @@ -207,11 +207,10 @@ static bool match_cache_node(struct device_node *cpu,
>>  #define arch_compact_of_hwid(_x)	(_x)
>>  #endif
>>  
>> -static void cache_of_set_id(struct cacheinfo *this_leaf,
>> -			    struct device_node *cache_node)
>> +unsigned long cache_of_calculate_id(struct device_node *cache_node)
>>  {
>>  	struct device_node *cpu;
>> -	u32 min_id = ~0;
>> +	unsigned long min_id = ~0UL;

> Why the change of type here?

This is a hang over from Rob's approach of making the cache-id 64 bit.


> This does mean that 0xffffffff can now be generated as a valid cache-id,
> but if that is necessary then this patch is also fixing a bug in the
> code -- but the commit message doesn't say anything about that.
> 
> For a patch that is just exposing an internal result, it may be
> better to keep the original type.  ~(u32)0 is already used as an
> exceptional value.

Yup, I'll fix that.


Thanks!

James

