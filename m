Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35771C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zoO974m1IZgYR3D++13RTWoZ8Kdq6ybz200zav34PI=; b=rypltrIg02ti+06QNHUvwnDGTE
	ZvX0pR0eA3fGhT/kUmflpkqektkwbv6k1bQLhTmizFPDfRX5gRw0zYGOQ2TxaPNM/mgLBX7pEw621
	tSVW96QPNInrxZ5M41fQX1xJnUmyqlZubQ6zJ5sChPHJFoOhH5s/U0dz4zVSyCnHfPXxQEr43Qbma
	Yyly5vPXEKfB2hPm+f9qgZg0K0JskfIqGcsNjFACv2pN6e3aZJkTfWmtqJpm/5qNOvM7axGU+eNrj
	S0CSW2CyOR+xclJxTqXujdjYThrCRF4cqShR16tmA8cu7I940aYttZjO7PJa8vHE0TFC4rxrtVesI
	SClY7adA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGXC-00000006kCy-0GZX;
	Tue, 08 Jul 2025 22:11:30 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGQB-00000006if5-0gtQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:04:16 +0000
Received: (wp-smtpd smtp.wp.pl 8905 invoked from network); 9 Jul 2025 00:04:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752012250; bh=7zoO974m1IZgYR3D++13RTWoZ8Kdq6ybz200zav34PI=;
          h=From:To:Subject;
          b=QXRHR7qJJvAHQZdMNvlf/AyebVRU2/hfT/WxggoNBkAjDF18RcjFIYu57JoqrgVLr
           VZMZqOj8FsxM4bOG8MzsT1wZ3pAQ9QyZ0ozo+cy+iOfVXSIAs+FwSHVDNj/+/4CS4R
           uLui1CBCj+lrmJScrQaQjxXGRUSHrB5+QVCi0tsDOchZLUgqej2cK8tgBmOmACe/6H
           5Vv4184pQaIfRaDIWaopmPi75gAaR8uvi6EINO3y9Z40H8NKsu/hJ+Xu1fxAg6qkAJ
           vnx75Wh0PF27JArkiOr2uu7ERdXWmlIHiu42yRLPgn8EPPPKwvctMEIGqFaTgexeFt
           ngQ/k7zJ9P7dw==
Received: from 83.24.138.239.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.138.239])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 9 Jul 2025 00:04:10 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	s.hauer@pengutronix.de,
	olek2@wp.pl,
	zhiyong.tao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/3] dt-bindings: thermal: mediatek: add falback compatible string for MT7981 and MT8516
Date: Wed,  9 Jul 2025 00:04:04 +0200
Message-Id: <20250708220405.1072393-3-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250708220405.1072393-1-olek2@wp.pl>
References: <20250708220405.1072393-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 30c928d7f745ab1bbbf0f926fc259679
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [gXKh]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_150415_361543_94FF8BEC 
X-CRM114-Status: UNSURE (   9.35  )
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

The ‘mediatek,mt7981-thermal’ and ‘mediatek,mt8516-thermal’ strings
aren't definied in the driver. Both should have fallback compatible
strings. This commit fixes this issue.

Fixes: 788494ba0999 ("dt-bindings: thermal: convert Mediatek Thermal to the json-schema")
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/thermal/mediatek,thermal.yaml    | 27 ++++++++++++-------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
index d96a2e32bd8f..1c10d7adc77a 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
@@ -20,16 +20,23 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-thermal
-      - mediatek,mt2712-thermal
-      - mediatek,mt7622-thermal
-      - mediatek,mt7981-thermal
-      - mediatek,mt7986-thermal
-      - mediatek,mt8173-thermal
-      - mediatek,mt8183-thermal
-      - mediatek,mt8365-thermal
-      - mediatek,mt8516-thermal
+    oneOf:
+      - enum:
+          - mediatek,mt2701-thermal
+          - mediatek,mt2712-thermal
+          - mediatek,mt7622-thermal
+          - mediatek,mt7986-thermal
+          - mediatek,mt8173-thermal
+          - mediatek,mt8183-thermal
+          - mediatek,mt8365-thermal
+      - items:
+          - enum:
+              - mediatek,mt7981-thermal
+          - const: mediatek,mt7986-thermal
+      - items:
+          - enum:
+              - mediatek,mt8516-thermal
+          - const: mediatek,mt2701-thermal
 
   reg:
     maxItems: 1
-- 
2.39.5


