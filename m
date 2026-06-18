Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBDACD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yc6uliVWqW1OjdP16y1S23yC/xStyuBX2ncIz9WHYs=; b=vdpaKqUtuimgGP2Q/oPVafUqhk
	QRfQSLnXjG57DOyvnxyPUFrEHeUPzuCXc7CKWJHtgAsflfYQdaj38vZgW+YEQsLW0XmSdNljlxkBw
	FQdtN9A14JIKFYbAX2pHDxUruMS5E1E6XgpSOqaokhZtS2SXhUpTsZapagT940227a3AOmflP/LAp
	Ee9cL2xp80nKri7TEAHbU/kHhQqFEwxCjhWFqu7jwyTe0U7A2eqngIcsp7jUf74X0T0eMqzN2HnvG
	+s5OCQCfWHa327xmbs+87KOY5BpnWImgYTNOxlve9gmPxALw5FBHbM5ttdmVhb430kZleo8Lx36Rf
	JxuCgToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0w-00000001W6f-1Phm;
	Thu, 18 Jun 2026 15:50:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0t-00000001W3x-1qBn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:50:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54DF248FF;
	Thu, 18 Jun 2026 08:50:37 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A2B13F62B;
	Thu, 18 Jun 2026 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781797842; bh=BZrnvb+e+D1AKBEDPNGOe+Da6qi61H0n0AapNH7rhm4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k4EQQ6A8WE/LEhNIkEyZFR/xPgQZ3aoFj51a7RAKI0846zddLKpsoIROxDqaT2n9n
	 osDGxaerAFsQ1tv4x4jkGAj3SCFCidKYl5GJiisPUWLlcEvMphqLVUhHcsxB1tq3KC
	 F54tOlauieebzc0Sd3qBvSOgd8w8JZH/6sOTfY4o=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oupton@kernel.org,
	jean-philippe.brucker@arm.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool v2 4/7] arm64: Initialise the PMU after the GIC
Date: Thu, 18 Jun 2026 16:49:58 +0100
Message-ID: <20260618155001.226266-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618155001.226266-1-alexandru.elisei@arm.com>
References: <20260618155001.226266-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_085043_552877_2BC0D50D 
X-CRM114-Status: GOOD (  17.32  )
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

PMU initialisation is done in:

setup_fdt()
  vcpu->generate_fdt_nodes()
    pmu__generate_fdt_nodes()

The PMU ioctl KVM_ARM_VCPU_PMU_V3_INIT requires that the GIC has been
initialised, which is done in gic__init_gic().

gic__init_gic() and setup_fdt() are part of the same initialisation list.
The relative order on the list depends on the order of compilation: gic.c
is compiled after fdt.c and this places gic__init_gic() first on the
initialisation list.

If the compilation order changes and gic.c is compiled *before* fdt.c,
gic__init_gic() will be executed *after* setup_fdt() and PMU initialisation
will fail with an error message:

PMU KVM_SET_DEVICE_ATTR: No such device

This is fragile and hard to debug. Improve the situation by having
gic__init_gic() explicitely initialize the PMU.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm64/gic.c             |  9 ++++++++-
 arm64/include/asm/pmu.h |  3 +++
 arm64/pmu.c             | 28 ++++++++++++++++++----------
 3 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/arm64/gic.c b/arm64/gic.c
index b0be9e5766df..1e4009625595 100644
--- a/arm64/gic.c
+++ b/arm64/gic.c
@@ -9,6 +9,8 @@
 #include <linux/kvm.h>
 #include <linux/sizes.h>
 
+#include <asm/pmu.h>
+
 #define IRQCHIP_GIC 0
 
 #define GIC_MAINT_IRQ	9
@@ -355,7 +357,12 @@ static int gic__init_gic(struct kvm *kvm)
 
 	vgic_is_init = true;
 
-	return irq__setup_irqfd_lines(kvm);
+	ret = irq__setup_irqfd_lines(kvm);
+	if (ret)
+		return ret;
+
+	/* The PMU requires that the GIC has been initialized. */
+	return pmu__init(kvm);
 }
 late_init(gic__init_gic)
 
diff --git a/arm64/include/asm/pmu.h b/arm64/include/asm/pmu.h
index 38e3154b11b7..74566943f355 100644
--- a/arm64/include/asm/pmu.h
+++ b/arm64/include/asm/pmu.h
@@ -3,6 +3,9 @@
 
 #define KVM_ARM_PMUv3_PPI			23
 
+struct kvm;
+
 void pmu__generate_fdt_nodes(void *fdt, struct kvm *kvm);
+int pmu__init(struct kvm *kvm);
 
 #endif /* __ARM_PMU_H__ */
diff --git a/arm64/pmu.c b/arm64/pmu.c
index 5f31d6b6f346..92cacd62479e 100644
--- a/arm64/pmu.c
+++ b/arm64/pmu.c
@@ -193,21 +193,32 @@ static int find_pmu(struct kvm *kvm)
 void pmu__generate_fdt_nodes(void *fdt, struct kvm *kvm)
 {
 	const char compatible[] = "arm,armv8-pmuv3";
-	int irq = KVM_ARM_PMUv3_PPI;
-	struct kvm_cpu *vcpu;
-	int pmu_id = -ENXIO;
-	int i;
-
 	u32 cpu_mask = gic__get_fdt_irq_cpumask(kvm);
 	u32 irq_prop[] = {
 		cpu_to_fdt32(GIC_FDT_IRQ_TYPE_PPI),
-		cpu_to_fdt32(irq - 16),
+		cpu_to_fdt32(KVM_ARM_PMUv3_PPI - 16),
 		cpu_to_fdt32(cpu_mask | IRQ_TYPE_LEVEL_HIGH),
 	};
 
 	if (!kvm->cfg.arch.has_pmuv3)
 		return;
 
+	_FDT(fdt_begin_node(fdt, "pmu"));
+	_FDT(fdt_property(fdt, "compatible", compatible, sizeof(compatible)));
+	_FDT(fdt_property(fdt, "interrupts", irq_prop, sizeof(irq_prop)));
+	_FDT(fdt_end_node(fdt));
+}
+
+int pmu__init(struct kvm *kvm)
+{
+	int irq = KVM_ARM_PMUv3_PPI;
+	struct kvm_cpu *vcpu;
+	int pmu_id = -ENXIO;
+	int i;
+
+	if (!kvm->cfg.arch.has_pmuv3)
+		return 0;
+
 	if (pmu_has_attr(kvm->cpus[0], KVM_ARM_VCPU_PMU_V3_SET_PMU)) {
 		pmu_id = find_pmu(kvm);
 		if (pmu_id < 0) {
@@ -228,8 +239,5 @@ void pmu__generate_fdt_nodes(void *fdt, struct kvm *kvm)
 		set_pmu_attr(vcpu, NULL, KVM_ARM_VCPU_PMU_V3_INIT);
 	}
 
-	_FDT(fdt_begin_node(fdt, "pmu"));
-	_FDT(fdt_property(fdt, "compatible", compatible, sizeof(compatible)));
-	_FDT(fdt_property(fdt, "interrupts", irq_prop, sizeof(irq_prop)));
-	_FDT(fdt_end_node(fdt));
+	return 0;
 }
-- 
2.54.0


