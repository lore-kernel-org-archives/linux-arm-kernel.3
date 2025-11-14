Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B8DCDE006
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXGQQTy6GRxNwSPEPIomqY34ggCE4J+6hnSNggJ5DP4=; b=4QWgZdvplATZ/AVmPCdLT3bUAS
	FhnTDzVDUbD8idP79TpAO7ekh2uBP07sqzCNFMwLmkTq8dLrGLeKZ0ZF9nPvXv3bYNo9YM5PDoJ+X
	BNdGYqsbQNNdrnlR/WFBY9wZ+uNv9RnYKg/C8OC/6iWaCuCohx232XSbjKJCyzLfOGF09OgkFwb1T
	O50CpnjTCkfWZjuBV1rrxCA3W8c9diMcCvddtH3DgBPzyrSkeR/WyoXZbgi7DqQB/BRJdrIjVsgJU
	jADOv8mNrRlg/HM56x8NU2GWe8fSUZhRf/qcdal1AcrJf7HcRwf4F4KGc2SaEpWNohBMlGxig+twL
	KLIvU6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnmP-0000000BhYC-3LMZ;
	Fri, 14 Nov 2025 06:59:33 +0000
Received: from mo-csw1121.securemx.jp ([210.130.202.132] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnmM-0000000BhWR-1Shy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:59:32 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1763103549;x=1764313149;bh=z5BT7iIb8HXMJQST0R7kR132Jpyv/xSzSV01+ipM/E8=;b=hMv
	eXRFord7LWrKJaWpflg51wHxSXWVf1AjvLAnwU8z8Y2rlNm74zSaTEND5r7rsngOZVYDn2qxPTLtt
	Yuurldmu8pkMUFbyQdiuq65w4LCI2xrEownb+7XLf9NJzQV2RE2okMHEclhkxVf2GVvL753Ilb1uM
	PNk4XHHSKQVrZKSIiu2lrTDKLukTK48+ho3zimRIPtG5II5fl4WWZU3hJq7KOPezmUtfNH3ZOzGk7
	lTDuml6TSOz+yiJetliFe+As+qY1J5oYtuosekezSRISyNz8Y3AUCHdQ8CGh3/6bxmpRnHf76UoY8
	zQXbNhj37NyEG7qQ882TYTQZl0lBawg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 5AE6x96r3826728; Fri, 14 Nov 2025 15:59:09 +0900
X-Iguazu-Qid: 2rWgP4I4zWg0QagHnu
X-Iguazu-QSIG: v=2; s=0; t=1763103548; q=2rWgP4I4zWg0QagHnu; m=prYwrmW4qxhPFlh8iTyihJo96G3t7nIZABj+fSIVS/M=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77KR61f6z1xnZ; Fri, 14 Nov 2025 15:59:07 +0900 (JST)
X-SA-MID: 54822487
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
Subject: [PATCH 2/2] dt-bindings: clock: tmpv770x: Remove definition of number of clocks
Date: Fri, 14 Nov 2025 15:53:58 +0900
X-TSB-HOP2: ON
Message-Id: <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_225931_158484_8A594ADC 
X-CRM114-Status: GOOD (  10.00  )
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

Remove the definitions of number of clocks from bindings because they
prevent adding new clocks. Since the previous patch removed all refereces
within the driver, they can now be deleted.

The same for resets and plls.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
 include/dt-bindings/clock/toshiba,tmpv770x.h | 3 ---
 include/dt-bindings/reset/toshiba,tmpv770x.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/include/dt-bindings/clock/toshiba,tmpv770x.h b/include/dt-bindings/clock/toshiba,tmpv770x.h
index 5fce71300..89189c4f6 100644
--- a/include/dt-bindings/clock/toshiba,tmpv770x.h
+++ b/include/dt-bindings/clock/toshiba,tmpv770x.h
@@ -11,7 +11,6 @@
 #define TMPV770X_PLL_PIDDRCPLL		4
 #define TMPV770X_PLL_PIVOIFPLL		5
 #define TMPV770X_PLL_PIIMGERPLL		6
-#define TMPV770X_NR_PLL		7
 
 /* Clocks */
 #define TMPV770X_CLK_PIPLL1_DIV1	0
@@ -141,7 +140,6 @@
 #define TMPV770X_CLK_PIREFCLK		124
 #define TMPV770X_CLK_SBUS		125
 #define TMPV770X_CLK_BUSLCK		126
-#define TMPV770X_NR_CLK			127
 
 /* Reset */
 #define TMPV770X_RESET_PIETHER_2P5M	0
@@ -176,6 +174,5 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
-#define TMPV770X_NR_RESET		32
 
 #endif /*_DT_BINDINGS_CLOCK_TOSHIBA_TMPV770X_H_ */
diff --git a/include/dt-bindings/reset/toshiba,tmpv770x.h b/include/dt-bindings/reset/toshiba,tmpv770x.h
index c1007acb1..bedfe253f 100644
--- a/include/dt-bindings/reset/toshiba,tmpv770x.h
+++ b/include/dt-bindings/reset/toshiba,tmpv770x.h
@@ -36,6 +36,5 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
-#define TMPV770X_NR_RESET		32
 
 #endif /*_DT_BINDINGS_RESET_TOSHIBA_TMPV770X_H_ */
-- 
2.34.1



