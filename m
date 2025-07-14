Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EBEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1cjRw+NOmrxpgqFiLQFeXIHtpswYIGfiHFGY6ljemw=; b=xcE3owdW1irS65v+/9pF8dH/IT
	4zHuSmSFomIIjMWTpgN6cKLj71nWB6+QyAjVAgm68XqBiSRxbKhD4nLbLdML1QdV9fXJ0LEzKie3M
	hJMahe3Y4kTYhCsfn+oBayo0qk82aNIh1LPvwm2BZuQQp0d83PYEU0xMSO7vGwhfEzL1jLkxwhsOs
	/TGFJopQRva2aw0UYUZbKLbBAsgBjIGA3VxqANWQJZ7bsndQAamJGg7qSj73+wuQDm24Ra9usYISf
	tR6X8KG/qd+kmBqoP72dPTjiLF6IhGlx8LI2qE/Vo/O2nwqFuO8TNGSXdxpSWMxb7ZG5kOrpwL5Kq
	9jIYKwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL6d-00000002fpi-06Tc;
	Mon, 14 Jul 2025 15:28:39 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK2U-00000002SGo-0zFX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:20:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D32BC753F;
	Mon, 14 Jul 2025 16:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502816; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=I1cjRw+NOmrxpgqFiLQFeXIHtpswYIGfiHFGY6ljemw=;
	b=Yaye8xXMLAM+wbU1ONJzXaYlZHoIMWO/biWbvIge79i3eQXrVGlAdnjupaETFIykCNrwkF
	GVprrUGV0Qzc2CRQLR1cbyWGaL+l8GL3ugbCFJupMljvmRApXq/Id1raM8h2gbjWROMf+j
	4qBxRBWDjekNlx8BJzm2qSPlpj19bhDq7bLw6bE9WjnwkGgi9qugCbklT4OeE5UZ342m3R
	xZCKou4L1RBiGdT46qKcAhs+qjqf16vXd6y5E2I4MmF3GgI04zQAtlcjGjYbPzlROEl8ed
	vnaKhXsd7rh80s5kI4wlIXzEGhLHDPuouW0Xqk/nRgfYSwSoXHea4dikEZ1AHQ==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 03/12] arm64: dts: imx8mm-kontron: Use GPIO for RS485 transceiver control
Date: Mon, 14 Jul 2025 16:17:29 +0200
Message-ID: <20250714141852.116455-4-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072018_426983_86498F3B 
X-CRM114-Status: GOOD (  12.21  )
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

For this IP the correct control of the CTS signal for transceiver direction
switching is difficult and - maybe also buggy - in the driver. Especially
the bootup requires special handling for most hardware implementations.

Therefore we simply use a GPIO now, which is fully under software control
and which is not problematic on bootup.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index d16490d876874..d96c07757e1d2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -268,8 +268,16 @@ &uart1 {
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
+	/*
+	 * During bootup the CTS needs to stay LOW, which is only possible if this
+	 * pin is controlled by a GPIO. The UART IP always sets CTS to HIGH if not
+	 * running. So using 'uart-has-rtscts' is not a good choice here! There are
+	 * workarounds for this, but they introduce unneccessary complexity and are
+	 * therefore avoided here. For more information about this see:
+	 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=79d0224f6bf296d04cd843cfc49921b19c97bb09
+	 */
+	rts-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
 	linux,rs485-enabled-at-boot-time;
-	uart-has-rtscts;
 	status = "okay";
 };
 
@@ -439,7 +447,7 @@ pinctrl_uart2: uart2grp {
 			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x0
 			MX8MM_IOMUXC_SAI3_TXC_UART2_DCE_TX		0x0
 			MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B		0x0
-			MX8MM_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B		0x0
+			MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29		0x19
 		>;
 	};
 
-- 
2.50.1


