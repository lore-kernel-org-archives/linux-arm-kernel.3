Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46A4CED26E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdLN0WxVG2U6Ku6P+u6PaIJ4CvdT1tYDmLGRzf50dJg=; b=QoWpZl9oVS4WDuxZPG+UcjwBdm
	on5K5zM/hVT3zSpqaU6F7dsaZ9XHPeF5WlpbpZIgrh4Rq33W/0fDNGh3Kpxyz4i4m6e0NlmI+whHH
	RcMSz6CA8YgLVBQ9sVc+A+4QRg0RNjHCm/5JLQrHFOrNGX8HKu/ZxW/8pv4vXODaUAUravecLDU3b
	I1nmdmZnJuDpsL3LhSNif0nQx1opZlbwBWKAqpx2u4Cr55KjPbpCAdUg38n1qoDCe1lk4+mbXpq8O
	D8PL9iQqEbWs0Xi6J8Pt9irjlyss4jxtrGvlsYYW9B6fhLsUpNy32bzC8Zdksa+Ru2K6YligBHpqS
	DK4yCVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJOr-00000000I09-0Vo8;
	Tue, 18 Nov 2025 10:57:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJOp-00000000Hzk-0q8D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:57:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35F4FFEC;
	Tue, 18 Nov 2025 02:57:18 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32FCF3F66E;
	Tue, 18 Nov 2025 02:57:21 -0800 (PST)
Message-ID: <d31067ac-7400-4a0c-b1ed-5f1cc5ae9e1e@arm.com>
Date: Tue, 18 Nov 2025 10:57:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/34] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
To: Fenghua Yu <fenghuay@nvidia.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-4-ben.horgan@arm.com>
 <88795f32-bfb7-4bec-b1fb-752b3e72ffbb@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <88795f32-bfb7-4bec-b1fb-752b3e72ffbb@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_025727_378716_C316C059 
X-CRM114-Status: GOOD (  22.92  )
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

Hi Fenghua,

On 11/18/25 04:03, Fenghua Yu wrote:
> Hi, Ben,
> 
> On 11/17/25 08:59, Ben Horgan wrote:
>> In actbl2.h, acpi_pptt_cache describes the fields in the original
>> Cache Type Structure. In PPTT table version 3 a new field was added at
>> the
>> end, cache_id. This is described in acpi_pptt_cache_v1 but rather than
>> including all v1 fields it just includes this one.
>>
>> In lieu of this being fixed in acpica, introduce
>> acpi_pptt_cache_v1_full to
>> contain all the fields of the Cache Type Structure . Update the existing
>> code to use this new struct. This simplifies the code and removes a
>> non-standard use of ACPI_ADD_PTR.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> I have opened a pull request to acpica to update acpi_pptt_cache_v1 to
>> include all fields. https://github.com/acpica/acpica/pull/1059
>>
>> Change since v4:
>> Use fields directly in acpi_pptt_cache_v1_full
>> Delay the casting
>>
>> Changes since v3:
>> New patch
>> ---
>>   drivers/acpi/pptt.c | 47 +++++++++++++++++++++++++++++++++++----------
>>   1 file changed, 37 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 2856254e29d7..53fde9bd8140 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -21,6 +21,25 @@
>>   #include <linux/cacheinfo.h>
>>   #include <acpi/processor.h>
>>   +/*
>> + * The acpi_pptt_cache_v1 in actbl2.h, which is imported from acpica,
>> + * only contains the cache_id field rather than all the fields of the
>> + * Cache Type Structure. Use this alternative structure until it is
>> + * resolved in acpica.
>> + */
>> +struct acpi_pptt_cache_v1_full {
>> +    struct acpi_subtable_header header;
>> +    u16 reserved;
>> +    u32 flags;
>> +    u32 next_level_of_cache;
>> +    u32 size;
>> +    u32 number_of_sets;
>> +    u8 associativity;
>> +    u8 attributes;
>> +    u16 line_size;
>> +    u32 cache_id;
>> +};
> 
> Should "__packed" be added to this table?

Yes, I missed that.

> 
> Should this table be defined in include/acpi/actbl2.h? Seems defining
> the two cache tables separately in two places are not natural?

Indeed. The dificulty is that include/acpi/actbl2.h is generated from
acpica. I propose a fix for this in the  pull request mentioned above:
https://github.com/acpica/acpica/pull/1059 This extends
acpi_pptt_cache_v1 to include all the fields in the new version of the
cache type structure (not just cache_id).

One thing I could do if it looks like the acpica change will be accepted
is to temporarily delete acpi_pptt_cache_v1 from include/acpi/actbl2.h
and rename acpi_pptt_cache_v1_full in drivers/acpi/pptt.c to
acpi_pptt_cache_v1. When include/acpi/actbl2.h is updated the conflict
should be evident and the version in drivers/acpi/pptt.c can be dropped.
 I'll keep it like it is for now though as this would be an api breaking
change for acpica and the maintainers may prefer to handle this a
different way.

> 
> Thanks.
> 
> -Fenghua

Thanks,

Ben


