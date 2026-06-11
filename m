Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286BECD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTezmI7Oy2+ckFteVAxOSW4ES1lokZ8fCWdVWuBcCcE=; b=EYp6/n52S0kAKCfmLeNXQX6GwQ
	fhOGTZMrbBeMhDq246EROOeBUuv5mKKpv6TTAb+V7itw2wPszZylTUIzQDrZJd9ueM97wSNDtPlX9
	aJcW9S2vh7kmMxia69/zgm+iRxncZOAERt2k6e0mbsBA5RogTQwvGOoIOL9HXmE4Rp8RD/W0qHJOf
	SFtxw25lbRDpuZ1Uu7dK+gvxxmD57rQKwYVJWdnmSQBRrjZGZxlAuemLUcv2APJidd6qzs68d/iLZ
	gkoeRR0LsqYjWPjXHowLVxbhjV/cj+V63TJIxyx1XvUiUlADDiR/iFGFyJBpXuRBl2WO/DjCHL3kV
	TlL9ttZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3e-00000009TP9-2E4k;
	Thu, 11 Jun 2026 13:02:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3d-00000009TNF-00LA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:02:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB4ED4192C;
	Thu, 11 Jun 2026 13:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B871F00899;
	Thu, 11 Jun 2026 13:02:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 7/9] pmdomain: arm: scmi: Add clock domain support
Date: Thu, 11 Jun 2026 15:02:11 +0200
Message-ID: <e99b203025504306cd858563d438df32ea47605e.1781171706.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781171705.git.geert+renesas@glider.be>
References: <cover.1781171705.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

PM domain consumer devices may also part of a clock domain.

Add support for managing power management clocks in a clock domain
through Runtime PM.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pmdomain/arm/Kconfig          |  1 +
 drivers/pmdomain/arm/scmi_pm_domain.c | 81 ++++++++++++++++++++++++++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
index afed10d382ad7f66..11c4db47c1eadab0 100644
--- a/drivers/pmdomain/arm/Kconfig
+++ b/drivers/pmdomain/arm/Kconfig
@@ -14,6 +14,7 @@ config ARM_SCMI_PERF_DOMAIN
 config ARM_SCMI_POWER_DOMAIN
 	tristate "SCMI power domain driver"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	depends on COMMON_CLK_SCMI || !COMMON_CLK_SCMI
 	default ARM_SCMI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 8e67f971c707e121..838917d3b236e3aa 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -5,9 +5,12 @@
  * Copyright (C) 2018-2021 ARM Ltd.
  */
 
+#include <linux/clk.h>
+#include <linux/clk/scmi.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
 #include <linux/scmi_protocol.h>
 
@@ -16,6 +19,7 @@ static const struct scmi_power_proto_ops *power_ops;
 struct scmi_pm_domain {
 	struct generic_pm_domain genpd;
 	const struct scmi_protocol_handle *ph;
+	struct device_node *clock_domain;
 	const char *name;
 	u32 domain;
 };
@@ -39,6 +43,67 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
 	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
 }
 
+static int scmi_pd_attach_dev(struct generic_pm_domain *domain,
+			      struct device *dev)
+{
+	struct scmi_pm_domain *pd = to_scmi_pd(domain);
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args clkspec;
+	bool once = true;
+	struct clk *clk;
+	int ret;
+
+	for (int i = 0;
+	     !of_parse_phandle_with_args(np, "clocks", "#clock-cells", i, &clkspec);
+	     i++) {
+		if (clkspec.np != pd->clock_domain || clkspec.args_count != 1) {
+			of_node_put(clkspec.np);
+			continue;
+		}
+
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (!clk)
+			continue;
+
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			clk = NULL;
+			goto fail;
+		}
+
+		if (!scmi_clk_is_pm_clk(clk)) {
+			clk_put(clk);
+			continue;
+		}
+
+		if (once) {
+			once = false;
+			ret = pm_clk_create(dev);
+			if (ret)
+				goto fail;
+		}
+
+		ret = pm_clk_add_clk(dev, clk);
+		if (ret)
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	pm_clk_destroy(dev);
+	clk_put(clk);
+	return ret;
+}
+
+static void scmi_pd_detach_dev(struct generic_pm_domain *domain,
+			       struct device *dev)
+{
+	if (!pm_clk_no_clocks(dev))
+		pm_clk_destroy(dev);
+}
+
 static int scmi_pm_domain_probe(struct scmi_device *sdev)
 {
 	int num_domains, i, ret;
@@ -48,6 +113,7 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 	struct genpd_onecell_data *scmi_pd_data;
 	struct generic_pm_domain **domains;
 	const struct scmi_handle *handle = sdev->handle;
+	struct device_node *clock_domain;
 	struct scmi_protocol_handle *ph;
 
 	if (!handle)
@@ -75,6 +141,8 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 	if (!domains)
 		return -ENOMEM;
 
+	clock_domain = of_parse_phandle(np, "arm,clock-domain", 0);
+
 	for (i = 0; i < num_domains; i++, scmi_pd++) {
 		const struct scmi_power_domain_info *info;
 		u32 state;
@@ -106,6 +174,12 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
 		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP |
 				       info->genpd_flags;
+		if (clock_domain) {
+			scmi_pd->clock_domain = of_node_get(clock_domain);
+			scmi_pd->genpd.attach_dev = scmi_pd_attach_dev;
+			scmi_pd->genpd.detach_dev = scmi_pd_detach_dev;
+			scmi_pd->genpd.flags |= GENPD_FLAG_PM_CLK;
+		}
 
 		pm_genpd_init(&scmi_pd->genpd, NULL,
 			      state == SCMI_POWER_STATE_GENERIC_OFF);
@@ -113,6 +187,8 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		domains[i] = &scmi_pd->genpd;
 	}
 
+	of_node_put(clock_domain);
+
 	scmi_pd_data->domains = domains;
 	scmi_pd_data->num_domains = num_domains;
 
@@ -134,8 +210,10 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	return 0;
 err_rm_genpds:
-	for (i = num_domains - 1; i >= 0; i--)
+	for (i = num_domains - 1; i >= 0; i--) {
 		pm_genpd_remove(domains[i]);
+		of_node_put(to_scmi_pd(domains[i])->clock_domain);
+	}
 
 	return ret;
 }
@@ -158,6 +236,7 @@ static void scmi_pm_domain_remove(struct scmi_device *sdev)
 		if (!scmi_pd_data->domains[i])
 			continue;
 		pm_genpd_remove(scmi_pd_data->domains[i]);
+		of_node_put(to_scmi_pd(scmi_pd_data->domains[i])->clock_domain);
 	}
 }
 
-- 
2.43.0


