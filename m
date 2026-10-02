Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7048DCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChtYARSDq8iagNWO9IImP3K9FjWMJua7ZspoYb+TKU4=; b=ElpO5anpgaEPlJy31KORbvhs+E
	N0OVeqmLBuH9MTlmv07bnPxzLRlEaZMsjLyGSBw0EVWoDx546AoVGoqBj4oDlVypu0w/n8vruiQvT
	UsE1fJT4mpHw/34ZdZaaeiD3kB6QgI+lOglwCR9R94erlyRlM8B9hTx751/iDglpQCr0qVUPFlPHu
	u1tBDvfEzNS6WgXjK0COJIXJ8MQf1LW4Jk7MVdQZ2xzVYXb6ntd56d1JF9/RM6qlQcYtRtAFWQ9T1
	eUnlweniMD1bDEBC0DSzqtrWow0nOZq21jOzuHsNw1uFBs2qYAUrALK45/hur/e76WQ0O3WSZsHpY
	Mqj6+UTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHw-0000000B51v-0WWN;
	Fri, 02 Oct 2026 09:10:44 +0000
Received: from mail-pj2-x13.google.com ([2607:f8b0:4864:39::13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHk-0000000B4o8-16Vo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:40 +0000
Received: by mail-pj2-x13.google.com with SMTP id d9443c01a7336-2d747f01363so46192615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932231; x=1791537031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChtYARSDq8iagNWO9IImP3K9FjWMJua7ZspoYb+TKU4=;
        b=CxK8u3nPwpEs+1kgdx1O7B+ZdXC8Gg9aWWp0tcnkZcPqT5P3O4u360c9ROSKHSOrEe
         TgJERlRnHVMln5WEL4PYmqQErwcXhb8m+/ITthFhQRtJ0LTFmMIM7dKnBse2xqVYVIxc
         dShyeAXuxQmW54iqmBQmWgNz4WV4a/3L3BRaonk/M/AM6hMapHKT2UvBusan3bx6ayEp
         8WJlXd80XN7I7Q9+envMX8HzWmxgh/lxviPDJ5IlFCNJtCDoI8x1jJwc5JMEIE87tamz
         g8ywjzF+8vwMk4GfRZ4PkojEVrws62Z872Oi5MgYIMbOnpzQWemJvmSf+AfxVIMkjXFT
         WLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932231; x=1791537031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChtYARSDq8iagNWO9IImP3K9FjWMJua7ZspoYb+TKU4=;
        b=LGhDJPpteFvIArY9hmLbC/QZatqlKh/ZuzqyOoi70IuQcuS0Pt7meWUlALikubh4vA
         IeNI5JoXGup4nSac7/fx0jSn+wXw6+hMchx9MbQfHzcuxoQtv0uBT1BLcOWfxXxs8uE5
         bRRVa4nTds2WVAK2aagfPejLGxvQ8Y7oXj0BzidQNfOUf+EGmgic5IIWfv5OUKhk5Pv/
         9t4V0bFpkGviiK4rukeNuOjRBXmG2onYfQk6au4499wQvGESLLUd4YGBHzMrtUqxKV0Q
         busLH6PNIk+PPmQOI/EF2gbh+7w4icucJHNyROtBW40WeKXI8D73FBo6kJoD2nWY2v2H
         aFgQ==
X-Forwarded-Encrypted: i=1; AKwUvByf4u2s/R6E5YYO+Gb1bmDFxSC0fFKQvQA122uFCjsa67Z+6RNztKPc9QYPApPRsuiG8NE4Z2jDeXkdaAGP0eBI@lists.infradead.org
X-Gm-Message-State: AFq9FYK5awW0+PdSNOrSVWIBKCskk+lqXBIj9DHwNFj5tKc0M7fXUnZk
	jjt4zFw3skR228bifDMyn43LQOABwTZYevPx8rWabGGXZ8VL7bF/I/Wl
X-Gm-Gg: AYBFou1u+FnO8yxhidiDlPnnkbzsCTjFAOmguSkjtX6DAvPVU7ExFMtgBgGbnW7PWmt
	mu9eMNGxBdPSXT0MXCpETUR/j5I4qCL0rI5O/tMKpJmINvHqSck64gVUmsOhVm6YW5AKEaG6oer
	ifh5XPy3bYomuLSonKS6HcHDdDDxGMXqgoRQsu+qeEs6Bk9RoAE/ARlH5efFJd2DTX/X5W5Node
	mtAlGHT3JkwFLoelUCm7MV+EJyiTyLwM+EIuYQveA0BVpcJJGSZY66G46xer+76I1U1CDe/VPdO
	4tYv2qohLl3mdGrqnjptXJap+YbtxYDyO5OhyDB9GU7LWlNSqc0dj8hOiLPWFWY4+PloepHNncJ
	O3GcXvDbnw8jxnLRaka+lDKVKdPEB3XvrVZFTfBoCHDPp5KNUxoe598Nzsjbflx8E5JlR6RlcuZ
	EaEQAPW/9vIMQ7I/jn6ubPxzchCZUiA1FfLwkFKk88Wnm8YOZF1EB1+clJq/NHzjq5yJUTinCel
	l/CQ5/VAbRmynRA7PQ3sg==
X-Received: by 2002:a17:903:1cd:b0:2e2:e6f1:5e10 with SMTP id d9443c01a7336-2e49a10450emr17761045ad.4.1790932231246;
        Fri, 02 Oct 2026 02:10:31 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:30 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v10 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Fri,  2 Oct 2026 17:09:43 +0800
Message-Id: <20261002090947.869220-7-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021032_310097_CF7F2424 
X-CRM114-Status: GOOD (  13.69  )
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

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index fb757d95bde25..72ec1b48a76de 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -92,6 +92,29 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
+		return size;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	u64 pfn;
 	struct page *page;
 	unsigned long size;
+	unsigned int nr_pages;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		nr_pages = PFN_DOWN(size);
+	} while (pte += nr_pages, pfn += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.34.1


