Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407BBCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 02:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS3UMQYfDRiVXfktUZqtEyuly+0oheyOGtsfiL3CXxU=; b=QeCMKFOr3H2RzmgTCC+8ju5KV5
	BUYBpz++gIDOAfimQFqMhIdhsMg+FA3vfqbKvyzxY1qOn962U5IEFuxqHVBrDO219dv+UeCCGMKLR
	9HArxzZds2Y6VD/xg0PbGamIklqC8QpYGb8mjDz62K3o4JbA1XDXuL2TQMmTIhCj4UJQXGqCAkx2t
	jGVBQqlueMF/EznOREInuDjrCdqqWQwQC5Sf4IUFm0HGQpL7ohXddBxUVHItFWqqYKoaZ/569haeJ
	5DjQaeNmP2D503Cjm8yddO1YBFKanTc8Pjt/qHc6C8fj4v4TRLGSQuxcv6Z5kD4Fc10bzyXWB2JIG
	V/uWSX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FZo-0000000FO6B-2yxp;
	Wed, 24 Sep 2025 02:49:52 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FZm-0000000FO5L-1nMQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 02:49:52 +0000
Message-ID: <f2fe9c01-2a8d-4de9-abd5-dbb86d15a37b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758682186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gS3UMQYfDRiVXfktUZqtEyuly+0oheyOGtsfiL3CXxU=;
	b=D/w43Tn3x7CWbbsMju6wP2WmE63sMFT1L5kwMs0zBjv7gSY8AEfER8sfxukJxuwIgzMoyb
	HkO0RKC4KmgarsNHiuI71MwRgtTRzO2yF3PnzTH3CFUBqrRPSCu3rabdUvARAHDsykafy8
	GMLfw99XCOHABMYrqi82Sa7ykFYURTI=
Date: Wed, 24 Sep 2025 10:49:27 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 usamaarif642@gmail.com, yuzhao@google.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, baohua@kernel.org, voidice@gmail.com,
 Liam.Howlett@oracle.com, cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
 kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
 roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
 dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
 surenb@google.com, hughd@google.com, willy@infradead.org,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, qun-wei.lin@mediatek.com, Andrew.Yang@mediatek.com,
 casper.li@mediatek.com, chinwen.chang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mm@kvack.org, ioworker0@gmail.com,
 stable@vger.kernel.org
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com> <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
 <aNKJ5glToE4hMhWA@arm.com> <aNLHexcNI53HQ46A@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aNLHexcNI53HQ46A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_194951_073657_1A336818 
X-CRM114-Status: GOOD (  29.99  )
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



On 2025/9/24 00:14, Catalin Marinas wrote:
> On Tue, Sep 23, 2025 at 12:52:06PM +0100, Catalin Marinas wrote:
>> I just realised that on arm64 with MTE we won't get any merging with the
>> zero page even if the user page isn't mapped with PROT_MTE. In
>> cpu_enable_mte() we zero the tags in the zero page and set
>> PG_mte_tagged. The reason is that we want to use the zero page with
>> PROT_MTE mappings (until tag setting causes CoW). Hmm, the arm64
>> memcmp_pages() messed up KSM merging with the zero page even before this
>> patch.
> [...]
>> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
>> index e5e773844889..72a1dfc54659 100644
>> --- a/arch/arm64/kernel/mte.c
>> +++ b/arch/arm64/kernel/mte.c
>> @@ -73,6 +73,8 @@ int memcmp_pages(struct page *page1, struct page *page2)
>>   {
>>   	char *addr1, *addr2;
>>   	int ret;
>> +	bool page1_tagged = page_mte_tagged(page1) && !is_zero_page(page1);
>> +	bool page2_tagged = page_mte_tagged(page2) && !is_zero_page(page2);
>>   
>>   	addr1 = page_address(page1);
>>   	addr2 = page_address(page2);
>> @@ -83,11 +85,10 @@ int memcmp_pages(struct page *page1, struct page *page2)
>>   
>>   	/*
>>   	 * If the page content is identical but at least one of the pages is
>> -	 * tagged, return non-zero to avoid KSM merging. If only one of the
>> -	 * pages is tagged, __set_ptes() may zero or change the tags of the
>> -	 * other page via mte_sync_tags().
>> +	 * tagged, return non-zero to avoid KSM merging. Ignore the zero page
>> +	 * since it is always tagged with the tags cleared.
>>   	 */
>> -	if (page_mte_tagged(page1) || page_mte_tagged(page2))
>> +	if (page1_tagged || page2_tagged)
>>   		return addr1 != addr2;
>>   
>>   	return ret;
> 
> Unrelated to this discussion, I got an internal report that Linux hangs
> during boot with CONFIG_DEFERRED_STRUCT_PAGE_INIT because
> try_page_mte_tagging() locks up on uninitialised page flags.
> 
> Since we (always?) map the zero page as pte_special(), set_pte_at()
> won't check if the tags have to be initialised, so we can skip the
> PG_mte_tagged altogether. We actually had this code for some time until
> we introduced the pte_special() check in set_pte_at().
> 
> So alternative patch that also fixes the deferred struct page init (on
> the assumptions that the zero page is always mapped as pte_special():

I can confirm that this alternative patch also works correctly; my tests
for MTE all pass ;)

This looks like a better fix since it solves the boot hang issue too.

> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 7b78c95a9017..e325ba34f45c 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2419,17 +2419,21 @@ static void bti_enable(const struct arm64_cpu_capabilities *__unused)
>   #ifdef CONFIG_ARM64_MTE
>   static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
>   {
> +	static bool cleared_zero_page = false;
> +
>   	sysreg_clear_set(sctlr_el1, 0, SCTLR_ELx_ATA | SCTLR_EL1_ATA0);
>   
>   	mte_cpu_setup();
>   
>   	/*
>   	 * Clear the tags in the zero page. This needs to be done via the
> -	 * linear map which has the Tagged attribute.
> +	 * linear map which has the Tagged attribute. Since this page is
> +	 * always mapped as pte_special(), set_pte_at() will not attempt to
> +	 * clear the tags or set PG_mte_tagged.
>   	 */
> -	if (try_page_mte_tagging(ZERO_PAGE(0))) {
> +	if (!cleared_zero_page) {
> +		cleared_zero_page = true;
>   		mte_clear_page_tags(lm_alias(empty_zero_page));
> -		set_page_mte_tagged(ZERO_PAGE(0));
>   	}
>   
>   	kasan_init_hw_tags_cpu();
> 


