Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B50CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cn3lch7CcipEUf/hsRSFMjJhdn+CahR9BLaY3vu1ZIo=; b=cSvkcNAYTL3Y/vriZQ4ng888I8
	P7W40pIbDKKbx1sdoBmZltX4mp/OaK6f/z7zDiXkIWKmY6ygT3oLLqG2HTqwT9cghJc75n6gZAuEW
	QPowH7ygZazSppRG+yASm9k7ApeuhMjcg0nlYgkyCQipJMK0Bc5w7yJfFIURs6OMkLMdmHLvtLhc2
	ePjvPO9zkUdfVrGRVBrTLJWp1garWFrsjJ7D3lhiWk77FuVpaGzaIyZW40C3wzYszr1ROzlOiMpgm
	2QAEvRlS37yWOTAoTDLYCQs+kNfiqLifeDFVINkgPSH8NuNTgXrL+8ow6GZvD5e5K51I5/DwJZF0s
	GXakx38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluj-00000006cfq-3oFL;
	Fri, 01 May 2026 11:20:09 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlue-00000006cbO-28Um
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:08 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48a5adc141cso10233565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634402; x=1778239202; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cn3lch7CcipEUf/hsRSFMjJhdn+CahR9BLaY3vu1ZIo=;
        b=wky/NBsl+ienPPBEoB6UCf36zhKRwjs4phQFpgYs8rO+RVUOtGYhvRtjANdoMwaEJO
         Fj86EdsBxk+amruVp0aAOKTCFEyU3HrbORrD+2Wp93oUWTLhSCIh5Nu7rsPb7eBqljM6
         rEZaZYZGS9BvSq5BQMSVviiENKCqhF4jgwRwfpDZM4Ev5BIHD6yFPSogkxwgBdyEsxBf
         ve2+nwYAZZRvunPMIl7O5/LTE/PCStPyC1E5+cnb3ICAGvvGolZISUnHPxWVhxoXXQvH
         nENfjAHpYlu7veX4ztjeUeD4H/oJ333QYjZE2QJWqO41a6zvQGXpHLSaSve8zdX2eWkl
         oWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634402; x=1778239202;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cn3lch7CcipEUf/hsRSFMjJhdn+CahR9BLaY3vu1ZIo=;
        b=iKf9zxkVVT9toUmT34ggvOCuJ1M3eEL0UHpuKU9SWvVgWRt7CDGxJH5VI1usaFqIp4
         jFYALsk45ph6nviLggs9fUao9haENGPFuqWkQB71PtXIAAkkNKXgYZ00EDN8K6N8pMHw
         aZyVAeufhBx9nZPb9rxVoi9Oq4+R+ADvxyA8gizrukXW8zvsRoQEv3xkwlRYekeT/fIc
         Zm4BMYWP/1ymis6q50Ugv0gFpox/UnqXVoRnxyR8U1HLHoc7ti8ns/NkUoYXBU7jv7bT
         Eyn282kEVeQayeVcGm+EsstB6iUp0Evr/egAxmJTNM2D5bTWukFagjdkYM6+djaiwMqk
         NFww==
X-Gm-Message-State: AOJu0Yw2f+Pn8PBfhyPVTRTSmsJL+WQWa20vvT1sH/I1mUW5gJHAS0ZT
	fvoPjW/Xdzq4OmNwO1tOUodwsqH7HQQn9u7/XoqmS4NRVXoOUViAdgz0G0/MZ0QLu24U0dgeFNN
	0A+hF+UqRZvhKAvDvpQCFbjc7w3NW4WRIT2ZE0S9tPUXGf7MHzJo2St3+ZlpBBgprSVqQLmIk/G
	NqTNoKXROZ2hMpvuL9lOjxVwp2U/oQ2sbGsxs8x2wwWmKlt3KERj+RregE7f2SAuQt3Q==
X-Received: from wrna11.prod.google.com ([2002:adf:e5cb:0:b0:449:2f8e:2b32])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310e:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48a93e9bb92mr17243045e9.4.1777634401907;
 Fri, 01 May 2026 04:20:01 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:06 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-5-smostafa@google.com>
Subject: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation into
 common code
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042004_586936_9626B4B9 
X-CRM114-Status: GOOD (  20.81  )
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 65 ++++--------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 76 +++++++++++++++++++++
 2 files changed, 88 insertions(+), 53 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index cb64f88989f0..c22832d26495 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2362,68 +2362,27 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 	arm_smmu_domain_inv(smmu_domain);
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
 static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 					  struct arm_smmu_cmdq_batch *cmds,
 					  struct arm_smmu_cmdq_ent *cmd,
 					  unsigned long iova, size_t size,
 					  size_t granule, size_t pgsize)
 {
-	unsigned long end = iova + size, num_pages = 0, tg = pgsize;
-	size_t inv_range = granule;
-
 	if (WARN_ON_ONCE(!size))
 		return;
 
-	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
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
-		arm_smmu_cmdq_batch_add(smmu, cmds, cmd);
-		iova += inv_range;
-	}
+	arm_smmu_tlb_inv_build(cmd, iova, size, granule,
+			       pgsize, smmu->features & ARM_SMMU_FEAT_RANGE_INV,
+			       smmu, __arm_smmu_cmdq_batch_add, cmds);
 }
 
 static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 9b8c5fb7282b..7be41dbe5aaa 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1204,6 +1204,82 @@ static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
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
+ * @add_cmd: Function to send/batch the invalidation command
+ * @cmds: Incase of batching, it includes the pointer to the batch
+ */
+static inline void arm_smmu_tlb_inv_build(struct arm_smmu_cmdq_ent *cmd,
+					  unsigned long iova, size_t size,
+					  size_t granule, unsigned long pgsize,
+					  bool is_range, void *opaque,
+					  void (*add_cmd)(void *_opaque,
+							  struct arm_smmu_cmdq_batch *cmds,
+							  struct arm_smmu_cmdq_ent *cmd),
+					  struct arm_smmu_cmdq_batch *cmds)
+{
+	unsigned long end = iova + size, num_pages = 0, tg = pgsize;
+	size_t inv_range = granule;
+
+	if (is_range) {
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
2.54.0.545.g6539524ca2-goog


