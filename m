Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D47CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQQ18eHUvJfOcXCMMFpFtj/7yEdwh649qgaGut99xS8=; b=Yj3nvxK/v8lw53n5aHU97/wzQu
	agAk7OgCc5J1wYyITHiISQmL1ZX4h5PDLC1nVbCzadmI3kJc2GHFdiY3Nw+w73yiR09U0/94WTVN/
	nh0War6jOg+TpCsPhqGkIgokfS0QU8iXnetYVeI5nmcZ/Fk5/18y8OS4Sb0yHLhs+n6Nsil7qJg/M
	3KnHSLP4fGHzt66V05s8Bnr9rZe+fT/0KpwJNqrUt+olthFgOU+eWRM0It5N1CtWFe1HFAXMbnTbR
	SpZDFvy2DTDmqFX8LbO3JhyKKSNjehXKWNFbV0YfJxA0WKYo0XjHOZV12OFuxoDghm8aJzGzc/dR9
	HV0GmRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHelJ-00000002YpP-0Ohe;
	Fri, 16 Oct 2026 10:02:05 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHel6-00000002Yg6-285X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792144912; x=1823680912;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=KQchNKIYo3Tl3aIeCa6FTCQg5i4rePcmRPvv29atvEk=;
  b=YEoJ5o9InGDX20JHM0/KeS7powCwcYWDElqsI1MB9aGJw6jgTi5hrN4u
   XVW23/vLrKnuQ1HW47DwoplKIv0CK4QbNq24DtNrhNPTEvaeyAI81wYih
   cDrI/wG8RnzisTW/HTnB28W2z3HOrk5ZmGy5Iv2AhFFrtI7Cd/H1oE93P
   BkuPOgadXJnW7RAG5rtoYhDcKQ9GWu4Ole6akcvEMh+HcO7DOAIT0pfKM
   mMjhGusoE+qTLORsF1xaWUoobyQmcfXL8DMcNisQ5OWsPMcFBdXhFTiu0
   4dR9zgsUiIqNHQf6qkbCXBlg1TW/c6kBO03Ck1iQ82E2onG6xKvl/UXNo
   g==;
X-CSE-ConnectionGUID: iefY8z7bRl6DQAhID/aDhA==
X-CSE-MsgGUID: 9U84S+FaQ5yk5rZHzh1KOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="244647950"
X-IronPort-AV: E=Sophos;i="6.27,161,1786978800"; 
   d="scan'208";a="244647950"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 19:01:51 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D8F631C0067E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 10:01:50 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8863D1C00F8B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 10:01:50 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 533B8101BB55;
	Fri, 16 Oct 2026 10:01:43 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Date: Fri, 16 Oct 2026 19:00:48 +0900
Subject: [PATCH v2 4/4] irqchip/gicv3: Add workaround for FUJITSU-MONAKA
 erratum E#030003
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-monaka-fix-for-upstream-v2-4-fc7ede7f9f48@fujitsu.com>
References: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
In-Reply-To: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792144875; l=5390;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=IcHHMgdukNFgrHc2A1DsT0YWYc6zj2tTFfALcXgUHyc=;
 b=/gw6hxci3VmtRFZBJ1dD7bozFu/wTb4kFSyDxx6c+z5+JPL26OP/Od8hXLcSci2MsA4BJu3G4
 pBcaFCnIfM+AFnbAylTHVcK+nylCWmygSufrZVvkRTsjZK4lKOTpjn0
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_030152_849558_780E072C 
X-CRM114-Status: GOOD (  20.69  )
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

On affected FUJITSU-MONAKA CPUs, the erratum may occur when an SGI is
generated by writing to ICC_SGI0R_EL1, ICC_SGI1R_EL1, or ICC_ASGI1R_EL1,
if the operation races with CPU interface processing triggered by the
arrival of a higher-priority interrupt, an update to a pending
interrupt, or a transition of the PE to the Sleep state. When the
erratum occurs, the SGI is lost and the system register write does not
complete, causing the issuing core to hang.

Guest accesses to these registers are not affected by this erratum, as
they are trapped to EL2 and handled without issuing the affected system
register write.

Work around the erratum by writing 1 to the bit corresponding to the
target SGI INTID in GICR_ISPENDR0 of each target PE's GIC Redistributor,
instead of writing to the affected system registers.

Accessing a target PE's GICR_ISPENDR0 requires its Redistributor base to
have been discovered. Affected platforms conform to SBBR, which requires
PSCI for secondary CPU boot. They therefore do not use the ACPI Parking
protocol, which sends an IPI before the secondary CPU has initialized
its Redistributor. With PSCI, a secondary CPU discovers its
Redistributor before becoming an IPI target.

Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
Changes in v2:
- Clarify the erratum description and document that virtual accesses are
  unaffected.
- Remove the gic_send_sgi_via_rdist() helper.
- Remove the write-count rationale.
- Use the CPU MIDR instead of the SoC ID for filtering.

Note that I have left the dsb(st) after the GICR_ISPENDR0 writes
unchanged, pending clarification of the required completion point. If
the writes must be observed by a specific component before
gic_ipi_send_mask() returns, I will use the appropriate mechanism to
provide that guarantee.
---
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 drivers/irqchip/irq-gic-v3.c                | 32 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 0efb24ec01b4c..ee957494a5513 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -379,6 +379,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | MONAKA          | E#030002        | FUJITSU_ERRATUM_030002      |
 +----------------+-----------------+-----------------+-----------------------------+
+| Fujitsu        | MONAKA GICv3/v4 | E#030003        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | ASR            | ASR8601         | #8601001        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc4..125940442d77a 100644
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
@@ -1386,6 +1391,17 @@ static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
 	 */
 	dsb(ishst);
 
+	if (static_branch_unlikely(&gic_fujitsu_030003_erratum)) {
+		for_each_cpu(cpu, mask) {
+			void __iomem *base = gic_data_rdist_sgi_base_cpu(cpu);
+
+			writel_relaxed(BIT(d->hwirq), base + GICR_ISPENDR0);
+		}
+
+		dsb(st);
+		return;
+	}
+
 	for_each_cpu(cpu, mask) {
 		u64 cluster_id = MPIDR_TO_SGI_CLUSTER_ID(gic_cpu_to_affinity(cpu));
 		u16 tlist;
@@ -1871,6 +1887,16 @@ static bool gic_enable_quirk_rk3399(void *data)
 	return false;
 }
 
+static bool gic_enable_quirk_fujitsu_030003(void *data)
+{
+	if (read_cpuid_implementor() != ARM_CPU_IMP_FUJITSU ||
+	    read_cpuid_part_number() != FUJITSU_CPU_PART_MONAKA)
+		return false;
+
+	static_branch_enable(&gic_fujitsu_030003_erratum);
+	return true;
+}
+
 static bool rd_set_non_coherent(void *data)
 {
 	struct gic_chip_data *d = data;
@@ -1951,6 +1977,12 @@ static const struct gic_quirk gic_quirks[] = {
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


