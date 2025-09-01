Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50189CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 06:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEHxIRg5KoyOMUOBjzoPYO8CD82MLQnA7sccq0XwXJ4=; b=kcILygG2Ess3IxYWNAdMFGSw+5
	LABIZdC38A1OxOSQuKGvBOQfgYW/BVa1V0Ka95csOLP07Va61UBpfiqbNdEYtm6imkMq/PselZ3kH
	KZFG8LLptRpqjxq84HM+PrVBmCH1KbrjQPEUxoUJ/wdTPu71tyGezO8+nQzv1HAS2x+blgyXdckeV
	rNFR6ckMlJQE93Px+gncNWL2VgR53g9rNxV2mXbQGFAgcxYUuA2bb5gl2Ktcf/pT/tdQRonsUyemD
	HDPQ3ru1E8VvmHs7V/vaKbUeCSqiO92wnYV8bnIoiDC18v5X+6S3OIGqg6tkQyTrZOmJDfWhCJr0I
	/qe7kzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyAt-0000000BLWc-005r;
	Mon, 01 Sep 2025 06:37:55 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxZr-0000000BGBM-20g5;
	Mon, 01 Sep 2025 05:59:40 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Sep
 2025 13:59:23 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Sep 2025 13:59:23 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bhelgaas@google.com>,
	<lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v3 08/10] PCI: Add FMT and TYPE definition for TLP header
Date: Mon, 1 Sep 2025 13:59:20 +0800
Message-ID: <20250901055922.1553550-9-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_225939_520892_C81F4C08 
X-CRM114-Status: UNSURE (   6.82  )
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

According to PCIe specification, add FMT and TYPE definition
for TLP header.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/pci/pci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 34f65d69662e..45d47d6c4f53 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -81,6 +81,18 @@ struct pcie_tlp_log;
 #define PCIE_MSG_CODE_DEASSERT_INTC	0x26
 #define PCIE_MSG_CODE_DEASSERT_INTD	0x27
 
+/* Format of TLP; PCIe r5.0, sec 2.2.1 */
+#define PCIE_TLP_FMT_3DW_NO_DATA	0x00 /* 3DW header, no data */
+#define PCIE_TLP_FMT_4DW_NO_DATA	0x01 /* 4DW header, no data */
+#define PCIE_TLP_FMT_3DW_DATA		0x02 /* 3DW header, with data */
+#define PCIE_TLP_FMT_4DW_DATA		0x03 /* 4DW header, with data */
+
+/* Type of TLP; PCIe r5.0, sec 2.2.1 */
+#define PCIE_TLP_TYPE_CFG0_RD		0x04 /* Config Type 0 Read Request */
+#define PCIE_TLP_TYPE_CFG0_WR		0x04 /* Config Type 0 Write Request */
+#define PCIE_TLP_TYPE_CFG1_RD		0x05 /* Config Type 1 Read Request */
+#define PCIE_TLP_TYPE_CFG1_WR		0x05 /* Config Type 1 Write Request */
+
 extern const unsigned char pcie_link_speed[];
 extern bool pci_early_dump;
 
-- 
2.43.0


