Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7F9CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBYFLa+FC4uonW8niogdkcZuL7rcf529F6haDy+QJc8=; b=d1P5WU4vmR91EstSD6gOCmRCWI
	XI9WdZmS2EQGMiTVUN9nMZ55/eVg/dwgCZDMt5unaYLvqVMy1LK/UJ1wIHxNegOZKhj6qif1JyJQ6
	Gda1KFDzLV2z1+xH566eqLha34TrTHaUCsCD988H1PKbCgddai45OIslzNb/WWP2B+7T55VEP/MlU
	bhaB7QyM4oR4KodF3TKhtbkL2xn+iCEEX4dCeYAhjIulEd+L355FUiEqVPX3rDh0kmQCBWZyEGkfX
	SC0W8Agg9QJQnB5gFrLWNrEd9wo53nps3Lo3NON3F7ZmAxkUOFas71US1s7daiizsZwus/jMiZXO5
	X1PQMOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlvI-00000006dZM-1ae0;
	Fri, 01 May 2026 11:20:44 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlvB-00000006dKX-1YWK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:39 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-486fa07f2bbso12923645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634434; x=1778239234; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cBYFLa+FC4uonW8niogdkcZuL7rcf529F6haDy+QJc8=;
        b=P8bFzrkOHKyr51IVhWn/jS1dVv5bmEwqcy/hlXMY+PN8kD6lNdwS9c83NmdDbSGoUM
         POkW6M+4zPolM3MJDvxMMscF5yg8BZmHe0fbJM5YpyROLrB0pUS2JQ1WAnvZfz/4DoYH
         oP3TSFH/JX/G0g9J1/QE3vhgIaOoaQJM9DVHbARAcllXxCBVVzUhhThejwmiLRlG3Tmk
         BEzH8nw3GI4cofNrUFpyom4kqGi4SMMEspkv93usWTDjjNkJY2jr+248HFcI8KvjNEeV
         gXqMLX6l2YUPhhZfYk/Pu212AkTWx2JViOTOfop9TdoUkuKEXiVlbQlxlC1k+h/RjLFr
         KyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634434; x=1778239234;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBYFLa+FC4uonW8niogdkcZuL7rcf529F6haDy+QJc8=;
        b=goP4xVCpm4q3e2FIy80132y8kMv5HJO2YK4kljJJqjTWktMgvDnqxNSdnNSRZ4jiGL
         /qnddfexTa6lfqw8nJRUKppJhYm03AAMhfplvKvbdWbFZJ5rSV/1RNt54Qz1kdkJ1a34
         xVBr6myXvy+IrPGc/g9W3WyEyUT3Aal9X/spvKQVK4ytZwAX/+jwu4NBDc6/saL8UB+Y
         rDjBlfofTG6faE/pVF7YZSUqDPiyYqBHJ7GAKbcpavtj/u1zh/nbBtESPeJCFGG++/09
         THMcycRLgm3331JkGJ61aqDrfq7Bol9i8lcN1Ljalcy0TQSIbPybJFMsLaZD1NI5Bx4o
         9s3Q==
X-Gm-Message-State: AOJu0Yyksn0v5XZbCFRFvjXL+a4MDe2yNSozNZx7Ypyq1EbMIszgrZk2
	PraQWSON9eVWhIwD1JQhZet2nT+g7H/lNxcHzdFwfcBHxEuiQ9EjLKy2UHEea3M563LDddj9muG
	eJ3hcmB7vsEBFBTVFsPPGEDvuZN9HWw/UU9J9e+VvjgjwUKF6cDKx9dZA8Xjn/VDCeD/0qmzl5Y
	tStVnd/nQ6UA/YS71R+jm8ygiXdWfCdMMzbhBSevLe14hObNYHv0DK9XA/IN0dzlr7qA==
X-Received: from wmrk12.prod.google.com ([2002:a05:600c:b4c:b0:489:1dcf:1b38])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4588:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-48a8447f4e9mr111938855e9.27.1777634434360;
 Fri, 01 May 2026 04:20:34 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:26 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-25-smostafa@google.com>
Subject: [PATCH v6 24/25] iommu/arm-smmu-v3-kvm: Enable nesting
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
X-CRM114-CacheID: sfid-20260501_042037_539522_0F145877 
X-CRM114-Status: GOOD (  22.08  )
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

Now, as the hypervisor controls the command queue, stream table,
and shadows the stage-2 page table.
Enable stage-2 in case the host puts an STE in bypass or stage-1.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 108 ++++++++++++++++--
 1 file changed, 101 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index b73a2462f0dd..3d727d6dfbf0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -411,6 +411,57 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_attach_stage_2(struct arm_smmu_ste *ste)
+{
+	unsigned long vttbr;
+	unsigned long ts, sl, ic, oc, sh, tg, ps;
+	unsigned long cfg;
+	struct io_pgtable_cfg *pgt_cfg =  &idmap_pgtable->cfg;
+
+	cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(ste->data[0]));
+	if (!FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(ste->data[0])) ||
+	    (cfg == STRTAB_STE_0_CFG_ABORT)) {
+		ste->data[2] = 0;
+		ste->data[3] = 0;
+		return 0;
+	}
+	/* S2 is not advertised, that should never be attempted. */
+	if (cfg == STRTAB_STE_0_CFG_NESTED)
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
+	ste->data[1] &= ~cpu_to_le64(STRTAB_STE_1_SHCFG);
+	ste->data[1] |= cpu_to_le64(FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING));
+
+	/* The host shouldn't write dwords 2 and 3, overwrite them. */
+	ste->data[2] = cpu_to_le64(FIELD_PREP(STRTAB_STE_2_VTCR,
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
+		 FIELD_PREP(STRTAB_STE_2_S2VMID, 0) |
+		 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R |
+ #ifdef __BIG_ENDIAN
+		STRTAB_STE_2_S2ENDI |
+#endif
+		STRTAB_STE_2_S2PTW);
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
@@ -440,9 +491,18 @@ static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
 static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool leaf)
 {
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
-	struct arm_smmu_ste *hyp_ste_ptr, *host_ste_ptr, host_ste_copy;
+	struct arm_smmu_ste *hyp_ste_ptr;
 	u64 *hyp_ste_base = strtab_hyp_base(smmu);
-	int ret;
+	struct arm_smmu_ste target = {};
+	struct arm_smmu_cmdq_ent cfgi_cmd = {
+		.opcode	= CMDQ_OP_CFGI_STE,
+		.cfgi	= {
+			.sid	= sid,
+			.leaf	= true,
+		},
+	};
+	bool cur_valid, target_valid;
+	int i, ret;
 
 	/*
 	 * Linux only uses leaf = 1, when leaf is 0, we need to verify that this
@@ -463,7 +523,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 			return -E2BIG;
 
 		hyp_ste_ptr = &hyp_table[sid];
-		host_ste_ptr = &host_table[sid];
+		memcpy(target.data, host_table[sid].data, STRTAB_STE_DWORDS << 3);
 	} else {
 		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)hyp_ste_base;
 		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
@@ -472,8 +532,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		if (l1_idx >= cfg->l2.num_l1_ents)
 			return -E2BIG;
 
-		host_ste_ptr = &host_ste_copy;
-		ret = smmu_get_host_l2_ste(smmu, sid, host_ste_ptr);
+		ret = smmu_get_host_l2_ste(smmu, sid, &target);
 		if (ret)
 			return ret;
 
@@ -491,9 +550,44 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		hyp_ste_ptr = &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
 	}
 
-	memcpy(hyp_ste_ptr->data, host_ste_ptr->data, STRTAB_STE_DWORDS << 3);
 
-	return 0;
+	/*
+	 * Summary of each host emulated state vs real HW.
+	 * |	Host	|	HW	|
+	 * ==============================
+	 * |	V=0	|	V=0	|
+	 * |	Abort	|	Abort	|
+	 * |	Bypass	|	S2	|
+	 * |	S1	|	S1+S2	|
+	 *
+	 * For the host, any V=0 transition is not hitless, all other permutations of
+	 * (abort, bypass, S1) transitions are hitless.
+	 * For the HW state, any V=0 transition is not hitless, as all the S2 config is
+	 * always the same (ttbr, vtcr...), all other transitions should be hitless too.
+	 * However, the host is not trusted, which means that any V=0 <=> V=1 transitions
+	 * we need to enforce writing order of the STE and add CFGI.
+	 */
+	cur_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(hyp_ste_ptr->data[0]));
+	ret = smmu_attach_stage_2(&target);
+	if (ret)
+		return ret;
+	target_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(target.data[0]));
+	if (cur_valid && !target_valid) {
+		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
+		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
+		for (i = 1; i < STRTAB_STE_DWORDS; i++)
+			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
+	} else if (!cur_valid && target_valid) {
+		for (i = 1; i < STRTAB_STE_DWORDS; i++)
+			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
+		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
+		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
+	} else {
+		for (i = 0; i < STRTAB_STE_DWORDS; i++)
+			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
+	}
+
+	return smmu_send_cmd(smmu, &cfgi_cmd);
 }
 
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
-- 
2.54.0.545.g6539524ca2-goog


