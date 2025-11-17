Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF59CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fa/YvcJ5tNlhBRUyXop3BZTS83Exwp3fcbT0/9k9OOI=; b=20C7oUEgeQC/kINwRy+HNMn15v
	7cl3aQSSiKfijLpDTx605ckqmJ1G72Vyc1pbXqjkSMBZ70hFskLl7U8aMedaYm8McNlphlJK1+i7q
	Z7RGuFiG0NbHLc9wxio1TIvSkSSHsEsr77sYIzw1N8CnjtQ1UNd5a6QaZEGJ6yWEY17WPs4hpkEO+
	7z4v2i+/Yh5podXqVlK8zCWQNeZ+3EPIuW6++JDpoSt+zSPP8VlIKivkyYrB9w8Fh9XE8If798aYp
	YNVOb/uLe1sgYICO/DjarHvD1T+xfOqENKaeffgpWcW0MKFU/fIU8Rxt+dsRJtd8tfCIvB6XTwJ4y
	QYZdZJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HU-0000000Gdi0-1O3y;
	Mon, 17 Nov 2025 18:48:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HF-0000000GdRz-1MM0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Fa/YvcJ5tNlhBRUyXop3BZTS83Exwp3fcbT0/9k9OOI=; b=c6GqADJYQWG41cgVy2FeO8gM7S
	MTyZiAzTs4aSTvnyzPT3SbyG7fC2u0lL6f31fVAEIVoiO1f8k8GwA6qjOICHTyvFbqEhYLkCjIkrY
	3YpYJl7VLYxf+IgmBvQ+zNlTWmBH6lSj8M+ol5rlyn8pEzOtv0+SpjLIUEs7cYk5sbr3SjZY7aSyd
	0KHn6LhGotXkP33aCiHbrRt3qZQXV44gMdaU2e3fMXtuNdB7D9QHHThAR2+QvJ6BLt1zTCisFf3vJ
	n0XOAUfSl7QTdE2eWXFeNgvt6zdLmDw9LsCHu+Bv+X8PxkhMsG7wcm+4DlcnPv6pzMpBV+idAg/sE
	vWfFxPnw==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3PY-00000007wZG-3r9p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:10 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4779393221aso2757795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405312; x=1764010112; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fa/YvcJ5tNlhBRUyXop3BZTS83Exwp3fcbT0/9k9OOI=;
        b=aJnHVcmaVrri7+GgiNkChEnVu/WiMuT0V2r5nqzSQojYgR2WTAvy8Wv/ScNIVyeNjo
         yxJcxZVWPubA/JP1na8xvscdGWf5tmdtk+/olF0tClnNP+CcXtiISdiX2kSvRc90YGE/
         V6EVHpKGqdABBL8d5ND1U8uoG83YaQDZBThtd5FaNZftMafDEHjywAfCybYStCeYS7km
         iRwhDZR98JYlBWWfD/CY00CIk3UTJ86bXPZPhYT8pj5zuIgCRCnt2FwprqfllGpN7p9j
         2bepMgi2oWL9GWpDIzcLxCbM4waWZF34AcfWNM2i0zF/6mFgWfJZVCCo2MK5AzXFtBzj
         S4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405312; x=1764010112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fa/YvcJ5tNlhBRUyXop3BZTS83Exwp3fcbT0/9k9OOI=;
        b=gFEo2dTCgcHogIk49viiz/Fxziz+lqtPY+bxF+CGnrK3/Q6ntGVknJVFjZ+cdwiASU
         4ckNLVqspg1+TgUZq/VRUtXlYdsgjiC9MDZH13G/ddtSZELaJIwUNo+2AJfy1Hb66o4k
         JMFnmAmsWTI5QT5HHfV7Eb0fkK6+AmepsmMH62K2bb54eyP6uppgoGrljIUPs5UtPUEb
         ennE2qOijfhB9bqmGmQ3toAllorHIjgocmf4BRjzkvfgOo82K2U5WXMEUVwyH90uvSuG
         QwWCVJCDGA3LdA4JuQ7wwok8ohkOyOu0mqEbKHZFxmmgUpP3hPmElbJodPNRxKffF2Sr
         6pTQ==
X-Gm-Message-State: AOJu0YzWf20zu4FGk03TWkc8o62sELPHNofWZmzDoD6PiWWHXJFy5SfB
	KtVfjoAi7c5LggcvGa4tFZdkWAb8OQhvAUtuAmFPGXfmUSYq820yvtTU+SDR0oSAlf7aQAK7Fty
	jvBZFU8L+lh5zPJC+dEtCrxiul+6EzpqV4fOC+8Pt1mf3Ij1dCHtYfFPja6wuRDXs5rsQewTUvo
	PsTbSK4P4nKT/hnlDpKjM9HhzvTFTNNBA/YiJ/OREq0Sq1GRNl9lRJq7fQMqeauQmuFw==
X-Google-Smtp-Source: AGHT+IFGfjLxAYeewB8UtexvjesLcgKTw4qvbkwbmE1jIA9t3QqiMcAfRLlAcExJxKbgHrtdx0lO1xzwSnlrcA==
X-Received: from wmgf6.prod.google.com ([2002:a05:600c:1546:b0:477:9fba:50e4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f87:b0:471:9da:524c with SMTP id 5b1f17b1804b1-4778fe69a76mr122513705e9.12.1763405312411;
 Mon, 17 Nov 2025 10:48:32 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:53 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-7-smostafa@google.com>
Subject: [PATCH v5 06/27] iommu/arm-smmu-v3: Move TLB range invalidation into
 common code
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_175309_022690_3D713A0A 
X-CRM114-Status: GOOD (  21.36  )
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

Range TLB invalidation has a very specific algorithm, instead of
re-writing it for the hypervisor.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 69 ++++--------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 79 +++++++++++++++++++++
 2 files changed, 92 insertions(+), 56 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 1497ffcd4555..f6c3eeb4ecea 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2105,74 +2105,31 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 	arm_smmu_atc_inv_domain(smmu_domain, 0, 0);
 }
 
+static void __arm_smmu_cmdq_batch_add(void *__opaque,
+				      struct arm_smmu_cmdq_batch *cmds,
+				      struct arm_smmu_cmdq_ent *cmd)
+{
+	struct arm_smmu_device *smmu = (struct arm_smmu_device *)__opaque;
+
+	arm_smmu_cmdq_batch_add(smmu, cmds, cmd);
+}
+
 static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
 				     unsigned long iova, size_t size,
 				     size_t granule,
 				     struct arm_smmu_domain *smmu_domain)
 {
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	unsigned long end = iova + size, num_pages = 0, tg = 0;
-	size_t inv_range = granule;
 	struct arm_smmu_cmdq_batch cmds;
 
 	if (!size)
 		return;
 
-	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-		/* Get the leaf page size */
-		tg = __ffs(smmu_domain->domain.pgsize_bitmap);
-
-		num_pages = size >> tg;
-
-		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
-		cmd->tlbi.tg = (tg - 10) / 2;
-
-		/*
-		 * Determine what level the granule is at. For non-leaf, both
-		 * io-pgtable and SVA pass a nominal last-level granule because
-		 * they don't know what level(s) actually apply, so ignore that
-		 * and leave TTL=0. However for various errata reasons we still
-		 * want to use a range command, so avoid the SVA corner case
-		 * where both scale and num could be 0 as well.
-		 */
-		if (cmd->tlbi.leaf)
-			cmd->tlbi.ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
-		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
-			num_pages++;
-	}
-
 	arm_smmu_cmdq_batch_init(smmu, &cmds, cmd);
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
-			cmd->tlbi.scale = scale;
-
-			/* Determine how many chunks of 2^scale size we have */
-			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
-			cmd->tlbi.num = num - 1;
-
-			/* range is num * 2^scale * pgsize */
-			inv_range = num << (scale + tg);
-
-			/* Clear out the lower order bits for the next iteration */
-			num_pages -= num << scale;
-		}
-
-		cmd->tlbi.addr = iova;
-		arm_smmu_cmdq_batch_add(smmu, &cmds, cmd);
-		iova += inv_range;
-	}
+	arm_smmu_tlb_inv_build(cmd, iova, size, granule,
+			       smmu_domain->domain.pgsize_bitmap,
+			       smmu->features & ARM_SMMU_FEAT_RANGE_INV,
+			       smmu, __arm_smmu_cmdq_batch_add, &cmds);
 	arm_smmu_cmdq_batch_submit(smmu, &cmds);
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 4aaf93945ee3..4a59b4d39c4f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1072,6 +1072,85 @@ static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
 }
 
+/**
+ * arm_smmu_tlb_inv_build - Create a range invalidation command
+ * @cmd: Base command initialized with OPCODE (S1, S2..), vmid and asid.
+ * @iova: Start IOVA to invalidate
+ * @size: Size of range
+ * @granule: Granule of invalidation
+ * @pgsize_bitmap: Page size bit map of the page table.
+ * @is_range: Use range invalidation commands.
+ * @opaque: Pointer to pass to add_cmd
+ * @add_cmd: Function to send/batch the invalidation command
+ * @cmds: Incase of batching, it includes the pointer to the batch
+ */
+static inline void arm_smmu_tlb_inv_build(struct arm_smmu_cmdq_ent *cmd,
+					  unsigned long iova, size_t size,
+					  size_t granule, unsigned long pgsize_bitmap,
+					  bool is_range, void *opaque,
+					  void (*add_cmd)(void *_opaque,
+							  struct arm_smmu_cmdq_batch *cmds,
+							  struct arm_smmu_cmdq_ent *cmd),
+					  struct arm_smmu_cmdq_batch *cmds)
+{
+	unsigned long end = iova + size, num_pages = 0, tg = 0;
+	size_t inv_range = granule;
+
+	if (is_range) {
+		/* Get the leaf page size */
+		tg = __ffs(pgsize_bitmap);
+
+		num_pages = size >> tg;
+
+		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
+		cmd->tlbi.tg = (tg - 10) / 2;
+
+		/*
+		 * Determine what level the granule is at. For non-leaf, both
+		 * io-pgtable and SVA pass a nominal last-level granule because
+		 * they don't know what level(s) actually apply, so ignore that
+		 * and leave TTL=0. However for various errata reasons we still
+		 * want to use a range command, so avoid the SVA corner case
+		 * where both scale and num could be 0 as well.
+		 */
+		if (cmd->tlbi.leaf)
+			cmd->tlbi.ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
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
+			cmd->tlbi.scale = scale;
+
+			/* Determine how many chunks of 2^scale size we have */
+			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
+			cmd->tlbi.num = num - 1;
+
+			/* range is num * 2^scale * pgsize */
+			inv_range = num << (scale + tg);
+
+			/* Clear out the lower order bits for the next iteration */
+			num_pages -= num << scale;
+		}
+
+		cmd->tlbi.addr = iova;
+		add_cmd(opaque, cmds, cmd);
+		iova += inv_range;
+	}
+}
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.52.0.rc1.455.g30608eb744-goog


