Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B7BCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 06:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYLnsFAK/JsDqa1LaxS8dAV3NlsE5WCqgyaXiTQaeLg=; b=kGXFNXc+oGY2rPM5KBSBW7/Fdm
	081H87yF8R6i3je40g4yXyjr3kg2oVrmjirdGpJFkmW34NvWqVNexikLaI0NWw92BJXgMyIGu/6OS
	/Hg1KBftjNhu77AiuEtpnm0N6m7o9qGbsDSsiWKnkZi4s6w/f7XgOtxmdTJViSTEtISIA1wNmdOfR
	GHNWm/uVGE9k28TMJAxXqgprkMn+L86ypZwAJZZSodIaSc0ENVufrJlcnAJnfajXfVecpowFvoOQr
	CWAI1Z5+uN1FB73dvNcThSkhCvrkRMSoBExAiY9Cgk4j1nMIeKkJpWhcxcj+KNpDYb6B3UVpWBYVq
	K8jxBWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzWw-0000000HRwb-0HQa;
	Wed, 29 Oct 2025 06:19:34 +0000
Received: from mo-csw1801.securemx.jp ([210.130.202.135] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzWt-0000000HRv7-1ORc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 06:19:33 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1761718755;x=1762928355;bh=RR32p+M9C599dIleJAbw+9d5tlMsoBTx0doNI9BbweY=;b=QCR
	L6f0yHuItdZpDFLJ0ibR3IBdcPDooG9Uj+kGR0DiPvh1pTDp4nmlY//34a+I7E6uptLKhG3jNcDjg
	7IWkyUxNkWSKUHuZ66OYF2Rn6CPRybyzwiVOu0/fgIfIWBJLBc3+VEecvy4pRKB6nCRtrEQrCQs3J
	89xjxnswcrgMv4N6y5EOwu3x+Le6dDX88jFv617KMbjIP7AI3vJPts+vblOPwNVJ/wvCSWPQsjRoF
	DUTZ2ga0TChUo48g1VMGd6SgftYButAP1q2p33E3KIriJy7ou7NgxAdZATNNjMk0oRcxRfQY+8mDP
	MekKAXzjQ4fzeK8wo7P/E4WzFX25Ctg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 59T6JEwI3507518; Wed, 29 Oct 2025 15:19:14 +0900
X-Iguazu-Qid: 2yAbrg0HuZq9EQydsG
X-Iguazu-QSIG: v=2; s=0; t=1761718754; q=2yAbrg0HuZq9EQydsG; m=AgqxK7maNBCk8YpXbPqC12la+75KSurRAdfqNdqMxkA=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cxHBm6SXDzyPQ; Wed, 29 Oct 2025 15:19:12 +0900 (JST)
X-SA-MID: 53851523
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH v2 1/2] dt-bindings: clock: Add identifiers for VIIF on Toshiba Visconti TMPV770x SoC
Date: Wed, 29 Oct 2025 15:13:43 +0900
X-TSB-HOP2: ON
Message-Id: <20251029061344.451222-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029061344.451222-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251029061344.451222-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_231931_953305_7EE22889 
X-CRM114-Status: GOOD (  11.08  )
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

Add clock and reset identifiers for the Video Input Interface.
These identifiers support two instances: VIIF0 and VIIF1.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v2:
- Do not modify existing identifiers to avoid breaking ABI.
  Keep existing identfiers for VIIF0.
  Introduce new idenfifiers for VIIF1, following the same naming conventions.
---
 include/dt-bindings/clock/toshiba,tmpv770x.h | 15 +++++++++++++--
 include/dt-bindings/reset/toshiba,tmpv770x.h | 10 +++++++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/toshiba,tmpv770x.h b/include/dt-bindings/clock/toshiba,tmpv770x.h
index 5fce71300..ff4ef1be5 100644
--- a/include/dt-bindings/clock/toshiba,tmpv770x.h
+++ b/include/dt-bindings/clock/toshiba,tmpv770x.h
@@ -141,7 +141,10 @@
 #define TMPV770X_CLK_PIREFCLK		124
 #define TMPV770X_CLK_SBUS		125
 #define TMPV770X_CLK_BUSLCK		126
-#define TMPV770X_NR_CLK			127
+#define TMPV770X_CLK_VIIFBS1_L2ISP	127
+#define TMPV770X_CLK_VIIFBS1_L1ISP	128
+#define TMPV770X_CLK_VIIFBS1_PROC	129
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
index c1007acb1..d711006d6 100644
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
2.34.1



