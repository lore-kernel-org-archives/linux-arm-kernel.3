Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9A3C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkcdapIGW4RxTiLPx+DO8uuzWqNmooyhO69bXNbCQ5o=; b=BaIrISzylvOAhKbBi06qyqAeac
	Dz1E/zvVbURjrXbaSGSH/zin0kboSQ4wfD/JYX/nmqrPgLbkV8MCrwiSIPeo7gBTLYR1tqcTLRCxA
	aopjncL7CkAUlYIL4n5RiBiHf2d7Aaz88OLbHtMtBGRduSxq2to4CVRsrQ1a81SXHxPxI4g3xz+dF
	04+GpP7h/yHDtgmsb6sdDdxNJpgv88ZgIwjGFNNvhxUJXJuJGTdfNEPFWWmv4aZqyztoWUaxgnywY
	u8dPUHe4RvNkdQJmOUNDFrNndM/nLR3fuaQWENmzWqKMww+B+epWQQ3N84GifXIs0+zyANPB30nHp
	84i7owUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYi-0000000EOsU-2pI1;
	Wed, 02 Sep 2026 10:51:12 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYg-0000000EOre-25M5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:11 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so5804235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346268; x=1788951068; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkcdapIGW4RxTiLPx+DO8uuzWqNmooyhO69bXNbCQ5o=;
        b=HHRSl0DyLqA+8GWlHIoNUwWOGz4NCxUNg7PKgE7kBDX3sqdy2fmsiZy9DtQydOYdUC
         wasEsNE7UBrIBEcHvUS7emxdxEWUQ6JvZ2zaQvqgciosxTDSN6xwPvmdCKwb0ORnAo9c
         v0vpSwvUT2AmEp3ZfrrCzwA3grpL4ilXbeGNpVuGxW3CNsoDSBsDSbrZ4377uknOeGeQ
         q+uXFjraRZYVEDY8yr1b1hnJwjT4q1+3nzL+udMjrztB/EYCoedfDXmnJ+hsVSpIPEtS
         uaAAfIvsHIwsz623vUSaSy+zp68iTMaOFMEWrpqF5R6iNUNveMLnV2GDOkLh6WOD1SBK
         7tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346268; x=1788951068;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkcdapIGW4RxTiLPx+DO8uuzWqNmooyhO69bXNbCQ5o=;
        b=BkniSZWvIBkbZB+MFiAb1ousjAmiRbNo02cie/JNRyu6zgJUHw23F7E6s881PoVox1
         GZv7NM1ceF4QKElqP0tVQ47eBojm+jjRxxL0hyr9BwAwf14rdesZgbaEaawhakUyLvWb
         irRo+FbS5BZ2tietqAcfVbAuB2Ju4s777E6CVVyOiluvZ2AJ6bhEwpWen8mZYAqU2tQY
         BtlT8v1nfaIPtFVNY6oBllaeOcLmoL1hcAztyMYjXJQXYC/vvJyN9BWpFsuWfBDW6744
         d2GA7OVdmyz/2P/XCCQ4mKPVP427nuZiOB9PaO1K7+ZypXA1q9C1YqiL94O4pz4UO8gT
         coTA==
X-Forwarded-Encrypted: i=1; AHgh+RrbFIvgkmdDT4cylWsXrRS2Z+sfUCBush9y0il8vhQXWfETuT/KW5iNH68LFE7n2bi1Mtc8rNa5aq7VMikf9+NM@lists.infradead.org
X-Gm-Message-State: AFuF++nkhbmPn0kIN09rF1tnfX+dbBpXaDES5hiZVSY4FQdiB2Pv8vLE
	SptvOxTIRmHwfTMT84tcpJVSeJPHkLS9HuTa8h8bSLOZoOFqUEYbNUTb1lCKs4TCHcebI1lY570
	r2+Lujwyq6NaIpBkHHWddkw==
X-Received: from wmph35.prod.google.com ([2002:a05:600c:49a3:b0:499:b2be:d4b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c4a6:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49ce581142cmr69791455e9.8.1788346267736;
 Wed, 02 Sep 2026 03:51:07 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:03 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-2-vdonnefort@google.com>
Subject: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_035110_559797_E86B7F8E 
X-CRM114-Status: GOOD (  17.09  )
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

Keeping last-level mappings is interesting on some architectures as it
allows mapping/unmapping pages from the kernel direct map without the
risk of splitting blocks which, under the break-before-make rule, may
trigger page-faults the kernel can't handle.

However, mapping the entire direct map at PTE-level is costly. So
instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system
to decide which region must be covered by mappings up to the last-level.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d62db9e776cf..d40a5ded188d 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_LLMAP: memory region to be mapped using last-level mapping
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +64,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_LLMAP		= 0x100,/* last-level mapping */
 };
 
 /**
@@ -160,6 +162,8 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_llmap(phys_addr_t base, phys_addr_t size);
+int memblock_clear_llmap(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 void reset_all_zones_managed_pages(void);
@@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_SCRATCH;
 }
 
+static inline bool memblock_is_llmap(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_LLMAP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..1591b50503ed 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1119,6 +1119,16 @@ int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
  */
 int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
 {
+	struct memblock_region *r;
+
+	memblock_cap_size(base, &size);
+
+	for_each_mem_region(r) {
+		if (memblock_is_llmap(r) &&
+		    memblock_addrs_overlap(base, size, r->base, r->size))
+			return -EINVAL;
+	}
+
 	return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
 }
 
@@ -1204,6 +1214,45 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
 }
 
+/**
+ * memblock_mark_llmap - Mark a memory region with flag MEMBLOCK_LLMAP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * If supported by the architecture, such region is mapped at the last-level in
+ * the kernel direct map.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_llmap(phys_addr_t base, phys_addr_t size)
+{
+	struct memblock_region *r;
+
+	memblock_cap_size(base, &size);
+
+	for_each_mem_region(r) {
+		if (memblock_is_nomap(r) &&
+		    memblock_addrs_overlap(base, size, r->base, r->size))
+			return -EINVAL;
+	}
+
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_LLMAP);
+}
+
+/**
+ * memblock_clear_llmap - Clear flag MEMBLOCK_LLMAP for a specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_llmap(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 0,
+				    MEMBLOCK_LLMAP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2886,6 +2935,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_LLMAP)] = "LLMAP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.55.0.970.g62bdec98f9-goog


