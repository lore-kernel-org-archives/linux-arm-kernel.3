Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7F5CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Bi/zP2WEVGciETaGfBszben9Iy5rJdDBhJW2dD5Omo=; b=FYAGLywCs79n2pH9vpmRJKUT6s
	cmAcfqocvM/OEEDLnv61Vroxu9UrsuRrTy41Rt4x+MeIssqV0Jswi2KgDUxv5PyI3QvSIZg3tkAkD
	PA+XiLtiofw1UF1FUHNxqTR6GMwICDjiyCohIDrv9r9lZiK4ra76kym6pEdYYkqbVTRh9MBKo5PT5
	eey/lN7592TJkPAteI9Cll9+QkrI7DNyv+DwhOhOuxd5/4Fb4N3qOzbk0nyxY97CfdiNYPnjU99Vi
	iFlArONjS5qe9sHzL7Gg5NncMyzyMLcUOyEkVbzucZLNZI+M0MQL70/Yj6TD8ljCbItVBCB2z6JiY
	KUgzltUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRln-00000001ISb-0zHr;
	Thu, 15 Oct 2026 20:09:43 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRld-00000001ICT-0BuS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:35 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48af4046a3bso4400520f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094970; x=1792699770; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Bi/zP2WEVGciETaGfBszben9Iy5rJdDBhJW2dD5Omo=;
        b=B47ilF65PY2frPp8dbxyVPCj0qYxC1blr2kUtihAlIVz1Gt3OONYq3rj1pcsy+XJ9i
         I2VOBfGXOFnoaC2UtD43KEm7PBCoMAsDY/upv3wr6TZ/kkhu97COLeAizbC7SNyy/FFG
         Y5pCrMnzp84FioyY2GgqbM4bzW4TY5qh2wtMt8Oh1588xvlEYYfjrdh29y7K/znubvfZ
         k3vxJ15fBH47+WFFIUOYLnsA1mkR/8wzUAEiomY5UPFOlDfvHrn9PHg4XweqSUrLeyH9
         SDSBfu7KmP3R5nTapEyqUM7e6lOFYNDFON0/gQE96yuqS6gGJpnFXXmZX3gZsYFQuNeB
         db7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094970; x=1792699770;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Bi/zP2WEVGciETaGfBszben9Iy5rJdDBhJW2dD5Omo=;
        b=gd3j7RQ17ceN06hPu0WG7q4jRudjk2wqYaCcHkBUCVHOJ7/9RedO7i2MKDNHIJ/iOK
         sjYDWWv0jhLEKCEou+l96HGJbTyRD1QNZacNQ8TXzWRXASsfYQVJbhXyj6oge1U9ZGMD
         CXdy2bZ0PrLelAcLu5CmOaAMvdVXF07GXEq3e5Qy8ZeuAQ4BM2qrkqbC+yjtESCBxIfm
         bFEd6EH8XraWbo9gJF+tsbn7f+RZnzoOUnfwPvTTSXUT5MxdOEHDi0NHRavFkBjkNU+G
         h0dpbZ+n6v73dwFSDREBaB7+gIA9I873p/qiPZM7HfC0dJGdY2Qre74plxmWAcreMv3n
         rYUQ==
X-Gm-Message-State: AFq9FYLOgnq7iqx5xiwA11+k1OoB3ammN2+hmcSndECIVAH2A8NNZjbn
	znV7j5tCYsmAC1a/ERUL5ojWTY2E4mvCgNRHoATL3Gl1ETWfDqSMlc+swX3jiEp9jWTMheshfY/
	/1/iKE/u4FRqt7JHtN4YgalLEQg4tpVJBtKdkcCoDvivmkHY7MZYJ529+WWp6OLWPaJFoaGNLUI
	HIkJLbxPf7Wee/sWBA0Tg3n1bS7C7w0tODmYVPYzRqoKPFFbBjbu1BILLsjAah6jZ0Kw==
X-Received: from wmsp12.prod.google.com ([2002:a05:600c:1d8c:b0:4a1:c745:6233])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19c8:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a18e47ad49mr419007385e9.9.1792094970227;
 Thu, 15 Oct 2026 13:09:30 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:47 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-17-smostafa@google.com>
Subject: [PATCH v9 16/25] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
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
X-CRM114-CacheID: sfid-20261015_130933_136815_EB527414 
X-CRM114-Status: GOOD (  25.62  )
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

Take the command queue away from the host:
- ARM_SMMU_CMDQ_BASE: writes are only accepted while the command queue
  is disabled and record the host queue base. Reads return the saved
  value.
- ARM_SMMU_CMDQ_PROD: writes run the emulation, which copies, checks
  and filters every pending command into the shadow queue, ends the
  batch with a CMD_SYNC and waits for the hardware to drain it, so the
  host's view of CONS never runs ahead of completion. Reads return the
  host copy.
- ARM_SMMU_CMDQ_CONS: writes update the software copy and are only
  accepted while the queue is disabled, so the host cannot skip
  submitted commands. Reads return the emulated value plus the error
  bits of the hardware CONS.

Commands the filter rejects are fatal, as no well-behaved host issues
them.

Also emulate IDR1.CMDQS to advertise the shadow queue size, which can
be smaller than the hardware's.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 150 +++++++++++++++++-
 1 file changed, 145 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index c9fc21e405e7..dc9b1e659a42 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -113,7 +113,6 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
 	return 0;
 }
 
-__maybe_unused
 static bool smmu_cmdq_has_space(struct arm_smmu_queue *cmdq, u32 n)
 {
 	struct arm_smmu_ll_queue *llq = &cmdq->llq;
@@ -344,6 +343,104 @@ static int smmu_init(void)
 	return ret;
 }
 
+static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *command)
+{
+	u64 type = FIELD_GET(CMDQ_0_OP, command[0]);
+
+	switch (type) {
+	case CMDQ_OP_CFGI_STE:
+		/* TBD: SHADOW_STE*/
+		break;
+	case CMDQ_OP_CFGI_ALL:
+	{
+		/*
+		 * Linux doesn't use range STE invalidation, and only use this
+		 * for CFGI_ALL, which is done on reset and not on an new STE
+		 * being used.
+		 * Although, this is not architectural we rely on the current Linux
+		 * implementation.
+		 */
+		if ((FIELD_GET(CMDQ_CFGI_1_RANGE, command[1]) != 31))
+			return true;
+		break;
+	}
+	case CMDQ_OP_TLBI_NH_ASID:
+	case CMDQ_OP_TLBI_NH_VA:
+	case CMDQ_OP_TLBI_NH_ALL:
+	case 0x13: /* CMD_TLBI_NH_VAA: Not used by Linux */
+	{
+		/* Only allow VMID = 0 */
+		if (FIELD_GET(CMDQ_TLBI_0_VMID, command[0]) != 0)
+			return true;
+		break;
+	}
+	case CMDQ_OP_PREFETCH_CFG:
+	case CMDQ_OP_CFGI_CD:
+	case CMDQ_OP_CFGI_CD_ALL:
+	case CMDQ_OP_TLBI_NSNH_ALL:
+	case CMDQ_OP_PRI_RESP:
+	case CMDQ_OP_RESUME:
+		break;
+	case CMDQ_OP_CMD_SYNC:
+		if (FIELD_GET(CMDQ_SYNC_0_CS, command[0]) == CMDQ_SYNC_0_CS_IRQ) {
+			/* Do not allow MSI */
+			command[0] &= ~CMDQ_SYNC_0_CS;
+			command[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
+			command[1] &= ~CMDQ_SYNC_1_MSIADDR_MASK;
+		}
+		break;
+	default:
+		/* Deny unknown commands */
+		return true;
+	}
+
+	return false;
+}
+
+static int smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 *host_cmdq = hyp_phys_to_virt(smmu->cmdq_host.base_dma);
+	u64 cmd[CMDQ_ENT_DWORDS];
+	int idx, ret;
+	u32 pending;
+	bool skip;
+
+	if (!is_cmdq_enabled(smmu))
+		return 0;
+
+	pending = (1 << (smmu->cmdq_host.llq.max_n_shift)) - queue_space(&smmu->cmdq_host.llq);
+
+	hyp_spin_lock(&smmu->hw_lock);
+	/* Wait for the command queue to have some space. */
+	ret = smmu_wait(false, smmu_cmdq_has_space(&smmu->cmdq, pending));
+	if (ret) {
+		hyp_spin_unlock(&smmu->hw_lock);
+		return ret;
+	}
+
+	while (pending--) {
+		int i;
+
+		idx = Q_IDX(&smmu->cmdq_host.llq, smmu->cmdq_host.llq.cons);
+		queue_inc_cons(&smmu->cmdq_host.llq);
+
+		/* Copy the command to local buffer avoiding TOCTOU */
+		for (i = 0; i < CMDQ_ENT_DWORDS; ++i)
+			cmd[i] = le64_to_cpu(READ_ONCE(host_cmdq[idx * CMDQ_ENT_DWORDS + i]));
+
+		skip = smmu_filter_command(smmu, cmd);
+		if (WARN_ON(skip))
+			continue;
+		smmu_add_cmd_raw(smmu, cmd);
+	}
+
+	writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
+
+	ret = smmu_wait(false, smmu_cmdq_empty(&smmu->cmdq));
+	hyp_spin_unlock(&smmu->hw_lock);
+	return ret;
+}
+
 static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u32 shift = smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
@@ -385,18 +482,51 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		 */
 		mask = read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP | IDR0_ATS);
 		break;
-	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_CMDQ_BASE:
+		/*
+		 * Although allowed to use smaller size, we rely on the SMMUv3 driver
+		 * using 64-bit store instruction for simplicity.
+		 */
+		if (len != sizeof(u64))
+			break;
 		if (is_write) {
 			/* Not allowed by the architecture */
 			if (is_cmdq_enabled(smmu))
 				break;
 			smmu->cmdq_host.q_base = val;
+			goto out_ret;
+		} else {
+			val = smmu->cmdq_host.q_base;
+			goto out_update_regs;
 		}
-		mask = read_write;
-		break;
 	case ARM_SMMU_CMDQ_PROD:
+		if (len != sizeof(u32))
+			break;
+		if (is_write) {
+			smmu->cmdq_host.llq.prod = val;
+			WARN_ON(smmu_emulate_cmdq_insert(smmu));
+			goto out_ret;
+		} else {
+			val = smmu->cmdq_host.llq.prod;
+			goto out_update_regs;
+		}
 	case ARM_SMMU_CMDQ_CONS:
+		if (len != sizeof(u32))
+			break;
+		if (is_write) {
+			if (WARN_ON(is_cmdq_enabled(smmu)))
+				break;
+
+			smmu->cmdq_host.llq.cons = val;
+			goto out_ret;
+		} else {
+			/* Propagate errors back to the host.*/
+			u32 cons = readl_relaxed(smmu->base + ARM_SMMU_CMDQ_CONS);
+
+			val = smmu->cmdq_host.llq.cons | (CMDQ_CONS_ERR & cons);
+			goto out_update_regs;
+		}
+	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_STRTAB_BASE:
 	case ARM_SMMU_STRTAB_BASE_CFG:
 	case ARM_SMMU_GBPA:
@@ -481,10 +611,20 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		mask = read_write;
 		break;
 	/* Allowed RO 32 bit registers. */
+	case ARM_SMMU_IDR1:
+		if (len != sizeof(u32))
+			break;
+		/* Cap CMDQS to the shadow queue size. */
+		if (!is_write) {
+			val = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
+			val &= ~IDR1_CMDQS;
+			val |= FIELD_PREP(IDR1_CMDQS, smmu->cmdq.llq.max_n_shift);
+			goto out_update_regs;
+		}
+	fallthrough;
 	case ARM_SMMU_IIDR:
 	case ARM_SMMU_IDR5:
 	case ARM_SMMU_IDR3:
-	case ARM_SMMU_IDR1:
 	case ARM_SMMU_IRQ_CTRLACK:
 	case ARM_SMMU_GERROR:
 		if (len != sizeof(u32))
-- 
2.56.0.176.g3575e65682-goog


