Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F7FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z80pbkP/TYorjbm1oWzO0yeXlK/iKwPApxaIQQlIuuE=; b=dWjMk8dFCkQHIWALE5z1eLQSWM
	G+3nB0pjheK76KGjinNKxBntyFPPbB75t9CsxWssfGYdTFWqce1TojF3DqK+LVeVC/W5SwjskD3pQ
	imiDs+AH5c0QQ361i+SLJ7pN69eUIvHYDgTtXsFsHJ5QfEnhxqSNM04YKT4k1dt6nzzyYUboIETDT
	B8GW4oi9NdmamdqEPaWc+5MG9kH+rKZrAJhtLjou30wyk3Vol6139jiuOcEKJ4VlCkdoL2cZx20Pz
	H6kW4NS2lJ3cLsRpvrj3WGn3m8Flr2jXA9vd/7d9P6CT2Z/cF2gRm5nMuAgJYkCUtZpbO0T6F9uqw
	BsHaQpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUkc-00000005nBM-2zsu;
	Mon, 10 Nov 2025 16:28:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUka-00000005nAu-3dx1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:28:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AEA82B;
	Mon, 10 Nov 2025 08:28:08 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C5463F66E;
	Mon, 10 Nov 2025 08:28:11 -0800 (PST)
Message-ID: <17caf75c-a00f-41d8-bacc-af5ba6c485d9@arm.com>
Date: Mon, 10 Nov 2025 16:28:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-4-ben.horgan@arm.com>
 <20251110154610.00002247@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251110154610.00002247@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_082817_000791_BAEEF855 
X-CRM114-Status: GOOD (  30.91  )
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

On 11/10/25 15:46, Jonathan Cameron wrote:
> On Fri, 7 Nov 2025 12:34:20 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> In actbl2.h, struct acpi_pptt_cache describes the fields in the original
>> cache type structure. In PPTT table version 3 a new field was added at the
>> end, cache_id. This is described in struct acpi_pptt_cache_v1. Introduce
>> the new, acpi_pptt_cache_v1_full to contain both these structures. Update
>> the existing code to use this new struct. This simplifies the code, removes
>> a non-standard use of ACPI_ADD_PTR and allows using the length in the
>> header to check if the cache_id is valid.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> Whilst I wish the ACPICA stuff did structures like this, I'm not sure
> if the ACPI maintainers will feel it is appropriate to work around it
> with generic sounding structures like this one.
> 
> I'd also say that we should only cast it to your _full structure
> if we know we have rev 3 of PPTT.  Otherwise we should continue manipulating
> it as a struct acpi_pptt_cache

Fair enough. My thinking was that you had to check the valid flag anyway
to use cache_id but it's less robust. I'll delay the casting to later
which IIUC is what Jeremy Linton suggested offline.

> 
>> ---
>> Changes since v3:
>> New patch
>> ---
>>  drivers/acpi/pptt.c | 104 ++++++++++++++++++++++++--------------------
>>  1 file changed, 58 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 1027ca3566b1..1ed2099c0d1a 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -21,6 +21,11 @@
>>  #include <linux/cacheinfo.h>
>>  #include <acpi/processor.h>
>>  
>> +struct acpi_pptt_cache_v1_full {
>> +	struct acpi_pptt_cache		f;
>> +	struct acpi_pptt_cache_v1	extra;
>> +} __packed;
> 
>> +#define ACPI_PPTT_CACHE_V1_LEN sizeof(struct acpi_pptt_cache_v1_full)
>> +
>> +/*
>> + * From PPTT table version 3, a new field cache_id was added at the end of
>> + * the cache type structure.  We now use struct acpi_pptt_cache_v1_full,
>> + * containing the cache_id, everywhere but must check validity before accessing
>> + * the cache_id.
>> + */
>> +static bool acpi_pptt_cache_id_is_valid(struct acpi_pptt_cache_v1_full *cache)
>> +{
>> +	return (cache->f.header.length >= ACPI_PPTT_CACHE_V1_LEN &&
> 
> Although I later say I don't think you should pass a v1_full structure in here (as
> we don't know it is at least that large until after this check) if you do keep this
> why not use sizeof(*cache) and get rid of the V1_LEN definition as providing no obvious
> value here?

Yes, the define was never needed.

> 
>> +		cache->f.flags & ACPI_PPTT_CACHE_ID_VALID);
>>  }
> 
>> @@ -355,7 +374,6 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
>>   * @this_leaf: Kernel cache info structure being updated
>>   * @found_cache: The PPTT node describing this cache instance
>>   * @cpu_node: A unique reference to describe this cache instance
>> - * @revision: The revision of the PPTT table
>>   *
>>   * The ACPI spec implies that the fields in the cache structures are used to
>>   * extend and correct the information probed from the hardware. Lets only
>> @@ -364,23 +382,20 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
>>   * Return: nothing. Side effect of updating the global cacheinfo
>>   */
>>  static void update_cache_properties(struct cacheinfo *this_leaf,
>> -				    struct acpi_pptt_cache *found_cache,
>> -				    struct acpi_pptt_processor *cpu_node,
>> -				    u8 revision)
>> +				    struct acpi_pptt_cache_v1_full *found_cache,
>> +				    struct acpi_pptt_processor *cpu_node)
>>  {
>> -	struct acpi_pptt_cache_v1* found_cache_v1;
>> -
>>  	this_leaf->fw_token = cpu_node;
>> -	if (found_cache->flags & ACPI_PPTT_SIZE_PROPERTY_VALID)
>> -		this_leaf->size = found_cache->size;
>> -	if (found_cache->flags & ACPI_PPTT_LINE_SIZE_VALID)
>> -		this_leaf->coherency_line_size = found_cache->line_size;
>> -	if (found_cache->flags & ACPI_PPTT_NUMBER_OF_SETS_VALID)
>> -		this_leaf->number_of_sets = found_cache->number_of_sets;
>> -	if (found_cache->flags & ACPI_PPTT_ASSOCIATIVITY_VALID)
>> -		this_leaf->ways_of_associativity = found_cache->associativity;
>> -	if (found_cache->flags & ACPI_PPTT_WRITE_POLICY_VALID) {
>> -		switch (found_cache->attributes & ACPI_PPTT_MASK_WRITE_POLICY) {
>> +	if (found_cache->f.flags & ACPI_PPTT_SIZE_PROPERTY_VALID)
>> +		this_leaf->size = found_cache->f.size;
>> +	if (found_cache->f.flags & ACPI_PPTT_LINE_SIZE_VALID)
>> +		this_leaf->coherency_line_size = found_cache->f.line_size;
>> +	if (found_cache->f.flags & ACPI_PPTT_NUMBER_OF_SETS_VALID)
>> +		this_leaf->number_of_sets = found_cache->f.number_of_sets;
>> +	if (found_cache->f.flags & ACPI_PPTT_ASSOCIATIVITY_VALID)
>> +		this_leaf->ways_of_associativity = found_cache->f.associativity;
>> +	if (found_cache->f.flags & ACPI_PPTT_WRITE_POLICY_VALID) {
>> +		switch (found_cache->f.attributes & ACPI_PPTT_MASK_WRITE_POLICY) {
>>  		case ACPI_PPTT_CACHE_POLICY_WT:
>>  			this_leaf->attributes = CACHE_WRITE_THROUGH;
>>  			break;
>> @@ -389,8 +404,8 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>>  			break;
>>  		}
>>  	}
>> -	if (found_cache->flags & ACPI_PPTT_ALLOCATION_TYPE_VALID) {
>> -		switch (found_cache->attributes & ACPI_PPTT_MASK_ALLOCATION_TYPE) {
>> +	if (found_cache->f.flags & ACPI_PPTT_ALLOCATION_TYPE_VALID) {
>> +		switch (found_cache->f.attributes & ACPI_PPTT_MASK_ALLOCATION_TYPE) {
>>  		case ACPI_PPTT_CACHE_READ_ALLOCATE:
>>  			this_leaf->attributes |= CACHE_READ_ALLOCATE;
>>  			break;
>> @@ -415,13 +430,11 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>>  	 * specified in PPTT.
>>  	 */
>>  	if (this_leaf->type == CACHE_TYPE_NOCACHE &&
>> -	    found_cache->flags & ACPI_PPTT_CACHE_TYPE_VALID)
>> +	    found_cache->f.flags & ACPI_PPTT_CACHE_TYPE_VALID)
>>  		this_leaf->type = CACHE_TYPE_UNIFIED;
>>  
>> -	if (revision >= 3 && (found_cache->flags & ACPI_PPTT_CACHE_ID_VALID)) {
>> -		found_cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
>> -	                                      found_cache, sizeof(struct acpi_pptt_cache));
>> -		this_leaf->id = found_cache_v1->cache_id;
>> +	if (acpi_pptt_cache_id_is_valid(found_cache)) {
> 
> Only here do we know that found_cache is the _full type. 
> 
>> +		this_leaf->id = found_cache->extra.cache_id;
>>  		this_leaf->attributes |= CACHE_ID;
>>  	}
>>  }
>> @@ -429,7 +442,7 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>>  static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>>  				 unsigned int cpu)
>>  {
>> -	struct acpi_pptt_cache *found_cache;
>> +	struct acpi_pptt_cache_v1_full *found_cache;
> 
> This isn't necessarily valid. Until deep in update_cache_properties() we don't care about the ID
> so this structure may be smaller than this implies.
> 
>>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>>  	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>>  	struct cacheinfo *this_leaf;
>> @@ -445,8 +458,7 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>>  		pr_debug("found = %p %p\n", found_cache, cpu_node);
>>  		if (found_cache)
>>  			update_cache_properties(this_leaf, found_cache,
>> -						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)),
>> -						table->revision);
>> +						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)));
>>  
>>  		index++;
>>  	}
> 

Thanks,

Ben


