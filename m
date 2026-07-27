Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B43FC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pf+luVJXN+5Mt1F/LugFNGoO7JFSxApPShAsXbvlFwQ=; b=kyzstZQLS7qTTAEkgE0M31suyG
	GZ8NG7untSBJoCu3DmcbZyWpzyrxbzQRv+coqCOT/Fmtd7yqPSUEeyNp1TOtVBysg7SKQ7s/ZTQeO
	caZRn/bItzHIPnonueHGEPvZsb5n4H8l8JzB72Ii6/3Mh6/OQJ8TcdUetzr3Il9SCRBX8lkmpj5W0
	IvsgbP+avph1zPZkU+s4cVlpXpUsiPcOe9CQR018KdWoztn2caxS3cKOiOO2giFh+Pq1R6wZ6Vb8+
	L7WZmYOxa71MGxls9GVhNm+b2Nmkyk3b/X1rfu6dXhiKxT83aQAl4uobB/hJfhyFAk7fbRbd9LAsS
	ideq/xFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKRS-00000002gaB-0dSN;
	Mon, 27 Jul 2026 12:28:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKRK-00000002gU9-33yX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785155295; x=1816691295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bCA8BUnUCacAeM9L4GkNBcOulMHRN3ZMV7gjy96hcXs=;
  b=WaMIGqEe14BE+RNEG5hnEjKKSTgVvgnpwmVDlQlnLivmnlOn76ozOtR8
   DxTG/keR9/ZehCJ5PIfpOU8mKO09QWtpJa8Gv7dHc9f3xhHSdF+hoy/B3
   YaIvqh/w1L0+XDR1FHTZmsM4fLKd8vT27ggMCdYXP4REiZx3VvftD3wvu
   T5MRiQURFBzviI/Qao9dYslMkho1x6XXLzPHnOlmN+NEABrkV7Yr5DPnV
   tmk87mOiLK1L9fCeKyx3A1SJLcM+Q5YnBLONbIG2gt6RprgGJf1YCuwv4
   MeaqKlvwyNgbwwY+oPnHEl6dJTanAVdU0JHrsbrIFWd+Y6m4RMnTwl75z
   w==;
X-CSE-ConnectionGUID: qJWgCWuHSbOjQZNB4z2p0A==
X-CSE-MsgGUID: ln4Hm5EzSxOGslR4Q8UEjQ==
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="292591710"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jul 2026 05:28:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 27 Jul 2026 05:27:57 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 27 Jul 2026 05:27:48 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<Jonathan.Santos@analog.com>, <jorge.marques@analog.com>,
	<joshua.crofts1@gmail.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <varshini.rajendran@microchip.com>,
	<mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 07/16] dt-bindings: nvmem: microchip,sama7g5-otpc: add sama7d65 and dt node example
Date: Mon, 27 Jul 2026 17:56:24 +0530
Message-ID: <20260727122633.117435-8-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727122633.117435-1-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052814_784921_E5C7D7E6 
X-CRM114-Status: UNSURE (   9.96  )
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

Add support for sama7d65 and a dt node example that shows tag can be used
to reference a packet stored in the OTP memory.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../nvmem/microchip,sama7g5-otpc.yaml         | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index cc25f2927682..04b44660554e 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -20,9 +20,15 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: microchip,sama7g5-otpc
-      - const: syscon
+    oneOf:
+      - items:
+          - const: microchip,sama7g5-otpc
+          - const: syscon
+      - items:
+          - enum:
+              - microchip,sama7d65-otpc
+          - const: microchip,sama7g5-otpc
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -48,4 +54,20 @@ examples:
         };
     };
 
+  - |
+    efuse@e8c00000 {
+        compatible = "microchip,sama7d65-otpc", "microchip,sama7g5-otpc", "syscon";
+        reg = <0xe8c00000 0x100>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            calib@41435354 {
+                reg = <0x41435354 0x2c>;    /* Temp calib data packet TAG */
+            };
+        };
+    };
+
 ...
-- 
2.34.1


