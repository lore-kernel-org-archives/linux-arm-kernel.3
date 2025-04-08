Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488E1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfgWLRBolkHkDVKstg0SDAzftES3+Ba6uH8UeszjsEA=; b=z+6Z64TA4H+E/Rm6ItyM9qd152
	pf1OIZSCGQ0sOMwEMjqCEeTvskkfQ/xZEyBHhWS/99r35EnLBh09AgpOFga8E26wBQGAImZPJDw/2
	mzoubKcUFRyDaY6KNBFWtEs4n6Z+aW8/eesUy3PPdfR4EbaKrqzCFofXxbGJKsAel0Cy8L1HQOc6w
	GFo9jvxrBOTno6y+zkn4tVVRtrg05WPwqpmTT9/QH4L3IGlyed+IbhKhHlpGFKLZkXhRl0zcJy+w9
	Y+a3hE85/VLdPSgcox/bOKH0rhJvkm7a8LNt4TO2nmsAE9ure7e+EoZ4SFSgp4EyH1oUEZUbdkdkp
	LlDhU/Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FfA-00000005MMT-2rdD;
	Tue, 08 Apr 2025 20:35:16 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FZv-00000005Laj-1Zi5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 20:29:52 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id F40941FB54;
	Tue,  8 Apr 2025 22:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744144189;
	bh=qfgWLRBolkHkDVKstg0SDAzftES3+Ba6uH8UeszjsEA=; h=From:To:Subject;
	b=OvHslTzOP5/V/+c/cQ1/XP3c710Pc4o34JCi79Ofpf87b7SOAdw2g+Lzein9UGd+Z
	 bzrgVqmuswVEqav83nnMaKU7uDqagVNXyHCARkqXtk0w4SGz4xV+ttNUaVsuAht8Ud
	 3Zl5eUoahWvKw1JZgiRE6oUk3s/eYKQafni+1auAk/1tHVoAWgNTyC3bACVqmUl8Vl
	 qrQ9N5hjbaYRV1yx9n07o1T/YGp1oIl+0zV4i1MaasPvcmAdI36vFH+BC7+kXbjKc6
	 FKQnRVQYZCm5PWvrPm+CHw6pu4olvqs/OKTNq09rBugLl7gs0bHzKAW0nipouyRjmR
	 MZvXTcnNB1xXQ==
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
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx8mm-verdin: Add EEPROM compatible fallback
Date: Tue,  8 Apr 2025 22:29:39 +0200
Message-Id: <20250408202939.6887-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408202939.6887-1-francesco@dolcini.it>
References: <20250408202939.6887-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_132951_604252_530CEC9C 
X-CRM114-Status: UNSURE (   9.11  )
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
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 7251ad3a0017..d3d3ebf035db 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -528,7 +528,7 @@ channel@7 {
 	};
 
 	eeprom@50 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
 	};
@@ -633,7 +633,7 @@ hwmon_temp: sensor@4f {
 
 	/* EEPROM on display adapter (MIPI DSI Display Adapter) */
 	eeprom_display_adapter: eeprom@50 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
 		status = "disabled";
@@ -641,7 +641,7 @@ eeprom_display_adapter: eeprom@50 {
 
 	/* EEPROM on carrier board */
 	eeprom_carrier_board: eeprom@57 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x57>;
 		status = "disabled";
-- 
2.39.5


