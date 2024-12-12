Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9D6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqPsJB88kXVR+TaQlcSaWv/z9lPFdx9zLwQbYqyNGLA=; b=R54Wy83887bATQrOiNC07gEJhT
	6syHnBQfGH9PtztvZZ7TPBYpL6161mVXwh5FOYcQBtEgxkB9kjOohEl6KRHy5AXYon9X0XpvmTMGZ
	i5cmICzlOmwJg2bInMBO42ik4RTlGIifMvcf0zKKgxUW4teBGLnFv8Qkd3oMZKko1R7PkgwcDbJcF
	EeVGQL+u1VbSe9ShymBCYj9WIBRV/dyTKiz9F189V4v7b+f/sULwT4SRBKbNnrmvV76P5YruulqVP
	zWR04SAfV+jrlYHN+KgCbmK3JjQWKCbDEqWm3u3YIDLR9ZMua0OhhuJdStNdPpCrYIAvm3vw00lS6
	I6VZZpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoEN-00000001UQb-4Bme;
	Thu, 12 Dec 2024 18:48:12 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZg-00000001JzL-0AGd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:09 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-436289a570eso3573605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026766; x=1734631566; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqPsJB88kXVR+TaQlcSaWv/z9lPFdx9zLwQbYqyNGLA=;
        b=LewoUqinmVXnIllmp90uYyAS7hzIG3giAUbQzRpCcCg7Igu2qQlPssGr8M/LvdNz1Z
         Cw7w1/z7cdAyiV0T/3WulU5wGVSO1nP/BO7Z4xXcV2yQ2Z3cdXPQ99h5UzPwsIHdmaC4
         dUeP6Rejfp4mn0SjTUCEpMReedmGg8+CmAQvXAJcR5Wg42Y5lVCCXpSaErbpa+2loAMd
         LK019z7KKiPsLxMFn1QP8TqlvKBeTT0DbXZH3Duw1husgtRojRY6jfsQYJYH27Ypw6TM
         Ojmy/11LJINyjbPBnfwU6wUDRLklt+KCCLRpjYtpYVLrdzaM5loNlwnL5uVYnKluwq+L
         Ds1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026766; x=1734631566;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqPsJB88kXVR+TaQlcSaWv/z9lPFdx9zLwQbYqyNGLA=;
        b=FGlVn8q1wOkPW1ZE2RKcl9/38otE397lIkprIefuwfHhK8Efl/ICq28Nj0Meoj+1jf
         9BsAE/BReY1cL+Yrk4+w1HJhI6TeAxR6paoGcbIWGvlt9X6CxrwN23rxhMF88WysDbso
         oslZ6FytZXw6hVKigjbvvVbaLcLe2dR3nFUkTfyvGz8A9ZRTVWNJhDnm3m75ywHJA/xU
         zXgPlNS+b3BSO+HzhEUzDD3vH0ZwAIDbahvmDsbdtaN6AuQVyBDDoTTNbs62SeK7WP0D
         rUEqWBfmGtW0mtbXj/3ijA5uPOCck728LsYUn+RRE9ArVlTpAU3Rm6HnPKs2fUKnyjR5
         Rlxw==
X-Forwarded-Encrypted: i=1; AJvYcCURR/Xq3UaWwF2KjwvpiEXsmd2CuwP/LsRL6j3/6lg4/n5LVAxS/RYVLCNhNWXC9nLqCeMKsDRYjWhqOPsEmQSg@lists.infradead.org
X-Gm-Message-State: AOJu0YwwuzJ5bDpQejLN5Yi6YI37J1kBjighP+9tfXBuFvi7oHzdZMjc
	7xaKCest0BPB5YcRfyWMjTsPNgGbzpDw68v0erD7sP6ZjZTQn4OA3zAs9AuUD2ve1ocDq8fYp69
	I2vaX7nUd6Q==
X-Google-Smtp-Source: AGHT+IEsi+4ZjdjaE64e2fAsGHvL3ha82aYz7MzT70dGqsLuOIBzlVogt+pct6VgpmBHvLpi6wagEZsN2iELKw==
X-Received: from wmos10.prod.google.com ([2002:a05:600c:45ca:b0:434:fa72:f1bf])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4450:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-4361c3bd9e8mr84507805e9.14.1734026765211;
 Thu, 12 Dec 2024 10:06:05 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:03 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-40-smostafa@google.com>
Subject: [RFC PATCH v2 39/58] drivers/iommu: io-pgtable: Add IO_PGTABLE_QUIRK_UNMAP_INVAL
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100608_080455_D1E4A128 
X-CRM114-Status: GOOD (  21.86  )
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

Only invalidate PTE without clearing it.

For io-pgtable-armm that also leaves the table allocated after an
unmap as they can't be freed.

This quirk also will allow the page table walker to traverse through
tables invalidated by an unmap, allowing the caller to doing any
booking keeping and freeing the table after.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm-common.c | 50 +++++++++++++++++++--------
 include/linux/io-pgtable-arm.h        |  7 +++-
 include/linux/io-pgtable.h            |  5 ++-
 3 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-common.c b/drivers/iommu/io-pgtable-arm-common.c
index 076240eaec19..89be1aa72a6b 100644
--- a/drivers/iommu/io-pgtable-arm-common.c
+++ b/drivers/iommu/io-pgtable-arm-common.c
@@ -42,7 +42,10 @@ static phys_addr_t iopte_to_paddr(arm_lpae_iopte pte,
 static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg, int num_entries)
 {
 	for (int i = 0; i < num_entries; i++)
-		ptep[i] = 0;
+		if (cfg->quirks & IO_PGTABLE_QUIRK_UNMAP_INVAL)
+			ptep[i] &= ~ARM_LPAE_PTE_VALID;
+		else
+			ptep[i] = 0;
 
 	if (!cfg->coherent_walk && num_entries)
 		__arm_lpae_sync_pte(ptep, num_entries, cfg);
@@ -170,7 +173,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 
 	/* Grab a pointer to the next level */
 	pte = READ_ONCE(*ptep);
-	if (!pte) {
+	if (!iopte_valid(pte)) {
 		cptep = __arm_lpae_alloc_pages(tblsz, gfp, cfg, data->iop.cookie);
 		if (!cptep)
 			return -ENOMEM;
@@ -182,9 +185,9 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		__arm_lpae_sync_pte(ptep, 1, cfg);
 	}
 
-	if (pte && !iopte_leaf(pte, lvl, data->iop.fmt)) {
+	if (iopte_valid(pte) && !iopte_leaf(pte, lvl, data->iop.fmt)) {
 		cptep = iopte_deref(pte, data);
-	} else if (pte) {
+	} else if (iopte_valid(pte)) {
 		/* We require an unmap first */
 		return arm_lpae_unmap_empty();
 	}
@@ -316,7 +319,7 @@ void __arm_lpae_free_pgtable(struct arm_lpae_io_pgtable *data, int lvl,
 	while (ptep != end) {
 		arm_lpae_iopte pte = *ptep++;
 
-		if (!pte || iopte_leaf(pte, lvl, data->iop.fmt))
+		if (!iopte_valid(pte) || iopte_leaf(pte, lvl, data->iop.fmt))
 			continue;
 
 		__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
@@ -401,7 +404,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
 	ptep += unmap_idx_start;
 	pte = READ_ONCE(*ptep);
-	if (WARN_ON(!pte))
+	if (WARN_ON(!iopte_valid(pte)))
 		return 0;
 
 	/* If the size matches this level, we're in the right place */
@@ -412,7 +415,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 		/* Find and handle non-leaf entries */
 		for (i = 0; i < num_entries; i++) {
 			pte = READ_ONCE(ptep[i]);
-			if (WARN_ON(!pte))
+			if (WARN_ON(!iopte_valid(pte)))
 				break;
 
 			if (!iopte_leaf(pte, lvl, iop->fmt)) {
@@ -421,7 +424,9 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 				/* Also flush any partial walks */
 				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
 							  ARM_LPAE_GRANULE(data));
-				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
+				if (!(iop->cfg.quirks & IO_PGTABLE_QUIRK_UNMAP_INVAL))
+					__arm_lpae_free_pgtable(data, lvl + 1,
+								iopte_deref(pte, data));
 			}
 		}
 
@@ -523,9 +528,12 @@ static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
 	return 0;
 }
 
-static void visit_pgtable_post_table(struct arm_lpae_io_pgtable_walk_data *data,
+static void visit_pgtable_post_table(struct io_pgtable_walk_data *walk_data,
 				     arm_lpae_iopte *ptep, int lvl)
 {
+	struct io_pgtable_walk_common *walker = walk_data->data;
+	struct arm_lpae_io_pgtable_walk_data *data = walker->data;
+
 	if (data->visit_post_table)
 		data->visit_post_table(data, ptep, lvl);
 }
@@ -550,30 +558,41 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 			    arm_lpae_iopte *ptep, int lvl)
 {
 	struct io_pgtable *iop = &data->iop;
+	struct io_pgtable_cfg *cfg = &iop->cfg;
 	arm_lpae_iopte pte = READ_ONCE(*ptep);
 	struct io_pgtable_walk_common *walker = walk_data->data;
+	arm_lpae_iopte *old_ptep = ptep;
+	bool is_leaf, is_table;
 
 	size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
 	int ret = walk_data->visit(walk_data, lvl, ptep, size);
 	if (ret)
 		return ret;
 
-	if (iopte_leaf(pte, lvl, iop->fmt)) {
+	if (cfg->quirks & IO_PGTABLE_QUIRK_UNMAP_INVAL) {
+		/* Visitng invalid tables as it still have enteries. */
+		is_table = pte && iopte_table(pte | ARM_LPAE_PTE_VALID, lvl);
+		is_leaf = pte && iopte_leaf(pte | ARM_LPAE_PTE_VALID, lvl, iop->fmt);
+	} else {
+		is_table = iopte_table(pte, lvl);
+		is_leaf = iopte_leaf(pte, lvl, iop->fmt);
+	}
+
+	if (is_leaf) {
 		if (walker->visit_leaf)
 			walker->visit_leaf(iopte_to_paddr(pte, data), size, walker, ptep);
 		walk_data->addr += size;
 		return 0;
 	}
 
-	if (!iopte_table(pte, lvl)) {
+	if (!is_table)
 		return -EINVAL;
-	}
 
 	ptep = iopte_deref(pte, data);
 	ret = __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
 
 	if (walk_data->visit_post_table)
-		walk_data->visit_post_table(data, ptep, lvl);
+		walk_data->visit_post_table(walk_data, old_ptep, lvl);
 
 	return ret;
 }
@@ -744,7 +763,8 @@ int arm_lpae_init_pgtable_s1(struct io_pgtable_cfg *cfg,
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
 			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
-			    IO_PGTABLE_QUIRK_ARM_HD))
+			    IO_PGTABLE_QUIRK_ARM_HD |
+			    IO_PGTABLE_QUIRK_UNMAP_INVAL))
 		return -EINVAL;
 
 	ret = arm_lpae_init_pgtable(cfg, data);
@@ -830,7 +850,7 @@ int arm_lpae_init_pgtable_s2(struct io_pgtable_cfg *cfg,
 	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
 
 	/* The NS quirk doesn't apply at stage 2 */
-	if (cfg->quirks)
+	if (cfg->quirks & ~IO_PGTABLE_QUIRK_UNMAP_INVAL)
 		return -EINVAL;
 
 	ret = arm_lpae_init_pgtable(cfg, data);
diff --git a/include/linux/io-pgtable-arm.h b/include/linux/io-pgtable-arm.h
index c00eb0cb7e43..407f05fb300a 100644
--- a/include/linux/io-pgtable-arm.h
+++ b/include/linux/io-pgtable-arm.h
@@ -21,7 +21,7 @@ struct io_pgtable_walk_data {
 	struct io_pgtable_walk_common	*data;
 	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
 		     arm_lpae_iopte *ptep, size_t size);
-	void (*visit_post_table)(struct arm_lpae_io_pgtable_walk_data *data,
+	void (*visit_post_table)(struct io_pgtable_walk_data *walk_data,
 				 arm_lpae_iopte *ptep, int lvl);
 	unsigned long			flags;
 	u64				addr;
@@ -193,6 +193,11 @@ static inline bool iopte_table(arm_lpae_iopte pte, int lvl)
 	return iopte_type(pte) == ARM_LPAE_PTE_TYPE_TABLE;
 }
 
+static inline bool iopte_valid(arm_lpae_iopte pte)
+{
+	return pte & ARM_LPAE_PTE_VALID;
+}
+
 #ifdef __KVM_NVHE_HYPERVISOR__
 #include <nvhe/memory.h>
 #define __arm_lpae_virt_to_phys	hyp_virt_to_phys
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 86226571cdb8..ce0aed9c87d2 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -89,6 +89,8 @@ struct io_pgtable_cfg {
 	 *	attributes set in the TCR for a non-coherent page-table walker.
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
+	 *
+	 * IO_PGTABLE_QUIRK_UNMAP_INVAL: Only invalidate PTE on unmap, don't clear it.
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
@@ -97,6 +99,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_TTBR1		BIT(5)
 	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
 	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
+	#define IO_PGTABLE_QUIRK_UNMAP_INVAL		BIT(8)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
@@ -194,7 +197,7 @@ struct arm_lpae_io_pgtable_walk_data {
 	int level;
 	void *cookie;
 	void (*visit_post_table)(struct arm_lpae_io_pgtable_walk_data *data,
-				 arm_lpae_iopte *ptep, int lvl);
+				 u64 *ptep, int lvl);
 };
 
 /**
-- 
2.47.0.338.g60cca15819-goog


