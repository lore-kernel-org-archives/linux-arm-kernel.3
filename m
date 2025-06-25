Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DECC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 02:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujct3ldDGWWQEWKX47buqf1vYrAR4bu4IG0VwJz4Ea4=; b=gab0oDFatZVO+Mc5ILRwsBe+XF
	/IC7EVzRa91ZPY3R5kzk7PucUW70EeymghqSgZcFVdwp9DfP/jlCSFKUoVS53piRwWIwLisfg9ZbA
	HxfCjl99dAvDb/tylrpn73kmGxQpzxI4gqrfqRThZNKbhlrBreSchcyW6XnrNgwCWzWy5+hRkF1Qq
	IE2zhppUb4Hsf2N3ZklyL781Kfp2WclT6M6B/MkJQZdnlEADguz0i0n361BgoeHnKyLKiBVRIZ1O+
	syQbAZj4nryae4UNFyiOeix4JpCvoKxfz4e6Q2DWztF20qip7aEJb/+g+AjASN/P/wvDR7yanXZkF
	HAQx9M5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcmH-0000000AUkM-2fgg;
	Thu, 26 Jun 2025 02:55:53 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcUh-0000000ASWC-27eY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 02:37:44 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250626023741epoutp03d7330496bd7296ce842a5a663c58ed8c~Mdz2q3qMZ1724017240epoutp03b
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:37:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250626023741epoutp03d7330496bd7296ce842a5a663c58ed8c~Mdz2q3qMZ1724017240epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750905461;
	bh=ujct3ldDGWWQEWKX47buqf1vYrAR4bu4IG0VwJz4Ea4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNh7rayIJ6kFiSjiC1mwwHuEAJVgLPMoXRhRr7Y4oywZJmYNmJ3nULl99wm5Dq+w5
	 JB1XWwNtLL1DA8+iP4cMoJLFYjX+LaVBXDQzTRyBo7HEv+UwfrKeVhQbfUTffib3MV
	 6ic5kNnPddKk9uuL4yuTtDSpH731juEOpNcRUuuU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250626023741epcas5p496162c0bb4cf12950d4bace903c720f4~Mdz2BkYUA1443814438epcas5p4M;
	Thu, 26 Jun 2025 02:37:41 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.183]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bSNBq32X1z2SSKf; Thu, 26 Jun
	2025 02:37:39 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03~MV1oJTTWu0056800568epcas5p3W;
	Wed, 25 Jun 2025 16:53:19 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625165316epsmtip2a6224bb8663ab3eedbccc0797d0ad7bf~MV1lZ_oLN1750817508epsmtip2W;
	Wed, 25 Jun 2025 16:53:16 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-fsd@tesla.com
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v2 07/10] dt-bindings: phy: Add PHY bindings support for FSD
 SoC
Date: Wed, 25 Jun 2025 22:22:26 +0530
Message-ID: <20250625165229.3458-8-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625165229.3458-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03
References: <20250625165229.3458-1-shradha.t@samsung.com>
	<CGME20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_193743_855002_EF0E2862 
X-CRM114-Status: GOOD (  12.75  )
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

Document PHY device tree bindings for Tesla FSD SoCs.

Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 .../bindings/phy/samsung,exynos-pcie-phy.yaml | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
index 41df8bb08ff7..4dc20156cdde 100644
--- a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
@@ -15,10 +15,13 @@ properties:
     const: 0
 
   compatible:
-    const: samsung,exynos5433-pcie-phy
+    enum:
+      - samsung,exynos5433-pcie-phy
+      - tesla,fsd-pcie-phy
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   samsung,pmu-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -30,6 +33,24 @@ properties:
     description: phandle for FSYS sysreg interface, used to control
                  sysreg registers bits for PCIe PHY
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - tesla,fsd-pcie-phy
+    then:
+      description:
+        The PHY controller nodes are represented in the aliases node
+        using the following format 'pciephy{n}'. Depending on whether
+        n is 0 or 1, the phy init sequence is chosen.
+      properties:
+        reg:
+          items:
+            - description: PHY
+            - description: PCS
+
 required:
   - "#phy-cells"
   - compatible
-- 
2.49.0


