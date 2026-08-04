Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1AEC55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pf+luVJXN+5Mt1F/LugFNGoO7JFSxApPShAsXbvlFwQ=; b=K9obx74Db/MdRSRvfJL1I/4Bax
	gdqDgmthTK/5zmHh1E7jQnvmKnKXdg6P4Jyhxr+wzkV1VGg0jjjcheBI8XHsQmrgxxYC3n6ADeqFa
	9CEyjh2Plqprq14Kc5SLFSk0xoUJQh6E39cWxHwz/csE+xE+0ctA3Mv1mAFGijH8BF6X86GAl9pT1
	ZiNZ3okTzmMtD3BWjPvQ0gI4N8eepgY1qqi7aFeIPCHZYLovrwTUUM0IBkbvtxfitFjZTOhLf6Rim
	LzeP/DLypt9pfjFL7uuPCXXc9LdD5hk8pg5Uj/usSyOEiQ+bSNYu2UKapxFUOfbJM9pTEpHkkNpe5
	/UkGVAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQb-00000001iLW-1cz3;
	Tue, 04 Aug 2026 11:35:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQW-00000001iIV-13g8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785843320; x=1817379320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bCA8BUnUCacAeM9L4GkNBcOulMHRN3ZMV7gjy96hcXs=;
  b=k3efrsZloWYr76VdgnNz54z1OwMd0kSlKRwbNkXavINLN8Bl671Q1yQT
   toU9iB9UcPn5kLSGy1IfEc0pg4kDIn6dEcyfyh8HbDzUGo3bHxEyh0SIQ
   4CrAMtyxJbD3JSg0lIESDQ9EMMEDjOzH3dxB+W/LSWmHWXw8u4pukqBq5
   cwF0+dksdEq8KAIe38IXqodw2tF7t1SBr2+2YUcwHmbZIqnFBE0uiAehI
   Wvompc64aeYlbXpKo4lKryGVAUCfuA4VHz+nDzp+0ApMurfGtiUQD3HzW
   npfCWxJyFGpAaubjT3m37ZVMdSAE0aiQu34nEukbQw2LZAyJTzayVNJMi
   A==;
X-CSE-ConnectionGUID: IvzRk8XUQWOvsx5G8q9+Ug==
X-CSE-MsgGUID: ekgReHzgT+iL3EGmCgYZiw==
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="60737184"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2026 04:35:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 4 Aug 2026 04:35:18 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 4 Aug 2026 04:35:08 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
	<Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
	<mazziesaccount@gmail.com>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 08/17] dt-bindings: nvmem: microchip,sama7g5-otpc: add sama7d65 and dt node example
Date: Tue, 4 Aug 2026 17:03:29 +0530
Message-ID: <20260804113338.261782-9-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804113338.261782-1-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043520_421475_ED463D42 
X-CRM114-Status: GOOD (  10.25  )
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


