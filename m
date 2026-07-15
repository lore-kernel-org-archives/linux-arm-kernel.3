Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C786C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVGMaYEcniIvMPOgxM8+baJR4b4kWmoCjAgYLXKet98=; b=vJMgCJur5tdq6H19/U5xlIg+R4
	Vm6Um8iK2XEIntWwNC8KJJewV6ucVCPsRz1w2VbsBRu9JqBIfFvvAXGt0zQz/2cNfos0LtR5cIhGM
	M3PvN/Yzrz/npe2qzL90NIgAyLD5mb7+MHuzPm6vndQtUOmnV+109JfiIMoaCi3Yd1ERvi67+JJPw
	gKBoy/3TP0FRzKUR9L3ENRIXL7SioDtMaJ5O8WnvpWKnFEGeiCBfDsEMcdRqNMeQAMOXJE4DHT2ha
	zgo2aN0MJp+4TI3mU4pXYJjSdD9VbwrZhH/GLlL66CItPJMrnRdqOZOmVDcbX4SN7w3h1WIT4f/51
	yiz87+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHX-0000000Efow-0iuJ;
	Wed, 15 Jul 2026 12:00:07 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGz-0000000EfCG-48tW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:35 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493bb6a4336so48003735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116771; x=1784721571; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pVGMaYEcniIvMPOgxM8+baJR4b4kWmoCjAgYLXKet98=;
        b=Kw0z0JOvjWjOTkXCW1VVxpTphURzuUzpvTX8aIN8+yrIowsZlGFRJQdIfMEDAPi0xF
         /E9m8MdzNvYhsf6NhH1Sh1yBTH5ZDkEpCkEiCkKg5UX4WI0IuhhvCBOiD8nxJoo9nA3I
         EgidySNZz93ykajNfKnjg0S6PCbM78xq9Y9h9WBEuVkfMRmAwy9WVOaifMdkj8hRKIFZ
         bT9Pn48mm/IpQCxCMWwFlAGi1vtdWoDtcXIByfIXIDlteqQKthRHdnLd4JCPRc5yF7Go
         JveYzCPgXkzNywnnst31AXgThOsMtM7ECYMpCGj8cClnnpOHvtIq94taAsss82QRNb0+
         0OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116771; x=1784721571;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVGMaYEcniIvMPOgxM8+baJR4b4kWmoCjAgYLXKet98=;
        b=jtV3rGiPk7TzOpGdsmWSncqvKlq6Ly9MkFyCDjSdl3Oje0tdY3EeflNlKKfS7uvd9P
         KjNjq2Ww1suwGv1Ro7m9SjRN1NDf2qekd5HiTg+wPzJUFJ9lWF5Te6NA2unquqiIKuIw
         rcCpAXbJMVtb/32L0kspVtYi1ENTzfaLPvGPn/ydry/SWxNxOhqAgiEzmw9wwsWlddgO
         QJIVRPD7h6tHgBmuBKX6c17/CpnGc295jo9NjhixMDAjuj76qgVmMiBRxdewxSmcO3At
         Tlz16alORl+FtQ0TiOz8pmJ4avA15WQWtctU7junHENPMUl5KNWOpZLxBgM4cAS8v56U
         MIqg==
X-Gm-Message-State: AOJu0Yy2ocU0dkTD53KrReNSczI8QFamWmPgRfo8+hGDqEeXj9MSwQIW
	Zn854DHwSPrfiGIXryhDJEsixHPpLnDH9EI81YTYrP8M77laQtg8Zx4CWsUFREZFVX4rbFA2o3y
	8TVQV4OOEWXGiL1lL5jQle5KJ4fNdG1OWyNi6vO2fM2CnRfbK7kLH+5ZMo3ti2/p5qLwiTGMV8j
	FZzNYu7t6HzguZ0qp1MTzyPEpmR9tTiAoDJgM2X1oW0TR7dRkLDt6o/uM7uJoC7zGNxg==
X-Received: from wmnb8.prod.google.com ([2002:a05:600c:6c8:b0:493:d3c4:6a28])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e49:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-4953905c584mr69823465e9.0.1784116771104;
 Wed, 15 Jul 2026 04:59:31 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:55 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-15-smostafa@google.com>
Subject: [PATCH v7 14/24] iommu/arm-smmu-v3-kvm: Shadow the command queue
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045934_082398_B509A846 
X-CRM114-Status: GOOD (  28.67  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 123 +++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   8 ++
 3 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iomm=
u/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 68b78ed933d4..81a4cd539415 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -15,6 +15,8 @@
 #include "arm-smmu-v3.h"
 #include "pkvm/arm_smmu_v3.h"
=20
+#define SMMU_KVM_CMDQ_ORDER				4
+
 extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
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
@@ -92,6 +104,19 @@ static int smmuv3_nesting_probe(struct platform_device =
*pdev)
 		return -EINVAL;
 	}
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
 	if (of_dma_is_coherent(dev->of_node))
 		smmu->features |=3D ARM_SMMU_FEAT_COHERENCY;
=20
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index af06c832fc6f..9f76f4e82341 100644
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
@@ -75,6 +132,31 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *sm=
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
@@ -94,7 +176,12 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_devi=
ce *smmu)
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
@@ -134,6 +221,23 @@ static int smmu_init(void)
 	return ret;
 }
=20
+static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 shift =3D smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
+
+	smmu->cmdq_host.llq.max_n_shift =3D min(shift, 19);
+	smmu->cmdq_host.base_dma =3D smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK;
+	smmu->cmdq_host.base_dma &=3D ~(cmdq_size(&smmu->cmdq_host) - 1);
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
@@ -160,6 +264,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_de=
vice *smmu,
 		break;
 	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_CMDQ_BASE:
+		if (is_write) {
+			/* Not allowed by the architecture */
+			if (is_cmdq_enabled(smmu))
+				break;
+			smmu->cmdq_host.q_base =3D val;
+		}
+		mask =3D read_write;
+		break;
 	case ARM_SMMU_CMDQ_PROD:
 	case ARM_SMMU_CMDQ_CONS:
 	case ARM_SMMU_STRTAB_BASE:
@@ -170,6 +282,15 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_de=
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
index 2bda6e03c96c..74a7f62d93eb 100644
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
@@ -22,6 +24,9 @@
  * @lock		Lock to protect SMMU emulation
  * @hw_lock		Lock to protect SMMU HW (as CMDQ)
 			Order smmu.lock =3D> host_mmu.lock =3D> smmu.hw_lock
+ * @cmdq		CMDQ as observed by HW
+ * @cmdq_host		Host view of the CMDQ, only q_base and llq used.
+ * @cr0			Last value of CR0
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -38,6 +43,9 @@ struct hyp_arm_smmu_v3_device {
 	u32			lock;
 	u32			hw_lock;
 #endif
+	struct arm_smmu_queue	cmdq;
+	struct arm_smmu_queue	cmdq_host;
+	u32			cr0;
 };
=20
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
--=20
2.55.0.141.g00534a21ce-goog


