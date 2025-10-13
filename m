Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9E8CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLYbqQYqmcQY3wJBuAGPh5xSeu4NAXpfmbKzx1y1YyA=; b=JKbcBmFAw0ZS+Evf52+hAuMFBe
	l0eZBMvoDjsS/2y6LpvaJyicXI4nL2ZhGffWs5QmQl3vw2IM7nIX/PCNrhTXyuutrHDVP9OZlXdnr
	Pt6cRqszp7WJBXj7XupQ4l5imH4dq9dRmV1NbaQ1rRufjyAYEFZkx+MWTsflp38SvXBLQJuOrpI2Q
	Cv0q31M6HjjWRCySo1IoFD9SV8l4LSEg8XtwcfmDmpe+FDHRii56OQ9tf/05dUW5fit6yAIP0bD98
	3ilVrweeQYVgAmbaIpfH/2holwiYebxrdCpBZpZBPOXfHJ7jXiL6NRT3fx7mhOzE1/cbKlwfFVk3N
	AR3J6+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KH5-0000000Db6p-1NmZ;
	Mon, 13 Oct 2025 15:15:47 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KH2-0000000Db4u-3xCz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:15:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so3909107f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760368543; x=1760973343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLYbqQYqmcQY3wJBuAGPh5xSeu4NAXpfmbKzx1y1YyA=;
        b=RP0CsrYjor+Kbv3AHKt7SiNivr0Wy2mVg6ER+IPqfubqjiYrQan2jQf4ZCH90fKSTi
         nnJtQSMR1soLf0HKA7TUfk1NIwzg1n2995BMhH1k8L07D9VxiGwXJrJA1xzSoolYU1UL
         OgL/8dTbHzCfF5qMTI3/4tbbZi2iRtmyRCXtj/EVUnaIlNVYXOXlfnYuR+7lhu88ab11
         yu4rago4VgSP7ScBddWjRGzFU/m7MUvjeVnI+ZnLtxnvGNK/uL4UqKy47T18FW+husYj
         nZ2S+uA/R48eEWPOZdaZ2K9d4r9bZXLLCzKqMqayIQttLrEo5BjRw+jWKFl+TP0BzuDa
         boPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760368543; x=1760973343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLYbqQYqmcQY3wJBuAGPh5xSeu4NAXpfmbKzx1y1YyA=;
        b=IclAz6ZUQEk4aaT4AtrH2pF8UoSQJ2q6AjRzcEkCQnoj4TMI+F8EzQ1lg+Fx39m6C4
         rxGj283TEEKKxZvTaHYgFH+PpEJWZLHaz/3mFOCCcRTuLUGQMCXL1TWs2gT+nx4rttKH
         QTa+7wVZfS7yl1lI7xrAe5PSEwp4SwPfEUxiNV4lqdZ/Wh+2f2GHPTCLLOD5uWKjVryK
         zRfoh/F/oiVY0r+himok+c1+tTNx90/eEJDHBAzIgruNfJq2b5wmmMj55y5hlw/p3EzI
         xcQGTYGqK9QlqDsCTaFl/dnuMMG1lNMUZmm1T+feUY27jRqXWgjywQVpQmLV30lLmJvS
         IXKg==
X-Gm-Message-State: AOJu0YwP3du+XQz3kvlkRP03fiEXq+ys3rmIAH0UTZdfoHIJMlHCuozK
	VjkIkAWchSGwWVq1lwp4hGlGwHgVJIFLc31CWyTiMitAb10A40sbJYuv+JNVkGi3+3A=
X-Gm-Gg: ASbGncsqxRqeiGcoJHpZQRFwDC3NSuJeomf6WK6eywFO1sif7Oy4Pmsb5lMPjS2bMAG
	+kyUL5zHZIFtAUIpzPUUaYfpjyMRoTLiHyzKrObZPrKz9uy9SnRtN2gU6J2WwpuIxKGtUAtEALs
	XmYmCBU7AWpupOoCyAayElhXx6nlt+LBtdQLN46MFOJZGwcyZo0lxfoNl++xWyCymy5iUg4el9H
	gXvVTY9P2iaJ3+SXR/JRmnqyHjD2kAuQlEfh+PpqrtNpviuwuiZFQT3fFjCcGmjdl6h3qWHQrTT
	Ih1zhkUsT2hT+Rgw1QNyCLYAkEpwAxljlH+uYqQ2oTYbBlX6vvgFpp7T3J+4RbUEfsaiHXwJi5F
	Dxr3mqQ6YtEOZrV6CISfFDUWYdeUqe/Llx6efsYwQgxYvsnjZlB1VOzXwBWvlj6gvgPrqu+PLl9
	NAI2WcBL+P9fzA
X-Google-Smtp-Source: AGHT+IE9zlOlbVnY6c4mqUvwqDeCMMoCYAPViy3XjaJiR1Ci1mNMSZAQ1fXIrojF5Q1nql2O2YXVRQ==
X-Received: by 2002:a05:6000:26c2:b0:3e1:9b75:f0b8 with SMTP id ffacd0b85a97d-4266e8dc01amr14203715f8f.47.1760368542568;
        Mon, 13 Oct 2025 08:15:42 -0700 (PDT)
Received: from myrica.home (90.149.115.87.dyn.plus.net. [87.115.149.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57cc0esm18856169f8f.6.2025.10.13.08.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:15:41 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH] arm64: mm: Support memory hotplug in a Realm
Date: Mon, 13 Oct 2025 16:09:39 +0100
Message-ID: <20251013150938.1428357-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_081545_180765_1CAEA8A1 
X-CRM114-Status: GOOD (  18.66  )
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

Call the RIPAS change functions when adding and removing memory to/from
a Realm.

The host initiates hotplug and the guest uses a range of predefined
guest-physical addresses to install the new memory blocks. This patch
then switches the RIPAS of those blocks from EMPTY to RAM. The guest can
then online the blocks and use them.

Unplug is initiated by the host as well. After offlining the blocks
the guest removes the mapping, and this patch switches the RIPAS from
RAM to EMPTY.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
To test this with a CCA-enabled host and virtio-mem:
    $ qemu-system-aarch64
        -m 1G,maxmem=1T
        -M confidential-guest-support=rme0 -object rme-guest,id=rme0
        -object memory-backend-ram,id=mem0,size=1G
        -device virtio-mem-pci,id=hpm0,memdev=mem0,node=0
        ...

Make offlining more likely to succeed:
    # echo online_movable > /sys/devices/system/memory/auto_online_blocks

Plug and unplug some memory (2M granule)
    (qemu) qom-set hpm0 requested-size 1G
    (qemu) qom-set hpm0 requested-size 256M

Or via ACPI hotplug (requires EDK2 with Realm support)
    (qemu) object_add memory-backend-ram,id=mem1,size=1G
    (qemu) device_add pc-dimm,id=dimm1,memdev=mem1
    (qemu) device_del dimm1
    (qemu) object_del mem1
---
 arch/arm64/include/asm/rsi.h |  3 +++
 arch/arm64/kernel/rsi.c      | 23 +++++++++++++++++++++++
 arch/arm64/mm/mmu.c          | 11 +++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index 88b50d660e85a..5ffc7e40a1f32 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -18,6 +18,9 @@ void __init arm64_rsi_init(void);
 
 bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
 
+int arm64_rsi_add_memory(phys_addr_t start, phys_addr_t end);
+int arm64_rsi_remove_memory(phys_addr_t start, phys_addr_t end);
+
 static inline bool is_realm_world(void)
 {
 	return static_branch_unlikely(&rsi_present);
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index c64a06f58c0bc..b983b85f03dfb 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -138,6 +138,29 @@ static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
 	return 0;
 }
 
+/*
+ * Convert a range of IPAs from EMPTY to RAM
+ */
+int arm64_rsi_add_memory(phys_addr_t start, phys_addr_t end)
+{
+	if (!is_realm_world())
+		return 0;
+
+	return rsi_set_memory_range_protected(start, end);
+}
+
+/*
+ * Convert a range of IPAs from RAM to EMPTY. The pages will be wiped by
+ * UNDELEGATE before being returned to the host.
+ */
+int arm64_rsi_remove_memory(phys_addr_t start, phys_addr_t end)
+{
+	if (!is_realm_world())
+		return 0;
+
+	return rsi_set_memory_range_shared(start, end);
+}
+
 void __init arm64_rsi_init(void)
 {
 	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b8d37eb037fcc..095b094e8a82f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -44,6 +44,7 @@
 #include <asm/tlbflush.h>
 #include <asm/pgalloc.h>
 #include <asm/kfence.h>
+#include <asm/rsi.h>
 
 #define NO_BLOCK_MAPPINGS	BIT(0)
 #define NO_CONT_MAPPINGS	BIT(1)
@@ -1874,6 +1875,10 @@ int arch_add_memory(int nid, u64 start, u64 size,
 
 	VM_BUG_ON(!mhp_range_allowed(start, size, true));
 
+	ret = arm64_rsi_add_memory(start, start + size);
+	if (ret)
+		return ret;
+
 	if (force_pte_mapping())
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
@@ -1885,10 +1890,11 @@ int arch_add_memory(int nid, u64 start, u64 size,
 
 	ret = __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
 			   params);
-	if (ret)
+	if (ret) {
 		__remove_pgd_mapping(swapper_pg_dir,
 				     __phys_to_virt(start), size);
-	else {
+		WARN_ON(arm64_rsi_remove_memory(start, start + size));
+	} else {
 		/* Address of hotplugged memory can be smaller */
 		max_pfn = max(max_pfn, PFN_UP(start + size));
 		max_low_pfn = max_pfn;
@@ -1904,6 +1910,7 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 
 	__remove_pages(start_pfn, nr_pages, altmap);
 	__remove_pgd_mapping(swapper_pg_dir, __phys_to_virt(start), size);
+	WARN_ON(arm64_rsi_remove_memory(start, start + size));
 }
 
 /*

base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.51.0


