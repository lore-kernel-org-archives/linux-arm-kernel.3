Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A71CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZMSps6hgFDIpP9RxgvUc7h5gme0+z9CSV4o5tWm9tg=; b=lHUFLecjcY8uj2nloflvdPaBg9
	RCKMoQkhg3WAJybUTAt3WetIMrSRLTs/tLkPqNbUnPCNrmmQdNM1XyWZ6SiOVsbJ6+XRngGJIrpV2
	9F8W3MfQExge/qOCCLnFMshiu+MD6wK65eFnBwbQwRJZDa0Jkszp4ZuYL0gIdCXXH1L8Vbmjv5faC
	6y6lywSr0IFZP2mm7KanP1ig9VEWjBkzAtU5AC7xvLICMHspTbZybfeIOD3cCojoQZdEzk78kUS1v
	3scis/K5auo72Xsc77ktXjZMVzB27FUNwK+uRnrodrwWITIzkPGccpm0MuYqzgyxzxO33Vv4e5HgU
	qjGKKzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycF8-000000090wm-23va;
	Tue, 16 Sep 2025 20:25:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEx-000000090jT-07rJ;
	Tue, 16 Sep 2025 20:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BFA660251;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A674C4AF09;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054326;
	bh=B44iCTmbdkKyp2fHglpeuA0FgGRACa5ozdrUyEJewhg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NAEBA1y1K4tD/khRpZK6HkipNJr1YfntYnA1W8a1MzEjPiEZDlIUbUrvu6Vu+pe0p
	 dE4zzG04EM+hdn+JeTZRE7swY4dzT+d3zaZlfXt1w080wMyHCp0vmyNmcQfp1EpRk4
	 +M5cgboJT5xIC7A1o9d3niTws0pIR9ymJ32HRLpSvJHNUrZoq77nijq2oVbdqcCnFX
	 18h9UHBn499TLmGp8F2huiSkDw3kNFZHs2OGD4zQ9TR7ELKLZlLg2bYtnrgFtG4mkE
	 PjuOKrBP49md3posUyZxios2JUQ0yCVcmx4UwALtpQvdrA7nF/kp1Haj/rVzLgd/N6
	 8HwSnuIEXZLzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DD7CAC59F;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:15 +0700
Subject: [PATCH 18/25] dt-bindings: dma: Add RDA IFC DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-18-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=2537;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=QY6MPTi+ZEpXp5sbdSrBjaqgS0Xhdu1ZPCH1WF+g14Y=;
 b=f+73zCYT5uq1k6ilgLXi33C+NRy7J+fTOa4N/swr6XCdLJaXbG/yOKqpUhJI3D/PqTqY8XU0k
 QkM4vE+PJ/5Cn0iUPmzJgeqVeko3jz25IKQyFfbLa/CoguJ6psdmMSc
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

The Intelligent Flow Controller (IFC) is a scatter/gather DMA
controller.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 Documentation/devicetree/bindings/dma/rda,ifc.yaml | 42 ++++++++++++++++++++++
 include/dt-bindings/dma/rda-ifc.h                  | 28 +++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/rda,ifc.yaml b/Documentation/devicetree/bindings/dma/rda,ifc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3bb5932e8ff9404e3980eaef607efceb6d883bda
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/rda,ifc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/rda,ifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RDA Intelligent Flow Controller (IFC)
+
+maintainers:
+  - Dang Huynh <dang.huynh@mainlining.org>
+
+description: |
+  RDA IFC is a DMA controller, it only supports scatter/gather lists.
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: rda,8810pl-ifc
+
+  reg:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 1
+    description:
+      The cell corresponding to DMA request ID
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    ifc: dma-controller@f0000 {
+      compatible = "rda,8810pl-ifc";
+      reg = <0xf0000 0x1000>;
+      #dma-cells = <1>;
+    };
diff --git a/include/dt-bindings/dma/rda-ifc.h b/include/dt-bindings/dma/rda-ifc.h
new file mode 100644
index 0000000000000000000000000000000000000000..e075fe26158e834d1ae87b6dce61e41fb931add3
--- /dev/null
+++ b/include/dt-bindings/dma/rda-ifc.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+
+#ifndef __DT_BINDINGS_DMA_RDA_IFC_H__
+#define __DT_BINDINGS_DMA_RDA_IFC_H__
+
+#define IFC_UART1_TX 0
+#define IFC_UART1_RX 1
+#define IFC_UART2_TX 2
+#define IFC_UART2_RX 3
+#define IFC_SPI1_TX 4
+#define IFC_SPI1_RX 5
+#define IFC_SPI2_TX 6
+#define IFC_SPI2_RX 7
+#define IFC_SPI3_TX 8
+#define IFC_SPI3_RX 9
+#define IFC_SDMMC1_TX 10
+#define IFC_SDMMC1_RX 11
+#define IFC_SDMMC2_TX 12
+#define IFC_SDMMC2_RX 13
+#define IFC_SDMMC3_TX 14
+#define IFC_SDMMC3_RX 15
+#define IFC_NFSC_TX 16
+#define IFC_NFSC_RX 17
+#define IFC_UART3_TX 18
+#define IFC_UART3_RX 19
+#define IFC_NO_REQUEST 20
+
+#endif /* __DT_BINDINGS_DMA_RDA_IFC_H__ */

-- 
2.51.0



