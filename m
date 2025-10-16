Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21579CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 01:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPIqUKZbCOQQBlt+nRGw1V0cNv+2d6FyaAAox0Rs/VY=; b=lfpdh+BDXnigXw+VC8+i3qpGky
	/d8KEX5WFahnYI2kP2jjsY4FWASdWpuhsEEtDgSuG3dCgxI240kFdK2bTk6dnZBFGhx1fx8yenbHf
	UwWwqUAROFqYNHCMJmi5CwnBptHSdUUGsgdwjP1uYudyGGKR/HfmZPQx14ujtKqkISuA2E7oEESrP
	xSxBt9kmNgD2qf0shJj3evHI6ekp2+L3PP+hvS4oONha+qqxQ93MoX51TWB8tIOz2cfjidR5BSHjf
	Ujg1O6VZcwoFUOGSNKU9xCuYQf+Tg5AbS8wJxbW5F5EOwQEg7xXmFcVzI8v+YLH6muNNVW7j4kBCq
	mT455qZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Cxy-00000003Dv0-03V1;
	Thu, 16 Oct 2025 01:39:42 +0000
Received: from mo-csw1120.securemx.jp ([210.130.202.131] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Cxu-00000003Du3-3ez7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 01:39:40 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760578760;x=1761788360;bh=DhquJXfwIJXPb+27jcxzHtwxsqB1wZz4m4WsYkpC20g=;b=XMo
	eKsumOG8enFCBctqTXu2QRBPHmDGQmybRSaFJvokxDiu9sGjb8qy56IsLhAf3Fma37KP0iXVTOhy7
	G5BR4rfkxQgqlvhRZGG726lq03bv/eHbMBMRYop5aWU2rI7MkLj9BtvzZN35Wj9MsH7jP+v05kA0k
	TMjTPBeh5oj75eDHGmKfHFRzeNm47h60AyAwVwYOAPdqo1IpIeXyFonz4FcVc63ONvkX5pbzAr4bE
	siBKAcFEL2ggJYB7oEf4JY96QaK1ihvlsf32fpYLxxOcm5/+Y8365ADj2Om3RZmyJLDumWNIFSnXF
	QIdM/EitIuftKR5/CLlOIXxCLABYGTw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 59G1dJZl409905; Thu, 16 Oct 2025 10:39:19 +0900
X-Iguazu-Qid: 2rWhejjBIYgAXkrEwe
X-Iguazu-QSIG: v=2; s=0; t=1760578759; q=2rWhejjBIYgAXkrEwe; m=TjeFf1PYIWwR61zihda6OanuCyy7Qx1w4c7qBLq7BQY=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cn9bp1qzYz4vyq; Thu, 16 Oct 2025 10:39:18 +0900 (JST)
X-SA-MID: 53068310
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: Update identifiers for VIIF on Toshiba Visconti TMPV770x SoC
Date: Thu, 16 Oct 2025 10:33:27 +0900
X-TSB-HOP2: ON
Message-Id: <20251016013328.303611-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016013328.303611-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251016013328.303611-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_183939_558885_7F6292F4 
X-CRM114-Status: GOOD (  10.05  )
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

Update identifiers for the clocks and the resets of Video Input Interface
in order to reflect the actual architecture of TMPV770x SoC.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
 include/dt-bindings/clock/toshiba,tmpv770x.h | 33 +++++++++++++-------
 include/dt-bindings/reset/toshiba,tmpv770x.h | 10 +++++-
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/include/dt-bindings/clock/toshiba,tmpv770x.h b/include/dt-bindings/clock/toshiba,tmpv770x.h
index 5fce713001..2dbd5885c0 100644
--- a/include/dt-bindings/clock/toshiba,tmpv770x.h
+++ b/include/dt-bindings/clock/toshiba,tmpv770x.h
@@ -94,10 +94,10 @@
 #define TMPV770X_CLK_DSP2_PBCLK		77
 #define TMPV770X_CLK_DSP3_PBCLK		78
 #define TMPV770X_CLK_DSVIIF0_APBCLK	79
-#define TMPV770X_CLK_VIIF0_APBCLK	80
-#define TMPV770X_CLK_VIIF0_CFGCLK	81
-#define TMPV770X_CLK_VIIF1_APBCLK	82
-#define TMPV770X_CLK_VIIF1_CFGCLK	83
+#define TMPV770X_CLK_VIIFBS0_APB	80
+#define TMPV770X_CLK_VIIFBS0_CFG	81
+#define TMPV770X_CLK_VIIFBS1_APB	82
+#define TMPV770X_CLK_VIIFBS1_CFG	83
 #define TMPV770X_CLK_VIIF2_APBCLK	84
 #define TMPV770X_CLK_VIIF2_CFGCLK	85
 #define TMPV770X_CLK_VIIF3_APBCLK	86
@@ -121,11 +121,11 @@
 #define TMPV770X_CLK_PYRAMID		104
 #define TMPV770X_CLK_HWA2_ASYNC		105
 #define TMPV770X_CLK_DSP0		106
-#define TMPV770X_CLK_VIIFBS0		107
-#define TMPV770X_CLK_VIIFBS0_L2ISP	108
-#define TMPV770X_CLK_VIIFBS0_L1ISP	109
-#define TMPV770X_CLK_VIIFBS0_PROC	110
-#define TMPV770X_CLK_VIIFBS1		111
+#define TMPV770X_CLK_VIIFBS0_PROC	107
+#define TMPV770X_CLK_VIIF0_L2ISP	108
+#define TMPV770X_CLK_VIIF0_L1ISP	109
+#define TMPV770X_CLK_VIIF0_PROC		110
+#define TMPV770X_CLK_VIIFBS1_PROC	111
 #define TMPV770X_CLK_VIIFBS2		112
 #define TMPV770X_CLK_VIIFOP_MBUS	113
 #define TMPV770X_CLK_VIIFOP0_PROC	114
@@ -141,7 +141,10 @@
 #define TMPV770X_CLK_PIREFCLK		124
 #define TMPV770X_CLK_SBUS		125
 #define TMPV770X_CLK_BUSLCK		126
-#define TMPV770X_NR_CLK			127
+#define TMPV770X_CLK_VIIF1_L2ISP	127
+#define TMPV770X_CLK_VIIF1_L1ISP	128
+#define TMPV770X_CLK_VIIF1_PROC		129
+#define TMPV770X_NR_CLK			130
 
 /* Reset */
 #define TMPV770X_RESET_PIETHER_2P5M	0
@@ -176,6 +179,14 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
-#define TMPV770X_NR_RESET		32
+#define TMPV770X_RESET_VIIFBS0		32
+#define TMPV770X_RESET_VIIFBS0_APB	33
+#define TMPV770X_RESET_VIIFBS0_L2ISP	34
+#define TMPV770X_RESET_VIIFBS0_L1ISP	35
+#define TMPV770X_RESET_VIIFBS1		36
+#define TMPV770X_RESET_VIIFBS1_APB	37
+#define TMPV770X_RESET_VIIFBS1_L2ISP	38
+#define TMPV770X_RESET_VIIFBS1_L1ISP	39
+#define TMPV770X_NR_RESET		40
 
 #endif /*_DT_BINDINGS_CLOCK_TOSHIBA_TMPV770X_H_ */
diff --git a/include/dt-bindings/reset/toshiba,tmpv770x.h b/include/dt-bindings/reset/toshiba,tmpv770x.h
index c1007acb19..d711006d6b 100644
--- a/include/dt-bindings/reset/toshiba,tmpv770x.h
+++ b/include/dt-bindings/reset/toshiba,tmpv770x.h
@@ -36,6 +36,14 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
-#define TMPV770X_NR_RESET		32
+#define TMPV770X_RESET_VIIFBS0		32
+#define TMPV770X_RESET_VIIFBS0_APB	33
+#define TMPV770X_RESET_VIIFBS0_L2ISP	34
+#define TMPV770X_RESET_VIIFBS0_L1ISP	35
+#define TMPV770X_RESET_VIIFBS1		36
+#define TMPV770X_RESET_VIIFBS1_APB	37
+#define TMPV770X_RESET_VIIFBS1_L2ISP	38
+#define TMPV770X_RESET_VIIFBS1_L1ISP	39
+#define TMPV770X_NR_RESET		40
 
 #endif /*_DT_BINDINGS_RESET_TOSHIBA_TMPV770X_H_ */
-- 
2.43.0



