Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E019FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxov72UyUn5mUwjUmSOs6l4UzgvBpIy2o3tIk+RMuig=; b=PU1McBER5//8blKBwA/6WYQ2Vx
	s8mcP3b3LSvqw8KJH88U3zjAosUGtV+uaMtyGlrB5KQd7zmU9W194rcKhySExZ4pBLL5baZTP/LC3
	9/jnPbQWeFm8roRTtzQQk27F9iNS7C3GeAQ8avgnk3dyc02nMyPwNa9lFvmyA1BLYdnMUM4jy5CPj
	4yoyfZBWJP9DaHHWi7ikVlZXukglt5v/Q3/dQJIWzNjUrgYwKxtQoAb0Lg3HpX7ILrayJVOcD3zmH
	cev+JGz/7XiLH6tZsLvl0AYBRtThpya1WqJIgP69DLCnN2QnVEBy9t88LRJ2ocLSeSx3/wgPjaiA+
	2MPkLSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2gt-0000000FuSB-0ioI;
	Thu, 06 Nov 2025 16:18:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2gq-0000000FuRn-2MYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:18:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EC8F12FC;
	Thu,  6 Nov 2025 08:18:15 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DC073F66E;
	Thu,  6 Nov 2025 08:18:18 -0800 (PST)
Message-ID: <cc81b3f4-5736-4c11-894a-b37cf1c7c0a8@arm.com>
Date: Thu, 6 Nov 2025 16:18:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/29] ACPI / PPTT: Add a helper to fill a cpumask from
 a cache_id
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Jeremy Linton <jeremy.linton@arm.com>
Cc: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-5-james.morse@arm.com>
 <50a8cc38-810b-4bea-9a73-2463a6160b9f@arm.com>
 <20251024152256.00003f8e@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251024152256.00003f8e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081824_757790_A4D387C8 
X-CRM114-Status: GOOD (  16.89  )
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

Hi Jonathan, Jeremy,

(Replying for James as I'll post the next version of this series.)

On 10/24/25 15:22, Jonathan Cameron wrote:
> On Wed, 22 Oct 2025 07:58:36 -0500
> Jeremy Linton <jeremy.linton@arm.com> wrote:
> 
>> Hi,
>>
>> This is largely looking pretty solid, but..
>>
>>
>> On 10/17/25 1:56 PM, James Morse wrote:
>>> MPAM identifies CPUs by the cache_id in the PPTT cache structure.
>>>
>>> The driver needs to know which CPUs are associated with the cache.
>>> The CPUs may not all be online, so cacheinfo does not have the
>>> information.
>>>
>>> Add a helper to pull this information out of the PPTT.
>>>
>>> CC: Rohit Mathew <Rohit.Mathew@arm.com>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>>> ---
[...]
>>
>> Is the core acpi definition in actbl2.h correct? Shouldn't it be 
>> something along the lines of:
>>
>> struct acpi_pptt_cache_v1 {
>>   struct acpi_subtable_header header;
>>   u16 reservedd;
>>   u32 flags;
>>   u32 next_level_of_cache;
>>   u32 size;
>>   u32 number_of_sets;
>>   u8 associativity;
>>   u8 attributes;
>>   u16 lines_size;
>>   u32 cache_id;
>> }
>>
>>
>> Then that solves the detection of the additional field problem correctly 
>> because the length (24 vs 28) of the subtable then tells you which 
>> version your dealing with. (and goes back to why much of this is coded 
>> to use ACPI_ADD_PTR rather than structure+ logic.)
>>
> 
> Do we want to deal with arguing the change in ACPICA? 
> I fully agree that it would be much nicer if that didn't use this weird
> bits of structures approach :(  

For the moment I've added:

struct acpi_pptt_cache_v1_full {
	struct acpi_pptt_cache		f;
	struct acpi_pptt_cache_v1	extra;
} __packed;

in drivers/acpi/pptt.c
A stop gap but the length can be used to check for field presence and
you can avoid some ACPI_ADD_PTR usages.

> 
> https://github.com/acpica/acpica/blob/master/source/include/actbl2.h#L3497
> is where this is coming from.
> 
> Maybe can do it in parallel. Rafael, what do you think is best way forwards
> with this?
> 
> Jonathan
Thanks,

Ben


