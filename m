Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF63CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dc4s6xiUZWCpOIz9PUIb3W8M/9lmR8q/3KHesYxyGwI=; b=OaLj1UsztCUm1AGyWOd3C8irEs
	jndM4Ht98xcZZbOK7R4tx3nSl8imTKOq6yiwl25jlK6Jvgl3FyM3uAlbM2AmKLujVrEjJywbs6Ga3
	ReiWTfJh5gM+kXw0UJtx74jW6tU8ci8/W/84EteTgCb3ZgFZqbkw/urMTLeS2pRowVD/URzjqVK3T
	D+wfwO5B67wrpsJu0msXFu4714tO4bMLUlXD4bTSSmSxzVEOmu67gTP02VBGpfKmJ0CQFj81ufYvG
	rjVx8f4SnD1O1IoLs274Y+68xZsTF/8qiWsLB0SUF12pjyYvOS11KBCLOXbkhfXU7Tt6pvMe9aOKP
	cwArKACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv8-00000006dJj-39bl;
	Fri, 01 May 2026 11:20:34 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv2-00000006d5f-32S5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:30 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-449c8f24067so878161f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634426; x=1778239226; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc4s6xiUZWCpOIz9PUIb3W8M/9lmR8q/3KHesYxyGwI=;
        b=D4yTBzE0TuiJrpwpQYdbhbAC7srMD/cdA/aR0AvWHjd7iTA6qXOE/EfBMViZKNfBrh
         /dEH3zVa/9ZGzWskhZkNzHfo+AZWLIl0kC/e9zUou93niEdh+19KcW53ys4ExOtv9CHY
         pM0isS9n5IJxPr4fmq4pa2u87jQd0WaDolfmfHzScR1r8teNjvjkwo+4abQIXNlEo+xW
         zmi9Yr3Rap6WtwcCW1T8v8Seh0f8Uh/dVdtlCoTcF4v0FRUNN1EKEURtsQAWzgavIjT+
         1zlVghrSvXO5x/yj029xG8hxxFm35ZT4O2QRheRcw3b9t2AHcjLqFgw6r+xdJhG/nhRl
         Cpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634426; x=1778239226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc4s6xiUZWCpOIz9PUIb3W8M/9lmR8q/3KHesYxyGwI=;
        b=nxsA99YuwiDuncginLbusQ7FAz4do1+s8I/tBp4nPZSnVM6NWEspp6SJnGYeVsWy1K
         aiM6jJlL0UFEHRFB2RfN/PWAnP88PQ3ULAGXC3v9xVA+VT+4bnH8vHtiSL5/Tbv23PfM
         gIAbGPUhuKU0zFFK2hSn7/g4/OznRIZ4jxvjqje3uAMmADIgwlNi9US6ERs1QGBSkuyj
         U3TmxRY6RihgUmXT76TMI7lpoeTv1oY5U8VhrAuvSkfoBBHUrsbqr18Qd8lQ8NgSI+C8
         UyH7jrj1EFLyvLnGEc3bbgHnahwpuU4MtV95NAhJmUNRUI3EmdIJ5iJ83lnT96t+Hi0H
         k/yw==
X-Gm-Message-State: AOJu0YyQ3h7abWZSi8F1IbFVP9jCsBfRCjDNEJLXDbTJgkiX7k7498Md
	BioOs46n11EME8hypZCItln0LzP7rylXQD/ppETajAPpAP5kyvKg349v4TaY88ghtQpV5n82uYD
	PXJCQt1ztfWz4IdvWI1eEDqTr+fZey4EmVUQf5qhrBZwBG6B3dR3g69lvmwsMSvi24GynAHpGCX
	9bMLLtAKSC9JtEfOouYdC6b6ja2RxuGwSwLeiMvBYN/s2rF91QXJoNP+maOhK/t83xog==
X-Received: from wrnd1.prod.google.com ([2002:adf:e841:0:b0:43d:76ee:764])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:e11:b0:449:acdb:3009 with SMTP id ffacd0b85a97d-449acdb3074mr6506108f8f.6.1777634425669;
 Fri, 01 May 2026 04:20:25 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:21 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-20-smostafa@google.com>
Subject: [PATCH v6 19/25] iommu/arm-smmu-v3-kvm: Shadow STEs
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
X-CRM114-CacheID: sfid-20260501_042028_841501_8A937CED 
X-CRM114-Status: GOOD (  19.75  )
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

Add STE emulation, when the host sends the CFGI_STE command.

Copy the STE as is to the shadow owned by the hypervisor, in the
next patch, stage-2 page table will be attached.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 114 +++++++++++++++++-
 1 file changed, 108 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index d15c9e5aa998..d92811ef2af5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -23,6 +23,9 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 #define strtab_split(smmu)	(FIELD_GET(STRTAB_BASE_CFG_SPLIT, (smmu)->host_ste_cfg))
 #define strtab_l1_size(smmu)	((1UL << (strtab_log2size(smmu) - strtab_split(smmu))) * \
 				 (sizeof(struct arm_smmu_strtab_l1)))
+#define strtab_hyp_base(smmu)	((smmu)->features & ARM_SMMU_FEAT_2_LVL_STRTAB ? \
+				 (u64 *)(smmu)->strtab_cfg.l2.l1tab :\
+				 (u64 *)(smmu)->strtab_cfg.linear.table)
 
 #define for_each_smmu(smmu) \
 	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
@@ -305,6 +308,91 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
+				struct arm_smmu_ste *host_ste_out)
+{
+	u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+	struct arm_smmu_strtab_l1 host_l1_desc;
+	struct arm_smmu_strtab_l2 *l2ptr;
+	phys_addr_t host_l2_tab;
+	int ret;
+
+	host_l1_desc.l2ptr = le64_to_cpu(READ_ONCE(host_ste_base[arm_smmu_strtab_l1_idx(sid)]));
+	if (!(host_l1_desc.l2ptr & STRTAB_L1_DESC_SPAN))
+		return -EINVAL;
+
+	host_l2_tab = host_l1_desc.l2ptr & STRTAB_L1_DESC_L2PTR_MASK;
+	/* Share and pin the table before accessing it. */
+	ret = smmu_share_pages(host_l2_tab, sizeof(struct arm_smmu_strtab_l2));
+	if (ret)
+		return ret;
+
+	l2ptr = hyp_phys_to_virt(host_l2_tab);
+	memcpy(host_ste_out, &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)],
+	       STRTAB_STE_DWORDS << 3);
+	WARN_ON(smmu_unshare_pages(host_l2_tab, sizeof(struct arm_smmu_strtab_l2)));
+	return 0;
+}
+
+static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool leaf)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_ste *hyp_ste_ptr, *host_ste_ptr, host_ste_copy;
+	u64 *hyp_ste_base = strtab_hyp_base(smmu);
+	int ret;
+
+	/*
+	 * Linux only uses leaf = 1, when leaf is 0, we need to verify that this
+	 * is a 2 level table and reshadow of l2.
+	 * Also, we rely on Linux only issuing CFGI_STE to attach a device when
+	 * the SMMU is enabled.
+	 */
+	if (!leaf || !is_smmu_enabled(smmu) ||
+		(sid >= (1UL << strtab_log2size(smmu))))
+		return -EINVAL;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)) {
+		struct arm_smmu_ste *hyp_table = (struct arm_smmu_ste *)hyp_ste_base;
+		u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+		struct arm_smmu_ste *host_table = (struct arm_smmu_ste *)host_ste_base;
+
+		if (sid >= cfg->linear.num_ents)
+			return -E2BIG;
+
+		hyp_ste_ptr = &hyp_table[sid];
+		host_ste_ptr = &host_table[sid];
+	} else {
+		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)hyp_ste_base;
+		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
+		struct arm_smmu_strtab_l2 *l2ptr;
+
+		if (l1_idx >= cfg->l2.num_l1_ents)
+			return -E2BIG;
+
+		host_ste_ptr = &host_ste_copy;
+		ret = smmu_get_host_l2_ste(smmu, sid, host_ste_ptr);
+		if (ret)
+			return ret;
+
+		if (!l1tab[l1_idx].l2ptr) {
+			struct arm_smmu_strtab_l2 *l2table;
+
+			/* No hypervisor entry, first time the L2 is populated. */
+			l2table = kvm_iommu_donate_pages(get_order(sizeof(*l2table)));
+			if (!l2table)
+				return -ENOMEM;
+			arm_smmu_write_strtab_l1_desc(&l1tab[l1_idx], hyp_virt_to_phys(l2table));
+		}
+		l2ptr = hyp_phys_to_virt(le64_to_cpu(l1tab[l1_idx].l2ptr) &
+				STRTAB_L1_DESC_L2PTR_MASK);
+		hyp_ste_ptr = &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
+	}
+
+	memcpy(hyp_ste_ptr->data, host_ste_ptr->data, STRTAB_STE_DWORDS << 3);
+
+	return 0;
+}
+
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
 {
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
@@ -419,8 +507,14 @@ static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *comman
 
 	switch (type) {
 	case CMDQ_OP_CFGI_STE:
-		/* TBD: SHADOW_STE*/
+	{
+		u32 sid = FIELD_GET(CMDQ_CFGI_0_SID, command[0]);
+		u32 leaf = FIELD_GET(CMDQ_CFGI_1_LEAF, command[1]);
+
+		if (smmu_reshadow_ste(smmu, sid, leaf))
+			return true;
 		break;
+	}
 	case CMDQ_OP_CFGI_ALL:
 	{
 		/*
@@ -618,25 +712,33 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			val = smmu->cmdq_host.llq.cons | (CMDQ_CONS_ERR & cons);
 			goto out_update_regs;
 		}
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_STRTAB_BASE:
+		if (len != sizeof(u64))
+			break;
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
 			if (is_smmu_enabled(smmu))
 				break;
 			smmu->host_ste_base = val;
+			goto out_ret;
+		} else {
+			val = smmu->host_ste_base;
+			goto out_update_regs;
 		}
-		mask = read_write;
-		break;
 	case ARM_SMMU_STRTAB_BASE_CFG:
+		if (len != sizeof(u32))
+			break;
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
 			if (is_smmu_enabled(smmu))
 				break;
 			smmu->host_ste_cfg = val;
+			goto out_ret;
+		} else {
+			val = smmu->host_ste_cfg;
+			goto out_update_regs;
 		}
-		mask = read_write;
-		break;
+	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_GBPA:
 		mask = read_write;
 		break;
-- 
2.54.0.545.g6539524ca2-goog


