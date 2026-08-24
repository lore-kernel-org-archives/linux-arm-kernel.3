Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9F8C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fD7HDEqAve3vYidUjX8s8f4KzZ+OcpC6vSRwhTvcNpE=; b=GlgzaULfY6W6DLNhXPItRRvrI0
	Y0SIsxRbv0T21QB+tY/ZPNf96sZB66lYgYF3uVpYfHj9sjzgzbKay2C7TPuvYNXh0u0uheDtKlpgG
	k+7iRVcjidt+095QRqduX7tdEZ8sTd2SY6+JtWtTWLggcKtUnMEh4mP58CHyEhNv7mS5v62kuCjKJ
	wfA5nxMcBFhfQY9mlSHm+XaNDOxHRNI5K4rnxq/kwFXf6Oap2Vqb5Cm6cDo+c3Xp/MaAbETfQjAoa
	PeB9jHa8xMrfdb5UFu2aqcZr62D5gIMBirqtm5nnaXFBSa1y39W4udGoIFowUfsjlFsNOTA3CtqKS
	d6KA2sWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPWp-0000000G9x0-3vZn;
	Mon, 24 Aug 2026 07:55:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPWn-0000000G9wT-2xdo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:55:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d560775ca2so25372855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558131; x=1788162931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fD7HDEqAve3vYidUjX8s8f4KzZ+OcpC6vSRwhTvcNpE=;
        b=glAJe3jIRVm8Em24KYFK5emyWvC0Bfsx7S2EuouL7TMH6M+BVFJMOssYM2VBr1Wo1y
         HGQQPprxy9+L3B6W8FE+M1Rg6l5faVcRRNwEP9PVvKt7nqo44msj8G/GcSXRrizjfD0a
         60zfRfSONXtAl9Lem9FdjO6qLp7K4bwMa9N5XusZOJlGqK4mJeJGbeT60mp4AR9MK0Fr
         d52nI0JkGqlarNbvFEkTSMH/XKdXfQMELY8BJ6ZfFNWukPY3V1cahpJn/rH942tQZ9d9
         eoK0wnlDyPLpA9GK5rNFIWHdlm9hHOI2qOIw0qjJ0WwpYOfYlbL31IJMffEQxuuEymdA
         rUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558131; x=1788162931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fD7HDEqAve3vYidUjX8s8f4KzZ+OcpC6vSRwhTvcNpE=;
        b=orSjvnX+aG2d+hOGBjRzKxQ6aRDvTSZzFjOS9yNz8oVHCyyPg1T0N+ADT5VE790d6+
         rdmOX/wC0L2Yd95cC01tioxvqnAIvRxYIV84T0pdFcU/jew8kWrxfN9I4a/dd5IPRR67
         5QW9bsQunwynlJKu5ARXcaI514QbTBery9vTWJLTbFM1vQdhjttkcr5VIEBNW8Ud7+rm
         e4fSj07wjhgGVd/Yl+HFrVz0m5XtKEVvPlkqYTt111At4Q71VL63n/StCFOmRAZ1ovIP
         2TVMl3gAW1AiXEglKHiNya30eD0GGJVCqv16bTCFfUAN2M0ggyR/aRN05hafmRq5uYwi
         8wLA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9Z697eSgzHzkP3l8O9on2gIQ1CzlNIS9kmW7RL/+i0NePdA4yjG7ZskV3nM/qVTh34gaOcVQ0XzDglX7PNF/h@lists.infradead.org
X-Gm-Message-State: AFuF++l3hkuLNb7MsAku4Zcv/WJqGhSOpHNJ3ITMgQut/Vv1Kg2qvAwh
	qKcJpgKWRbCn625TlEg0jwf/MhWdNWO0x2NOv5ySwIrTyCFJsot+NuW6
X-Gm-Gg: AR+sD13RQJtVtd2WmNEvWADEjUjQc29eC6EiIHpqbAtJhWpOXe6rQFDQyAxdlhoF/Qn
	0qHdhfK2oyyAIEUmi4LQp0yEZ5MhpJ+MrROTDgmC5xkiYWTh/9NfKihn7C/4jkg4sb8LBg3yjRN
	TGDfCyeAT7C1cqiCWFyguiH2/veTCCK4Zh/u6OkjZ/aFaeHarvMfPr9JA10inH+yfAfXJNmJwwM
	cL4r0Vkgqb3lbhTd7Qk/7c51+ske/G0qAkrRuQ7ggWWCZGmD72dfC56CtS7Pje+2BPJtSn07iH8
	pTzHBn7iodLudKEUgmcRLVwxUf6E7DoqxVkqTpQ1CeLGFtPQV0Knua0eMFBwDOj5s7q+4PylsLj
	qaEV4yAw+oDkF7btNUmYnW5XenEu09RWBRtD3tkDSzX+GHzhLoomHCgxu/xmyDEkZEFnGc10tUA
	Nq2Tk/WpwqdeIvlMWl1zNCbob9ACfW983avM5FfwyQDTf328QA1r8oyscGt2dLnUTTMo3NKG/fn
	ZdtW+GFQEA0QevXH2UES+PGF29j7AvXs9kk0iRU8Z0aBnZo6Ks3
X-Received: by 2002:a17:902:f70b:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d670d07a21mr311514175ad.13.1787558131477;
        Mon, 24 Aug 2026 00:55:31 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d67679e55bsm14421565ad.30.2026.08.24.00.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:55:31 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH v3] PCI: imx6: fix resource leaks in probe error paths
Date: Mon, 24 Aug 2026 15:55:12 +0800
Message-ID: <20260824075512.3386898-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823071129.2980059-1-hanzhijian1991@gmail.com>
References: <20260823071129.2980059-1-hanzhijian1991@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_005533_855321_0F4B138B 
X-CRM114-Status: GOOD (  19.64  )
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

imx_pcie_probe() leaks both pwrctrl devices and power domains on
failure:

- imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
  and creates device links to them, but the device links are only kept
  in a local variable and nothing detaches the domains on probe failure
  or deferral, so all of them leak.

- A failure of devm_pm_runtime_set_active_enabled() returns directly
  without destroying the pwrctrl devices.

- A partial failure inside imx_pcie_attach_pd() leaks the power domains
  and device links that were already attached.

Save the device links, add imx_pcie_detach_pd() to release the power
domains and device links in reverse order of acquisition, call it from
the probe error paths, and make imx_pcie_attach_pd() release everything
it has attached so far on failure.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 42 ++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..467006d83 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -182,6 +182,9 @@ struct imx_pcie {
 	struct device		*pd_pcie;
 	/* power domain for pcie phy */
 	struct device		*pd_pcie_phy;
+	/* device links for the power domains */
+	struct device_link	*pd_link;
+	struct device_link	*pd_phy_link;
 	struct phy		*phy;
 	const struct imx_pcie_drvdata *drvdata;
 
@@ -639,6 +642,26 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
 }
 #endif
 
+static void imx_pcie_detach_pd(struct imx_pcie *imx_pcie)
+{
+	if (imx_pcie->pd_phy_link) {
+		device_link_del(imx_pcie->pd_phy_link);
+		imx_pcie->pd_phy_link = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie_phy)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie_phy, true);
+		imx_pcie->pd_pcie_phy = NULL;
+	}
+	if (imx_pcie->pd_link) {
+		device_link_del(imx_pcie->pd_link);
+		imx_pcie->pd_link = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie, true);
+		imx_pcie->pd_pcie = NULL;
+	}
+}
+
 static int imx_pcie_attach_pd(struct device *dev)
 {
 	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
@@ -660,12 +683,18 @@ static int imx_pcie_attach_pd(struct device *dev)
 			DL_FLAG_RPM_ACTIVE);
 	if (!link) {
 		dev_err(dev, "Failed to add device_link to pcie pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
+	imx_pcie->pd_link = link;
 
 	imx_pcie->pd_pcie_phy = dev_pm_domain_attach_by_name(dev, "pcie_phy");
-	if (IS_ERR(imx_pcie->pd_pcie_phy))
-		return PTR_ERR(imx_pcie->pd_pcie_phy);
+	if (IS_ERR(imx_pcie->pd_pcie_phy)) {
+		int ret = PTR_ERR(imx_pcie->pd_pcie_phy);
+
+		imx_pcie_detach_pd(imx_pcie);
+		return ret;
+	}
 
 	link = device_link_add(dev, imx_pcie->pd_pcie_phy,
 			DL_FLAG_STATELESS |
@@ -673,8 +702,10 @@ static int imx_pcie_attach_pd(struct device *dev)
 			DL_FLAG_RPM_ACTIVE);
 	if (!link) {
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
+	imx_pcie->pd_phy_link = link;
 
 	return 0;
 }
@@ -1956,8 +1987,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = pci_pwrctrl_create_devices(dev);
-	if (ret)
+	if (ret) {
+		imx_pcie_detach_pd(imx_pcie);
 		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
+	}
 
 	pci->use_parent_dt_ranges = true;
 	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
@@ -1975,7 +2008,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
@@ -2001,6 +2034,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 err_pwrctrl_destroy:
 	if (ret != -EPROBE_DEFER)
 		pci_pwrctrl_destroy_devices(dev);
+	imx_pcie_detach_pd(imx_pcie);
 	return ret;
 }
 
-- 
2.43.0


