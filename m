Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C90CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 06:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zwQfWuay3Ty+3wy9YuLNvvoME7SVXZGWCq6pQVnpEE=; b=xg9sRLymaTw41nXrm+6mxPbfIO
	bkiJd6Oc+CWeDqsOjztOQ4Nh7axF0aX0g992rQ/tIeSXXqhwhgqSkVomxFUHGO1g4OXa+TMsbX3xU
	416GU482ECN1i+0WIT8Hqumj+EPcIkeYSQsVJXm7FW1aX9NukRUUK6fJNUgKBbmfQzcGb+rvMBsPQ
	rO731TH/LemsjKJx1vmOe+UoJr3JewA4ZEty0+HwqlN/L+dyQ1Rz1w4MKgyc+irw2eNTW+pRqVvOx
	6sPd3UdrDCEj/u+kHgjSNVgGV2QlOH47odXadryfJoxMAHh8hA/SdZyaESUxfIVyuxYwS+rEOlCAJ
	HnXgZ5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR8x-000000075n5-29pV;
	Mon, 25 Aug 2025 06:57:27 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR1S-000000074H1-285h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 06:49:46 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250825064937epoutp01d522525460d9e2c7fbdbf52de03734c7~e787-I1qf2212122121epoutp01T
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 06:49:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250825064937epoutp01d522525460d9e2c7fbdbf52de03734c7~e787-I1qf2212122121epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756104577;
	bh=0zwQfWuay3Ty+3wy9YuLNvvoME7SVXZGWCq6pQVnpEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uAIEGHXma4HZSl2fsbsc3mCLD/zlITFY5Pm8mhXFSOmNs09x4TwdQOjvsEwwfjzKW
	 tgkn9E/M63/X209K326yOMvIYTdz2ODqQjPR7qqRq3YKnJ50WDIq1xoW/AW4W1jRjM
	 6IMdBXTybpqnhecQMz5wbnwE9mzVrROUB9P+Xdik=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250825064936epcas2p33792ac8d90efc01b8f72a26355bc8127~e787MDXBE2272422724epcas2p3X;
	Mon, 25 Aug 2025 06:49:36 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c9Lxq4FB7z6B9mB; Mon, 25 Aug
	2025 06:49:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250825064933epcas2p33e2b4566b5911fef8d7127900fc10002~e7845FXJB0891608916epcas2p3q;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825064933epsmtip191c5581a57f6f807063d18c0d2c7beb1~e784yJ9FZ1035610356epsmtip1p;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: thermal: samsung: Add tmu-name and
 sensor-index-ranges properties
Date: Mon, 25 Aug 2025 15:49:27 +0900
Message-ID: <20250825064929.188101-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825064929.188101-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250825064933epcas2p33e2b4566b5911fef8d7127900fc10002
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825064933epcas2p33e2b4566b5911fef8d7127900fc10002
References: <20250825064929.188101-1-shin.son@samsung.com>
	<CGME20250825064933epcas2p33e2b4566b5911fef8d7127900fc10002@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_234944_005401_451E2AFF 
X-CRM114-Status: GOOD (  18.11  )
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

The exynosautov920 TMU requires per-sensor interrupt enablement
for its critical trip points.
Add two new DT properties to the Samsung thermal bindings
to support this requirement:

- **tmu-name**: an explicit identifier for each TMU,
		used to skip specific sensors
(e.g., sensor 5 is temporarily disabled on the TMU_SUB1 block).

- **sensor-index-ranges**: defines valid sensor index ranges
			   for the driver’s bitmap in private data,
			   enabling per-sensor interrupt setup and data access.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../thermal/samsung,exynos-thermal.yaml       | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 29a08b0729ee..420fb7a944e3 100644
--- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -8,6 +8,7 @@ title: Samsung Exynos SoC Thermal Management Unit (TMU)
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
+  - Shin Son <shin.son@samsung.com>
 
 description: |
   For multi-instance tmu each instance should have an alias correctly numbered
@@ -27,6 +28,7 @@ properties:
       - samsung,exynos5420-tmu-ext-triminfo
       - samsung,exynos5433-tmu
       - samsung,exynos7-tmu
+      - samsung,exynosautov920-tmu
 
   clocks:
     minItems: 1
@@ -62,11 +64,29 @@ properties:
     minItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    enum:
+      - 0
+      - 1
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.
 
+  tmu-name:
+    description: The TMU hardware name.
+    $ref: /schemas/types.yaml#/definitions/string-array
+    minItems: 1
+    maxItems: 1
+
+  sensor-index-ranges:
+    description: |
+      Valid Sensor index ranges for the TMU hardware.
+
+      Note:: On the ExynosautoV920 variant, the fifth sensor in the TMU SUB1 is disabled,
+      so the driver skips it when matching by tmu-name.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+
 required:
   - compatible
   - clocks
@@ -131,6 +151,7 @@ allOf:
               - samsung,exynos5250-tmu
               - samsung,exynos5260-tmu
               - samsung,exynos5420-tmu
+              - samsung,exynosautov920-tmu
     then:
       properties:
         clocks:
-- 
2.50.1


