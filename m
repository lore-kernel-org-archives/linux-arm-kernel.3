Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEEDC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmhXowTIOzHcHY7UkEdd72g+gSt6KBOTf5gqmJgT9x4=; b=mYe+lcPz8ZJb5o0Zh7Nc/pxEtH
	s0qXi3LGbSpL1IXONGoWo15UyLHtQWy96bia7tsY1xkq1x1LwMxng9Gt8IzFEzT6zDic/8Ogjjfvn
	QVmgqK/yXuYrrMue1yUaP3LRuQqS7FMQKa60UA9k55g0RDQG7kN9/MUapKu9WRdSmQ04DKobdmMGW
	pd9NPXGrJV55j4P8pf95CgnmPdPO3z8WhXajjHY3AAa74Wq7V4RDxM9ATUVZwkOCjL/7AsTfAcMsq
	fqGrdy8Cugf0XZWgYMPpPhiPXSFxXEzoRBv0pS1dwz1bDeqUrONWwECYT/u+/uvBK9xYd5wjWmZcd
	Na14Nmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYl-0000000EOuP-06ad;
	Wed, 02 Sep 2026 10:51:15 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYi-0000000EOrr-2AYG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:13 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso6863265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346269; x=1788951069; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmhXowTIOzHcHY7UkEdd72g+gSt6KBOTf5gqmJgT9x4=;
        b=LfyeHCKDOMTk+pBbW26QJ/CbInffPFzGCuO0YusY+8fw5N67vbPr56gz5JsAcRQmub
         CelOOiFMy0e791tAuQ/6c1Thz0rfpOEW+glfT7e6auV8owN6UQJESkemQLcPldXxHpG3
         cW3Qt91x1RZZTOAN4UhP3L9RZiBUatzyygbn7oG1KRyeA/IvktN9JNDcin5MyS9dOaEr
         lTbO1xFMpOfUpLM6eoaaTYBtrIBExJd4Dhrr1FQOVxHTjjNhRAzmoa2PWgKlMEKj3aga
         P77PgHpgZroffC4HkqO3LJQnDTbLZID0CP+SpGx5BXp4r/m3or+IPVBi4T6tpXNioPwX
         keNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346269; x=1788951069;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmhXowTIOzHcHY7UkEdd72g+gSt6KBOTf5gqmJgT9x4=;
        b=s7D/4K8QqxAhIYNkvHKhm2T/YwNySopo98iNs83FmtiaIs70xBe9ZNi46TizmfrVrT
         XPtkZj+FOS9wom62//1UjICzxZjS4XAMj79tHdCrmCOsi5JVaKUM3MjxZ6igU1gQYwxc
         16QDUyLlUGeRbd1lK/FBB3t3aSbNeiOfMJeoBRWhRFN8ItdoK+bqujuKdXM/WiwWaQ8H
         8+SO22z8lOMkMKlreip19S3JYsUJetB72M9tCUog3/Vz+Ki3FbOlLTxEOl/b/sQoy4gv
         G4zoVCjhpbwtYySGa9oyuPSDPCb0IjBw7AMBfAN9OBQ7Uz+9VpwDeY+i+PtMQp7hLuc3
         XqNw==
X-Forwarded-Encrypted: i=1; AHgh+RrgPB51wUXBI6sCZ6Jm3+M5PcEfVxjJ1Gv9F9ohbAgY1DCeFALW5gmLo/DlVqkGhA9cuCRjVmeMOXLltV6Ms97a@lists.infradead.org
X-Gm-Message-State: AFuF++lxhEyLb5plNpDXcEqnO8HZdQSjjoIijqBnznvx5JPlnpSGgnEh
	K2d8stZFLvJr0K5z/oG/5cCiJT8WUU7F2aLLJ2Bw/EtZhQz281q5RbryswVILO4AXVgyRmdWvjC
	V+oy/7iJ3fxfkziMp2mQDSg==
X-Received: from wmbgx10.prod.google.com ([2002:a05:600c:858a:b0:49b:96b9:9d0f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b18:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49ce583adbemr59327195e9.15.1788346269076;
 Wed, 02 Sep 2026 03:51:09 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:04 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-3-vdonnefort@google.com>
Subject: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
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
X-CRM114-CacheID: sfid-20260902_035112_597246_6EC6B720 
X-CRM114-Status: GOOD (  19.79  )
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

Add an "ll-map" property for reserved-memory regions. When set, it
splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..9ff2d02cb149 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -32,9 +32,32 @@ static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
 static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
 static int reserved_mem_count;
 
+enum of_rmem_flags {
+	OF_RMEM_NONE		= 0,
+	OF_RMEM_NOMAP		= BIT(0),
+	OF_RMEM_LLMAP		= BIT(1),
+};
+
+static int __init of_reserved_mem_flags(unsigned long node, enum of_rmem_flags *flags)
+{
+	*flags = OF_RMEM_NONE;
+
+	if (of_get_flat_dt_prop(node, "no-map", NULL))
+		*flags |= OF_RMEM_NOMAP;
+	if (of_get_flat_dt_prop(node, "ll-map", NULL))
+		*flags |= OF_RMEM_LLMAP;
+
+	if ((*flags & OF_RMEM_NOMAP) && (*flags & OF_RMEM_LLMAP)) {
+		pr_err("Reserved memory: no-map and ll-map are mutually exclusive\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
-	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
-	phys_addr_t *res_base)
+	phys_addr_t align, phys_addr_t start, phys_addr_t end,
+	enum of_rmem_flags flags, phys_addr_t *res_base)
 {
 	phys_addr_t base;
 	int err = 0;
@@ -46,10 +69,21 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 		return -ENOMEM;
 
 	*res_base = base;
-	if (nomap) {
-		err = memblock_mark_nomap(base, size);
-		if (err)
+	if (flags & OF_RMEM_LLMAP) {
+		err = memblock_mark_llmap(base, size);
+		if (err) {
 			memblock_phys_free(base, size);
+			return err;
+		}
+	}
+
+	if (flags & OF_RMEM_NOMAP) {
+		err = memblock_mark_nomap(base, size);
+		if (err) {
+			if (flags & OF_RMEM_LLMAP)
+				memblock_clear_llmap(base, size);
+			memblock_phys_free(base, size);
+		}
 	}
 
 	if (!err)
@@ -119,17 +153,29 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
 				       phys_addr_t base, phys_addr_t size);
 
 static int __init early_init_dt_reserve_memory(phys_addr_t base,
-					       phys_addr_t size, bool nomap)
+					       phys_addr_t size,
+					       enum of_rmem_flags flags)
 {
-	if (nomap) {
+	int err;
+
+	if (flags & OF_RMEM_LLMAP) {
+		err = memblock_mark_llmap(base, size);
+		if (err)
+			return err;
+	}
+
+	if (flags & OF_RMEM_NOMAP) {
 		/*
 		 * If the memory is already reserved (by another region), we
 		 * should not allow it to be marked nomap, but don't worry
 		 * if the region isn't memory as it won't be mapped.
 		 */
 		if (memblock_overlaps_region(&memblock.memory, base, size) &&
-		    memblock_is_region_reserved(base, size))
+		    memblock_is_region_reserved(base, size)) {
+			if (flags & OF_RMEM_LLMAP)
+				memblock_clear_llmap(base, size);
 			return -EBUSY;
+		}
 
 		return memblock_mark_nomap(base, size);
 	}
@@ -143,10 +189,10 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 static int __init __reserved_mem_reserve_reg(unsigned long node,
 					     const char *uname)
 {
+	enum of_rmem_flags flags;
 	phys_addr_t base, size;
-	int len, err;
 	const __be32 *prop;
-	bool nomap;
+	int len, err;
 	u64 b, s;
 
 	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
@@ -157,7 +203,9 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 		pr_warn("Reserved memory: node '%s' has %d <base size> entries, only the first is used\n",
 			uname, len);
 
-	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+	err = of_reserved_mem_flags(node, &flags);
+	if (err)
+		return err;
 
 	err = fdt_validate_reserved_mem_node(node, NULL);
 	if (err && err != -ENODEV)
@@ -167,7 +215,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	base = b;
 	size = s;
 
-	if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
+	if (size && early_init_dt_reserve_memory(base, size, flags) == 0) {
 		fdt_fixup_reserved_mem_node(node, base, size);
 		pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
 			 uname, &base, (unsigned long)(size / SZ_1M));
@@ -399,8 +447,8 @@ int __init fdt_scan_reserved_mem(void)
  *	reserved regions to keep the reserved memory contiguous if possible.
  */
 static int __init __reserved_mem_alloc_in_range(phys_addr_t size,
-	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
-	phys_addr_t *res_base)
+	phys_addr_t align, phys_addr_t start, phys_addr_t end,
+	enum of_rmem_flags flags, phys_addr_t *res_base)
 {
 	bool prev_bottom_up = memblock_bottom_up();
 	bool bottom_up = false, top_down = false;
@@ -435,7 +483,7 @@ static int __init __reserved_mem_alloc_in_range(phys_addr_t size,
 		memblock_set_bottom_up(bottom_up);
 
 	ret = early_init_dt_alloc_reserved_memory_arch(size, align,
-			start, end, nomap, res_base);
+			start, end, flags, res_base);
 
 	/* Restore old setting if needed */
 	if (bottom_up != top_down)
@@ -452,9 +500,9 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
 {
 	phys_addr_t start = 0, end = 0;
 	phys_addr_t base = 0, align = 0, size;
+	enum of_rmem_flags flags;
 	int i, len;
 	const __be32 *prop;
-	bool nomap;
 	int ret;
 
 	prop = of_get_flat_dt_prop(node, "size", &len);
@@ -477,7 +525,9 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
 		align = dt_mem_next_cell(dt_root_addr_cells, &prop);
 	}
 
-	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+	ret = of_reserved_mem_flags(node, &flags);
+	if (ret)
+		return ret;
 
 	ret = fdt_validate_reserved_mem_node(node, &align);
 	if (ret && ret != -ENODEV)
@@ -495,7 +545,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
 
 			base = 0;
 			ret = __reserved_mem_alloc_in_range(size, align,
-					start, end, nomap, &base);
+					start, end, flags, &base);
 			if (ret == 0) {
 				pr_debug("allocated memory for '%s' node: base %pa, size %lu MiB\n",
 					uname, &base,
@@ -505,7 +555,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
 		}
 	} else {
 		ret = early_init_dt_alloc_reserved_memory_arch(size, align,
-							0, 0, nomap, &base);
+							0, 0, flags, &base);
 		if (ret == 0)
 			pr_debug("allocated memory for '%s' node: base %pa, size %lu MiB\n",
 				uname, &base, (unsigned long)(size / SZ_1M));
@@ -635,8 +685,8 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem,
 static void __init fdt_init_reserved_mem_node(unsigned long node, const char *uname,
 					      phys_addr_t base, phys_addr_t size)
 {
+	enum of_rmem_flags flags;
 	int err = 0;
-	bool nomap;
 
 	struct reserved_mem *rmem = &reserved_mem[reserved_mem_count];
 
@@ -650,14 +700,19 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	rmem->base = base;
 	rmem->size = size;
 
-	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+	err = of_reserved_mem_flags(node, &flags);
+	if (err)
+		return;
 
 	err = __reserved_mem_init_node(rmem, node);
 	if (err != 0 && err != -ENODEV) {
 		pr_info("node %s compatible matching fail\n", rmem->name);
 		rmem->name = NULL;
 
-		if (nomap)
+		if (flags & OF_RMEM_LLMAP)
+			memblock_clear_llmap(rmem->base, rmem->size);
+
+		if (flags & OF_RMEM_NOMAP)
 			memblock_clear_nomap(rmem->base, rmem->size);
 		else
 			memblock_phys_free(rmem->base, rmem->size);
@@ -667,9 +722,10 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 		bool reusable =
 			(of_get_flat_dt_prop(node, "reusable", NULL)) != NULL;
 
-		pr_info("%pa..%pa (%lu KiB) %s %s %s\n",
+		pr_info("%pa..%pa (%lu KiB) %s %s %s %s\n",
 			&rmem->base, &end, (unsigned long)(rmem->size / SZ_1K),
-			nomap ? "nomap" : "map",
+			(flags & OF_RMEM_LLMAP) ? "last-level " : "",
+			(flags & OF_RMEM_NOMAP) ? "nomap" : "map",
 			reusable ? "reusable" : "non-reusable",
 			rmem->name ? rmem->name : "unknown");
 	}
-- 
2.55.0.970.g62bdec98f9-goog


