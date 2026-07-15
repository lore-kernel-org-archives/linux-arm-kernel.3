Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232AEC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=116XGPIsH3uc1TP/YR0VtloeUIWM18cD/kEPtzKIUwA=; b=Q4MI5udnE1Jy/4kgV1cDISPjrR
	kkHSPKd8uSjyGFqXb+HlqPJ4TCx8ySRQxRbuaRRzHaG6mSVOc+WF8J7GDNNqJ1b3RrMO+Dezrf/7f
	wJCnmW4qJ3dBpeuTaru8Uz+RcPO2tA0AvwClOF0OQRKfDBu5VBw8/WIDvdS6IL9USHzFw1poqCozR
	nK5nramqH0hWARW0MwG+k/ZBpoD425cnLzRIg2rmqYluhCInjaGJfQci54T9JjVboBe6PR6GMa/ol
	w94l9UO9Imw6WGRfJGTHHHwqh5wvxE7jAfVzuVW+pS1kCIMnr3yC6WancjVirArTl4Z7W+1ctR+PD
	Mgzd2eaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGw-0000000Ef7K-05yU;
	Wed, 15 Jul 2026 11:59:30 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGm-0000000Eezk-2DKX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:22 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-4744b72f90bso2892890f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116758; x=1784721558; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=116XGPIsH3uc1TP/YR0VtloeUIWM18cD/kEPtzKIUwA=;
        b=kM00zNnyGZ9RNTSgqBdFzoYMzRnSvnagmHrJ/ShayTNCvYRg5c/NzsPZSy5uurhssu
         FhIfhD8qGYQych22jxF4w2iP6kV/bIb+imHf4VMr2n/88ueNCGDN3lU6YSrw1XIGuQVm
         Q+7gEk1qHey8pWADlxwBiJo2frqV4UhbRanoHhzv7pWwWg+Jbz1oRUJ7kLlupICfJlls
         tl0gw1k0aeNfJfIGvhf60SHxLyReF1qobkmqOGxPYoXCBEcEZ2B8/6QeETSPNF8B+i8k
         u1wiVa5/IzZrlqOwUw5CvhjQUPmRwHa4avEXYEy7RIbgZX5I5N8+yaZ/5408/7Xh8xsv
         sIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116758; x=1784721558;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=116XGPIsH3uc1TP/YR0VtloeUIWM18cD/kEPtzKIUwA=;
        b=eBVGih+ZWkyLRigMtitmp8nBcDd1rZrTcvLXwij+pGxNs6bFKcVKufIaqqhjrIDL/C
         p4Mc59ExAgmVba6sEHkI+APHLNIqLGUWkDG4dOQq1y6CMn+sqeF4UbO3jTWJFFegbHmM
         yDfdhNkxPp9h8ahQIM0RlF7w1WDLCH9ivlr9Qio0Bcsd8FmM1uBT+UvCWCsPAne+SfKW
         DVukQXOysDd5dSWdtVzz4oerhCLh7EX2bHF3xh/GpN/jm840GHJ/H4wHOMIx6Pe+xB/x
         TOh4DZgND81NVBKIKSQU8bItDfmwi7kU88qbNO97uMjR0faZ0Yky5FVKsa6Z62k/PBFJ
         DRDQ==
X-Gm-Message-State: AOJu0Yy/xcG3CqNZwfB6V5yqSUyHmIL9/QE6vX6IZ6Uq9xEv25yZGtWD
	zrfWp5XD9whNR23rs/GssspP8/2pCeGiuENRMYA/5TD0wKNm9J+LcaKdixfjrg6FtHcxoXMimDl
	fNklRyKgK8w7nsXJTWPlFjHh1L4xCiAtYV/ZOlgTP4ovUUhao7aEUQj6LWPpp7ejSGyJDhMwD+N
	qovbXvFioEy+G5JLkYNAf21CjOGBUZ1dasqLL0gNiJK7BFQ/waps6LTS/b95QwBU1XMA==
X-Received: from wmap7.prod.google.com ([2002:a7b:cc87:0:b0:487:3739:c5c4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:108:20b0:495:401d:9f4f with SMTP id 5b1f17b1804b1-495401da1a5mr2255395e9.25.1784116757928;
 Wed, 15 Jul 2026 04:59:17 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:45 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-5-smostafa@google.com>
Subject: [PATCH v7 04/24] iommu/arm-smmu-v3: Move TLB range invalidation into
 common code
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045920_636239_D36DD95A 
X-CRM114-Status: GOOD (  22.37  )
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

Range TLB invalidation has a very specific algorithm. Instead of
re-writing it for the hypervisor, move it to a function that can
be re-used.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 79 +++---------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 89 +++++++++++++++++++++
 2 files changed, 102 insertions(+), 66 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a2289d4a3f3..cd17a3255312 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2336,81 +2336,28 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 	arm_smmu_domain_inv(smmu_domain);
 }
 
+static void __arm_smmu_cmdq_batch_add(void *__opaque,
+				      struct arm_smmu_cmdq_batch *cmds,
+				      struct arm_smmu_cmd *cmd)
+{
+	struct arm_smmu_device *smmu = (struct arm_smmu_device *)__opaque;
+
+	arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
+}
+
 static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 					  struct arm_smmu_cmdq_batch *cmds,
 					  struct arm_smmu_cmd *cmd, bool leaf,
 					  unsigned long iova, size_t size,
 					  size_t granule, size_t pgsize)
 {
-	unsigned long end = iova + size, num_pages = 0, tg = pgsize;
-	u64 orig_data0 = cmd->data[0];
-	size_t inv_range = granule;
-	u8 ttl = 0, tg_enc = 0;
-
 	if (WARN_ON_ONCE(!size))
 		return;
 
-	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-		num_pages = size >> tg;
-
-		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
-		tg_enc = (tg - 10) / 2;
-
-		/*
-		 * Determine what level the granule is at. For non-leaf, both
-		 * io-pgtable and SVA pass a nominal last-level granule because
-		 * they don't know what level(s) actually apply, so ignore that
-		 * and leave TTL=0. However for various errata reasons we still
-		 * want to use a range command, so avoid the SVA corner case
-		 * where both scale and num could be 0 as well.
-		 */
-		if (leaf)
-			ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
-		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
-			num_pages++;
-	}
-
-	while (iova < end) {
-		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-			/*
-			 * On each iteration of the loop, the range is 5 bits
-			 * worth of the aligned size remaining.
-			 * The range in pages is:
-			 *
-			 * range = (num_pages & (0x1f << __ffs(num_pages)))
-			 */
-			unsigned long scale, num;
-
-			/* Determine the power of 2 multiple number of pages */
-			scale = __ffs(num_pages);
-
-			/* Determine how many chunks of 2^scale size we have */
-			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
-
-			cmd->data[0] = orig_data0 |
-				FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
-				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale);
-
-			/* range is num * 2^scale * pgsize */
-			inv_range = num << (scale + tg);
-
-			/* Clear out the lower order bits for the next iteration */
-			num_pages -= num << scale;
-		}
-
-		/*
-		 * IPA has fewer bits than VA, but they are reserved in the
-		 * command and something would be very broken if iova had them
-		 * set.
-		 */
-		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
-			       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
-			       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
-			       (iova & ~GENMASK_U64(11, 0));
-
-		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
-		iova += inv_range;
-	}
+	arm_smmu_tlb_inv_build(cmd, iova, size, granule, pgsize,
+			       smmu->features & ARM_SMMU_FEAT_RANGE_INV,
+			       smmu, leaf, __arm_smmu_cmdq_batch_add,
+			       cmds);
 }
 
 static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index e93489841ec7..494e55a2dc34 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1272,6 +1272,95 @@ static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
 }
 
+/**
+ * arm_smmu_tlb_inv_build - Create a range invalidation command
+ * @cmd: Base command initialized with OPCODE (S1, S2..), vmid and asid
+ * @iova: Start IOVA to invalidate
+ * @size: Size of range
+ * @granule: Granule of invalidation
+ * @pgsize: Page size of the invalidation
+ * @is_range: Use range invalidation commands
+ * @opaque: Pointer to pass to add_cmd
+ * @leaf: Is leaf invalidation
+ * @add_cmd: Function to send/batch the invalidation command
+ * @cmds: Incase of batching, it includes the pointer to the batch
+ */
+static inline void arm_smmu_tlb_inv_build(struct arm_smmu_cmd *cmd,
+					  unsigned long iova, size_t size,
+					  size_t granule, unsigned long pgsize,
+					  bool is_range, void *opaque, bool leaf,
+					  void (*add_cmd)(void *_opaque,
+							  struct arm_smmu_cmdq_batch *cmds,
+							  struct arm_smmu_cmd *cmd),
+					  struct arm_smmu_cmdq_batch *cmds)
+{
+	unsigned long end = iova + size, num_pages = 0, tg = pgsize;
+	u64 orig_data0 = cmd->data[0];
+	size_t inv_range = granule;
+	u8 ttl = 0, tg_enc = 0;
+
+	if (is_range) {
+		num_pages = size >> tg;
+
+		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
+		tg_enc = (tg - 10) / 2;
+
+		/*
+		 * Determine what level the granule is at. For non-leaf, both
+		 * io-pgtable and SVA pass a nominal last-level granule because
+		 * they don't know what level(s) actually apply, so ignore that
+		 * and leave TTL=0. However for various errata reasons we still
+		 * want to use a range command, so avoid the SVA corner case
+		 * where both scale and num could be 0 as well.
+		 */
+		if (leaf)
+			ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
+		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
+			num_pages++;
+	}
+
+	while (iova < end) {
+		if (is_range) {
+			/*
+			 * On each iteration of the loop, the range is 5 bits
+			 * worth of the aligned size remaining.
+			 * The range in pages is:
+			 *
+			 * range = (num_pages & (0x1f << __ffs(num_pages)))
+			 */
+			unsigned long scale, num;
+
+			/* Determine the power of 2 multiple number of pages */
+			scale = __ffs(num_pages);
+
+			/* Determine how many chunks of 2^scale size we have */
+			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
+
+			cmd->data[0] = orig_data0 |
+				FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
+				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale);
+
+			/* range is num * 2^scale * pgsize */
+			inv_range = num << (scale + tg);
+
+			/* Clear out the lower order bits for the next iteration */
+			num_pages -= num << scale;
+		}
+		/*
+		 * IPA has fewer bits than VA, but they are reserved in the
+		 * command and something would be very broken if iova had them
+		 * set.
+		 */
+		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
+			       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
+			       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
+			       (iova & ~GENMASK_U64(11, 0));
+
+		add_cmd(opaque, cmds, cmd);
+		iova += inv_range;
+	}
+}
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.55.0.141.g00534a21ce-goog


