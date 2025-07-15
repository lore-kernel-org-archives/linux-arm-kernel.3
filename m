Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB860C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aK01aGUmIPVi7g/grbHmbwBzcBD/ZrD56IJJamDBcTo=; b=SAwJFZuN271A7fQ/1dxPPywkNh
	qvpSJlJLA7Ren0sClbMzzAuJfhFUoDSZEIFI7hxB9GAbqZZhrU0xtkAiT0bC/xdBqXa50q1Rli4Iy
	soUTIVDodTsF/uipMk2NTKfO0l6HASmF8wd8Ph3Y2IKVBwA6Bfdp9jAijnhSDEcUl8zE3kmyYdA+z
	omTIjlj8t0hpBt8xI8F3qNeEx3Rt6p6UxhNai94rQoNct38JbvrHoy9UOTLtMQcx1wCH75Bak6hD7
	jiAExcxlQYE2wPxfp3/EpiQnoOKJp5JihH2HYmbSGL0O9hLjMe9n45RghySohNjxhSLBYm0Sp6aLf
	LLL4N2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXCY-00000004051-3aol;
	Tue, 15 Jul 2025 04:23:34 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWa3-00000003vKr-3Hil
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:43:48 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 11:43:21 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 15 Jul 2025 11:43:21 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linus.walleij@linaro.org>, <p.zabel@pengutronix.de>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
Date: Tue, 15 Jul 2025 11:43:18 +0800
Message-ID: <20250715034320.2553837-9-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_204347_820159_72EE824F 
X-CRM114-Status: UNSURE (   8.24  )
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
for TLP header. And also add macro to combine FMT and TYPE to
1 byte.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 include/uapi/linux/pci_regs.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index a3a3e942dedf..700b915e00f5 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -1230,4 +1230,36 @@
 #define PCI_DVSEC_CXL_PORT_CTL				0x0c
 #define PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR		0x00000001
 
+/* Fmt[2:0] encoding for TLP Header */
+#define PCI_TLP_FMT_3DW_NO_DATA		0x0  // 3DW header, no data
+#define PCI_TLP_FMT_4DW_NO_DATA		0x1  // 4DW header, no data
+#define PCI_TLP_FMT_3DW_DATA		0x2  // 3DW header, with data
+#define PCI_TLP_FMT_4DW_DATA		0x3  // 4DW header, with data
+#define PCI_TLP_FMT_PREFIX		0x4  // Prefix header
+
+/* Type[4:0] encoding for TLP Header */
+#define PCI_TLP_TYPE_MEM_RD		0x00 // Memory Read Request
+#define PCI_TLP_TYPE_MEM_RDLK		0x01 // Memory Read Lock Request
+#define PCI_TLP_TYPE_MEM_WR		0x00 // Memory Write Request (Fmt must be with data)
+#define PCI_TLP_TYPE_IO_RD		0x02 // IO Read Request
+#define PCI_TLP_TYPE_IO_WR		0x02 // IO Write Request (Fmt must be with data)
+#define PCI_TLP_TYPE_CFG0_RD		0x04 // Config Type 0 Read Request
+#define PCI_TLP_TYPE_CFG0_WR		0x04 // Config Type 0 Write Request (Fmt must be with data)
+#define PCI_TLP_TYPE_CFG1_RD		0x05 // Config Type 1 Read Request
+#define PCI_TLP_TYPE_CFG1_WR		0x05 // Config Type 1 Write Request (Fmt must be with data)
+#define PCI_TLP_TYPE_MSG		0x10 // Message Request (see routing field)
+#define PCI_TLP_TYPE_MSGD		0x11 // Message Request with Data (see routing field)
+#define PCI_TLP_TYPE_CPL		0x0A // Completion without Data
+#define PCI_TLP_TYPE_CPLD		0x0A // Completion with Data (Fmt must be with data)
+#define PCI_TLP_TYPE_CPLLCK		0x0B // Completion Locked
+#define PCI_TLP_TYPE_CPLDLCK		0x0B // Completion with Data Locked (Fmt must be with data)
+#define PCI_TLP_TYPE_FETCH_ADD		0x0C // Fetch and Add AtomicOp Request
+#define PCI_TLP_TYPE_SWAP		0x0D // Unconditional Swap AtomicOp Request
+#define PCI_TLP_TYPE_CMP_SWAP		0x0E // Compare and Swap AtomicOp Request
+#define PCI_TLP_TYPE_LOCAL_PREFIX	0x00 // Local TLP Prefix (Fmt = 0x4)
+#define PCI_TLP_TYPE_E2E_PREFIX		0x10 // End-to-End TLP Prefix (Fmt = 0x4)
+
+/* Macro to combine Fmt and Type into the 8-bit field */
+#define PCIE_TLP_FMT_TYPE(fmt, type)   (((fmt) << 5) | ((type) & 0x1F))
+
 #endif /* LINUX_PCI_REGS_H */
-- 
2.43.0


