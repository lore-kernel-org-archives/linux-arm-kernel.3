Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF6BC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 07:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpvEmSfetcKu58vemKhIVNLIz2Kr8KQYzNtwaCQIwdM=; b=jtkVO+gxEgmZH9u8U6NhW+6W7f
	Ai5/Dezw8WeTgigN3McHUd7xlS7YmnAdxW0tBfJVpRYOE/x3sdbS4CIIFpV+yvQ/6BxznXSxrpUVp
	d9T2+IaM4N1dW0DlR39tDcXyWbnn9t5kWgDzwoGkpTifx29Mt0D6lZ7U2bkRWo5D5xqC/Vpm2nBM5
	eH1nBBJq00/cwoKTZmKj0MCqMNNEcEwK3trHtp3Irn8uYlfeiZbUPIBp0LOD/NWqzlx/nepoUHbVZ
	sGLtfmHeCCdWtekoI2rHFSGX4D+CmK8qHhMh+OdygGQkczl2lTK9V0NPAwr/S9FezblhIaMTRjRy3
	f9HGDaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy2My-0000000F8O1-1J0B;
	Sun, 23 Aug 2026 07:11:52 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy2Mv-0000000F8Ne-3mWr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 07:11:51 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2797551a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787469109; x=1788073909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpvEmSfetcKu58vemKhIVNLIz2Kr8KQYzNtwaCQIwdM=;
        b=mYxmdbrRedSy6HJwOHbb/Q18TrRRpCA+/sJsdndXT9MyBiZxR+RuqS3caGdFmrlht6
         0QQL9uHGm2+gvm6eAfWpDbIrTFraTcOqLMAxIZDXmAPJ9L05cgFWzh3DFl1w3G8AfemE
         xOxcwG97iLYxU3sWo7fs68G0CkxjRp/g9i+Z4afMfCnSBF/kY9Lghlfp3+LWy0fsyFxI
         cN+ChG+0lsnoZKbfd9Gxbas5tMqebQCuZ0pO8RbEzS48KoK7TXnaIQ/3GxtPHTBQS+YU
         cuehzkRTGAuVQG+/sowxKnduwLqkv+cQXF4AEBaYJ5lQOBlW/hPY+kWktY2bfgCOzYgS
         G0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787469109; x=1788073909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpvEmSfetcKu58vemKhIVNLIz2Kr8KQYzNtwaCQIwdM=;
        b=EzccMsyHUzj+b59wtu3DM/W3VA221cTWZQyLznW4SkQDfiE3/4ZazjU4l53wTKzgMc
         gEFS+9GQmHV/f+vJCIH3sZSBKqRV/4kD1nEa/+h+7AzMdywenphVDEj9RY79gVOga2HE
         Lb5il0sjvQ9OqfTn3Qq5o5rEHYMWmH0yrHhMBOMu5wJ36IkS7KmPTQGdLQLOsGS5ggtq
         1kPsbg9Rrr5ZqX2HOJcvoV5+YYT3x+T/ulxWHGtT+i9nDLvKOox05nxTnCGjHK20AsrJ
         hhktHFLqKk6UpLHQGzInILSXA0kW/RP7NyOF2c8KP0JRmmxpI3qLhAYHElcKTtAPWorj
         5DQg==
X-Forwarded-Encrypted: i=1; AHgh+RqSnVORfqLMYpxBJysTc4c+eQrAwq9DEv7konRr8BFBpQAKhIYllCRDdGOnm3SFXlGNSoAyrVC+jKksUu4x5huj@lists.infradead.org
X-Gm-Message-State: AFuF++lLRLNazC2YXnbFO8h2cduZA+kqrsLt04iX4JOKf4N/GtlDKgMV
	4TQdP51vu1jdbfgJLG0HkUu1rkTwQjXOWZWqFYVKPxEI0R4znoMGNpr6
X-Gm-Gg: AR+sD133NXq/BbYvkZ7B6QVkCF0h8gkulZuvfj0g6XxjNlN4S60lBCL+vZkEvnBoME1
	S4IC2XMshvL47elJIWw5i7+KO8+WyehPE4n2JKA4GP91xALRFjq/VDgKL6H4FJOiUWlVKUnKMT+
	2BuFRH2buVhMq+9BKQEa4tpM16GnvID735TSpfWl+Z5eoXLpi5TkIuhDpiNSOvOKuGCOBXwOH3g
	eiJzdh6Fcyfnt8diY8DJz9ReBl0jCZkBqF6K/xwiYu9oqUksW5R2caPpXwobjHUWZla7gqLssi3
	3wiGizKTWroYwLcY3LixntYUatjs70ZyejcguHty8Hlf67hZ9IQblMglXUiN5EEdrjGjlYHk5JQ
	SztdfIv3wFqF3zqE+60dBqkd1X9zCU2E4NCN8GB7yL+uRxFNewLZ6B+Lo0RhDShVUKnAhQSQqme
	4ObpBdZkhr3J9vXFOJXGX+y8G0BEPelFLC/K5dfBWINeYTZXP9xqTJXfKotdh7QppA1KLY8ds0x
	/ZXtb9hQbQgaRhU7TjTLCW9GUCRnvyT8m78Nm1EQ04Z48yiQtYs
X-Received: by 2002:a05:6a00:a8c:b0:84e:d5e6:a085 with SMTP id d2e1a72fcca58-851f969b7a9mr28112156b3a.0.1787469108569;
        Sun, 23 Aug 2026 00:11:48 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149e77sm1034990b3a.42.2026.08.23.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:11:48 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Subject: [PATCH v2] PCI: imx6: fix resource leaks in probe error paths
Date: Sun, 23 Aug 2026 15:11:28 +0800
Message-ID: <20260823071129.2980059-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823011125.2876504-1-hanzhijian1991@gmail.com>
References: <20260823011125.2876504-1-hanzhijian1991@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_001149_978630_5FC7A83F 
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
index 39790e66b..a2bae4a2c 100644
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
@@ -1999,6 +2032,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 err_pwrctrl_destroy:
+	imx_pcie_detach_pd(imx_pcie);
 	if (ret != -EPROBE_DEFER)
 		pci_pwrctrl_destroy_devices(dev);
 	return ret;
-- 
2.43.0


