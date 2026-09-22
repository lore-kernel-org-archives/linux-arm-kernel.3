Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C98C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7x6tfErkSiFlzGsGfOwlIUPo7E3FNSLjiZHvuCyhifo=; b=iSuJgfdCA/ArTCVGVgp2fvxIqC
	E7vfjuHGIM3BxcR1oLgUX+YcSLlpCIb8LEIIn7xltt/+DJ/WHekEsi0AZxFKi6db45j8Xwcy/5qqw
	6bnzFjWkWwoIqBf9tJz+Q+iRi+EQ68ENq4FOPSxtJb71JKLGBh5JkV9YauCXNpb4Q1D10yXtG7fNh
	dToRdPUPq3KcweaxQsNWuyQRKV40nW31tDiZnq+v6CDQZA/5tZ4NkYYTCMw1W4MY6AHwzLU6i5qn0
	nT3mJlI8yQoSHF3ctEmz+J/jJXaDY03IoDYfeImtv6rCvmklDxaQfZ5aw6aBXN79ffsS3yljLKaDR
	KZG+XjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Jk-00000005Sl5-0C1s;
	Tue, 22 Sep 2026 13:13:52 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JS-00000005SS1-08ZD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:35 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6a9bb406f0cso4470597a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082812; x=1790687612; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7x6tfErkSiFlzGsGfOwlIUPo7E3FNSLjiZHvuCyhifo=;
        b=wSQnGYmbLy2z8CkmPPagM8y8RX5sv9tEoAWiyzHDgcFDjgXblO/A79eH+47LqZTEH4
         toyy2I6tptlyznxgWY7VxdNCA4nw2kw6rcYtgxMXTqbz2kVazKD8vDVVM7mDQqFsMHlP
         HvgWXBFzTCLdZaPoRCT3+FM5bo5wKpx+PArEmWgNYNT8ZoFNlmClV1vGrSIA5npw5CML
         okFZReaTDrLdd5gZ9Sw5Ka8gboS31KfYnSmTPbjf1OV6T+tZdObDcmC/cj3e67In97Pr
         DvdyRXKJBU5lcUpwMEVWuL8HHsi/RlfhwBrcxY440Wi2ZnReOCArZG0xn5+3WSf5ZheG
         PadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082812; x=1790687612;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7x6tfErkSiFlzGsGfOwlIUPo7E3FNSLjiZHvuCyhifo=;
        b=IXZB4BgsVEUvcCJDBGv3GUV5mw69Nih21JNkxq8vi3LoNlAGjxbvN5Uz1brPjfgGuI
         1Q/Qnp5drnUuRczM/o6B4t+1vJvNVbKxEa71NjqMK+1W0xNtSeITs6BKliAK/m1aAEPN
         MtENA/69sjH9U20CQQ0qJO37Z9DbPkN1YLrdqFzYJD4uoHDsp6oLk/F9M+sjVFK/bHMx
         tTf5GMe/op5VDBrWVibuWN/3Ob1X/fswo/oBgkZG8qCNjC/FOE2ScdwUSbybTrxMkBaG
         yor6zgTMoYOulk3UzHDM5mUPPqS5+i5mAxcajRriwhVhmbeYJTmE/DUeCg5EyJY3CE2d
         YMpw==
X-Gm-Message-State: AFuF++kKbU+ijLs8xtTudvfmtwq6idRNZ/53/TfOFe8yJ8hWy73kQv8I
	NHlRPu0we5Ao83eYotnM9FHf9GDDfigzjnPKCNF7panP+nToHwyH2NMWS7vuwFZlztGKx3zpbOn
	C9zlh7cc8uAil3G8qk+BfCsI7TKP09b1JpNzx3BgDT2MudivT9WXaMrD0guZq08I+K1OeMND6HP
	nPZjjDDJOS7sqJWhgkDaIm+DR8djLZFiKkPT4ROfzKQ4MJgTgpu6hIYbzt69Cilr+A0Q==
X-Received: from edyc10.prod.google.com ([2002:aa7:df0a:0:b0:6aa:13a8:bf07])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1942:b0:6aa:a133:cfd1 with SMTP id 4fb4d7f45d1cf-6aaa133d1e9mr2304164a12.20.1790082811557;
 Tue, 22 Sep 2026 06:13:31 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:57 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-25-smostafa@google.com>
Subject: [PATCH v8 24/25] iommu/arm-smmu-v3-kvm: Enable nesting
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
X-CRM114-CacheID: sfid-20260922_061334_101722_E7CB5914 
X-CRM114-Status: GOOD (  20.90  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 109 +++++++++++++++++-
 1 file changed, 103 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 5417a5c2bf58..39c97404e039 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -461,6 +461,57 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_attach_stage_2(struct arm_smmu_ste *ste)
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
+	ste->data[1] &= ~cpu_to_le64(STRTAB_STE_1_SHCFG);
+	ste->data[1] |= cpu_to_le64(FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING));
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
@@ -490,12 +541,40 @@ static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
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
@@ -511,7 +590,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 			return -E2BIG;
 
 		hyp_ste_ptr = &hyp_table[sid];
-		host_ste_ptr = &host_table[sid];
+		memcpy(target.data, host_table[sid].data, STRTAB_STE_DWORDS << 3);
 	} else {
 		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)hyp_ste_base;
 		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
@@ -520,8 +599,7 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
 		if (l1_idx >= cfg->l2.num_l1_ents)
 			return -E2BIG;
 
-		host_ste_ptr = &host_ste_copy;
-		ret = smmu_get_host_l2_ste(smmu, sid, host_ste_ptr);
+		ret = smmu_get_host_l2_ste(smmu, sid, &target);
 		if (ret)
 			return ret;
 
@@ -541,8 +619,27 @@ static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
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
+	ret = smmu_attach_stage_2(&target);
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
2.55.0.1082.g2b9226bbc0-goog


