Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFC1CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 03:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAKHIMC+SGgb607BRAlenii1CobqGR9qOX07bcaTIu0=; b=Ieoo/a76uNw/CRrI6kGXtFHiTc
	Skp1Mu/4Ml6xId6kkmSKVNqPvYdCkv2WqJ+qF/K7jSblcdcbjJ1l5SoWphngshDt/7Mjw5L9RBALO
	JTIQFv2rtkLh8tjqYlODBF3l+Nu1NVst2VPB7bCoF5HQDgJ2d99wPJvWxWS0bRc99YvQnoxvrN15r
	4HTgNAX58z4ZCIxgI3hwGe8WwWD1Z2YAqIF0B1ZRt7HQO1SH2lcmAVXKWlu+M/emEoZdDobUlSN5Q
	vQ/qhlR59vOCW4iyJ2OwUTRYpygaVq6DB/h0doNjva0VD60eV3LnJxr0ludj+9VLu7VEGzhB0+uh+
	dz6TY5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3RSd-000000043N2-15EC;
	Tue, 30 Sep 2025 03:55:31 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3RSZ-000000043LT-2MbI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 03:55:29 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250930035523epoutp03a866ffc3ade07ea1f92f166af14815dc~p8zF3_8vl3077530775epoutp03T
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 03:55:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250930035523epoutp03a866ffc3ade07ea1f92f166af14815dc~p8zF3_8vl3077530775epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759204523;
	bh=OAKHIMC+SGgb607BRAlenii1CobqGR9qOX07bcaTIu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifyQouFSGONTM7Qqzq+msnwCGfAhGfONx4PDxuP83CVvFnrzLo8TvsZjFHNq+mhdA
	 ouTs1fgA0IQeOUghS71iWxf/2PjnCqo09nBN+wSAwoLU8e71ZQUg1qmEuWpLu7AEgb
	 T408bQus/Cr4pQrlUmbH6ztIxLJVLJKu6TiHikcA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250930035523epcas5p23c238981ff1efe5bf2c24f04766373e8~p8zFo_kiA2195921959epcas5p2G;
	Tue, 30 Sep 2025 03:55:23 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cbPN967Dtz3hhT3; Tue, 30 Sep
	2025 03:55:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663~p8zEG_8yz2319723197epcas5p4h;
	Tue, 30 Sep 2025 03:55:21 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250930035518epsmtip13069665488924124e1d46773ced32431~p8zBxTW5-2942629426epsmtip1Q;
	Tue, 30 Sep 2025 03:55:18 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
	alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
	ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 01/29] dt-bindings: media: mfc: Add Exynos MFC devicetree
 binding
Date: Tue, 30 Sep 2025 09:33:20 +0530
Message-Id: <20250930040348.3702923-2-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
	<CGME20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_205528_256509_39615C24 
X-CRM114-Status: GOOD (  16.58  )
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

Introduce a new DT binding file for exynos-mfc

Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
which describes the Exynos Multi‑Format Codec (MFC) IP.  The schema
covers the core node properties, required fields, and provides an
example snippet.

Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
---
 .../bindings/media/samsung,exynos-mfc.yaml    | 77 +++++++++++++++++++
 MAINTAINERS                                   | 10 +++
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml

diff --git a/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
new file mode 100644
index 000000000000..fbed987fb9cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/samsung,exynos-mfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Multi Format Codec (MFC)
+
+maintainers:
+  - Nagaraju Siddineni <nagaraju.s@samsung.com>
+  - Himanshu Dewangan <h.dewangan@samsung.com>
+
+description:
+  Multi Format Codec (MFC) is the IP present in Samsung SoCs which
+  supports high resolution decoding and encoding functionalities.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - samsung,exynos-mfc            # Exynos920
+          - samsung,mfc_core0_mem         # Reserved Memory
+          - samsung,mfc_core1_mem         # Reserved Memory
+
+  power-domains:
+    maximum: 1
+
+  memory-region:
+    minimum: 1
+    maximum: 2
+
+additionalProperties: true
+
+patternProperties:
+  "^mfc_core[0-9]$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - samsung,exynos-mfc-core
+      reg:
+        maximum: 1
+      interrupts:
+        maximum: 1
+      clocks:
+        minimum: 1
+        maximum: 1
+      clock-names:
+        items:
+          - const: aclk_mfc
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - clock-names
+      - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    mfc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        compatible = "samsung,exynos-mfc";
+        mfc_core0: MFC-0@19cd0000 {
+          #address-cells = <2>;
+          #size-cells = <2>;
+          compatible = "samsung,exynos-mfc-core";
+          reg = <0x0 0x19ED0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>;
+          power-domains = <&pd_mfc>;
+          clocks = <&cmu_top 2000>;
+          clock-names = "aclk_mfc";
+          };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 156fa8eefa69..e47016804ac8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3374,6 +3374,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
 F:	drivers/media/platform/samsung/s5p-mfc/
 
+ARM/SAMSUNG EXYNOS SERIES Multi Format Codec (MFC) SUPPORT
+M:	Nagaraju Siddineni <nagaraju.s@samsung.com>
+M:	Himanshu Dewangan <h.dewangan@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
+F:	drivers/media/platform/samsung/exynos-mfc/
+F:	drivers/media/platform/samsung/exynos-mfc/base/
+
 ARM/SOCFPGA ARCHITECTURE
 M:	Dinh Nguyen <dinguyen@kernel.org>
 S:	Maintained
-- 
2.34.1


