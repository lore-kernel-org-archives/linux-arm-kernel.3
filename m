Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932ECD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 06:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KlMTdh5NpZkgxzKaAcKGoQgRC7nIqBq6Vy1yr/AGVg=; b=LfZgFyOItSRpPBugYU+bMm6aTl
	wjBzcIj8hpTDxPyGFDH9IQ67ibz2/Z5LjgBipe74p5H2REtec7eZdAKT1bFVMM0YzrcVVQCozcFT+
	piOSZfA7C3E6gyDrxVY3vfx9Ahb5lqsPzug4NXV9BlXmsFX58+IFNZJ8WL8CW3M3uAygE22/LoHG6
	Wimg6jqZcnH4liYUU2htif34FqpsEQ/XXNdWyPmqBCa7oGRzAJX8Ta2T0vmuwhEQpUuXmL22XK8PA
	8bwNicxG9H4GrIcX6SL1+uYktnZEJ7qeBCzbed2TPcxqFnij5U/eZ26EKcDv+Cmg4xreDMYzmTGp9
	puEeoeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxPu-00000002yhf-19Tx;
	Mon, 01 Dec 2025 06:29:46 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxPn-00000002yY1-3LNk;
	Mon, 01 Dec 2025 06:29:40 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Dec
 2025 14:29:16 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Dec 2025 14:29:16 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 1 Dec 2025 14:29:15 +0800
Subject: [PATCH v6 5/7] PCI: Add FMT, TYPE and CPL status definition for
 TLP header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251201-upstream_pcie_rc-v6-5-8c8800c56b16@aspeedtech.com>
References: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
In-Reply-To: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764570556; l=1690;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=/twL2B0Pnt+j9loTcmUqQd/0tnO4Dsh0qXF90ASTQ3c=;
 b=S1f2Bl/VlL3nz8Tm8pL4k6a9p3j+uTpa098bKvGFkGlGoxMbOSLz4oMLK30DeIBuZfF4mMBdq
 rhgNzaXtU8NA7mYmETdc9ncKJ9ic/0JWthuUrQ4WIgayFXCAaINcGME
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_222939_841070_42E567C9 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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

According to PCIe specification, add FMT, TYPE and CPL status
definition for TLP header.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/pci/pci.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 36f8c0985430..b186f3ea6a78 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -63,6 +63,18 @@ struct pcie_tlp_log;
 #define PCIE_LINK_WAIT_MAX_RETRIES	10
 #define PCIE_LINK_WAIT_SLEEP_MS		90
 
+/* Format of TLP; PCIe r7.0, sec 2.2.1 */
+#define PCIE_TLP_FMT_3DW_NO_DATA	0x00 /* 3DW header, no data */
+#define PCIE_TLP_FMT_4DW_NO_DATA	0x01 /* 4DW header, no data */
+#define PCIE_TLP_FMT_3DW_DATA		0x02 /* 3DW header, with data */
+#define PCIE_TLP_FMT_4DW_DATA		0x03 /* 4DW header, with data */
+
+/* Type of TLP; PCIe r7.0, sec 2.2.1 */
+#define PCIE_TLP_TYPE_CFG0_RD		0x04 /* Config Type 0 Read Request */
+#define PCIE_TLP_TYPE_CFG0_WR		0x04 /* Config Type 0 Write Request */
+#define PCIE_TLP_TYPE_CFG1_RD		0x05 /* Config Type 1 Read Request */
+#define PCIE_TLP_TYPE_CFG1_WR		0x05 /* Config Type 1 Write Request */
+
 /* Message Routing (r[2:0]); PCIe r6.0, sec 2.2.8 */
 #define PCIE_MSG_TYPE_R_RC	0
 #define PCIE_MSG_TYPE_R_ADDR	1
@@ -84,6 +96,9 @@ struct pcie_tlp_log;
 #define PCIE_MSG_CODE_DEASSERT_INTC	0x26
 #define PCIE_MSG_CODE_DEASSERT_INTD	0x27
 
+/* Cpl. status of Complete; PCIe r7.0, sec 2.2.9.1 */
+#define PCIE_CPL_STS_SUCCESS		0x00 /* Successful Completion */
+
 #define PCI_BUS_BRIDGE_IO_WINDOW	0
 #define PCI_BUS_BRIDGE_MEM_WINDOW	1
 #define PCI_BUS_BRIDGE_PREF_MEM_WINDOW	2

-- 
2.34.1


