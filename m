Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111B9CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXSBGll6V5AX0HAYiKE1Rqp8ZLXo/cvuVZr8HoLMmEg=; b=DTANJN3egtefMlayUfq+JIo6Bk
	PSAKEtmVH3hW91q0VzByeiYFu6pEicuOU3aNE1HSjBUGxK+h87Kx/RtceP+f0VQMzfMgoPz0BBumK
	a5I5WGb5X28TcrsokzbsqOn8QPU10XkVG+cNKc8qct1Io6kbdKDylQVlvdFeV2ERBm9juFSEo83ln
	kRri3NVJvqOI50i3Yf0qDshR9EPMEBquV86g6lqyRt/UviI4o51pZy9FEeG202IhVj4UQQ30WloYM
	XLPSJq3L2PMk6W5vPEM+jQWAwZpsW1lN4PFbLowZAUp88neFMjB9lRPFzUN+TBcrSqwAYqSZvZnA7
	2IflI+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRma-00000001JO4-36l1;
	Thu, 15 Oct 2026 20:10:32 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlm-00000001INx-1eEH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:47 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48af5a07314so3622101f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094980; x=1792699780; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXSBGll6V5AX0HAYiKE1Rqp8ZLXo/cvuVZr8HoLMmEg=;
        b=mU7tWPqlmzErsv808GrQLrhIFrnS9pJu2AitKPYDWiq1sFD1q2c6jGpsoK5n8Bouv1
         x0WexozYqizFeEVUtLo9db9ZIt0s4/sngFK5pQWx/V2B/ew29v5RFeJ8NnLGCxfAaJnZ
         rYhvufjgy6eQVzZVnEAbZ8TI4v861PmaglICHqaVwugFz9WP4WrrI1kf0saI+usiXfdC
         Ptck8vMgGI8RKLKF1zySWY8pcHBoCzvSR9YKoEgz6JcD7mewAMgViEhJN8FBq4+87hpg
         stS1okZAXRzk9ndtHE2Bkes893oPqq5JOf645Ia8gBXrDO3ceq2mG1CxsuuHSgfDp8nc
         azVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094980; x=1792699780;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXSBGll6V5AX0HAYiKE1Rqp8ZLXo/cvuVZr8HoLMmEg=;
        b=SXny0tFCjwJyjRIzjdiKGCrGlojexC//vzPCh4jU6kM/cD/LQTdSFa3PSfmapIf5K1
         WWwPeobhCqxBJHSrPCXpZsC4rtlew9XeyjH1aCQYal4+enaYvTOvxwlbeLp812Rz4qMh
         fY5tu7FiziAI1mlZIh+Qsgp/qRqBts5jCtAfCYb7ot6+si6ibL2g1POKQIzgN00M3pWE
         ozcDPo/BmjVpD7wyjCHPKHOx19mOh50phFkbeVdOLPdBNmzdNzmMFE8P5t4CQ2JDdJt3
         t91VgsH5k8+z42+8sOjPKSAscruDt2nO/zNqHz4AP3ESSVO1S9GtieRq0YFt1W6/sjDO
         RYLA==
X-Gm-Message-State: AFq9FYLI2iWHB9YWTqLlVvkiyo0z/ix6W+/3dISAtUaS/s1hSc6SbQd1
	VxZEDiiL2OXmik0JkMYiwrScx/2Kx8kXYPoi4XYU3MKfdlgMGRM93GnU20QwxI4LHv6JQDGgs1V
	zg6TEsRSwrvw8Y2PnjAuVRCgxckuqwJX5nICs04lBUuuH89oUNIhbzD/9MBN1ZU1r7g7MMXzmn4
	wOHf374oZQYmIyQpd4Ks2vn6bR3quliVFuW2x/9lItETtyvYo6pAgCeM5zgoH9go134Q==
X-Received: from wmjs1.prod.google.com ([2002:a7b:c381:0:b0:4a1:ae53:2feb])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fcb:b0:4a0:1fe2:d4f1 with SMTP id 5b1f17b1804b1-4a18e4d1686mr397679435e9.28.1792094980042;
 Thu, 15 Oct 2026 13:09:40 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:55 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-25-smostafa@google.com>
Subject: [PATCH v9 24/25] iommu/arm-smmu-v3-kvm: Enable nesting
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
X-CRM114-CacheID: sfid-20261015_130942_535852_E802450B 
X-CRM114-Status: GOOD (  20.47  )
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

As now the hypervisor controls the command queue, stream table,
and shadows the stage-2 page table, we enable stage-2 translation
in case the host puts an STE in bypass or stage-1.

The hypervisor will control the S2 part of the STE and sanitize it.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 112 +++++++++++++++++-
 1 file changed, 106 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 01f23fce6be5..3562bb222f53 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -443,6 +443,60 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_attach_stage_2(struct hyp_arm_smmu_v3_device *smmu,
+			       struct arm_smmu_ste *ste)
+{
+	unsigned long vttbr, cfg;
+	unsigned long ts, sl, ic, oc, sh, tg, ps;
+	struct io_pgtable_cfg *pgt_cfg = &idmap_pgtable->cfg;
+
+	cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(ste->data[0]));
+	if (!FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(ste->data[0])) ||
+	    (cfg == STRTAB_STE_0_CFG_ABORT)) {
+		return 0;
+	}
+	/* S2 is not advertised, that should never be attempted. */
+	if ((cfg == STRTAB_STE_0_CFG_S2_TRANS) ||
+	    (cfg == STRTAB_STE_0_CFG_NESTED))
+		return -EINVAL;
+	vttbr = pgt_cfg->arm_lpae_s2_cfg.vttbr;
+	ps = pgt_cfg->arm_lpae_s2_cfg.vtcr.ps;
+	tg = pgt_cfg->arm_lpae_s2_cfg.vtcr.tg;
+	sh = pgt_cfg->arm_lpae_s2_cfg.vtcr.sh;
+	oc = pgt_cfg->arm_lpae_s2_cfg.vtcr.orgn;
+	ic = pgt_cfg->arm_lpae_s2_cfg.vtcr.irgn;
+	sl = pgt_cfg->arm_lpae_s2_cfg.vtcr.sl;
+	ts = pgt_cfg->arm_lpae_s2_cfg.vtcr.tsz;
+
+	if (smmu->features & ARM_SMMU_FEAT_ATTR_TYPES_OVR) {
+		ste->data[1] &= ~cpu_to_le64(STRTAB_STE_1_SHCFG);
+		ste->data[1] |= cpu_to_le64(FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING));
+	}
+
+	ste->data[1] &= ~cpu_to_le64(STRTAB_STE_1_EATS | STRTAB_STE_1_S2FWB | STRTAB_STE_1_STRW);
+
+	/* The host shouldn't write dwords 2 and 3, overwrite them. */
+	ste->data[2] = cpu_to_le64(FIELD_PREP(STRTAB_STE_2_VTCR,
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
+					      FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
+				   FIELD_PREP(STRTAB_STE_2_S2VMID, 0) |
+				   STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R |
+#ifdef __BIG_ENDIAN
+				   STRTAB_STE_2_S2ENDI |
+#endif
+				   STRTAB_STE_2_S2PTW);
+
+	ste->data[3] = cpu_to_le64(vttbr & STRTAB_STE_3_S2TTB_MASK);
+	/* Convert S1 => nested and bypass => S2 */
+	ste->data[0] |= cpu_to_le64(FIELD_PREP(STRTAB_STE_0_CFG, cfg | BIT(1)));
+	return 0;
+}
+
 static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
 				struct arm_smmu_ste *host_ste_out)
 {
@@ -472,12 +526,40 @@ static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
 	return 0;
 }
 
+struct smmu_ste_writer {
+	struct arm_smmu_entry_writer writer;
+	struct hyp_arm_smmu_v3_device *smmu;
+	u32 sid;
+};
+
+static void smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
+{
+	struct smmu_ste_writer *ste_writer =
+		container_of(writer, struct smmu_ste_writer, writer);
+	struct arm_smmu_cmd cfgi_cmd = arm_smmu_make_cmd_cfgi_ste(ste_writer->sid, true);
+
+	WARN_ON(smmu_send_cmd(ste_writer->smmu, &cfgi_cmd));
+}
+
+static const struct arm_smmu_entry_writer_ops smmu_ste_writer_ops = {
+	.get_used = arm_smmu_get_ste_used,
+	.get_update_safe = arm_smmu_get_ste_update_safe,
+	.sync = smmu_ste_writer_sync_entry,
+};
+
 static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool leaf)
 {
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
-	struct arm_smmu_ste *hyp_ste_ptr, *host_ste_ptr, host_ste_copy;
+	struct arm_smmu_ste *hyp_ste_ptr;
 	u64 *hyp_ste_base = strtab_hyp_base(smmu);
+	__le64 used[STRTAB_STE_DWORDS] = {};
+	struct arm_smmu_ste target = {};
 	int ret, i;
+	struct smmu_ste_writer ste_writer = {
+		.writer.ops = &smmu_ste_writer_ops,
+		.smmu = smmu,
+		.sid = sid,
+	};
 
 	/* Leaf = 0 is not supported, as the kernel driver. */
 	if (!leaf || !is_smmu_enabled(smmu) ||
@@ -493,7 +575,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 			return -E2BIG;
 
 		hyp_ste_ptr = &hyp_table[sid];
-		host_ste_ptr = &host_table[sid];
+		memcpy(target.data, host_table[sid].data, STRTAB_STE_DWORDS << 3);
 	} else {
 		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)hyp_ste_base;
 		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
@@ -502,8 +584,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		if (l1_idx >= cfg->l2.num_l1_ents)
 			return -E2BIG;
 
-		host_ste_ptr = &host_ste_copy;
-		ret = smmu_get_host_l2_ste(smmu, sid, host_ste_ptr);
+		ret = smmu_get_host_l2_ste(smmu, sid, &target);
 		if (ret)
 			return ret;
 
@@ -523,8 +604,27 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		hyp_ste_ptr = &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
 	}
 
-	for (i = 0; i < STRTAB_STE_DWORDS; ++i)
-		WRITE_ONCE(hyp_ste_ptr->data[i], host_ste_ptr->data[i]);
+	/*
+	 * Summary of each host emulated state vs real HW.
+	 * |	Host	|	HW	|
+	 * ==============================
+	 * |	V=0	|	V=0	|
+	 * |	Abort	|	Abort	|
+	 * |	Bypass	|	S2	|
+	 * |	S1	|	S1+S2	|
+	 */
+	ret = smmu_attach_stage_2(smmu, &target);
+	if (ret)
+		return ret;
+
+	/* The HW ignores unused fields, don't let the host set them. */
+	arm_smmu_get_ste_used(target.data, used);
+	for (i = 0; i < STRTAB_STE_DWORDS; i++)
+		target.data[i] &= used[i];
+
+	hyp_spin_lock(&smmu->hw_lock);
+	arm_smmu_write_entry(&ste_writer.writer, hyp_ste_ptr->data, target.data);
+	hyp_spin_unlock(&smmu->hw_lock);
 	return 0;
 }
 
-- 
2.56.0.176.g3575e65682-goog


