Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D522B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a6C3UB4Z;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WWGu0TAH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMikreozefWP0A1pDF6mPPOuxdBSRCIA1RsbQnpSxVk=; b=a6C3UB4Z+ollrR3GvUo6QQY66L
	hRsonjgBqaz+63inV8Bgd/tM5Aj+PBRGu5z0n4/UTW0eWveJX44YUeoCo0oh666JLfogSPwzt8wK1
	CIKsEGppH4L6OGvdcXq7xVjscZLF//vZ66fTaTe4deWX+xcyUD13xzym6RFcuR1Lk9Et8FtdHPp9o
	+X+YyLQ4gteM5BjZ6s8PjGLr0TqMFVLOHITviPq2NcPAzjPm4ElTqLaDRCM8z0wuSnOCKyMDVF/9x
	CA0GjVlJEL96m1PVVU6AJgW6uIvzcs2dCVIElnAY4Jm5u67a413OUO8U7wZJZGz3cLrEkd6UlibAy
	FljmwUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUAK-0000000BhCW-1k5x;
	Wed, 21 Oct 2026 11:07:28 +0000
Received: from out-3.mta0.migadu.com ([91.218.175.3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUAC-0000000Bh8g-0SCy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:07:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CFC+EpkLs8GV2o/35gbFX0OJWtbLR8uwfWhMsdHJKjw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792580837; v=1; x=1793185637;
 b=WWGu0TAHYBStBTe0fKymiemcvwQ8nkXduNeNineIWMwacZcDuT2uZxjBeMbUhV+EP1Vh0ynP
 kCfjv4lbYhRu5+9H88jDl84U9LHiHB5uOaTxas+SMhxc83OtxmAIvjfczdz/2pHZk1yLtikbHiK
 +ZcZlxSxSk0okXj7yjpK5Ecc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 203429e2f75eaf6d;
	Wed, 21 Oct 2026 11:07:17 +0000
X-Mizu-Trace-ID: 203429e2f75eaf6d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: mte: Add mte_clear_folio_tags()
Date: Wed, 21 Oct 2026 12:07:00 +0100
Message-ID: <20261021110700.493315-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110700.493315-1-fuad.tabba@linux.dev>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_040720_299058_EEEC37F5 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mte_sync_tags(), sanitise_mte_tags() and kvm_vm_ioctl_mte_copy_tags()
each open-code the loop that clears the tags of every page in a hugetlb
folio. Add mte_clear_folio_tags() and use it in all three.
kvm_vm_ioctl_mte_copy_tags() then tests for hugetlb first, as it does
where it sets the tagged flag below.

No functional change intended.

Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/mte.h |  4 ++++
 arch/arm64/kernel/mte.c      | 15 ++++++++++-----
 arch/arm64/kvm/guest.c       | 10 +++++-----
 arch/arm64/kvm/mmu.c         |  3 +--
 4 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 7f7b97e099968..5a2d2814c0416 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -96,6 +96,7 @@ static inline bool try_page_mte_tagging(struct page *page)
 }
 
 void mte_zero_clear_page_tags(void *addr);
+void mte_clear_folio_tags(struct folio *folio);
 void mte_sync_tags(pte_t pte, unsigned int nr_pages);
 void mte_copy_page_tags(void *kto, const void *kfrom);
 void mte_thread_init_user(void);
@@ -128,6 +129,9 @@ static inline bool try_page_mte_tagging(struct page *page)
 static inline void mte_zero_clear_page_tags(void *addr)
 {
 }
+static inline void mte_clear_folio_tags(struct folio *folio)
+{
+}
 static inline void mte_sync_tags(pte_t pte, unsigned int nr_pages)
 {
 }
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 1a9aad6ef22a0..fb2598f8c0ccd 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -36,6 +36,14 @@ DEFINE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
 EXPORT_SYMBOL_GPL(mte_async_or_asymm_mode);
 #endif
 
+void mte_clear_folio_tags(struct folio *folio)
+{
+	unsigned long i;
+
+	for (i = 0; i < folio_nr_pages(folio); i++)
+		mte_clear_page_tags(page_address(folio_page(folio, i)));
+}
+
 void mte_sync_tags(pte_t pte, unsigned int nr_pages)
 {
 	struct page *page = pte_page(pte);
@@ -43,12 +51,9 @@ void mte_sync_tags(pte_t pte, unsigned int nr_pages)
 	unsigned long i;
 
 	if (folio_test_hugetlb(folio)) {
-		unsigned long nr = folio_nr_pages(folio);
-
-		/* Hugetlb MTE flags are set for head page only */
+		/* A hugetlb folio is marked tagged as a whole, so clear every page */
 		if (folio_try_hugetlb_mte_tagging(folio)) {
-			for (i = 0; i < nr; i++, page++)
-				mte_clear_page_tags(page_address(page));
+			mte_clear_folio_tags(folio);
 			folio_set_hugetlb_mte_tagged(folio);
 		}
 
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index cda655fbff657..c75466384f8ac 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1012,7 +1012,6 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 		void *maddr;
 		unsigned long num_tags;
 		struct folio *folio;
-		unsigned long i;
 
 		if (!page) {
 			ret = -EFAULT;
@@ -1046,11 +1045,12 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 			 * tags. A hugetlb folio is marked tagged as a whole,
 			 * so its first tagging clears every page.
 			 */
-			if (!folio_test_hugetlb(folio))
+			if (folio_test_hugetlb(folio)) {
+				if (folio_try_hugetlb_mte_tagging(folio))
+					mte_clear_folio_tags(folio);
+			} else {
 				try_page_mte_tagging(page);
-			else if (folio_try_hugetlb_mte_tagging(folio))
-				for (i = 0; i < folio_nr_pages(folio); i++)
-					mte_clear_page_tags(page_address(folio_page(folio, i)));
+			}
 			num_tags = mte_copy_tags_from_user(maddr, tags,
 							MTE_GRANULES_PER_PAGE);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6e10aa9913d71..f8139c0a54deb 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1514,8 +1514,7 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 	if (folio_test_hugetlb(folio)) {
 		/* A hugetlb folio is marked tagged as a whole, so clear every page */
 		if (folio_try_hugetlb_mte_tagging(folio)) {
-			for (i = 0; i < folio_nr_pages(folio); i++)
-				mte_clear_page_tags(page_address(folio_page(folio, i)));
+			mte_clear_folio_tags(folio);
 			folio_set_hugetlb_mte_tagged(folio);
 		}
 		return;
-- 
2.47.3


