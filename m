Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39E5C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTEthrAA6LwUJ539D4ECKjt7zqyGUxoBnrgaPMytwWY=; b=jrCmUFtSg7HF2KftawvHrSj+gF
	uNevGfeyrFWFXkruDVXXdrsv980DyOpURytE1V4e2a5/oRD8WluVuGqOd/7dyHR5h/A2KmUVsz42a
	EtuSjpgQYjhc9fk6X/KorO/kJgBNuXyRItaWh8a2uPTbofFOQItv2cxB1gM0F/GAMfu51GkVyHbNS
	Xh8G6ZyiHdBsPplRZZ5/athnLnHJ3SDxO81Swp69e0+bWxRl4u3JYqYKsuI5ptR/HNUxXJOgzuj7V
	J2hAh7CtWDRpMWKFfrzbyxhPT3roACl3rJs/cV/aTc3p9X+kuGyFziYwvZbvbRSnLo2PesOR1QzZQ
	+Wzr3xfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGI-00000009Bed-1JKA;
	Tue, 08 Sep 2026 13:53:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGE-00000009Bbg-2Ztv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JTEthrAA6LwUJ539D4ECKjt7zqyGUxoBnrgaPMytwWY=; b=MlqhFEhFAMPH3tzzQ6pamr9gK0
	90oKkxAlFYar1IkTjPXMwg+EwM1JCuoeHxqPRXjGPP7mTMGgZuUtc801Ib8KpGxP68yAww/vVITw3
	7/ttxHL7LuwJJiDQJp75t2zRWPuT7dDNfW818k4iLSYm0sVFtjaPmgsBSRUw9Vg7+F38/Stlg9VY2
	42sRKPf3y337d3ew3x+hzT3jXp8FJAWS0Bxrgk5sshbwY1tElECkPS/XFqr/8ilk7A+h8Ckx0HlOT
	dJajFsmDWhn/Vj9tagDI+44hpXuaD+jOfHMYxdqF6fpEVA18a+gmOQsmdzI1o2/kHmvXOiWIc8XG0
	RIiOuj3A==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGB-0000000HUgb-41m7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:17 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JTEthrAA6LwUJ539D4ECKjt7zqyGUxoBnrgaPMytwWY=;
	b=ac60PlnxF2eMpYSqf2qL/1e+TZwJ5HIEIQ/s6rl7IhU8cxkWm9zoEAJYIK6dMgcTy8V207
	0BbHWAvrfrGS755v1N0KQdUcE7/lU96iSdTxC5puOqMGHTQZ5HvlkaQ22TzhqeAQwnRBgn
	W2ByHt94z0pN3tqQqn4GSsI4gVlEEHVeLgbK+2wwzKx9Q+lF+FQduDiIY7bt4RAQiglI3y
	Aq+VXXBH3zRnnYmReCVih4FBJfQVU9OpsFwsd4EAs9haqjXeDJSmEscTIAl1hZjALx6JYS
	q9TwHT+nv+deUaUcpuz5Q22iCvuDst2CsvYKtze0WOn0T0MuME4PqsH3aA5r6w==
Date: Tue, 08 Sep 2026 15:51:56 +0200
Subject: [PATCH 9/9] arm64: dts: imx8mp-kontron: Fix LVDS clock frequency
 for DL device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-9-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=JflSEapFC6tCDik1Iz5jWuT+Z2BejGAThr2/ZivZJV0=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsLNhq+mbwGWNS0XWfZDYN4mvy+PyLK5Hqw+Ybrj5a
 +4ZjvnPOkpZGMS4GGTFFFmk+C1e25rF+sgfq46CmcPKBDKEgYtTACaitY+RYR/3xl13w85ox+vX
 Ja+6Jqaq92Uzr8hrhkUyXgclynyO1gFV9HHHnjsa+spxziPzNLUjOz89m542xyBEWFo44e7tJit
 WAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145316_148314_A990E671 
X-CRM114-Status: GOOD (  10.92  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

The panel needs a pixel clock of 50 MHz, which means the LDB
serializer has to run at 50 MHz * 7 = 350 MHz. The LDB rate itself
is set by the fsl-ldb driver, but VIDEO_PLL1 needs to be pinned to
700 MHz, so that both the LDB clock (/2) and the pixel clock (/14)
can be derived from it exactly.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
index 41a2bb74f156..88b30ca66adf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
@@ -6,6 +6,7 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/clock/imx8mp-clock.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "imx8mp-pinfunc.h"
@@ -99,6 +100,16 @@ &ldb_lvds_ch0 {
 
 &lvds_bridge {
 	status = "okay";
+	/*
+	 * The video PLL clock frequency needs to be configured manually.
+	 * The panel needs a LVDS clock of 50 MHz * 7 = 350 MHz.
+	 * IMX8MP_CLK_MEDIA_LDB = IMX8MP_CLK_MEDIA_DISP2_PIX * 7
+	 * IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_LDB * 2
+	 */
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	assigned-clock-rates = <0>, <700000000>;
 };
 
 /* redefine to remove touch controller GPIOs */

-- 
2.55.0


