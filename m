Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2F1CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 19:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+31wXn/low5JC7UymuA++AaJ/YjM9ZTp4UXMP2CfMoA=; b=yo/2sUIE88lIiKu/X1irYsDqcr
	BrLiw9s1+RH2MUf925JBwTTu6WSXrTQ3toXNGvrL34yTC38kN9o3qzbjQylrqw2k4Y31mWXDRx520
	FnJI8ATteW/whc3t0xw//XVHO8f1rqA31XZvwsItZcQ9AwgPWElBRwOB7WusNoYAHzvg8zjTrYBze
	jw6Gexa83CUO0eeLSF6V5GHj6ikKO/Mznv2529lpzIBd4lGQXmmh9Acr29a9V/UKxLNCPrZD8xasw
	kThOajkUxr9Ny3KZ+0Lb5waj80ADNAwXpteda/JK5hu1PmNAwVgQdOCVyxSW8NJDipAQqmIqRo/NG
	OIILucWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulY8u-00000008vXl-07H1;
	Mon, 11 Aug 2025 19:25:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWRr-00000008ZMO-2hMu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 17:36:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C99A22680;
	Mon, 11 Aug 2025 10:36:30 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E3AD3F63F;
	Mon, 11 Aug 2025 10:36:34 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	scott@os.amperecomputing.com,
	jhubbard@nvidia.com,
	pankaj.gupta@amd.com,
	leitao@debian.org,
	kaleshsingh@google.com,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	james.morse@arm.com,
	ardb@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	david@redhat.com,
	yang@os.amperecomputing.com
Cc: kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 1/2] kasan/hw-tags: introduce store only mode
Date: Mon, 11 Aug 2025 18:36:25 +0100
Message-Id: <20250811173626.1878783-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811173626.1878783-1-yeoreum.yun@arm.com>
References: <20250811173626.1878783-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_103639_763006_BFACB140 
X-CRM114-Status: GOOD (  21.33  )
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

Since Armv8.9, FEATURE_MTE_STORE_ONLY feature is introduced to restrict
raise of tag check fault on store operation only.
Introcude KASAN store only mode based on this feature.

KASAN store only mode restricts KASAN checks operation for store only and
omits the checks for fetch/read operation when accessing memory.
So it might be used not only debugging enviroment but also normal
enviroment to check memory safty.

This features can be controlled with "kasan.stonly" arguments.
When "kasan.stonly=on", KASAN checks store only mode otherwise
KASAN checks all operations.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 Documentation/dev-tools/kasan.rst  |  3 ++
 arch/arm64/include/asm/memory.h    |  1 +
 arch/arm64/include/asm/mte-kasan.h |  6 +++
 arch/arm64/kernel/cpufeature.c     |  6 +++
 arch/arm64/kernel/mte.c            | 14 ++++++
 include/linux/kasan.h              |  2 +
 mm/kasan/hw_tags.c                 | 76 +++++++++++++++++++++++++++++-
 mm/kasan/kasan.h                   | 10 ++++
 8 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 0a1418ab72fd..7567a2ca0e39 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -163,6 +163,9 @@ disabling KASAN altogether or controlling its features:
   This parameter is intended to allow sampling only large page_alloc
   allocations, which is the biggest source of the performance overhead.
 
+- ``kasan.stonly=off`` or ``kasan.stonly=on`` controls whether KASAN checks
+  store operation only or all operation.
+
 Error reports
 ~~~~~~~~~~~~~
 
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 5213248e081b..9d8c72c9c91f 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -308,6 +308,7 @@ static inline const void *__tag_set(const void *addr, u8 tag)
 #define arch_enable_tag_checks_sync()		mte_enable_kernel_sync()
 #define arch_enable_tag_checks_async()		mte_enable_kernel_async()
 #define arch_enable_tag_checks_asymm()		mte_enable_kernel_asymm()
+#define arch_enable_tag_checks_stonly()	mte_enable_kernel_stonly()
 #define arch_suppress_tag_checks_start()	mte_enable_tco()
 #define arch_suppress_tag_checks_stop()		mte_disable_tco()
 #define arch_force_async_tag_fault()		mte_check_tfsr_exit()
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mte-kasan.h
index 2e98028c1965..d75908ed9d0f 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -200,6 +200,7 @@ static inline void mte_set_mem_tag_range(void *addr, size_t size, u8 tag,
 void mte_enable_kernel_sync(void);
 void mte_enable_kernel_async(void);
 void mte_enable_kernel_asymm(void);
+int mte_enable_kernel_stonly(void);
 
 #else /* CONFIG_ARM64_MTE */
 
@@ -251,6 +252,11 @@ static inline void mte_enable_kernel_asymm(void)
 {
 }
 
+static inline int mte_enable_kenrel_stonly(void)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_ARM64_MTE */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9ad065f15f1d..fdc510fe0187 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2404,6 +2404,11 @@ static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
 
 	kasan_init_hw_tags_cpu();
 }
+
+static void cpu_enable_mte_stonly(struct arm64_cpu_capabilities const *cap)
+{
+	kasan_late_init_hw_tags_cpu();
+}
 #endif /* CONFIG_ARM64_MTE */
 
 static void user_feature_fixup(void)
@@ -2922,6 +2927,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.capability = ARM64_MTE_STORE_ONLY,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.matches = has_cpuid_feature,
+		.cpu_enable = cpu_enable_mte_stonly,
 		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, MTESTOREONLY, IMP)
 	},
 #endif /* CONFIG_ARM64_MTE */
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index e5e773844889..a1cb2a8a79a1 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -157,6 +157,20 @@ void mte_enable_kernel_asymm(void)
 		mte_enable_kernel_sync();
 	}
 }
+
+int mte_enable_kernel_stonly(void)
+{
+	if (!cpus_have_cap(ARM64_MTE_STORE_ONLY))
+		return -EINVAL;
+
+	sysreg_clear_set(sctlr_el1, SCTLR_EL1_TCSO_MASK,
+			 SYS_FIELD_PREP(SCTLR_EL1, TCSO, 1));
+	isb();
+
+	pr_info_once("MTE: enabled stonly mode at EL1\n");
+
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_KASAN_HW_TAGS
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 890011071f2b..28951b29c593 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -552,9 +552,11 @@ static inline void kasan_init_sw_tags(void) { }
 #ifdef CONFIG_KASAN_HW_TAGS
 void kasan_init_hw_tags_cpu(void);
 void __init kasan_init_hw_tags(void);
+void kasan_late_init_hw_tags_cpu(void);
 #else
 static inline void kasan_init_hw_tags_cpu(void) { }
 static inline void kasan_init_hw_tags(void) { }
+static inline void kasan_late_init_hw_tags_cpu(void) { }
 #endif
 
 #ifdef CONFIG_KASAN_VMALLOC
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index 9a6927394b54..2caa6fe5ed47 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -41,9 +41,16 @@ enum kasan_arg_vmalloc {
 	KASAN_ARG_VMALLOC_ON,
 };
 
+enum kasan_arg_stonly {
+	KASAN_ARG_STONLY_DEFAULT,
+	KASAN_ARG_STONLY_OFF,
+	KASAN_ARG_STONLY_ON,
+};
+
 static enum kasan_arg kasan_arg __ro_after_init;
 static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
 static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
+static enum kasan_arg_stonly kasan_arg_stonly __ro_after_init;
 
 /*
  * Whether KASAN is enabled at all.
@@ -67,6 +74,9 @@ DEFINE_STATIC_KEY_FALSE(kasan_flag_vmalloc);
 #endif
 EXPORT_SYMBOL_GPL(kasan_flag_vmalloc);
 
+DEFINE_STATIC_KEY_FALSE(kasan_flag_stonly);
+EXPORT_SYMBOL_GPL(kasan_flag_stonly);
+
 #define PAGE_ALLOC_SAMPLE_DEFAULT	1
 #define PAGE_ALLOC_SAMPLE_ORDER_DEFAULT	3
 
@@ -141,6 +151,23 @@ static int __init early_kasan_flag_vmalloc(char *arg)
 }
 early_param("kasan.vmalloc", early_kasan_flag_vmalloc);
 
+/* kasan.stonly=off/on */
+static int __init early_kasan_flag_stonly(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (!strcmp(arg, "off"))
+		kasan_arg_stonly = KASAN_ARG_STONLY_OFF;
+	else if (!strcmp(arg, "on"))
+		kasan_arg_stonly = KASAN_ARG_STONLY_ON;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+early_param("kasan.stonly", early_kasan_flag_stonly);
+
 static inline const char *kasan_mode_info(void)
 {
 	if (kasan_mode == KASAN_MODE_ASYNC)
@@ -219,6 +246,20 @@ void kasan_init_hw_tags_cpu(void)
 	kasan_enable_hw_tags();
 }
 
+/*
+ * kasan_late_init_hw_tags_cpu_post() is called for each CPU after
+ * all cpus are bring-up at boot.
+ * Not marked as __init as a CPU can be hot-plugged after boot.
+ */
+void kasan_late_init_hw_tags_cpu(void)
+{
+	/*
+	 * Enable stonly mode only when explicitly requested through the command line.
+	 * If system doesn't support, kasan checks all operation.
+	 */
+	kasan_enable_stonly();
+}
+
 /* kasan_init_hw_tags() is called once on boot CPU. */
 void __init kasan_init_hw_tags(void)
 {
@@ -257,15 +298,28 @@ void __init kasan_init_hw_tags(void)
 		break;
 	}
 
+	switch (kasan_arg_stonly) {
+	case KASAN_ARG_STONLY_DEFAULT:
+		/* Default is specified by kasan_flag_stonly definition. */
+		break;
+	case KASAN_ARG_STONLY_OFF:
+		static_branch_disable(&kasan_flag_stonly);
+		break;
+	case KASAN_ARG_STONLY_ON:
+		static_branch_enable(&kasan_flag_stonly);
+		break;
+	}
+
 	kasan_init_tags();
 
 	/* KASAN is now initialized, enable it. */
 	static_branch_enable(&kasan_flag_enabled);
 
-	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s)\n",
+	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s stonly=%s\n",
 		kasan_mode_info(),
 		str_on_off(kasan_vmalloc_enabled()),
-		str_on_off(kasan_stack_collection_enabled()));
+		str_on_off(kasan_stack_collection_enabled()),
+		str_on_off(kasan_stonly_enabled()));
 }
 
 #ifdef CONFIG_KASAN_VMALLOC
@@ -394,6 +448,22 @@ void kasan_enable_hw_tags(void)
 		hw_enable_tag_checks_sync();
 }
 
+void kasan_enable_stonly(void)
+{
+	if (kasan_arg_stonly == KASAN_ARG_STONLY_ON) {
+		if (hw_enable_tag_checks_stonly()) {
+			static_branch_disable(&kasan_flag_stonly);
+			kasan_arg_stonly = KASAN_ARG_STONLY_OFF;
+			pr_warn_once("KernelAddressSanitizer: store only mode isn't supported (hw-tags)\n");
+		}
+	}
+}
+
+bool kasan_stonly_enabled(void)
+{
+	return static_branch_unlikely(&kasan_flag_stonly);
+}
+
 #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
 
 EXPORT_SYMBOL_IF_KUNIT(kasan_enable_hw_tags);
@@ -404,4 +474,6 @@ VISIBLE_IF_KUNIT void kasan_force_async_fault(void)
 }
 EXPORT_SYMBOL_IF_KUNIT(kasan_force_async_fault);
 
+EXPORT_SYMBOL_IF_KUNIT(kasan_stonly_enabled);
+
 #endif
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e64..cfbcebdbcbec 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -33,6 +33,7 @@ static inline bool kasan_stack_collection_enabled(void)
 #include "../slab.h"
 
 DECLARE_STATIC_KEY_TRUE(kasan_flag_vmalloc);
+DECLARE_STATIC_KEY_FALSE(kasan_flag_stonly);
 
 enum kasan_mode {
 	KASAN_MODE_SYNC,
@@ -428,6 +429,7 @@ static inline const void *arch_kasan_set_tag(const void *addr, u8 tag)
 #define hw_enable_tag_checks_sync()		arch_enable_tag_checks_sync()
 #define hw_enable_tag_checks_async()		arch_enable_tag_checks_async()
 #define hw_enable_tag_checks_asymm()		arch_enable_tag_checks_asymm()
+#define hw_enable_tag_checks_stonly()		arch_enable_tag_checks_stonly()
 #define hw_suppress_tag_checks_start()		arch_suppress_tag_checks_start()
 #define hw_suppress_tag_checks_stop()		arch_suppress_tag_checks_stop()
 #define hw_force_async_tag_fault()		arch_force_async_tag_fault()
@@ -437,10 +439,18 @@ static inline const void *arch_kasan_set_tag(const void *addr, u8 tag)
 			arch_set_mem_tag_range((addr), (size), (tag), (init))
 
 void kasan_enable_hw_tags(void);
+void kasan_enable_stonly(void);
+bool kasan_stonly_enabled(void);
 
 #else /* CONFIG_KASAN_HW_TAGS */
 
 static inline void kasan_enable_hw_tags(void) { }
+static inline void kasan_enable_stonly(void) { }
+
+static inline bool kasan_stonly_enabled(void)
+{
+	return false;
+}
 
 #endif /* CONFIG_KASAN_HW_TAGS */
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


