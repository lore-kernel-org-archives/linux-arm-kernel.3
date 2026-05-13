Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9855DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iNZVtkyHVJXBQDQeMZ4JDUm0r0N2Ba91kVc+1rbIJH4=; b=402SyjUsqUSiz6qutu643b5sXF
	qJr9PlPX/ojM/0cwtaut21S1pH3FnleTR+vCEbEwMvbnK5CQDcoKNT3YA+HkFnc+qz09AHmsVb4O9
	Lqz+x0za6eU4ZSMxE4BPmhC7AZfWK/AqdmJOHuvoGfgCvvbMYtGPfr6VkLdfxcxRjf4NMH5QCrSCO
	NlttMTPGn4RkzT2Ctf5JfobqJbp6uTDhvEoGxM+Br4+P59cdP+WKVgZxLU4eXTS6uBgRWZlTo9fLO
	1zeyOGv46Xtv7tJ1+9AZJu+AYqVQpteLBaTXJINs4OR3bMT6YaEUXoCk4T87HOOlUGGI9OnV0lsPC
	cCcRkfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAyu-00000002zTj-1Cqf;
	Wed, 13 May 2026 14:54:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAyr-00000002zSc-085N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42DBA44253;
	Wed, 13 May 2026 14:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FC9C19425;
	Wed, 13 May 2026 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778684076;
	bh=5tb/dZ3Z6XZ9rdTRViFJg2CQhxIhIhB3K1EbtjSZ+/0=;
	h=From:To:Cc:Subject:Date:From;
	b=OvLTF6/v0D+Is1Oo2vvsUkztjB8o43huMqy8iw+pSIEJ/nvZeP4oZB7YNeLzpX70+
	 F6KHL8ycBfURSnQT1p+fKlIB9OhRQVTn0tCsXa1apa7oDIctXQWRwXvxjqjrRXnGVK
	 vd0ARq2IWqI97wp/22xXUA4xRls5LUhWjIkH09oIc79WCYDerBL44nYC8NvA/NJ6ri
	 F+QGxwMrRLrw+4UqlN3r2QqLBtZCTVNDdmCrzGaBuNlD8cL0XM2IFfnEbrmTW1Rw7d
	 GJhSsAo2QS1ZHFIkt5/EhT5m/ZBORkFb5yljim2NIz9XpXL5HyJ43DPn1XUH7ViMLt
	 BGE9bIg+4eV6w==
From: Arnd Bergmann <arnd@kernel.org>
To: Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kbuild@vger.kernel.org,
	stable@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section mismatch warnings
Date: Wed, 13 May 2026 16:53:54 +0200
Message-Id: <20260513145425.1579430-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_075437_114691_50B09BED 
X-CRM114-Status: GOOD (  19.05  )
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

From: Arnd Bergmann <arnd@arndb.de>

gcc-16 has gained some more advanced inter-procedual optimization
techniques that enable it to inline the dummy_tlb_add_page() and
dummy_tlb_flush() function pointers into a specialized version of
__arm_v7s_unmap:

WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x2cc (section: .text) -> dummy_tlb_add_page (section: .init.text)
ERROR: modpost: Section mismatches detected.

From what I can tell, the transformation is correct, as this is only
called when __arm_v7s_unmap() is called from arm_v7s_do_selftests(),
which is also __init. Since __arm_v7s_unmap() however is not __init,
gcc cannot inline the inner function calls directly.

In debug_objects_selftest(), the same thing happens. Both the
caller and the leaf function are __init, but the IPA pulls
it into a non-init one:

WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x7c (section: .text.lookup_object_or_alloc) -> is_static_object (section: .init.text)

Marking the affected functions as not "__init" would reliably avoid this
issue but is not a good solution because it removes an otherwise correct
annotation. I tried marking the functions as 'noinline', but that ended
up not covering all the affected configurations.

With some more experimenting, I found that marking these functions as
__attribute__((noipa)) is both logical and reliable.

In order to keep the syntax readable, add a custom macro for this in
include/linux/compiler_attributes.h next to other related macros and
use it to annotate both files.

Link: https://lore.kernel.org/all/abRB6g-48ZX6Yl2r@willie-the-truck/
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: I merged both patches into one, to simplify the dependency
on the new compiler_attributes.h macro.
---
 drivers/iommu/io-pgtable-arm-v7s.c  | 18 ++++++++++++------
 include/linux/compiler_attributes.h | 11 +++++++++++
 lib/debugobjects.c                  |  2 +-
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 40e33257d3c2..1dbef8c55007 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -777,21 +777,27 @@ struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
 
 static struct io_pgtable_cfg *cfg_cookie __initdata;
 
-static void __init dummy_tlb_flush_all(void *cookie)
+/*
+ * __noipa prevents gcc from turning indirect iommu_flush_ops calls
+ * into direct calls from a specialized __arm_v7s_unmap() that triggers
+ * a build time section mismatch assertion.
+ */
+static __noipa void __init dummy_tlb_flush_all(void *cookie)
 {
 	WARN_ON(cookie != cfg_cookie);
 }
 
-static void __init dummy_tlb_flush(unsigned long iova, size_t size,
-				   size_t granule, void *cookie)
+static __noipa void __init dummy_tlb_flush(unsigned long iova, size_t size,
+					   size_t granule, void *cookie)
 {
 	WARN_ON(cookie != cfg_cookie);
 	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
 }
 
-static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
-				      unsigned long iova, size_t granule,
-				      void *cookie)
+static __noipa void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
+					      unsigned long iova,
+					      size_t granule,
+					      void *cookie)
 {
 	dummy_tlb_flush(iova, granule, granule, cookie);
 }
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index c16d4199bf92..836a50f5917a 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -396,6 +396,17 @@
 # define __disable_sanitizer_instrumentation
 #endif
 
+/*
+ * Optional: not supported by clang
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-noipa
+ */
+#if __has_attribute(noipa)
+# define __noipa __attribute__((noipa))
+#else
+# define __noipa
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-weak-function-attribute
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-weak-variable-attribute
diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 12e2e42e6a31..c93b7ca3e1ab 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -1212,7 +1212,7 @@ struct self_test {
 
 static __initconst const struct debug_obj_descr descr_type_test;
 
-static bool __init is_static_object(void *addr)
+static __noipa bool __init is_static_object(void *addr)
 {
 	struct self_test *obj = addr;
 
-- 
2.39.5


