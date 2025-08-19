Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BB0CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sk4h0o5FTOh9oFFMoej2yRTt0xkrjtRUSeSqNCk5ts=; b=wpRn4WTOdKR/qSvUWs8jxkcnZ9
	jhRSD2hxMfKfR9XuDxH+eGgZ/PDJVgqrJhXyt2cBuGKlZ5zlXcQIbFf91enflaWDqaq2TadS0aVn6
	ZzYOjhre9c/pj/9qdQ07UO1ZH9e30lS9PnhByZOWmKTq9nUwZNHzJpEAIXYtXdqSwU2GRQO89QFrf
	cIr+Rtq2ouZsrQqMXe8fBhxRnpH6R8nC6sbprFm+e0A5lzyQeFpptpMwxwm+OmsWvk0+HKuFyw6ZO
	mVoC3Y3WOaziiWGAg2SwNVEgW1oZYZttyuTjqZVcv5TG0DwKWpJNmRUN9xaY66NBIXGV51fPyvEmz
	m/dNGQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWm8-0000000Bxry-1sVT;
	Wed, 20 Aug 2025 00:34:00 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG8-0000000BfXj-0vbk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:49 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9dc566cb4so3206809f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640367; x=1756245167; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7sk4h0o5FTOh9oFFMoej2yRTt0xkrjtRUSeSqNCk5ts=;
        b=qEI+fyjbwAeF8RZQ244PmaE7GDsli+shz25NkZF0sLNnQWG6vzyyD4aJQRTM3o1i2U
         s5Y0/ZN0ltK/MNQzXxEv+iIYJ60fNVueDhPgx+g4BS+jv74PyR6hFPgwdWDtYIL7xUsC
         VzifdAw5j0Y/hONEixtjFWigRCIQpnIxryr74NcsDTrCcuQriinoYHabzB5Fgvj/ubvS
         Bkvx+K4y0rcsfaaMzLtLOTQE438nPXXebpCcdOcV+6JRol2vixe6Bxho0tiWktle5VEE
         4yN46sS8rK95l0t+rr/VEJT4B/Gy6m4wZhfOyWqi+ECNsUqcqfXGue+tJaW2pSoUp4YP
         AtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640367; x=1756245167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sk4h0o5FTOh9oFFMoej2yRTt0xkrjtRUSeSqNCk5ts=;
        b=irE3GrDNmWDOSS+DteM+5TXTevAP2jVc2RhHhbKrYJNCNY652nFJfBhYPKKDz8wp5x
         Ag8VFbYreYPcbbQiVcQuqfAYPz9UpWwuxeAvs0u/l4CTwBcWWMPOpe7K2agWZym/oso3
         DkRtVu2mrTsQE1tUHG3C6JDty8/7QU0eQvtU0Hm3lBU1sXGO77mnwd14PjozaM6bQcXr
         ZJuWrRLJOxtvYQZyaIY4z4DoLQX5sMhXHHT51R7c1PehkzD2qf9EHyoyEcQ+l/kl2mlv
         G5xb2cMeLzSvL1f4z2IFDDHdFuJrCnrkIaI/3sYiJlrVt29ibAzWZ+n+SCYV+B0lIH7I
         nSQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDV57l3bXM6VP5KHOgMhy+Iauna8VTAPHdojJ6XL+5WW+1E9CD0qqq+8yhK4/ACIeg6Bvo9zaOlgCuo9I7vOCq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3dGppydtBJibTUaOMZfkAQNWUT7HX/rHYyOqR+4YjEBrBw22D
	+ZEfy5DqOc2FlPiqRrsFqsnZ4bg/BQ9k1AanA5gwec9dDVzuKJ/X1NnhAhkOdkNIcBkJ2r7PYBG
	ENqHSyDr7obudfw==
X-Google-Smtp-Source: AGHT+IFUpQvsGMxlMZxN5e8l+1BLUo+tGugwis/W3Zc75woWAnm0Ggc8nFVugp0gt+/gCvYhg6NiMTal3YfIkg==
X-Received: from wmbhc18.prod.google.com ([2002:a05:600c:8712:b0:458:bb2b:d73e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2dc6:b0:3bd:148e:212 with SMTP id ffacd0b85a97d-3c32ca0701emr371514f8f.14.1755640366978;
 Tue, 19 Aug 2025 14:52:46 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:52 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-25-smostafa@google.com>
Subject: [PATCH v4 24/28] iommu/arm-smmu-v3-kvm: Shadow STEs
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
X-CRM114-CacheID: sfid-20250819_145248_275391_7359B7C8 
X-CRM114-Status: GOOD (  21.70  )
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

This patch adds STE emulation, this is done when the host sends the
CFGI_STE command.

In this patch we copy the STE as is to the shadow owned by the hypervisor,
in the next patch, stage-2 page table will be attached.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 95 +++++++++++++++++--
 1 file changed, 89 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index d722f8ce0635..0f890a7d8db3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -22,6 +22,9 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 #define strtab_split(smmu)	(FIELD_GET(STRTAB_BASE_CFG_SPLIT, (smmu)->host_ste_cfg))
 #define strtab_l1_size(smmu)	((1 << (strtab_log2size(smmu) - strtab_split(smmu))) * \
 				 (sizeof(struct arm_smmu_strtab_l1)))
+#define strtab_hyp_base(smmu)	((smmu)->features & ARM_SMMU_FEAT_2_LVL_STRTAB ? \
+				 (u64 *)(smmu)->strtab_cfg.l2.l1tab :\
+				 (u64 *)(smmu)->strtab_cfg.linear.table)
 
 #define for_each_smmu(smmu) \
 	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
@@ -263,6 +266,83 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+/* Get an STE for a stream table base. */
+static struct arm_smmu_ste *smmu_get_ste_ptr(struct hyp_arm_smmu_v3_device *smmu,
+					     u32 sid, u64 *strtab)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_ste *table = (struct arm_smmu_ste *)strtab;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)strtab;
+		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
+		struct arm_smmu_strtab_l2 *l2ptr;
+
+		if (WARN_ON(l1_idx >= cfg->l2.num_l1_ents) ||
+		   !(l1tab[l1_idx].l2ptr & STRTAB_L1_DESC_SPAN))
+			return NULL;
+
+		l2ptr = hyp_phys_to_virt(l1tab[l1_idx].l2ptr & STRTAB_L1_DESC_L2PTR_MASK);
+		/* Two-level walk */
+		return &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
+	}
+	if (WARN_ON(sid >= cfg->linear.num_ents))
+		return NULL;
+	return &table[sid];
+}
+
+static int smmu_shadow_l2_strtab(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_strtab_l2 *l2table;
+	u32 idx = arm_smmu_strtab_l1_idx(sid);
+	u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+	u64 l1_desc_host = host_ste_base[idx];
+	struct arm_smmu_strtab_l1 *l1_desc = &cfg->l2.l1tab[idx];
+
+	l2table = kvm_iommu_donate_pages(get_order(sizeof(*l2table)));
+	if (!l2table)
+		return -ENOMEM;
+	arm_smmu_write_strtab_l1_desc(l1_desc, hyp_virt_to_phys(l2table));
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		kvm_flush_dcache_to_poc(l1_desc, sizeof(*l1_desc));
+
+	/*
+	 * Now set the hyp l1 to a shared state.
+	 * As mentioned in smmu_reshadow_ste() Linux never clears L1 ptrs,
+	 * so no need to handle that case. Otherwise, we need to unshare
+	 * the tables and emulate STE clear.
+	 */
+	smmu_share_pages(l1_desc_host & STRTAB_L1_DESC_L2PTR_MASK, sizeof(*l2table));
+	return 0;
+}
+
+static void smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool leaf)
+{
+	u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+	u64 *hyp_ste_base = strtab_hyp_base(smmu);
+	struct arm_smmu_ste *host_ste_ptr = smmu_get_ste_ptr(smmu, sid, host_ste_base);
+	struct arm_smmu_ste *hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
+	int i;
+
+	/*
+	 * Linux only uses leaf = 1, when leaf is 0, we need to verify that this
+	 * is a 2 level table and reshadow of l2.
+	 * Also Linux never clears l1 ptr, that needs to free the old shadow.
+	 */
+	if (WARN_ON(!leaf || !host_ste_ptr))
+		return;
+
+	/* If host is valid and hyp is not, means a new L1 installed. */
+	if (!hyp_ste_ptr) {
+		WARN_ON(smmu_shadow_l2_strtab(smmu, sid));
+		hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
+	}
+
+	for (i = 0; i < STRTAB_STE_DWORDS; i++)
+		WRITE_ONCE(hyp_ste_ptr->data[i], host_ste_ptr->data[i]);
+}
+
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int ret;
@@ -390,8 +470,13 @@ static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *comman
 
 	switch (type) {
 	case CMDQ_OP_CFGI_STE:
-		/* TBD: SHADOW_STE*/
+	{
+		u32 sid = FIELD_GET(CMDQ_CFGI_0_SID, command[0]);
+		u32 leaf = FIELD_GET(CMDQ_CFGI_1_LEAF, command[1]);
+
+		smmu_reshadow_ste(smmu, sid, leaf);
 		break;
+	}
 	case CMDQ_OP_CFGI_ALL:
 	{
 		/*
@@ -564,23 +649,21 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			regs->regs[rd] = smmu->cmdq_host.llq.cons | err;
 		}
 		goto out_ret;
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_STRTAB_BASE:
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
 			WARN_ON(is_smmu_enabled(smmu));
 			smmu->host_ste_base = val;
 		}
-		mask = read_write;
-		break;
+		goto out_ret;
 	case ARM_SMMU_STRTAB_BASE_CFG:
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
 			WARN_ON(is_smmu_enabled(smmu));
 			smmu->host_ste_cfg = val;
 		}
-		mask = read_write;
-		break;
+		goto out_ret;
+	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_GBPA:
 		mask = read_write;
 		break;
-- 
2.51.0.rc1.167.g924127e9c0-goog


