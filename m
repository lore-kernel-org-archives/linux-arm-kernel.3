Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D84CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaKJ4a3hvN1JQ5ZyWHns6rbJ1fTSdq6LuK2dwO81y2A=; b=1DLbpL+0YGWInLGieXD+HVHW8f
	FaXDrvEfW/7MVqQrN/htzOZFYmlH8c2Ssds2PBuR6De7RIhZDf1V4lYpSoxExQKjwGKQum6dhKgLx
	kRmaXKtzgoSlEFbQD7Idk21JIE5iHqI9ZqqO/jmUT2cCw1UYF0o3Kwpj84WYGPWXQVEYaHfDEhsgK
	Y/wM37zrwVctp9zNqqIQncIWV5AI6kpGi+rKQVSgdXOEp0J34qdnikjm0OZocIyW6r8o6ys6uvxGH
	iiexSUeu1ldw6MCdY9MUi4j914cafn/L/mrn+ul0B0vFfaB19UnmSHvPlqL4/F9Y1v11xJcy/n9+h
	Y72c88yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtlV-0000000AMA2-3jTy;
	Fri, 12 Jun 2026 04:45:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtlT-0000000AM9G-3Ty5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 04:45:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5263B2E91;
	Thu, 11 Jun 2026 21:45:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A98E3FAF5;
	Thu, 11 Jun 2026 21:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781239506; bh=adMGJ7PXZloqurqObpZQmC4xZiFQ3So5xjocDZ6UB6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dyprqNRXfh9wVKf2O2t0oY3N9NZr2vJGqiN+CzR4ogevyLghQcFeqWH+CH6APm3GX
	 ZX6ZCMglBYa+Nsi28vNnVLgYd7ZSS3Yymcm7FvevGna/IiGmKmLZKE1D/XZ92HG1ZO
	 R4nwE7x14jL8zdcxhGbU84hVARQ1ZI5lZut0W+Qw=
From: Dev Jain <dev.jain@arm.com>
To: ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net
Cc: Dev Jain <dev.jain@arm.com>,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	kaleshsingh@google.com,
	21cnbao@gmail.com,
	david@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [RFC PATCH 2/2] kasan: hw_tags: Add boot option to elide free time poisoning
Date: Fri, 12 Jun 2026 04:44:24 +0000
Message-ID: <20260612044425.763060-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_214507_957625_1AAE4739 
X-CRM114-Status: GOOD (  22.03  )
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

Introduce a boot option to tag only at allocation time of the objects. This
reduces KASAN MTE overhead, the tradeoff being reduced ability
of catching bugs.

Now, when a memory object will be freed, it will retain the random tag it
had at allocation time. This compromises on catching UAF bugs, till the
time the object is not reallocated.

Hence, not catching "use-after-free-before-reallocation" and not catching
"double-free" will be the compromise for reduced KASAN overhead.

Keep this as a boot time feature to prevent building two kernel images.

To implement the feature, we need to effectively render kasan_poison()
redundant for hw tags case, but keep it working in the case where it is
used not in an object-freeing code path, but the redzoning path (which
means, poisoning the tail end of a vmalloc or kmalloc allocation).

We achieve this by overloading the poison values for the hw tags case: we
define the four poison values as 0x0E, 0x1E, 0x2E, 0x3E. In kasan_poison(),
if we arrive with KASAN_SLAB_REDZONE or KASAN_PAGE_REDZONE, do a bitwise
OR on the value of the tag to make it equal to KASAN_TAG_INVALID.

If not, then, if init is true, zero out the memory and bail out.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 Documentation/dev-tools/kasan.rst |  4 +++
 mm/kasan/hw_tags.c                | 43 ++++++++++++++++++++++++++++++-
 mm/kasan/kasan.h                  | 23 ++++++++++++++++-
 3 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 4968b2aa60c80..b0c30584b5062 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -146,6 +146,10 @@ disabling KASAN altogether or controlling its features:
 - ``kasan.vmalloc=off`` or ``=on`` disables or enables tagging of vmalloc
   allocations (default: ``on``).
 
+- ``kasan.tag_only_on_alloc=off`` or ``=on`` disables or enables skipping
+  free-time tagging (poisoning) while keeping allocation-time tagging enabled
+  (default: ``off``).
+
 - ``kasan.page_alloc.sample=<sampling interval>`` makes KASAN tag only every
   Nth page_alloc allocation with the order equal or greater than
   ``kasan.page_alloc.sample.order``, where N is the value of the ``sample``
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index c1a2b48808ed7..a392e34d11e3a 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -41,9 +41,16 @@ enum kasan_arg_vmalloc {
 	KASAN_ARG_VMALLOC_ON,
 };
 
+enum kasan_arg_tag_only_on_alloc {
+	KASAN_ARG_TAG_ONLY_ON_ALLOC_DEFAULT,
+	KASAN_ARG_TAG_ONLY_ON_ALLOC_OFF,
+	KASAN_ARG_TAG_ONLY_ON_ALLOC_ON,
+};
+
 static enum kasan_arg kasan_arg __ro_after_init;
 static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
 static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
+static enum kasan_arg_tag_only_on_alloc kasan_arg_tag_only_on_alloc __initdata;
 
 /*
  * Whether the selected mode is synchronous, asynchronous, or asymmetric.
@@ -63,6 +70,10 @@ EXPORT_SYMBOL_GPL(kasan_flag_vmalloc);
 /* Whether to check write accesses only. */
 static bool kasan_flag_write_only = false;
 
+/* Whether to skip free-time tagging. */
+DEFINE_STATIC_KEY_FALSE(kasan_flag_tag_only_on_alloc);
+EXPORT_SYMBOL_GPL(kasan_flag_tag_only_on_alloc);
+
 #define PAGE_ALLOC_SAMPLE_DEFAULT	1
 #define PAGE_ALLOC_SAMPLE_ORDER_DEFAULT	3
 
@@ -154,6 +165,23 @@ static int __init early_kasan_flag_write_only(char *arg)
 }
 early_param("kasan.write_only", early_kasan_flag_write_only);
 
+/* kasan.tag_only_on_alloc=off/on */
+static int __init early_kasan_flag_tag_only_on_alloc(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (!strcmp(arg, "off"))
+		kasan_arg_tag_only_on_alloc = KASAN_ARG_TAG_ONLY_ON_ALLOC_OFF;
+	else if (!strcmp(arg, "on"))
+		kasan_arg_tag_only_on_alloc = KASAN_ARG_TAG_ONLY_ON_ALLOC_ON;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+early_param("kasan.tag_only_on_alloc", early_kasan_flag_tag_only_on_alloc);
+
 static inline const char *kasan_mode_info(void)
 {
 	if (kasan_mode == KASAN_MODE_ASYNC)
@@ -270,14 +298,27 @@ void __init kasan_init_hw_tags(void)
 		break;
 	}
 
+	switch (kasan_arg_tag_only_on_alloc) {
+	case KASAN_ARG_TAG_ONLY_ON_ALLOC_DEFAULT:
+		/* Default is specified by kasan_flag_tag_only_on_alloc. */
+		break;
+	case KASAN_ARG_TAG_ONLY_ON_ALLOC_OFF:
+		static_branch_disable(&kasan_flag_tag_only_on_alloc);
+		break;
+	case KASAN_ARG_TAG_ONLY_ON_ALLOC_ON:
+		static_branch_enable(&kasan_flag_tag_only_on_alloc);
+		break;
+	}
+
 	kasan_init_tags();
 
 	/* KASAN is now initialized, enable it. */
 	kasan_enable();
 
-	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s, write_only=%s)\n",
+	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, tag_only_on_alloc=%s, stacktrace=%s, write_only=%s)\n",
 		kasan_mode_info(),
 		str_on_off(kasan_vmalloc_enabled()),
+		str_on_off(kasan_tag_only_on_alloc_enabled()),
 		str_on_off(kasan_stack_collection_enabled()),
 		str_on_off(kasan_flag_write_only));
 }
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index fc9169a547662..4fa8abb312faa 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -33,6 +33,7 @@ static inline bool kasan_stack_collection_enabled(void)
 #include "../slab.h"
 
 DECLARE_STATIC_KEY_TRUE(kasan_flag_vmalloc);
+DECLARE_STATIC_KEY_FALSE(kasan_flag_tag_only_on_alloc);
 
 enum kasan_mode {
 	KASAN_MODE_SYNC,
@@ -52,6 +53,11 @@ static inline bool kasan_vmalloc_enabled(void)
 	return static_branch_likely(&kasan_flag_vmalloc);
 }
 
+static inline bool kasan_tag_only_on_alloc_enabled(void)
+{
+	return static_branch_unlikely(&kasan_flag_tag_only_on_alloc);
+}
+
 static inline bool kasan_async_fault_possible(void)
 {
 	return kasan_mode == KASAN_MODE_ASYNC || kasan_mode == KASAN_MODE_ASYMM;
@@ -145,12 +151,17 @@ static inline bool kasan_requires_meta(void)
 #define KASAN_SLAB_REDZONE	0xFC  /* redzone for slab object */
 #define KASAN_SLAB_FREE		0xFB  /* freed slab object */
 #define KASAN_VMALLOC_INVALID	0xF8  /* inaccessible space in vmap area */
+#elif defined(CONFIG_KASAN_HW_TAGS)
+#define KASAN_PAGE_FREE		0x0E
+#define KASAN_PAGE_REDZONE	0x1E
+#define KASAN_SLAB_REDZONE	0x2E
+#define KASAN_SLAB_FREE		0x3E
 #else
 #define KASAN_PAGE_FREE		KASAN_TAG_INVALID
 #define KASAN_PAGE_REDZONE	KASAN_TAG_INVALID
 #define KASAN_SLAB_REDZONE	KASAN_TAG_INVALID
 #define KASAN_SLAB_FREE		KASAN_TAG_INVALID
-#define KASAN_VMALLOC_INVALID	KASAN_TAG_INVALID /* only used for SW_TAGS */
+#define KASAN_VMALLOC_INVALID	KASAN_TAG_INVALID
 #endif
 
 #ifdef CONFIG_KASAN_GENERIC
@@ -478,6 +489,16 @@ static inline u8 kasan_random_tag(void) { return 0; }
 
 static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 {
+	if (kasan_tag_only_on_alloc_enabled()) {
+		if ((value != KASAN_SLAB_REDZONE) && (value != KASAN_PAGE_REDZONE)) {
+			if (init)
+				memset((void *)kasan_reset_tag(addr), 0, size);
+			return;
+		}
+	}
+
+	value |= 0xF0;
+
 	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
 		return;
 	if (WARN_ON(size & KASAN_GRANULE_MASK))
-- 
2.43.0


