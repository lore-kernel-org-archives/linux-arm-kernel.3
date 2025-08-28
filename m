Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0961CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVL/RSonWP2g13e+N7PWd4mt1QF5/+IyKi5L9X75woc=; b=tfh/0W7k7c+vOWuug6uwNBvu/m
	3HgiWEg5KC1EXs4HEUnzdTivl7vizQ+NTIW+aVteAly7FPtA8rUWu301HAZAfPeVhudn7oeVEa61s
	S6qqzjsRxz7oQCaDQ9q44JyYNEDbdlGDuPZIssfZjRUfTFC53vN/wWzyZmXuZJel9OdzAIdHWnfZL
	WVTLhjGdzXIbNYDGlB4TGr02kVo+anfxYrIlJ0p8ZYBQXTJCQD9j6SntQcf04tuEO2JWBDVYsOQTS
	/gsesIW0iGYx+PVymk/r8m/Y4hqSygqRCVYEDfQdXKstcN2qOARg5ixndFPv9hngXBbNQcfa3gEMp
	CE1ikCww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhVQ-00000002nzT-1ZPK;
	Thu, 28 Aug 2025 18:37:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf0l-00000002AFf-3JMD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:58:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E7AA1A32;
	Thu, 28 Aug 2025 08:57:54 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C883F694;
	Thu, 28 Aug 2025 08:57:55 -0700 (PDT)
Message-ID: <c87745ab-988e-4d3f-963c-9543e9c73d27@arm.com>
Date: Thu, 28 Aug 2025 16:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] ACPI / PPTT: Find cache level by cache-id
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-6-james.morse@arm.com>
 <9ce36190-6d99-4a41-a803-a65be677db2d@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <9ce36190-6d99-4a41-a803-a65be677db2d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085803_912290_13BE640E 
X-CRM114-Status: GOOD (  15.02  )
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

Hi Ben,

On 27/08/2025 10:25, Ben Horgan wrote:
> On 8/22/25 16:29, James Morse wrote:
>> The MPAM table identifies caches by id. The MPAM driver also wants to know
>> the cache level to determine if the platform is of the shape that can be
>> managed via resctrl. Cacheinfo has this information, but only for CPUs that
>> are online.
>>
>> Waiting for all CPUs to come online is a problem for platforms where
>> CPUs are brought online late by user-space.
>>
>> Add a helper that walks every possible cache, until it finds the one
>> identified by cache-id, then return the level.
>> Add a cleanup based free-ing mechanism for acpi_get_table().

>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>> index f97a9ff678cc..30c10b1dcdb2 100644
>> --- a/include/linux/acpi.h
>> +++ b/include/linux/acpi.h
>> @@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
>>  void acpi_table_init_complete (void);
>>  int acpi_table_init (void);
>>  
>> +static inline struct acpi_table_header *acpi_get_table_ret(char *signature, u32 instance)
>> +{
>> +	struct acpi_table_header *table;
>> +	int status = acpi_get_table(signature, instance, &table);
>> +
>> +	if (ACPI_FAILURE(status))
>> +		return ERR_PTR(-ENOENT);
>> +	return table;
>> +}
>> +DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR(_T)) acpi_put_table(_T))

> nit: Is it useful to change the condition from !IS_ERR(_T) to
> !IS_ERR_OR_NULL(_T)? This seems to be the common pattern. I do note that
> acpi_put_table() can take NULL, so there is no real danger.

If it's the common pattern, sure.

But this code got dropped as Dave pointed out the PPTT doesn't care about the reference
counting anyway, its acpi_get_pptt() helper just uses the same reference for everything.

This might come back for the MPAM driver..


>> +
>>  int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
>>  int __init_or_acpilib acpi_table_parse_entries(char *id,
>>  		unsigned long table_size, int entry_id,


Thanks,

James

