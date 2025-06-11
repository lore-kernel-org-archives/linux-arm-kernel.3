Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C2DC71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCtgI+HQIjjxzZlpJyYgRxUEHYBULt+elXGxXPs1il8=; b=NsbIM3QABhln8nZlR6lhFP4NP5
	hHIXuT1RaNg3zX3CDinI4eMUq+al79hg4gU3DhCkItPbke7JklxyQSK358Ej3yx47EFkwdpAPO5Or
	MwZZsIVHqoSx2Hc2yhU5e0EzkIVr7xDsG/oOzIcFmZRU1H/iVSmzt3cp/NeO6BiQWY8JkDMDRLcHl
	fwPEsna6mn8NbazVivl7GyvPLEBGUQR4Giczyw0/2bCPyZ3Q4Vtds3KjANyleRQLwRFzAY85pGqen
	YRvhVw+m5SzxSAXqATTQl4P05D2wOxyp3UWFM2aGt02qBOsifpuWlvO6xoarYVkqgAlJV6HjZDY8p
	A0fyZwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMos-0000000AGCg-1x6z;
	Wed, 11 Jun 2025 14:52:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ2q-00000009fYZ-1QoS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 10:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CCtgI+HQIjjxzZlpJyYgRxUEHYBULt+elXGxXPs1il8=; b=miZO9lSG4e9LZRYrcs18XwpKkY
	lgHegI+IKIc4CZSh3xDkEiJitfNr8Q+/xxdsRyWdhyzrY23TpIIwe62kGfsxbjYNLAb+NQkG8a8+p
	adbE2qgzilSpjeAwIm45pmZicRH4qQJHEfVGhuHeEJ8HALviJ8uXQJc11W44plgsv93Kra9jrxncS
	ciGwsYYPltpF8ZKVHQdcGiqnxbqITPWc17JMhb44vSkfLVGS3AANBlaw3+gURDFbO8hgzVX4Td/jt
	T3QVUERdAl7OoxPi4LM7BxoPl3hTsKgxlg2L1LFrzuo56YQR38oYIB41hvG+M/HJq1gnBqIFqCzdW
	FYWPbU1Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ2n-00000002IJx-2foe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:50:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70D9626BA;
	Wed, 11 Jun 2025 03:50:36 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.67.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D0BF3F673;
	Wed, 11 Jun 2025 03:50:52 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>
Subject: [PATCH v9 31/43] arm_pmu: Provide a mechanism for disabling the physical IRQ
Date: Wed, 11 Jun 2025 11:48:28 +0100
Message-ID: <20250611104844.245235-32-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611104844.245235-1-steven.price@arm.com>
References: <20250611104844.245235-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_115057_945318_60C18366 
X-CRM114-Status: GOOD (  12.73  )
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

Arm CCA assigns the physical PMU device to the guest running in realm
world, however the IRQs are routed via the host. To enter a realm guest
while a PMU IRQ is pending it is necessary to block the physical IRQ to
prevent an immediate exit. Provide a mechanism in the PMU driver for KVM
to control the physical IRQ.

Signed-off-by: Steven Price <steven.price@arm.com>
---
v3: Add a dummy function for the !CONFIG_ARM_PMU case.
---
 drivers/perf/arm_pmu.c       | 15 +++++++++++++++
 include/linux/perf/arm_pmu.h |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 2f33e69a8caf..ae1234001f79 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -733,6 +733,21 @@ static int arm_perf_teardown_cpu(unsigned int cpu, struct hlist_node *node)
 	return 0;
 }
 
+void arm_pmu_set_phys_irq(bool enable)
+{
+	int cpu = get_cpu();
+	struct arm_pmu *pmu = per_cpu(cpu_armpmu, cpu);
+	int irq;
+
+	irq = armpmu_get_cpu_irq(pmu, cpu);
+	if (irq && !enable)
+		per_cpu(cpu_irq_ops, cpu)->disable_pmuirq(irq);
+	else if (irq && enable)
+		per_cpu(cpu_irq_ops, cpu)->enable_pmuirq(irq);
+
+	put_cpu();
+}
+
 #ifdef CONFIG_CPU_PM
 static void cpu_pm_pmu_setup(struct arm_pmu *armpmu, unsigned long cmd)
 {
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 6dc5e0cd76ca..a209de38a01c 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -177,6 +177,7 @@ void kvm_host_pmu_init(struct arm_pmu *pmu);
 #endif
 
 bool arm_pmu_irq_is_nmi(void);
+void arm_pmu_set_phys_irq(bool enable);
 
 /* Internal functions only for core arm_pmu code */
 struct arm_pmu *armpmu_alloc(void);
@@ -187,6 +188,10 @@ void armpmu_free_irq(int irq, int cpu);
 
 #define ARMV8_PMU_PDEV_NAME "armv8-pmu"
 
+#else /* CONFIG_ARM_PMU */
+
+static inline void arm_pmu_set_phys_irq(bool enable) {}
+
 #endif /* CONFIG_ARM_PMU */
 
 #define ARMV8_SPE_PDEV_NAME "arm,spe-v1"
-- 
2.43.0


