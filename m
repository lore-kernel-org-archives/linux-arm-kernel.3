Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48208CDE019
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 07:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAatjOoy1v/cklClBmMZqopho7tzFJ/skOvLA7FXfeg=; b=LB7p8JY5BqzMYvhigxqcEIGs/X
	+aWW8n92L0dIPLby0d6JUdEsG2EKYvll4Ck1jfHqtqSSBSIlvplPHU9hG+2gYwTdatR85zm4XWFHS
	POybMP6gSmsjTLTNfCxGn8KAA6BScT+eWtCRU2p/3EIWvYdKQzLrvKrr4JxtOvglIv0TpeIIzd633
	0r+41Dnu7hxfTWAwjbI2C0cngFR8wze+r5hdT1LJH1o/YXxbfBhWhKu/HFw8Zz3FTFcl4cwIF+hEC
	L42Gc99ijShLCuHepUb/eBblQpckK5RoFYSB9EVwdbXEhtWua7lKu50pY4uN+SqZOkH8noJxL1J90
	YX3Eb4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnxC-0000000Biw4-0FrZ;
	Fri, 14 Nov 2025 07:10:42 +0000
Received: from mo-csw1122.securemx.jp ([210.130.202.158] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnx9-0000000BiuI-0IJt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 07:10:40 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1763104223;x=1764313823;bh=RkjkL1vTmRSsskEuv1JjpCnNXYvSjrn8TEee9cXREwQ=;b=C2Y
	F23G/zKVaBI245F3Gxq6OO8TBYTg8jnJvgBxyabu3n3FyTNJbr4xxXn1RFnl0InvsMgTeOgVlh7kO
	rZah/1q6tcBT5BK0RlEabXpWoV2QxPv++NMVsgtDzUCyCYia8NvlWfL7zIER8ZSugJUD9K6E1Mm7g
	FKhDj3p+8jf/RgvCm2TKsmwhT7VB9nkiqbVDGUq5LPWl7qBZ3X2QIS06aUmN7b+d9ixYBa4kB7Abh
	TfuGPG4yY65vmuqGvh0StRKw9W7rz5y1mNwk3N6SEPrt4RdQZ7rx1SzmI+erny6NT/0ZTKIgOE+dX
	5K1GkuSRr/sG+Q7xDFkSLO6/QzxfuNQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 5AE7ANDZ1120230; Fri, 14 Nov 2025 16:10:23 +0900
X-Iguazu-Qid: 2rWgZy3EWuTvE7J9fQ
X-Iguazu-QSIG: v=2; s=0; t=1763104222; q=2rWgZy3EWuTvE7J9fQ; m=BS9Rx66ykcVuZRBAYmLYJa6t6LsP1Yi8jLCmfbPcZAg=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77ZQ4P8hz4vyk; Fri, 14 Nov 2025 16:10:22 +0900 (JST)
X-SA-MID: 54823657
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
Subject: [PATCH v3 1/2] dt-bindings: clock: tmpv770x: Add VIIF clocks
Date: Fri, 14 Nov 2025 16:05:11 +0900
X-TSB-HOP2: ON
Message-Id: <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_231039_390445_F5F761A7 
X-CRM114-Status: GOOD (  10.10  )
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

Changelog v3:
- Only add new clock/reset identifiers.
- Remove TMPV770X_NR_CLK and others in a preceding patch
---
 include/dt-bindings/clock/toshiba,tmpv770x.h | 11 +++++++++++
 include/dt-bindings/reset/toshiba,tmpv770x.h |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/dt-bindings/clock/toshiba,tmpv770x.h b/include/dt-bindings/clock/toshiba,tmpv770x.h
index 89189c4f6..a36c89266 100644
--- a/include/dt-bindings/clock/toshiba,tmpv770x.h
+++ b/include/dt-bindings/clock/toshiba,tmpv770x.h
@@ -140,6 +140,9 @@
 #define TMPV770X_CLK_PIREFCLK		124
 #define TMPV770X_CLK_SBUS		125
 #define TMPV770X_CLK_BUSLCK		126
+#define TMPV770X_CLK_VIIFBS1_L2ISP	127
+#define TMPV770X_CLK_VIIFBS1_L1ISP	128
+#define TMPV770X_CLK_VIIFBS1_PROC	129
 
 /* Reset */
 #define TMPV770X_RESET_PIETHER_2P5M	0
@@ -174,5 +177,13 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
+#define TMPV770X_RESET_VIIFBS0		32
+#define TMPV770X_RESET_VIIFBS0_APB	33
+#define TMPV770X_RESET_VIIFBS0_L2ISP	34
+#define TMPV770X_RESET_VIIFBS0_L1ISP	35
+#define TMPV770X_RESET_VIIFBS1		36
+#define TMPV770X_RESET_VIIFBS1_APB	37
+#define TMPV770X_RESET_VIIFBS1_L2ISP	38
+#define TMPV770X_RESET_VIIFBS1_L1ISP	39
 
 #endif /*_DT_BINDINGS_CLOCK_TOSHIBA_TMPV770X_H_ */
diff --git a/include/dt-bindings/reset/toshiba,tmpv770x.h b/include/dt-bindings/reset/toshiba,tmpv770x.h
index bedfe253f..9452bef31 100644
--- a/include/dt-bindings/reset/toshiba,tmpv770x.h
+++ b/include/dt-bindings/reset/toshiba,tmpv770x.h
@@ -36,5 +36,13 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
+#define TMPV770X_RESET_VIIFBS0		32
+#define TMPV770X_RESET_VIIFBS0_APB	33
+#define TMPV770X_RESET_VIIFBS0_L2ISP	34
+#define TMPV770X_RESET_VIIFBS0_L1ISP	35
+#define TMPV770X_RESET_VIIFBS1		36
+#define TMPV770X_RESET_VIIFBS1_APB	37
+#define TMPV770X_RESET_VIIFBS1_L2ISP	38
+#define TMPV770X_RESET_VIIFBS1_L1ISP	39
 
 #endif /*_DT_BINDINGS_RESET_TOSHIBA_TMPV770X_H_ */
-- 
2.34.1



