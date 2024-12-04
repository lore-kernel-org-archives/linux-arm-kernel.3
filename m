Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06601E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dpm7RGtstokmGkBCmYp/usXqB3mAQ+ZueuXX2Wi1O8E=; b=jHl5fa1AMHUMWi2thQuEvHT3ng
	9Sx6RaaTKXuZ806zi1KdWXlINhqEhITwVOHuMnsvD90EgXJsaeaI+oeX7DWXX3z5bXKp4ywGLbz+g
	Q+hGjB9sCtcgTDytcEda6n0lLsc7lofmscpRokuF5f4HMhS+2YAQ8kz3KL+q9OIfHsWPtgebGmuah
	GZJSb5+scP77YdKNPIeLwE9JP7TioeMZ1hCsabn488ZrInGxVsmRL2peRy24kikEbto41Su19Qah9
	N8+pZtGwub4X6iO2eGIhncU55hfUCbylE89Dk6l+fkI4MAhZa3/8U/4n/5zqGnRhoZenEnAyBcE5m
	u6lHaFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIz2e-0000000EDu5-3hxn;
	Wed, 04 Dec 2024 23:44:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIytZ-0000000EBIW-3Ym8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E1695C6AC0;
	Wed,  4 Dec 2024 23:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D20C4CED6;
	Wed,  4 Dec 2024 23:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355301;
	bh=aiONX4M46Isv+HmzJj1n1XZxwqX1wUbZLkj0dScfkdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fjVs5RBENok8rzlhCiOeO2eFUsSjhad123NnRiVd+eoGwFV3YPM6JuPNpOJyuSnC2
	 jkbU7bopRMdH7boCC77jGdsFEbaaudfwF5VMzG8N5KV+JFjAL/lI9DIIdHE7nxQCmi
	 F1SyycvVhUwpHDDBBpua/WJI+ZSfbHEW/dZFsU7N+9URxpptbt/DYqZmVKjIn26Ng8
	 OpleSW0tdf29HM2fXIwdNUinzyw0csyHcCMIchOA8YoL0poQYthMUuhFagCZrwsHay
	 T+fyL1HTDzQZmbZTmMQCg6Uary2bBHMfpzvlnD9yARl+JPKLR79LbemvKsh61gA+lC
	 ouhif+rent/gA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhou Wang <wangzhou1@hisilicon.com>,
	Marc Zyngier <maz@kernel.org>,
	Nianyao Tang <tangnianyao@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 5/8] irqchip/gicv3-its: Add workaround for hip09 ITS erratum 162100801
Date: Wed,  4 Dec 2024 17:23:21 -0500
Message-ID: <20241204222334.2249307-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204222334.2249307-1-sashal@kernel.org>
References: <20241204222334.2249307-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_153501_979476_59266BB5 
X-CRM114-Status: GOOD (  16.10  )
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

From: Zhou Wang <wangzhou1@hisilicon.com>

[ Upstream commit f82e62d470cc990ebd9d691f931dd418e4e9cea9 ]

When enabling GICv4.1 in hip09, VMAPP fails to clear some caches during
the unmap operation, which can causes vSGIs to be lost.

To fix the issue, invalidate the related vPE cache through GICR_INVALLR
after VMOVP.

Suggested-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 +
 arch/arm64/Kconfig                          | 11 +++++
 drivers/irqchip/irq-gic-v3-its.c            | 50 ++++++++++++++++-----
 3 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 65bfab1b18614..77db10e944f03 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -258,6 +258,8 @@ stable kernels.
 | Hisilicon      | Hip{08,09,10,10C| #162001900      | N/A                         |
 |                | ,11} SMMU PMCG  |                 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
+| Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 22f8a7bca6d21..a11a7a42edbfb 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1232,6 +1232,17 @@ config HISILICON_ERRATUM_161600802
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_162100801
+	bool "Hip09 162100801 erratum support"
+	default y
+	help
+	  When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
+	  during unmapping operation, which will cause some vSGIs lost.
+	  To fix the issue, invalidate related vPE cache through GICR_INVALLR
+	  after VMOVP.
+
+	  If unsure, say Y.
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 52f625e07658c..d9b6ec844cdda 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -44,6 +44,7 @@
 #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_23144	(1ULL << 2)
 #define ITS_FLAGS_FORCE_NON_SHAREABLE		(1ULL << 3)
+#define ITS_FLAGS_WORKAROUND_HISILICON_162100801	(1ULL << 4)
 
 #define RD_LOCAL_LPI_ENABLED                    BIT(0)
 #define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
@@ -61,6 +62,7 @@ static u32 lpi_id_bits;
 #define LPI_PENDBASE_SZ		ALIGN(BIT(LPI_NRBITS) / 8, SZ_64K)
 
 static u8 __ro_after_init lpi_prop_prio;
+static struct its_node *find_4_1_its(void);
 
 /*
  * Collection structure - just an ID, and a redistributor address to
@@ -3797,6 +3799,20 @@ static void its_vpe_db_proxy_move(struct its_vpe *vpe, int from, int to)
 	raw_spin_unlock_irqrestore(&vpe_proxy.lock, flags);
 }
 
+static void its_vpe_4_1_invall_locked(int cpu, struct its_vpe *vpe)
+{
+	void __iomem *rdbase;
+	u64 val;
+
+	val  = GICR_INVALLR_V;
+	val |= FIELD_PREP(GICR_INVALLR_VPEID, vpe->vpe_id);
+
+	guard(raw_spinlock)(&gic_data_rdist_cpu(cpu)->rd_lock);
+	rdbase = per_cpu_ptr(gic_rdists->rdist, cpu)->rd_base;
+	gic_write_lpir(val, rdbase + GICR_INVALLR);
+	wait_for_syncr(rdbase);
+}
+
 static int its_vpe_set_affinity(struct irq_data *d,
 				const struct cpumask *mask_val,
 				bool force)
@@ -3804,6 +3820,7 @@ static int its_vpe_set_affinity(struct irq_data *d,
 	struct its_vpe *vpe = irq_data_get_irq_chip_data(d);
 	unsigned int from, cpu = nr_cpu_ids;
 	struct cpumask *table_mask;
+	struct its_node *its;
 	unsigned long flags;
 
 	/*
@@ -3866,6 +3883,11 @@ static int its_vpe_set_affinity(struct irq_data *d,
 	vpe->col_idx = cpu;
 
 	its_send_vmovp(vpe);
+
+	its = find_4_1_its();
+	if (its && its->flags & ITS_FLAGS_WORKAROUND_HISILICON_162100801)
+		its_vpe_4_1_invall_locked(cpu, vpe);
+
 	its_vpe_db_proxy_move(vpe, from, cpu);
 
 out:
@@ -4173,22 +4195,12 @@ static void its_vpe_4_1_deschedule(struct its_vpe *vpe,
 
 static void its_vpe_4_1_invall(struct its_vpe *vpe)
 {
-	void __iomem *rdbase;
 	unsigned long flags;
-	u64 val;
 	int cpu;
 
-	val  = GICR_INVALLR_V;
-	val |= FIELD_PREP(GICR_INVALLR_VPEID, vpe->vpe_id);
-
 	/* Target the redistributor this vPE is currently known on */
 	cpu = vpe_to_cpuid_lock(vpe, &flags);
-	raw_spin_lock(&gic_data_rdist_cpu(cpu)->rd_lock);
-	rdbase = per_cpu_ptr(gic_rdists->rdist, cpu)->rd_base;
-	gic_write_lpir(val, rdbase + GICR_INVALLR);
-
-	wait_for_syncr(rdbase);
-	raw_spin_unlock(&gic_data_rdist_cpu(cpu)->rd_lock);
+	its_vpe_4_1_invall_locked(cpu, vpe);
 	vpe_to_cpuid_unlock(vpe, flags);
 }
 
@@ -4781,6 +4793,14 @@ static bool its_set_non_coherent(void *data)
 	return true;
 }
 
+static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
+{
+	struct its_node *its = data;
+
+	its->flags |= ITS_FLAGS_WORKAROUND_HISILICON_162100801;
+	return true;
+}
+
 static const struct gic_quirk its_quirks[] = {
 #ifdef CONFIG_CAVIUM_ERRATUM_22375
 	{
@@ -4827,6 +4847,14 @@ static const struct gic_quirk its_quirks[] = {
 		.init	= its_enable_quirk_hip07_161600802,
 	},
 #endif
+#ifdef CONFIG_HISILICON_ERRATUM_162100801
+	{
+		.desc	= "ITS: Hip09 erratum 162100801",
+		.iidr	= 0x00051736,
+		.mask	= 0xffffffff,
+		.init	= its_enable_quirk_hip09_162100801,
+	},
+#endif
 #ifdef CONFIG_ROCKCHIP_ERRATUM_3588001
 	{
 		.desc   = "ITS: Rockchip erratum RK3588001",
-- 
2.43.0


