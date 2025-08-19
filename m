Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E594CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/fU42/CqOBV85U7agBN+amVl2Ghkx92fsFwG9kBi+E=; b=tv00X5IbDC/7bRlZIDm3Hhr4ON
	dGQ/fAEJayIrmF19lvZvypUG/qAs2qNYh7+dkqq36KRldAou8io5BjcW7MwanGAaBQ9Prpk7+AJt2
	XsXpAqkMehqhrXiylCokd5bUWSCMzWO0jjoQ6EFGIWtDdV521ASWqelfvb8sNtS2bQmebCNC4zCEf
	izhLAdldx6l2C4LBhXtlwq5qHMjQK77fFdb+D/nUI02JTDT0LwV+FvzDiugRkxhAfBLV7Zo24MGAx
	2FndmnsYx2mWJS4QlgI3LX/Jp7IB3x8w0ppwkbEj2By/Ed7wFZQ92Z85lJEZ3vLLhEtCMfGzG8U7H
	m5I9V8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWbj-0000000BwUk-47kV;
	Wed, 20 Aug 2025 00:23:15 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG5-0000000BfVk-11Fu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:46 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9e4157303so4677893f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640363; x=1756245163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/fU42/CqOBV85U7agBN+amVl2Ghkx92fsFwG9kBi+E=;
        b=yeKYbkjVWDDTKt0X+Zosud7++Mmsq5LsiuHIO5Tj/39connXuh32DCp/HPynC+qVGQ
         j2+yVi0lbkw5nMqZ6rT/CsV3tjD8zpbQtuA1TtfhU0N85kUXGRDedYb2HPr14LEEBfAU
         Ogz+c2YcOGQVub/YB3Rt0BoCmZJ8QglE9phxKf5yqiSwBPFsELlXmb51ZWI+6VL2GxIq
         wUGlMWmb5NNOd+c8U3m1ZflEo12haolGKz9US0/MonINEt8g7aspuDTjvlz8YeyZA3do
         2JgK/y90ypKulWSGDDs2GWb87D00zYecHSLwgYGSBBaO+sc5uRAAiHT4CHmqUkdSCKsF
         NZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640363; x=1756245163;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4/fU42/CqOBV85U7agBN+amVl2Ghkx92fsFwG9kBi+E=;
        b=feTtKq2p97XUOdyji6PFVdfo58kvJ+QJX2CWImo0UvU6RCDVOkJUDQdwIOsGx6hY/1
         qbt7OX/izvWJ5/pNxMnyB6TsPQc0IGwgfvbMIGnJHC+VRRosu9CpE9eJo+lduWDnyHj+
         ND1U9n0Aj8TuDpRfLrcCRnxriNyGcbWH8gF3Fa2QnhSWav11HO83RWaOto9OCO0bTTX/
         /juiuexIpi9UrP8PbuzSHeaWF/5Ykr2dO2Qk6tVK9N1L5SiYHB7dDj4owXNaYJFyhTbj
         8OgUZgdV3N+jLMe1rI3pad0WL4N9XWS1/CcjY2oehFyQLlVJDttFRb2eOrrhi9MNc0d5
         NaJg==
X-Forwarded-Encrypted: i=1; AJvYcCWdcSrGMBcdu0ODoVG6sLtvKuwPuflGIYdZ9xAgVQhIWScMbKPMt/mv2eArHdziLhLL0g+koSUwVzWu7Ixdx7Mj@lists.infradead.org
X-Gm-Message-State: AOJu0YxlC/kJz/o6nmmTU7ArRUGVi8fAVdsLNTH1/wGsywdkqAIqD8tq
	asDfWOjMPi8x6pb+tpiEAj7OqNnmyBIVcuwGyfgdL+XbqfPjI/P+sC9SdlBL5GAmOWJtc//1IMk
	vrGysqQQcpKG44A==
X-Google-Smtp-Source: AGHT+IHPR2TOMegxsTQof55IYyVi+Xg9i8ImL2L9AnGlc4nKnoOPBojWzhoAgagvHESAt69mQX/N31I7JbKjMQ==
X-Received: from wmbeb11.prod.google.com ([2002:a05:600c:678b:b0:459:e068:b510])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e7:0:b0:3a5:783f:528a with SMTP id ffacd0b85a97d-3c32eeb80e4mr358475f8f.59.1755640363546;
 Tue, 19 Aug 2025 14:52:43 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:48 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-21-smostafa@google.com>
Subject: [PATCH v4 20/28] iommu/arm-smmu-v3-kvm: Shadow the command queue
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145245_284439_BCB793B9 
X-CRM114-Status: GOOD (  29.79  )
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

At boot allocate a command queue per SMMU which is used as a shadow
by the hypervisor.

The command queue size is 64K which is more than enough, as the
hypervisor would consume all the entries per a command queue prod
write, which means it can handle up to 4096 at a time.

Then, the host command queue needs to be pinned in a shared state, so
it can't be donated to VMs, and avoid tricking the hypervisor into
accessing them. This is done each time the command queue is enabled,
and undone each time the command queue is disabled.
The hypervisor won=E2=80=99t access the host command queue when it is disab=
led
from the host.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   |  20 ++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 108 +++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   8 ++
 3 files changed, 135 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iomm=
u/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 27ea39c0fb1f..86e6c68aad4e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -13,6 +13,8 @@
 #include "arm-smmu-v3.h"
 #include "pkvm/arm_smmu_v3.h"
=20
+#define SMMU_KVM_CMDQ_ORDER				4
+
 extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
=20
 static size_t				kvm_arm_smmu_count;
@@ -58,6 +60,7 @@ static int kvm_arm_smmu_array_alloc(void)
 	/* Basic device tree parsing. */
 	for_each_compatible_node(np, NULL, "arm,smmu-v3") {
 		struct resource res;
+		void *cmdq_base;
=20
 		ret =3D of_address_to_resource(np, 0, &res);
 		if (ret)
@@ -74,6 +77,23 @@ static int kvm_arm_smmu_array_alloc(void)
 		if (of_dma_is_coherent(np))
 			kvm_arm_smmu_array[i].features |=3D ARM_SMMU_FEAT_COHERENCY;
=20
+		/*
+		 * Allocate shadow for the command queue, it doesn't have to be the same
+		 * size as the host.
+		 * Only populate base_dma and llq.max_n_shift, the hypervisor will init
+		 * the rest.
+		 * We don't what size the host will choose at this point, the shadow cop=
y
+		 * will 64K which is a reasonable size.
+		 */
+		cmdq_base =3D (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, SMMU_KVM=
_CMDQ_ORDER);
+		if (!cmdq_base) {
+			ret =3D -ENOMEM;
+			goto out_err;
+		}
+
+		kvm_arm_smmu_array[i].cmdq.base_dma =3D virt_to_phys(cmdq_base);
+		kvm_arm_smmu_array[i].cmdq.llq.max_n_shift =3D SMMU_KVM_CMDQ_ORDER + PAG=
E_SHIFT -
+							     CMDQ_ENT_SZ_SHIFT;
 		i++;
 	}
=20
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 32f199aeec9e..d3ab4b814be4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -11,7 +11,6 @@
 #include <nvhe/trap_handler.h>
=20
 #include "arm_smmu_v3.h"
-#include "../arm-smmu-v3.h"
=20
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
@@ -34,6 +33,35 @@ static void smmu_reclaim_pages(u64 phys, size_t size)
 	WARN_ON(__pkvm_hyp_donate_host(phys >> PAGE_SHIFT, size >> PAGE_SHIFT));
 }
=20
+/*
+ * CMDQ, STE host copies are accessed by the hypervisor, we share them to
+ * - Prevent the host from passing protected VM memory.
+ * - Having them mapped in the hyp page table.
+ */
+static int smmu_share_pages(phys_addr_t addr, size_t size)
+{
+	int i;
+	size_t nr_pages =3D PAGE_ALIGN(size) >> PAGE_SHIFT;
+
+	for (i =3D 0 ; i < nr_pages ; ++i)
+		WARN_ON(__pkvm_host_share_hyp((addr + i * PAGE_SIZE) >> PAGE_SHIFT));
+
+	return hyp_pin_shared_mem(hyp_phys_to_virt(addr), hyp_phys_to_virt(addr +=
 size));
+}
+
+static int smmu_unshare_pages(phys_addr_t addr, size_t size)
+{
+	int i;
+	size_t nr_pages =3D PAGE_ALIGN(size) >> PAGE_SHIFT;
+
+	hyp_unpin_shared_mem(hyp_phys_to_virt(addr), hyp_phys_to_virt(addr + size=
));
+
+	for (i =3D 0 ; i < nr_pages ; ++i)
+		WARN_ON(__pkvm_host_unshare_hyp((addr + i * PAGE_SIZE) >> PAGE_SHIFT));
+
+	return 0;
+}
+
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
@@ -94,6 +122,41 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *sm=
mu)
 	return 0;
 }
=20
+/*
+ * The kernel part of the driver will allocate the shadow cmdq,
+ * which is different from the one used by the driver.
+ * This function only donates it.
+ */
+static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
+{
+	size_t cmdq_size;
+	int ret;
+	enum kvm_pgtable_prot prot =3D PAGE_HYP;
+
+	cmdq_size =3D (1 << (smmu->cmdq.llq.max_n_shift)) *
+		     CMDQ_ENT_DWORDS * 8;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		prot |=3D KVM_PGTABLE_PROT_NORMAL_NC;
+
+	ret =3D ___pkvm_host_donate_hyp(smmu->cmdq.base_dma >> PAGE_SHIFT,
+				      PAGE_ALIGN(cmdq_size) >> PAGE_SHIFT, prot);
+	if (ret)
+		return ret;
+
+	smmu->cmdq.base =3D hyp_phys_to_virt(smmu->cmdq.base_dma);
+	smmu->cmdq.prod_reg =3D smmu->base + ARM_SMMU_CMDQ_PROD;
+	smmu->cmdq.cons_reg =3D smmu->base + ARM_SMMU_CMDQ_CONS;
+	smmu->cmdq.q_base =3D smmu->cmdq.base_dma |
+			    FIELD_PREP(Q_BASE_LOG2SIZE, smmu->cmdq.llq.max_n_shift);
+	smmu->cmdq.ent_dwords =3D CMDQ_ENT_DWORDS;
+	memset(smmu->cmdq.base, 0, cmdq_size);
+	writel_relaxed(0, smmu->cmdq.prod_reg);
+	writel_relaxed(0, smmu->cmdq.cons_reg);
+	writeq_relaxed(smmu->cmdq.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int i, ret;
@@ -116,7 +179,13 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_dev=
ice *smmu)
 	ret =3D smmu_probe(smmu);
 	if (ret)
 		goto out_ret;
+
+	ret =3D smmu_init_cmdq(smmu);
+	if (ret)
+		goto out_ret;
+
 	return 0;
+
 out_ret:
 	smmu_deinit_device(smmu);
 	return ret;
@@ -153,6 +222,27 @@ static int smmu_init(void)
 	return ret;
 }
=20
+static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
+}
+
+static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	size_t cmdq_size;
+
+	smmu->cmdq_host.llq.max_n_shift =3D smmu->cmdq_host.q_base & Q_BASE_LOG2S=
IZE;
+	cmdq_size =3D (1 << smmu->cmdq_host.llq.max_n_shift) * CMDQ_ENT_DWORDS * =
8;
+	WARN_ON(smmu_share_pages(smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK, cmdq_=
size));
+}
+
+static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	size_t cmdq_size =3D cmdq_size =3D (1 << smmu->cmdq_host.llq.max_n_shift)=
 * CMDQ_ENT_DWORDS * 8;
+
+	WARN_ON(smmu_unshare_pages(smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK, cmd=
q_size));
+}
+
 static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			     struct user_pt_regs *regs,
 			     u64 esr, u32 off)
@@ -174,6 +264,13 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_de=
vice *smmu,
 		break;
 	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_CMDQ_BASE:
+
+		/* Not allowed by the architecture */
+		WARN_ON(is_cmdq_enabled(smmu));
+		if (is_write)
+			smmu->cmdq_host.q_base =3D val;
+		mask =3D read_write;
+		break;
 	case ARM_SMMU_CMDQ_PROD:
 	case ARM_SMMU_CMDQ_CONS:
 	case ARM_SMMU_STRTAB_BASE:
@@ -182,6 +279,15 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_de=
vice *smmu,
 		mask =3D read_write;
 		break;
 	case ARM_SMMU_CR0:
+		if (is_write) {
+			bool last_cmdq_en =3D is_cmdq_enabled(smmu);
+
+			smmu->cr0 =3D val;
+			if (!last_cmdq_en && is_cmdq_enabled(smmu))
+				smmu_emulate_cmdq_enable(smmu);
+			else if (last_cmdq_en && !is_cmdq_enabled(smmu))
+				smmu_emulate_cmdq_disable(smmu);
+		}
 		mask =3D read_write;
 		WARN_ON(len !=3D sizeof(u32));
 		break;
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index dfeaed728982..330da53f80d0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -8,6 +8,8 @@
 #include <nvhe/spinlock.h>
 #endif
=20
+#include "../arm-smmu-v3.h"
+
 /*
  * Parameters from the trusted host:
  * @mmio_addr		base address of the SMMU registers
@@ -21,6 +23,9 @@
  * @pgsize_bitmap	Supported page sizes
  * @sid_bits		Max number of SID bits supported
  * @lock		Lock to protect SMMU
+ * @cmdq		CMDQ as observed by HW
+ * @cmdq_host		Host view of the command queue
+ * @cr0			Last value of CR0
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -36,6 +41,9 @@ struct hyp_arm_smmu_v3_device {
 #else
 	u32			lock;
 #endif
+	struct arm_smmu_queue	cmdq;
+	struct arm_smmu_queue	cmdq_host;
+	u32			cr0;
 };
=20
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
--=20
2.51.0.rc1.167.g924127e9c0-goog


