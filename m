Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88083606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3+VFsSnI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iUgQAbCs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i+9ofENAzHEsTKb46GBTQBZKrmokj6ryzMIxvWntrdI=; b=3+VFsSnIHKN3sF
	wE77T20XzzadQx/O1/uLfjCyu/Qtx1d4hKs3CHcuOZ+nTNOVFgy1uKj9F2VgR3NB+sTdICCT1NwS0
	FQNib8OnrHCAM3zMlMFtcuJ57OGUNVMQRQS57Zc/l6KNqn16tjgs8wH6yu8FKDNLJDHEtfGJJPfEn
	0zuggS2e3R2m6xQ/va07NMpqp+mJVCKtl7W/do8+6JFhdIC5dkZGb95RDKvbm+0JtQK7JlFpMBMvW
	dsIVxgm5VIEK9bCwdvSi4S7q6y70/7geTHurbYjGVWsbbGLMPExPNfI0dgwQorPTwIHR808XWuQv8
	Jqzel6QZ3fCVYuhRK9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjpG-00000007BXG-19Z9;
	Wed, 04 Nov 2026 22:51:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjpE-00000007BWl-3r1B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:51:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 862A943B9E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 22:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644F41F000C1;
	Wed,  4 Nov 2026 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793832684;
	bh=i+9ofENAzHEsTKb46GBTQBZKrmokj6ryzMIxvWntrdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iUgQAbCseXvUslL9aUjxNusRRb9qaHhAn62nHYLteQ90a7wc0q2TAfBdMtJ0LbBIi
	 1x1Xh88wGHafD4S2KUqyskf3te59HZlPFZoOwWgGPyFO9XXf6EsyUyRxb+7WrCW1be
	 oTT5Iv7GDXzOIqfIgItIS/M2XwuV6RLqL5U4iafW+QvgiIlUAgSJynd7LOlfU3umWd
	 sy8EMBL1v2AZRExGUsomwVEho+bOS1PYnN4ujcNW1EtH5qVsu7m+iO1ZvD88unHlk/
	 BO+dupzqk4EB3NAUWfUzi/43YnoCL4Nssv6rtkq0Xizl83l4t2etUjRiMdGDH4Oy05
	 nkrgFXx5BTD0A==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 23:51:19 +0100
Subject: [PATCH 2/2] pmdomain: st: ux500: Control DB8500 EPODs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-ux500-pd-genpd-v7-5-v1-2-4b4f256f340d@kernel.org>
References: <20261104-b4-ux500-pd-genpd-v7-5-v1-0-4b4f256f340d@kernel.org>
In-Reply-To: <20261104-b4-ux500-pd-genpd-v7-5-v1-0-4b4f256f340d@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the DB8500 EPOD state handling into the Ux500 power-domain driver.

Only domains backed by hardware EPODs issue PRCMU requests. Voltage
domains without an EPOD remain bookkeeping-only domains.

Do not carry over the unused RAM-retention regulator bookkeeping. The old
retention regulators have no consumers and retention is not modeled by this
series.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/mach-ux500/Kconfig               |   2 +-
 drivers/pmdomain/st/ste-ux500-pm-domain.c | 294 +++++++++++++++++++-----------
 2 files changed, 192 insertions(+), 104 deletions(-)

diff --git a/arch/arm/mach-ux500/Kconfig b/arch/arm/mach-ux500/Kconfig
index c18def269137..0818e1f63221 100644
--- a/arch/arm/mach-ux500/Kconfig
+++ b/arch/arm/mach-ux500/Kconfig
@@ -26,10 +26,10 @@ menuconfig ARCH_U8500
 	select PL310_ERRATA_753970 if CACHE_L2X0
 	select PM_GENERIC_DOMAINS if PM
 	select REGULATOR
-	select REGULATOR_DB8500_PRCMU
 	select REGULATOR_FIXED_VOLTAGE
 	select SOC_BUS
 	select RESET_CONTROLLER
+	select UX500_PM_DOMAIN
 	help
 	  Support for ST-Ericsson's Ux500 architecture
 
diff --git a/drivers/pmdomain/st/ste-ux500-pm-domain.c b/drivers/pmdomain/st/ste-ux500-pm-domain.c
index d90a563cd6f3..48ba0ee26be5 100644
--- a/drivers/pmdomain/st/ste-ux500-pm-domain.c
+++ b/drivers/pmdomain/st/ste-ux500-pm-domain.c
@@ -7,173 +7,230 @@
  * Implements PM domains using the generic PM domain for ux500.
  */
 #include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/printk.h>
-#include <linux/slab.h>
 #include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/mfd/db8500-prcmu.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/slab.h>
 
 #include <dt-bindings/arm/ux500_pm_domains.h>
 
 #define NR_DOMAINS		(DOMAIN_ESRAM_34 + 1)
+#define UX500_NO_EPOD		(-1)
+
+/**
+ * struct dbx500_powerdomain_info - dbx500 power domain information
+ * @genpd: generic power domain
+ * @epod_id: hardware EPOD ID, or UX500_NO_EPOD for a voltage domain
+ */
+struct dbx500_powerdomain_info {
+	struct generic_pm_domain genpd;
+	int epod_id;
+};
 
 static int pd_power_off(struct generic_pm_domain *domain)
 {
-	/*
-	 * Handle the gating of the PM domain regulator here.
-	 *
-	 * Drivers/subsystems handling devices in the PM domain needs to perform
-	 * register context save/restore from their respective runtime PM
-	 * callbacks, to be able to enable PM domain gating/ungating.
-	 */
-	return 0;
+	struct dbx500_powerdomain_info *info =
+		container_of(domain, struct dbx500_powerdomain_info, genpd);
+
+	if (info->epod_id == UX500_NO_EPOD)
+		return 0;
+
+	return db8500_prcmu_set_epod(info->epod_id, EPOD_STATE_OFF);
 }
 
 static int pd_power_on(struct generic_pm_domain *domain)
 {
-	/*
-	 * Handle the ungating of the PM domain regulator here.
-	 *
-	 * Drivers/subsystems handling devices in the PM domain needs to perform
-	 * register context save/restore from their respective runtime PM
-	 * callbacks, to be able to enable PM domain gating/ungating.
-	 */
-	return 0;
+	struct dbx500_powerdomain_info *info =
+		container_of(domain, struct dbx500_powerdomain_info, genpd);
+
+	if (info->epod_id == UX500_NO_EPOD)
+		return 0;
+
+	return db8500_prcmu_set_epod(info->epod_id, EPOD_STATE_ON);
 }
 
 /*
  * Apart from these voltage domains there is also VSAFE which is always
  * on. Vape_esram0_pwr for eSRAM0 is connected to VSAFE.
  */
-static struct generic_pm_domain ux500_pm_domain_vape = {
+static struct dbx500_powerdomain_info ux500_pm_domain_vape = {
 	/* Vape_pwr */
-	.name = "VAPE",  /* 0.95 .. 1.20 V */
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+	.genpd = {
+		.name = "VAPE",  /* 0.95 .. 1.20 V */
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = UX500_NO_EPOD,
 };
 
-static struct generic_pm_domain ux500_pm_domain_varm = {
-	.name = "VARM",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+static struct dbx500_powerdomain_info ux500_pm_domain_varm = {
+	.genpd = {
+		.name = "VARM",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = UX500_NO_EPOD,
 };
 
-static struct generic_pm_domain ux500_pm_domain_vmodem = {
-	.name = "VMODEM",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+static struct dbx500_powerdomain_info ux500_pm_domain_vmodem = {
+	.genpd = {
+		.name = "VMODEM",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = UX500_NO_EPOD,
 };
 
-static struct generic_pm_domain ux500_pm_domain_vpll = {
-	.name = "VPLL", /* 1.8 V */
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+static struct dbx500_powerdomain_info ux500_pm_domain_vpll = {
+	.genpd = {
+		.name = "VPLL", /* 1.8 V */
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = UX500_NO_EPOD,
 };
 
 /*
  * CHECKME: as these are used directly by peripherals as regulators,
  * perhaps they should stay in the regulator subsystem?
  */
-static struct generic_pm_domain ux500_pm_domain_vsmps1 = {
-	.name = "VSMPS1", /* Also called VIO (1.2V) */
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+static struct dbx500_powerdomain_info ux500_pm_domain_vsmps1 = {
+	.genpd = {
+		.name = "VSMPS1", /* Also called VIO (1.2V) */
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = UX500_NO_EPOD,
 };
 
-static struct generic_pm_domain ux500_pm_domain_vsmps2 = {
-	.name = "VSMPS2", /* Also called VIO (1.8V) */
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+static struct dbx500_powerdomain_info ux500_pm_domain_vsmps2 = {
+	.genpd = {
+		.name = "VSMPS2", /* Also called VIO (1.8V) */
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = UX500_NO_EPOD,
 };
 
-static struct generic_pm_domain ux500_pm_domain_vsmps3 = {
-	.name = "VSMPS3",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+static struct dbx500_powerdomain_info ux500_pm_domain_vsmps3 = {
+	.genpd = {
+		.name = "VSMPS3",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = UX500_NO_EPOD,
 };
 
-static struct generic_pm_domain ux500_pm_domain_vrf1 = {
-	.name = "VRF1",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+static struct dbx500_powerdomain_info ux500_pm_domain_vrf1 = {
+	.genpd = {
+		.name = "VRF1",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = UX500_NO_EPOD,
 };
 
 /* The following are technically children of VAPE */
-static struct generic_pm_domain ux500_pm_domain_sva_mmdsp = {
+static struct dbx500_powerdomain_info ux500_pm_domain_sva_mmdsp = {
 	/* Vape_SVA_MMDSP_pwr */
-	.name = "SVA_MMDSP",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+	.genpd = {
+		.name = "SVA_MMDSP",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = EPOD_ID_SVAMMDSP,
 };
 
-static struct generic_pm_domain ux500_pm_domain_sva_pipe = {
+static struct dbx500_powerdomain_info ux500_pm_domain_sva_pipe = {
 	/* Vape_SVA_pwr */
-	.name = "SVA_PIPE",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+	.genpd = {
+		.name = "SVA_PIPE",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = EPOD_ID_SVAPIPE,
 };
 
-static struct generic_pm_domain ux500_pm_domain_sia_mmdsp = {
+static struct dbx500_powerdomain_info ux500_pm_domain_sia_mmdsp = {
 	/* Vape_SIA_MMDSP_pwr */
-	.name = "SIA_MMDSP",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+	.genpd = {
+		.name = "SIA_MMDSP",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = EPOD_ID_SIAMMDSP,
 };
 
-static struct generic_pm_domain ux500_pm_domain_sia_pipe = {
+static struct dbx500_powerdomain_info ux500_pm_domain_sia_pipe = {
 	/* Vape_SIA_pwr */
-	.name = "SIA_PIPE",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+	.genpd = {
+		.name = "SIA_PIPE",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = EPOD_ID_SIAPIPE,
 };
 
-static struct generic_pm_domain ux500_pm_domain_sga = {
+static struct dbx500_powerdomain_info ux500_pm_domain_sga = {
 	/* Vape_SGA_pwr */
-	.name = "SGA",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+	.genpd = {
+		.name = "SGA",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = EPOD_ID_SGA,
 };
 
-static struct generic_pm_domain ux500_pm_domain_b2r2_mcde = {
+static struct dbx500_powerdomain_info ux500_pm_domain_b2r2_mcde = {
 	/* Vape_DSS_pwr DSS (display subsystem) */
-	.name = "B2R2_MCDE",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+	.genpd = {
+		.name = "B2R2_MCDE",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = EPOD_ID_B2R2_MCDE,
 };
 
-static struct generic_pm_domain ux500_pm_domain_esram_12 = {
+static struct dbx500_powerdomain_info ux500_pm_domain_esram_12 = {
 	/* Vape_esram1_pwr, Vape_esram2_pwr */
-	.name = "ESRAM_12",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+	.genpd = {
+		.name = "ESRAM_12",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = EPOD_ID_ESRAM12,
 };
 
-static struct generic_pm_domain ux500_pm_domain_esram_34 = {
+static struct dbx500_powerdomain_info ux500_pm_domain_esram_34 = {
 	/* Vape_esram3_pwr, Vape_esram4_pwr */
-	.name = "ESRAM_34",
-	.power_off = pd_power_off,
-	.power_on = pd_power_on,
+	.genpd = {
+		.name = "ESRAM_34",
+		.power_off = pd_power_off,
+		.power_on = pd_power_on,
+	},
+	.epod_id = EPOD_ID_ESRAM34,
 };
 
 static struct generic_pm_domain *ux500_pm_domains[NR_DOMAINS] = {
-	[DOMAIN_VAPE] = &ux500_pm_domain_vape,
-	[DOMAIN_VARM] = &ux500_pm_domain_varm,
-	[DOMAIN_VMODEM] = &ux500_pm_domain_vmodem,
-	[DOMAIN_VPLL] = &ux500_pm_domain_vpll,
-	[DOMAIN_VSMPS1] = &ux500_pm_domain_vsmps1,
-	[DOMAIN_VSMPS2] = &ux500_pm_domain_vsmps2,
-	[DOMAIN_VSMPS3] = &ux500_pm_domain_vsmps3,
-	[DOMAIN_VRF1] = &ux500_pm_domain_vrf1,
-	[DOMAIN_SVA_MMDSP] = &ux500_pm_domain_sva_mmdsp,
-	[DOMAIN_SVA_PIPE] = &ux500_pm_domain_sva_pipe,
-	[DOMAIN_SIA_MMDSP] = &ux500_pm_domain_sia_mmdsp,
-	[DOMAIN_SIA_PIPE] = &ux500_pm_domain_sia_pipe,
-	[DOMAIN_SGA] = &ux500_pm_domain_sga,
-	[DOMAIN_B2R2_MCDE] = &ux500_pm_domain_b2r2_mcde,
-	[DOMAIN_ESRAM_12] = &ux500_pm_domain_esram_12,
-	[DOMAIN_ESRAM_34] = &ux500_pm_domain_esram_34,
+	[DOMAIN_VAPE] = &ux500_pm_domain_vape.genpd,
+	[DOMAIN_VARM] = &ux500_pm_domain_varm.genpd,
+	[DOMAIN_VMODEM] = &ux500_pm_domain_vmodem.genpd,
+	[DOMAIN_VPLL] = &ux500_pm_domain_vpll.genpd,
+	[DOMAIN_VSMPS1] = &ux500_pm_domain_vsmps1.genpd,
+	[DOMAIN_VSMPS2] = &ux500_pm_domain_vsmps2.genpd,
+	[DOMAIN_VSMPS3] = &ux500_pm_domain_vsmps3.genpd,
+	[DOMAIN_VRF1] = &ux500_pm_domain_vrf1.genpd,
+	[DOMAIN_SVA_MMDSP] = &ux500_pm_domain_sva_mmdsp.genpd,
+	[DOMAIN_SVA_PIPE] = &ux500_pm_domain_sva_pipe.genpd,
+	[DOMAIN_SIA_MMDSP] = &ux500_pm_domain_sia_mmdsp.genpd,
+	[DOMAIN_SIA_PIPE] = &ux500_pm_domain_sia_pipe.genpd,
+	[DOMAIN_SGA] = &ux500_pm_domain_sga.genpd,
+	[DOMAIN_B2R2_MCDE] = &ux500_pm_domain_b2r2_mcde.genpd,
+	[DOMAIN_ESRAM_12] = &ux500_pm_domain_esram_12.genpd,
+	[DOMAIN_ESRAM_34] = &ux500_pm_domain_esram_34.genpd,
 };
 
 static const struct of_device_id ux500_pm_domain_matches[] = {
@@ -186,11 +243,12 @@ static int ux500_pm_domains_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct genpd_onecell_data *genpd_data;
 	int i;
+	int ret;
 
 	if (!np)
 		return -ENODEV;
 
-	genpd_data = kzalloc_obj(*genpd_data);
+	genpd_data = devm_kzalloc(&pdev->dev, sizeof(*genpd_data), GFP_KERNEL);
 	if (!genpd_data)
 		return -ENOMEM;
 
@@ -198,14 +256,44 @@ static int ux500_pm_domains_probe(struct platform_device *pdev)
 	genpd_data->num_domains = ARRAY_SIZE(ux500_pm_domains);
 
 	for (i = 0; i < ARRAY_SIZE(ux500_pm_domains); ++i)
-		pm_genpd_init(ux500_pm_domains[i], NULL, false);
+		pm_genpd_init(ux500_pm_domains[i], NULL, true);
+
+	ret = of_genpd_add_provider_onecell(np, genpd_data);
+	if (ret)
+		goto remove_genpds;
+
+	ret = of_genpd_add_child_ids(np, genpd_data);
+	if (ret < 0)
+		goto del_provider;
+
+	platform_set_drvdata(pdev, genpd_data);
 
-	of_genpd_add_provider_onecell(np, genpd_data);
 	return 0;
+
+del_provider:
+	of_genpd_del_provider(np);
+remove_genpds:
+	while (i--)
+		pm_genpd_remove(ux500_pm_domains[i]);
+
+	return ret;
+}
+
+static void ux500_pm_domains_remove(struct platform_device *pdev)
+{
+	struct genpd_onecell_data *genpd_data = platform_get_drvdata(pdev);
+	int i;
+
+	of_genpd_remove_child_ids(pdev->dev.of_node, genpd_data);
+	of_genpd_del_provider(pdev->dev.of_node);
+
+	for (i = genpd_data->num_domains - 1; i >= 0; i--)
+		pm_genpd_remove(genpd_data->domains[i]);
 }
 
 static struct platform_driver ux500_pm_domains_driver = {
 	.probe  = ux500_pm_domains_probe,
+	.remove = ux500_pm_domains_remove,
 	.driver = {
 		.name = "ux500_pm_domains",
 		.of_match_table = ux500_pm_domain_matches,

-- 
2.56.0


