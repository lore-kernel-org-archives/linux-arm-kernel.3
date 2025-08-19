Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F84CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpTNTvVpyesRrKSyybEzym6wQoCbw5IvodwWn1PTcVU=; b=2sFt3VOqX02JyC8Nfpk70s2+wx
	T1kNq0cudg6tnIbB2Fz/LpJMoad65Wd9jTMiSM4s+SaJ6oRWznCw5+TkvSx4VOREiJ1XSjofr9wLH
	zHiPRjXfk1/MVSl4rm8gTqrLkn+vV4BJ1n+PO3Nluazs0cnUyrlM29Xg4LhVZK2i6Q3lGDQddUJKC
	bDSD04PRmvSNg5OT/RXhV10xdX1B28zZxT0hVbEdDnp9XbobMjajYYduXPHNeTg76AQ7RQQYWN8Fm
	D+zwOMH6O2xrRgMYnykSHeGaU8tlpUd8yBDJrCYsQzHOLikghleWiwXQaHyU1kNf6hS2Hd6TUfN1h
	q0UJpYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWjX-0000000BxRz-1jNb;
	Wed, 20 Aug 2025 00:31:19 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG7-0000000BfXb-47D0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:49 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9e418aab7so2448273f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640366; x=1756245166; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GpTNTvVpyesRrKSyybEzym6wQoCbw5IvodwWn1PTcVU=;
        b=yEPR0SnzrufghJQ9vY7rPueR7MW//ZClrR0HiPlXb2TNUa0x3xXJGy57ecY0Orok6y
         DEW9K8ga85UACSNA5nZuB31ouCjyxAN7V0CtY67RnOx8FbBnraIH1iZotRrTeDTCqACL
         6B477UcygiZ8wg+EdD1/naBvft5UY7qcjpKNUWj0yGgTHfW5/Q/zMzxn0He/rHODoJFs
         zg2m+tuZaX3LFm06WVuaLUFKk7DoZfmB1kGTGDzyptijiy/oUWb9l6pVt2KDfUjaIv0g
         H31STQvg4OLtrcApYfeR3tbyYtfD1rT7BrDr/d+aetBsMvB44ADDbteX/xriRe0ErA0I
         fjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640366; x=1756245166;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpTNTvVpyesRrKSyybEzym6wQoCbw5IvodwWn1PTcVU=;
        b=LD2pNV/YuYVncnU8hc0iqbmFBo6R+/fNAbEYoVmq7yqUQqa6s8gQHhLoj6WbF/piHe
         fG5Ny0C0Q5EYvVp9TfjRskB4gzMnaWicn7pYaprKmuo8rtmO/nURraywuPso6BslAUv0
         MOcGTm+pkjoVHtz8hAoU3IddznJyET/rBph5FUeuMbVO9yEjyL0RxvDs14zGYlOfKZea
         21eWIoe/BTxG3Sp9UMJRnqBwjV9WjymPMZKYZdk1lmhOgot8HzcgVH/MIx2tSzb2HHha
         6vMvqU07LWSoOtKW8mNwFqojOS2iiBgWarF4cBASKxYNLiYG5fVQlNbJYy8BZGN0hUEQ
         cjUw==
X-Forwarded-Encrypted: i=1; AJvYcCVInYPo5PUWIPPQnJ8omLRRfnh/OJ68zr/2iYtd3vziIp82+0O4tL5M1JNxdrWgHrpnFIyVuNhGUwTY6uCiGp7T@lists.infradead.org
X-Gm-Message-State: AOJu0YwRn27NUQM0jbPIsjbDMlOex9QJHfMh6qR1bIWdxx8/30k4avhF
	y0zn9lhtQKBPCh9B6pItD07NkFRcPTuuhoBbpkhWPh1u9hI57UbeXXXzzGqBSqzE3AR2iHHd6rT
	a8tRhb/2mKA+/qQ==
X-Google-Smtp-Source: AGHT+IHbIVYXrILomuPPQlVOuNyID7IU9oeIvKa7J2aqvl3fa71ziBavxg/PMhhybuVw4KlLKOLHJjlemW2pCg==
X-Received: from wrbee12.prod.google.com ([2002:a05:6000:210c:b0:3b9:1c6e:dc37])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:200d:b0:3b4:9b82:d42c with SMTP id ffacd0b85a97d-3c32c52f02dmr296609f8f.17.1755640366147;
 Tue, 19 Aug 2025 14:52:46 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:51 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-24-smostafa@google.com>
Subject: [PATCH v4 23/28] iommu/arm-smmu-v3-kvm: Shadow stream table
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
X-CRM114-CacheID: sfid-20250819_145248_025261_4DAE1E15 
X-CRM114-Status: GOOD (  28.34  )
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

This patch allocates the shadow stream table per SMMU.
We choose the size of that table to be 1MB which is the
max size used by host in the case of 2 levels.

In this patch all the host writes are still paththrough for
bisectibility, that is changed next where CFGI commands will be
trapped and used to update the shadow copy hypervisor that
will be used by HW.

Similar to the command queue, the host stream table is
shared/unshared each time the SMMU is enabled/disabled.

Handling of L2 tables is also done in the next patch when
the shadowing is added.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   |  13 +-
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 111 ++++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  10 ++
 3 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 86e6c68aad4e..821190abac5a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -14,6 +14,8 @@
 #include "pkvm/arm_smmu_v3.h"
 
 #define SMMU_KVM_CMDQ_ORDER				4
+#define SMMU_KVM_STRTAB_ORDER				(get_order(STRTAB_MAX_L1_ENTRIES * \
+							 sizeof(struct arm_smmu_strtab_l1)))
 
 extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
 
@@ -60,7 +62,7 @@ static int kvm_arm_smmu_array_alloc(void)
 	/* Basic device tree parsing. */
 	for_each_compatible_node(np, NULL, "arm,smmu-v3") {
 		struct resource res;
-		void *cmdq_base;
+		void *cmdq_base, *strtab;
 
 		ret = of_address_to_resource(np, 0, &res);
 		if (ret)
@@ -94,6 +96,15 @@ static int kvm_arm_smmu_array_alloc(void)
 		kvm_arm_smmu_array[i].cmdq.base_dma = virt_to_phys(cmdq_base);
 		kvm_arm_smmu_array[i].cmdq.llq.max_n_shift = SMMU_KVM_CMDQ_ORDER + PAGE_SHIFT -
 							     CMDQ_ENT_SZ_SHIFT;
+
+		strtab = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, SMMU_KVM_STRTAB_ORDER);
+		if (!strtab) {
+			ret = -ENOMEM;
+			goto out_err;
+		}
+		kvm_arm_smmu_array[i].strtab_dma = virt_to_phys(strtab);
+		kvm_arm_smmu_array[i].strtab_size = PAGE_SIZE << SMMU_KVM_STRTAB_ORDER;
+
 		i++;
 	}
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 10c6461bbf12..d722f8ce0635 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -15,6 +15,14 @@
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
+/* strtab accessors */
+#define strtab_log2size(smmu)	(FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, (smmu)->host_ste_cfg))
+#define strtab_size(smmu)	((1 << strtab_log2size(smmu)) * STRTAB_STE_DWORDS * 8)
+#define strtab_host_base(smmu)	((smmu)->host_ste_base & STRTAB_BASE_ADDR_MASK)
+#define strtab_split(smmu)	(FIELD_GET(STRTAB_BASE_CFG_SPLIT, (smmu)->host_ste_cfg))
+#define strtab_l1_size(smmu)	((1 << (strtab_log2size(smmu) - strtab_split(smmu))) * \
+				 (sizeof(struct arm_smmu_strtab_l1)))
+
 #define for_each_smmu(smmu) \
 	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
 	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
@@ -255,6 +263,48 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	u32 reg;
+	enum kvm_pgtable_prot prot = PAGE_HYP;
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		prot |= KVM_PGTABLE_PROT_NORMAL_NC;
+
+	ret = ___pkvm_host_donate_hyp(hyp_phys_to_pfn(smmu->strtab_dma),
+				      smmu->strtab_size >> PAGE_SHIFT, prot);
+	if (ret)
+		return ret;
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		unsigned int last_sid_idx =
+			arm_smmu_strtab_l1_idx((1ULL << smmu->sid_bits) - 1);
+
+		cfg->l2.l1tab = hyp_phys_to_virt(smmu->strtab_dma);
+		cfg->l2.l1_dma = smmu->strtab_dma;
+		cfg->l2.num_l1_ents = min(last_sid_idx + 1, STRTAB_MAX_L1_ENTRIES);
+
+		reg = FIELD_PREP(STRTAB_BASE_CFG_FMT,
+				 STRTAB_BASE_CFG_FMT_2LVL) |
+		      FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE,
+				 ilog2(cfg->l2.num_l1_ents) + STRTAB_SPLIT) |
+		      FIELD_PREP(STRTAB_BASE_CFG_SPLIT, STRTAB_SPLIT);
+	} else {
+		cfg->linear.table = hyp_phys_to_virt(smmu->strtab_dma);
+		cfg->linear.ste_dma = smmu->strtab_dma;
+		cfg->linear.num_ents = 1UL << smmu->sid_bits;
+		reg = FIELD_PREP(STRTAB_BASE_CFG_FMT,
+				 STRTAB_BASE_CFG_FMT_LINEAR) |
+		      FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, smmu->sid_bits);
+	}
+
+	writeq_relaxed((smmu->strtab_dma & STRTAB_BASE_ADDR_MASK) | STRTAB_BASE_RA,
+		       smmu->base + ARM_SMMU_STRTAB_BASE);
+	writel_relaxed(reg, smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int i, ret;
@@ -282,6 +332,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		goto out_ret;
 
+	ret = smmu_init_strtab(smmu);
+	if (ret)
+		goto out_ret;
+
 	return 0;
 
 out_ret:
@@ -320,6 +374,11 @@ static int smmu_init(void)
 	return ret;
 }
 
+static bool is_smmu_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_SMMUEN, smmu->cr0);
+}
+
 static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
 {
 	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
@@ -407,6 +466,39 @@ static void smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
 	WARN_ON(smmu_wait_event(smmu, smmu_cmdq_empty(&smmu->cmdq)));
 }
 
+static void smmu_update_ste_shadow(struct hyp_arm_smmu_v3_device *smmu, bool enabled)
+{
+	size_t strtab_size;
+	u32 fmt  = FIELD_GET(STRTAB_BASE_CFG_FMT, smmu->host_ste_cfg);
+
+	/* Linux doesn't change the fmt nor size of the strtab in the run time. */
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		strtab_size = strtab_l1_size(smmu);
+		WARN_ON(fmt != STRTAB_BASE_CFG_FMT_2LVL);
+		WARN_ON((strtab_split(smmu) != STRTAB_SPLIT));
+	} else {
+		strtab_size = strtab_size(smmu);
+		WARN_ON(fmt != STRTAB_BASE_CFG_FMT_LINEAR);
+		WARN_ON(FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->host_ste_cfg) >
+		       smmu->sid_bits);
+	}
+
+	if (enabled)
+		WARN_ON(smmu_share_pages(strtab_host_base(smmu), strtab_size));
+	else
+		WARN_ON(smmu_unshare_pages(strtab_host_base(smmu), strtab_size));
+}
+
+static void smmu_emulate_enable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	smmu_update_ste_shadow(smmu, true);
+}
+
+static void smmu_emulate_disable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	smmu_update_ste_shadow(smmu, false);
+}
+
 static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	size_t cmdq_size;
@@ -474,19 +566,38 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		goto out_ret;
 	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_STRTAB_BASE:
+		if (is_write) {
+			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
+			WARN_ON(is_smmu_enabled(smmu));
+			smmu->host_ste_base = val;
+		}
+		mask = read_write;
+		break;
 	case ARM_SMMU_STRTAB_BASE_CFG:
+		if (is_write) {
+			/* Must only be written when SMMU_CR0.SMMUEN == 0.*/
+			WARN_ON(is_smmu_enabled(smmu));
+			smmu->host_ste_cfg = val;
+		}
+		mask = read_write;
+		break;
 	case ARM_SMMU_GBPA:
 		mask = read_write;
 		break;
 	case ARM_SMMU_CR0:
 		if (is_write) {
 			bool last_cmdq_en = is_cmdq_enabled(smmu);
+			bool last_smmu_en = is_smmu_enabled(smmu);
 
 			smmu->cr0 = val;
 			if (!last_cmdq_en && is_cmdq_enabled(smmu))
 				smmu_emulate_cmdq_enable(smmu);
 			else if (last_cmdq_en && !is_cmdq_enabled(smmu))
 				smmu_emulate_cmdq_disable(smmu);
+			if (!last_smmu_en && is_smmu_enabled(smmu))
+				smmu_emulate_enable(smmu);
+			else if (last_smmu_en && !is_smmu_enabled(smmu))
+				smmu_emulate_disable(smmu);
 		}
 		mask = read_write;
 		WARN_ON(len != sizeof(u32));
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 330da53f80d0..cf85e5efdd9e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -15,6 +15,8 @@
  * @mmio_addr		base address of the SMMU registers
  * @mmio_size		size of the registers resource
  * @features		Features of SMMUv3, subset of the main driver
+ * @strtab_dma		Phys address of stream table
+ * @strtab_size		Stream table size
  *
  * Other members are filled and used at runtime by the SMMU driver.
  * @base		Virtual address of SMMU registers
@@ -26,6 +28,9 @@
  * @cmdq		CMDQ as observed by HW
  * @cmdq_host		Host view of the command queue
  * @cr0			Last value of CR0
+ * @host_ste_cfg	Host stream table config
+ * @host_ste_base	Host stream table base
+ * @strtab_cfg		Stream table as seen by HW
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -44,6 +49,11 @@ struct hyp_arm_smmu_v3_device {
 	struct arm_smmu_queue	cmdq;
 	struct arm_smmu_queue	cmdq_host;
 	u32			cr0;
+	dma_addr_t		strtab_dma;
+	size_t			strtab_size;
+	u64			host_ste_cfg;
+	u64			host_ste_base;
+	struct arm_smmu_strtab_cfg strtab_cfg;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.51.0.rc1.167.g924127e9c0-goog


