Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39B3CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OHZ0RLg+HY8DFf+dbQ+s70yhO6FEwkNwccfsT0ZN5s=; b=4lttQ+LT5VGGKZDm4wervwlIm0
	Vb1slOYu0/mm1WJDdu941BiE3zDHTCPRtE1fGuigkVHjXaWHQzHo3gk6haHObVWVkYPQ1ahJxYWzh
	J0SFCXzRGH5B3l8iRTUdJFYfd8d0xbh6SEIOY5Vc0dixVsKwrIrK6NuT8YuqarYefCtHl1VInlVPy
	Sp/bJQ/XF0xdZVk1DB4Kx7P/RIVnYzIjpZ/hXArWb87kBCxp+lKcXUVVrDbstEZHkOW0JqwqknJz2
	un4kKntJ5aF2yjIHPgdW7f7U6lbdJtg8Nf44UggZvuEhxA9n1BOmfucyTX+KwFlP8o58Ugpxk3TG6
	6BM/W4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaV5-0000000BJHz-3o6N;
	Fri, 02 Oct 2026 10:28:23 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaV2-0000000BJDo-1bGn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790936901; x=1822472901;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Zpu3urQf3oxIJUVQosZq9QS20FzJZCQC2Qh54I8f2wY=;
  b=M1LFgK3o2QquOkBMofZ3Lfi/QqiynUI0o6wKMivgu/7QzYnmRfjYoilX
   6trh+2ecuDPgVuEgMRec/i8sfGX7tk+hlB4FLjD3hONd0akHSIrJl7z5L
   PvCQ0BLBPENMW7fQtd85Hb8ycRKABHR8S99CatzY57bxfm7JkMbOvBf8H
   ubVBpfWpGARr9RnqRY5e7TJGsB5gfjpDlboVxrIPum5cnc8LXXPndlJRh
   HCq32dgk6kh0QcgUamH3/fIUm2BF2rsE/3Wqv84uCOk2Cs8wPQ+T+d5CG
   wQhC/nzhsSfZbgXsykvilwY6LIP9/PcCGFv9OfcF7qmyiU1M7UIPzngzD
   Q==;
X-CSE-ConnectionGUID: SicYj6g8SjmCzdZRF/R1HA==
X-CSE-MsgGUID: fTKjL9UjS6GepRdN4jyelw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="256883594"
X-IronPort-AV: E=Sophos;i="6.27,136,1786978800"; 
   d="scan'208";a="256883594"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 19:28:19 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1C5721002BAE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:28:18 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C30A9180A329
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:28:17 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8F083201F388;
	Fri,  2 Oct 2026 10:28:12 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Date: Fri, 02 Oct 2026 19:26:52 +0900
Subject: [PATCH 4/4] irqchip/gicv3: Add workaround for FUJITSU-MONAKA
 erratum E#030003
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-monaka-fix-for-upstream-v1-4-4aec0b0cbe34@fujitsu.com>
References: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
In-Reply-To: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790936872; l=5720;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=jkObIAIoT0RNsftzOQUSWlKwKsutsNQFB2NYPEgb7Vw=;
 b=LY1jpWiCDJvh8gK9G+UcRIdldypzoWwkO+VorSOsx//qRJhQp07JuBox6Ztu/PpoRoJI15ouj
 haNCdO0BkgpBqeLfqGIFEVyprmk7PPlBHuoC2ipvpmGE5bdcFowxEhv
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_032820_866781_9E198F3F 
X-CRM114-Status: GOOD (  20.57  )
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

From: Kohei Enju <enju.kohei@fujitsu.com>

On affected FUJITSU-MONAKA CPUs, an SGI generated by writing to
ICC_SGI0R_EL1, ICC_SGI1R_EL1, or ICC_ASGI1R_EL1 may be lost if the
operation races with CPU interface processing triggered by the arrival
of a higher-priority interrupt, an update to a pending interrupt, or a
transition of the PE to the Sleep state. When this occurs, the system
register write does not complete, causing the issuing core to hang.

Work around the erratum by writing 1 to the bit corresponding to the
target SGI INTID in GICR_ISPENDR0 of each target PE's GIC Redistributor,
instead of writing to the affected system registers.

The affinity topology of affected systems has Aff0 == 0 for every PE,
with PEs distinguished by higher affinity levels. Consequently, an
ICC_SGI1R_EL1 write can target only one PE, so the workaround does not
increase the number of writes required to send an SGI to multiple PEs.

Accessing a target PE's GICR_ISPENDR0 requires its Redistributor base to
have been discovered. Affected platforms conform to SBBR, which requires
PSCI for secondary CPU boot. They therefore do not use the ACPI Parking
protocol, which sends an IPI before the secondary CPU has initialized
its Redistributor. With PSCI, a secondary CPU discovers its
Redistributor before becoming an IPI target.

Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 drivers/irqchip/irq-gic-v3.c                | 48 +++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 429bdf9a3d9d..13328a30df59 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -377,6 +377,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | MONAKA          | E#030002        | FUJITSU_ERRATUM_030002      |
 +----------------+-----------------+-----------------+-----------------------------+
+| Fujitsu        | MONAKA GICv3/v4 | E#030003        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | ASR            | ASR8601         | #8601001        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..e73fea8a0e27 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -80,6 +80,8 @@ static DEFINE_STATIC_KEY_FALSE(gic_nvidia_t241_erratum);
 
 static DEFINE_STATIC_KEY_FALSE(gic_arm64_2941627_erratum);
 
+static DEFINE_STATIC_KEY_FALSE(gic_fujitsu_030003_erratum);
+
 static struct gic_chip_data gic_data __read_mostly;
 static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
 
@@ -238,6 +240,9 @@ static DEFINE_PER_CPU(bool, has_rss);
 #define gic_data_rdist()		(this_cpu_ptr(gic_data.rdists.rdist))
 #define gic_data_rdist_rd_base()	(gic_data_rdist()->rd_base)
 #define gic_data_rdist_sgi_base()	(gic_data_rdist_rd_base() + SZ_64K)
+#define gic_data_rdist_cpu(cpu)		(per_cpu_ptr(gic_data.rdists.rdist, cpu))
+#define gic_data_rdist_rd_base_cpu(cpu)	(gic_data_rdist_cpu(cpu)->rd_base)
+#define gic_data_rdist_sgi_base_cpu(cpu)	(gic_data_rdist_rd_base_cpu(cpu) + SZ_64K)
 
 /* Our default, arbitrary priority value. Linux only uses one anyway. */
 #define DEFAULT_PMR_VALUE	0xf0
@@ -1373,6 +1378,13 @@ static void gic_send_sgi(u64 cluster_id, u16 tlist, unsigned int irq)
 	gic_write_sgi1r(val);
 }
 
+static void gic_send_sgi_via_rdist(int cpu, unsigned int irq)
+{
+	void __iomem *base = gic_data_rdist_sgi_base_cpu(cpu);
+
+	writel_relaxed(BIT(irq), base + GICR_ISPENDR0);
+}
+
 static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
 {
 	int cpu;
@@ -1386,6 +1398,22 @@ static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
 	 */
 	dsb(ishst);
 
+	if (static_branch_unlikely(&gic_fujitsu_030003_erratum)) {
+		/*
+		 * The affinity topology of affected systems has Aff0 == 0 for
+		 * every PE; PEs are distinguished by higher affinity levels.
+		 * ICC_SGI1R_EL1 therefore targets only one PE per write, so
+		 * using GICR_ISPENDR0 does not increase the number of writes
+		 * required to send an SGI to multiple PEs.
+		 */
+		for_each_cpu(cpu, mask)
+			gic_send_sgi_via_rdist(cpu, d->hwirq);
+
+		/* Force the above writes to GICR_ISPENDR0 to be executed */
+		dsb(st);
+		return;
+	}
+
 	for_each_cpu(cpu, mask) {
 		u64 cluster_id = MPIDR_TO_SGI_CLUSTER_ID(gic_cpu_to_affinity(cpu));
 		u16 tlist;
@@ -1871,6 +1899,20 @@ static bool gic_enable_quirk_rk3399(void *data)
 	return false;
 }
 
+#define SMCCC_SOC_ID_FUJITSU_MONAKA	0x00040003
+
+static bool gic_enable_quirk_fujitsu_030003(void *data)
+{
+	s32 soc_id = arm_smccc_get_soc_id_version();
+
+	/* Check JEP106 code for FUJITSU-MONAKA chip (0004:0003) */
+	if (soc_id != SMCCC_SOC_ID_FUJITSU_MONAKA)
+		return false;
+
+	static_branch_enable(&gic_fujitsu_030003_erratum);
+	return true;
+}
+
 static bool rd_set_non_coherent(void *data)
 {
 	struct gic_chip_data *d = data;
@@ -1951,6 +1993,12 @@ static const struct gic_quirk gic_quirks[] = {
 		.mask	= 0xff000fff,
 		.init	= gic_enable_quirk_rk3399,
 	},
+	{
+		.desc	= "GICv3: Fujitsu erratum 030003",
+		.iidr	= 0x0403043b,
+		.mask	= 0xffffffff,
+		.init	= gic_enable_quirk_fujitsu_030003,
+	},
 	{
 	}
 };

-- 
2.43.0


