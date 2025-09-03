Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD42CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+ccpHfpuSvqRE/S9bXMM814UA2wwwc6G81EdmNEHxw=; b=ALVR/U1+yEBIl6pZqW98s7o8+N
	M5wHnTFXMxawnvpqiFOBle3TTJL/DG+a40dsMn2XWHzfISkrc2kwI1dG7+9t5BTs7Irvu6hPg0w+B
	HaFiCCfRIutu0tfZkuo1dtdH/eVoJEH17I+thAN8o/6LQF8T2jDx9iHGmxSTxHuxqSS0nlsf+k33A
	CT8d3JlRzJcSnqUbpFBzu6pGYOXwbI8ej5wbMH6tUCcMvm0nYKtmWA6qlKWz1hzT8Gpfb9bwbAM0g
	VMt6Cd1ILGxYX0bpXv65DgNfFddejTf/xiJvz4oczOOkn4UMIDKm3QjL5+GM5XzZZBkm2G0OkvdXG
	GK2gCXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiag-00000005RaD-2mkO;
	Wed, 03 Sep 2025 08:11:38 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti39-00000005A0C-2inD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:37:02 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250903073655epoutp031f6d9c3daa97e56e959cae6555fb8fa4~htZ0Cx6gz0162801628epoutp03U
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 07:36:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250903073655epoutp031f6d9c3daa97e56e959cae6555fb8fa4~htZ0Cx6gz0162801628epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756885015;
	bh=n+ccpHfpuSvqRE/S9bXMM814UA2wwwc6G81EdmNEHxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W9I06kB8XMxsCyYj1hBm8af6ZUXOgiHp2aaCCIKhm+XyGHWzyj+ZrMfx3TEIL4cXy
	 AXQx7Hb3+nnN1YQWiliYT1GBpu0vROD4jBR7bWYmzwMRA2HY71gJcqjx7RdA+AiWku
	 YhnGrqg1OSKrrQx8dAZkr9jqUPPZLmK0Dpew/194=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250903073654epcas2p2b977e318ee22d780716a3dfe2e24f978~htZzWCftL0888008880epcas2p2N;
	Wed,  3 Sep 2025 07:36:54 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cGvZG1v8wz3hhT9; Wed,  3 Sep
	2025 07:36:54 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250903073653epcas2p4cb25058c97aab9a30c7e68ef5f10fb91~htZyBr--N0242502425epcas2p49;
	Wed,  3 Sep 2025 07:36:53 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903073653epsmtip2e0ddaa81875a8957ac8c69675b5cb1f3~htZx80LMz3060930609epsmtip2m;
	Wed,  3 Sep 2025 07:36:53 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: thermal: samsung: Add tmu-name and
 sensor-index-ranges properties
Date: Wed,  3 Sep 2025 16:36:32 +0900
Message-ID: <20250903073634.1898865-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903073634.1898865-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250903073653epcas2p4cb25058c97aab9a30c7e68ef5f10fb91
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903073653epcas2p4cb25058c97aab9a30c7e68ef5f10fb91
References: <20250903073634.1898865-1-shin.son@samsung.com>
	<CGME20250903073653epcas2p4cb25058c97aab9a30c7e68ef5f10fb91@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_003700_342628_7DF0D44E 
X-CRM114-Status: GOOD (  16.11  )
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
Add a DT property to the Samsung thermal bindings
to support this requirement:

- **samsung,hw-sensor-indices**: Defines the sensors currently
                                 mapped to the TMU hardware.
				 Indices not listed are absent or fused off

Additionally, add myself to the bindings' maintainers list, as I plan
to actively work on the exynosautov920 TMU support and handle further
updates in this area.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../bindings/thermal/samsung,exynos-thermal.yaml | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 29a08b0729ee..abd89902d33a 100644
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
@@ -62,11 +64,22 @@ properties:
     minItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    enum:
+      - 0
+      - 1
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.
 
+  samsung,hw-sensor-indices:
+    description: |
+      List of hardware sensor indices that are physically present and usable
+      in this TMU instance. Indices not listed are either unmapped or unused.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 16
+    uniqueItems: true
+
 required:
   - compatible
   - clocks
@@ -131,6 +144,7 @@ allOf:
               - samsung,exynos5250-tmu
               - samsung,exynos5260-tmu
               - samsung,exynos5420-tmu
+              - samsung,exynosautov920-tmu
     then:
       properties:
         clocks:
-- 
2.50.1


