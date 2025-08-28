Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A366CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPnFJXeqgZyeQG/UXRT8IcqkcW9TQ4iUUjuRvRS7WDo=; b=vO+1gRk+wnolAGAyVNSfPjyQBb
	HzzXJGnVZiYKy9mv8TScqb12df6PkMa9u8/rVQpjpVvuS8fjIbsr7kp6YkvXdgXzFU6rHJY7VnHRS
	NBUNyQ1PTFQrHUrFPcIhXjFVa4r5BVExRUNnVrFa4M41fl7s6+/pAA6u16rSUQBhr6yYiGfY1qrFf
	HtZf6dzjd7wLaC0fXd4ojHouFUoSzIJ8jQH+1GBl5ey4jXyHgOEJVqyRcsbtFA2l+l3MfBhjtUXR3
	LfV59qgYALcec6ES5SPJeC+FH0uQHyp1pQ0tyclfihk+KKh6nU6if8ioDz3TKeNQWQJRG/xplZuew
	4VMQd+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriSO-000000033Ox-0ZWT;
	Thu, 28 Aug 2025 19:38:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf0D-00000002A8O-1tKe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:57:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0783A1A32;
	Thu, 28 Aug 2025 08:57:20 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADBC03F694;
	Thu, 28 Aug 2025 08:57:17 -0700 (PDT)
Message-ID: <1914b7f0-10e6-4cf4-ad53-5ae03c69964d@arm.com>
Date: Thu, 28 Aug 2025 16:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/33] ACPI / PPTT: Stop acpi_count_levels() expecting
 callers to clear levels
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
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
 <20250822153048.2287-5-james.morse@arm.com>
 <aK7iyf/6iVOuVhTr@e133380.arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aK7iyf/6iVOuVhTr@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085729_571669_FE8B788F 
X-CRM114-Status: GOOD (  28.20  )
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

On 27/08/2025 11:49, Dave Martin wrote:
> On Fri, Aug 22, 2025 at 03:29:45PM +0000, James Morse wrote:
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
> 
> Nit: I found all this a bit hard to follow.
> 
> This seems to boil down to:
> 
> --8<--
> 
> In acpi_count_levels(), the initial value of *levels passed by the
> caller is really an implementation detail of acpi_count_levels(), so it
> is unreasonable to expect the callers of this function to know what to
> pass in for this parameter.  The only sensible initial value is 0,
> which is what the only upstream caller (acpi_get_cache_info()) passes.
> 
> Use a local variable for the starting cache level in acpi_count_levels(),
> and pass the result back to the caller via the function return value.
> 
> Gid rid of the levels parameter, which has no remaining purpose.
> 
> Fix acpi_get_cache_info() to match.
> 
> -->8--

I've taken this instead,


> split_levels is orthogonal to this refactoring (as evinced by the diff).
> I think mentioning it in the commit message at all may just add to the
> confusion...

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
>>   *
>> + * Returns number of levels.
> 
> Nit: the prevailing convention in this file would be
> 
> 	Return: number of levels
> 
> (I don't know whether kerneldoc cares.)
> 
> Maybe also say "total number of levels" in place of "level", to make it
> clearer that the split levels (if any) are included in this count.

Sure,


>> @@ -731,7 +735,7 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
>>  	if (!cpu_node)
>>  		return -ENOENT;
>>  
>> -	acpi_count_levels(table, cpu_node, levels, split_levels);
>> +	*levels = acpi_count_levels(table, cpu_node, split_levels);
>>  
>>  	pr_debug("Cache Setup: last_level=%d split_levels=%d\n",
>>  		 *levels, split_levels ? *split_levels : -1);
> 
> Otherwise, looks reasonable to me.
> 
> (But see my comments on the next patches re whether we really need this.)

It was enough fun to debug that I'd like to save anyone else the trouble!



Thanks,

James

