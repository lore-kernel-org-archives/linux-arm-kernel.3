Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C24C98309
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00AhV3k+li4lYucaDcO3o5UE2oHbgVQJ9mR0kZROZeQ=; b=4BVsh8F1hkd+1mU+UKP4IXcMg4
	dsuftEthwZci7GqeUqDtD9pZ8Bu1O3yTTxFLxsWqVYkW5JFtXZK0Mmc65zK1Gd74hwnZmejo7Ysk2
	QAisepL/bZmN9qT60F9euOH7Q4VlFSpQwMCJUkV9CgBg37D4wg7N6QQS46JQB7gyRD+xUW/u8cAIc
	AUGT8yZajYGGrYWLhax1XtePWPmR+cZmWHLi5e15h5RJQuOUDtD/yC5Es2aDj5HXePVf8tHAg2uYg
	ZCuxCbkMSZ2HsvBRQ7n6emsHBfn+Y/6rdOe3m36sqU10KlHHmIol2Q468yg/r75emjboQFHAKhhPj
	Al6LteEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Jg-00000005SdV-1RAc;
	Tue, 22 Sep 2026 13:13:48 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JJ-00000005SJN-10mU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:26 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49e823c4868so33799135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082802; x=1790687602; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=00AhV3k+li4lYucaDcO3o5UE2oHbgVQJ9mR0kZROZeQ=;
        b=XK6nd8qfpDF7IcMZgiU9/aBS2xHF3vm0ex93dtHeQmu0tkb0lLhNnzNU79SsXqokR+
         BOOZzmSIZGX2cTKL1RZ8yfZMlfyVCFDrralDQ+uXsZRE7QhIogRAeFYSE+/2hATfW5qh
         89cqsElGUZDyx5AcUi5GYZZu+0ZU+L1tFwNZ6WyuBr3aH2hVlLME7KSBbC6voz2e79N8
         E9358hhbPRuoCblMKcRuiRaJTOu6nWGHtQfON0wFRa7CBrG73y1o/Imu5x82ULyfmpXn
         N33zKiPJAtMqaawveiqubPNdF9WKHmdE/id9brGM65HtPRcZkJBIQwIYqlA6FFYtQeqW
         ePTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082802; x=1790687602;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00AhV3k+li4lYucaDcO3o5UE2oHbgVQJ9mR0kZROZeQ=;
        b=WErEa4owe/+ERI486hZvqdsVLNeNnxJAjZo0g+sRQz6ltMNZksEHBMLRbG8VS/1M8c
         y3obgfsuuhSqnzxyCKzHvfDLU1yyG5cbHZiLItyLOaJpWhog/8kFSfGZKRLtZBX1hJ7G
         lUfULhV9sKOeNRfk3duG/tEwpDxBhFvAlazaM4OSa6MBl6q0AMr0AmLwGfpLGI9I2eUq
         IjQqcJfRHcgXuZFLyD74S0ePLibXSZ/CsqT2OR5+HEA7xgdwRXx8NdKx3rU/yC/tfe8k
         WycVVxORyMARr23w5WV7jwYkWNu7sc2dHtF1UvexOI1iA5RcnEakcgnR4o1Q/tBX449X
         LxGw==
X-Gm-Message-State: AFuF++ljDjmi6oWJkb9Ki//WsvP6xVaM9DTggigYfQ8BqthP9y6hDphU
	mPdzcLaZx3/DkCqOKoQkWqm25ge6cZjErTF16+ToaTaUbmzPPYjpBcWRHd9oWloazYjCxQn9hRY
	Bihn+cnwzFbSEfGGaLqsHdINiBfezLNIKnsEp6FkcEDlO58c9r1AZtOIy+OysjTVZE3udEtZSQK
	PdS1+XLiGMyS8fMPhW1Q4FfvKqp4O+Lo03HxnVZTrV1oRpjm8XejFVNWJEYO1IgPiesg==
X-Received: from wmqy9.prod.google.com ([2002:a05:600c:3649:b0:49c:d3c6:97b4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:4441:10b0:49f:ce78:3572 with SMTP id 5b1f17b1804b1-49fce783674mr94578205e9.35.1790082802190;
 Tue, 22 Sep 2026 06:13:22 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:49 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-17-smostafa@google.com>
Subject: [PATCH v8 16/25] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
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
X-CRM114-CacheID: sfid-20260922_061325_315308_CEB88134 
X-CRM114-Status: GOOD (  26.79  )
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

Don't allow access to the command queue from the host:
- ARM_SMMU_CMDQ_BASE: Only allowed to be written when CMDQ is disabled, we
  use it to keep track of the host command queue base.
  Reads return the saved value.
- ARM_SMMU_CMDQ_PROD: Writes trigger command queue emulation which sanitise
  and filters the whole range. Reads returns the host copy.
- ARM_SMMU_CMDQ_CONS: Writes move the sw copy of the cons, but the host
  can't skip commands once submitted. Reads return the emulated value and
  the error bits in the actual cons.

Also add emulation for IDR1.CMDQS to return the hypervisor command queue
size which can be equal to or smaller to the HW size.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 151 +++++++++++++++++-
 1 file changed, 146 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 38b8ecc5cc10..8c67e348f4a3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -111,7 +111,6 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
 	return 0;
 }
 
-__maybe_unused
 static bool smmu_cmdq_has_space(struct arm_smmu_queue *cmdq, u32 n)
 {
 	struct arm_smmu_ll_queue *llq = &cmdq->llq;
@@ -340,6 +339,105 @@ static int smmu_init(void)
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
+	bool use_wfe = smmu->features & ARM_SMMU_FEAT_SEV;
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
+	ret = smmu_wait(use_wfe, smmu_cmdq_has_space(&smmu->cmdq, pending));
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
+	ret = smmu_wait(use_wfe, smmu_cmdq_empty(&smmu->cmdq));
+	hyp_spin_unlock(&smmu->hw_lock);
+	return ret;
+}
+
 static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u32 shift = smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
@@ -381,18 +479,51 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
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
@@ -468,10 +599,20 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
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
 	case ARM_SMMU_GERROR:
 		if (len != sizeof(u32))
 			break;
-- 
2.55.0.1082.g2b9226bbc0-goog


