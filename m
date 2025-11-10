Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC27CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoK7+Jyq8UJFa8syMq/4Q5762JAp1WlfKFyew0Nzmbk=; b=pJpVj5AAlkphbwLSaIGahlGyTq
	rJGFrfWTuUY9gpybdP9cbnvVvssqKnjRUeZWgKhG/mcfpxabFvvPaOl6ZPZL+dn/56m2DMDqaJHwp
	DZuiax4nvWYb7BNbizeOScQi8SCp7kIQCXf8aKbMb7loVtUXuZm16f90regpSVZESUQxZsXmdFQLk
	OSmJ/bnTq3CabZbokgZcYYOS6+TFSjuC4XzAkK6VVeXTLaSuw5ZFPkYLudvb+FoMBjTDLuYJlPtb1
	//K0ENLsX9DJJwEqqHCyPq3dfvYTxOrSOr84MDNogLCJ7fQc5Sm0LT6SGTIpTass0A76cpTQZ514g
	YPyAel0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUBc-00000005jdm-1wEP;
	Mon, 10 Nov 2025 15:52:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUBY-00000005jc5-2xyT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:52:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65B902F;
	Mon, 10 Nov 2025 07:51:55 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 812F73F66E;
	Mon, 10 Nov 2025 07:51:58 -0800 (PST)
Message-ID: <374f53a9-6ff5-4c37-bd41-9e746eaec1da@arm.com>
Date: Mon, 10 Nov 2025 15:51:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
To: Gavin Shan <gshan@redhat.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-4-ben.horgan@arm.com>
 <04f4c2f6-19ff-413f-96fb-86432d53830e@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <04f4c2f6-19ff-413f-96fb-86432d53830e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_075204_859397_BF8AFC22 
X-CRM114-Status: GOOD (  21.32  )
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

Hi Gavin,

On 11/8/25 04:54, Gavin Shan wrote:
> Hi Ben,
> 
> On 11/7/25 10:34 PM, Ben Horgan wrote:
>> In actbl2.h, struct acpi_pptt_cache describes the fields in the original
>> cache type structure. In PPTT table version 3 a new field was added at
>> the
>> end, cache_id. This is described in struct acpi_pptt_cache_v1. Introduce
>> the new, acpi_pptt_cache_v1_full to contain both these structures. Update
>> the existing code to use this new struct. This simplifies the code,
>> removes
>> a non-standard use of ACPI_ADD_PTR and allows using the length in the
>> header to check if the cache_id is valid.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since v3:
>> New patch
>> ---
>>   drivers/acpi/pptt.c | 104 ++++++++++++++++++++++++--------------------
>>   1 file changed, 58 insertions(+), 46 deletions(-)
>>
> 
> Two nitpicks below. LGTM in either way.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 1027ca3566b1..1ed2099c0d1a 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -21,6 +21,11 @@
>>   #include <linux/cacheinfo.h>
>>   #include <acpi/processor.h>
>>   +struct acpi_pptt_cache_v1_full {
>> +    struct acpi_pptt_cache        f;
>> +    struct acpi_pptt_cache_v1    extra;
>> +} __packed;
>> +
>>   static struct acpi_subtable_header *fetch_pptt_subtable(struct
>> acpi_table_header *table_hdr,
>>                               u32 pptt_ref)
>>   {
>> @@ -50,10 +55,24 @@ static struct acpi_pptt_processor
>> *fetch_pptt_node(struct acpi_table_header *tab
>>       return (struct acpi_pptt_processor
>> *)fetch_pptt_subtable(table_hdr, pptt_ref);
>>   }
>>   -static struct acpi_pptt_cache *fetch_pptt_cache(struct
>> acpi_table_header *table_hdr,
>> -                        u32 pptt_ref)
>> +static struct acpi_pptt_cache_v1_full *fetch_pptt_cache(struct
>> acpi_table_header *table_hdr,
>> +                            u32 pptt_ref)
>>   {
>> -    return (struct acpi_pptt_cache *)fetch_pptt_subtable(table_hdr,
>> pptt_ref);
>> +    return (struct acpi_pptt_cache_v1_full
>> *)fetch_pptt_subtable(table_hdr, pptt_ref);
>> +}
>> +
>> +#define ACPI_PPTT_CACHE_V1_LEN sizeof(struct acpi_pptt_cache_v1_full)
>> +
>> +/*
>> + * From PPTT table version 3, a new field cache_id was added at the
>> end of
>> + * the cache type structure.  We now use struct acpi_pptt_cache_v1_full,
>> + * containing the cache_id, everywhere but must check validity before
>> accessing
>> + * the cache_id.
>> + */
>> +static bool acpi_pptt_cache_id_is_valid(struct
>> acpi_pptt_cache_v1_full *cache)
>> +{
>> +    return (cache->f.header.length >= ACPI_PPTT_CACHE_V1_LEN &&
>> +        cache->f.flags & ACPI_PPTT_CACHE_ID_VALID);
>>   }
>>   
> 
> This function is nice fit to 'inline'. Besides, I'm not sure if we can just
> use sizeof(*cache) instead of ACPI_PPTT_CACHE_V1_LEN, which is used for
> once
> in pptt.c

Yes, the define is unnecessary and the function can be inlined. Thanks
for pointing it out. I'm likely to rework this patch though.

Thanks,

Ben


