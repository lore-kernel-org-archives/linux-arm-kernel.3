Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EA3C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+i/3ki+17xe64ShCyYC+Nb82F7gDLReZhUkgpHwvUk=; b=HNvr8KmDQOx/nkJRo5IOUXVYB/
	hlmI36b1uR6OSObG8T8ka8i41t5mRW6TZG15OoBtzNlhuzjT6F7mrHJMuBX0s3Ejk4GPWl4aUrBLq
	qZiimwvtflgnHi25pz7+4AoVFD7KPD2ydLUBOXI8mRSasdkxEfpPuzyIEoVz/EwyVUGUfuB3gr7AF
	aUO4Gu7t8URmBJLonRs5Ak+IrxK31Lun8Tc6Nst0XfubVax0NUvoDuFA2j4CmvBABo161Pl8oM/aQ
	OFdLChOeHZJLpsywqVCw96Fm0XYV+y1LJu5yJNgqWvMIcG69r8ubI8QDpxq2KLAjv4OUSYxvBFCdp
	IngL8uhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWy2-00000003ylj-1cmN;
	Tue, 15 Jul 2025 04:08:34 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWZt-00000003vKr-3EwP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:43:39 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 11:43:20 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 15 Jul 2025 11:43:20 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linus.walleij@linaro.org>, <p.zabel@pengutronix.de>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 02/10] dt-bindings: soc: aspeed: Add ASPEED PCIe PHY support
Date: Tue, 15 Jul 2025 11:43:12 +0800
Message-ID: <20250715034320.2553837-3-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_204337_813607_CD71179C 
X-CRM114-Status: GOOD (  14.05  )
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

This PHY is used by many modules. In our design, our
PCIe has RC and EP funcitons. On the different function,
each driver will use configure and get some information
from the PHY interface to do somting that it wants to.
Getting link status, setting syscon credits and so on.
Therefore, define it as syscon for all modules.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/soc/aspeed/aspeed,pcie-phy.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml
new file mode 100644
index 000000000000..5fa585d63ca6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/aspeed,pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe PHY
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description:
+  The ASPEED PCIe PHY provides the physical layer interface for PCIe
+  controllers in the SoC. This node represents the register block for the PCIe
+  PHY, which is typically accessed by PCIe Root Complex or Endpoint drivers
+  via syscon. It is used to configure and get the status of the PCIe PHY
+  hardware, including power management, link training, and other PHY-specific
+  operations.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,pcie-phy
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@1e6ed200 {
+      compatible = "aspeed,pcie-phy", "syscon";
+      reg = <0x1e6ed200 0x100>;
+    };
-- 
2.43.0


