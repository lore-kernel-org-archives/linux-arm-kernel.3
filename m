Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146A0CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbBTIKlUsm+fUMo3p93EQYKgatFHNs8/LrncSrVknJ4=; b=WZFgy6xWFodLiXVYv4OmqvLZ0g
	Cm4DR6z7y1+Izepy1OqbchFzbtMrdbKUDX4Onpzhq9PEOEGXrprTHIDSpIxdhZKdpgZAgKLcB9mMK
	uAk/qoYF8LvLiXRDemBtcQV2GVMbh2TSVd299JcgSxG5gDnDVkj5cYhnN6zfpMlwGZGEb0w0tX1Op
	RYBV5P5xmnatiFbEdJtMoWeKH2EagwngcTR5vPL2TrfMzwhlAqB8MGLzpnUqis9aVHorMS3jYQ6GA
	S/f+sG6m/TpLVUaF7oD3gS7GUAn20YjGWXB1bx4orZebe82XuR5tPGmKrCGnQS1vt9LW04BevhOV7
	JNSgsMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lWP-00000009ARB-2gya;
	Thu, 25 Sep 2025 12:56:29 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lWM-00000009AQO-06Sh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 12:56:28 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250925125618epoutp0119aa4559aeff947d097f9a7b86b8de19~oh88wwk611567915679epoutp01I
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 12:56:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250925125618epoutp0119aa4559aeff947d097f9a7b86b8de19~oh88wwk611567915679epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758804978;
	bh=sbBTIKlUsm+fUMo3p93EQYKgatFHNs8/LrncSrVknJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ftnoyTJNDnuE3wMklZVGTR3uyvAsjzVEtYe7tttcG0/aF75gofmPA9Ez6+DPo+Glm
	 O1bwAks9mZkWFIuPctC3pKWszKdfzG+gXYNu+GUdToYdk+8ec74GStvSU+Jz3kpoD6
	 Q98te0MBO39beQNyGE1d5nkWUOQPP+gNqQeluhRE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250925125617epcas5p258f1d5eb1ab6ceb3591d600ccf2cb517~oh88IYSCa1889718897epcas5p27;
	Thu, 25 Sep 2025 12:56:17 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cXYcc5b6Bz3hhT7; Thu, 25 Sep
	2025 12:56:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250925125616epcas5p37346312c6a788a5398212f671d8a369d~oh86sofha0855708557epcas5p3x;
	Thu, 25 Sep 2025 12:56:16 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250925125612epsmtip26569cab259c9303bb01922db01796ca7~oh83iUIpg1532515325epsmtip2S;
	Thu, 25 Sep 2025 12:56:12 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add mfc clock
 definitions
Date: Thu, 25 Sep 2025 18:34:55 +0530
Message-Id: <20250925130457.3476803-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925130457.3476803-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925125616epcas5p37346312c6a788a5398212f671d8a369d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925125616epcas5p37346312c6a788a5398212f671d8a369d
References: <20250925130457.3476803-1-raghav.s@samsung.com>
	<CGME20250925125616epcas5p37346312c6a788a5398212f671d8a369d@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_055627_655896_33BB3E0A 
X-CRM114-Status: GOOD (  15.03  )
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

Add device tree clock binding definitions for CMU_MFC

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index b2dfe6ed353a..5bf905f88a1a 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -39,6 +39,7 @@ properties:
       - samsung,exynosautov920-cmu-hsi1
       - samsung,exynosautov920-cmu-hsi2
       - samsung,exynosautov920-cmu-m2m
+      - samsung,exynosautov920-cmu-mfc
       - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
@@ -247,6 +248,26 @@ allOf:
             - const: noc
             - const: jpeg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-mfc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_MFC MFC clock (from CMU_TOP)
+            - description: CMU_MFC WFD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: mfc
+            - const: wfd
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 0342a988565a..970d05167fc6 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -300,4 +300,9 @@
 #define CLK_MOUT_M2M_NOC_USER           2
 #define CLK_DOUT_M2M_NOCP               3
 
+/* CMU_MFC */
+#define CLK_MOUT_MFC_MFC_USER           1
+#define CLK_MOUT_MFC_WFD_USER           2
+#define CLK_DOUT_MFC_NOCP               3
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.34.1


