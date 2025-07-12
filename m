Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4C1C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYawKN+5MYGds6VxRs2d7qo+CH5vM5SkgS7CBcdvPVY=; b=EvWRJXORBQHfSe6aCcbgCsoU4q
	CP4UsUOfWy1r59Wpg+4GeTHVUAkgJaH46lt1LbNlF9SeFLqHVoK6BXeBBrNE73cgK14IEDWBvfWpz
	pH1EuWVvp8WhWn/bkc9mP11qO27IcFYMRRsH8mPvU5p0zuPlTXuCW8xhn+YeCGwPlvh96cHpREoW4
	zhNva1TDw3rjLzcToXKeFUTLk6eA5OJ5ucqfx/mX0NwYvRMchLVDx3w4KFLpTR9Efmf/E+uyuPA+i
	el1zd4o45uruugkZIoqHwd44fPseeFAeZBpinxU5Ns3uiGdVnC+aMUeCf8IHcFDrG7yCLIa8+cIHI
	eKBzhZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uagQA-0000000Gyeq-1Cuc;
	Sat, 12 Jul 2025 20:02:06 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uagNN-0000000GyMN-35sn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 19:59:15 +0000
Received: (wp-smtpd smtp.wp.pl 40337 invoked from network); 12 Jul 2025 21:59:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752350348; bh=WYawKN+5MYGds6VxRs2d7qo+CH5vM5SkgS7CBcdvPVY=;
          h=From:To:Cc:Subject;
          b=XrG2t3kMckVauQKz0F+m6Zb+dMXvYQV7LrPFcSqNirJWLDdMvRgzjHpnE48hDBKMJ
           OFQUt0kEY381fB8H/3A8H100bqZIDoxFxochvoOFeG122uL8nn3yLR2iTmktUSKrCr
           UR+XA1k0ti22puq0T9zQ7oBV+pYWzD41y2BDid/91hgB7ne501HurBlhzszQRO7Uaa
           eMpPDkB3jOoHOli2Ow1GD5Vcw1AC0Tg26OIDhLzjf/PXTL2rLFfWjJ5Lx3lWZK/sxb
           9yngqyPEKhEvHjBjd5f/rKA8sl/jR81oSjV4DAzwRUyAB3NWpC7/Km80Ktt5qAqOdl
           MnLYcDa4X3Oug==
Received: from 83.24.150.40.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.150.40])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 12 Jul 2025 21:59:08 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	s.hauer@pengutronix.de,
	rafal@milecki.pl,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: thermal: mediatek: add falback compatible string for MT7981 and MT8516
Date: Sat, 12 Jul 2025 21:59:03 +0200
Message-Id: <20250712195904.6988-2-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250712195904.6988-1-olek2@wp.pl>
References: <20250712195904.6988-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: b3b18c2aee2b4ebbd80a5f6acede9098
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0100003 [8XAz]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_125914_246458_04AB4E82 
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

The ‘mediatek,mt7981-thermal’ and ‘mediatek,mt8516-thermal’ strings
aren't definied in the driver. Both should have fallback compatible
strings. This commit fixes this issue.

Fixes: 788494ba0999 ("dt-bindings: thermal: convert Mediatek Thermal to the json-schema")
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/thermal/mediatek,thermal.yaml    | 27 ++++++++++++-------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
index d96a2e32bd8f..7bd0955e6d04 100644
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
+              - mediatek,mt8516-thermal
+          - const: mediatek,mt2701-thermal
+      - items:
+          - enum:
+              - mediatek,mt7981-thermal
+          - const: mediatek,mt7986-thermal
 
   reg:
     maxItems: 1
-- 
2.39.5


