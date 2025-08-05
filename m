Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F472C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 23:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T78qPMF0xY/QMAqBYbYlslsurulUTh7+b+M+WcQ09K8=; b=klLmQMabi+NpeH6oyJBICZFPN2
	tFH1J7vX5qY2/8lKQLdAq46Au8hZJm64n7SSHpK1LYuU1r/jTtEEFYOTxGTvs4XocWsJ5L8XqU01v
	5kodzmri9ar2+Iosv39zMsV0vRCteRYPGMEbDsk3uEpw0B7MtUTcRvlOUmjFzLEh8kGGCa3G5vf/+
	zP7WJ0PM4Q5pv/P5dCF9SqD1hVQ0RVN9woVtHA/GLf9il8JAHdKDvjLWTFarwYNOkICntzWC9Z8bB
	cCDLuXjIf5EQi10moXzuHJ9YtJe2NWSEl1VTHVBy1G3crRlmUMf0QjjjhEd0XfcwIObGONrneSHwZ
	MW0W+L+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujR4T-0000000DynR-3USk;
	Tue, 05 Aug 2025 23:27:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujR1r-0000000DyOI-2JLj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 23:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 774985C5E3B;
	Tue,  5 Aug 2025 23:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F147BC4CEF0;
	Tue,  5 Aug 2025 23:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754436310;
	bh=spxvj8UNBEpa1KElVKtvKTp6JsUr2gQ3EwBu5q7Clr0=;
	h=From:To:Cc:Subject:Date:From;
	b=jZUYJUGQdwurbIsCPFisLJBwN14mKXusjvlS/41MI/++kJNrkutxtVT7pRqPDiD9c
	 RIlAor8U6IMv5BeLXgm5fk3PgeZ1h16J8dTloNvVHMU/TDd1UhAQPhXm2PWNXm1Hl8
	 K+2JVLUN65NJ6EwNzQnYRXHsxC3O5XeXmGd291PNtYJ+3dqZS0iLiKQdQ70RWYGEeu
	 V5tpQfxgaHa3t69l/z8oiLqSltHduCUt3nDNGPeBdXu/j0HmkIzuxK+9G3HQnGuYo5
	 oxU7r37FWnVwCgQpiV8iIWyjPkzp2O9OVysrhnCF+OlcSDukPTtNflsXI0tB2QXFZO
	 c4PHmtQtlf/dQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: marvell: Convert marvell,armada-370-xp boards to DT schema
Date: Tue,  5 Aug 2025 18:25:00 -0500
Message-ID: <20250805232502.2827725-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_162511_678763_2B023AF4 
X-CRM114-Status: GOOD (  11.68  )
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

Convert Marvell Armada 370/XP based boards to DT schema format.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/marvell/98dx3236.txt         | 23 ------
 .../bindings/arm/marvell/armada-370-xp.txt    | 24 ------
 .../arm/marvell/marvell,armada-370-xp.yaml    | 78 +++++++++++++++++++
 3 files changed, 78 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/98dx3236.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-370-xp.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,armada-370-xp.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt b/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt
deleted file mode 100644
index 64e8c73fc5ab..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Marvell 98DX3236, 98DX3336 and 98DX4251 Platforms Device Tree Bindings
-----------------------------------------------------------------------
-
-Boards with a SoC of the Marvell 98DX3236, 98DX3336 and 98DX4251 families
-shall have the following property:
-
-Required root node property:
-
-compatible: must contain "marvell,armadaxp-98dx3236"
-
-In addition, boards using the Marvell 98DX3336 SoC shall have the
-following property:
-
-Required root node property:
-
-compatible: must contain "marvell,armadaxp-98dx3336"
-
-In addition, boards using the Marvell 98DX4251 SoC shall have the
-following property:
-
-Required root node property:
-
-compatible: must contain "marvell,armadaxp-98dx4251"
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-370-xp.txt b/Documentation/devicetree/bindings/arm/marvell/armada-370-xp.txt
deleted file mode 100644
index c6ed90ea6e17..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-370-xp.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Marvell Armada 370 and Armada XP Platforms Device Tree Bindings
----------------------------------------------------------------
-
-Boards with a SoC of the Marvell Armada 370 and Armada XP families
-shall have the following property:
-
-Required root node property:
-
-compatible: must contain "marvell,armada-370-xp"
-
-In addition, boards using the Marvell Armada 370 SoC shall have the
-following property:
-
-Required root node property:
-
-compatible: must contain "marvell,armada370"
-
-In addition, boards using the Marvell Armada XP SoC shall have the
-following property:
-
-Required root node property:
-
-compatible: must contain "marvell,armadaxp"
-
diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,armada-370-xp.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,armada-370-xp.yaml
new file mode 100644
index 000000000000..e65eadfbd097
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,armada-370-xp.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+---
+$id: http://devicetree.org/schemas/arm/marvell/marvell,armada-370-xp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 370 and Armada XP platforms
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ctera,c200-v2
+              - dlink,dns327l
+              - globalscale,mirabox
+              - netgear,readynas-102
+              - netgear,readynas-104
+              - marvell,a370-db
+              - marvell,a370-rd
+              - seagate,dart-2
+              - seagate,dart-4
+              - seagate,cumulus-max
+              - seagate,cumulus
+              - synology,ds213j
+          - const: marvell,armada370
+          - const: marvell,armada-370-xp
+
+      - items:
+          - enum:
+              - mikrotik,crs305-1g-4s
+              - mikrotik,crs326-24g-2s
+              - mikrotik,crs328-4c-20s-4s
+          - const: marvell,armadaxp-98dx3236
+          - const: marvell,armada-370-xp
+
+      - items:
+          - const: marvell,db-xc3-24g4xg
+          - const: marvell,armadaxp-98dx3336
+          - const: marvell,armada-370-xp
+
+      - items:
+          - const: marvell,db-dxbc2
+          - const: marvell,armadaxp-98dx4251
+          - const: marvell,armada-370-xp
+
+      - items:
+          - enum:
+              - lenovo,ix4-300d
+              - linksys,mamba
+              - marvell,rd-axpwifiap
+              - netgear,readynas-2120
+              - synology,ds414
+          - const: marvell,armadaxp-mv78230
+          - const: marvell,armadaxp
+          - const: marvell,armada-370-xp
+
+      - items:
+          - const: plathome,openblocks-ax3-4
+          - const: marvell,armadaxp-mv78260
+          - const: marvell,armadaxp
+          - const: marvell,armada-370-xp
+
+      - items:
+          - enum:
+              - marvell,axp-db
+              - marvell,axp-gp
+              - marvell,axp-matrix
+          - const: marvell,armadaxp-mv78460
+          - const: marvell,armadaxp
+          - const: marvell,armada-370-xp
+
+additionalProperties: true
-- 
2.47.2


