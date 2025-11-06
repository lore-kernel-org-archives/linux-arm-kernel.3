Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FE5CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkI++qoDm4Uo+Uzaml7VI1OSsCot69Mx7xxPSBWfWwQ=; b=HHxFgNPosKS7L4SFESnELlkCwB
	q2HIXD71/sPRZVhe5ncvV4aeGVd4xt9Cf0iN9c23bUBo5JXxBiv2lY9xwxLfe40Pg+kgOZAoTobSH
	XXbku+OfoJQM+ggkh+NM9SQQxVv8/uSxKeQaXNRQB6MxKS7+dPg6hzEOzIUI0PKjMvXkuKpSI6b7A
	X0kJG5kfnnyeUMaJwdwNQvoHE7Bc6LdIOJL1cPWVM9mnIRHCuc28uLkU3Z8eBU5OtRz4/96kwBS8P
	40ncXM4SSgBbK7rozi2cY1g6hLITNPALNcd+n2azWSnS8zyYVdOdyvLcXemjbIwDsDKQa0jrHhxMy
	w1cPzwsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2ZP-0000000Ft66-1eTO;
	Thu, 06 Nov 2025 16:10:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2ZM-0000000Ft4f-0nf8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:10:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9141215A1;
	Thu,  6 Nov 2025 08:10:31 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C71A93F66E;
	Thu,  6 Nov 2025 08:10:34 -0800 (PST)
Message-ID: <02f008a8-1bd6-4044-99f0-553d441d6d4b@arm.com>
Date: Thu, 6 Nov 2025 16:10:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/29] ACPI / PPTT: Stop acpi_count_levels() expecting
 callers to clear levels
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
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
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-3-james.morse@arm.com>
 <20251024122921.000004bc@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251024122921.000004bc@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081040_357163_A7F47D66 
X-CRM114-Status: GOOD (  13.83  )
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

Hi Jonathan,

On 10/24/25 12:29, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 18:56:18 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> In acpi_count_levels(), the initial value of *levels passed by the
>> caller is really an implementation detail of acpi_count_levels(), so it
>> is unreasonable to expect the callers of this function to know what to
>> pass in for this parameter.  The only sensible initial value is 0,
>> which is what the only upstream caller (acpi_get_cache_info()) passes.
>>
>> Use a local variable for the starting cache level in acpi_count_levels(),
>> and pass the result back to the caller via the function return value.
>>
>> Get rid of the levels parameter, which has no remaining purpose.
>>
>> Fix acpi_get_cache_info() to match.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> 
> Another meh, the name is confusing type comment. 
> 
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
> Given it's not the starting level at this point... Maybe just call it level or current_level.

Makes sense. I've made this update.

>>  }
>>  
>>  /**
>> @@ -645,7 +649,7 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
>>  	if (!cpu_node)
>>  		return -ENOENT;
>>  
>> -	acpi_count_levels(table, cpu_node, levels, split_levels);
>> +	*levels = acpi_count_levels(table, cpu_node, split_levels);
>>  
>>  	pr_debug("Cache Setup: last_level=%d split_levels=%d\n",
>>  		 *levels, split_levels ? *split_levels : -1);
> 
> 

Thanks,

Ben


