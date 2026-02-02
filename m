Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DC0E73151
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rkA62EyICvB2Oj4g0Lcl7ZwX6bRw380njYJqIERUKo=; b=F2nO5R/RF5MtjFb81DQoA0100d
	kr6sLUJjwoTTX2vJKEcRDgntXTY+y6gMbw2d7GSoOeZnXYYkPH8Lpre2t0lpkCSASf3U21j6+nV6s
	TjCEgPfQF3oq7x6jPRskUvZKLreT4V+QEf5tjZOwCEviJJcZdHxlO2J6r45EaLbTh9i9H+E6Qq73K
	lNbUDFLHgjMNBbwyfw8YnDBIw2l3I+pri34Ojd79l1jDWnZC+943rS0sAMT99FQGmQrlahSIoluNW
	hg3yNxJhOi5YpW7YCDPR6gPh1munH9S7s6yfQPlIvwvcz3RPC+1IuvF/tlReyK1BOYy7C4+XGXz39
	HThFlgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr2O-00000004nmn-0czp;
	Mon, 02 Feb 2026 10:20:08 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr2K-00000004nlX-1rrJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:20:06 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260202101957epoutp030833df7a75c814f64f29226bec1247a8~QZrjq7XA01101611016epoutp03-
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Feb 2026 10:19:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260202101957epoutp030833df7a75c814f64f29226bec1247a8~QZrjq7XA01101611016epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770027598;
	bh=7rkA62EyICvB2Oj4g0Lcl7ZwX6bRw380njYJqIERUKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p8q74+peu7TsmZxkxckGaO8nBVpKM4EQYjwQwOcv+LpPRmrgd9RBfsBfoxQDTpaqt
	 Y0VljGAe1k9Z+w04s7mNA1RIiotdZ8jwtzr6bxViuteOnYfVKflqf18VgGaUlF+gei
	 SRCugQQ0kuItxPglL6qwO6b52GZg4/mmw1I6ZrTE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260202101956epcas5p4f5ddc6ca95705d2df5dbe0da14bf8ae0~QZrio5skk1684616846epcas5p41;
	Mon,  2 Feb 2026 10:19:56 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4f4N0C5MrLz6B9m6; Mon,  2 Feb
	2026 10:19:55 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260202101954epcas5p27735b03488efceba5d7f970931905ec5~QZrgxJzbN0775007750epcas5p22;
	Mon,  2 Feb 2026 10:19:54 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260202101952epsmtip18aba22eca8314236102eb90dda3f28a7~QZreYo_hN1761017610epsmtip1W;
	Mon,  2 Feb 2026 10:19:52 +0000 (GMT)
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
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add G3D clock
 definitions
Date: Mon,  2 Feb 2026 16:05:53 +0530
Message-Id: <20260202103555.2089376-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202103555.2089376-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260202101954epcas5p27735b03488efceba5d7f970931905ec5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260202101954epcas5p27735b03488efceba5d7f970931905ec5
References: <20260202103555.2089376-1-raghav.s@samsung.com>
	<CGME20260202101954epcas5p27735b03488efceba5d7f970931905ec5@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_022004_904532_011AB98C 
X-CRM114-Status: GOOD (  12.27  )
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

Add device tree clock binding definitions for CMU_G3D

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 1318720193b3..6b1fc61a2ff9 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -35,6 +35,7 @@ properties:
       - samsung,exynosautov920-cmu-cpucl0
       - samsung,exynosautov920-cmu-cpucl1
       - samsung,exynosautov920-cmu-cpucl2
+      - samsung,exynosautov920-cmu-g3d
       - samsung,exynosautov920-cmu-hsi0
       - samsung,exynosautov920-cmu-hsi1
       - samsung,exynosautov920-cmu-hsi2
@@ -287,6 +288,26 @@ allOf:
             - const: oscclk
             - const: noc
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-g3d
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_G3D SWITCH clock (from CMU_TOP)
+            - description: CMU_G3D NOCP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: switch
+            - const: nocp
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 06dec27a8c77..f2628c220b22 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -309,4 +309,10 @@
 #define CLK_MOUT_MFD_NOC_USER           1
 #define CLK_DOUT_MFD_NOCP               2
 
+/* CMU_G3D */
+#define FOUT_PLL_G3D                    1
+#define CLK_MOUT_G3D_NOC                2
+#define CLK_MOUT_G3D_SWITCH_USER        3
+#define CLK_MOUT_G3D_NOCP_USER          4
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.34.1


