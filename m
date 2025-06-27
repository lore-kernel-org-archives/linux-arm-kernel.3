Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1247FC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7Gdp8Nk60ZfRYhbL7kV9nXUPDhA4CVDa+kStehV06k=; b=iWvEIKGZV+xIU+1+vKqyifW7GH
	zegW7BE96H3k4xCXVoEYJXPKVKeJjvKTimU/n0kmECH/y2ji4+cEMZHkcnRKraomQSvmz5BMPVi9n
	l0X9+jJCOS6fbZloXoHXa4ZY5D8lSD/ERot96ozEduKJIUgGxmPP35ypyednnwUmFpP7ISyn0CrHS
	fRw2dpqYCbjyHOIIBAQG/9qDN4sPIRe/rslJnbpMgaa0GEsAkx0VShJdG6vgI/1fSs8XduGuAqBXH
	kC6ZpBCJv/A3YnazNgKwDmh9ID6tHlgO93RMx1s13a9ACa/401DD5rUnHFgK90+ykAcasz0RrMmsm
	3IGLY+sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGAp-0000000FoMO-0ET8;
	Fri, 27 Jun 2025 20:59:51 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVG0M-0000000FnGN-2Iug
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 20:49:03 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RKmwlK2112130;
	Fri, 27 Jun 2025 15:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751057338;
	bh=l7Gdp8Nk60ZfRYhbL7kV9nXUPDhA4CVDa+kStehV06k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iwLKQmF/0Z4iRQaqC2FBfdg22yRU7fTYaVG+Vcqh4jYXONpgyQo5X6mHl15R/C+ao
	 1np+r4hIv6he8nd5DXD0k8yy4GltBg/tcPhJceG70jPKq2Vwplmy5C0wrnTaKCJIIf
	 X2Vkm0QxO9y6ii/0d54uM+0SBAAj5F0L+MX/wdY4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RKmw0T783155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 15:48:58 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 15:48:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 15:48:57 -0500
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RKmpWX3421525;
	Fri, 27 Jun 2025 15:48:57 -0500
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>,
        <ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
        <msp@baylibre.com>, <khilman@baylibre.com>,
        Kendall Willis <k-willis@ti.com>
Subject: [PATCH 2/2] pmdomain: ti_sci: Add LPM abort sequence to suspend path
Date: Fri, 27 Jun 2025 15:48:21 -0500
Message-ID: <20250627204821.1150459-3-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627204821.1150459-1-k-willis@ti.com>
References: <20250627204821.1150459-1-k-willis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_134902_680415_9EC2E473 
X-CRM114-Status: GOOD (  15.75  )
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

Create ->suspend_late() and ->suspend_noirq() hooks to add abort sequence
to any driver within the PM domain with either of those hooks. If a driver
fails to suspend with those hooks, add a call to the DM to abort entering
the LPM. The suspend hooks of the PM domains driver inserts itself into
the suspend path of all devices connected to the TI SCI PM domain. So if
any device in the PM domain with either a ->suspend_late() or
->suspend_noirq hook fails to suspend, the PM domain drivers suspend hook
will send the abort call to the DM.

Adding an abort call in the ->suspend() hook is not necessary. TI SCI
suspend sends the message to the DM to prepare to enter a low power mode.
TI SCI suspend ALWAYS occurs after the ->suspend() hook for all TI SCI
devices has been called.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 46 ++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index 82df7e44250bb..975defc16271d 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -2,7 +2,7 @@
 /*
  * TI SCI Generic Power Domain Driver
  *
- * Copyright (C) 2015-2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015-2025 Texas Instruments Incorporated - http://www.ti.com/
  *	J Keerthy <j-keerthy@ti.com>
  *	Dave Gerlach <d-gerlach@ti.com>
  */
@@ -149,8 +149,47 @@ static int ti_sci_pd_suspend(struct device *dev)
 
 	return 0;
 }
+
+static int ti_sci_pd_suspend_late(struct device *dev)
+{
+	struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+	struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
+	const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
+	int ret;
+
+	ret = pm_generic_suspend_late(dev);
+	if (ret) {
+		dev_err(dev, "%s: Failed to suspend. Abort entering low power mode.\n", __func__);
+		if (ti_sci->ops.pm_ops.lpm_abort(ti_sci))
+			dev_err(dev, "%s: Failed to abort.\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ti_sci_pd_suspend_noirq(struct device *dev)
+{
+	struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+	struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
+	const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
+	int ret;
+
+	ret = pm_generic_suspend_noirq(dev);
+	if (ret) {
+		dev_err(dev, "%s: Failed to suspend. Abort entering low power mode.\n", __func__);
+		if (ti_sci->ops.pm_ops.lpm_abort(ti_sci))
+			dev_err(dev, "%s: Failed to abort.\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 #else
 #define ti_sci_pd_suspend		NULL
+#define ti_sci_pd_suspend_late		NULL
+#define ti_sci_pd_suspend_noirq		NULL
 #endif
 
 /*
@@ -264,6 +303,11 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
 				    pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
 					pd->pd.domain.ops.suspend = ti_sci_pd_suspend;
 
+				if (pd_provider->ti_sci->ops.pm_ops.lpm_abort) {
+					pd->pd.domain.ops.suspend_late = ti_sci_pd_suspend_late;
+					pd->pd.domain.ops.suspend_noirq = ti_sci_pd_suspend_noirq;
+				}
+
 				pm_genpd_init(&pd->pd, NULL, true);
 
 				list_add(&pd->node, &pd_provider->pd_list);
-- 
2.34.1


