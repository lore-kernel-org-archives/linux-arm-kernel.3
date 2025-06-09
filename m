Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07330C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 21:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GB5ZcKfxxqE23c81Tad4k5M/wj+4TbDDSc1X5uVqbU=; b=MnB46TzRlXFbrge82pVM5Lv/eH
	OTaITsctVonRbAxaV5uO/ABpAXlo4x2rm/TaSDAlBwl5RPW/6HmRWATIulrrSzKacQ3CFtueYTFTY
	CcNhBHPuBJu9+xXuE8d+pEoPsi+/k7QcJp3Hz30SVHNhRDTVU7UOJsjMA/iWBgN9jGY1LewUL+nz9
	EEb29pgn3ewP+penqilz4nfWw+DIonLSImU+nfiepJJBkGVXMn5VUc9fj89uP6uSK3s6Xp1lI7+G/
	JTAd7qzHnteT5rIDs9aJtRjOkUYWhXryNIfCQQOjIeUF3ubfyQsGq/kOOOhD5oPvG9qRyI11nDon7
	KtLWvszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOk1r-00000005GVu-36Jq;
	Mon, 09 Jun 2025 21:27:39 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjxb-00000005G4b-0Qc9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 21:23:16 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 94DF8C000320;
	Mon,  9 Jun 2025 14:23:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 94DF8C000320
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749504193;
	bh=siG3t5h5VI/vBQgaAeu+KAIZnYD30RwbGz60qGNfCG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kFl3RpCbWaRqC2pY0b+rw6E2shSaIF4eRTIO6zVbjFUz4hA/kJfOt1SfTXkVbzjlL
	 1NgVl/JfkF56q/xMcDYzo7EPauESG6Ssj0KZdvXeHRvjD4nY33s+IKEQwz94ESqluu
	 KP6yZz8veLgC/YcAJjxzTV/iaE/PGN/U+csJeMzk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 75C5418000847;
	Mon,  9 Jun 2025 14:23:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.orgg
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 1/2] dt-bindings: memory-controller: Define fallback compatible
Date: Mon,  9 Jun 2025 14:23:10 -0700
Message-ID: <20250609212311.2264108-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609212311.2264108-1-florian.fainelli@broadcom.com>
References: <20250609212311.2264108-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_142315_194520_001D2A32 
X-CRM114-Status: GOOD (  11.41  )
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

All of the DDR controllers beyond revision b.2.1 have had a consistent
layout, therefore define a "brcm,brcmstb-memc-ddr-rev-b.2.1" fallback
compatible string to match them all rather than having to continuously
add to the list.

Link: https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../brcm,brcmstb-memc-ddr.yaml                | 54 ++++++++++++-------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
index 4b072c879b02..b935894bd4fc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
@@ -11,25 +11,37 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - brcm,brcmstb-memc-ddr-rev-b.1.x
-          - brcm,brcmstb-memc-ddr-rev-b.2.0
-          - brcm,brcmstb-memc-ddr-rev-b.2.1
-          - brcm,brcmstb-memc-ddr-rev-b.2.2
-          - brcm,brcmstb-memc-ddr-rev-b.2.3
-          - brcm,brcmstb-memc-ddr-rev-b.2.5
-          - brcm,brcmstb-memc-ddr-rev-b.2.6
-          - brcm,brcmstb-memc-ddr-rev-b.2.7
-          - brcm,brcmstb-memc-ddr-rev-b.2.8
-          - brcm,brcmstb-memc-ddr-rev-b.3.0
-          - brcm,brcmstb-memc-ddr-rev-b.3.1
-          - brcm,brcmstb-memc-ddr-rev-c.1.0
-          - brcm,brcmstb-memc-ddr-rev-c.1.1
-          - brcm,brcmstb-memc-ddr-rev-c.1.2
-          - brcm,brcmstb-memc-ddr-rev-c.1.3
-          - brcm,brcmstb-memc-ddr-rev-c.1.4
-      - const: brcm,brcmstb-memc-ddr
+    oneOf:
+      - description: Revision > 2.1 controllers
+        items:
+          - enum:
+              - brcm,brcmstb-memc-ddr-rev-b.2.2
+              - brcm,brcmstb-memc-ddr-rev-b.2.3
+              - brcm,brcmstb-memc-ddr-rev-b.2.5
+              - brcm,brcmstb-memc-ddr-rev-b.2.6
+              - brcm,brcmstb-memc-ddr-rev-b.2.7
+              - brcm,brcmstb-memc-ddr-rev-b.2.8
+              - brcm,brcmstb-memc-ddr-rev-b.3.0
+              - brcm,brcmstb-memc-ddr-rev-b.3.1
+              - brcm,brcmstb-memc-ddr-rev-c.1.0
+              - brcm,brcmstb-memc-ddr-rev-c.1.1
+              - brcm,brcmstb-memc-ddr-rev-c.1.2
+              - brcm,brcmstb-memc-ddr-rev-c.1.3
+              - brcm,brcmstb-memc-ddr-rev-c.1.4
+          - const: brcm,brcmstb-memc-ddr-rev-b.2.1
+          - const: brcm,brcmstb-memc-ddr
+      - description: Revision 2.1 controllers
+        items:
+          - const: brcm,brcmstb-memc-ddr-rev-b.2.1
+          - const: brcm,brcmstb-memc-ddr
+      - description: Revision 2.0 controllers
+        items:
+          - const: brcm,brcmstb-memc-ddr-rev-b.2.0
+          - const: brcm,brcmstb-memc-ddr
+      - description: Revision 1.x controllers
+        items:
+          - const: brcm,brcmstb-memc-ddr-rev-b.1.x
+          - const: brcm,brcmstb-memc-ddr
 
   reg:
     maxItems: 1
@@ -46,7 +58,9 @@ additionalProperties: false
 examples:
   - |
     memory-controller@9902000 {
-        compatible = "brcm,brcmstb-memc-ddr-rev-c.1.1", "brcm,brcmstb-memc-ddr";
+        compatible = "brcm,brcmstb-memc-ddr-rev-c.1.1",
+                     "brcm,brcmstb-memc-ddr-rev-b.2.1",
+                     "brcm,brcmstb-memc-ddr";
         reg = <0x9902000 0x600>;
         clock-frequency = <2133000000>;
     };
-- 
2.43.0


