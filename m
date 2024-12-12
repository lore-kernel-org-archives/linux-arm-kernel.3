Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6E7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QW55e4r1FCJJZ+Mxmax2CNsYmQyYsh/1We9MYonnJlo=; b=KNB6Ve01RQY83snkdOq+P/B6MK
	d4mNlMYSuaZ9G/QDzZdLASfwz4n7vSx+5uRYCTDIz0p3nx+I4iJ9Z0pzmXIeFOSWVhNj6q5D4Z1ir
	j5BU0kdE52ALYWgc7ofQALIkDhaR1Jovi2bDz3gaB9UDzaM/2LW3W0QZ12475oNqSwK1Be0tDqYED
	Ffng+S/4wZFP72tSWEvpJbl79lvWMgQ7wHCJTzE4cQTxhS3O5CA1QsAaK9zgZrB2O1FXKCbvpVHX7
	fk8MwFrZJCcXF85H52gZurOauXyJfDAVRufHzQcAmHE2mfWUJ6gUlN9/K6xLRZnZU5P3fmHv4pfRl
	RPEHHqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo1q-00000001Rac-3Sx1;
	Thu, 12 Dec 2024 18:35:14 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZF-00000001JpK-2C0T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:42 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-385e4a759e6so529183f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026740; x=1734631540; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QW55e4r1FCJJZ+Mxmax2CNsYmQyYsh/1We9MYonnJlo=;
        b=flPiE/+coS6oRk+sDJb4TQyEIJS9yKdvqiE/3yxF5X2tBC+ijt5q08mM0GCJyXWMgw
         45z/wDn7U2zEXKajzqwgKkMUOA0vrZKiExM97eodkKC7AIubzLKmrP8buIn0KDwk12yX
         qFDorHWaZ0LqXc78ub/UGHHP+DvMVt/Z0Vnc1mNq5uDfWfTidxWU/yB6vDmgvw0hVWnm
         mIBw4vuyHncG6uscDtAwE7gm4tOgUnM2BTkM6PSN+bxWAQ0bFjIFYpSRPSFZP6YHRXn3
         WK77QankbimkkGZ8v1e8f/PqLsr/JWSGHZnkCPbn+EYh8+l+Xh+En9dHmzf33Vkkh3XU
         q0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026740; x=1734631540;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QW55e4r1FCJJZ+Mxmax2CNsYmQyYsh/1We9MYonnJlo=;
        b=MidanDrM8/kpaYMKGZpeotg/GzejgUrXkc7OPuYNoVlKkhkkEWJeIcT5ZAIPS70XKO
         EcWtaN3LG6tIAzUeuOT+pNNchDkPOe9kmew/ke9O3YZH9PrgfZPoNT476gaWChFSIT0O
         Sx7YFN1IuzYyFNCf5e6QYAnVbQp+auxAH3kJgnIMPugsBqeyE29o4oJPiUfUpKsgP7hW
         k7ZlaxJD790XH8yfI+jT9EfDflRmki01bdWdFg6WeCaJs7hV6lI+jkKhc/Czpq9L0FJB
         0lVaCd8tEIW0hslQevy74xwXTskGPhe1YxphVt4HcM1i9RM2x9z9Omvd7Vk89RIHXKWT
         0fyg==
X-Forwarded-Encrypted: i=1; AJvYcCVr79uTPmRZ5YYU5IxXtMtCECD55ydoCA1RK0u10HNNvZkkn3YvGNAx0+dXOW4w/DoMDIbdxzMstOnbbpDoLvmi@lists.infradead.org
X-Gm-Message-State: AOJu0YzWrRIHe53doszDlwwBM4qyY564el/BSF8Y0rmR2j2DHXYsCjdf
	8CdbKwaX2muUTyz7U8dYV2GD/UsAemn7m+wjihFPDlXVxDOMNAJzHBMWGhLSR6wA+NvaROjv9oi
	Hq7VXLeTVsw==
X-Google-Smtp-Source: AGHT+IHB49GVFxhdt7ghgV1N9Jg4Guc+tgbfuRWfQoxnqpfh1xTzyJZXQcrGjuehIps7RcSM/ejov5lNnWr6nQ==
X-Received: from wmoy17.prod.google.com ([2002:a05:600c:17d1:b0:434:e665:11a3])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186b:b0:385:ec8d:8ca9 with SMTP id ffacd0b85a97d-387877c98ffmr3854714f8f.42.1734026739887;
 Thu, 12 Dec 2024 10:05:39 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:51 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-28-smostafa@google.com>
Subject: [RFC PATCH v2 27/58] KVM: arm64: smmu-v3: Setup command queue
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100541_567877_A3FAC021 
X-CRM114-Status: GOOD (  17.71  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Map the command queue allocated by the host into the hypervisor address
space. When the host mappings are finalized, the queue is unmapped from
the host.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 165 ++++++++++++++++++++
 include/kvm/arm_smmu_v3.h                   |   4 +
 2 files changed, 169 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index f7e60c188cb0..e15356509424 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -41,6 +41,15 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 	__ret;							\
 })
 
+#define smmu_wait_event(_smmu, _cond)				\
+({								\
+	if ((_smmu)->features & ARM_SMMU_FEAT_SEV) {		\
+		while (!(_cond))				\
+			wfe();					\
+	}							\
+	smmu_wait(_cond);					\
+})
+
 static int smmu_write_cr0(struct hyp_arm_smmu_v3_device *smmu, u32 val)
 {
 	writel_relaxed(val, smmu->base + ARM_SMMU_CR0);
@@ -60,6 +69,123 @@ static void smmu_reclaim_pages(u64 phys, size_t size)
 	WARN_ON(__pkvm_hyp_donate_host(phys >> PAGE_SHIFT, size >> PAGE_SHIFT));
 }
 
+#define Q_WRAP(smmu, reg)	((reg) & (1 << (smmu)->cmdq_log2size))
+#define Q_IDX(smmu, reg)	((reg) & ((1 << (smmu)->cmdq_log2size) - 1))
+
+static bool smmu_cmdq_full(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 cons = readl_relaxed(smmu->base + ARM_SMMU_CMDQ_CONS);
+
+	return Q_IDX(smmu, smmu->cmdq_prod) == Q_IDX(smmu, cons) &&
+	       Q_WRAP(smmu, smmu->cmdq_prod) != Q_WRAP(smmu, cons);
+}
+
+static bool smmu_cmdq_empty(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 cons = readl_relaxed(smmu->base + ARM_SMMU_CMDQ_CONS);
+
+	return Q_IDX(smmu, smmu->cmdq_prod) == Q_IDX(smmu, cons) &&
+	       Q_WRAP(smmu, smmu->cmdq_prod) == Q_WRAP(smmu, cons);
+}
+
+static int smmu_add_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			struct arm_smmu_cmdq_ent *ent)
+{
+	int i;
+	int ret;
+	u64 cmd[CMDQ_ENT_DWORDS] = {};
+	int idx = Q_IDX(smmu, smmu->cmdq_prod);
+	u64 *slot = smmu->cmdq_base + idx * CMDQ_ENT_DWORDS;
+
+	if (smmu->iommu.power_is_off)
+		return -EPIPE;
+
+	ret = smmu_wait_event(smmu, !smmu_cmdq_full(smmu));
+	if (ret)
+		return ret;
+
+	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
+
+	switch (ent->opcode) {
+	case CMDQ_OP_CFGI_ALL:
+		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
+		break;
+	case CMDQ_OP_CFGI_CD:
+		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SSID, ent->cfgi.ssid);
+		fallthrough;
+	case CMDQ_OP_CFGI_STE:
+		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
+		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
+		break;
+	case CMDQ_OP_TLBI_NH_VA:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
+		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
+		break;
+	case CMDQ_OP_TLBI_NSNH_ALL:
+		break;
+	case CMDQ_OP_TLBI_NH_ASID:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
+		fallthrough;
+	case CMDQ_OP_TLBI_S12_VMALL:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
+		break;
+	case CMDQ_OP_TLBI_S2_IPA:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
+		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
+		break;
+	case CMDQ_OP_CMD_SYNC:
+		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	for (i = 0; i < CMDQ_ENT_DWORDS; i++)
+		slot[i] = cpu_to_le64(cmd[i]);
+
+	smmu->cmdq_prod++;
+	writel(Q_IDX(smmu, smmu->cmdq_prod) | Q_WRAP(smmu, smmu->cmdq_prod),
+	       smmu->base + ARM_SMMU_CMDQ_PROD);
+	return 0;
+}
+
+static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	struct arm_smmu_cmdq_ent cmd = {
+		.opcode = CMDQ_OP_CMD_SYNC,
+	};
+
+	ret = smmu_add_cmd(smmu, &cmd);
+	if (ret)
+		return ret;
+
+	return smmu_wait_event(smmu, smmu_cmdq_empty(smmu));
+}
+
+__maybe_unused
+static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			 struct arm_smmu_cmdq_ent *cmd)
+{
+	int ret = smmu_add_cmd(smmu, cmd);
+
+	if (ret)
+		return ret;
+
+	return smmu_sync_cmd(smmu);
+}
+
 static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u64 val, old;
@@ -94,6 +220,41 @@ static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 cmdq_base;
+	size_t cmdq_nr_entries, cmdq_size;
+	int ret;
+	enum kvm_pgtable_prot prot = PAGE_HYP;
+
+	cmdq_base = readq_relaxed(smmu->base + ARM_SMMU_CMDQ_BASE);
+	if (cmdq_base & ~(Q_BASE_RWA | Q_BASE_ADDR_MASK | Q_BASE_LOG2SIZE))
+		return -EINVAL;
+
+	smmu->cmdq_log2size = cmdq_base & Q_BASE_LOG2SIZE;
+	cmdq_nr_entries = 1 << smmu->cmdq_log2size;
+	cmdq_size = cmdq_nr_entries * CMDQ_ENT_DWORDS * 8;
+
+	cmdq_base &= Q_BASE_ADDR_MASK;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		prot |= KVM_PGTABLE_PROT_NORMAL_NC;
+
+	ret = ___pkvm_host_donate_hyp_prot(cmdq_base >> PAGE_SHIFT,
+					   PAGE_ALIGN(cmdq_size) >> PAGE_SHIFT,
+					   false, prot);
+	if (ret)
+		return ret;
+
+	smmu->cmdq_base = hyp_phys_to_virt(cmdq_base);
+
+	memset(smmu->cmdq_base, 0, cmdq_size);
+	writel_relaxed(0, smmu->base + ARM_SMMU_CMDQ_PROD);
+	writel_relaxed(0, smmu->base + ARM_SMMU_CMDQ_CONS);
+
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int ret;
@@ -113,6 +274,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		return ret;
 
+	ret = smmu_init_cmdq(smmu);
+	if (ret)
+		return ret;
+
 	return kvm_iommu_init_device(&smmu->iommu);
 }
 
diff --git a/include/kvm/arm_smmu_v3.h b/include/kvm/arm_smmu_v3.h
index fb24bcef1624..393a1a04edba 100644
--- a/include/kvm/arm_smmu_v3.h
+++ b/include/kvm/arm_smmu_v3.h
@@ -16,8 +16,12 @@ struct hyp_arm_smmu_v3_device {
 	struct kvm_hyp_iommu	iommu;
 	phys_addr_t		mmio_addr;
 	size_t			mmio_size;
+	unsigned long		features;
 
 	void __iomem		*base;
+	u32			cmdq_prod;
+	u64			*cmdq_base;
+	size_t			cmdq_log2size;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.47.0.338.g60cca15819-goog


