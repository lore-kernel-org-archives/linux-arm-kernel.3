Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA48CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1juetUG9L2DfwKUfeLO13Y43g3gKpV1NTJQYnbTr2c=; b=gkXBaMtNpd4eeACcTjn7s7tiv/
	xL/z+7bOCBFhthlOZXWNd8cuqrZC0lMIfEWFKSFZXyJS9VHUn946Oza4ylwEcLjSoM+AgtRViTyIr
	hbupVC07i0xLjCQ0s6xLk7b6xX3X6pj9LUxs5cZTRIiqX+Us/nhOvKEBPL4zAcvibdGl8chTRFhlZ
	4mpzIJSon3H+MnV30ZsDaydKGsBwpgvUBZxDuGTo/Lw8MY9gjbjbH1gwZR+3R1ZVOos8Dme2WJrwa
	0CASXcSLr5wE0FFxh4YaY0jBkwXTZLZ4f5My93CtVEXAgk90F26LN1wmffjLvLDerkIKNfQkKtKWt
	XJkkoKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLf1-0000000GatW-0i8y;
	Wed, 27 Aug 2025 19:18:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJgc-0000000GH6W-2WNn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 17:11:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88CCE15A1;
	Wed, 27 Aug 2025 10:11:41 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4A633F694;
	Wed, 27 Aug 2025 10:11:44 -0700 (PDT)
Message-ID: <2ac66605-ee6a-495b-a0fb-910926abd8b0@arm.com>
Date: Wed, 27 Aug 2025 18:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/33] drivers: base: cacheinfo: Add helper to find the
 cache size from cpu+level
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
 <20250822153048.2287-3-james.morse@arm.com>
 <aK7iDey7LATOXIUb@e133380.arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aK7iDey7LATOXIUb@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_101150_681488_544447C5 
X-CRM114-Status: GOOD (  20.37  )
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
> Hi,
> 
> On Fri, Aug 22, 2025 at 03:29:43PM +0000, James Morse wrote:
>> MPAM needs to know the size of a cache associated with a particular CPU.
>> The DT/ACPI agnostic way of doing this is to ask cacheinfo.
>>
>> Add a helper to do this.

>> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
>> index 2dcbb69139e9..e12d6f2c6a57 100644
>> --- a/include/linux/cacheinfo.h
>> +++ b/include/linux/cacheinfo.h
>> @@ -148,6 +148,21 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
>>  	return ci ? ci->id : -1;
>>  }
>>  
>> +/**
>> + * get_cpu_cacheinfo_size() - Get the size of the cache.
>> + * @cpu:      The cpu that is associated with the cache.
>> + * @level:    The level of the cache as seen by @cpu.
>> + *
>> + * Callers must hold the cpuhp lock.
>> + * Returns the cache-size on success, or 0 for an error.
>> + */
> 
> Nit: Maybe use the wording
> 
> 	cpuhp lock must be held.
> 
> in the kerneldoc here, to match the other helpers it sits alongside.
> 
> Otherwise, looks reasonable.

Sure,


>> +static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
>> +{
>> +	struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, level);
>> +
>> +	return ci ? ci->size : 0;
>> +}
>> +
> 
> Orphaned function?
> 
> Can fs/resctrl/rdtgroup.c:rdtgroup_cbm_to_size() be ported to use this?
> If so, this wouldn't just be dead code in this series.

Ah - I thought the MPAM driver was pulling this value in, but its the resctrl glue code.
I was trying to reduce the number of trees this touches - its probably best to kick this
into the next series that adds the resctrl code as its pretty trivial.


Thanks,

James

