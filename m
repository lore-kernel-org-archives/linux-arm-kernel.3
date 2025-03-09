Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A7BC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFUBvNvZssUWY4Ue3Zqg3APE4e1ZXZgpVynzdNuDhAc=; b=chojC/fY8G9lTzSMvuXWU/uSUo
	Muq20nlIp1LNGc8oBgHNTWSUmstLfRha5XVtCs+43hywHU2BtDZ02ecS87gjJt0tob9ZKeAIqDAyn
	BGYD6V2/TLjT18mgIlt48zMGYm/whKCf6QNMb1sRGugXIJEkxEgabkNzxbNZJ6sTGKfEbh488y1GD
	rFYyvOOCx8Bm0WQQqQgYvX8ZSnD0xR11WnDWAfACSW4/eIwuPX1X5qB1Cnp1OJS3uywLIlcTbnKCT
	0Nx4qb3DluF6TKswDJR1CyAei4J/g3N/t2KvBnNfLXuEyvAqNb0O85oW3ifLo58Ozu/7pugGaLzuE
	uTnCp6EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLcg-00000000ziy-2CeQ;
	Sun, 09 Mar 2025 18:43:38 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLCY-00000000wnB-245C;
	Sun, 09 Mar 2025 18:16:40 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2835F120006;
	Sun,  9 Mar 2025 21:16:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2835F120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544197;
	bh=uFUBvNvZssUWY4Ue3Zqg3APE4e1ZXZgpVynzdNuDhAc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=IUkD5lGawxB3Xm7ii7KAqjTj9Rgdm1FligxXbSvrCjPBo9wLzoXoUurYr1Zr4AKeM
	 uZmDEB0ei5fYKLWxajVTDvmeYfzgCV6TEAG/uooowA4mZ1P1OmkFVu0cE8hjZlIlOa
	 Sgv7dFfAZDmJRo/TdIis9JV8g9Cpo+2uLT3wrAq8oki8tpXSPElTBxa54SMZtYwSCu
	 47NEgg+8sxp2//fIRkm+j7gt4QzhlXlDvf4hhe/xhw+RNnG7YCUuabvl+cAYO4N4Yy
	 dHX/mRIiLBmlpzhRPSTNbfp27afavp6OnVB28Ak70kku7eXEdHwDMu9C5cHM7bU3zQ
	 oS6HnLu80XeOg==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:16:36 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Takashi Iwai
	<tiwai@suse.com>
Subject: [PATCH v2 2/3] ASoC: dt-bindings: meson: t9015: add support for A1 SoC family
Date: Sun, 9 Mar 2025 21:16:29 +0300
Message-ID: <20250309181630.1322745-3-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309181630.1322745-1-jan.dakinevich@salutedevices.com>
References: <20250309181630.1322745-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.252]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 191599 [Mar 09 2025]
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 17:28:00 #27692143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_111638_868990_7D229E3E 
X-CRM114-Status: GOOD (  11.35  )
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

Add support for internal audio codec found A1 SoC family. On this SoC
the component supports capturing from ADC and has specific configuration
of input/output lines.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../bindings/sound/amlogic,t9015.yaml         | 69 +++++++++++++++++--
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
index 5f5cccdbeb34..962795470601 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
@@ -9,9 +9,6 @@ title: Amlogic T9015 Internal Audio DAC
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   $nodename:
     pattern: "^audio-controller@.*"
@@ -21,7 +18,9 @@ properties:
 
   compatible:
     items:
-      - const: amlogic,t9015
+      - enum:
+          - amlogic,t9015
+          - amlogic,t9015-a1
 
   clocks:
     items:
@@ -43,6 +42,17 @@ properties:
 
   sound-name-prefix: true
 
+  lineout-left:
+    $ref: /schemas/types.yaml#/definitions/string
+  lineout-right:
+    $ref: /schemas/types.yaml#/definitions/string
+  linein-left:
+    $ref: /schemas/types.yaml#/definitions/string
+  linein-right:
+    $ref: /schemas/types.yaml#/definitions/string
+  micbias:
+    $ref: /schemas/types.yaml#/definitions/string
+
 required:
   - "#sound-dai-cells"
   - compatible
@@ -52,6 +62,57 @@ required:
   - resets
   - AVDD-supply
 
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t9015-a1
+    then:
+      properties:
+        lineout-left:
+          items:
+            - enum:
+                - none
+                - right
+                - left-inverted
+        lineout-right:
+          items:
+            - enum:
+                - none
+                - left
+                - right-inverted
+        linein-left:
+          items:
+            - enum:
+                - none
+                - differential
+                - positive
+                - negative
+        linein-right:
+          items:
+            - enum:
+                - none
+                - differential
+                - positive
+                - negative
+        micbias:
+          items:
+            - enum:
+                - 2.0V
+                - 2.1V
+                - 2.3V
+                - 2.5V
+                - 2.8V
+    else:
+      lineout-left: false
+      lineout-right: false
+      linein-left: false
+      linein-right: false
+      micbias: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


