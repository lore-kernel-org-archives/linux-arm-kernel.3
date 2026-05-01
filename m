Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECF2CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHDjZzOY7Hx/XA6TloE0Km6NFJhjbYET1ob/3IzkCuE=; b=XmJwxw/lYc3Z8y8elKycEByZEZ
	kVl/MoRzgAquJwdzWm9XYMQabih72EEO2aIVjVbEw5B518jLjAWtpno48HajC3oKXeEzPKP40JZ5b
	grYa4tE2k/1L8aXTcQC+gblyPsu7DILR4OF2tr680ucf7GbHv3J5w/sb5x3HSLPsO4h5hJQawhKCN
	QKHgkiSW9fIJXeRRrwolLXPcFjkEi8OnEqMInbz9Vf+9CCI8V5EV8qYzqnkF02xVNiAmIoi9pwREa
	G0cF6DKc4anWIWma7MyLo6/1Gy/w7FreNHBeSkFvRUHqw2+KniP0sHlWeNEJYv/ziRAuWye6Hr8f4
	Dp9sO84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv1-00000006d7N-30FV;
	Fri, 01 May 2026 11:20:27 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlux-00000006cxI-1MLu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:25 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-4411a1f9601so1370782f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634421; x=1778239221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHDjZzOY7Hx/XA6TloE0Km6NFJhjbYET1ob/3IzkCuE=;
        b=j4bKNcfuOC73mhnrEFuGtz7yCWbBipliIw1HSgUulW53+DwU6NnFRXmG3psj2qEuVw
         vS99CZq4oz42vogcoRtOjaUlEDCrPCgZyWXLwWwrb6i+oY9m+WEoARicJTc5MH8FYsdv
         gfipQzy7mYVKbWXAfZ8usLN76IY5BnerofHPEguXtmKsoStv0ffYwNFXpEN2sHU39kpr
         qhFYFAOwpUQBsq5l0R03oo/W93E2meS6EhjoOj4PThTN7Ak+VN+0Wqc73zJPsFGW+E/s
         oGL19ip4KgPOq3ijPmmBFWhyJE+o8VmVXzGUFL41w+fI+Z/ISBNK9uEOOYvW9wlrpYkV
         ubhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634421; x=1778239221;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aHDjZzOY7Hx/XA6TloE0Km6NFJhjbYET1ob/3IzkCuE=;
        b=LWPBwxZ7KsBQ65dnF8c6mHalmYx/XeJt6OWfj0SlhkwO+sJJR7DQC0YF31TPDpsSsu
         yVEWMSO0+Mvfnk7VsGrydrA/kzStSNq3h3/mrtjkvIK7PmKLYpeohbyZ7KwfuSTt+BNH
         gFXLlsDUR6k5fljJZt33veS1odmthnZKbCGS/TOv6ZbmORPyWic3ks3thEKYf39nD6cb
         5B7MHaEkLmSXOQS//q1/hKT/sDzojiDW2zROIJE0zFhGc+OxeIE2vsfvxTGis5/HfcPB
         91Yjzh/TmtwfMLe47fNRIYfo8xYqQ/9fiKI344cQZs9u5UFYW34mmTH4OjCYJpZPo7Dy
         QWjg==
X-Gm-Message-State: AOJu0YyDVItHalJyagTp0FuJFvx7bCaW89NLhfcL5Mmvhe+tKdNUnCNv
	FgMzKcQJtcWGnAtRKKwGzZ5aq6XOPtXKjTDRsrJ/yT3qQo1KiS6nDmF0fLlLgzL0pFzLU4DpTBM
	sbh+ZidjpKTP0vhAnOMH/RASmAGeaOnnRmN51hEr1Xd2yhGkvOuQ8zNv3pFvkhdG4uMsUhTRaGu
	aD1HdjmAQ1mUHrT5K+jzKNusCaxN6BHwCLcJBVA5okWuoGqeIVIqXBnT5qWbps5v5T0A==
X-Received: from wrxl7.prod.google.com ([2002:a05:6000:12c7:b0:43b:4453:39d8])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2212:b0:43d:3004:5fef with SMTP id ffacd0b85a97d-4493d7fa8ccmr10517288f8f.7.1777634420432;
 Fri, 01 May 2026 04:20:20 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:17 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-16-smostafa@google.com>
Subject: [PATCH v6 15/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042023_459642_742C1F5B 
X-CRM114-Status: GOOD (  28.18  )
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
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   |  25 ++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 122 +++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   8 ++
 3 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iomm=
u/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 9765d3d636d7..fccbc34de087 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -15,6 +15,8 @@
 #include "arm-smmu-v3.h"
 #include "pkvm/arm_smmu_v3.h"
=20
+#define SMMU_KVM_CMDQ_ORDER				4
+
 extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
=20
 static size_t				kvm_arm_smmu_count;
@@ -24,6 +26,15 @@ static size_t				kvm_arm_smmu_cur;
 static void kvm_arm_smmu_array_free(void)
 {
 	int order;
+	int i;
+
+	for (i =3D 0 ; i < kvm_arm_smmu_cur ; ++i) {
+		struct hyp_arm_smmu_v3_device *smmu =3D &kvm_arm_smmu_array[i];
+
+		if (smmu->cmdq.base_dma)
+			free_pages((unsigned long)phys_to_virt(smmu->cmdq.base_dma),
+				   SMMU_KVM_CMDQ_ORDER);
+	}
=20
 	order =3D get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
 	free_pages((unsigned long)kvm_arm_smmu_array, order);
@@ -70,6 +81,7 @@ static int smmuv3_nesting_probe(struct platform_device *p=
dev)
 	struct hyp_arm_smmu_v3_device *smmu =3D &kvm_arm_smmu_array[kvm_arm_smmu_=
cur];
 	struct device *dev =3D &pdev->dev;
 	struct resource *res;
+	void *cmdq_base;
=20
 	/* Only device tree, ACPI not supported. */
 	if (!dev->of_node)
@@ -95,6 +107,19 @@ static int smmuv3_nesting_probe(struct platform_device =
*pdev)
 	if (of_dma_is_coherent(dev->of_node))
 		smmu->features |=3D ARM_SMMU_FEAT_COHERENCY;
=20
+	/*
+	 * Allocate the shadow command queue, it doesn't have to be the same
+	 * size as the host.
+	 * Only populate base_dma and llq.max_n_shift, the hypervisor will init
+	 * the rest.
+	 */
+	cmdq_base =3D (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, SMMU_KVM_=
CMDQ_ORDER);
+	if (!cmdq_base)
+		return -ENOMEM;
+
+	smmu->cmdq.base_dma =3D virt_to_phys(cmdq_base);
+	smmu->cmdq.llq.max_n_shift =3D SMMU_KVM_CMDQ_ORDER + PAGE_SHIFT - CMDQ_EN=
T_SZ_SHIFT;
+
 	kvm_arm_smmu_cur++;
 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index cce5a51b4656..3b77796dafc7 100644
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
@@ -21,10 +20,68 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmu=
s;
 	     (smmu) !=3D &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
 	     (smmu)++)
=20
+#define cmdq_size(cmdq)	((1 << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORD=
S * 8)
+
+static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
+}
+
+/*
+ * CMDQ, STE host copies are accessed by the hypervisor, we share them to
+ * - Prevent the host from passing protected VM memory.
+ * - Having them mapped in the hyp page table.
+ */
+static int smmu_share_pages(phys_addr_t addr, size_t size)
+{
+	size_t nr_pages =3D PAGE_ALIGN(size + (addr & ~PAGE_MASK)) >> PAGE_SHIFT;
+	phys_addr_t base =3D addr & PAGE_MASK;
+	int i, ret;
+
+	for (i =3D 0 ; i < nr_pages ; ++i) {
+		if (__pkvm_host_share_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT)) {
+			while (i--)
+				__pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
+			return -EPERM;
+		}
+	}
+
+	ret =3D hyp_pin_shared_mem(hyp_phys_to_virt(base),
+				 hyp_phys_to_virt(base + nr_pages * PAGE_SIZE));
+	if (ret) {
+		for (i =3D 0 ; i < nr_pages ; ++i)
+			__pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
+	}
+
+	return ret;
+}
+
+static int smmu_unshare_pages(phys_addr_t addr, size_t size)
+{
+	size_t nr_pages =3D PAGE_ALIGN(size + (addr & ~PAGE_MASK)) >> PAGE_SHIFT;
+	phys_addr_t base =3D addr & PAGE_MASK;
+	int i, ret;
+
+	hyp_unpin_shared_mem(hyp_phys_to_virt(base),
+			     hyp_phys_to_virt(base + nr_pages * PAGE_SIZE));
+
+	for (i =3D 0 ; i < nr_pages ; ++i) {
+		ret =3D __pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	WARN_ON(__pkvm_hyp_donate_host_mmio(smmu->mmio_addr, smmu->mmio_size));
+
+	if (smmu->cmdq.base)
+		WARN_ON(__pkvm_hyp_donate_host(smmu->cmdq.base_dma >> PAGE_SHIFT,
+					       cmdq_size(&smmu->cmdq) >> PAGE_SHIFT));
 	smmu->base =3D NULL;
 }
=20
@@ -99,6 +156,31 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *sm=
mu)
 	return 0;
 }
=20
+/*
+ * The kernel part of the driver will allocate the shadow cmdq,
+ * and zero it. This function only donates it.
+ */
+static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
+{
+	size_t cmdq_nr_pages =3D cmdq_size(&smmu->cmdq) >> PAGE_SHIFT;
+	int ret;
+
+	ret =3D __pkvm_host_donate_hyp(smmu->cmdq.base_dma >> PAGE_SHIFT, cmdq_nr=
_pages);
+	if (ret)
+		return ret;
+
+	smmu->cmdq.base =3D hyp_phys_to_virt(smmu->cmdq.base_dma);
+	smmu->cmdq.prod_reg =3D smmu->base + ARM_SMMU_CMDQ_PROD;
+	smmu->cmdq.cons_reg =3D smmu->base + ARM_SMMU_CMDQ_CONS;
+	smmu->cmdq.q_base =3D smmu->cmdq.base_dma |
+			    FIELD_PREP(Q_BASE_LOG2SIZE, smmu->cmdq.llq.max_n_shift);
+	smmu->cmdq.ent_dwords =3D CMDQ_ENT_DWORDS;
+	writel_relaxed(0, smmu->cmdq.prod_reg);
+	writel_relaxed(0, smmu->cmdq.cons_reg);
+	writeq_relaxed(smmu->cmdq.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	unsigned long haddr;
@@ -117,7 +199,12 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_dev=
ice *smmu)
 	if (ret)
 		goto out_ret;
=20
+	ret =3D smmu_init_cmdq(smmu);
+	if (ret)
+		goto out_ret;
+
 	return 0;
+
 out_ret:
 	smmu_deinit_device(smmu);
 	return ret;
@@ -157,6 +244,22 @@ static int smmu_init(void)
 	return ret;
 }
=20
+static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 shift =3D smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
+
+	smmu->cmdq_host.llq.max_n_shift =3D min(shift, 19);
+	smmu->cmdq_host.base_dma =3D smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK;
+	WARN_ON(smmu_share_pages(smmu->cmdq_host.base_dma,
+				 cmdq_size(&smmu->cmdq_host)));
+}
+
+static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	WARN_ON(smmu_unshare_pages(smmu->cmdq_host.base_dma,
+				   cmdq_size(&smmu->cmdq_host)));
+}
+
 static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			     struct user_pt_regs *regs,
 			     u64 esr, u32 off)
@@ -180,6 +283,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_de=
vice *smmu,
 		break;
 	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_CMDQ_BASE:
+		if (is_write) {
+			/* Not allowed by the architecture */
+			if (WARN_ON(is_cmdq_enabled(smmu)))
+				break;
+			smmu->cmdq_host.q_base =3D val;
+		}
+		mask =3D read_write;
+		break;
 	case ARM_SMMU_CMDQ_PROD:
 	case ARM_SMMU_CMDQ_CONS:
 	case ARM_SMMU_STRTAB_BASE:
@@ -190,6 +301,15 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_de=
vice *smmu,
 	case ARM_SMMU_CR0:
 		if (len !=3D sizeof(u32))
 			break;
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
 		break;
 	case ARM_SMMU_CR1: {
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 263b0fef262d..cc1ad4c19845 100644
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
@@ -20,6 +22,9 @@
  * @pgsize_bitmap	Supported page sizes
  * @sid_bits		Max number of SID bits supported
  * @lock		Lock to protect SMMU
+ * @cmdq		CMDQ as observed by HW
+ * @cmdq_host		Host view of the CMDQ, only q_base and llq used.
+ * @cr0			Last value of CR0
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -34,6 +39,9 @@ struct hyp_arm_smmu_v3_device {
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
2.54.0.545.g6539524ca2-goog


