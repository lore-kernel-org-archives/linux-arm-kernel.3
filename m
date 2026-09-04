Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FE4C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 01:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Agf6KzSE2M9rfW3DTQHxsj+kTxob2VTdMv9WkSeHlI0=; b=oqB34T2FSZlS6xV63FJG2v4k6V
	9EnYceCGMIHkJg5yr4+OAM9tEPHCzYdcjnYIbYhI/Maft0UOppjRDYI8PnNGvPZUKq0vpp6ENL+TS
	fzrtgLHHbfalAtyJ8e7qgDZXVgJ7moNTZY9Sk7D5ZuCUsguvJ263QDzqNdk1vyAoOYbIuYlL1zrR/
	SC2OLCj7UZFL4fWCAyBrER4fotDapbhiGlnHAAKnsP1zB6w2NDC5Mz8oPqeb6sWCLNo3sHV6JE3Qy
	sZAfG6JqqLTyQCOyXloVUU5KdTPpjzvnGsM1B8T6smYgHGjSSmyH01aBPl1OYMM0iOcQs6N/2vrEO
	ydZSNFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2IeU-00000000qPo-1O4g;
	Fri, 04 Sep 2026 01:23:34 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2IeR-00000000qPQ-23eq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 01:23:32 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so461670a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788485010; x=1789089810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Agf6KzSE2M9rfW3DTQHxsj+kTxob2VTdMv9WkSeHlI0=;
        b=psZ4BF+8lOIjJ9aTNBg5Il/Sp10gmQNo7hnagU3xPleGf1+Bv0gaLxnNTpnAk6ySlf
         g0UyPC1gMTuqP8WBFTjVsO2hSdzn5ka85iOr/ySLl5+SQaBPNX/fXSqvuVuwoxqOqiae
         CPrEIruv3qDXMUKtnX2cSgx9bXRwG3QQHkMHKq8JL2S43ljh0Zz41K2bmoCHjGG826Xg
         Hakrx4oRHJJDtlrFb+7JfvIYNCGK/PKcfTqyHUoPHkKaVEQsFQX3NBRT864SqjZQPYFo
         raYinCzD97dHO8iujvqlNAcWw2WOuqP7iLZPp7qMiBsAeEskvaIjbgna9lyh+RtFeUKU
         Vz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485010; x=1789089810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Agf6KzSE2M9rfW3DTQHxsj+kTxob2VTdMv9WkSeHlI0=;
        b=f6RGPjRHQpv93vfhtRaUPotZ0nL6dGd9Ce9k6aWTx4Ste4AXIkQ5iEWTLe8YAGUcDZ
         x0Nrhbrdb+2LMWTq6xAjgsVeGA3/pRZBCUlC/LVXzWgvsJtKqWXXZiMynKLfzW03O7/G
         y3YwP9+NEq49L6eC5mLRPRK1lE0MdxuZvtlIZvQ2HhF1zGqA1x7pvsQhZCv3uxcrtRy0
         x9nCbWNOYj+AeHW87s7yV7UsHTj5LGa8K0l+5MHwPqeNpJmS7JuoseIn3Yja0g49ZPIE
         UsFh4pOrMObLh+U+275FdKKN8wbP1eLPPt1+fnSG53r4QnamFZzjQk+0u06jRP5Ji9Y7
         FJYA==
X-Forwarded-Encrypted: i=1; AKwUvBz9Cz84C9xm63kV3IApHvkqk+RBnoJvr+I822vstj4pAUGtHhAXCxUeGiTgMFZY0as5jhx9sTjNXQ3mqJlSb9+D@lists.infradead.org
X-Gm-Message-State: AFuF++k6Du6etkYy37bmEJXl7wv6fjnlCBJ7TWzbKKeWY0kWZx1tDOqg
	yMdQgqblKN+7D4IFspVSoYaDCOGZwy1b+7wG/4cH2rIlQ9pUQFzf0yNP/3SKU17e
X-Gm-Gg: AYBFou0f8ElXAY216LsfgaRK23cgDP2CxGFv/qVj6ux5G/sV4hy5xYnp131DZjrvh/h
	viP+Y5QWYmNKfsRAr0xhNLTJTZXnppP/kefsKgGjASux8CEKXlOQmO4aHU3Kj3N8g5Hag+9m8/S
	Qe3/cdkjUgRc3jTukkIymAEXPVXAsyCzn21Uy+AfAaaJ7GobL9q1rSjcNeOBe31ZyNQSHvGw3FJ
	GrkG1FhMDRGwiPPkwoHhLPyozjZoTfgCVYMymTQtqqwAfqHX6Qljvl5afDZR6/dDmWwnWaWydZp
	3rW4yU1AFWbP45UP4Q4O57iyMDuwZSMGnJYTcek57V3KBV9GPHaS1wNbtaldy3v2XeMhG5X3ugN
	atpqiRLZQfXNvhjvkroBSaduUEvtDYfVgQzE1/tIk8fgZyP+LWJsSrNZ5Zgl/XwuWNboqDXA3cw
	KfPr2ucHpndUA0Hewq1U2cbqSE/wt363Iqs+GQWdih3dtLqnSxTD7CIuCZSvCep9GWSDPU0qBgC
	8/hXGNloNbEgpTtEIDNvI2jvvwl95sWpibPgevwspARDbauOESTVAipUcgCeXRmzQ==
X-Received: by 2002:a17:90b:1a8f:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39b2612ed35mr3678175a91.7.1788485009621;
        Thu, 03 Sep 2026 18:23:29 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm1513842a91.11.2026.09.03.18.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:23:29 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: [PATCH v7] PCI: imx6: fix resource leaks in probe error paths
Date: Fri,  4 Sep 2026 09:23:07 +0800
Message-ID: <20260904012307.3434449-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_182331_557605_DA3D8875 
X-CRM114-Status: GOOD (  20.80  )
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

imx_pcie_probe() leaks both pwrctrl devices and power domains on failure:

- imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
  and adds device links to them, but nothing detaches the domains or
  removes the links on probe failure or deferral, so they leak.

- A failure of devm_pm_runtime_set_active_enabled() returns directly
  without destroying the pwrctrl devices.

- A partial failure inside imx_pcie_attach_pd() leaks the power domains
  that were already attached.

Add imx_pcie_detach_pd() to remove the device links and detach the power
domains in reverse order of acquisition and register it with
devm_add_action_or_reset() so they are released automatically on probe
failure.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Fixes: 2c5768344f88 ("PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()")
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
Changes in v7:
- Register the devm action before imx_pcie_attach_pd() and drop the
  imx_pcie_detach_pd() calls from its error paths, since the devm
  action already tears everything down on probe failure

Changes in v6:
- Keep the device links stateless and remove them with device_link_del()
  in imx_pcie_detach_pd() instead of using DL_FLAG_AUTOREMOVE_CONSUMER,
  which creates managed links to power-domain devices that never bind a
  driver and would trigger a WARN_ON in device_links_driver_bound()

Changes in v5:
- Register imx_pcie_detach_pd() with devm_add_action_or_reset() instead
  of calling it manually on the error paths

 drivers/pci/controller/dwc/pci-imx6.c | 56 +++++++++++++++++++++------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b98d..371b2a11d8f5 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -180,8 +180,12 @@ struct imx_pcie {
 	struct imx_lut_data	luts[IMX95_MAX_LUT];
 	/* power domain for pcie */
 	struct device		*pd_pcie;
+	/* device link for pcie power domain */
+	struct device_link	*pd_link;
 	/* power domain for pcie phy */
 	struct device		*pd_pcie_phy;
+	/* device link for pcie phy power domain */
+	struct device_link	*pd_phy_link;
 	struct phy		*phy;
 	const struct imx_pcie_drvdata *drvdata;
 
@@ -639,10 +643,34 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
 }
 #endif
 
+static void imx_pcie_detach_pd(struct imx_pcie *imx_pcie)
+{
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_phy_link)) {
+		device_link_del(imx_pcie->pd_phy_link);
+		imx_pcie->pd_phy_link = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_link)) {
+		device_link_del(imx_pcie->pd_link);
+		imx_pcie->pd_link = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie_phy)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie_phy, true);
+		imx_pcie->pd_pcie_phy = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie, true);
+		imx_pcie->pd_pcie = NULL;
+	}
+}
+
+static void imx_pcie_detach_pd_action(void *data)
+{
+	imx_pcie_detach_pd(data);
+}
+
 static int imx_pcie_attach_pd(struct device *dev)
 {
 	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
-	struct device_link *link;
 
 	/* Do nothing when in a single power domain */
 	if (dev->pm_domain)
@@ -654,11 +682,11 @@ static int imx_pcie_attach_pd(struct device *dev)
 	/* Do nothing when power domain missing */
 	if (!imx_pcie->pd_pcie)
 		return 0;
-	link = device_link_add(dev, imx_pcie->pd_pcie,
-			DL_FLAG_STATELESS |
-			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	imx_pcie->pd_link = device_link_add(dev, imx_pcie->pd_pcie,
+					    DL_FLAG_STATELESS |
+					    DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_RPM_ACTIVE);
+	if (!imx_pcie->pd_link) {
 		dev_err(dev, "Failed to add device_link to pcie pd\n");
 		return -EINVAL;
 	}
@@ -667,11 +695,11 @@ static int imx_pcie_attach_pd(struct device *dev)
 	if (IS_ERR(imx_pcie->pd_pcie_phy))
 		return PTR_ERR(imx_pcie->pd_pcie_phy);
 
-	link = device_link_add(dev, imx_pcie->pd_pcie_phy,
-			DL_FLAG_STATELESS |
-			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	imx_pcie->pd_phy_link = device_link_add(dev, imx_pcie->pd_pcie_phy,
+						DL_FLAG_STATELESS |
+						DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+	if (!imx_pcie->pd_phy_link) {
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
 		return -EINVAL;
 	}
@@ -1951,6 +1979,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imx_pcie);
 
+	ret = devm_add_action_or_reset(dev, imx_pcie_detach_pd_action, imx_pcie);
+	if (ret)
+		return ret;
+
 	ret = imx_pcie_attach_pd(dev);
 	if (ret)
 		return ret;
@@ -1975,7 +2007,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))

