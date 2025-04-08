Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC51C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbuSfZMlCXke2NoxpZ7BBY2YV7E+cslEawa7Eg1inps=; b=qVPoSNWzZ7cxRjbH1H7bA91Ilq
	1J8BKqYCazolpAxzC4d9KP6ElU7VEnI4GnPwVyJhTQYvFLhRsPDhC/YsCOkFOrRj4ZDGkvUbrtKU0
	FgMmwZUEwHEX4tfNon+1zSA9xYi2c77HSMlU+EfMLE0H7+Yi3H3xqj0eDMzZu0Ptd6Gdsy8zLn/8j
	rfXbOohbbtAgmzYdgQowdcZZimNOLcFK8ejo0zdfyyEKETI//gvFYvWqVOunA9PCiSRK/c4bZo1zJ
	bG+4rUBYaWrbR3DrNmn3Wl6aAPkJ7rdFzegcXKFEYXdrkPdjcUtfi8Ctf+UOMOGWASEuAXSEsnB0/
	jQi+7Rvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FdQ-00000005MEO-3k9j;
	Tue, 08 Apr 2025 20:33:28 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FZu-00000005LaU-0Po0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 20:29:51 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2C21A1FB4D;
	Tue,  8 Apr 2025 22:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744144188;
	bh=rbuSfZMlCXke2NoxpZ7BBY2YV7E+cslEawa7Eg1inps=; h=From:To:Subject;
	b=ut9D8oqqEa1vpgS5PSz1kbV2wc06nIfi82YWIsTv0FjqSt71rgT3p6SG4H08IOT4r
	 KawO7DDxIwL10JRd35ptLd/neiOBlEkflY1VbMaaaWxFR3svE0e+X6MtP19CfYmENY
	 KN71ApBFsCOAEgxrHv6PECIfPQEXBHYt2gceODjyw26NudOj41xxewsyFqzzx2m7j8
	 qxRxbM6Ykpj1BA0Sm2d2O+zmfRmptjZdYMns8Hek0ExAXauAcB6XsVMEnyz3OD5jg4
	 TKhzhBr0g0dR/UtC9SJVTM00a800zGApo6VSjXWGwDMd1x29Bn+GTKzjE7wDTtPEog
	 7qIV3HfODdjvQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-verdin: Add EEPROM compatible fallback
Date: Tue,  8 Apr 2025 22:29:38 +0200
Message-Id: <20250408202939.6887-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408202939.6887-1-francesco@dolcini.it>
References: <20250408202939.6887-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_132950_294346_7E18FAC2 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

According to the AT24 EEPROM bindings the compatible string should
contain first the actual manufacturer, and second the corresponding
atmel model.

Add the atmel compatible fallback accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index e3869efe4fd0..d43ba0087126 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -657,7 +657,7 @@ channel@7 {
 	};
 
 	eeprom@50 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
 	};
@@ -770,7 +770,7 @@ hwmon_temp: sensor@4f {
 
 	/* EEPROM on display adapter (MIPI DSI Display Adapter) */
 	eeprom_display_adapter: eeprom@50 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
 		status = "disabled";
@@ -778,7 +778,7 @@ eeprom_display_adapter: eeprom@50 {
 
 	/* EEPROM on carrier board */
 	eeprom_carrier_board: eeprom@57 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x57>;
 		status = "disabled";
-- 
2.39.5


