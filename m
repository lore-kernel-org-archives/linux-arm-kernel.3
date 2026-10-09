Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84BFCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNE23QaDNLY3/tsvq3NkcS3U8URyxQyHlVbcIU2tINg=; b=YPXDTpspIwogoxwMrw9rgXNKlP
	XJ89aK5FqJYU/loui8NtdyHKDlJoBse483ZDvTi7z1WqW8s/zSUviq3Q+CiTcm9+O/Z7CqJ2nUD6J
	nEOP4j2jz+gH8cIV30N3wQZGXBWs3vOJk0Krlp5l/vdKelJkGAbC/vQwpe0zQ2GOZOfu1CMP2rq6y
	4FjNSUb7+sig0ShVfzJ47Pw7KkCElRETdNEoGQDZMAVhM3YOOQfo5TbRrtBqmVw8eeNvt6ismEib6
	YJJfPwXedtbgPnTaTg7ATySLVZ3i2JMnjRmga0NEZqdi//fZiDq5k4KgSmYo7yjSKvGSPS/KMw6mx
	00z5hjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF912-00000006CSP-2PSs;
	Fri, 09 Oct 2026 11:43:56 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF90y-00000006CP5-3ZR1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:43:54 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261009114347epoutp02ae5bfd6a74b7e7845f26609fef61076c~c2c1ItadS1702117021epoutp02X
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:43:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261009114347epoutp02ae5bfd6a74b7e7845f26609fef61076c~c2c1ItadS1702117021epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546227;
	bh=UNE23QaDNLY3/tsvq3NkcS3U8URyxQyHlVbcIU2tINg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=feqWSJiGcgZwvcl8St5kIuvjUc/9YtqF7RYJN7CLy5Nbqrmc6cHUliaHBjtGJW09S
	 5TPjHLSfJpLJ4i4RC3/tJT3BKViTiZKsSef+CNw6LTY9aat5iUln00GHQwvrRUAOTz
	 JcL4HwJUogXW7LhGkIIIbOmhfMAnwXGa5JVhW6LU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261009114346epcas5p3cec82a1fc9f19a53855fb5aa4e5660aa~c2c0jdC-R0307103071epcas5p3u;
	Fri,  9 Oct 2026 11:43:46 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j1Q416WSkz3hhT3; Fri,  9 Oct
	2026 11:43:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d~c2czMx7Cx1488414884epcas5p4g;
	Fri,  9 Oct 2026 11:43:45 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114342epsmtip2c38ba747e36fbd62a04b0d9078f08478~c2cw4k6Pz0916809168epsmtip2A;
	Fri,  9 Oct 2026 11:43:42 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 05/14] dt-bindings: clock: exynos8855: add usb clock
 definitions
Date: Fri,  9 Oct 2026 17:31:28 +0530
Message-Id: <20261009120137.2801911-6-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044353_224036_E1050E26 
X-CRM114-Status: GOOD (  11.96  )
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

Add device tree clock binding definitions for CMU_USB

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index e97b65f8be5f..736d3429bf4c 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
+      - samsung,exynos8855-cmu-usb
 
   clocks:
     minItems: 1
@@ -126,6 +127,26 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-usb
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_USB NOC clock (from CMU_TOP)
+            - description: CMU_USB USB20DRD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: usb20drd
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 67cd97d8fab8..f4261956ab4a 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -222,4 +222,12 @@
 #define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
 #define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
 
+/* CMU_USB */
+#define CLK_MOUT_USB_NOC_USER              1
+#define CLK_MOUT_USB_USB20DRD              2
+#define CLK_MOUT_USB_USB20DRD_USER         3
+#define CLK_DOUT_USB_NOC_DIV3              4
+#define CLK_GOUT_CMU_USB                   5
+#define CLK_GOUT_SYSREG_USB                6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


