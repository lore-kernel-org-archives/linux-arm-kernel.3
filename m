Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34CAD116FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R66l0MmWiGrhbk5vaztofJHrhVi/ACzWWX6JdOCy0js=; b=Oxxb+4Idm6j2yY4SZwD74BAc88
	ZxrSBkUTVM44fiwKbTmMM9LOHBqB1UBV0rwlhhSqrCR4koAAnYlGOpmHZwsbboBh37NEvI+zSYrT8
	XDUEuHlh9hdsb2JwpJOdlBcE1jQVGpRk56eLW1zRMRf/trTsSDvxtBbYt9zHLKOd1UnmsPUyOAaJ3
	XopiWAx04XagF1VTf5W97Z/i3mKcq2MSJkB+uv6MaMws/CPHFSnHbEuYEFCs62kfnmU3lQsLenEf3
	YRx3FxpCDjbPijg8ToFb6+vmjRHGom50VHfSgjJ7UeUiA1sgbf353ezP08SQm8eSwhWJwuF2MMed+
	wB6mPT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQKC-00000005QaL-3KiE;
	Tue, 02 Dec 2025 13:21:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQK7-00000005QXe-45zg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:21:46 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vQQJu-0003pJ-PG; Tue, 02 Dec 2025 14:21:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 02 Dec 2025 14:21:03 +0100
Subject: [PATCH v2 2/3] pmdomain: imx93-blk-ctrl: convert to devm_* only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-v6-18-topic-imx93-blkctrl-v2-2-e73501034adc@pengutronix.de>
References: <20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de>
In-Reply-To: <20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de>
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_052144_062085_52E7B73F 
X-CRM114-Status: GOOD (  16.57  )
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

Convert the driver to devm_ APIs only by making use of
devm_add_action_or_reset() and devm_pm_runtime_enable() to simplify the
probe error path and to drop the .remove() callback. This also ensures
that the device release order equals the device probe error path order.

Furthermore drop the dev_set_drvdata() usage since the only user was the
.remove() callback which is removed by this commit.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 66 +++++++++++++++--------------------
 1 file changed, 29 insertions(+), 37 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 2aa163aef8de4ee901b9cde76ce2aad246c8c08a..49610f2389c3bbaf4de4133918fbcacb7924f672 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -188,6 +188,20 @@ static int imx93_blk_ctrl_power_off(struct generic_pm_domain *genpd)
 	return 0;
 }
 
+static void imx93_release_genpd_provider(void *data)
+{
+	struct device_node *of_node = data;
+
+	of_genpd_del_provider(of_node);
+}
+
+static void imx93_release_pm_genpd(void *data)
+{
+	struct generic_pm_domain *genpd = data;
+
+	pm_genpd_remove(genpd);
+}
+
 static struct lock_class_key blk_ctrl_genpd_lock_class;
 
 static int imx93_blk_ctrl_probe(struct platform_device *pdev)
@@ -256,10 +270,8 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 			domain->clks[j].id = data->clk_names[j];
 
 		ret = devm_clk_bulk_get(dev, data->num_clks, domain->clks);
-		if (ret) {
-			dev_err_probe(dev, ret, "failed to get clock\n");
-			goto cleanup_pds;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to get clock\n");
 
 		domain->genpd.name = data->name;
 		domain->genpd.power_on = imx93_blk_ctrl_power_on;
@@ -267,11 +279,12 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 		domain->bc = bc;
 
 		ret = pm_genpd_init(&domain->genpd, NULL, true);
-		if (ret) {
-			dev_err_probe(dev, ret, "failed to init power domain\n");
-			goto cleanup_pds;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to init power domain\n");
 
+		ret = devm_add_action_or_reset(dev, imx93_release_pm_genpd, &domain->genpd);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to add pm_genpd release callback\n");
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -288,39 +301,19 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 		bc->onecell_data.domains[i] = &domain->genpd;
 	}
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable pm-runtime\n");
 
 	ret = of_genpd_add_provider_onecell(dev->of_node, &bc->onecell_data);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to add power domain provider\n");
-		goto cleanup_pds;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add power domain provider\n");
 
-	dev_set_drvdata(dev, bc);
+	ret = devm_add_action_or_reset(dev, imx93_release_genpd_provider, dev->of_node);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add genpd_provider release callback\n");
 
 	return 0;
-
-cleanup_pds:
-	for (i--; i >= 0; i--)
-		pm_genpd_remove(&bc->domains[i].genpd);
-
-	return ret;
-}
-
-static void imx93_blk_ctrl_remove(struct platform_device *pdev)
-{
-	struct imx93_blk_ctrl *bc = dev_get_drvdata(&pdev->dev);
-	int i;
-
-	of_genpd_del_provider(pdev->dev.of_node);
-
-	pm_runtime_disable(&pdev->dev);
-
-	for (i = 0; i < bc->onecell_data.num_domains; i++) {
-		struct imx93_blk_ctrl_domain *domain = &bc->domains[i];
-
-		pm_genpd_remove(&domain->genpd);
-	}
 }
 
 static const struct imx93_blk_ctrl_domain_data imx93_media_blk_ctl_domain_data[] = {
@@ -455,7 +448,6 @@ MODULE_DEVICE_TABLE(of, imx93_blk_ctrl_of_match);
 
 static struct platform_driver imx93_blk_ctrl_driver = {
 	.probe = imx93_blk_ctrl_probe,
-	.remove = imx93_blk_ctrl_remove,
 	.driver = {
 		.name = "imx93-blk-ctrl",
 		.of_match_table = imx93_blk_ctrl_of_match,

-- 
2.47.3


