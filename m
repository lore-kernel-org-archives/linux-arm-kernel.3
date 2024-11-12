Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5610D41D5F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 06:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sX7YiodoPeDSKhYbJ1Y5EqMxoHvu4S+GIOBJqn6nAUU=; b=Sv1HUe+7BAl22Gl+OjKJMyF4K1
	WYT6t7PwEiuBn+UrDsfmwQ2VJosV37mzExoSGfc2JU3FudZaMyhO+K0if+rDgX5/ZI95IZy0pE77a
	4wcMOg5x6r6AIAz99RUXZdx2n4qvNB/bAiiaWbjBbBiGz9DKckhz7YnrHDUdpTQGkTr6XKrAfbBt6
	Vt5MWc+qH8FGjTxU9f+qQCNt4zK9xG0gDWDRldk5aKqwtuJLt+EJ/XLAx46QOp24NbQXN4BbCsu+l
	bBkUNbxXzK9lp2wId50j4vbuwU/ZUa4+4M6wLQMsV3u1127G8ZOSfUaCNq8rxwU/W2ztvvSK2DMtd
	mTyBMKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkjj-00000002NA7-3ltT;
	Tue, 12 Nov 2024 06:50:51 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkcM-00000002MDn-2f6x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 06:43:16 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABGLWwT026372;
	Mon, 11 Nov 2024 22:42:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=sX7YiodoPeDSKhYbJ1Y5EqM
	xoHvu4S+GIOBJqn6nAUU=; b=Asqa4Xh+qL5xuzWkmvhgDcNLlYCF/e9Bi1FPyO6
	ArCk8cuHD0VDVLdLjZ5o6W0+hKUL/U5RnTc46S+Lz08UGFcQPLke6XKLugGm4lNu
	BVA60RIIy9ygmBFkUmU7ZZcNOIX1yvaVx6eaChDv0TyCZAyvPyqkjxEFdeTIrQtj
	JOhDz4AdDTpSW0knuVf63rnj3T1KXzQ7stNsQMlhB0dwqSSsq0wEDN4T++ZKtb1X
	feRTww5CUlo6W21gqY+y8A/j7zjeX8PiYOEURRSVM8NE1xas+K79PLEre06t3XxL
	Nm2p9dCsTNoxnm2IuZQCPKlAafGX0WXkuAXO36ixGTlvCOA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42t84pmj8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 22:42:51 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 22:42:50 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 22:42:50 -0800
Received: from localhost.localdomain (unknown [10.111.135.16])
	by maili.marvell.com (Postfix) with ESMTP id 838463F7079;
	Mon, 11 Nov 2024 22:42:49 -0800 (PST)
From: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
To: <lpieralisi@kernel.org>, <thomas.petazzoni@bootlin.com>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <salee@marvell.com>, <dingwei@marvell.com>,
        Jenishkumar Maheshbhai Patel
	<jpatel2@marvell.com>
Subject: [PATCH 1/1] PCI: armada8k: Disable LTSSM on link down interrupts
Date: Mon, 11 Nov 2024 22:42:41 -0800
Message-ID: <20241112064241.749493-1-jpatel2@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LwPhCRUsieXdHV9l6Uw864Ev4W3g_4qj
X-Proofpoint-GUID: LwPhCRUsieXdHV9l6Uw864Ev4W3g_4qj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_224314_814106_B3ED5E4D 
X-CRM114-Status: GOOD (  13.59  )
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

When a PCI link down condition is detected, the link training state
machine must be disabled immediately.

Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
---
 drivers/pci/controller/dwc/pcie-armada8k.c | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index b5c599ccaacf..07775539b321 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -53,6 +53,10 @@ struct armada8k_pcie {
 #define PCIE_INT_C_ASSERT_MASK		BIT(11)
 #define PCIE_INT_D_ASSERT_MASK		BIT(12)
 
+#define PCIE_GLOBAL_INT_CAUSE2_REG	(PCIE_VENDOR_REGS_OFFSET + 0x24)
+#define PCIE_GLOBAL_INT_MASK2_REG	(PCIE_VENDOR_REGS_OFFSET + 0x28)
+#define PCIE_INT2_PHY_RST_LINK_DOWN	BIT(1)
+
 #define PCIE_ARCACHE_TRC_REG		(PCIE_VENDOR_REGS_OFFSET + 0x50)
 #define PCIE_AWCACHE_TRC_REG		(PCIE_VENDOR_REGS_OFFSET + 0x54)
 #define PCIE_ARUSER_REG			(PCIE_VENDOR_REGS_OFFSET + 0x5C)
@@ -204,6 +208,11 @@ static int armada8k_pcie_host_init(struct dw_pcie_rp *pp)
 	       PCIE_INT_C_ASSERT_MASK | PCIE_INT_D_ASSERT_MASK;
 	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK1_REG, reg);
 
+	/* Also enable link down interrupts */
+	reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG);
+	reg |= PCIE_INT2_PHY_RST_LINK_DOWN;
+	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG, reg);
+
 	return 0;
 }
 
@@ -221,6 +230,35 @@ static irqreturn_t armada8k_pcie_irq_handler(int irq, void *arg)
 	val = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_CAUSE1_REG);
 	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_CAUSE1_REG, val);
 
+	val = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_CAUSE2_REG);
+
+	if (PCIE_INT2_PHY_RST_LINK_DOWN & val) {
+		u32 ctrl_reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_CONTROL_REG);
+		/*
+		 * The link went down. Disable LTSSM immediately. This
+		 * unlocks the root complex config registers. Downstream
+		 * device accesses will return all-Fs
+		 */
+		ctrl_reg &= ~(PCIE_APP_LTSSM_EN);
+		dw_pcie_writel_dbi(pci, PCIE_GLOBAL_CONTROL_REG, ctrl_reg);
+		/*
+		 * Mask link down interrupts. They can be re-enabled once
+		 * the link is retrained.
+		 */
+		ctrl_reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG);
+		ctrl_reg &= ~PCIE_INT2_PHY_RST_LINK_DOWN;
+		dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG, ctrl_reg);
+		/*
+		 * At this point a worker thread can be triggered to
+		 * initiate a link retrain. If link retrains were
+		 * possible, that is.
+		 */
+		dev_dbg(pci->dev, "%s: link went down\n", __func__);
+	}
+
+	/* Now clear the second interrupt cause. */
+	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_CAUSE2_REG, val);
+
 	return IRQ_HANDLED;
 }
 
-- 
2.25.1


