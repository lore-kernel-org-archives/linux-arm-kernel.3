Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD655C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 17:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciRO7qdgc6SP2XTdRh18i+0iJ9FE+yjAHMx1vxl8usY=; b=seP6r0YtvnXd1JJZnhq3E3nCel
	9BHpXN6gJUOkRDcLR78xW43dpA3MTHSOLbWpv/5R3KBGKYdB6LMv5EW74z0rlsfVFPFvOtIu28KY1
	zUHo+YTL2taZJplNFXMALjBXuB9mjrSjqhKCtJ5r0knVmxAa8ND90ZsE9HDj2zXaRlMcAK4soISvN
	6uRYvdI65eAeg1YVGHgPGbg/1/yODmTma4x650vKqkMxocHCS56s4nTC87zpCiPVKACwj4t1v8nq3
	Be5QSto2zsxbsCGWfGXNN2WeUybOhHHzRyseDwJdugY0NoDlplRvDxM0jyeIq0ZGwDHr87BIb35bK
	4dmxstPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4iMP-0000000F2ye-25o9;
	Thu, 10 Sep 2026 17:14:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4iMM-0000000F2xX-2rCG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 17:14:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA1EE60202;
	Thu, 10 Sep 2026 17:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EF81F00893;
	Thu, 10 Sep 2026 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789060489;
	bh=ciRO7qdgc6SP2XTdRh18i+0iJ9FE+yjAHMx1vxl8usY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UNTq1RhnIqHEQo0B4aHWFznXu75naAp4HXa9wkBR2PhQjLkYaXsPi9rAVGoiXbmO9
	 U61lDFHviNcBRlO2qR1/q5dakrayHWrB6mlYv2EIOR5kIRDmVzWT8B+CsgrLCZBaUG
	 pp++JqkC/sKArvE2cDDZ/MA8zxxf9gxnjtItbUdq+peUfWNCLls+n56UTD5tnOk3wJ
	 wTRzO6rdOhYLkynNYOz8/LjlWcbWDxQcUILGn5O2hsYpp1UhUixtwi2katgBHmSLjZ
	 RHt/tyIAfqhVzVElA7jfW4aAncDJToHiI3WGJMzIW8Nhq1bgEAxpTLQ0Yf/7wpZgmf
	 aQlafbeyamt0w==
From: Niklas Cassel <cassel@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Tejun Heo <tj@kernel.org>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Lee Jones <lee@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ide@vger.kernel.org
Subject: [PATCH v4 1/5] ata: ahci_st: Assert the power down reset in the probe() error path
Date: Thu, 10 Sep 2026 19:14:07 +0200
Message-ID: <20260910171406.131211-8-cassel@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910171406.131211-7-cassel@kernel.org>
References: <20260910171406.131211-7-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3370; i=cassel@kernel.org; h=from:subject; bh=fKTOtmPUPP2FufuVHDtWL32druhZuLX+4RkIhmDA6VY=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLIWPc3gbFq+w5j9X7jUad8mt//vBX7FTrrVVST2N+PA0 mvvQw1udZSyMIhxMciKKbL4/nDZX9ztPuW44h0bmDmsTCBDGLg4BWAia14yMjw0v/Lz9FuXQH9t nb0nOies3f4vcuWzqfoRzR/c7/axnY5hZFgrbjmPs1Gy0UPjwZH3Ko+WeX3562nUZ37FyzJN6yd rJRsA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
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

st_ahci_probe_resets() deasserts the "pwr-dwn" reset, but the probe()
error path of st_ahci_probe() only releases the host resources, so the
SATA IP is left powered up when probe() fails after
st_ahci_probe_resets() has succeeded, e.g. when
ahci_platform_enable_resources() fails.

The reset is asserted by st_ahci_host_stop(), however ->host_stop() is
only called through the ata_host_stop() devres action registered by
ata_host_start(), so it does not cover any failure happening before the
host has been started.

Factor the assert out into st_ahci_assert_pwrdwn() and call it from both
probe() error paths. The "pwr-dwn" reset control is an exclusive one, so
asserting it once more from st_ahci_host_stop() is harmless.

No functional change intended for ->host_stop() and st_ahci_suspend().

Fixes: 76884cb2f7da ("ahci: st: Add support for ST's SATA IP")
Cc: stable@vger.kernel.org
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/ata/ahci_st.c | 51 +++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
index 4336c8a6e208..39ebedf93344 100644
--- a/drivers/ata/ahci_st.c
+++ b/drivers/ata/ahci_st.c
@@ -83,18 +83,27 @@ static int st_ahci_deassert_resets(struct ahci_host_priv *hpriv,
 	return 0;
 }
 
-static void st_ahci_host_stop(struct ata_host *host)
+static int st_ahci_assert_pwrdwn(struct ahci_host_priv *hpriv,
+				 struct device *dev)
 {
-	struct ahci_host_priv *hpriv = host->private_data;
 	struct st_ahci_drv_data *drv_data = hpriv->plat_data;
-	struct device *dev = host->dev;
 	int err;
 
-	if (drv_data->pwr) {
-		err = reset_control_assert(drv_data->pwr);
-		if (err)
-			dev_err(dev, "unable to pwrdwn\n");
-	}
+	if (!drv_data->pwr)
+		return 0;
+
+	err = reset_control_assert(drv_data->pwr);
+	if (err)
+		dev_err(dev, "unable to pwrdwn\n");
+
+	return err;
+}
+
+static void st_ahci_host_stop(struct ata_host *host)
+{
+	struct ahci_host_priv *hpriv = host->private_data;
+
+	st_ahci_assert_pwrdwn(hpriv, host->dev);
 
 	ahci_platform_disable_resources(hpriv);
 }
@@ -162,38 +171,38 @@ static int st_ahci_probe(struct platform_device *pdev)
 
 	err = ahci_platform_enable_resources(hpriv);
 	if (err)
-		return err;
+		goto assert_pwrdwn;
 
 	st_ahci_configure_oob(hpriv->mmio);
 
 	err = ahci_platform_init_host(pdev, hpriv, &st_ahci_port_info,
 				      &ahci_platform_sht);
-	if (err) {
-		ahci_platform_disable_resources(hpriv);
-		return err;
-	}
+	if (err)
+		goto disable_resources;
 
 	return 0;
+
+disable_resources:
+	ahci_platform_disable_resources(hpriv);
+assert_pwrdwn:
+	st_ahci_assert_pwrdwn(hpriv, &pdev->dev);
+
+	return err;
 }
 
 static int st_ahci_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
 	struct ahci_host_priv *hpriv = host->private_data;
-	struct st_ahci_drv_data *drv_data = hpriv->plat_data;
 	int err;
 
 	err = ahci_platform_suspend_host(dev);
 	if (err)
 		return err;
 
-	if (drv_data->pwr) {
-		err = reset_control_assert(drv_data->pwr);
-		if (err) {
-			dev_err(dev, "unable to pwrdwn");
-			return err;
-		}
-	}
+	err = st_ahci_assert_pwrdwn(hpriv, dev);
+	if (err)
+		return err;
 
 	ahci_platform_disable_resources(hpriv);
 
-- 
2.55.0


