Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BCACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZfPFalJwrVX1q1/mnMxDVIiG9XTqxEgcvGDiWKnJZM=; b=tf0buP/CvtP23GtovmxeiTXdY5
	ljGQhr2amvu/+9N7u4KzBZIARqxOw30WKMIjpj1EYXyjvXLHomHwtxBHe0aBkfLE++HfmiM6UuFLB
	AyHGfMJ4GVqe9J3kCdzyenkCVlQO+vy/ML2lrtvLNB6TM2pzXWhxqU3QppVYP1tOnTkznN8JO2URq
	HVBra1tlVtWyB92ZVKnctE1X+hSAN9tTFksTp0z8pVrqoG3iHrqZXPZ84iOpSTbYLQsrhMsALW/NZ
	OmOMsF67HiSHq4m8fWNAnECencGcitdPeEg1DJTFGutcCygJqa+bX6rITqldWyxlqVKUD0CphnRCP
	1/G5JOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIU6B-00000005izC-0OK7;
	Mon, 10 Nov 2025 15:46:31 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIU67-00000005iwa-3B6D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:46:29 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d4vC96lp4zHnGck;
	Mon, 10 Nov 2025 23:45:57 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 5082514038F;
	Mon, 10 Nov 2025 23:46:13 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 10 Nov
 2025 15:46:11 +0000
Date: Mon, 10 Nov 2025 15:46:10 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <amitsinght@marvell.com>,
	<baisheng.gao@unisoc.com>, <baolin.wang@linux.alibaba.com>,
	<bobo.shaobowang@huawei.com>, <carl@os.amperecomputing.com>,
	<catalin.marinas@arm.com>, <dakr@kernel.org>, <dave.martin@arm.com>,
	<david@redhat.com>, <dfustini@baylibre.com>, <fenghuay@nvidia.com>,
	<gregkh@linuxfoundation.org>, <gshan@redhat.com>, <guohanjun@huawei.com>,
	<jeremy.linton@arm.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>
Subject: Re: [PATCH 03/33] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
Message-ID: <20251110154610.00002247@huawei.com>
In-Reply-To: <20251107123450.664001-4-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
	<20251107123450.664001-4-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_074628_089658_229E0608 
X-CRM114-Status: GOOD (  30.94  )
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

On Fri, 7 Nov 2025 12:34:20 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> In actbl2.h, struct acpi_pptt_cache describes the fields in the original
> cache type structure. In PPTT table version 3 a new field was added at the
> end, cache_id. This is described in struct acpi_pptt_cache_v1. Introduce
> the new, acpi_pptt_cache_v1_full to contain both these structures. Update
> the existing code to use this new struct. This simplifies the code, removes
> a non-standard use of ACPI_ADD_PTR and allows using the length in the
> header to check if the cache_id is valid.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Whilst I wish the ACPICA stuff did structures like this, I'm not sure
if the ACPI maintainers will feel it is appropriate to work around it
with generic sounding structures like this one.

I'd also say that we should only cast it to your _full structure
if we know we have rev 3 of PPTT.  Otherwise we should continue manipulating
it as a struct acpi_pptt_cache

> ---
> Changes since v3:
> New patch
> ---
>  drivers/acpi/pptt.c | 104 ++++++++++++++++++++++++--------------------
>  1 file changed, 58 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 1027ca3566b1..1ed2099c0d1a 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -21,6 +21,11 @@
>  #include <linux/cacheinfo.h>
>  #include <acpi/processor.h>
>  
> +struct acpi_pptt_cache_v1_full {
> +	struct acpi_pptt_cache		f;
> +	struct acpi_pptt_cache_v1	extra;
> +} __packed;

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

Although I later say I don't think you should pass a v1_full structure in here (as
we don't know it is at least that large until after this check) if you do keep this
why not use sizeof(*cache) and get rid of the V1_LEN definition as providing no obvious
value here?

> +		cache->f.flags & ACPI_PPTT_CACHE_ID_VALID);
>  }

> @@ -355,7 +374,6 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
>   * @this_leaf: Kernel cache info structure being updated
>   * @found_cache: The PPTT node describing this cache instance
>   * @cpu_node: A unique reference to describe this cache instance
> - * @revision: The revision of the PPTT table
>   *
>   * The ACPI spec implies that the fields in the cache structures are used to
>   * extend and correct the information probed from the hardware. Lets only
> @@ -364,23 +382,20 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
>   * Return: nothing. Side effect of updating the global cacheinfo
>   */
>  static void update_cache_properties(struct cacheinfo *this_leaf,
> -				    struct acpi_pptt_cache *found_cache,
> -				    struct acpi_pptt_processor *cpu_node,
> -				    u8 revision)
> +				    struct acpi_pptt_cache_v1_full *found_cache,
> +				    struct acpi_pptt_processor *cpu_node)
>  {
> -	struct acpi_pptt_cache_v1* found_cache_v1;
> -
>  	this_leaf->fw_token = cpu_node;
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
>  		case ACPI_PPTT_CACHE_POLICY_WT:
>  			this_leaf->attributes = CACHE_WRITE_THROUGH;
>  			break;
> @@ -389,8 +404,8 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>  			break;
>  		}
>  	}
> -	if (found_cache->flags & ACPI_PPTT_ALLOCATION_TYPE_VALID) {
> -		switch (found_cache->attributes & ACPI_PPTT_MASK_ALLOCATION_TYPE) {
> +	if (found_cache->f.flags & ACPI_PPTT_ALLOCATION_TYPE_VALID) {
> +		switch (found_cache->f.attributes & ACPI_PPTT_MASK_ALLOCATION_TYPE) {
>  		case ACPI_PPTT_CACHE_READ_ALLOCATE:
>  			this_leaf->attributes |= CACHE_READ_ALLOCATE;
>  			break;
> @@ -415,13 +430,11 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>  	 * specified in PPTT.
>  	 */
>  	if (this_leaf->type == CACHE_TYPE_NOCACHE &&
> -	    found_cache->flags & ACPI_PPTT_CACHE_TYPE_VALID)
> +	    found_cache->f.flags & ACPI_PPTT_CACHE_TYPE_VALID)
>  		this_leaf->type = CACHE_TYPE_UNIFIED;
>  
> -	if (revision >= 3 && (found_cache->flags & ACPI_PPTT_CACHE_ID_VALID)) {
> -		found_cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
> -	                                      found_cache, sizeof(struct acpi_pptt_cache));
> -		this_leaf->id = found_cache_v1->cache_id;
> +	if (acpi_pptt_cache_id_is_valid(found_cache)) {

Only here do we know that found_cache is the _full type. 

> +		this_leaf->id = found_cache->extra.cache_id;
>  		this_leaf->attributes |= CACHE_ID;
>  	}
>  }
> @@ -429,7 +442,7 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
>  static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>  				 unsigned int cpu)
>  {
> -	struct acpi_pptt_cache *found_cache;
> +	struct acpi_pptt_cache_v1_full *found_cache;

This isn't necessarily valid. Until deep in update_cache_properties() we don't care about the ID
so this structure may be smaller than this implies.

>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>  	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>  	struct cacheinfo *this_leaf;
> @@ -445,8 +458,7 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>  		pr_debug("found = %p %p\n", found_cache, cpu_node);
>  		if (found_cache)
>  			update_cache_properties(this_leaf, found_cache,
> -						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)),
> -						table->revision);
> +						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)));
>  
>  		index++;
>  	}


