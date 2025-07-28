Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E8DC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vj2lZtAFAyuHgLIRKJXZh0xuKI4AtqGdr8zk+v3t+I=; b=aZWfi2QiO13SeeBSOLk76VyxwY
	yJ17QhOiOi0QsPbrfgA3rrV5lAACZy5Gr9RjUbXbsLaw/1ltICGG4v3DeusMf4mwi6jOVPupii//E
	YhsGrPJ+2FaRA9m8qF+FWIZSC7/G1oGCetMBcGZsIaBKRJowjgthFW1emLYrLWNasDt8fqFXBDPIq
	68+ccDkE/X/7yUv56gPLM6E2B3V2AbpJdNDpY/1EIXKXU5HCPNbX6zb5GJwegcVVDytVWriQOFuO+
	U030R7k9zkLBnenCLX8l8QONzF4q+vD4tlJRZKp3AdVFcYad53VA7UlM9o1guUuWbyMCsDg05DTi/
	SANvH+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTis-0000000FI8N-0pKn;
	Mon, 28 Jul 2025 19:41:22 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2w-0000000F91O-49xY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:54:00 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-ae9cd38721aso467770966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725237; x=1754330037; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0vj2lZtAFAyuHgLIRKJXZh0xuKI4AtqGdr8zk+v3t+I=;
        b=38IORUxNrQhS4Y/5rZ5DEYAgdGSHSLbXQgyDafEnyi4OOi/qrkOZVFM5zi0hb5kVZH
         ekyVsoCknu0c1jNigpahevFgi+WoC7yzwFgCBM7ZGBduC3IKnvz6XyPQD1Btxx3cDmbj
         lpr/M44wKierYKlXo0SrwKdFfeD6HucX/U9vbs9RyrRx1si7kpCR0PSa/6q9oy54udcU
         abY9ypf9sN4i0vAX+r/Gx31CM9kgHGS6C3wjGbPGR6iMcOysnzbd4o0e9QXeggdTyB9z
         dyrFSHp62HVJ2/PDUwlgUoZtiSpk7mwKdHN7OVv7QK31rbGyvdf4IjQSsmpwT22OUPtR
         YrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725237; x=1754330037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vj2lZtAFAyuHgLIRKJXZh0xuKI4AtqGdr8zk+v3t+I=;
        b=riTlrJSJXe6dnzVLPCnGeLsgXT0f/EGrWHDOwH5I9FHszKUeFCUDob723JH7tjiuf6
         kdtyT8Z3ihpMT3rMpXEI6PwziOlYgJv8CzPJyZx2Eki+QXdY1lUWc1/OINzN0CgklwNI
         W6vfLsWkRhVZj6C2i2Ey4d1hpxskE51i5t6eU+Q6cjM/1HhmkM1VwNfvoZ1DX/VZg5Hc
         zMMNLd23lIUYwHDx+nyu4bC24dHA2CmysAee4MSstacg18lKmbn1x7O0GbtLjn/U1LeV
         GdfBTltlVd9TrFVEt8ljBX3OyQGPqD+/yYutztxV0ct5W1LxJE9lHojutv3KlLyn2p1I
         3qZg==
X-Forwarded-Encrypted: i=1; AJvYcCXpXB3G5IsmS+D0Dg84TnHi301PKmkkWTTyI0tsfz73d/z2biAZLVQWN7fVDgnMYImn1IE+q/xlLH8102tQb4n0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2B8J58fOa8VnXmbDsXrcqZIHVe2bWjTXgulZHrcN84G0yNyzo
	UbnnMTDHQHmJKMMrysEYUhnSPS90IDiUGeJUnL/hb3LBElKL/c+UMoPenhVPENiNTQGoQN2C8BE
	XHN4hjSI+zcoTXA==
X-Google-Smtp-Source: AGHT+IGVIq17cLn93oc40o5M8UsmhcmyEY+aWX6m0jcNoqtnD1qIUUFbq5lUoqYkBT4qJuVFWbmyB6BKPXnAVg==
X-Received: from ejcss14.prod.google.com ([2002:a17:907:c00e:b0:ade:897b:b48d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e12:b0:ae0:b847:435 with SMTP id a640c23a62f3a-af61eb0d30dmr1480823666b.49.1753725236850;
 Mon, 28 Jul 2025 10:53:56 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:15 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-29-smostafa@google.com>
Subject: [PATCH v3 28/29] iommu/arm-smmu-v3-kvm: Allocate structures and reset device
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
X-CRM114-CacheID: sfid-20250728_105359_043579_F12D62AA 
X-CRM114-Status: GOOD (  19.96  )
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

Allocate the structures that will be shared between hypervisor and SMMU:
command queue, page table and stream table. Install them in the MMIO
registers, along with some configuration bits. After hyp initialization,
the host won't have access to those pages anymore.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h             |  5 ++
 arch/arm64/kvm/iommu.c                        |  9 ++-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 65 +++++++++++++++++++
 3 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index b42e32ff2a84..37b34a9f7135 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1684,4 +1684,9 @@ int kvm_iommu_register_driver(struct kvm_iommu_driver *kern_ops, struct kvm_iomm
 int kvm_iommu_init_driver(void);
 void kvm_iommu_remove_driver(void);
 size_t kvm_iommu_pages(void);
+
+#ifdef CONFIG_ARM_SMMU_V3_PKVM
+size_t smmu_hyp_pgt_pages(void);
+#endif
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
index 0e52cc0e18de..c4605e8001ca 100644
--- a/arch/arm64/kvm/iommu.c
+++ b/arch/arm64/kvm/iommu.c
@@ -51,10 +51,15 @@ void kvm_iommu_remove_driver(void)
 
 size_t kvm_iommu_pages(void)
 {
+	size_t nr_pages = 0;
 	/*
 	 * This is called very early during setup_arch() where no initcalls,
 	 * so this has to call specific functions per each KVM driver.
 	 */
-	kvm_nvhe_sym(hyp_kvm_iommu_pages) = 0;
-	return 0;
+#ifdef CONFIG_ARM_SMMU_V3_PKVM
+	nr_pages = smmu_hyp_pgt_pages();
+#endif
+
+	kvm_nvhe_sym(hyp_kvm_iommu_pages) = nr_pages;
+	return nr_pages;
 }
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 2fa56ddfbdab..2e51e211250d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 Linaro Ltd.
  */
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_pkvm.h>
 
 #include <linux/of_platform.h>
 
@@ -16,6 +17,7 @@ extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
 struct host_arm_smmu_device {
 	struct arm_smmu_device		smmu;
 	pkvm_handle_t			id;
+	u32				boot_gbpa;
 };
 
 #define smmu_to_host(_smmu) \
@@ -65,6 +67,35 @@ static bool kvm_arm_smmu_validate_features(struct arm_smmu_device *smmu)
 	return true;
 }
 
+static int kvm_arm_smmu_device_reset(struct host_arm_smmu_device *host_smmu)
+{
+	int ret;
+	u32 reg;
+	struct arm_smmu_device *smmu = &host_smmu->smmu;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
+	if (reg & CR0_SMMUEN)
+		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
+
+	/* Disable bypass */
+	host_smmu->boot_gbpa = readl_relaxed(smmu->base + ARM_SMMU_GBPA);
+	ret = arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+	if (ret)
+		return ret;
+
+	ret = arm_smmu_device_disable(smmu);
+	if (ret)
+		return ret;
+
+	/* Stream table */
+	arm_smmu_write_strtab(smmu);
+
+	/* Command queue */
+	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
+
+	return 0;
+}
+
 static int kvm_arm_smmu_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -112,6 +143,20 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	if (!kvm_arm_smmu_validate_features(smmu))
 		return -ENODEV;
 
+	ret = arm_smmu_init_one_queue(smmu, &smmu->cmdq.q, smmu->base,
+				      ARM_SMMU_CMDQ_PROD, ARM_SMMU_CMDQ_CONS,
+				      CMDQ_ENT_DWORDS, "cmdq");
+	if (ret)
+		return ret;
+
+	ret = arm_smmu_init_strtab(smmu);
+	if (ret)
+		return ret;
+
+	ret = kvm_arm_smmu_device_reset(host_smmu);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, smmu);
 
 	/* Hypervisor parameters */
@@ -130,6 +175,15 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 
 static void kvm_arm_smmu_remove(struct platform_device *pdev)
 {
+	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
+	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
+
+	/*
+	 * There was an error during hypervisor setup. The hyp driver may
+	 * have already enabled the device, so disable it.
+	 */
+	arm_smmu_device_disable(smmu);
+	arm_smmu_update_gbpa(smmu, host_smmu->boot_gbpa, GBPA_ABORT);
 }
 
 static const struct of_device_id arm_smmu_of_match[] = {
@@ -208,6 +262,17 @@ static void kvm_arm_smmu_v3_remove_drv(void)
 	platform_driver_unregister(&kvm_arm_smmu_driver);
 }
 
+size_t smmu_hyp_pgt_pages(void)
+{
+	/*
+	 * SMMUv3 uses the same format as stage-2 and hence have the same memory
+	 * requirements, we add extra 100 pages for L2 ste.
+	 */
+	if (of_find_compatible_node(NULL, NULL, "arm,smmu-v3"))
+		return host_s2_pgtable_pages() + 100;
+	return 0;
+}
+
 struct kvm_iommu_driver kvm_smmu_v3_ops = {
 	.init_driver = kvm_arm_smmu_v3_init_drv,
 	.remove_driver = kvm_arm_smmu_v3_remove_drv,
-- 
2.50.1.552.g942d659e1b-goog


