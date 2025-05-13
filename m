Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985A0C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmQfcLpiSyLwy3Zc5zbrGssZMtkDmMAcUwLjz7QJh1g=; b=QZFoCmr19qiluNZcNkI+rX9p/9
	BNOTNNmTVmt7vaAOghBQqkU12Fl2fvT/205v0RSxSCHhKosYUyYSPkfIWcRCgo2FTzWeB8cJrBIFF
	hLVBinj2Gd5lz9g8os+Y8N7p3zudyi+9zUFl3uaDfiFV4CsrbKT9bbJwhvU1Eka3W/xivOsxfE4EB
	+2BYuvd/4GpFl/hXr6s48hIfPysFhYRGkGngtEDjW723u38n7+iJpnDykwj8E3zoYgviMlk/FyYMN
	TgwN+IK9Qm7hAZa8bXKe6a7siWPgQmQ/aSRiH5tog4p8MSp4160Xq4X0V/LlATf3abC79SuIiY1R3
	OldMRlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExjI-0000000Dcyd-2pA1;
	Tue, 13 May 2025 22:04:04 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExf6-0000000DcNf-06Pg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:59:45 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxa7l2425893;
	Tue, 13 May 2025 16:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747173576;
	bh=qmQfcLpiSyLwy3Zc5zbrGssZMtkDmMAcUwLjz7QJh1g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VYO8tJDfkIroqj/Xvx4yPWEaQDxkcQSISNZS4QLwOtrV7lPkoxtGea5Lc8+WeNbov
	 ZuZbj0hZA8xyXfAuSXGX+EytnYg9dnLaqXDVb3hwpRsuM+27CSb4IETYJDFITFs53t
	 xYyW1bqhZGTvTxxFRX13wy1+wHJP5KtFsJCcO3kI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54DLxZ021005887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 16:59:35 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 16:59:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 16:59:34 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxYdC111031;
	Tue, 13 May 2025 16:59:34 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/7] dt-bindings: serial: add binding documentation for TI PRUSS UART
Date: Tue, 13 May 2025 16:59:28 -0500
Message-ID: <20250513215934.933807-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513215934.933807-1-jm@ti.com>
References: <20250513215934.933807-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145944_150660_00112792 
X-CRM114-Status: GOOD (  13.56  )
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

From: Bin Liu <b-liu@ti.com>

This adds the YAML DT binding for PRUSS UART on TI SoCs.

Signed-off-by: Bin Liu <b-liu@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../bindings/serial/ti,pruss-uart.yaml        | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/ti,pruss-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/ti,pruss-uart.yaml b/Documentation/devicetree/bindings/serial/ti,pruss-uart.yaml
new file mode 100644
index 000000000000..34a03d572333
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ti,pruss-uart.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/ti,pruss-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI PRUSS serial UART
+
+maintainers:
+  - Bin Liu <b-liu@ti.com>
+
+description: |
+  The PRU subsystem has a serial UART peripheral based on the industry
+  standard TL16C550, with 16-byte TX/RX FIFOs.
+
+allOf:
+  - $ref: /schemas/serial.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: ti,pruss-uart
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: |
+      PRU UART interrupt mappings, containing an entry of 3 cell-values.
+      The first is the PRU System Event ID for PRU UART Interrupt Request.
+      The second is the PRU interrupt channel ID.
+      The third is the PRU host interrupt ID.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    pruss_uart: serial@28000 {
+        compatible = "ti,pruss-uart";
+        reg = <0x28000 0x40>;
+        clocks = <&k3_clks 81 13>;
+        interrupt-parent = <&pruss_intc>;
+        interrupts = <6 4 4>;
+    };
-- 
2.49.0


