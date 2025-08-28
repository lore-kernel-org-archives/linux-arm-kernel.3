Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C91CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cX+vNMevhNfJQyqfPTvjtYHWrqSBpbm63jlEKsJCio=; b=DafjcZby2bCvAjJ8ERN3VOpMzW
	bLvditYHZSGLW/CSAcvp986N+kFnsJ2tDRahmh348KgP2UZKb8etdqaDjmVHMzTFRmFXBB/v4FAdH
	PGWRrMIFKcAAuhmn3EzTFvnTGwcuJeZgcarSsY9oizivYbO5Bepaoi2o1IhU5+ie+tmmcpBkF7I08
	R+DVRlPkBpqteKL5BrgZBXRo1YL7OBK/s+KkBxDwkS5ZeqV9+5HdTlrsDLx8tlxy6YCFJZmaBACYL
	zluOIAVfGUCuZyuaEYyuNimTAIBzePd2+E6U2Ix98QkTlg8Fe+QyQtI7hkNi6YlwFA4pFl8yLCBDe
	rPCpcPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlzU-00000003dRD-2tG5;
	Thu, 28 Aug 2025 23:25:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urggt-00000002ZZp-05aP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 17:45:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8D021688;
	Thu, 28 Aug 2025 10:45:27 -0700 (PDT)
Received: from [10.57.91.118] (unknown [10.57.91.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6626B3F738;
	Thu, 28 Aug 2025 10:45:34 -0700 (PDT)
Message-ID: <5795892e-503e-496b-a5dd-be4776f15513@arm.com>
Date: Thu, 28 Aug 2025 18:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 3/4] arm64: mm: support large block mapping when
 rodata=full
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 akpm@linux-foundation.org, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <20250805081350.3854670-4-ryan.roberts@arm.com> <aLCNTsM-nn6SpfOO@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aLCNTsM-nn6SpfOO@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_104539_104789_B1D5046C 
X-CRM114-Status: GOOD (  19.47  )
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

On 28/08/2025 18:09, Catalin Marinas wrote:
> On Tue, Aug 05, 2025 at 09:13:48AM +0100, Ryan Roberts wrote:
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index abd9725796e9..f6cd79287024 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
> [...]
>> @@ -640,6 +857,16 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
>>  
>>  #endif /* CONFIG_KFENCE */
>>  
>> +static inline bool force_pte_mapping(void)
>> +{
>> +	bool bbml2 = system_capabilities_finalized() ?
>> +		system_supports_bbml2_noabort() : bbml2_noabort_available();
>> +
>> +	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
>> +			   is_realm_world())) ||
>> +		debug_pagealloc_enabled();
>> +}
>> +
>>  static void __init map_mem(pgd_t *pgdp)
>>  {
>>  	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
>> @@ -665,7 +892,7 @@ static void __init map_mem(pgd_t *pgdp)
>>  
>>  	early_kfence_pool = arm64_kfence_alloc_pool();
>>  
>> -	if (can_set_direct_map())
>> +	if (force_pte_mapping())
>>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>  
>>  	/*
>> @@ -1367,7 +1594,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>  
>>  	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>  
>> -	if (can_set_direct_map())
>> +	if (force_pte_mapping())
>>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>  
>>  	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
> 
> Not sure this works in a heterogeneous configuration.
> bbml2_noabort_available() only checks the current/boot CPU which may
> return true but if secondary CPUs don't have the feature, it results in
> system_supports_bbml2_noabort() being false with force_pte_mapping()
> also false in the early map_mem() calls.

The intent is that we eagerly create a block-mapped linear map at boot if the
boot CPU supports BBML2. If, once we have determined that a secondary CPU
doesn't support BBML2 (and therefore the system doesn't support it) then we
repaint the linear map using page mappings.

The repainting mechanism is added in the next patch.

I've tested this with heterogeneous configs and I'm confident it does work.


FYI, I actually have a new version of this ready to go - I was hoping to post
tomorrow, subject to performance results. I thought you were implying in a
previous mail that you weren't interested in reviewing until it was based on top
of an -rc. Perhaps I misunderstood. Let me know if you want me to hold off on
posting that given you are now reviewing this version.

Thanks,
Ryan

> 
> I don't see a nice solution other than making BBML2 no-abort a boot CPU
> feature.
> 


