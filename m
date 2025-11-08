Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747CCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPnyFv8U6G66adg5n2qIg2Qs8rioO43BmGrTfO9DwVw=; b=zVF2HWHZI90koF4O9Sgfw5ZkQR
	NiKHSCbujcZ8nHYSz+aGXsFUiQGZo51sD9rEmsNzi5t2Tz22RFf3ArhW2Ef5bE8arjFvReO/7RRR7
	UfM7NTf0mH18Em5v8XP/iXSRMphZWvySr/wmi1H1hAa3q/c48oo9gewwVu6qxQnk/zKtMheC7gmk4
	sS1w2gQR9tPZ3FLn3ccTH0Il/uZ96RYlFYC21yIBE15YPBazWddn2an74qKHLe3lC74ThtIoBgemH
	IsZbSLf+3Bizx3OrRN4jf56Cb6ZhXFI0hTeG8IUb1pFxtoDKBKR+Hs4PPlGQaOmL8aCs0Zuxvs2NN
	ZvF17trA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHayk-00000002Y0r-2dpL;
	Sat, 08 Nov 2025 04:55:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHayh-00000002Y0P-0nmM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 04:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762577705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPnyFv8U6G66adg5n2qIg2Qs8rioO43BmGrTfO9DwVw=;
	b=RKrx+32vaaeIW1WquxE9Cf3Y80lPh337l5u71BGte3Rj5UhRc9hzdWPWDxLD19xJCexCgt
	06UJSb742+C/dSXWy6/CCcop/W0JgeQq1TL4pkCjo68YP6b0MUTg27Va4Xjbl86wSWtMYU
	Of7tilbXJDMRSRoL9ynSCmkEVgmO7mM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-xipcAbWfMGaD3r2XN7y2kA-1; Fri, 07 Nov 2025 23:55:03 -0500
X-MC-Unique: xipcAbWfMGaD3r2XN7y2kA-1
X-Mimecast-MFC-AGG-ID: xipcAbWfMGaD3r2XN7y2kA_1762577703
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297d50cd8c4so19645525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 20:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762577702; x=1763182502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPnyFv8U6G66adg5n2qIg2Qs8rioO43BmGrTfO9DwVw=;
        b=l2LjZKzRwFg3UZv1rIT4U+S4C+WaYzFJmaoFROvBAPCo9VPJntikkpwcWrhcMsCnSJ
         lrQvYgsiGAB3/eg4RrUN4akE75UObh8AAzbKUo090nqigFNa0U6sLx0QYNeRuZJ57mYR
         62OPw3XlhIdHxC8R4tzpUsOymBbqh5wozfgZxSyiwGY6MmAjgWXG8jICMTiEcr7oHaq6
         c/cYn+n857PUPGqnjWKaih8ADifdVlBiq93y6omVfZqRb+LWf17EY8ejgYUZjkzEgzo8
         5ubPlaikBRtqJuMLgHB7XOGhhmn28zXk3LkY+QQKpDaAhG2A+hHy/aAq33yboPVVJyYf
         UkZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8niBv84WA2htC+2GN+DPxyR2nBTNfw0g0qxxPCxGKdIs/RHR5QWabzOSzAZ+ozNsPfWaFrXhsngLQgadtr9SO@lists.infradead.org
X-Gm-Message-State: AOJu0YxvseJiY1YP3sDzbowP9tB2FpLrILKPhmNREWTiRC3WDl/NveN+
	iNksew+e2+dpKH9cv2jzhlW62GnjT6dBqPKbT90p2R1yIC7WZBm+znzdGTbKMTxT8p/92hVakDR
	/0uWI6TsP/8iVTW2s352SIDDFwAbZ9DkTMgfdYSW7E2es/Xv3k4aGYaRDe13WF3z/AXV7bfbNCK
	0D
X-Gm-Gg: ASbGncuLnId8rBov9GiW6zXCpWCBr9GcFYI0qvshJWXNeQmY3o+4SGID4XLu/Nr1avh
	O+2hGVH7fLlXJGBJ6cAhPR3icS5yKH5jBmyR4j+D7Mmwn0yL78m4laZ99v0ICLfcR4FJwiESJGd
	uUZna936ZWdXaBdxy3ognYkoSZDoCIsIvSFS8qTjTenV9EdLwZRZvqvMxlzjUyTxHBERoFoEsoF
	3NIAPRNnYd9qcziONctkHRPp+IelheBQufY/PJkBmmBDdw7UL83edxRxZJMvUaH0NV4AjaKaXZ+
	IarBUUUK+SNqnBP5jShCFaD1Q2cgNcOF907HZk1v9cpnYXI24T6A9PXKYwdbTejYZa4QI/FQAlg
	UX4Sasn5hBmu5phMWXFKXd7blGaZ5r8LOEkMfBsY=
X-Received: by 2002:a17:902:ecc5:b0:295:565b:c691 with SMTP id d9443c01a7336-297e5629152mr20796405ad.17.1762577702525;
        Fri, 07 Nov 2025 20:55:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGya/hov+kDTTbyz8MZCYFlylL8RVAqfShmc9QBbP+PajCzXW2szwcwQFDnifPj4C/Lm/ZDIw==
X-Received: by 2002:a17:902:ecc5:b0:295:565b:c691 with SMTP id d9443c01a7336-297e5629152mr20795995ad.17.1762577702044;
        Fri, 07 Nov 2025 20:55:02 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c31d86esm4320142a91.8.2025.11.07.20.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 20:55:01 -0800 (PST)
Message-ID: <04f4c2f6-19ff-413f-96fb-86432d53830e@redhat.com>
Date: Sat, 8 Nov 2025 14:54:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-4-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IpUFIjsl78a61x2LzHwNlVSlmrtmbsF1Z1vl_OmOqjA_1762577703
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_205507_416441_74BD339F 
X-CRM114-Status: GOOD (  32.37  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
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

Two nitpicks below. LGTM in either way.

Reviewed-by: Gavin Shan <gshan@redhat.com>

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

This function is nice fit to 'inline'. Besides, I'm not sure if we can just
use sizeof(*cache) instead of ACPI_PPTT_CACHE_V1_LEN, which is used for once
in pptt.c

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

Thanks,
Gavin


