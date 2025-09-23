Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B481CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=od3W27UP2d4Dd91dUdUX5opiLkersdSVw2Akopacp7A=; b=A7qZZipDpDqc+a3AYhHPeNS0Nr
	sYdo1dvE0NKnhK4anYkJ9nDBL+AHUg2ZwpKkB4Xb8qUtIw+68J5GR/5cMB1D3Ekta9zTuvWfgm7tG
	KrZCbxmSqk6YxhbFTGF9nTCGphxwvuiOlFeTcNhySXt21DDOV1uxH4HxTm8Ti8uXtcW/usDUiuUT0
	rK6k3vywCMPd+WTV61EaeT9FNqWe9FE5tWHUeD5UgmHdGbudF90hxg3xRixD+yvImLAnEfds42daD
	EidW2bl89IOfwHFNA6mDZrItn3elN3KvfFaTVJbuAVFbHO2RF8G2Sk+leuLjs1zVsTmOdJ9uzqQ/v
	9XM9rEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15fT-0000000EEZZ-3irR;
	Tue, 23 Sep 2025 16:15:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15fS-0000000EEYu-1Dtn;
	Tue, 23 Sep 2025 16:15:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9747844A33;
	Tue, 23 Sep 2025 16:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DEEC4CEF5;
	Tue, 23 Sep 2025 16:14:53 +0000 (UTC)
Date: Tue, 23 Sep 2025 17:14:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com, usamaarif642@gmail.com,
	yuzhao@google.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	baohua@kernel.org, voidice@gmail.com, Liam.Howlett@oracle.com,
	cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
	kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
	dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
	surenb@google.com, hughd@google.com, willy@infradead.org,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, qun-wei.lin@mediatek.com,
	Andrew.Yang@mediatek.com, casper.li@mediatek.com,
	chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Message-ID: <aNLHexcNI53HQ46A@arm.com>
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com>
 <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
 <aNKJ5glToE4hMhWA@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNKJ5glToE4hMhWA@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_091502_366082_4134783B 
X-CRM114-Status: GOOD (  27.37  )
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

On Tue, Sep 23, 2025 at 12:52:06PM +0100, Catalin Marinas wrote:
> I just realised that on arm64 with MTE we won't get any merging with the
> zero page even if the user page isn't mapped with PROT_MTE. In
> cpu_enable_mte() we zero the tags in the zero page and set
> PG_mte_tagged. The reason is that we want to use the zero page with
> PROT_MTE mappings (until tag setting causes CoW). Hmm, the arm64
> memcmp_pages() messed up KSM merging with the zero page even before this
> patch.
[...]
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index e5e773844889..72a1dfc54659 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -73,6 +73,8 @@ int memcmp_pages(struct page *page1, struct page *page2)
>  {
>  	char *addr1, *addr2;
>  	int ret;
> +	bool page1_tagged = page_mte_tagged(page1) && !is_zero_page(page1);
> +	bool page2_tagged = page_mte_tagged(page2) && !is_zero_page(page2);
>  
>  	addr1 = page_address(page1);
>  	addr2 = page_address(page2);
> @@ -83,11 +85,10 @@ int memcmp_pages(struct page *page1, struct page *page2)
>  
>  	/*
>  	 * If the page content is identical but at least one of the pages is
> -	 * tagged, return non-zero to avoid KSM merging. If only one of the
> -	 * pages is tagged, __set_ptes() may zero or change the tags of the
> -	 * other page via mte_sync_tags().
> +	 * tagged, return non-zero to avoid KSM merging. Ignore the zero page
> +	 * since it is always tagged with the tags cleared.
>  	 */
> -	if (page_mte_tagged(page1) || page_mte_tagged(page2))
> +	if (page1_tagged || page2_tagged)
>  		return addr1 != addr2;
>  
>  	return ret;

Unrelated to this discussion, I got an internal report that Linux hangs
during boot with CONFIG_DEFERRED_STRUCT_PAGE_INIT because
try_page_mte_tagging() locks up on uninitialised page flags.

Since we (always?) map the zero page as pte_special(), set_pte_at()
won't check if the tags have to be initialised, so we can skip the
PG_mte_tagged altogether. We actually had this code for some time until
we introduced the pte_special() check in set_pte_at().

So alternative patch that also fixes the deferred struct page init (on
the assumptions that the zero page is always mapped as pte_special():

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 7b78c95a9017..e325ba34f45c 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2419,17 +2419,21 @@ static void bti_enable(const struct arm64_cpu_capabilities *__unused)
 #ifdef CONFIG_ARM64_MTE
 static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
 {
+	static bool cleared_zero_page = false;
+
 	sysreg_clear_set(sctlr_el1, 0, SCTLR_ELx_ATA | SCTLR_EL1_ATA0);
 
 	mte_cpu_setup();
 
 	/*
 	 * Clear the tags in the zero page. This needs to be done via the
-	 * linear map which has the Tagged attribute.
+	 * linear map which has the Tagged attribute. Since this page is
+	 * always mapped as pte_special(), set_pte_at() will not attempt to
+	 * clear the tags or set PG_mte_tagged.
 	 */
-	if (try_page_mte_tagging(ZERO_PAGE(0))) {
+	if (!cleared_zero_page) {
+		cleared_zero_page = true;
 		mte_clear_page_tags(lm_alias(empty_zero_page));
-		set_page_mte_tagged(ZERO_PAGE(0));
 	}
 
 	kasan_init_hw_tags_cpu();

-- 
Catalin

