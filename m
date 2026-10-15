Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01307CCA46B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrEOEPSGJdrT+r8ut9ZMnt1QbUsQgQecPDrsSjFG450=; b=yCW6y+/N6u6Y0OC8aOdT/OSuZ2
	6F4jboPNnxPOiePgdTGkeE1MNLnMPs52bhTbY2ZiQVR0cMDjgycCyFOSu2vwxOYdqNfN3Y3QM7p7C
	g+S45DKwwni6A24WsCYOuj1VBW7jUBl4zsDKyWrUQL4nlFx9ovnGzKtTlTtwS4vQHTUaMOeBWHplt
	aOr+mz61EkbRRYrVMAMy1w04ntJ++WrksHB2WM8X5rc5X+3ThbXzes79h+xXzZfQwBfQRTsor27Rt
	a2TP/StDuoFOa9J/Py6jPr9djZXimTZIdaWDCkLM3dEb98AUi9PxNutjeMynGzBBqRjBpqaLeElRD
	rI7OiQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRmZ-00000001JMo-44O6;
	Thu, 15 Oct 2026 20:10:31 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlh-00000001IG5-0ShJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:41 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48b027578a4so1571300f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094975; x=1792699775; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrEOEPSGJdrT+r8ut9ZMnt1QbUsQgQecPDrsSjFG450=;
        b=wSiZvzRsk7iE/oN1P62HIoXrfBuLepvl/4i4myNTfBol6zyR7duG61SyVTYQiWrZ5t
         QeWelz8WuseGIOoM5uttcPcKI14S3Xma5sH9xdkv1t//HQq1jZds+uRI9PbTRGMAhAbf
         R1Xz7dLsyVzy+6SvCeIcycoQuTHSMIWFw3puNd/mCsq6pd3S7H4XfH7EvQlo14XltZJt
         Vme0cu7EUo4PJzgjpxF8p3hMSXqELNGb+Z91LZQsbhBqQd14VD/yBXLiz93msHxqTw0X
         uxJyIHk18G2On25l8euarZmS3mdhGoyByxqwkKnuMnD53iLbmoYpInxom8Tj/vig6gjY
         K0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094975; x=1792699775;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrEOEPSGJdrT+r8ut9ZMnt1QbUsQgQecPDrsSjFG450=;
        b=Zfg68XDmEDOabq7GbG8wt+kyzo1CLqdh4umcz0tT0V/J0bIyve7dzUCc3HY1QmCd2D
         koEpsXEVmHCIlOv0w4JA9b3oyRLD2bNd77uwPob8qT5SiS6VjRVxqBLXfuKL3Lsf5rNb
         Pvpl3XovBcfx0szoKsnHz6Yathl0WiZdscsgT2jlj51uCjvOhhrkx7nzHZysYn0aJTrX
         bjnHL/OyNHTROrVSDOin+urij7mS67n9fC05phN5wpS09pTNutObt2d2Fqc196pWDV84
         IMrg/kSbDJIMEHBF9MFYkFsUmQN/4DojLFIwqa4Crc/wXSUTKqW5DLTEhsQEh2IuGxUP
         C8fA==
X-Gm-Message-State: AFq9FYJMVxrb0eQRXlU0FlDzycWATRMwhjMxB+prgND2aMMJCR/4X+nY
	I0uuQSi9OqUeZuqbs9VhFDjgEx/LGMJq3ZSIVB9hg8vETkw998tAdjdnXlfpkUdPs54oQaQ3UGw
	/u06p0BVkqVhreQcRpge4c6lbktArXhYS3Xbaofu4e5On4xn+FsPSbuC4AwdTuVHHgz1f4TXiRR
	8Fvttmgn9C/xCK4kp2mqgXkWrOPIuvbpGpomr2VqsaLJPQZHwie7D1BjeiaMDBdwTqmQ==
X-Received: from wmbf10.prod.google.com ([2002:a05:600c:594a:b0:4a1:b4c7:1ef2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e07:b0:4a1:8627:aec7 with SMTP id 5b1f17b1804b1-4a18e4987abmr362157685e9.5.1792094974491;
 Thu, 15 Oct 2026 13:09:34 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:50 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-20-smostafa@google.com>
Subject: [PATCH v9 19/25] iommu/arm-smmu-v3-kvm: Share other queues
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
X-CRM114-CacheID: sfid-20261015_130937_226210_CFA22197 
X-CRM114-Status: GOOD (  21.38  )
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

The event and PRI queues are written by the SMMU, not read by the
hypervisor, so they are not shadowed. They still must not be pointed at
protected memory: when the host enables a queue, share and pin its
memory, which fails unless the host owns it and keeps the host from
donating it afterwards.

The queues stay shared once enabled, as the SMMU may keep writing until
CR0ACK reflects the disable, and the base may not change once shared.
The kernel driver programs each base once and never changes it.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 81 +++++++++++++++++--
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  8 ++
 2 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 132f3a9ba308..1972df1d2a8d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -82,6 +82,16 @@ static bool is_smmu_enabled(struct hyp_arm_smmu_v3_device *smmu)
 	return FIELD_GET(CR0_SMMUEN, smmu->cr0);
 }
 
+static bool is_evtq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_EVTQEN, smmu->cr0);
+}
+
+static bool is_priq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_PRIQEN, smmu->cr0);
+}
+
 /*
  * Host structures the hypervisor reads (CMDQ, STE) are shared and pinned:
  * - Prevent the host from donating this memory.
@@ -663,6 +673,20 @@ static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
 				   cmdq_size(&smmu->cmdq_host)));
 }
 
+static void smmu_share_queue(struct hyp_arm_smmu_v3_device *smmu,
+			     unsigned long q_base, size_t ent_size_shift)
+{
+	/* Q_BASE_ADDR_MASK is not enough as the SMMU also ignores bits > OAS */
+	phys_addr_t base = q_base & Q_BASE_ADDR_MASK & ((1ULL << smmu->oas) - 1);
+	size_t size = 1UL << (FIELD_GET(Q_BASE_LOG2SIZE, q_base) + ent_size_shift);
+
+	/* The host must program the base first and it must be aligned to size. */
+	if (WARN_ON(!q_base || (base & (size - 1))))
+		return;
+
+	WARN_ON(smmu_share_pages(base, size));
+}
+
 static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			     struct user_pt_regs *regs,
 			     u64 esr, u32 off)
@@ -768,6 +792,8 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		if (is_write) {
 			bool last_cmdq_en = is_cmdq_enabled(smmu);
 			bool last_smmu_en = is_smmu_enabled(smmu);
+			bool last_evtq_en = is_evtq_enabled(smmu);
+			bool last_priq_en = is_priq_enabled(smmu);
 
 			/* Enforce ATS checks. */
 			if (smmu->features & ARM_SMMU_FEAT_ATS)
@@ -777,6 +803,26 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 				smmu_emulate_cmdq_enable(smmu);
 			else if (last_cmdq_en && !is_cmdq_enabled(smmu))
 				smmu_emulate_cmdq_disable(smmu);
+
+			/*
+			 * Share PRI and EVTQ to avoid the host using them to write to
+			 * protected memory. However, do not unshare the queues at disable
+			 * as that is more complicated, unsharing from here can lead to
+			 * use-after-unshare issues, and requires ordering with cr0ack.
+			 * The host can disable those queues during shutdown, but it never
+			 * changes the base address (even with RPM), so leave the queue
+			 * shared and assert that multiple host writes do not change it.
+			 */
+			if (!last_evtq_en && is_evtq_enabled(smmu) && !smmu->evtq_shared) {
+				smmu_share_queue(smmu, smmu->evtq_base, EVTQ_ENT_SZ_SHIFT);
+				smmu->evtq_shared = true;
+			}
+
+			if (!last_priq_en && is_priq_enabled(smmu) && !smmu->priq_shared) {
+				smmu_share_queue(smmu, smmu->priq_base, PRIQ_ENT_SZ_SHIFT);
+				smmu->priq_shared = true;
+			}
+
 			if (!last_smmu_en && is_smmu_enabled(smmu))
 				smmu_emulate_enable(smmu);
 			else if (last_smmu_en && !is_smmu_enabled(smmu))
@@ -806,6 +852,34 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 
 		mask = read_write;
 		break;
+	case ARM_SMMU_EVTQ_BASE:
+		if (len != sizeof(u64))
+			break;
+
+		if (is_write) {
+			/* See ARM_SMMU_CR0 */
+			if (is_evtq_enabled(smmu) ||
+			    (smmu->evtq_shared && smmu->evtq_base != val))
+				break;
+			smmu->evtq_base = val;
+		}
+		mask = read_write;
+		break;
+
+	case ARM_SMMU_PRIQ_BASE:
+		if (len != sizeof(u64))
+			break;
+
+		if (is_write) {
+			/* See ARM_SMMU_CR0 */
+			if (is_priq_enabled(smmu) ||
+			    (smmu->priq_shared && smmu->priq_base != val))
+				break;
+			smmu->priq_base = val;
+		}
+		mask = read_write;
+		break;
+
 	/* Allowed 32 bit registers. */
 	case ARM_SMMU_EVTQ_IRQ_CFG1:
 	case ARM_SMMU_EVTQ_IRQ_CFG2:
@@ -833,15 +907,12 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 	case ARM_SMMU_EVTQ_IRQ_CFG0:
 	case ARM_SMMU_PRIQ_IRQ_CFG0:
 	case ARM_SMMU_GERROR_IRQ_CFG0:
+		if (len != sizeof(u64))
+			break;
 		/* These are RES0 as MSI support is hidden. */
 		val = 0;
 		if (!is_write)
 			goto out_update_regs;
-		fallthrough;
-	case ARM_SMMU_EVTQ_BASE:
-	case ARM_SMMU_PRIQ_BASE:
-		if (len != sizeof(u64))
-			break;
 		mask = read_write;
 		break;
 	/* Allowed RO 32 bit registers. */
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index 31ab7a0335a8..2fb478e9233a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -32,6 +32,10 @@
  * @strtab_cfg:		Stream table config as seen by HW
  * @strtab_dma:		Physical address of the shadow stream table
  * @strtab_size:	Size of the shadow stream table
+ * @evtq_base:		Host EVTQ_BASE value
+ * @priq_base:		Host PRIQ_BASE value
+ * @evtq_shared:	Whether the EVTQ was shared
+ * @priq_shared:	Whether the PRIQ was shared
  *
  * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
  * before de-privilege, the rest by the hypervisor driver.
@@ -61,6 +65,10 @@ struct hyp_arm_smmu_v3_device {
 	u64			host_ste_cfg;
 	u64			host_ste_base;
 	struct arm_smmu_strtab_cfg strtab_cfg;
+	u64			evtq_base;
+	u64			priq_base;
+	bool			evtq_shared;
+	bool			priq_shared;
 };
 
 #ifdef __KVM_NVHE_HYPERVISOR__
-- 
2.56.0.176.g3575e65682-goog


