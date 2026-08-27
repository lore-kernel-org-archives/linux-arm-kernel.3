Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A592C61DD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNCReT8Lzve2ehkzvtK73NbFcLcN4IwvjOltd7sg6Kg=; b=QoTsTTifJQw4VxUw5xAs2fW/T/
	T/pgUMOOKmTQQ0eYAerySVTdueStB6kiCUUANsQIv/jKCNWH0MdER3rwn9IRhbe1dHY3WEmiXJqUV
	cOwC45DGPKqXJqrG4D2KL7BAjFzxyuyogQcgsOD8Vz/Kzb1/Hty6GQR+0tm1kZi/PXgnhdH00TpNo
	278JGBskSohRHeppSadOT+xiDc/Uy0tIzDOLPPQts5Ocej0tLJXrBcFmeY6PRyM1gjcVCEExsvu3A
	BzUPWwkbJ9oJIUFg4d+URUGZWnqf+xMkwXiSuOp0Y0n2Nc3TPBtJ6HQ1ybb5F07YrN7HxtxZs3u8d
	O/5zEHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuN-00000004JpU-3FKp;
	Thu, 27 Aug 2026 16:24:55 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuC-00000004JhK-1fk2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oNCReT8Lzve2ehkzvtK73NbFcLcN4IwvjOltd7sg6Kg=;
	b=JLBHyYAHtKjETVOWSQdRRaXKVmJlMrZo/0ndCMHzFlXt3vDgP2gdxYdssFZ4wAwCG6dV9MMtb
	JQbMX6trjFE7wWXqdyI1ynnBZ6QPKRw865Tiqf/uYnhHJiska3VMxXEcATghutitWDhxgKETTer
	pJol0tV+AUj0F9LOFfq2Oww=
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KW2znVzJ469r;
	Fri, 28 Aug 2026 00:24:15 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id F01ED4058D;
	Fri, 28 Aug 2026 00:24:36 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:36 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 08/18] mm: set memory permissions for BPF handlers replicas
Date: Fri, 28 Aug 2026 00:11:48 +0800
Message-ID: <20260827161158.3618409-9-panov.nikita@huawei.com>
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
X-CRM114-CacheID: sfid-20260827_092444_891568_89417BE1 
X-CRM114-Status: GOOD (  12.86  )
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
 arch/arm64/net/bpf_jit_comp.c    |  4 ++--
 include/asm-generic/set_memory.h | 14 ++++++++++++++
 include/linux/set_memory.h       | 14 --------------
 kernel/bpf/core.c                |  4 ++--
 kernel/bpf/trampoline.c          |  2 +-
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..588d1b2a2753 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -3236,10 +3236,10 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 		/* non-zero plt_target indicates we're patching a bpf prog,
 		 * which is read only.
 		 */
-		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1))
+		if (numa_set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1))
 			return -EFAULT;
 		WRITE_ONCE(plt->target, plt_target);
-		set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);
+		numa_set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);
 		/* since plt target points to either the new trampoline
 		 * or dummy_tramp, even if another CPU reads the old plt
 		 * target value before fetching the bl instruction to plt,
diff --git a/include/asm-generic/set_memory.h b/include/asm-generic/set_memory.h
index c86abf6bc7ba..4c97978d2bfb 100644
--- a/include/asm-generic/set_memory.h
+++ b/include/asm-generic/set_memory.h
@@ -10,4 +10,18 @@ int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
 
+#ifdef CONFIG_KERNEL_REPLICATION
+int numa_set_memory_ro(unsigned long addr, int numpages);
+int numa_set_memory_rw(unsigned long addr, int numpages);
+int numa_set_memory_x(unsigned long addr, int numpages);
+int numa_set_memory_nx(unsigned long addr, int numpages);
+#else
+
+#define numa_set_memory_ro set_memory_ro
+#define numa_set_memory_rw set_memory_rw
+#define numa_set_memory_x  set_memory_x
+#define numa_set_memory_nx set_memory_nx
+
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 #endif
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 03fccacef037..00b21d1c4331 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -8,20 +8,6 @@
 #ifdef CONFIG_ARCH_HAS_SET_MEMORY
 #include <asm/set_memory.h>
 
-#ifdef CONFIG_KERNEL_REPLICATION
-int numa_set_memory_ro(unsigned long addr, int numpages);
-int numa_set_memory_rw(unsigned long addr, int numpages);
-int numa_set_memory_x(unsigned long addr, int numpages);
-int numa_set_memory_nx(unsigned long addr, int numpages);
-#else
-
-#define numa_set_memory_ro set_memory_ro
-#define numa_set_memory_rw set_memory_rw
-#define numa_set_memory_x  set_memory_x
-#define numa_set_memory_nx set_memory_nx
-
-#endif /* CONFIG_KERNEL_REPLICATION */
-
 #else
 static inline int __must_check set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int __must_check set_memory_rw(unsigned long addr, int numpages) { return 0; }
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 8b294dfc1ad4..854db8e9dcf7 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -939,7 +939,7 @@ static struct bpf_prog_pack *alloc_new_pack(bpf_jit_fill_hole_t bpf_fill_ill_ins
 	if (!bpf_jit_mem_is_rox()) {
 		bpf_fill_ill_insns(pack->ptr, BPF_PROG_PACK_SIZE);
 		set_vm_flush_reset_perms(pack->ptr);
-		err = set_memory_rox((unsigned long)pack->ptr,
+		err = numa_set_memory_rox((unsigned long)pack->ptr,
 				     BPF_PROG_PACK_SIZE / PAGE_SIZE);
 		if (err)
 			goto out;
@@ -977,7 +977,7 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool
 
 			bpf_fill_ill_insns(ptr, size);
 			set_vm_flush_reset_perms(ptr);
-			err = set_memory_rox((unsigned long)ptr,
+			err = numa_set_memory_rox((unsigned long)ptr,
 					     size / PAGE_SIZE);
 			if (err) {
 				bpf_jit_free_exec(ptr);
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 90b70ea0d370..66656eb4714a 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -1508,7 +1508,7 @@ void __weak arch_free_bpf_trampoline(void *image, unsigned int size)
 int __weak arch_protect_bpf_trampoline(void *image, unsigned int size)
 {
 	WARN_ON_ONCE(size > PAGE_SIZE);
-	return set_memory_rox((long)image, 1);
+	return numa_set_memory_rox((long)image, 1);
 }
 
 int __weak arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
-- 
2.34.1


