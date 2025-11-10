Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF70CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQQCMST+JC1oSFk2/bdnTNm2GNUxFFOc5Yz6v4Dee/o=; b=VgxbsM6nMVXkv4+9AToO3UvOAv
	kYQKZN5Ev2C97tJFYaiFYrZrq2hgSJrotgaRGqKLAM20mn351ECUkd/7P6jR+2ZsBgZX8+3bl3zMP
	RUonHaVmKvAusjpXrvWsuH949ylY4Ype5+hkQrroxW+GmK5gu1MHAqH0plJytkYmsgq/AXfyzu9vj
	EDRt/I4s4VYTjE6xkY/kO0bNP21AZQVqeZVFNldgph6ogXy5NTaIBnJPUavs5leU/TbQ1/MazR3f8
	nm2Jgl/39o3B2jUjl1WML4wcCIguAcggWc+5XhT7iRHPYj3US/GYp0YnRVRhZS9JxXW4IksI+LOKo
	/tustCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVFd-00000005s7b-1bnd;
	Mon, 10 Nov 2025 17:00:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVFZ-00000005s6m-2gDt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:00:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B45482B;
	Mon, 10 Nov 2025 09:00:06 -0800 (PST)
Received: from [192.168.20.93] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 743DC3F66E;
	Mon, 10 Nov 2025 09:00:01 -0800 (PST)
Message-ID: <1a52079f-e12f-430b-b3c5-cb184f73c6c7@arm.com>
Date: Mon, 10 Nov 2025 11:00:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
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
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-4-ben.horgan@arm.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20251107123450.664001-4-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_090017_780187_4172F7B3 
X-CRM114-Status: GOOD (  33.13  )
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

Hi,

On 11/7/25 6:34 AM, Ben Horgan wrote:
> In actbl2.h, struct acpi_pptt_cache describes the fields in the original
> cache type structure. In PPTT table version 3 a new field was added at the
> end, cache_id. This is described in struct acpi_pptt_cache_v1. Introduce
> the new, acpi_pptt_cache_v1_full to contain both these structures. Update
> the existing code to use this new struct. This simplifies the code, removes
> a non-standard use of ACPI_ADD_PTR and allows using the length in the
> header to check if the cache_id is valid.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> New patch
> ---
>   drivers/acpi/pptt.c | 104 ++++++++++++++++++++++++--------------------
>   1 file changed, 58 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 1027ca3566b1..1ed2099c0d1a 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -21,6 +21,11 @@
>   #include <linux/cacheinfo.h>
>   #include <acpi/processor.h>
>   
> +struct acpi_pptt_cache_v1_full {
> +	struct acpi_pptt_cache		f;
> +	struct acpi_pptt_cache_v1	extra;
> +} __packed;

This presumably won't match an acpia change, right? Those structures 
appear to repeat the fields in the newer structure definitions.

Maybe its best to keep this as close to an acpica change and do a quick 
patch posting for acpica to assure they are onboard with the eventual 
structure (IIRC it was fast a few years ago when I had a similar problem).

That would avoid a bunch of the churn here of adding the 'f'/'extra' 
dereferene which would then potentailly have to be reverted at some 
point when acpica corrects the original structure.



> +
>   static struct acpi_subtable_header *fetch_pptt_subtable(struct acpi_table_header *table_hdr,
>   							u32 pptt_ref)
>   {
> @@ -50,10 +55,24 @@ static struct acpi_pptt_processor *fetch_pptt_node(struct acpi_table_header *tab
>   	return (struct acpi_pptt_processor *)fetch_pptt_subtable(table_hdr, pptt_ref);
>   }
>   
> -static struct acpi_pptt_cache *fetch_pptt_cache(struct acpi_table_header *table_hdr,
> -						u32 pptt_ref)
> +static struct acpi_pptt_cache_v1_full *fetch_pptt_cache(struct acpi_table_header *table_hdr,
> +							u32 pptt_ref)
>   {
> -	return (struct acpi_pptt_cache *)fetch_pptt_subtable(table_hdr, pptt_ref);
> +	return (struct acpi_pptt_cache_v1_full *)fetch_pptt_subtable(table_hdr, pptt_ref);
> +}
> +
> +#define ACPI_PPTT_CACHE_V1_LEN sizeof(struct acpi_pptt_cache_v1_full)
> +
> +/*
> + * From PPTT table version 3, a new field cache_id was added at the end of
> + * the cache type structure.  We now use struct acpi_pptt_cache_v1_full,
> + * containing the cache_id, everywhere but must check validity before accessing
> + * the cache_id.
> + */
> +static bool acpi_pptt_cache_id_is_valid(struct acpi_pptt_cache_v1_full *cache)
> +{
> +	return (cache->f.header.length >= ACPI_PPTT_CACHE_V1_LEN &&
> +		cache->f.flags & ACPI_PPTT_CACHE_ID_VALID);
>   }
>   
>   static struct acpi_subtable_header *acpi_get_pptt_resource(struct acpi_table_header *table_hdr,
> @@ -103,30 +122,30 @@ static unsigned int acpi_pptt_walk_cache(struct acpi_table_header *table_hdr,
>   					 unsigned int local_level,
>   					 unsigned int *split_levels,
>   					 struct acpi_subtable_header *res,
> -					 struct acpi_pptt_cache **found,
> +					 struct acpi_pptt_cache_v1_full **found,
>   					 unsigned int level, int type)
>   {
> -	struct acpi_pptt_cache *cache;
> +	struct acpi_pptt_cache_v1_full *cache;
>   
>   	if (res->type != ACPI_PPTT_TYPE_CACHE)
>   		return 0;
>   
> -	cache = (struct acpi_pptt_cache *) res;
> +	cache = (struct acpi_pptt_cache_v1_full *)res;
>   	while (cache) {
>   		local_level++;
>   
> -		if (!(cache->flags & ACPI_PPTT_CACHE_TYPE_VALID)) {
> -			cache = fetch_pptt_cache(table_hdr, cache->next_level_of_cache);
> +		if (!(cache->f.flags & ACPI_PPTT_CACHE_TYPE_VALID)) {
> +			cache = fetch_pptt_cache(table_hdr, cache->f.next_level_of_cache);
>   			continue;
>   		}
>   
>   		if (split_levels &&
> -		    (acpi_pptt_match_type(cache->attributes, ACPI_PPTT_CACHE_TYPE_DATA) ||
> -		     acpi_pptt_match_type(cache->attributes, ACPI_PPTT_CACHE_TYPE_INSTR)))
> +		    (acpi_pptt_match_type(cache->f.attributes, ACPI_PPTT_CACHE_TYPE_DATA) ||
> +		     acpi_pptt_match_type(cache->f.attributes, ACPI_PPTT_CACHE_TYPE_INSTR)))
>   			*split_levels = local_level;
>   
>   		if (local_level == level &&
> -		    acpi_pptt_match_type(cache->attributes, type)) {
> +		    acpi_pptt_match_type(cache->f.attributes, type)) {
>   			if (*found != NULL && cache != *found)
>   				pr_warn("Found duplicate cache level/type unable to determine uniqueness\n");
>   
> @@ -138,12 +157,12 @@ static unsigned int acpi_pptt_walk_cache(struct acpi_table_header *table_hdr,
>   			 * cache node.
>   			 */
>   		}
> -		cache = fetch_pptt_cache(table_hdr, cache->next_level_of_cache);
> +		cache = fetch_pptt_cache(table_hdr, cache->f.next_level_of_cache);
>   	}
>   	return local_level;
>   }
>   
> -static struct acpi_pptt_cache *
> +static struct acpi_pptt_cache_v1_full *
>   acpi_find_cache_level(struct acpi_table_header *table_hdr,
>   		      struct acpi_pptt_processor *cpu_node,
>   		      unsigned int *starting_level, unsigned int *split_levels,
> @@ -152,7 +171,7 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
>   	struct acpi_subtable_header *res;
>   	unsigned int number_of_levels = *starting_level;
>   	int resource = 0;
> -	struct acpi_pptt_cache *ret = NULL;
> +	struct acpi_pptt_cache_v1_full *ret = NULL;
>   	unsigned int local_level;
>   
>   	/* walk down from processor node */
> @@ -324,14 +343,14 @@ static u8 acpi_cache_type(enum cache_type type)
>   	}
>   }
>   
> -static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *table_hdr,
> -						    u32 acpi_cpu_id,
> -						    enum cache_type type,
> -						    unsigned int level,
> -						    struct acpi_pptt_processor **node)
> +static struct acpi_pptt_cache_v1_full *acpi_find_cache_node(struct acpi_table_header *table_hdr,
> +							    u32 acpi_cpu_id,
> +							    enum cache_type type,
> +							    unsigned int level,
> +							    struct acpi_pptt_processor **node)
>   {
>   	unsigned int total_levels = 0;
> -	struct acpi_pptt_cache *found = NULL;
> +	struct acpi_pptt_cache_v1_full *found = NULL;
>   	struct acpi_pptt_processor *cpu_node;
>   	u8 acpi_type = acpi_cache_type(type);
>   
> @@ -355,7 +374,6 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
>    * @this_leaf: Kernel cache info structure being updated
>    * @found_cache: The PPTT node describing this cache instance
>    * @cpu_node: A unique reference to describe this cache instance
> - * @revision: The revision of the PPTT table
>    *
>    * The ACPI spec implies that the fields in the cache structures are used to
>    * extend and correct the information probed from the hardware. Lets only
> @@ -364,23 +382,20 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
>    * Return: nothing. Side effect of updating the global cacheinfo
>    */
>   static void update_cache_properties(struct cacheinfo *this_leaf,
> -				    struct acpi_pptt_cache *found_cache,
> -				    struct acpi_pptt_processor *cpu_node,
> -				    u8 revision)
> +				    struct acpi_pptt_cache_v1_full *found_cache,
> +				    struct acpi_pptt_processor *cpu_node)
>   {
> -	struct acpi_pptt_cache_v1* found_cache_v1;
> -
>   	this_leaf->fw_token = cpu_node;
> -	if (found_cache->flags & ACPI_PPTT_SIZE_PROPERTY_VALID)
> -		this_leaf->size = found_cache->size;
> -	if (found_cache->flags & ACPI_PPTT_LINE_SIZE_VALID)
> -		this_leaf->coherency_line_size = found_cache->line_size;
> -	if (found_cache->flags & ACPI_PPTT_NUMBER_OF_SETS_VALID)
> -		this_leaf->number_of_sets = found_cache->number_of_sets;
> -	if (found_cache->flags & ACPI_PPTT_ASSOCIATIVITY_VALID)
> -		this_leaf->ways_of_associativity = found_cache->associativity;
> -	if (found_cache->flags & ACPI_PPTT_WRITE_POLICY_VALID) {
> -		switch (found_cache->attributes & ACPI_PPTT_MASK_WRITE_POLICY) {
> +	if (found_cache->f.flags & ACPI_PPTT_SIZE_PROPERTY_VALID)
> +		this_leaf->size = found_cache->f.size;
> +	if (found_cache->f.flags & ACPI_PPTT_LINE_SIZE_VALID)
> +		this_leaf->coherency_line_size = found_cache->f.line_size;
> +	if (found_cache->f.flags & ACPI_PPTT_NUMBER_OF_SETS_VALID)
> +		this_leaf->number_of_sets = found_cache->f.number_of_sets;
> +	if (found_cache->f.flags & ACPI_PPTT_ASSOCIATIVITY_VALID)
> +		this_leaf->ways_of_associativity = found_cache->f.associativity;
> +	if (found_cache->f.flags & ACPI_PPTT_WRITE_POLICY_VALID) {
> +		switch (found_cache->f.attributes & ACPI_PPTT_MASK_WRITE_POLICY) {
>   		case ACPI_PPTT_CACHE_POLICY_WT:
>   			this_leaf->attributes = CACHE_WRITE_THROUGH;
>   			break;
> @@ -389,8 +404,8 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>   			break;
>   		}
>   	}
> -	if (found_cache->flags & ACPI_PPTT_ALLOCATION_TYPE_VALID) {
> -		switch (found_cache->attributes & ACPI_PPTT_MASK_ALLOCATION_TYPE) {
> +	if (found_cache->f.flags & ACPI_PPTT_ALLOCATION_TYPE_VALID) {
> +		switch (found_cache->f.attributes & ACPI_PPTT_MASK_ALLOCATION_TYPE) {
>   		case ACPI_PPTT_CACHE_READ_ALLOCATE:
>   			this_leaf->attributes |= CACHE_READ_ALLOCATE;
>   			break;
> @@ -415,13 +430,11 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>   	 * specified in PPTT.
>   	 */
>   	if (this_leaf->type == CACHE_TYPE_NOCACHE &&
> -	    found_cache->flags & ACPI_PPTT_CACHE_TYPE_VALID)
> +	    found_cache->f.flags & ACPI_PPTT_CACHE_TYPE_VALID)
>   		this_leaf->type = CACHE_TYPE_UNIFIED;
>   
> -	if (revision >= 3 && (found_cache->flags & ACPI_PPTT_CACHE_ID_VALID)) {
> -		found_cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
> -	                                      found_cache, sizeof(struct acpi_pptt_cache));
> -		this_leaf->id = found_cache_v1->cache_id;
> +	if (acpi_pptt_cache_id_is_valid(found_cache)) {
> +		this_leaf->id = found_cache->extra.cache_id;
>   		this_leaf->attributes |= CACHE_ID;
>   	}
>   }
> @@ -429,7 +442,7 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>   static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>   				 unsigned int cpu)
>   {
> -	struct acpi_pptt_cache *found_cache;
> +	struct acpi_pptt_cache_v1_full *found_cache;
>   	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>   	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>   	struct cacheinfo *this_leaf;
> @@ -445,8 +458,7 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>   		pr_debug("found = %p %p\n", found_cache, cpu_node);
>   		if (found_cache)
>   			update_cache_properties(this_leaf, found_cache,
> -						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)),
> -						table->revision);
> +						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)));
>   
>   		index++;
>   	}


