Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC68C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgghNJb4FIzMo8iXgaQHJ4yIVaJ5druGQmkTmZ8wZ00=; b=JMDhBi4DHq0ZT5IS/a/wPgH6Bn
	7hUXGRimteAAHP7H7b9fPp3DNdns/HvWwymhvUWf69U4wxAX6Qxax+IpD6pqBhPRvhKIZ3iIsnGjt
	s4NLnuWvOYLOoBnMkM36wW7RQaSSjPFMAtCwfM4P5moS1I4fJ21YP2RskvPGRZ5ooiA+0/s3x8nUa
	n3/6ywjMn0HpB0ngw99/YjSDXCJx8lFZAPhP0Nbx5h8bLhVAGsIhJj6a1FvILpgSdhwqZHgpJduAt
	4Cr099M+yaLhPMrkpayR3g5AAPX7xtHGdJusskbT2vFC4PbbXyDfXNkXdnCk31zPX3gd/sKNj3fyw
	5DatdzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogNd-000000058kV-1US9;
	Tue, 28 Jul 2026 11:53:53 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogNC-000000058Ut-1lPm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:53:27 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260728115323epoutp02f930c9da0053ca21441b3a0116574f10~GcfXcBs_t2459224592epoutp02N
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:53:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260728115323epoutp02f930c9da0053ca21441b3a0116574f10~GcfXcBs_t2459224592epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239603;
	bh=wgghNJb4FIzMo8iXgaQHJ4yIVaJ5druGQmkTmZ8wZ00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbOwTmlWntUKPhBuqjyIwHP1sSZjsDOVVBucrNuga22gmzY8RrozFEw+MyeH/DJ0Y
	 bHRHBnriA90YHq/OCaOYd6Gl/TtOmWS4i9OFJC56FlWTOd8yUJHqR65cAaiieF8Hgk
	 0Y/B5umfVQwzxhto/rq+frGfd36quu/SAJ9A91co=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260728115322epcas5p4ec3601f04170b70e16419bc805835c36~GcfW5A8Kw2034920349epcas5p4B;
	Tue, 28 Jul 2026 11:53:22 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8Ykn3VkNz2SSKY; Tue, 28 Jul
	2026 11:53:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728115320epcas5p2513ae3cae8e7919a178d6b34bb206c2b~GcfVaJYVm0514205142epcas5p2m;
	Tue, 28 Jul 2026 11:53:20 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115318epsmtip13512e1b28cb5d6255c66336037162527~GcfS1Qv8Z2235622356epsmtip1h;
	Tue, 28 Jul 2026 11:53:17 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 11/13] dt-bindings: clock: exynos8855: add usb clock
 definitions
Date: Tue, 28 Jul 2026 17:41:09 +0530
Message-Id: <20260728121111.2077860-12-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115320epcas5p2513ae3cae8e7919a178d6b34bb206c2b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115320epcas5p2513ae3cae8e7919a178d6b34bb206c2b
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115320epcas5p2513ae3cae8e7919a178d6b34bb206c2b@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045326_787869_00D61B9C 
X-CRM114-Status: GOOD (  12.03  )
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

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 12 +++++++++++
 2 files changed, 33 insertions(+)

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
index 44484a9d67f5..bf76464298d2 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -59,6 +59,10 @@
 #define CLKCMU_MOUT_HSI_UFS_EMBD           47
 #define CLKCMU_DOUT_HSI_NOC                48
 #define CLKCMU_DOUT_HSI_UFS_EMBD           49
+#define CLKCMU_MOUT_USB_NOC                50
+#define CLKCMU_MOUT_USB_USB20DRD           51
+#define CLKCMU_DOUT_USB_NOC                52
+#define CLKCMU_DOUT_USB_USB20DRD           53
 
 /* CMU_PERIC */
 #define CLK_MOUT_PERIC_IP_USER             1
@@ -105,4 +109,12 @@
 #define CLK_GOUT_CMU_HSI_IPCLKPORT_PCLK    3
 #define CLK_GOUT_SYSREG_HSI_IPCLKPORT_PCLK 4
 
+/* CMU_USB */
+#define CLK_MOUT_USB_NOC_USER              1
+#define CLK_MOUT_USB_USB20DRD              2
+#define CLK_MOUT_USB_USB20DRD_USER         3
+#define CLK_DOUT_USB_NOC_DIV3              4
+#define CLK_GOUT_CMU_USB_IPCLKPORT_PCLK    5
+#define CLK_GOUT_SYSREG_USB_IPCLKPORT_PCLK 6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


