Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D38CEBF8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaEfzU6yZVtxcuFF1g0xre8mMX/xz4F/cTBqkb/2nDs=; b=gMBEJpOpiA99SBGuF5+ProZHyB
	J3kTtIUk5qm9abLrLynpfPcuFZizm1QnOsZu6jWYreIkC3LFGgwkJI7+p9ARCPNSRrR+68yyebkgy
	HUxgQxQbolWw6BfifwCYBEnKDbZM0Ychsg6R/ODemuD0mPRsLzgPN+P0/5WLbtCL9ukeiMaZnD9E8
	R91SqQE9BvZ16gX3CJajCxtQMesMNVWSfVOcUH9om9/7c0rzqUhDazhldyjeRIY7G9tJomjQFe1cq
	Q0s3idzXJt4odCbMfdl8vstCQmA9tiaDjj/uiT6qAYTApVPu4dad5qlh4LwX9CjGA4HFiGvEFK+nz
	/cbpYNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Hf-0000000Gdxh-0qII;
	Mon, 17 Nov 2025 18:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HR-0000000Gdei-3Dgl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KaEfzU6yZVtxcuFF1g0xre8mMX/xz4F/cTBqkb/2nDs=; b=LPeh/VbE3GGCldyCtblpUQT9Mg
	YeSZLop0/9VxXWkC/26X6DXxMkTvdZz1dp7WCPXsoVtXZUm3R/ecQZvNIBMymNCHEo1uprVYtDJjV
	ffpGx3kFAOgWUPkNH+1bksb+rOkIt+LJdch8M+cWqBu+ZP4sJ1S8uhRgNsNjV66O4SBTWrSJAJrop
	fBaiWqFcVN41X8rmtl4gRYpuqyI2g3HfHizOtwV2P5ILfkbmDtlv2PFtQaueppaZo3QY5DbILRwkN
	hwGgJiIcIwVg4QFTY+LsbXai8vLulbiW8bjOEuVHkGWGc5UAHACHqMzRKHKSlF+T9b3e/K3b67HAE
	0KYzuXCA==;
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pl-00000007wd0-1K1I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:22 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-64095d94c2cso6727390a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405325; x=1764010125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaEfzU6yZVtxcuFF1g0xre8mMX/xz4F/cTBqkb/2nDs=;
        b=kFw2jyEoyzOh54od589IT7EgHq5Qju1q9JJWlYHiQ9BIbqfGOS5Jeg2FB20b4cK7xm
         FBuhzelzhoLZ+NTu9cPl+3L3+7zb/SRHYnj9pZx0352bL/c1ncrHSS4wRjWWs877kCPW
         N8LYZfzJjqs+qXHGdQxAaRdw3e/YhdEFew1DKsC5z3P+Gm+SpJYhGZ+LShVdINmOyf//
         kjeFchgCeaJJ25dnIrxhKyZcuxsX8T78spzVpZNJvbuHu2nBlMWT/gRshj7dKK3K0y/W
         rEkPi2uJ2AoJnyKTaePuACa/dVqJGbr0/nuvSGY9AYfLcOMCcJP4FWYIrSPcQu1YMYsi
         WSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405325; x=1764010125;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KaEfzU6yZVtxcuFF1g0xre8mMX/xz4F/cTBqkb/2nDs=;
        b=kwxV9w3YJ+Dd128oqf1LWs/OqnjATFCAaZ6RwDMu3K+aJVn6RlOXG/CgyVUSbxifyy
         hPzchMl9EjVIXGfw7HqkxxU1Ei+TM5yPiBmep2XjVXNsgG8epZo9A82lmSuouts2NQ44
         vJ3b2qmFYDS8FlWx/oQDXTp0MGELMOtSiAylGis7y2hTmJKLfPnwmsfG6LiTCgzeJC3Z
         eWaQObsUjEsuFbkBmFI4UFcoSJR2ubzd2CTW6p6Aqhg+amfi1biLN13ePjrZ/yvCs8Hd
         TM+SFKYcTTUY7V6KmRm1DhH5sDp/t2Ja18sphnnUHNGrxuCA1bvISW+unXsYS6dfLEYm
         jIyA==
X-Gm-Message-State: AOJu0YxukQf9TJmjNW41Sx/awizS4HjxntrwGUQ66+tDqBStvnituQ+P
	/3oqW87wH/Y+ek2ctWw1sxKy5QItMqZw/0Ui/dGHh3wtUospmjFwU8OjdCCnFqembYYRqdHRLe8
	z57YimrcFfp+8zymq9z6VL2DobxGUuo2Svbuxw+VHpqU+F9A/amFMZQoxk0i9C14OBPyTBdeZGd
	wo+B3ViTwliXh0WZrpFZX4Ig+KqWTCNYpYPbReStp/Qq7AjHnEtq3kih2KwMGPs7DeOA==
X-Google-Smtp-Source: AGHT+IGYWSQvx/vSf5yAHHEgbkBONoL9bq/wnyu6GlN5XLTrHCKyyCf6BcTG/d+4znbhK0TqerfxI9YTZPVTXA==
X-Received: from edh26.prod.google.com ([2002:a05:6402:505a:b0:641:8ac2:5031])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3489:b0:641:9e1c:ba89 with SMTP id 4fb4d7f45d1cf-64350dee91dmr12404365a12.7.1763405324917;
 Mon, 17 Nov 2025 10:48:44 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:06 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-20-smostafa@google.com>
Subject: [PATCH v5 19/27] iommu/arm-smmu-v3-kvm: Shadow the command queue
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_175321_408359_F8808689 
X-CRM114-Status: GOOD (  27.95  )
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
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   |  16 +++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 103 +++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   8 ++
 3 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iomm=
u/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 1d72951b7b53..87376f615798 100644
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
@@ -71,6 +73,7 @@ static struct platform_driver smmuv3_nesting_driver;
 static int smmuv3_nesting_probe(struct platform_device *pdev)
 {
 	struct resource *res;
+	void *cmdq_base;
 	struct hyp_arm_smmu_v3_device *smmu =3D &kvm_arm_smmu_array[kvm_arm_smmu_=
cur];
=20
 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -84,6 +87,19 @@ static int smmuv3_nesting_probe(struct platform_device *=
pdev)
 	if (of_dma_is_coherent(pdev->dev.of_node))
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
index f0dae94daf89..bcb3f99fdcd2 100644
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
@@ -21,6 +20,13 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus=
;
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
 /* Transfer ownership of memory */
 static int smmu_take_pages(u64 phys, size_t size)
 {
@@ -34,6 +40,35 @@ static void smmu_reclaim_pages(u64 phys, size_t size)
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
@@ -94,6 +129,36 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *sm=
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
+	enum kvm_pgtable_prot prot =3D PAGE_HYP;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		prot |=3D KVM_PGTABLE_PROT_NORMAL_NC;
+
+	ret =3D ___pkvm_host_donate_hyp(smmu->cmdq.base_dma >> PAGE_SHIFT,
+				      cmdq_nr_pages, prot);
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
 	int i, ret;
@@ -117,7 +182,13 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_dev=
ice *smmu)
 	if (ret)
 		goto out_ret;
 	hyp_spin_lock_init(&smmu->lock);
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
@@ -154,6 +225,20 @@ static int smmu_init(void)
 	return ret;
 }
=20
+static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	smmu->cmdq_host.llq.max_n_shift =3D smmu->cmdq_host.q_base & Q_BASE_LOG2S=
IZE;
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
@@ -175,6 +260,13 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_de=
vice *smmu,
 		break;
 	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_CMDQ_BASE:
+		if (is_write) {
+			/* Not allowed by the architecture */
+			WARN_ON(is_cmdq_enabled(smmu));
+			smmu->cmdq_host.q_base =3D val;
+		}
+		mask =3D read_write;
+		break;
 	case ARM_SMMU_CMDQ_PROD:
 	case ARM_SMMU_CMDQ_CONS:
 	case ARM_SMMU_STRTAB_BASE:
@@ -183,6 +275,15 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_de=
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
index dfeaed728982..2fb4c0cab47c 100644
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
+ * @cmdq_host		Host view of the CMDQ, only q_base and llq used.
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
2.52.0.rc1.455.g30608eb744-goog


