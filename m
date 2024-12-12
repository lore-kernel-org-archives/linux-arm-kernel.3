Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A4CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03bRo/yex2pHmpYEtRlqRJRwqxt6KMLPLLG0WvNWhYA=; b=z9ihEZBYxRsIf3myL4W0E+sQLs
	clRGtHb0WM9UwbL443z6dNar1InLg46ntGoS57kKGYPeNLn6myRNxyZFyqIAm0S7C+ccOClA4L4o8
	io2HsqR7kievyCKWOK8zU4DPx+THRX1LS8n/aUIM/b7av0TV7N8SotAJNeQqCxwwVxc4LY+GBcu3O
	fMIQhMjrCMoDbyknv88NoBnjpu60mPv+4+W6RllRN+tuPRDA2jS8qjax9GK8NhZxHLvspUVMUF0Ff
	GTrJi4tEOVp+FVMysWaP+I6Sevf3ycwswJerhKv3SB1XJil2b3wbpe/dGRz70jLRpq+pCVgKzyag+
	zeBKL3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlfs-00000000sfB-2BN5;
	Thu, 12 Dec 2024 16:04:24 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlUl-00000000pdq-0fxL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:52:56 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 12 Dec
 2024 23:52:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 12 Dec 2024 23:52:41 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <tglx@linutronix.de>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <quic_bjorande@quicinc.com>, <geert+renesas@glider.be>,
	<dmitry.baryshkov@linaro.org>, <konradybcio@kernel.org>,
	<neil.armstrong@linaro.org>, <johan+linaro@kernel.org>,
	<kevin_chen@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>
Subject: [PATCH v3 1/6] dt-bindings: interrupt-controller: Refine size/interrupt-cell usage.
Date: Thu, 12 Dec 2024 23:52:31 +0800
Message-ID: <20241212155237.848336-3-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
References: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_075255_197297_46715CF0 
X-CRM114-Status: UNSURE (   8.84  )
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

1. Because size-cells is no need to use 2, modify to 1 for use.
2. Add minItems to 1 for interrupts for intc1.
3. Add 1 interrupt of intc1 example into yaml file.
4. Add intc1 sub-module of uart12 as example using the intc0 and intc1.
---
 .../aspeed,ast2700-intc.yaml                  | 60 +++++++++++++++----
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
index 55636d06a674..eadfbc45326b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
@@ -31,6 +31,7 @@ properties:
       type as defined in interrupt.txt in this directory.
 
   interrupts:
+    minItems: 1
     maxItems: 6
     description: |
       Depend to which INTC0 or INTC1 used.
@@ -68,19 +69,52 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     bus {
+      #address-cells = <2>;
+      #size-cells = <1>;
+
+      intc0: interrupt-controller@12100000 {
+        compatible = "simple-mfd";
+        reg = <0 0x12100000 0x4000>;
+        ranges = <0x0 0x0 0x0 0x12100000 0x4000>;
         #address-cells = <2>;
-        #size-cells = <2>;
-
-        interrupt-controller@12101b00 {
-            compatible = "aspeed,ast2700-intc-ic";
-            reg = <0 0x12101b00 0 0x10>;
-            #interrupt-cells = <2>;
-            interrupt-controller;
-            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+        #size-cells = <1>;
+
+        intc0_11: interrupt-controller@1b00 {
+          compatible = "aspeed,ast2700-intc-ic";
+          reg = <0 0x12101b00 0x10>;
+          #interrupt-cells = <2>;
+          interrupt-controller;
+          interrupts = <GIC_SPI 192 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 193 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 194 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 195 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 196 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+                       <GIC_SPI 197 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
         };
+      };
+
+      intc1: interrupt-controller@14c18000 {
+        compatible = "simple-mfd";
+        reg = <0 0x14c18000 0x400>;
+        ranges = <0x0 0x0 0x0 0x14c18000 0x400>;
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        intc1_4: interrupt-controller@140 {
+          compatible = "aspeed,ast2700-intc-ic";
+          reg = <0x0 0x140 0x10>;
+          #interrupt-cells = <2>;
+          interrupt-controller;
+          interrupts-extended = <&intc0_11 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+        };
+      };
+
+      uart12: serial@14c33b00 {
+        compatible = "ns16550a";
+        reg = <0x0 0x14c33b00 0x100>;
+        interrupts-extended = <&intc1_4 18 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+        reg-shift = <2>;
+        reg-io-width = <4>;
+        no-loopback-test;
+      };
     };
-- 
2.34.1


