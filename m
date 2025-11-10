Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4739DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNKuDCBjNIz74iFWXc8ju2XO+IyvwhvbKIRqT39/VCg=; b=10hXU+LNC3KP7PC33IQuRO3Q7/
	fKMhQbw2bF0yQrDx29UMSW36L+UiHH6lpaSAKiNmpCQeckFcr7V556t1jiK4f8B+UtMnUdqwJoAE3
	1BxnysSRuDIUfmgCrYbtwA5BcAlrzh+wWKVKToEQ2Y+10L17yvV8Pbe3DHxQ0hB53tmv69cR+Vmw2
	skhEguXVuDxI9KDxE50Iwu3IUEMqbDIUbrKdXsG9KmNFr/EQYGAxscnJoqEOnvd4PgYwQwmShfmQ4
	+na7C3GwleFkxOOqy2ZZwrG5/NdxSiiCtHyw4d5Yc03UzTeSXX11E1a/AzWEsO6DJSxNJDVPtpfV9
	ws6IP51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIToc-00000005h6S-3r5r;
	Mon, 10 Nov 2025 15:28:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITob-00000005h6J-3o2s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:28:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 054BE601A6;
	Mon, 10 Nov 2025 15:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73275C19422;
	Mon, 10 Nov 2025 15:28:19 +0000 (UTC)
Date: Mon, 10 Nov 2025 15:28:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Cc: Jan Polensky <japo@linux.ibm.com>, akpm@linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	will@kernel.org
Subject: Re: [PATCH] mm/huge_memory: restrict __GFP_ZEROTAGS to HW tagging
 architectures
Message-ID: <aRIEkLw7BofLjOWs@arm.com>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <20251109003613.1461433-1-japo@linux.ibm.com>
 <690ce196-58cb-4252-ab72-967e1e1574cf@gmail.com>
 <aRG05VS-IIxV2y_C@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <fbca7868-6f68-4b98-a2f2-e39eb46b7f12@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbca7868-6f68-4b98-a2f2-e39eb46b7f12@gmail.com>
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

On Mon, Nov 10, 2025 at 10:53:33AM +0100, David Hildenbrand (Red Hat) wrote:
> On 10.11.25 10:48, Jan Polensky wrote:
> > On Mon, Nov 10, 2025 at 10:09:31AM +0100, David Hildenbrand (Red Hat) wrote:
> > > On 09.11.25 01:36, Jan Polensky wrote:
> > > > The previous change added __GFP_ZEROTAGS when allocating the huge zero
> > > > folio to ensure tag initialization for arm64 with MTE enabled. However,
> > > > on s390 this flag is unnecessary and triggers a regression
> > > > (observed as a crash during repeated 'dnf makecache').
[...]
> > > I think the problem is that post_alloc_hook() does
> > > 
> > > if (zero_tags) {
> > > 	/* Initialize both memory and memory tags. */
> > > 	for (i = 0; i != 1 << order; ++i)
> > > 		tag_clear_highpage(page + i);
> > > 
> > > 	/* Take note that memory was initialized by the loop above. */
> > > 	init = false;
> > > }
> > > 
> > > And tag_clear_highpage() is a NOP on other architectures.

Hmm, another thing I missed. Sorry about this.

> > Which works by the way for our arch (s390).
> > 
> >   include/linux/gfp_types.h | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
> > index 65db9349f905..c12d8a601bb3 100644
> > --- a/include/linux/gfp_types.h
> > +++ b/include/linux/gfp_types.h
> > @@ -85,7 +85,11 @@ enum {
> >   #define ___GFP_HARDWALL        BIT(___GFP_HARDWALL_BIT)
> >   #define ___GFP_THISNODE        BIT(___GFP_THISNODE_BIT)
> >   #define ___GFP_ACCOUNT     BIT(___GFP_ACCOUNT_BIT)
> > +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
> >   #define ___GFP_ZEROTAGS        BIT(___GFP_ZEROTAGS_BIT)
> > +#else
> > +#define ___GFP_ZEROTAGS        0
> > +#endif
> >   #ifdef CONFIG_KASAN_HW_TAGS
> >   #define ___GFP_SKIP_ZERO   BIT(___GFP_SKIP_ZERO_BIT)
> >   #define ___GFP_SKIP_KASAN  BIT(___GFP_SKIP_KASAN_BIT)
> > 
> > This solution would be sufficient from my side, and I would appreciate a
> > quick application if there are no objections.
> 
> As raised, to be sure that __HAVE_ARCH_TAG_CLEAR_HIGHPAGE is always seen
> early in that file, it should likely become a CONFIG_ thing.

I'm fine with either option above but I'll throw one more in the mix:

--------------------8<--------------------------------
diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
index 2312e6ee595f..dcff91533590 100644
--- a/arch/arm64/include/asm/page.h
+++ b/arch/arm64/include/asm/page.h
@@ -33,6 +33,7 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 						unsigned long vaddr);
 #define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
 
+bool arch_has_tag_clear_highpage(void);
 void tag_clear_highpage(struct page *to);
 #define __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
 
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 125dfa6c613b..318d091db843 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -967,18 +967,13 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 	return vma_alloc_folio(flags, 0, vma, vaddr);
 }
 
+bool arch_has_tag_clear_highpage(void)
+{
+	return system_supports_mte();
+}
+
 void tag_clear_highpage(struct page *page)
 {
-	/*
-	 * Check if MTE is supported and fall back to clear_highpage().
-	 * get_huge_zero_folio() unconditionally passes __GFP_ZEROTAGS and
-	 * post_alloc_hook() will invoke tag_clear_highpage().
-	 */
-	if (!system_supports_mte()) {
-		clear_highpage(page);
-		return;
-	}
-
 	/* Newly allocated page, shouldn't have been tagged yet */
 	WARN_ON_ONCE(!try_page_mte_tagging(page));
 	mte_zero_clear_page_tags(page_address(page));
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 105cc4c00cc3..7aa56179ccef 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -251,6 +251,11 @@ static inline void clear_highpage_kasan_tagged(struct page *page)
 
 #ifndef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
 
+static inline bool arch_has_tag_clear_highpage(void)
+{
+	return false;
+}
+
 static inline void tag_clear_highpage(struct page *page)
 {
 }
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e4efda1158b2..5ab15431bc06 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1798,7 +1798,8 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
 {
 	bool init = !want_init_on_free() && want_init_on_alloc(gfp_flags) &&
 			!should_skip_init(gfp_flags);
-	bool zero_tags = init && (gfp_flags & __GFP_ZEROTAGS);
+	bool zero_tags = init && (gfp_flags & __GFP_ZEROTAGS) &&
+		arch_has_tag_clear_highpage();
 	int i;
 
 	set_page_private(page, 0);
--------------------8<--------------------------------

Reasoning: with MTE on arm64, you can't have kasan-tagged pages in the
kernel which are also exposed to user because the tags are shared (same
physical location). The 'zero_tags' initialisation in post_alloc_hook()
makes sense for this behaviour. With virtual tagging (briefly announced
in [1], full specs not public yet), both the user and the kernel can
have their own tags - more like KASAN_SW_TAGS but without the compiler
instrumentation. The kernel won't be able to zero the tags for the user
since they are in virtual space. It can, however, continue to use Kasan
tags even if the pages are mapped in user space. In this case, I'd
rather use the kernel_init_pages() call further down in
post_alloc_hook() than replicating it in tag_clear_highpage(). When we
get to upstreaming virtual tagging (informally vMTE, sometime next
year), I'd like to have a kernel image that supports both, so the
decision on whether to call tag_clear_highpage() will need to be
dynamic.

[1] https://developer.arm.com/community/arm-community-blogs/b/architectures-and-processors-blog/posts/future-architecture-technologies-poe2-and-vmte

-- 
Catalin

