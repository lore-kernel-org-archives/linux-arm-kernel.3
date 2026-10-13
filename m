Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFA0CC6B13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4aN/1amNQxJNk4c7N2lTGAkvvrYpTHFVDkBhjGRCG4=; b=JSVxkM4bcol5PEOfv0LbPf4InT
	EDRPUEDUaU306Ee6Hl0/xNOZFHGBPgGNKPOiBAZoYcoHNz1ELcAhfS1+/Cs33BTExuqFmg7Shy2rF
	lpWS4kunbRvHLKrp0rYddeNZ4xyTcDhF+apqla7KzT9Wm9U+4B9OQUHzDn9Nk7wagBSnboLbrcgyj
	Rtc/y1tndwj4rYoNSyxFIMc/HSVCnw2YyKqOW2LVTjEv75+iL+2RQ38DEV6xJ+o6SzT5DgS7CpqHY
	x4pSD6snRoKG+nvREEd5ITo+0e18zaIORM926oyIG5u01/czNy/Phtd68/15Sj1wdkrfXkReHyA+G
	Ekrhd5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ54-0000000CSZC-3vAl;
	Tue, 13 Oct 2026 09:45:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4z-0000000CSVc-3tqO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q4aN/1amNQxJNk4c7N2lTGAkvvrYpTHFVDkBhjGRCG4=; b=pTHZsA+rN1Cl4Cg+3+IGH/hUA9
	jUCEsLucss86tp55gZEJez69zurzZ0OhvKB7eLknjsqRECR7d29K203bCfsg5RSxl1wLnjjNBNZAH
	Ku135jhJ/TZGFsx22ikN//T7wLXqCMb4ct3NEXH/Hj/8RUYjfuG1GxqthISnZJROeyeqzPJM+ECLI
	RHLvy6tP8CKD0hci9QtAm5E2q4RifA0x6zcl66ql8VKhNvNLSWGJF+PgIOQZmmgqttaYSxImNWcAH
	qB7npn3VTQ1G42jX6hUEKE6K3/d3SimtPOJRYJhX8/izl0ZROgrVGJkEsOZLvuFcER9n6y0rbrrGS
	27HaOOaw==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZ4s-0000000FMfq-2MLx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:45:50 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4aN/1amNQxJNk4c7N2lTGAkvvrYpTHFVDkBhjGRCG4=;
	b=DQF5f9Qf02loEdyarV+8QiKydpwwICnIRQBoax1929zpGNgFXFnDuuQE271Ww63A7jpAaR
	i9ubdjBd7PrDA5FOA1k9MyudWEy0KUXrnkn7bT6iVpOfPQm6nDMgDpnlkWBiCoKpc4WM4h
	6PdgGBtYTVQGdHKSJ8vpNQtMbAu33xbjf0xMmO0nMolvDyKevWEPqoUis1v9BeKBRJUGwY
	cQPeazv79j0kFPm2q6YmAx80VCOiNmT1DGI8SqI6w1ikdY59yUXqoIwD0DYOfl+H8dW4sh
	mSk4vH7Yc7UEdxW6Tka7KyzqnjlPrrmpqjBL5UeJmy004jQnErtUaUM73R+5yg==
Date: Tue, 13 Oct 2026 11:44:49 +0200
Subject: [PATCH 4/8] arm64: dts: imx8mm-kontron: Fix wrong label for
 SPI_A_SDI_(IO0) pad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-4-94f09ec520ef@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=jzjRSZBC4S/DaUSvV4n8aM/sXC+EPXR9oQqPjvOEE/c=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36MBzhnyemqeagx9Lj8if4l4dOzdnbWac9O+Xd8Eb
 zl4T67pKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmEifHCPD/Ycboh5ELdn/ckuV
 9963s/SjmFdveybj7yu6Z9U3D63ISwz/Y3sVy2Y/Xl6Z3PMwXK02/tuXKyJ1+3bNfjd5r0fsHV0
 JPgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_104548_662537_F8F8AF08 
X-CRM114-Status: GOOD (  10.19  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The OSM-S pad SPI_A_SDI_(IO0) is incorrectly named as SPI_A_SCK.
Therefore SPI_A_SDI(IO0) is missing and the label SPI_A_SCK is
duplicated. Fix this.

Fixes: 6f5e6d7306c0 ("arm64: dts: imx8mm-kontron: Refactor devicetree for OSM-S module and board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 4fb13d8ecfd45..35b76cd02b1df 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -230,7 +230,7 @@ &gpio5 {
 	gpio-line-names = "UART_B_TX", "SDIO_B_PWR_EN", "SDIO_B_WP", "PWM_2",
 			  "PWM_1", "PWM_0", "", "",
 			  "", "", "SPI_A_SCK", "SPI_A_SDO_(IO1)",
-			  "SPI_A_SCK", "SPI_A_CS0#", "", "",
+			  "SPI_A_SDI_(IO0)", "SPI_A_CS0#", "", "",
 			  "I2C_A_SCL", "I2C_A_SDA", "I2C_B_SCL", "I2C_B_SDA",
 			  "PCIe_SMCLK", "PCIe_SMDAT", "SPI_B_SCK", "SPI_B_SDO",
 			  "SPI_B_SDI", "SPI_B_CS0#", "UART_CON_RX", "UART_CON_TX",

-- 
2.55.0


