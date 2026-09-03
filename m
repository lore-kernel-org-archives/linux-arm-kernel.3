Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404ABC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=297pUGyvgajMiDzKmtW40WgWCQM+NoQo+Lf6H7vbyHA=; b=2kmULmXPXBky3fji56iUM0+D26
	L9zQCUKA22n52c96NVZa4t5RjYkFzibU/hvAyiOqvlVaK3aBml31dHP23/jnF/AGWmuVqvU70gJvU
	ag2ReQKpAlL/LC/y9Kw5pKCMYUaKGXfrDr+rPVxHp8lTYF87qLWhSHpr672hqup3Z0i0nOi99HXs0
	McGl5R7wg4lqlg4paV4X4DQT74EqbempiVz8dorrlncqX/kO8PYzjHlVVyl+ICOszjccbNM5lKm5l
	iymYH/Hfn3MwAGQUqbYsc5B7XXSWoRVyJ7oY1xZLzqgpgyfM9mIZqhBd/7HWI9qZxXPn9au9HZeCP
	wLLzi7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29v4-000000004gX-1to0;
	Thu, 03 Sep 2026 16:04:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29v1-000000004gB-3idS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:04:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso28726185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451443; x=1789056243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=297pUGyvgajMiDzKmtW40WgWCQM+NoQo+Lf6H7vbyHA=;
        b=KOIwvFkFdZIClLaxP6kFXoc2FE7Bqcz6l9VaJQRTDwsyeTKsgq+zydWcebABnlFlv3
         jfIu9cKepgPySPrQoPhvLpptZXcqXjgVnfhiYZlTF/PcMcei6u+3ZvxKKWFPDufPsKL5
         8XPZBKGva5Lie2U9iEoVKQ0UBk645fDpjfB4OHVENNjy8zjrOvzB7YL9tQChcJfuAzMl
         2azW3xf75ubSlCISV8YS7AuzL9NAupvJDW2YeuCmTNm6Ma/c3DhgLDpiHiaOmOXC2FAB
         XSZdeTEe9dTO8Y/RLj4LQC4Adlt0xPYpaj+6Ib0JcJqxunaq0uIebpmhRktuP9JFSeRY
         3EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451443; x=1789056243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=297pUGyvgajMiDzKmtW40WgWCQM+NoQo+Lf6H7vbyHA=;
        b=ATuEKMRiksMP8UQv/SRoU4ZV1Lk5akgLVl1sj0tGCLcBLgfG7byBVyC5tbAEykPw9i
         7zdfuq565XUDksGRMckMy/sbsJvoMksRWdH0sOcEgJjdg9iem8SLtXkSW91wTQ9H9ODw
         +2T3Vfy9qKpld6AGG0tetWgm82lnkgcTOuwWzFtf/3Xtz7i6S43aSlWIuRNohTc0W3/f
         1e2/zYCATDKFCDzSvstJu4fTNdAV1LYIFyHMYJ3v4YfWfNV9Zbuy9l1LR2cNvQX3uMgY
         tdof4U1wMDJCoCPyq1r2uGUrRFJ+WgyQb2tS7zQTHdDgsl59SShPa8jFnDVqDPkyZQ06
         foBA==
X-Forwarded-Encrypted: i=1; AKwUvBx5LGpvXR3Gx5xH+BBJgnqa3+B9XGWOfE8Iu6yXFKZxbfyiRcxOTxBVW09b6j7dW9vgRyVwn2VlHjvYxzU2qd/v@lists.infradead.org
X-Gm-Message-State: AFuF++nEqK4cQ7QZh+VSZeC6n8orXD33Qzt7a7fqxI2oBPyEY0u53wxJ
	n8Xrey42Rn62q8+wEqrI7HI+huISOpb+VE97KRnnHtqHXM2P7guUx1r/xXuoWLQN
X-Gm-Gg: AYBFou1ZlBNInbMbtTP/PlU1Li4N4LBZ083CsF27PSL2yKJ5ZNMTo7blj0VJ8qF4lBM
	No9X76utni3YTy5otWNuBJYF6+ejFV/4kZFZP1fKhgFa/lZRoWYghoskIoqNk7hnodYxOa56UZI
	hZLyWnZ1p1YtuibeqmOR2tNB5DT43+Kk2xKnnlkCytX8zZ0wse51zV6mipcuCloUMAMbCNYfe2U
	7DAj6qqEDz5Gd/1mwSIfrMLknRnGjuutYIwQh3Sd+70aeMmn1GTw3UaWkx2vWQko+h/WLMC/6Q8
	M8XFKZ4WT5NZQy+WczdM4/p3QhwYP85f5Qj/w6VwdiRTbqyzVrTd5lyOetWafCkb/UZvbZeyu7y
	GcZfanq7e044B9iDK2HGOMQAy6ho16231Ue34nM9Vx3tlMmwvvuIGdqi3cVcScdBo5nXoOxUdO9
	+DM9cx4ufocrFMun9M/NMmfiLaCe1PpockNWBy51XobD8WEi+JJxQgJVHip52wOog/T47uzTov+
	eUjvPANHdM7KDuFeb/LEWuAcRr6Dllp+gDtWKWlxMxJXI78l89M
X-Received: by 2002:a17:903:22d0:b0:2d8:d4ce:7e40 with SMTP id d9443c01a7336-2db12674f20mr124645ad.21.1788451442696;
        Thu, 03 Sep 2026 09:04:02 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62dbc7sm12815615ad.28.2026.09.03.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:04:02 -0700 (PDT)
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
Subject: [PATCH v6] PCI: imx6: fix resource leaks in probe error paths
Date: Fri,  4 Sep 2026 00:03:42 +0800
Message-ID: <20260903160342.3282199-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090403_928231_DC5F6F97 
X-CRM114-Status: GOOD (  20.24  )
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
Changes in v6:
- Keep the device links stateless and remove them with device_link_del()
  in imx_pcie_detach_pd() instead of using DL_FLAG_AUTOREMOVE_CONSUMER,
  which creates managed links to power-domain devices that never bind a
  driver and would trigger a WARN_ON in device_links_driver_bound()

Changes in v5:
- Register imx_pcie_detach_pd() with devm_add_action_or_reset() instead
  of calling it manually on the error paths

 drivers/pci/controller/dwc/pci-imx6.c | 58 ++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b98d..7dd22b4f826a 100644
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
@@ -654,25 +682,31 @@ static int imx_pcie_attach_pd(struct device *dev)
 	/* Do nothing when power domain missing */
 	if (!imx_pcie->pd_pcie)
 		return 0;
-	link = device_link_add(dev, imx_pcie->pd_pcie,
-			DL_FLAG_STATELESS |
+	imx_pcie->pd_link = device_link_add(dev, imx_pcie->pd_pcie,
+					    DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
 			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	if (!imx_pcie->pd_link) {
 		dev_err(dev, "Failed to add device_link to pcie pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
 
 	imx_pcie->pd_pcie_phy = dev_pm_domain_attach_by_name(dev, "pcie_phy");
-	if (IS_ERR(imx_pcie->pd_pcie_phy))
-		return PTR_ERR(imx_pcie->pd_pcie_phy);
+	if (IS_ERR(imx_pcie->pd_pcie_phy)) {
+		int ret = PTR_ERR(imx_pcie->pd_pcie_phy);
+
+		imx_pcie_detach_pd(imx_pcie);
+		return ret;
+	}
 
-	link = device_link_add(dev, imx_pcie->pd_pcie_phy,
-			DL_FLAG_STATELESS |
+	imx_pcie->pd_phy_link = device_link_add(dev, imx_pcie->pd_pcie_phy,
+						DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
 			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	if (!imx_pcie->pd_phy_link) {
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
 
@@ -1955,6 +1989,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, imx_pcie_detach_pd_action, imx_pcie);
+	if (ret)
+		return ret;
+
 	ret = pci_pwrctrl_create_devices(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
@@ -1975,7 +2013,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))

