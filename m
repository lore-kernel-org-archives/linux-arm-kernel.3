Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B29C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gx99chNiDC3hO1dTreT4MZYcKSINKjOWjGkwPEr22M=; b=umuhDrhtlYEfyX35kPbvuctDPH
	fzHHIJswYEWJxaSpDdtQ7IQqYj5VdgxFfoGXLW3ap3caP6InmPltgspr10b1HIuJx2tJxKiUGtPbO
	MiTQPSzHWAQFyuhby24vXN3xXXKyTpG1OMg+tm+tX7WG98Zj3jsiqofFKC+wriSj7eJIPGgJrB8gK
	57aJu3jJ+xiv5iFOrQ8SEH0pMtBQqI5zqXrKd9sE9GqVg6W+I4O8N4936a7gkW09Sf3BUMsAfCkYn
	RWrmYuMv+Hl2ggYZuNAVk+huouiLoFgjg+SBddwpKr6wP94Th4TnNHzfuEOiMhBLhUiQuYOnm+C2O
	K+UqXJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNlh-000000000NU-2pzo;
	Thu, 16 Jul 2026 15:12:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNlc-000000000KL-3tE3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 15:12:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD3C71691;
	Thu, 16 Jul 2026 08:12:46 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 204883F66F;
	Thu, 16 Jul 2026 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784214771; bh=75IJt8xi0ft2PtVtFIiaRDwCiHpcnI2pdT3cfH0WwMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mY1E+ecLK+EhIqTiLGD1Yt/XzW1X3G4V7nNVonQ1XBZEJawUbjHxTKsKWRcf7osgF
	 /YVlolAqR8+aXKQF/gXXs5wwwTwv4Y6PYrJd7nSKGEOxwX0xfBmG2mErFZblh4VqUm
	 37IDdrOIVcFesI00n4m35wg92ERD47IXl1+3CDX0=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] perf/arm-bmu: Add Devicetree support
Date: Thu, 16 Jul 2026 16:12:41 +0100
Message-ID: <c797080aaa2f51273267a24e256cab083e64b156.1784214112.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784214112.git.robin.murphy@arm.com>
References: <cover.1784214112.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_081253_012945_078393BF 
X-CRM114-Status: GOOD (  16.32  )
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

Initial production BMU users will be ACPI-based, but DT consumers
will almost certainly come along sooner or later.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---
v2: Separate patch as it's not a critical dependency right now
---
 drivers/perf/arm_cspmu/Kconfig   |  2 +-
 drivers/perf/arm_cspmu/arm-bmu.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_cspmu/Kconfig b/drivers/perf/arm_cspmu/Kconfig
index 0cb369f91023..8a7e2082b850 100644
--- a/drivers/perf/arm_cspmu/Kconfig
+++ b/drivers/perf/arm_cspmu/Kconfig
@@ -30,6 +30,6 @@ config AMPERE_CORESIGHT_PMU_ARCH_SYSTEM_PMU
 
 config ARM_BMU
 	tristate "ARM Bus Monitor Unit"
-	depends on (ARM64 && ACPI) || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support perf event counting on Arm Bus Monitor Unit devices.
diff --git a/drivers/perf/arm_cspmu/arm-bmu.c b/drivers/perf/arm_cspmu/arm-bmu.c
index c829a0728e9b..0c2442392f7b 100644
--- a/drivers/perf/arm_cspmu/arm-bmu.c
+++ b/drivers/perf/arm_cspmu/arm-bmu.c
@@ -6,6 +6,7 @@
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -406,7 +407,10 @@ static int arm_bmu_probe(struct platform_device *pdev)
 		.read = arm_bmu_event_read,
 	};
 
-	name = acpi_device_uid(ACPI_COMPANION(dev));
+	if (has_acpi_companion(dev))
+		name = acpi_device_uid(ACPI_COMPANION(dev));
+	else
+		device_property_read_string(dev, "label", &name);
 
 	if (name)
 		name = devm_kasprintf(dev, GFP_KERNEL, "arm_bmu_%s", name);
@@ -437,6 +441,14 @@ static void arm_bmu_remove(struct platform_device *pdev)
 	cpuhp_state_remove_instance_nocalls(arm_bmu_cpuhp_state, &bmu->cpuhp_node);
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id arm_bmu_of_match[] = {
+	{ .compatible = "arm,bus-monitor-unit" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, arm_bmu_of_match);
+#endif
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id arm_bmu_acpi_match[] = {
 	{ "ARMHB001" },
@@ -448,6 +460,7 @@ MODULE_DEVICE_TABLE(acpi, arm_bmu_acpi_match);
 static struct platform_driver arm_bmu_driver = {
 	.driver = {
 		.name = "arm-bmu",
+		.of_match_table = of_match_ptr(arm_bmu_of_match),
 		.acpi_match_table = ACPI_PTR(arm_bmu_acpi_match),
 		.suppress_bind_attrs = true,
 	},
-- 
2.54.0.dirty


