Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A9BC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJEDJhtFMNSnLhy3o2OpHLDFK+OrNY4mUlH1+uIwElw=; b=dhYRJPv5OITNvk7kSr7cs78bzV
	/P4EazJ/xd0UELRReINJqSQsAX4+ANMrISXrlLVJSK9hSKq1kmVMTJJzsn2t0q8DCG8ntEEZkA845
	sXwRP8oBWkds+85JFXhZYvhg0PYGuSqYndEgzjOuqT8FH347rmFB2LYEeTRMNxVqpW9NA9K+KCLG+
	x5dgANlt88c4GfD/D6Q+OhG5pcw2Cb39jTfOz0oyr1f2ufwn/LjlQ8AEn/gMWcoI4x1aC5rcvOBcY
	CMUjU9JFi7HHOhGJwpD/9aZfMH1DnaCv2YTS7C2kWgH1mSVInswgKetUUYg554HVMsTky3t59ee6j
	yMjFtEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcvX-00000004KuN-2289;
	Thu, 27 Aug 2026 16:26:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuI-00000004JlU-3h4P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mJEDJhtFMNSnLhy3o2OpHLDFK+OrNY4mUlH1+uIwElw=;
	b=s4BuyPR4z6gvxyyhsQPmUQLxP8SwiElyHOlbrC1Eo4Rgkt/YbyWTj7n33YgGtw0nWyN69mN76
	NsVuPhOXAWVkrROAXHp01c/lc4cxcZuHQq/5FRCUYaAjOnDpMs3T63Y5vAGwjSZpB6mzq+tZFFj
	YQyUpUQJBZabrg0CIZAOjmw=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KX5cWQzJ46Yq;
	Fri, 28 Aug 2026 00:24:16 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 55E1340572;
	Fri, 28 Aug 2026 00:24:38 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:37 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 17/18] mm: init kernel modules with replication support
Date: Fri, 28 Aug 2026 00:11:57 +0800
Message-ID: <20260827161158.3618409-18-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.11]
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_092451_255418_BAF75FBC 
X-CRM114-Status: GOOD (  18.24  )
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
Reply-To: artem.kuzin@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 include/linux/moduleloader.h |  4 ++++
 kernel/module/main.c         | 17 ++++++++++++++++
 kernel/module/strict_rwx.c   | 12 +++++------
 mm/execmem.c                 | 39 +++++++++++++++++++++++++++++++-----
 4 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index e395461d59e5..1d100dfc8251 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -25,6 +25,10 @@ int module_frob_arch_sections(Elf_Ehdr *hdr,
 /* Additional bytes needed by arch in front of individual sections */
 unsigned int arch_mod_section_prepend(struct module *mod, unsigned int section);
 
+#ifdef CONFIG_KERNEL_REPLICATION
+void module_replicate(void *ptr);
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 /* Determines if the section name is an init section (that is only used during
  * module loading).
  */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index d0e1e0bd2ad0..d5c8f041be48 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -60,6 +60,7 @@
 #include <linux/codetag.h>
 #include <linux/debugfs.h>
 #include <linux/execmem.h>
+#include <linux/numa_kernel_replication.h>
 #include <uapi/linux/module.h>
 #include "internal.h"
 
@@ -1338,6 +1339,18 @@ void __weak module_arch_freeing_init(struct module *mod)
 {
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static int sections_to_replicate[] = {MOD_TEXT, MOD_RODATA};
+
+static void module_replicate_sections(struct module *mod)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sections_to_replicate); i++)
+		module_replicate(mod->mem[sections_to_replicate[i]].base);
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 {
 	unsigned int size = PAGE_ALIGN(mod->mem[type].size);
@@ -3330,6 +3343,10 @@ static int complete_formation(struct module *mod, struct load_info *info)
 	module_bug_finalize(info->hdr, info->sechdrs, mod);
 	module_cfi_finalize(info->hdr, info->sechdrs, mod);
 
+#ifdef CONFIG_KERNEL_REPLICATION
+	module_replicate_sections(mod);
+#endif
+
 	err = module_enable_rodata_ro(mod);
 	if (err)
 		goto out_strict_rwx;
diff --git a/kernel/module/strict_rwx.c b/kernel/module/strict_rwx.c
index 8fd438529fbc..07ad1af69eaa 100644
--- a/kernel/module/strict_rwx.c
+++ b/kernel/module/strict_rwx.c
@@ -39,9 +39,9 @@ int module_enable_text_rox(const struct module *mod)
 		if (mem->is_rox)
 			ret = execmem_restore_rox(mem->base, mem->size);
 		else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
-			ret = module_set_memory(mod, type, set_memory_rox);
+			ret = module_set_memory(mod, type, numa_set_memory_rox);
 		else
-			ret = module_set_memory(mod, type, set_memory_x);
+			ret = module_set_memory(mod, type, numa_set_memory_x);
 		if (ret)
 			return ret;
 	}
@@ -55,10 +55,10 @@ int module_enable_rodata_ro(const struct module *mod)
 	if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX) || !rodata_enabled)
 		return 0;
 
-	ret = module_set_memory(mod, MOD_RODATA, set_memory_ro);
+	ret = module_set_memory(mod, MOD_RODATA, numa_set_memory_ro);
 	if (ret)
 		return ret;
-	ret = module_set_memory(mod, MOD_INIT_RODATA, set_memory_ro);
+	ret = module_set_memory(mod, MOD_INIT_RODATA, numa_set_memory_ro);
 	if (ret)
 		return ret;
 
@@ -70,7 +70,7 @@ int module_enable_rodata_ro_after_init(const struct module *mod)
 	if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX) || !rodata_enabled)
 		return 0;
 
-	return module_set_memory(mod, MOD_RO_AFTER_INIT, set_memory_ro);
+	return module_set_memory(mod, MOD_RO_AFTER_INIT, numa_set_memory_ro);
 }
 
 int module_enable_data_nx(const struct module *mod)
@@ -79,7 +79,7 @@ int module_enable_data_nx(const struct module *mod)
 		return 0;
 
 	for_class_mod_mem_type(type, data) {
-		int ret = module_set_memory(mod, type, set_memory_nx);
+		int ret = module_set_memory(mod, type, numa_set_memory_nx);
 
 		if (ret)
 			return ret;
diff --git a/mm/execmem.c b/mm/execmem.c
index 74a178a87e75..ea4b15c8a788 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -16,6 +16,7 @@
 #include <linux/set_memory.h>
 #include <linux/moduleloader.h>
 #include <linux/text-patching.h>
+#include <linux/numa_kernel_replication.h>
 
 #include <asm/tlbflush.h>
 
@@ -26,8 +27,9 @@ static struct execmem_info *execmem_info __ro_after_init;
 static struct execmem_info default_execmem_info __ro_after_init;
 
 #ifdef CONFIG_MMU
-static void *execmem_vmalloc(struct execmem_range *range, size_t size,
-			     pgprot_t pgprot, unsigned long vm_flags)
+
+static void *execmem_vmalloc_node(struct execmem_range *range, size_t size,
+			     pgprot_t pgprot, unsigned long vm_flags, int node)
 {
 	bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
 	gfp_t gfp_flags = GFP_KERNEL | __GFP_NOWARN;
@@ -40,13 +42,13 @@ static void *execmem_vmalloc(struct execmem_range *range, size_t size,
 		vm_flags |= VM_DEFER_KMEMLEAK;
 
 	p = __vmalloc_node_range(size, align, start, end, gfp_flags,
-				 pgprot, vm_flags, NUMA_NO_NODE,
+				 pgprot, vm_flags, node,
 				 __builtin_return_address(0));
 	if (!p && range->fallback_start) {
 		start = range->fallback_start;
 		end = range->fallback_end;
 		p = __vmalloc_node_range(size, align, start, end, gfp_flags,
-					 pgprot, vm_flags, NUMA_NO_NODE,
+					 pgprot, vm_flags, node,
 					 __builtin_return_address(0));
 	}
 
@@ -63,6 +65,26 @@ static void *execmem_vmalloc(struct execmem_range *range, size_t size,
 	return p;
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static void *execmem_vmalloc_type(struct execmem_range *range, size_t size,
+			     pgprot_t pgprot, unsigned long vm_flags, enum execmem_type type)
+{
+	if (is_text_replicated() && (type == EXECMEM_MODULE_TEXT || type == EXECMEM_MODULE_DATA))
+		/* Need to specify some numa node id for correct allocation and further replication */
+		return execmem_vmalloc_node(range, size, pgprot,
+					vm_flags | VM_NUMA_SHARED, numa_node_id());
+	else
+		return execmem_vmalloc_node(range, size, pgprot,
+					vm_flags, NUMA_NO_NODE);
+}
+#else
+static void *execmem_vmalloc_type(struct execmem_range *range, size_t size,
+			     pgprot_t pgprot, unsigned long vm_flags, enum execmem_type type)
+{
+	return execmem_vmalloc_node(range, size, pgprot, vm_flags, NUMA_NO_NODE);
+}
+#endif
+
 struct vm_struct *execmem_vmap(size_t size)
 {
 	struct execmem_range *range = &execmem_info->ranges[EXECMEM_MODULE_DATA];
@@ -87,6 +109,13 @@ static void *execmem_vmalloc(struct execmem_range *range, size_t size,
 #endif /* CONFIG_MMU */
 
 #ifdef CONFIG_ARCH_HAS_EXECMEM_ROX
+
+static void *execmem_vmalloc(struct execmem_range *range, size_t size,
+			     pgprot_t pgprot, unsigned long vm_flags)
+{
+	return execmem_vmalloc_node(range, size, pgprot, vm_flags, NUMA_NO_NODE);
+}
+
 struct execmem_cache {
 	struct mutex mutex;
 	struct maple_tree busy_areas;
@@ -475,7 +504,7 @@ void *execmem_alloc(enum execmem_type type, size_t size)
 	if (use_cache)
 		p = execmem_cache_alloc(range, size);
 	else
-		p = execmem_vmalloc(range, size, pgprot, vm_flags);
+		p = execmem_vmalloc_type(range, size, pgprot, vm_flags, type);
 
 	return kasan_reset_tag(p);
 }
-- 
2.34.1


