Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AC9C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCxykfAjLEYMMvCVcdT1GfjF39XVffctpOWmsmN/ev4=; b=inUmmso1awUTuIT+QIA0N3rjys
	+1VKtqnwpTSxMkpQ4j3RMfI22tFKrg8bK2gRVNJvfesxAw+0akMMyFSiXNG8Fr99NE8fOzqYg80Ef
	hW1dFGp0jpxWKnPzsXDPXkv4uFew2sUP8WDQGwGroakl8/cdhPxUmgLrMvRUS2tPxzTALWajN/FLq
	J9beCIig7xYpK4d/F4bCx9b9G9Yi4HOLPEEKhr2xNjZNfHmI1J70srj6xyuYoB4JjLri2vbBqH6uO
	0EUYO95cVuKHZube5yHQBE6yT7gcn8hF2fIcfijr7/U7s/swAZ9Sj/zrd/ZW1skM+sWTH0ujuuv/P
	O6Dqg0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHa-0000000Efuz-3TYb;
	Wed, 15 Jul 2026 12:00:10 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHB-0000000EfTk-03om
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:46 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-698ae260973so7582792a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116783; x=1784721583; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCxykfAjLEYMMvCVcdT1GfjF39XVffctpOWmsmN/ev4=;
        b=wR3N7rjrGrEygVRB2AKMpg1e1dHbsPRQIs1DKimZjfOkxyWf/cWvpMnoVJTfv5Weha
         DRizzyNU8oZTVdR87yWOSJKGrufTrnGnCESLt5VW7AJnRpoDlnldvMTvUijsQFpxUDOC
         Ix8mBv3+8AJNZ+jD/fPZtc4GYqMOoXVM+jdXfun94BEGCXDwY3B8+L2X7/IsieSDshFR
         PmjU8rWcuMfzZSnX1f3gPsBNZggLLoZW5xJ1VRZeH3nDf23y3cNdQe+LmX5sei1x0C0/
         31THxBip5h8YhcK8DQC0a8oGplKkRreq7UXMUljP6Fa9iYrZfPIz3rvpI80YYQxXD5Sr
         bJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116783; x=1784721583;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCxykfAjLEYMMvCVcdT1GfjF39XVffctpOWmsmN/ev4=;
        b=MBmusOVAr5FIJ7OypaT5iIpUPz0XvhMpzpYEVDwR2+JQuf3JF2DgsG9kABgXfHPdZn
         eBx2X7MSsJFd9wiqCFURLpSyQykzU1XzXlpdBTCB3x9VfhODkgWCpDRgicfdXCuT5aRP
         ANZ9xuRKlhNCrWiwSOdBqPoRM65ed2rxfpGNVqdPsrj2+A+egYu62u/RbgylxiVzI5pJ
         Zn8YYdvI2wtYMVXQpuhDjM48gTvwvFQzN0Sig03EhpVQKJOsoleLRT0h8z+14q1r/w2Z
         YcWivwcSnw1TbR1/1Addu0dt0GgEt8RrMKc5GcR/a9IyOdDCfxujBw2HhoPNbEvYWZLW
         4ZDQ==
X-Gm-Message-State: AOJu0YyLBGCXsIH9f2Ech2xPR3apJ8kyuAN3Lqmx+u6heZCcCjXW+CHM
	3dyTm/jyZj2ZwbfcsvDGZDSD4OSfzlyZvOAuUxLnz1LQGVZF8K2/BNnEjaJHp/5c+X2uaVB7wj4
	Gb5zLFWws3pjXchzHLXTcNbsCfS/RLoaEKOh+UzePB6XITMI61FrOjfD2I0kkoGN/+nqj/2m9Mg
	e4hCJfMPybY2Cb2M7xGZt50gJQoqU/8iMfP4seIxMOzfZ9gldDNAaJV6hu7nWEYhZq8Q==
X-Received: from edvw11.prod.google.com ([2002:a05:6402:128b:b0:69c:79d3:df42])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a292:20b0:69c:76c6:9bef with SMTP id 4fb4d7f45d1cf-69e197771femr873479a12.10.1784116782673;
 Wed, 15 Jul 2026 04:59:42 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:59:04 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-24-smostafa@google.com>
Subject: [PATCH v7 23/24] iommu/arm-smmu-v3-kvm: Enable nesting
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
X-CRM114-CacheID: sfid-20260715_045945_158098_978F7CD9 
X-CRM114-Status: GOOD (  20.64  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 109 ++++++++++++++++--
 1 file changed, 102 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index f30757dd9b11..4625240a5de2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -380,6 +380,59 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
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
+	ste->data[1] &= ~cpu_to_le64(STRTAB_STE_1_EATS | STRTAB_STE_1_S2FWB);
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
@@ -412,8 +465,12 @@ static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
 static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool leaf)
 {
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
-	struct arm_smmu_ste *hyp_ste_ptr, *host_ste_ptr, host_ste_copy;
+	struct arm_smmu_ste *hyp_ste_ptr;
 	u64 *hyp_ste_base = strtab_hyp_base(smmu);
+	struct arm_smmu_ste target = {};
+	struct arm_smmu_cmd cfgi_cmd = arm_smmu_make_cmd_cfgi_ste(sid, true);
+	bool cur_valid, target_valid;
+	u32 target_cfg;
 	int ret, i;
 
 	/*
@@ -435,7 +492,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 			return -E2BIG;
 
 		hyp_ste_ptr = &hyp_table[sid];
-		host_ste_ptr = &host_table[sid];
+		memcpy(target.data, host_table[sid].data, STRTAB_STE_DWORDS << 3);
 	} else {
 		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)hyp_ste_base;
 		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
@@ -444,8 +501,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		if (l1_idx >= cfg->l2.num_l1_ents)
 			return -E2BIG;
 
-		host_ste_ptr = &host_ste_copy;
-		ret = smmu_get_host_l2_ste(smmu, sid, host_ste_ptr);
+		ret = smmu_get_host_l2_ste(smmu, sid, &target);
 		if (ret)
 			return ret;
 
@@ -463,9 +519,48 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		hyp_ste_ptr = &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
 	}
 
-	for (i = 0 ; i < STRTAB_STE_DWORDS ; ++i)
-		WRITE_ONCE(hyp_ste_ptr->data[i], host_ste_ptr->data[i]);
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
+	 * or any transition to an abort STE we need to enforce writing order of the STE
+	 * dword 0 and add CFGI.
+	 * Otherwise, we write the STE in the opposite order to cover cases from abort
+	 * to S2 or nested.
+	 */
+	ret = smmu_attach_stage_2(&target);
+	if (ret)
+		return ret;
+	hyp_spin_lock(&smmu->hw_lock);
+	cur_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(hyp_ste_ptr->data[0]));
+	target_cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(target.data[0]));
+	target_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(target.data[0]));
+	if ((cur_valid && !target_valid) ||
+	    (target_cfg == STRTAB_STE_0_CFG_ABORT)) {
+		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
+		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
+		for (i = 1; i < STRTAB_STE_DWORDS; i++)
+			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
+	} else {
+		for (i = 1; i < STRTAB_STE_DWORDS; i++)
+			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
+		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
+		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
+	}
+
+	ret = smmu_send_cmd(smmu, &cfgi_cmd);
+	hyp_spin_unlock(&smmu->hw_lock);
+	return ret;
 }
 
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
-- 
2.55.0.141.g00534a21ce-goog


