Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01A2C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5usyBMYtPhEtq515HRsyRf5iQD/7LGEqXNtQxILf1Y=; b=ZQhInbEF8wA6UVXlqcus84/inf
	thzHuIb4qpC+Sf1jOUfLNLcjudvl77XOLr49J+PvRf87cyYVJxlz6way8sSWCvkwPIKzgKqV+GrxS
	2qv56w6vjuPkwBEo9Ry/IZXKx77HeD6WfSYWdSm6CkLQIiPUA6dUlhCd4tjfurgNR346AAZspcnr7
	votxFVVQihF5sm8qW+6lznycR1dUU8Wz3y/+LLlpnSeQv0PCZutWRKau0R155QWG77V8WEe0UtZoZ
	TMiAIfMrD38fBh7y6xRyUBjK0FpQib0nfrOJBUYcSTwJyjYW5nb5Yd2pakqhiPR8qUskfOfAywF06
	EZSrUrkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTin-0000000FHyx-2TYf;
	Mon, 28 Jul 2025 19:41:17 +0000
Received: from mail-wm1-f73.google.com ([209.85.128.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2q-0000000F8yc-3adF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:53 +0000
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45600d19a2aso36160045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725230; x=1754330030; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l5usyBMYtPhEtq515HRsyRf5iQD/7LGEqXNtQxILf1Y=;
        b=X2DPk70XVsLYc9sVh1clvOkEfLBYRJFG2q/YySME1LU3YtkTtXZSMHAkOWdgGgc8XQ
         rFjkJAzLaeeEdrAEvi1FTbkaUW5MFGxAH2GXZGd/DCIDpmZDQGlyaA6UN2s7OYcpIev6
         JNg1VUirq8fhoS+5vpHPPLp71gNrLTubd5kiQ2Am5T58w3Lc6KAmvKtXQiuWuKuFvkBv
         jTUNfVM31dekQqLSlV2QKhmafevoeyR3BETIgRWxS8hiqqViXhw/phHLu+NSBNKHTp0+
         uiqsTPamAAtvsJDy75Pyg4XMoUcjPZnvShLnuc0BNgFjfKMI9JBwKQ4DlnUq3ObZUfKV
         IUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725230; x=1754330030;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5usyBMYtPhEtq515HRsyRf5iQD/7LGEqXNtQxILf1Y=;
        b=iCvusGHoEKL59D9zwoyHgInV9dgdVa/MpaFuBeB+FY7hL3nxjftKH2VlpG+1BzdpUR
         yDXk9EH06B9L75rnYEHxbNw78lJ1ywxRMTIThI8egKjEAJt5G/ZcVkazh43s4NO4nzTq
         o1BVivec9eXEgH1T7H8c8/tNzQyxZotCdRL8Bp+Sz2VtcdGgqXoyJZlcELQ1dsCWnzfg
         BcEGpO5jyOR5khaYhKuzj4SxCsHLO2TrZkjQfgTExtgijwQuilvTCjWKUDrWjA3jxM6G
         3rkQcLtEdHW9vqy9Pjm3SZ9insgd/f/UolkVcWW3eykcqJ+hNsA+RwyEOFWTKRksMhQH
         ZzGA==
X-Forwarded-Encrypted: i=1; AJvYcCUBiNRJdKvuZODVCWQeKpeNGsO5vJnL9V+0pnXwLT1yqCgtVoihj/69JCuZLuMC9yvLYakKhkQHtYNz/l8PHaWy@lists.infradead.org
X-Gm-Message-State: AOJu0YwK/xU41Y3jZRDdEoYaj1FKJ1qY2cGBoBsXb+q6h4jXmigkGM3w
	YT79rdP3aY2tMdTPhZGo+FVG55tSU6N7XjIGSZCI77zvEHXbthXvwGTF6JwbQ0+5C6HzuOwVDIR
	2WgXFX92gPb+Ygg==
X-Google-Smtp-Source: AGHT+IEOasiCkaHWORBz/kHZ+SsH5TCiId9F4oswqdHG41LqtBvjent3B9CKHId8hskBgKaxbm/Ao9Q5mfQBGA==
X-Received: from wmsd5.prod.google.com ([2002:a05:600c:3ac5:b0:456:134a:a210])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d24:b0:455:de98:c504 with SMTP id 5b1f17b1804b1-4588b5fb608mr28234885e9.0.1753725230800;
 Mon, 28 Jul 2025 10:53:50 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:08 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-22-smostafa@google.com>
Subject: [PATCH v3 21/29] iommu/arm-smmu-v3-kvm: Setup stream table
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105352_894859_455859C0 
X-CRM114-Status: GOOD (  20.75  )
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

Map the stream table allocated by the host into the hypervisor address
space. When the host mappings are finalized, the table is unmapped from
the host. Depending on the host configuration, the stream table may have
one or two levels. Populate the level-2 stream table lazily.

Also, add accessors for STEs.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-common.h      |  16 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  16 ---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 102 +++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   2 +
 4 files changed, 119 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
index ab6db8b4b9f2..a24fdbdaeb74 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
@@ -499,6 +499,22 @@ struct arm_smmu_queue {
 					 Q_IDX(&((q)->llq), p) *	\
 					 (q)->ent_dwords)
 
+struct arm_smmu_strtab_cfg {
+	union {
+		struct {
+			struct arm_smmu_ste *table;
+			dma_addr_t ste_dma;
+			unsigned int num_ents;
+		} linear;
+		struct {
+			struct arm_smmu_strtab_l1 *l1tab;
+			struct arm_smmu_strtab_l2 **l2ptrs;
+			dma_addr_t l1_dma;
+			unsigned int num_l1_ents;
+		} l2;
+	};
+};
+
 static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 						 dma_addr_t l2ptr_dma)
 {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index f9a496e0bd94..480463ec118a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -232,22 +232,6 @@ struct arm_smmu_s2_cfg {
 	u16				vmid;
 };
 
-struct arm_smmu_strtab_cfg {
-	union {
-		struct {
-			struct arm_smmu_ste *table;
-			dma_addr_t ste_dma;
-			unsigned int num_ents;
-		} linear;
-		struct {
-			struct arm_smmu_strtab_l1 *l1tab;
-			struct arm_smmu_strtab_l2 **l2ptrs;
-			dma_addr_t l1_dma;
-			unsigned int num_l1_ents;
-		} l2;
-	};
-};
-
 struct arm_smmu_impl_ops {
 	int (*device_reset)(struct arm_smmu_device *smmu);
 	void (*device_remove)(struct arm_smmu_device *smmu);
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index c3d67c603619..74e6dfb53528 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -119,7 +119,6 @@ static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
 	return smmu_wait_event(smmu, smmu_cmdq_empty(&smmu->cmdq));
 }
 
-__maybe_unused
 static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 			 struct arm_smmu_cmdq_ent *cmd)
 {
@@ -131,6 +130,80 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 	return smmu_sync_cmd(smmu);
 }
 
+__maybe_unused
+static int smmu_sync_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, unsigned long ste)
+{
+	struct arm_smmu_cmdq_ent cmd = {
+		.opcode = CMDQ_OP_CFGI_STE,
+		.cfgi.sid = sid,
+		.cfgi.leaf = true,
+	};
+
+	/*
+	 * In case of 2 level STEs, L2 is allocated as cacheable, so flush it everytime
+	 * we update the STE.
+	 */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY) &&
+	    (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB))
+		kvm_flush_dcache_to_poc(ste, sizeof(struct arm_smmu_ste));
+	return smmu_send_cmd(smmu, &cmd);
+}
+
+static int smmu_alloc_l2_strtab(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_strtab_l1 *l1_desc;
+	struct arm_smmu_strtab_l2 *l2table;
+
+	l1_desc = &cfg->l2.l1tab[arm_smmu_strtab_l1_idx(sid)];
+	if (l1_desc->l2ptr)
+		return 0;
+
+	l2table = kvm_iommu_donate_pages(get_order(sizeof(*l2table)));
+	if (!l2table)
+		return -ENOMEM;
+
+	arm_smmu_write_strtab_l1_desc(l1_desc, hyp_virt_to_phys(l2table));
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		kvm_flush_dcache_to_poc(l1_desc, sizeof(*l1_desc));
+	return 0;
+}
+
+static struct arm_smmu_ste *
+smmu_get_ste_ptr(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
+		struct arm_smmu_strtab_l2 *l2ptr;
+
+		if (l1_idx >= cfg->l2.num_l1_ents)
+			return NULL;
+		l2ptr = hyp_phys_to_virt(cfg->l2.l1tab[l1_idx].l2ptr & STRTAB_L1_DESC_L2PTR_MASK);
+		/* Two-level walk */
+		return &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
+	}
+
+	if (sid >= cfg->linear.num_ents)
+		return NULL;
+	/* Simple linear lookup */
+	return &cfg->linear.table[sid];
+}
+
+__maybe_unused
+static struct arm_smmu_ste *
+smmu_get_alloc_ste_ptr(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
+{
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		int ret = smmu_alloc_l2_strtab(smmu, sid);
+
+		if (ret)
+			return NULL;
+	}
+	return smmu_get_ste_ptr(smmu, sid);
+}
+
 static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u64 val, old;
@@ -205,6 +278,29 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
+{
+	size_t strtab_size;
+	u64 strtab_base;
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	enum kvm_pgtable_prot prot = PAGE_HYP;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		prot |= KVM_PGTABLE_PROT_NORMAL_NC;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		strtab_size = PAGE_ALIGN(cfg->l2.num_l1_ents * sizeof(struct arm_smmu_strtab_l1));
+		strtab_base = (u64)cfg->l2.l1_dma;
+		cfg->linear.table = hyp_phys_to_virt(strtab_base);
+	} else {
+		strtab_size = PAGE_ALIGN(cfg->linear.num_ents * sizeof(struct arm_smmu_ste));
+		strtab_base = (u64)cfg->linear.ste_dma;
+		cfg->l2.l1tab = hyp_phys_to_virt(strtab_base);
+	}
+	return ___pkvm_host_donate_hyp(hyp_phys_to_pfn(strtab_base),
+				       strtab_size >> PAGE_SHIFT, prot);
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int i;
@@ -233,6 +329,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		goto out_err;
 
+	ret = smmu_init_strtab(smmu);
+	if (ret)
+		goto out_err;
+
 	return ret;
 
 out_err:
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index f639312cf295..d188537545b1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -13,6 +13,7 @@
  * @base		Virtual address of SMMU registers
  * @features		SMMUv3 features as defined in arm-smmu-v3-common.h
  * @cmdq		CMDQ queue struct
+ * @strtab_cfg		stream table config, strtab_cfg.l2.l2ptrs is not used
  * Other members are filled and used at runtime by the SMMU driver.
  */
 struct hyp_arm_smmu_v3_device {
@@ -21,6 +22,7 @@ struct hyp_arm_smmu_v3_device {
 	void __iomem		*base;
 	unsigned long		features;
 	struct arm_smmu_queue	cmdq;
+	struct arm_smmu_strtab_cfg strtab_cfg;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.50.1.552.g942d659e1b-goog


