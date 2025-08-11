Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BC5CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 05:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBzSCiCSIVFrfQVxZfEKGPmo5+c0wpF19H3LS0hAlsE=; b=XnZ7nSBcsFJOiqDhkjpomgfOJk
	liQaXw5Npbb6GhdUkEd7uC1ddL5lk4mIQC9U3DwVCbU7i2elsDfthbAfd/f+Q20b5NKaC84Cdul59
	9fAQBEB5XpCsKpS7tlizkwZJRviiCP/U17lPXxeLsPWcTEe9K4VLS7vvKbg2dd6Vlehl/u8SOgnYz
	qjxSlgBWzNyBqaE5hz8YVIJrWvuj1wTatiQ3BbxfCxfWP52h+1/EgLJyxxBGfvsxtHxE13OVmzyMR
	RohBko87OOW5TazQMiJkAGJL6m5ffvzJdGFuRL+uL4cCcv+BnTtxOUMl3nkxVyH9VwEpKVsfqTbsd
	a3R/T6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhWn-00000009sOU-32cO;
	Tue, 12 Aug 2025 05:26:29 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulh9Z-00000009paL-2ppx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 05:02:31 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250812050228epoutp04b82b6e54e8c0076635b47c7ed466e0d3~a7GrAJzh_1492314923epoutp04W
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:02:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250812050228epoutp04b82b6e54e8c0076635b47c7ed466e0d3~a7GrAJzh_1492314923epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754974948;
	bh=EBzSCiCSIVFrfQVxZfEKGPmo5+c0wpF19H3LS0hAlsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V3Dwu01p157JU9aDuPtciupnpj/piBbAP4NfqmIbZlCvVibQbhNYllNXmMsCdFXE4
	 YSGIwf+uMtY/rK/dPrpXWD0W7ffG/CdxU83FICGZrBw9Udlr73m2VqItvCvR5ME3kr
	 EWCX9KK9Xn/Ejvy4BhcBfZNCsV936c2lXDaVwuzo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250812050227epcas5p23ec69f59c3845ad521eef053b9827029~a7Gqjk6LU0479704797epcas5p2u;
	Tue, 12 Aug 2025 05:02:27 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c1KBB2ZBpz2SSKY; Tue, 12 Aug
	2025 05:02:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250811154729epcas5p456ddb0d1ba34b992204f54724b57a401~awQktGyX_2612226122epcas5p44;
	Mon, 11 Aug 2025 15:47:29 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250811154727epsmtip10f1370b9b4a42104a2120af22d683fe8~awQiFM6iH2596225962epsmtip1G;
	Mon, 11 Aug 2025 15:47:27 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v3 08/12] dt-bindings: phy: Add PCIe PHY support for FSD SoC
Date: Mon, 11 Aug 2025 21:16:34 +0530
Message-ID: <20250811154638.95732-9-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811154638.95732-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250811154729epcas5p456ddb0d1ba34b992204f54724b57a401
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250811154729epcas5p456ddb0d1ba34b992204f54724b57a401
References: <20250811154638.95732-1-shradha.t@samsung.com>
	<CGME20250811154729epcas5p456ddb0d1ba34b992204f54724b57a401@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_220230_031837_DB58C6ED 
X-CRM114-Status: GOOD (  14.68  )
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

Since Tesla FSD SoC uses Samsung PCIe PHY, add support in
exynos PCIe PHY bindings.

In Tesla FSD SoC, the two PHY instances, although having identical
hardware design and register maps, are placed in different locations
(Placement and routing) inside the SoC and have distinct
PHY-to-Controller topologies. (One instance is connected to two PCIe
controllers, while the other is connected to only one). As a result,
they experience different analog environments, including varying
channel losses and noise profiles.

Since these PHYs lack internal adaptation mechanisms and f/w based
tuning, manual register programming is required for analog tuning.
To ensure optimal signal integrity, it is essential to use different
register values for each PHY instance, despite their identical hardware
design. This is because the same register values may not be suitable
for both instances due to their differing environments and topologies.

Due to this, we are using two PHY compatibles for different PHY
instances.

Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 .../bindings/phy/samsung,exynos-pcie-phy.yaml | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
index 41df8bb08ff7..6295472696db 100644
--- a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
@@ -15,10 +15,14 @@ properties:
     const: 0
 
   compatible:
-    const: samsung,exynos5433-pcie-phy
+    enum:
+      - samsung,exynos5433-pcie-phy
+      - tesla,fsd-pcie-phy0
+      - tesla,fsd-pcie-phy1
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   samsung,pmu-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -30,6 +34,25 @@ properties:
     description: phandle for FSYS sysreg interface, used to control
                  sysreg registers bits for PCIe PHY
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - tesla,fsd-pcie-phy0
+              - tesla,fsd-pcie-phy1
+    then:
+      properties:
+        reg:
+          items:
+            - description: PHY
+            - description: PCS
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 required:
   - "#phy-cells"
   - compatible
-- 
2.49.0


