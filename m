Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C54D41D61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tNGtlJ859MOStlOAyMOnTuuTvP/WK9GKtzqFV9IHsbk=; b=JV0UzRf1OkgDzUcUhl02nUaJHS
	IFNAxRCAU96jW8VSBB2mkByUC7wToA+ygG8SMjpZdJv/tJuwdmcpVQji3Mf4a51BOBeIioT00g4jS
	RuI/Tw6MIYsY9+hG4fm1kDqBLA0/eRAoJeY0lx1OHvevQ5t8u4dkLDS5ZkelK91yxqXtCvsaa3cnh
	uN6YhgxKGAMjkrZaKMYWE8VgQO7VanAfXJZIxrob52tRQVBFN/EoZWv3R7A5UD37GBpqJBapNo+8R
	mxWzJZawqXF/eUMnhlY/Bnr2MYrp0HIg2tmhocZnVsCWLMnqdC1BWvpWL4x0Ce1mKijpBXIiomBvl
	TWHCPLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAl4r-00000002QiB-2p0F;
	Tue, 12 Nov 2024 07:12:41 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAl0S-00000002Pxk-0deX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:08:09 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABGFCSQ010340;
	Mon, 11 Nov 2024 23:07:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=tNGtlJ859MOStlOAyMOnTuu
	TvP/WK9GKtzqFV9IHsbk=; b=OCKYIpaS37KImCKR/doeRPfVwQUDWp0rpS69Kwv
	+1SKPKgK5AaizvxhWG1m5p9HTU5qdWnHzO/k7hM0JrbDycALrPdY1m9Yusol0zyz
	nt+v6816bLAm+Mwh7DBdH7nOy//HKU7TLTGeBBmZ/GllhMVqH3AkT3JM7nOlwv9S
	DsvwMC3o/cMN+kiNB8D0pi3C9sjqtOwEusZwGoLmwIHwFrsD3akCc3GwxNMzAmrQ
	0AAAH/PW5NZAqnHIgq440AfnqcET4xElkkYnudeJ8XdbAojlox8J6xO81dfsjKCm
	zOyVlv/71tiNvMNWWcAjddXrP9hEnmi3T7c/oPtwA3W/54Q==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42un9d1cf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 23:07:49 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 23:07:48 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 23:07:48 -0800
Received: from localhost.localdomain (unknown [10.111.135.16])
	by maili.marvell.com (Postfix) with ESMTP id 2E4F43F707F;
	Mon, 11 Nov 2024 23:07:48 -0800 (PST)
From: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
To: <lpieralisi@kernel.org>, <thomas.petazzoni@bootlin.com>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <salee@marvell.com>, <dingwei@marvell.com>,
        Jenishkumar Maheshbhai Patel
	<jpatel2@marvell.com>
Subject: [PATCH 1/1] PCI: armada8k: use reset controller to reset mac
Date: Mon, 11 Nov 2024 23:07:45 -0800
Message-ID: <20241112070745.759678-1-jpatel2@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XMOBZNRL9HXZhZ4epaptv3UUDHs_xQIu
X-Proofpoint-ORIG-GUID: XMOBZNRL9HXZhZ4epaptv3UUDHs_xQIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_230808_331492_6E7B50F0 
X-CRM114-Status: GOOD (  15.01  )
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

change mac reset and mac reset bits to reset controller

Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
---
 drivers/pci/controller/dwc/pcie-armada8k.c | 30 +++++++---------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index 9a48ef60be51..f9d6907900d1 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -21,7 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/resource.h>
 #include <linux/of_pci.h>
-#include <linux/mfd/syscon.h>
+#include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/of_gpio.h>
 
@@ -35,11 +35,10 @@ struct armada8k_pcie {
 	struct clk *clk_reg;
 	struct phy *phy[ARMADA8K_PCIE_MAX_LANES];
 	unsigned int phy_count;
-	struct regmap *sysctrl_base;
-	u32 mac_rest_bitmask;
 	struct work_struct recover_link_work;
 	enum of_gpio_flags flags;
 	struct gpio_desc *reset_gpio;
+	struct reset_control *reset;
 };
 
 #define PCIE_VENDOR_REGS_OFFSET		0x8000
@@ -257,12 +256,9 @@ static void armada8k_pcie_recover_link(struct work_struct *ws)
 	msleep(100);
 
 	/* Reset mac */
-	regmap_update_bits_base(pcie->sysctrl_base, UNIT_SOFT_RESET_CONFIG_REG,
-				pcie->mac_rest_bitmask, 0, NULL, false, true);
+	reset_control_assert(pcie->reset);
 	udelay(1);
-	regmap_update_bits_base(pcie->sysctrl_base, UNIT_SOFT_RESET_CONFIG_REG,
-				pcie->mac_rest_bitmask, pcie->mac_rest_bitmask,
-				NULL, false, true);
+	reset_control_deassert(pcie->reset);
 	udelay(1);
 
 	ret = dw_pcie_setup_rc(pp);
@@ -331,7 +327,7 @@ static irqreturn_t armada8k_pcie_irq_handler(int irq, void *arg)
 		 * initiate a link retrain. If link retrains were
 		 * possible, that is.
 		 */
-		if (pcie->sysctrl_base && pcie->mac_rest_bitmask)
+		if (pcie->reset)
 			schedule_work(&pcie->recover_link_work);
 
 		dev_dbg(pci->dev, "%s: link went down\n", __func__);
@@ -440,18 +436,10 @@ static int armada8k_pcie_probe(struct platform_device *pdev)
 	if (gpio_is_valid(reset_gpio))
 		pcie->reset_gpio = gpio_to_desc(reset_gpio);
 
-	pcie->sysctrl_base = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-						       "marvell,system-controller");
-	if (IS_ERR(pcie->sysctrl_base)) {
-		dev_warn(dev, "failed to find marvell,system-controller\n");
-		pcie->sysctrl_base = 0x0;
-	}
-
-	ret = of_property_read_u32(pdev->dev.of_node, "marvell,mac-reset-bit-mask",
-				   &pcie->mac_rest_bitmask);
-	if (ret < 0) {
-		dev_warn(dev, "couldn't find mac reset bit mask: %d\n", ret);
-		pcie->mac_rest_bitmask = 0x0;
+	pcie->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(pcie->reset)) {
+		dev_warn(dev, "failed to find mac reset\n");
+		pcie->reset = 0x0;
 	}
 	ret = armada8k_pcie_setup_phys(pcie);
 	if (ret)
-- 
2.25.1


