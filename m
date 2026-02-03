Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE37E7FDFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 00:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laRHeOIKWBINYMn3qvuMftaW9eLnbEEB751RyH28DIA=; b=siXLhBWooFSlrXQ3SClTX9rxW/
	qD9gJw/ZMXngXpKRV4CClh3TyTFtFKqB3TKUz5ZvtyTQ3eS4j4H/6mFATPWZgt9rUzi3hkB0SDY17
	4SSFruI+fjmFwchrdfNOny22g1ISmT6yPQrKKykDb6gyEGLfMDDbdO8SnTCqY+mQAo0ws8bpnIw0f
	bW6+Xrwwke7kkX2o+mEq99gQ8p+aVXX3bWZZ94drk2q1/qrr/OmHi9o/oHoZFeJrZcyIUaHOgGnEb
	vl3SOWCmN7rtbJvCIFuTbUU5gUx58onVjKmgkcLvUjoe7VJKBiPEq/yVYHq2BPkz3oYW4Zb3HEDMJ
	ox+tcLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4BA-00000005mtI-1gJO;
	Tue, 03 Feb 2026 00:22:04 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4B7-00000005mno-1qSY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 00:22:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770078119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laRHeOIKWBINYMn3qvuMftaW9eLnbEEB751RyH28DIA=;
	b=pq/G6vrUF2wQiZrQQ84P8h0KwT8wQUphdD0RU8p1qs+uyy5ypWBM86wvEfzZ/2qQYD1KH+
	JzKVID4tFVYI7nFX7znWyF2/tZuQ0+6OjcHzlEby7U3VU5xEE6QK0nQB9rja125CvoSUfO
	UXb5Vj4iRnI8Yj4tIw5PC5Z5BJ5Bidg=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 6/8] PCI: xilinx-nwl: Split phy_init from phy_power_on
Date: Mon,  2 Feb 2026 19:21:26 -0500
Message-Id: <20260203002128.935842-7-sean.anderson@linux.dev>
In-Reply-To: <20260203002128.935842-1-sean.anderson@linux.dev>
References: <20260203002128.935842-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_162201_758637_F75509D5 
X-CRM114-Status: GOOD (  14.81  )
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

In preparation for reset support, split phy_init from phy_power_on. The
former must be performed while the controller is in reset, while the
latter must be performed while the controller is not in reset.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/pci/controller/pcie-xilinx-nwl.c | 78 +++++++++++++-----------
 1 file changed, 43 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index 7db2c96c6cec..7cfdc21e6f40 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -517,56 +517,55 @@ static int nwl_pcie_init_msi_irq_domain(struct nwl_pcie *pcie)
 
 static void nwl_pcie_phy_power_off(struct nwl_pcie *pcie, int i)
 {
-	int err = phy_power_off(pcie->phy[i]);
+	while (i--) {
+		int err = phy_power_off(pcie->phy[i]);
 
-	if (err)
-		dev_err(pcie->dev, "could not power off phy %d (err=%d)\n", i,
-			err);
+		if (err)
+			dev_err(pcie->dev,
+				"could not power off phy %d (err=%d)\n", i,
+				err);
+	}
 }
 
 static void nwl_pcie_phy_exit(struct nwl_pcie *pcie, int i)
 {
-	int err = phy_exit(pcie->phy[i]);
+	while (i--) {
+		int err = phy_exit(pcie->phy[i]);
 
-	if (err)
-		dev_err(pcie->dev, "could not exit phy %d (err=%d)\n", i, err);
+		if (err)
+			dev_err(pcie->dev, "could not exit phy %d (err=%d)\n",
+				i, err);
+	}
 }
 
-static int nwl_pcie_phy_enable(struct nwl_pcie *pcie)
+static int nwl_pcie_phy_init(struct nwl_pcie *pcie)
 {
 	int i, ret;
 
-	for (i = 0; i < ARRAY_SIZE(pcie->phy); i++) {
+	for (i = ARRAY_SIZE(pcie->phy) - 1; i >= 0; i--) {
 		ret = phy_init(pcie->phy[i]);
-		if (ret)
-			goto err;
-
-		ret = phy_power_on(pcie->phy[i]);
 		if (ret) {
 			nwl_pcie_phy_exit(pcie, i);
-			goto err;
+			return ret;
 		}
 	}
 
 	return 0;
-
-err:
-	while (i--) {
-		nwl_pcie_phy_power_off(pcie, i);
-		nwl_pcie_phy_exit(pcie, i);
-	}
-
-	return ret;
 }
 
-static void nwl_pcie_phy_disable(struct nwl_pcie *pcie)
+static int nwl_pcie_phy_power_on(struct nwl_pcie *pcie)
 {
-	int i;
+	int i, ret;
 
-	for (i = ARRAY_SIZE(pcie->phy); i--;) {
-		nwl_pcie_phy_power_off(pcie, i);
-		nwl_pcie_phy_exit(pcie, i);
+	for (i = ARRAY_SIZE(pcie->phy) - 1; i >= 0; i--) {
+		ret = phy_power_on(pcie->phy[i]);
+		if (ret) {
+			nwl_pcie_phy_power_off(pcie, i);
+			return ret;
+		}
 	}
+
+	return 0;
 }
 
 static int nwl_pcie_init_irq_domain(struct nwl_pcie *pcie)
@@ -859,22 +858,28 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = nwl_pcie_phy_enable(pcie);
+	err = nwl_pcie_phy_init(pcie);
 	if (err) {
-		dev_err(dev, "could not enable PHYs\n");
+		dev_err(dev, "could not init PHYs\n");
 		goto err_clk;
 	}
 
+	err = nwl_pcie_phy_power_on(pcie);
+	if (err) {
+		dev_err(dev, "could not power on PHYs\n");
+		goto err_phy_init;
+	}
+
 	err = nwl_pcie_bridge_init(pcie);
 	if (err) {
 		dev_err(dev, "HW Initialization failed\n");
-		goto err_phy;
+		goto err_phy_power;
 	}
 
 	err = nwl_pcie_init_irq_domain(pcie);
 	if (err) {
 		dev_err(dev, "Failed creating IRQ Domain\n");
-		goto err_phy;
+		goto err_phy_power;
 	}
 
 	bridge->sysdata = pcie;
@@ -884,7 +889,7 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 		err = nwl_pcie_enable_msi(pcie);
 		if (err < 0) {
 			dev_err(dev, "failed to enable MSI support: %d\n", err);
-			goto err_phy;
+			goto err_phy_power;
 		}
 	}
 
@@ -892,8 +897,10 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 	if (!err)
 		return 0;
 
-err_phy:
-	nwl_pcie_phy_disable(pcie);
+err_phy_power:
+	nwl_pcie_phy_power_off(pcie, ARRAY_SIZE(pcie->phy));
+err_phy_init:
+	nwl_pcie_phy_exit(pcie, ARRAY_SIZE(pcie->phy));
 err_clk:
 	clk_disable_unprepare(pcie->clk);
 	return err;
@@ -903,7 +910,8 @@ static void nwl_pcie_remove(struct platform_device *pdev)
 {
 	struct nwl_pcie *pcie = platform_get_drvdata(pdev);
 
-	nwl_pcie_phy_disable(pcie);
+	nwl_pcie_phy_power_off(pcie, ARRAY_SIZE(pcie->phy));
+	nwl_pcie_phy_exit(pcie, ARRAY_SIZE(pcie->phy));
 	clk_disable_unprepare(pcie->clk);
 }
 
-- 
2.35.1.1320.gc452695387.dirty


