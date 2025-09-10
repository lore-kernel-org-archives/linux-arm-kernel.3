Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6D2CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dGngHXEurLSbEzxRGWI9S+2bpiLhPxw3hCSQE6Fz1c=; b=l7PYKdXXIenQSW0N7CEHnJZar8
	p3WpjuILUjdiEzV899F8HPvhDgF9Dc/vISvxh8bR2UdfYo4fGgMg9jasZNlVklJ43OM2VdkWTNSFL
	5gdNt+1idm6bUO9mUYkfasg0KnaCOM7iqpzGiyljqV2jCsuYdVgRy5vs70GAKGRc4BQMrjze6e6j5
	17PjvnWRlZ20J+2bJCVphhvLaYUkA5Y4wtaNSDs82n/3ee8ixU3fecA8tBZ8taSDmUxhP+iCMt/Tj
	Ov4K1VeWUdxxDym/tN6kFruOprxx8pkj730rrHY9o8Gv5VlV09ZlM1w9zyo1fVqlwwY34PG2bkMfE
	9F9dgwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQME-0000000GEar-1opF;
	Wed, 10 Sep 2025 19:19:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQMB-0000000GEYC-08Da
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:19:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBEDE16F2;
	Wed, 10 Sep 2025 12:19:38 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99F3B3F694;
	Wed, 10 Sep 2025 12:19:41 -0700 (PDT)
Message-ID: <e7853d6a-59f4-4d12-b290-c194258eda2d@arm.com>
Date: Wed, 10 Sep 2025 20:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/33] ACPI / PPTT: Stop acpi_count_levels() expecting
 callers to clear levels
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
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
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-39-james.morse@arm.com> <aMGAw4+/IAWBPiqn@lpieralisi>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aMGAw4+/IAWBPiqn@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_121951_482499_A92B79D2 
X-CRM114-Status: GOOD (  19.22  )
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

Hi Lorenzo,

On 10/09/2025 14:44, Lorenzo Pieralisi wrote:
> On Fri, Aug 22, 2025 at 03:30:19PM +0000, James Morse wrote:
>> acpi_count_levels() passes the number of levels back via a pointer argument.
>> It also passes this to acpi_find_cache_level() as the starting_level, and
>> preserves this value as it walks up the cpu_node tree counting the levels.
>>
>> This means the caller must initialise 'levels' due to acpi_count_levels()
>> internals. The only caller acpi_get_cache_info() happens to have already
>> initialised levels to zero, which acpi_count_levels() depends on to get the
>> correct result.
>>
>> Two results are passed back from acpi_count_levels(), unlike split_levels,
>> levels is not optional.
>>
>> Split these two results up. The mandatory 'levels' is always returned,
>> which hides the internal details from the caller, and avoids having
>> duplicated initialisation in all callers. split_levels remains an
>> optional argument passed back.

>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 4791ca2bdfac..8f9b9508acba 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -181,10 +181,10 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
>>   * levels and split cache levels (data/instruction).
>>   * @table_hdr: Pointer to the head of the PPTT table
>>   * @cpu_node: processor node we wish to count caches for
>> - * @levels: Number of levels if success.
>>   * @split_levels:	Number of split cache levels (data/instruction) if
>> - *			success. Can by NULL.
>> + *			success. Can be NULL.
> 
> Nit: tempting but this change does not belong here.

Clearly a much loved typo!


>> @@ -192,14 +192,18 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
>>   * split cache levels (data/instruction) that exist at each level on the way
>>   * up.
>>   */
>> -static void acpi_count_levels(struct acpi_table_header *table_hdr,
>> -			      struct acpi_pptt_processor *cpu_node,
>> -			      unsigned int *levels, unsigned int *split_levels)
>> +static int acpi_count_levels(struct acpi_table_header *table_hdr,
>> +			     struct acpi_pptt_processor *cpu_node,
>> +			     unsigned int *split_levels)
>>  {
>> +	int starting_level = 0;
>> +
>>  	do {
>> -		acpi_find_cache_level(table_hdr, cpu_node, levels, split_levels, 0, 0);
>> +		acpi_find_cache_level(table_hdr, cpu_node, &starting_level, split_levels, 0, 0);
>>  		cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
>>  	} while (cpu_node);
>> +
>> +	return starting_level;
>>  }
>>  
>>  /**
>> @@ -731,7 +735,7 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
>>  	if (!cpu_node)
>>  		return -ENOENT;
>>  
>> -	acpi_count_levels(table, cpu_node, levels, split_levels);
>> +	*levels = acpi_count_levels(table, cpu_node, split_levels);

> Looks fine to me - though initializing
> 
> *levels = 0
> 
> upper in the function now becomes superfluous (?) (well, it initializes
> *levels to 0 if an error path is hit but on that case the caller should
> not expect *levels to be initialized to anything IIUC).

Maybe, but its the least surprising thing to do - hence the existing early clobber.


> Apart from these (very) minor things:
> 
> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>


Thanks!

James

