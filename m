Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5E7CC6B10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YeFbqI9jChUEohbrQpD0CokfPutK/1MCz5spsJNN6w=; b=PSPw4e6iKzRjAHIxflqU1Flrw/
	NduNNljiU4K9pjEl8ll7EonEyPOq5gQxzqX0aEQo6t1x54xkCRLOuiWflCnTVynyKdE0EK5W1mN3C
	9KAGp0H/PtzWQ7UEmD26/vFrfOYP1hOLknr++p5jhVT3UvEwYjt/Dptf0v1QJE4oHfbfr7tH9q3lc
	+E2DEwEFOIKBEFzeAUN33g7tXXFkoMHG+BmbHPSHp5uKD5k07rUmnL+al18fs7fQblsyfCfsBl8Ch
	c6Zhf71AhDt7IQunW3TviC0KE/8HNMRy8/FaYZx0tUnkjRLbgNJkMwnKQIo9gRwXtQme1qVOkQPd0
	N2+4OZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVtF-0000000C8Fn-3Foh;
	Tue, 13 Oct 2026 06:21:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVtE-0000000C8Ea-0vQn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 06:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0YeFbqI9jChUEohbrQpD0CokfPutK/1MCz5spsJNN6w=; b=Zl8HC62w6CBC6+SOL+R6AhtKtH
	diY1mrxtl9B9KQs3yhTjSfZKg8QejHsJhINSEPVFUhTFsgRoCQAepdHgqLLXmGClyYiWDosPLpIMc
	h/iRd1/kDTx6qAdMQ8sL+QRnXYqd3GHSpLPeYt7U9IRoFTZ+xrpKW31bGK5yTnl4IWoXJVI3Bo44u
	EiOF0jf1xnFk2FrzvWy8AU7ZsveLlAqRdNR5g9DDsWCDS0WhDc62Q8Rl0Zq6d9x/kkqKE63V44R8Q
	vRuyp6G0dZPOQqlRhCWGQmFFk6z7mo72zmJemfImDcJU2SmT9SODHQhm9nJSVQCmjvSSN52v1D+bh
	aaTdw2hw==;
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVsz-0000000F9eM-0Kz9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:21:29 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5A372201EEF;
	Tue, 13 Oct 2026 08:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YeFbqI9jChUEohbrQpD0CokfPutK/1MCz5spsJNN6w=;
	b=ECvHbm2zB9mtTCyuScgBbKXlRNyzZF106jVE3X57a4f85VrAzvY0KPMEQNl/Cx8Ph1Qus2
	hIKi+X70oKiKIkJhDzAQHaqU7OlFKuvQgTyncvZrXfY9ZO2rU6+1HIVy2UKYFJ2de2ILVQ
	VC9EPCWVUJT7sbnMbS6YHu6DOMQHGVexjEovudaLLRU38moLuHvIJDJ5WT6w7oybS0phrH
	1crlzIuzcNYGLMz1aFd1Trv4UVC29Jk1Gv0FIOPQ8MXMeAq+FS3+Laa7RydpwMZM8p/3iR
	2F3EgrkJCn0jwFxZtFzbZ2nFOswduwr2TZ1N1u6fYVIr3Z2cZ50eyD9eaPuxsQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791872473; a=rsa-sha256;
	cv=none;
	b=Uj1OnPz9PEOJgDBPHfMSY5+90Uc0MbWytFdIEf9S7sIDmBOfkV+GG2wkPDaH9vY7AQgBkp
	MYYGV72AP0DNiO6AOt7bmCQ1+7DdrKtcKZEH6Asg06lo3u7rE5qRLJ9MWZWY+25m5uvGiq
	18cBvEM+5lLpUmYBfGsoWlhT+63JIFnzn0kRgKN4lcyubkOliZ/6v2CKS9ufCAf0fQ1nYF
	kJ8y0qqvxq3Ur36pc7SzgWPHy6BjxCLkcBHblTy7z6RJRrePEVQdjldPcPNFDTaBAjAF/q
	MZ2s+2GASnQ96m9ug/Q/6d2GCS+gDuJ93+OOO9CWVCOKf2vXKePRDl07u/37BQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YeFbqI9jChUEohbrQpD0CokfPutK/1MCz5spsJNN6w=;
	b=MkqFpx1mv64U+ynGYn+ix1gRBaeMJ4qTYXhOGevK+kYTydTe5xGFfVL0NOZmvXuUxxkDKj
	Jix3r7I8fwHfv8v1lt0y76E0oihVoHb5/U0zFbkgE+Xh5HluyThVWcdiZF89alQL09SYjB
	58uaob9yYwdnliOFL+R2hWIMQJAIa+tL5rpWp/cFdQJ13m82Z1omGTYjVM2racunQvzCNF
	WXyRxIHvPJc2lpva1poHrIrvb458DEjvWybsUOWGi6erKJRm26z/2oQcT0KL5FBuDRoiqZ
	eG+vm5LfIPJ3lWVcyrtaKXbO98++oZ+pzcSP9S8gmWCtcvleg+ojEbTjkhDUnQ==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 13 Oct 2026 08:21:11 +0200
Subject: [PATCH v11 4/4] arm64: dts: imx8mp-skov: support new 7inch panel
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-4-b97ad841598b@pengutronix.de>
References: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
In-Reply-To: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2667;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=P5vuRBOhbsEcKT08GtUQmWhheq+TMxl8t6Locrjd+DA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bZs9ef1919Knn4mHvyuSCr+XphGxvdN/Hrf+xetHr2W
 vZ3Yv5eHaUsDGJcDLJiiiwqCyv4RD0+eEZOE+GCmcPKBDKEgYtTACbC4MnIcOAt6yfxuIRrgbcZ
 /remRkwMPvjMbsOih7Kl1pNtK9P7tjIyHPr+Wi/412WBznSDuq+eM3t1sx48jRZTOnZ3reovgz/
 cDAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_072117_709213_056926C1 
X-CRM114-Status: GOOD (  10.77  )
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

This board is similar to the already upstream
imx8mp-skov-revc-jutouch-jt101tm023 but uses a different 7" panel.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 ++
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 38 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 7c1b61249778e..d06f50bfc2043 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -708,10 +708,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 
+imx8mp-skov-revc-jutouch-jt070tm041-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-jutouch-jt070tm041.dtbo
 imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
 imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-tian-g07017.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt070tm041.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
new file mode 100644
index 0000000000000..7b3535f47f3ed
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "SKOV IMX8MP CPU revC - JuTouch JT070TM041";
+	compatible = "skov,imx8mp-skov-revc-jutouch-jt070tm041", "fsl,imx8mp";
+};
+
+&{/panel} {
+	compatible = "jutouch,jt070tm041";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@2a {
+		compatible = "eeti,exc81w32", "eeti,exc80h84";
+		reg = <0x2a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		vdd-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&lvds_bridge {
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
+	assigned-clock-rates = <0>, <358400000>;
+};

-- 
2.51.0


