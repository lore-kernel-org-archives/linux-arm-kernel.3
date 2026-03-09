Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914C6F3C250
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 13:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kKSPlWgiC0oMPA6n4uvU5Sf5SxbvpnQg9oy7p1Ayeo=; b=S1b7mfvCaM21hhu4robjWk8mod
	A7u9HfwZuLnTBufcygQouBxqh6UreR6Y6qHaKj+CbW/FR+EuyfyEbuOGmSJLOriFVJmj3XkS5AYw9
	6ptxIlgEnjF3QFtwsHy1K3VHLn9WY17Kzwu3vHLaRVC4Rgo7JZkBvHULgfl3YURctmT0r+kTM/1w2
	N+ev/GkxRiGdsQVl2u7X1QuGFgtHp9Qo28nogrTqjAjFu6FZwu/C3sUq63tJDPgKZ96Fjt/JH8ip0
	kMT1e6H/H3QoNAOV8aj+S/TfExgrVcvLxCxPu1TxQpjIqVFoBTiAoI/fB1QaMjW+WU06OfiKe/41c
	wmsjLS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaVX-00000007Mto-2A9m;
	Mon, 09 Mar 2026 13:18:51 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaVS-00000007MrK-3M7B;
	Mon, 09 Mar 2026 13:18:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E69E28680B;
	Mon,  9 Mar 2026 14:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773062323; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0kKSPlWgiC0oMPA6n4uvU5Sf5SxbvpnQg9oy7p1Ayeo=;
	b=arpzSAP+g0pElGs95Ot3BhOqKoSnrYBZs+76Rlx4+vAfybkoxr7rxG7roWlwXOd+iMHPMi
	OA23z5d7vNvC6UDiO5n5xRBg9Ie8JUwLOGDZdK05Arha4VqTqIggHITYS7j8BDqeRp9VO2
	p9p3/kcKYXSn6I4N4h7qx0sK2J+F1MSFNo0lXMVBOKafEz4S6f0x0+fIpMY6a4UzBM+Ltj
	HBNChVddBLZBcDBQYpArmnQ2wmpTN3gXoNjnRokfHxz5PtFNhXYtyPvexOw5Gj+oq6zmGk
	eQlvPenO6C0d/Te75pTGn2k7cSlbw16StN+cFqxveWE3rCcXb/RAOfNa5UvZ2Q==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjd@cjdns.fr,
	tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@nbd.name,
	ansuelsmth@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/8] dt-bindings: clock, reset: Add econet EN751221
Date: Mon,  9 Mar 2026 13:18:11 +0000
Message-Id: <20260309131818.74467-2-cjd@cjdns.fr>
In-Reply-To: <20260309131818.74467-1-cjd@cjdns.fr>
References: <20260309131818.74467-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_061847_216783_33DC2BEE 
X-CRM114-Status: GOOD (  13.76  )
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

Add clock and reset bindings for EN751221 as well as a "chip-scu" which is
an additional regmap that is used by the clock driver as well as others.
This split of the SCU across two register areas is the same as the Airoha
AN758x family.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/clock/airoha,en7523-scu.yaml     |  7 ++-
 .../devicetree/bindings/mfd/syscon.yaml       |  2 +
 MAINTAINERS                                   |  2 +
 .../dt-bindings/clock/econet,en751221-scu.h   | 13 +++++
 .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
 5 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
 create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index a8471367175b..91abe7716fce 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -32,6 +32,7 @@ properties:
       - enum:
           - airoha,en7523-scu
           - airoha,en7581-scu
+          - econet,en751221-scu
 
   reg:
     items:
@@ -67,7 +68,10 @@ allOf:
   - if:
       properties:
         compatible:
-          const: airoha,en7581-scu
+          items:
+            - enum:
+                - airoha,en7581-scu
+                - econet,en751221-scu
     then:
       properties:
         reg:
@@ -98,3 +102,4 @@ examples:
               #reset-cells = <1>;
       };
     };
+
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd3..e22867088063 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -61,6 +61,7 @@ select:
           - cirrus,ep7209-syscon2
           - cirrus,ep7209-syscon3
           - cnxt,cx92755-uc
+          - econet,en751221-chip-scu
           - freecom,fsg-cs2-system-controller
           - fsl,imx93-aonmix-ns-syscfg
           - fsl,imx93-wakeupmix-syscfg
@@ -173,6 +174,7 @@ properties:
               - cirrus,ep7209-syscon2
               - cirrus,ep7209-syscon3
               - cnxt,cx92755-uc
+              - econet,en751221-chip-scu
               - freecom,fsg-cs2-system-controller
               - fsl,imx93-aonmix-ns-syscfg
               - fsl,imx93-wakeupmix-syscfg
diff --git a/MAINTAINERS b/MAINTAINERS
index 14899f1de77e..3781d55db5bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9119,6 +9119,8 @@ F:	arch/mips/boot/dts/econet/
 F:	arch/mips/econet/
 F:	drivers/clocksource/timer-econet-en751221.c
 F:	drivers/irqchip/irq-econet-en751221.c
+F:	include/dt-bindings/clock/econet,en751221-scu.h
+F:	include/dt-bindings/reset/econet,en751221-scu.h
 
 ECRYPT FILE SYSTEM
 M:	Tyler Hicks <code@tyhicks.com>
diff --git a/include/dt-bindings/clock/econet,en751221-scu.h b/include/dt-bindings/clock/econet,en751221-scu.h
new file mode 100644
index 000000000000..44a5b197cb06
--- /dev/null
+++ b/include/dt-bindings/clock/econet,en751221-scu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_
+#define _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_
+
+#define EN751221_CLK_PCIE	0
+#define EN751221_CLK_SPI	1
+#define EN751221_CLK_BUS	2
+#define EN751221_CLK_CPU	3
+#define EN751221_CLK_HPT	4
+#define EN751221_CLK_GSW	5
+
+#endif /* _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_ */
diff --git a/include/dt-bindings/reset/econet,en751221-scu.h b/include/dt-bindings/reset/econet,en751221-scu.h
new file mode 100644
index 000000000000..bad499d4d50a
--- /dev/null
+++ b/include/dt-bindings/reset/econet,en751221-scu.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_ECONET_EN751221_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_ECONET_EN751221_H_
+
+#define EN751221_XPON_PHY_RST		 0
+#define EN751221_PCM1_ZSI_ISI_RST	 1
+#define EN751221_FE_QDMA1_RST		 2
+#define EN751221_FE_QDMA2_RST		 3
+#define EN751221_FE_UNZIP_RST		 4
+#define EN751221_PCM2_RST		 5
+#define EN751221_PTM_MAC_RST		 6
+#define EN751221_CRYPTO_RST		 7
+#define EN751221_SAR_RST		 8
+#define EN751221_TIMER_RST		 9
+#define EN751221_INTC_RST		10
+#define EN751221_BONDING_RST		11
+#define EN751221_PCM1_RST		12
+#define EN751221_UART_RST		13
+#define EN751221_GPIO_RST		14
+#define EN751221_GDMA_RST		15
+#define EN751221_I2C_MASTER_RST		16
+#define EN751221_PCM2_ZSI_ISI_RST	17
+#define EN751221_SFC_RST		18
+#define EN751221_UART2_RST		19
+#define EN751221_GDMP_RST		20
+#define EN751221_FE_RST			21
+#define EN751221_USB_HOST_P0_RST	22
+#define EN751221_GSW_RST		23
+#define EN751221_SFC2_PCM_RST		24
+#define EN751221_PCIE0_RST		25
+#define EN751221_PCIE1_RST		26
+#define EN751221_CPU_TIMER_RST		27
+#define EN751221_PCIE_HB_RST		28
+#define EN751221_SIMIF_RST		29
+#define EN751221_XPON_MAC_RST		30
+#define EN751221_GFAST_RST		31
+#define EN751221_CPU_TIMER2_RST		32
+#define EN751221_UART3_RST		33
+#define EN751221_UART4_RST		34
+#define EN751221_UART5_RST		35
+#define EN751221_I2C2_RST		36
+#define EN751221_XSI_MAC_RST		37
+#define EN751221_XSI_PHY_RST		38
+#define EN751221_DMT_RST		39
+#define EN751221_USB_PHY_P0_RST		40
+#define EN751221_USB_PHY_P1_RST		41
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_ECONET_EN751221_H_ */
-- 
2.39.5


