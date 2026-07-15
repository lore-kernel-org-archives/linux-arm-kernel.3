Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD7FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZv8wMHHgtVyVaoJdrUTfCe907vJcKIQX+U9Fwaj/aI=; b=sG7gmlRL6c54DYT5nuECdKasxw
	XcZBbG9QnjZzGI2y5qcxREUjCxJ5Wy5ac6njNRdidiWg9lv8SGt/oW8QAzDQUW5FMWIaCfdI/PHEb
	R9lbY8xEXHr8MNWk9Bxio0p1S952pzoFqAo1YVNec4yXmNR0CgojgaCk5yeI9h+VK6KmBpHu0qXIc
	DtZyfl9yysr7hIhNkYf1ryCHmKOI1uH4sgPYWtakW0MWeB2W2wDNsChsp/r14mCigR5k7RkdBjbU+
	og4HpD33jaq6jy1LrXMqFU5zTeUuZOggLkDwgRkVfl3AlK3CSpAUL/dxPACjyYG20+oxiieHzvY5M
	IVUszSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHY-0000000EfrF-1zZA;
	Wed, 15 Jul 2026 12:00:08 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyH7-0000000EfLA-1GkR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:43 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso4018678f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116777; x=1784721577; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZv8wMHHgtVyVaoJdrUTfCe907vJcKIQX+U9Fwaj/aI=;
        b=CHjFfjIaVWF71xacEFoKPcLQfL3jmHxVULkXNL29/UPKsCJn9Ao9a50PqzR46Q7tBR
         wwJbaIb6zkVIXSRJVfH2RTmKcQvl0F036mEFHjeIhAnDXxI4nR6HtrQb2KODfQtRxLqW
         KoMAFEAiHSesyeRTy/gHQC9QKsF+90+IdylKQoaWx8RWqiPmHyEoSpawf7jNwQGf5Rpa
         HODe9WPewRlken9JPx3RN1MVYkRrLx/PS8IJthx/HbHDpTn8uWGKPoOA4fC0MiYvOuBQ
         4GgthQRpLZpg1oGoUOi1uWRJgyX4hRr6jxoh5IVEIQTG0g7YFyTA0d//c+rKINB1Wk/h
         vnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116777; x=1784721577;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZv8wMHHgtVyVaoJdrUTfCe907vJcKIQX+U9Fwaj/aI=;
        b=BedTL3qaM6uQQu994tKezFDk3Kzkyf8BgokPt0+Cfd71D8eSwNRmVbPo6GnNjscLXL
         dCk5HJwDJOxzxdE16LSjVDsg2IIBoIgRdSFMeHEwO9omRqbO8V92fBAA9JEvkTbG82Xi
         3t9SAl6JEnOO659svrEWsgk63chxJtWhgxdZ9Wo7FGunFpxuKJuqD852M3pH/G/N+otl
         JH11qhVxIR8YQsDVKd6yj2sgkqFXFZYxjgQqoVAiaNfNyw5QD52xq5YsnYuKNBiMBVrZ
         KrWmuIhd3tFwDwuueToz6bYC1zEpWrkKgiAbLXqW9iXP1bdFb4hDMfgMYC85nt9Hby/r
         541g==
X-Gm-Message-State: AOJu0YxsgEwNR87dg0ofT8P6hhvBn0KhqaYZrOVMKdz0RhMteeMZzfyK
	dt2KBmiDRqGedHVL8+aIwX9QJPyEX3Qx3YsIh758kRvybNrvumm5ZFXnXa29zG8dAAPNFVgZ9FG
	KiHtn1TiEMWnlLMtkwNu37WX2nJrnJkU1K1N1/vlyiAia2a7+3XVvE82+VMZ2KlYeZstZWotjIy
	VkEuITH0KGkesxrhtasFFu5W4unoBMU+8JHwILMHiTLDgISxHjbcrobgJ7UMyPbdUJ8Q==
X-Received: from wmpj23.prod.google.com ([2002:a05:600c:4897:b0:493:f522:9fbe])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:283:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-49518306db9mr62910255e9.27.1784116777309;
 Wed, 15 Jul 2026 04:59:37 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:59:00 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-20-smostafa@google.com>
Subject: [PATCH v7 19/24] iommu/arm-smmu-v3-kvm: Share other queues
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
X-CRM114-CacheID: sfid-20260715_045941_482985_13D12FC3 
X-CRM114-Status: GOOD (  20.55  )
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

Other queues as PRIQ and EVTQ doesn't need to be shadowed. However, we
need to make sure they are in a state that disallow them to be donated
to the hypervisor or guests. So, keep track of those and share them when
they get enabled.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 78 +++++++++++++++++--
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  8 ++
 2 files changed, 81 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index fba3b3e15780..11de73640a6f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -74,6 +74,16 @@ static bool is_smmu_enabled(struct hyp_arm_smmu_v3_device *smmu)
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
  * CMDQ, STE host copies are accessed by the hypervisor, we share them to
  * - Prevent the host from passing protected VM memory.
@@ -647,6 +657,18 @@ static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
 				   cmdq_size(&smmu->cmdq_host)));
 }
 
+static void smmu_emulate_queue(struct hyp_arm_smmu_v3_device *smmu,
+			       unsigned long q_base, size_t ent_size_shift)
+{
+	/* Q_BASE_ADDR_MASK is not enough as the SMMU also ignores bits > OAS */
+	phys_addr_t base = q_base & Q_BASE_ADDR_MASK & ((1ULL << smmu->oas) - 1);
+	size_t size = 1UL << (FIELD_GET(Q_BASE_LOG2SIZE, q_base) + ent_size_shift);
+
+	/* Queues are aligned to the size also. */
+	base &= ~(size - 1);
+	WARN_ON(smmu_share_pages(base, size));
+}
+
 static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			     struct user_pt_regs *regs,
 			     u64 esr, u32 off)
@@ -751,12 +773,34 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		if (is_write) {
 			bool last_cmdq_en = is_cmdq_enabled(smmu);
 			bool last_smmu_en = is_smmu_enabled(smmu);
+			bool last_evtq_en = is_evtq_enabled(smmu);
+			bool last_priq_en = is_priq_enabled(smmu);
 
 			smmu->cr0 = val;
 			if (!last_cmdq_en && is_cmdq_enabled(smmu))
 				smmu_emulate_cmdq_enable(smmu);
 			else if (last_cmdq_en && !is_cmdq_enabled(smmu))
 				smmu_emulate_cmdq_disable(smmu);
+
+			/*
+			 * Share PRI and EVTQ to avoid the host using them to write to
+			 * protected memory. However, do not unshare the queues at disable
+			 * as that is more complicated, unsharing from here can lead to
+			 * use-after-unshare issues, and requires ordering with cr0ack.
+			 * The host can disable those queue during shutdown, but it nevers
+			 * changes the base address (even with RPM), so leave the queue
+			 * shared and assert that multiple host writes does not change it.
+			 */
+			if (!last_evtq_en && is_evtq_enabled(smmu) && !smmu->evtq_shared) {
+				smmu_emulate_queue(smmu, smmu->evtq_base, EVTQ_ENT_SZ_SHIFT);
+				smmu->evtq_shared = true;
+			}
+
+			if (!last_priq_en && is_priq_enabled(smmu) && !smmu->priq_shared) {
+				smmu_emulate_queue(smmu, smmu->priq_base, PRIQ_ENT_SZ_SHIFT);
+				smmu->priq_shared = true;
+			}
+
 			if (!last_smmu_en && is_smmu_enabled(smmu))
 				smmu_emulate_enable(smmu);
 			else if (last_smmu_en && !is_smmu_enabled(smmu))
@@ -780,6 +824,33 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		mask = read_write;
 		break;
 	}
+	case ARM_SMMU_EVTQ_BASE:
+		if (len != sizeof(u64))
+			break;
+
+		if (is_write) {
+			/* See ARM_SMMU_CR0 */
+			if (is_evtq_enabled(smmu) ||
+			    (smmu->evtq_shared && (smmu->evtq_base != val)))
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
+			    (smmu->priq_shared && (smmu->priq_base != val)))
+				break;
+			smmu->priq_base = val;
+		}
+		mask = read_write;
+		break;
 
 	/* Allowed 32 bit registers. */
 	case ARM_SMMU_EVTQ_IRQ_CFG1:
@@ -810,15 +881,12 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
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
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 085aead009b6..d96801e433ef 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -32,6 +32,10 @@
  * @host_ste_cfg	Host stream table config
  * @host_ste_base	Host stream table base
  * @strtab_cfg		Stream table as seen by HW
+ * @evtq_base		Host evtq base reg
+ * @priq_base		Host priq base reg
+ * @evtq_shared		Whether the EVTQ was setup
+ * @priq_shared		Whether the PRIQ was setup
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -56,6 +60,10 @@ struct hyp_arm_smmu_v3_device {
 	u64			host_ste_cfg;
 	u64			host_ste_base;
 	struct arm_smmu_strtab_cfg strtab_cfg;
+	unsigned long		evtq_base;
+	unsigned long		priq_base;
+	bool				evtq_shared;
+	bool				priq_shared;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.55.0.141.g00534a21ce-goog


