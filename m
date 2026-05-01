Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD48CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHCyI4M39cq38I/WoB1TwD8PIWXzXb414TVCe9luOcI=; b=q2+lcX/4CyIqbABu1V6jbLA66P
	dXl2qEKEQJ5XrJc7JE5WlmuPM6Fj3+uHEiO/c7Rp2N1/rdbRZyhSQyvR9V45U5vituXY+XH0zE6jt
	tpBnCK1wqaK/2GeQ+uNpDoeW0z0YgDc9I5gukfZa/Qi/3ZP/Zo5iwM8iVTMoeEFaJQv8oAkxtaAND
	fHda6+3wyddacpOv4fcEv5yZHW4RRZAFwKcfGnQY90gQydAvy7b1Ik3/xne/QikasGJseoilqogJ/
	oagXnmbjuRV9hfvMpknmciIgEbMqGOr1RvFNY0KprqBqsn7hZONrr7oP4xBBSdpsINPyrSKwXcHO/
	V4/icOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv9-00000006dLU-3wp2;
	Fri, 01 May 2026 11:20:35 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv4-00000006d8r-2kGx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4891f97aef0so11938775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634428; x=1778239228; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LHCyI4M39cq38I/WoB1TwD8PIWXzXb414TVCe9luOcI=;
        b=r0rUYNAcf752hAgDsIbLViB7yFX3AZD9k0euUPOMdjdKZRE0A+LJKjjzFJxAs/cdMl
         rGjc8T63KB+LHJKF8ObGftBIC1uFajNep5GEYjJfLzom3TxhKSFQgeaZIU64h84ioUTv
         YXNfj0H0JxNq+mDMJ4o/SvN/1ZqspT9Gh7VEX+uzCn1DIF5Z3YagdvhsmpfbJDfLmtE5
         w6YlNkD0Hx1vyaHbIhez68htj9DshtRvBdj8qEehBGddxeTRIu9WQg5sDqyF/Vv6AHl4
         i2L22dKB0hBVyJ9CMTykIffrb6wCBwkUEpBB2ggwIE49I2Ad5zMwooEjv6pTvJQ+tiFc
         DftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634428; x=1778239228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHCyI4M39cq38I/WoB1TwD8PIWXzXb414TVCe9luOcI=;
        b=jyvJk0SwCaIPDE9MkhAKrkRO6+fjN+O/fh3a6nH5WOTxGZDTMhp8KtjMQsr3M5sx/h
         Au7obr2EC2u7IlQU9TIC8/juNGCeC+Qr6+6HxBdfQNYaKoWF4nCNvX4p0FaevukRgcWw
         jUJWRCFQzoz9WN9rcvnxhd2a2yQLMc6WPPjVKS4fUArf6Qmn2kQ/IyYIUvUOykkBQe2/
         2UMZnaF7BNvkZkfMvza+PzZPfcwwfgHHkPttH4xVWL9tqgd0uCdMnuZ5E42qA+RBbqkc
         7G8jJwNn9Ns2GjBRu9lYi0wdW3B2iuNeDZfeLg3ZgVmQdhVlXbpyqKdapjvmi5OdfvHA
         9l6w==
X-Gm-Message-State: AOJu0YygtyejjgveT8oIAakBtTehrfPvCKg8RUBz4ZkeOrBc4RrqhvLL
	G1b9vTSXG1H5N0MqiKcGmo12VHiUTQxIQq34Tjye1pejgmmfCLoaBWVwi22zBk0TFU1wKgY0WjD
	y3JWnbfJPg1I/m0wfkIc08b+EJxHEYbLDc9k4kdqanz4Iw2cRfXZ8+W+2aVo7/C1JjE/+F0cnVE
	DjSFiHF+inZkFJ2BiazjQjK9xjE7j5VFTYPClUNGjZvCiqckxKEdLKil/OY/q2CxQ2dA==
X-Received: from wmxa17-n2.prod.google.com ([2002:a05:600d:6451:20b0:48a:5d27:4655])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e55:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48a8eb616a7mr42752255e9.6.1777634427898;
 Fri, 01 May 2026 04:20:27 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:22 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-21-smostafa@google.com>
Subject: [PATCH v6 20/25] iommu/arm-smmu-v3-kvm: Share other queues
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
X-CRM114-CacheID: sfid-20260501_042030_828135_1BE70AB4 
X-CRM114-Status: GOOD (  17.88  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 62 ++++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  4 ++
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index d92811ef2af5..e258690384f4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -69,6 +69,16 @@ static bool is_smmu_enabled(struct hyp_arm_smmu_v3_device *smmu)
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
@@ -647,6 +657,14 @@ static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
 				   cmdq_size(&smmu->cmdq_host)));
 }
 
+static void smmu_emulate_queue(unsigned long q_base, size_t ent_size_shift)
+{
+	phys_addr_t base = q_base & Q_BASE_ADDR_MASK;
+	size_t size = 1UL << (FIELD_GET(Q_BASE_LOG2SIZE, q_base) + ent_size_shift);
+
+	WARN_ON(smmu_share_pages(base ,size));
+}
+
 static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			     struct user_pt_regs *regs,
 			     u64 esr, u32 off)
@@ -748,12 +766,31 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
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
+			 * protected memory. However, panic on disable for those queues
+			 * as that is more complicated, unsharing from here can lead to
+			 * use-after-unshare issues, and requires ordering with cr0ack.
+			 * As the host never disable those queues, don't support that.
+			 */
+			if (!last_evtq_en && is_evtq_enabled(smmu))
+				smmu_emulate_queue(smmu->evtq_base, EVTQ_ENT_SZ_SHIFT);
+			else if (last_evtq_en && !is_evtq_enabled(smmu))
+				WARN_ON(1);
+			if (!last_priq_en && is_priq_enabled(smmu))
+				smmu_emulate_queue(smmu->priq_base, PRIQ_ENT_SZ_SHIFT);
+			else if (last_priq_en && !is_priq_enabled(smmu))
+				WARN_ON(1);
+
 			if (!last_smmu_en && is_smmu_enabled(smmu))
 				smmu_emulate_enable(smmu);
 			else if (last_smmu_en && !is_smmu_enabled(smmu))
@@ -779,6 +816,29 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		mask = read_write;
 		break;
 	}
+	case ARM_SMMU_EVTQ_BASE:
+		if (len != sizeof(u64))
+			break;
+
+		if (is_write) {
+			if (is_evtq_enabled(smmu))
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
+			if (is_priq_enabled(smmu))
+				break;
+			smmu->priq_base = val;
+		}
+		mask = read_write;
+		break;
 
 	/* Allowed 32 bit registers. */
 	case ARM_SMMU_EVTQ_PROD + SZ_64K:
@@ -801,9 +861,7 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		mask = read_write;
 		break;
 	/* Allowed 64 bit registers. */
-	case ARM_SMMU_EVTQ_BASE:
 	case ARM_SMMU_EVTQ_IRQ_CFG0:
-	case ARM_SMMU_PRIQ_BASE:
 	case ARM_SMMU_PRIQ_IRQ_CFG0:
 	case ARM_SMMU_GERROR_IRQ_CFG0:
 		if (len != sizeof(u64))
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 6a73cf6b8873..e811d51bdfaa 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -30,6 +30,8 @@
  * @host_ste_cfg	Host stream table config
  * @host_ste_base	Host stream table base
  * @strtab_cfg		Stream table as seen by HW
+ * @evtq_base		Host evtq base reg
+ * @priq_base		Host priq base reg
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -52,6 +54,8 @@ struct hyp_arm_smmu_v3_device {
 	u64			host_ste_cfg;
 	u64			host_ste_base;
 	struct arm_smmu_strtab_cfg strtab_cfg;
+	unsigned long		evtq_base;
+	unsigned long		priq_base;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.54.0.545.g6539524ca2-goog


