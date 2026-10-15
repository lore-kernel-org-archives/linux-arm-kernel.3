Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2408CCA465
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8Ak1AjyYrSkoTMkJRUpVV8BvgfNONKVLHUTW1w7Yqc=; b=HqMjr/1BeETGPMhGzsB2EeR6HC
	XjwEVCvIpIM+A7ZOvfGWa693K9mZ2lD04B13tSowQ8u+nk4vyMDlBK5RwKiIfblB6mvbqrZhDPE2j
	vBQ5i3eAgTzrhiqSAlwk1NQwYDbXgTOx6cS1x+MBU1N3XLoT7jWZeT81fcPU98Mzct0wms6/lGxJE
	123D4qc9tIgWuNHxp3mPGLV3n3pq8aYLAJJKl1zIorCuojhU2UvFkS3I80nKpw3+n41e1M0R2p7Ok
	5EzKdXwmhXKa9pbL9UZu7nhLYg8TPpv22nRwK2NqLmz58ZnSkXKgA/kZeTmuC6dbr4kQbmFEoUuua
	j7stF6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlh-00000001IHy-0vu5;
	Thu, 15 Oct 2026 20:09:37 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlP-00000001Hz3-1zzh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:20 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48c427421f6so1477224f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094957; x=1792699757; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8Ak1AjyYrSkoTMkJRUpVV8BvgfNONKVLHUTW1w7Yqc=;
        b=lESPyQtVIKT7laSp+G3c0hheRrmt94Fxl9ojSD4Z2XWdIvgVIEdDifUqEN8jhI4G4O
         PiZGGdvNvPmw7Ddw6OINNp0c26COig4YNEDfqupshnscSyArAO0FNMuy0RR43LRsW01j
         pCaZwxhO9y5O0Co7f56oY2HspLDyjHZCiSY8DgyrG8BFyk3NQz6b0KweAwwR5du5D6vz
         laOXAWTkwzX3Rx5Cb0HEvqJTD3tMspY9AVPlunmHcnY9TEH0L1ZgpvkoXfFc8zPgiT51
         rxIZ8d3RyjdQgDlx+wgQnMSOR+D8i6gc4xmR4GLmDPVSBbyaTbwUzNwu9cvAVHuw0xDN
         QVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094957; x=1792699757;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8Ak1AjyYrSkoTMkJRUpVV8BvgfNONKVLHUTW1w7Yqc=;
        b=CJ5pfsYxT2u+FWpwK/W+gOaloZ9P6r5TfFOpsIoNRaRZbU5WUWmQzO/m7Tl9X8eHad
         1XVgYHUkN9SDn85aPft4N71BLraK8xgUj4C4C0277IlqCc4SQG+8xmn56YiXtA0973CS
         bKqGITV0edS4beCiemkOIybCGp8n2dIY0WwGIAL5aRyaP4x0olpAiqnS3Az2DApgmuSi
         rJExy4hDpIHXfN2AMjHXwEgCmCs5rWRXQeA53zR3b2S2BSLL2Txq+9oPxZoLCeznCo5D
         SJsBjeIK178fr3tuHXUmGU91cIcUDG82FQAnohBQ9vxukJRp2qr1Gk8+Pm/aFw97Tkzr
         PlEA==
X-Gm-Message-State: AFq9FYIB8euum6/VIXcfdgrsZ9PsVwZ6flWOYSSzBQP+MPF0bUtbv7KP
	uKd3dSszhDTJWsI49BgtmKE61qw9dsRLF4yIgvTEn2vPYn2KgfEzFCcjNw4HgsBgpGkQ5whoEXF
	OpRoDxdN2UNSgPmSS3yb+NNKUBQF0O//lq/Ekj4LY8f0+WV5hkdVrIkuE8pxwe5QmZ3dOZZVafr
	T0Bml4pJuNzWdze1UFiCVM4yBxKk6ug4gF9rHtQfKmbjPTsf+wsatonQLBUfOwIOoUiQ==
X-Received: from wrvs12.prod.google.com ([2002:a5d:4ecc:0:b0:48d:ed95:6614])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:644a:0:b0:486:f42f:6860 with SMTP id ffacd0b85a97d-48dbaaefc28mr30540044f8f.56.1792094956572;
 Thu, 15 Oct 2026 13:09:16 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:36 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-6-smostafa@google.com>
Subject: [PATCH v9 05/25] iommu/arm-smmu-v3: Move RangeInval to common code
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130919_605855_DD8C357B 
X-CRM114-Status: GOOD (  26.00  )
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

Move arm_smmu_tlbi_calc_range() to the common code shared with the
hypervisor as it will use it later to populate TLBIs for the SMMUv3
stage-2 page table.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  | 160 ++++++++++++++++++
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.h  |   2 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 160 ------------------
 3 files changed, 162 insertions(+), 160 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
index cf9287cdbd19..8c15ed04ccdb 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
@@ -484,3 +484,163 @@ void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *entry,
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_write_entry);
+
+/*
+ * Check address alignment for TTL hint per SMMUv3 H.a Section 4.4.1. Address
+ * bits below the alignment must be zero, otherwise UNPREDICTABLE.
+ */
+static bool arm_smmu_ttl_addr_aligned(u64 address, unsigned int tg,
+				      unsigned int ttl)
+{
+	unsigned int pgsz_lg2 = arm_smmu_pt_level_to_lg2sz(tg, 3 - ttl);
+
+	return !(address & GENMASK_U64(pgsz_lg2 - 1, 0));
+}
+
+struct arm_smmu_range_inv {
+	u64 start_tg;
+	/* Normal integer, not encoded. 0 means 0.*/
+	u64 num;
+	unsigned int scale;
+};
+
+static unsigned int arm_smmu_range_inv_calc_scale(u64 num_tg)
+{
+	return fls64((num_tg - 1) / (CMDQ_TLBI_RANGE_NUM_MAX + 1));
+}
+
+static u64 arm_smmu_range_inv_calc_num(u64 num_tg, unsigned int scale)
+{
+	return DIV_ROUND_UP_ULL(num_tg, 1ULL << scale);
+}
+
+/*
+ * Initialize the smallest range invalidation covering num_tg and ending at
+ * last_tg.
+ */
+static struct arm_smmu_range_inv arm_smmu_range_inv_init_end(u64 last_tg,
+							     u64 num_tg)
+{
+	struct arm_smmu_range_inv range_inv = {};
+
+	if (!num_tg)
+		return range_inv;
+
+	range_inv.scale = arm_smmu_range_inv_calc_scale(num_tg);
+	range_inv.num = arm_smmu_range_inv_calc_num(num_tg, range_inv.scale);
+	range_inv.start_tg = last_tg - ((range_inv.num << range_inv.scale) - 1);
+	return range_inv;
+}
+
+static void
+arm_smmu_tlbi_add_range_cmd(struct arm_smmu_tlbi *tlbi,
+			    const struct arm_smmu_range_inv *range_inv, u8 ttl,
+			    u8 tg_enc)
+{
+	struct arm_smmu_cmd *cmd = &tlbi->range.cmds[tlbi->range.num_cmds++];
+	unsigned int tgsz_lg2 = tg_enc * 2 + 10;
+	u64 iova = range_inv->start_tg << tgsz_lg2;
+	unsigned int num = range_inv->num - 1;
+
+	/* 16K granule TTL=1 is reserved (Section 4.4.1) */
+	if (WARN_ON(tgsz_lg2 == 14 && ttl == 1))
+		ttl = 0;
+
+	/* Verify address alignment for the TTL hint */
+	if (ttl && !arm_smmu_ttl_addr_aligned(iova, tgsz_lg2, ttl))
+		ttl = 0;
+
+	/*
+	 * SMMUv3 H.a Section 4.4.1: TG!=0, NUM==0, SCALE==0, TTL==0 is Reserved
+	 * and causes CERROR_ILL. Single tg uses NUM=0, SCALE=0 with a TTL hint
+	 * to target only the exact leaf entry.
+	 *
+	 * For a single tg invalidation a 0 TTL can come from places like the
+	 * SVA path that don't have enough information to get a TTL, or as a
+	 * side of effect of the splitting.
+	 *
+	 * A single-TG invalidation cannot reach this point if it is part of a
+	 * CONT group, so it is safe to transform it into a single invalidation.
+	 * The ARM_SMMU_OPT_FULL_CONT_RANGE_INV errata does not apply.
+	 */
+	if (!num && !range_inv->scale && !ttl)
+		tg_enc = 0;
+
+	cmd->data[0] = FIELD_PREP(CMDQ_TLBI_0_NUM, num) |
+		       FIELD_PREP(CMDQ_TLBI_0_SCALE, range_inv->scale);
+	cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, tlbi->leaf_only) |
+		       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
+		       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) | iova;
+}
+
+/*
+ * Generate up to two range TLBI command payloads covering [iova, iova+size).
+ * Sets use_full_inv if the range is too large to represent.
+ *
+ * Normally the first range invalidation is the largest representable span which
+ * does not exceed the requested range. If necessary, the second range
+ * invalidation is the smallest representable range covering the remainder and
+ * is anchored at the end. Any excess coverage from the second range
+ * invalidation overlaps the first instead of exceeding the requested range.
+ *
+ * For SVA on an invs containing an SMMU with ARM_SMMU_OPT_FULL_CONT_RANGE_INV,
+ * produce only a single range invalidation and overinvalidate so any potential CONT is
+ * covered by one command.
+ */
+void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
+			      bool single_range_inv)
+{
+	u8 tgsz_lg2 = tlbi->tgsz_lg2;
+	struct arm_smmu_range_inv first = { .start_tg = tlbi->iova >>
+							tgsz_lg2 };
+	u64 last_tg = (tlbi->iova + tlbi->size - 1) >> tgsz_lg2;
+	u64 num_tg = last_tg - first.start_tg + 1;
+	u8 tg_enc = (tgsz_lg2 - 10) / 2;
+	struct arm_smmu_range_inv trail;
+	u8 ttl = 0;
+
+	/*
+	 * Determine what level the granule is at. For non-leaf, both io-pgtable
+	 * and SVA pass a nominal last-level granule because they don't know
+	 * what level(s) actually apply, so leave TTL=0.
+	 */
+	if (tlbi->leaf_only)
+		ttl = 4 - ((ilog2(tlbi->iopte_size) - 3) / (tgsz_lg2 - 3));
+
+	/*
+	 * The spec defines the invalidated range as:
+	 *   Range = ((NUM+1) * 2^SCALE) * Translation_Granule_Size
+	 * NUM is 5 bits, so (NUM+1) covers 1..32 granules. Find the smallest
+	 * SCALE at which a single command could cover num_tg.
+	 *
+	 * Unlike other IOMMUs the spec has no alignment requirement on the
+	 * address beyond alignment to tg (so long as TTL=0).
+	 */
+	first.scale = arm_smmu_range_inv_calc_scale(num_tg);
+	if (first.scale > 31) {
+		/* Range too large for a single command do full invalidation */
+		tlbi->range.use_full_inv = true;
+		return;
+	}
+
+	if (single_range_inv) {
+		/*
+		 * Produce a single invalidation by rounding up and disabling
+		 * the trailer.
+		 */
+		first.num = arm_smmu_range_inv_calc_num(num_tg, first.scale);
+		trail.num = 0;
+	} else {
+		/*
+		 * Produce two invalidations by rounding down and adding a
+		 * second trailing range invalidation anchored at the end.
+		 */
+		first.num = num_tg >> first.scale;
+		trail = arm_smmu_range_inv_init_end(
+			last_tg, num_tg - ((u64)first.num << first.scale));
+	}
+	arm_smmu_tlbi_add_range_cmd(tlbi, &first, ttl, tg_enc);
+
+	if (trail.num)
+		arm_smmu_tlbi_add_range_cmd(tlbi, &trail, ttl, tg_enc);
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
index 55ffa880b093..9f6949a60fe8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
@@ -42,4 +42,6 @@ void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
 void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *cur,
 			  const __le64 *target);
 
+void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi, bool single_range_inv);
+
 #endif /* __ARM_SMMU_V3_COMMON_LIB_H */
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5d7de893865e..c2ec33c763a0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2182,166 +2182,6 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 	arm_smmu_domain_inv(smmu_domain);
 }
 
-/*
- * Check address alignment for TTL hint per SMMUv3 H.a Section 4.4.1. Address
- * bits below the alignment must be zero, otherwise UNPREDICTABLE.
- */
-static bool arm_smmu_ttl_addr_aligned(u64 address, unsigned int tg,
-				      unsigned int ttl)
-{
-	unsigned int pgsz_lg2 = arm_smmu_pt_level_to_lg2sz(tg, 3 - ttl);
-
-	return !(address & GENMASK_U64(pgsz_lg2 - 1, 0));
-}
-
-struct arm_smmu_range_inv {
-	u64 start_tg;
-	/* Normal integer, not encoded. 0 means 0.*/
-	u64 num;
-	unsigned int scale;
-};
-
-static unsigned int arm_smmu_range_inv_calc_scale(u64 num_tg)
-{
-	return fls64((num_tg - 1) / (CMDQ_TLBI_RANGE_NUM_MAX + 1));
-}
-
-static u64 arm_smmu_range_inv_calc_num(u64 num_tg, unsigned int scale)
-{
-	return DIV_ROUND_UP_ULL(num_tg, 1ULL << scale);
-}
-
-/*
- * Initialize the smallest range invalidation covering num_tg and ending at
- * last_tg.
- */
-static struct arm_smmu_range_inv arm_smmu_range_inv_init_end(u64 last_tg,
-							     u64 num_tg)
-{
-	struct arm_smmu_range_inv range_inv = {};
-
-	if (!num_tg)
-		return range_inv;
-
-	range_inv.scale = arm_smmu_range_inv_calc_scale(num_tg);
-	range_inv.num = arm_smmu_range_inv_calc_num(num_tg, range_inv.scale);
-	range_inv.start_tg = last_tg - ((range_inv.num << range_inv.scale) - 1);
-	return range_inv;
-}
-
-static void
-arm_smmu_tlbi_add_range_cmd(struct arm_smmu_tlbi *tlbi,
-			    const struct arm_smmu_range_inv *range_inv, u8 ttl,
-			    u8 tg_enc)
-{
-	struct arm_smmu_cmd *cmd = &tlbi->range.cmds[tlbi->range.num_cmds++];
-	unsigned int tgsz_lg2 = tg_enc * 2 + 10;
-	u64 iova = range_inv->start_tg << tgsz_lg2;
-	unsigned int num = range_inv->num - 1;
-
-	/* 16K granule TTL=1 is reserved (Section 4.4.1) */
-	if (WARN_ON(tgsz_lg2 == 14 && ttl == 1))
-		ttl = 0;
-
-	/* Verify address alignment for the TTL hint */
-	if (ttl && !arm_smmu_ttl_addr_aligned(iova, tgsz_lg2, ttl))
-		ttl = 0;
-
-	/*
-	 * SMMUv3 H.a Section 4.4.1: TG!=0, NUM==0, SCALE==0, TTL==0 is Reserved
-	 * and causes CERROR_ILL. Single tg uses NUM=0, SCALE=0 with a TTL hint
-	 * to target only the exact leaf entry.
-	 *
-	 * For a single tg invalidation a 0 TTL can come from places like the
-	 * SVA path that don't have enough information to get a TTL, or as a
-	 * side of effect of the splitting.
-	 *
-	 * A single-TG invalidation cannot reach this point if it is part of a
-	 * CONT group, so it is safe to transform it into a single invalidation.
-	 * The ARM_SMMU_OPT_FULL_CONT_RANGE_INV errata does not apply.
-	 */
-	if (!num && !range_inv->scale && !ttl)
-		tg_enc = 0;
-
-	cmd->data[0] = FIELD_PREP(CMDQ_TLBI_0_NUM, num) |
-		       FIELD_PREP(CMDQ_TLBI_0_SCALE, range_inv->scale);
-	cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, tlbi->leaf_only) |
-		       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
-		       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) | iova;
-}
-
-/*
- * Generate up to two range TLBI command payloads covering [iova, iova+size).
- * Sets use_full_inv if the range is too large to represent.
- *
- * Normally the first range invalidation is the largest representable span which
- * does not exceed the requested range. If necessary, the second range
- * invalidation is the smallest representable range covering the remainder and
- * is anchored at the end. Any excess coverage from the second range
- * invalidation overlaps the first instead of exceeding the requested range.
- *
- * For SVA on an invs containing an SMMU with ARM_SMMU_OPT_FULL_CONT_RANGE_INV,
- * produce only a single range invalidation and overinvalidate so any potential CONT is
- * covered by one command.
- */
-static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
-				     bool single_range_inv)
-{
-	u8 tgsz_lg2 = tlbi->tgsz_lg2;
-	struct arm_smmu_range_inv first = { .start_tg = tlbi->iova >>
-							tgsz_lg2 };
-	u64 last_tg = (tlbi->iova + tlbi->size - 1) >> tgsz_lg2;
-	u64 num_tg = last_tg - first.start_tg + 1;
-	u8 tg_enc = (tgsz_lg2 - 10) / 2;
-	struct arm_smmu_range_inv trail;
-	u8 ttl = 0;
-
-	/*
-	 * Determine what level the granule is at. For non-leaf, both io-pgtable
-	 * and SVA pass a nominal last-level granule because they don't know
-	 * what level(s) actually apply, so leave TTL=0.
-	 */
-	if (tlbi->leaf_only)
-		ttl = 4 - ((ilog2(tlbi->iopte_size) - 3) / (tgsz_lg2 - 3));
-
-	/*
-	 * The spec defines the invalidated range as:
-	 *   Range = ((NUM+1) * 2^SCALE) * Translation_Granule_Size
-	 * NUM is 5 bits, so (NUM+1) covers 1..32 granules. Find the smallest
-	 * SCALE at which a single command could cover num_tg.
-	 *
-	 * Unlike other IOMMUs the spec has no alignment requirement on the
-	 * address beyond alignment to tg (so long as TTL=0).
-	 */
-	first.scale = arm_smmu_range_inv_calc_scale(num_tg);
-	if (first.scale > 31) {
-		/* Range too large for a single command do full invalidation */
-		tlbi->range.use_full_inv = true;
-		return;
-	}
-
-	if (single_range_inv) {
-		/*
-		 * Produce a single invalidation by rounding up and disabling
-		 * the trailer.
-		 */
-		first.num = arm_smmu_range_inv_calc_num(num_tg, first.scale);
-		trail.num = 0;
-	} else {
-		/*
-		 * Produce two invalidations by rounding down and adding a
-		 * second trailing range invalidation anchored at the end.
-		 */
-		first.num = num_tg >> first.scale;
-		trail = arm_smmu_range_inv_init_end(
-			last_tg, num_tg - ((u64)first.num << first.scale));
-	}
-	arm_smmu_tlbi_add_range_cmd(tlbi, &first, ttl, tg_enc);
-
-	if (trail.num)
-		arm_smmu_tlbi_add_range_cmd(tlbi, &trail, ttl, tg_enc);
-}
-
 /*
  * One TLBI command per IOTLB entry, assuming the entries are all at least
  * iopte_granule sized. Sets use_full_inv if too many commands would be needed
-- 
2.56.0.176.g3575e65682-goog


