Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEA9CF3957
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEhjBrT+ADrzpBFb933nx3faTkrUzuI5iWvY39E5/Do=; b=X5a+TskemIdnYSFV0dBemWQsc+
	9/sl5ibnbRGHHIvF2qRQ+sfkk8u6IZfReo0sJU188MF8HNqs6OHxiaE1SPlA6Jk2yR7rkXpTsGFDq
	ytsiRzGR1nbpA0SP/mOfvX+l5qGSMpO7zEVLDaRLEmUU6/MQNglXz5TJ8xVgGpwEeMp2KHTqgzLA3
	1Xd3ruB/+kWP9Oc7T/d1oCmw9Lypn/WPWPxGq9IU7gKjW5HCZK51Vj8QJAvsGA1TMV/9ujzc3nuOF
	2rabthea8WpcsaUTxPAefUNOwwyFkMhRtGcb83dNsrgutj1BDavxXphfdb5MVWXPJeKneTuhX2fnl
	sfQooPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl3H-00000003hkH-0QnS;
	Wed, 19 Nov 2025 16:29:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl3E-00000003hjj-2NFP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:29:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D597AFEC;
	Wed, 19 Nov 2025 08:28:51 -0800 (PST)
Received: from [172.27.42.169] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A9473F740;
	Wed, 19 Nov 2025 08:28:57 -0800 (PST)
Message-ID: <5926591f-81aa-4953-9d80-bc85d3ce754f@arm.com>
Date: Wed, 19 Nov 2025 10:28:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/34] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-4-ben.horgan@arm.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20251117170014.4113754-4-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_082900_712690_B19D1DCB 
X-CRM114-Status: GOOD (  29.83  )
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

On 11/17/25 10:59 AM, Ben Horgan wrote:
> In actbl2.h, acpi_pptt_cache describes the fields in the original
> Cache Type Structure. In PPTT table version 3 a new field was added at the
> end, cache_id. This is described in acpi_pptt_cache_v1 but rather than
> including all v1 fields it just includes this one.
> 
> In lieu of this being fixed in acpica, introduce acpi_pptt_cache_v1_full to
> contain all the fields of the Cache Type Structure . Update the existing
> code to use this new struct. This simplifies the code and removes a
> non-standard use of ACPI_ADD_PTR.

To me, reading the code its a lot clearer that there is a version 
difference in the subtable this way.

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>

> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> I have opened a pull request to acpica to update acpi_pptt_cache_v1 to
> include all fields. https://github.com/acpica/acpica/pull/1059
> 
> Change since v4:
> Use fields directly in acpi_pptt_cache_v1_full
> Delay the casting
> 
> Changes since v3:
> New patch
> ---
>   drivers/acpi/pptt.c | 47 +++++++++++++++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 2856254e29d7..53fde9bd8140 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -21,6 +21,25 @@
>   #include <linux/cacheinfo.h>
>   #include <acpi/processor.h>
>   
> +/*
> + * The acpi_pptt_cache_v1 in actbl2.h, which is imported from acpica,
> + * only contains the cache_id field rather than all the fields of the
> + * Cache Type Structure. Use this alternative structure until it is
> + * resolved in acpica.
> + */
> +struct acpi_pptt_cache_v1_full {
> +	struct acpi_subtable_header header;
> +	u16 reserved;
> +	u32 flags;
> +	u32 next_level_of_cache;
> +	u32 size;
> +	u32 number_of_sets;
> +	u8 associativity;
> +	u8 attributes;
> +	u16 line_size;
> +	u32 cache_id;
> +};
> +
>   static struct acpi_subtable_header *fetch_pptt_subtable(struct acpi_table_header *table_hdr,
>   							u32 pptt_ref)
>   {
> @@ -56,6 +75,18 @@ static struct acpi_pptt_cache *fetch_pptt_cache(struct acpi_table_header *table_
>   	return (struct acpi_pptt_cache *)fetch_pptt_subtable(table_hdr, pptt_ref);
>   }
>   
> +static struct acpi_pptt_cache_v1_full *upgrade_pptt_cache(struct acpi_pptt_cache *cache)
> +{
> +	if (cache->header.length < sizeof(struct acpi_pptt_cache_v1_full))
> +		return NULL;
> +
> +	/* No use for v1 if the only additional field is invalid */
> +	if (!(cache->flags & ACPI_PPTT_CACHE_ID_VALID))
> +		return NULL;
> +
> +	return (struct acpi_pptt_cache_v1_full *)cache;
> +}
> +
>   static struct acpi_subtable_header *acpi_get_pptt_resource(struct acpi_table_header *table_hdr,
>   							   struct acpi_pptt_processor *node,
>   							   int resource)
> @@ -111,7 +142,7 @@ static unsigned int acpi_pptt_walk_cache(struct acpi_table_header *table_hdr,
>   	if (res->type != ACPI_PPTT_TYPE_CACHE)
>   		return 0;
>   
> -	cache = (struct acpi_pptt_cache *) res;
> +	cache = (struct acpi_pptt_cache *)res;
>   	while (cache) {
>   		local_level++;
>   
> @@ -355,7 +386,6 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
>    * @this_leaf: Kernel cache info structure being updated
>    * @found_cache: The PPTT node describing this cache instance
>    * @cpu_node: A unique reference to describe this cache instance
> - * @revision: The revision of the PPTT table
>    *
>    * The ACPI spec implies that the fields in the cache structures are used to
>    * extend and correct the information probed from the hardware. Lets only
> @@ -365,10 +395,9 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
>    */
>   static void update_cache_properties(struct cacheinfo *this_leaf,
>   				    struct acpi_pptt_cache *found_cache,
> -				    struct acpi_pptt_processor *cpu_node,
> -				    u8 revision)
> +				    struct acpi_pptt_processor *cpu_node)
>   {
> -	struct acpi_pptt_cache_v1* found_cache_v1;
> +	struct acpi_pptt_cache_v1_full *found_cache_v1;
>   
>   	this_leaf->fw_token = cpu_node;
>   	if (found_cache->flags & ACPI_PPTT_SIZE_PROPERTY_VALID)
> @@ -418,9 +447,8 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>   	    found_cache->flags & ACPI_PPTT_CACHE_TYPE_VALID)
>   		this_leaf->type = CACHE_TYPE_UNIFIED;
>   
> -	if (revision >= 3 && (found_cache->flags & ACPI_PPTT_CACHE_ID_VALID)) {
> -		found_cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
> -	                                      found_cache, sizeof(struct acpi_pptt_cache));
> +	found_cache_v1 =  upgrade_pptt_cache(found_cache);
> +	if (found_cache_v1) {
>   		this_leaf->id = found_cache_v1->cache_id;
>   		this_leaf->attributes |= CACHE_ID;
>   	}
> @@ -445,8 +473,7 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>   		pr_debug("found = %p %p\n", found_cache, cpu_node);
>   		if (found_cache)
>   			update_cache_properties(this_leaf, found_cache,
> -						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)),
> -						table->revision);
> +						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)));
>   
>   		index++;
>   	}


