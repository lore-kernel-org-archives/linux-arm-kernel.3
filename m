Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4C9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xm+C1Hrf5PZav1kH12OZ68FgqFY1vN+rQWTlgliz2cs=; b=VPIIF2zy0jlQKnT5jGCCMu0lsA
	f7MQ+eQPFfrUIsM/IboXhGuxMBR5rNKZheah/a4fHxgcz5qLdXfOgdNBdaix4sqZ1Sa0fYGBLR1ez
	mW/hxWYdibgaV4F1QR9lpS+zIcK6fKH1UtPnJVh2HG8UOrx+PiglP0gHT9yBGiJNeSLrrWobnKhM9
	XwSLdSj0ZI8BGA40ENZoLsST78LvUzF9TceTuUvZwH8mtfwq8RV9AEMv0+dc8kFsakcJUJEyee6Aw
	ZoAH0YHLCTPPt1zMmmqgnwOFNX1+G49AOs5HsFg7xvVOcfMg7N6EXzF6M/Xt+pQwTYpuqG8et6jzG
	CXxWLbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DEJ-00000007DPl-3FMD;
	Tue, 22 Apr 2025 13:00:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C9a-0000000711y-2u5A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:51:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso34864255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745322664; x=1745927464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xm+C1Hrf5PZav1kH12OZ68FgqFY1vN+rQWTlgliz2cs=;
        b=CWiFOenXg7kambfTB1FjYGqm9gYParMaRx/up0735UP9uyOd590SAdkE8i9i60t1Bz
         UzhKPW2LA6envGLBOTxq0jUBchzsq0M8j7tBoMuNyGELTB6D/kYSRtbGJz6zrxb3OxW1
         qkhtPH20QdJqA8IRDlvBRt9hDjPwCbXXmUZKn5wobOhYa+5V2fQuUdTg/o+Sd2qey/JL
         Bon+bonI2frdHNQX3O9Z6RGrNyaGYx8Kv+2iurvJPLcQo15aDDYqUfk4TgSpfIhbSjeM
         loijU+0jhd8qf3320561FCGw0dp8AcS8/fUAw7Z967Y7Q34kFe3a34Ui9VKis0rarKCd
         RxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322664; x=1745927464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm+C1Hrf5PZav1kH12OZ68FgqFY1vN+rQWTlgliz2cs=;
        b=GyYx6yFanaKSCO5U1VzZkODpQGUjGcjV0K7E0gWcqClRnhl1YpUzvjiCGP3k98NoH0
         tzWJW/dgQ2EWVE2e0IjehJ1BeYTd627ysvCthsFkhi4W3hqE/N7/8AzvE/oEA5gB/11r
         L7NHZuvGBiLiNXI3/wcb3K1RrZIAFrZkvLDaPwQYTOc72iicW0NoxULCdEkQKIOgK9Y8
         DdwpA/0CRA8gi+H2z7afU4OBlEavNh4uHwB7k08ByWW7np4C4HXWzWVD9Lhz6qskBh2p
         19pP0nblPFHMogXJAV9gQiZwTVpJtxDKyqSUG+vE83qjUpGb5sTbJOYEKahZoW7z9F56
         m83Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFLtU/MxWGT6ZLP+rqy4zruk7ZuxodYkkHuqxmGPbrRmraLoXKo5x/R5457kTaReWr2HLAC8MPvwqqEAEX6LjF@lists.infradead.org
X-Gm-Message-State: AOJu0YwoRFoN3xz3WKV02GmvpIHFvU7eq3W7uT4YO6TzN4b6TQJK2Kd6
	tfHrFQmovVvtgzs1uuZPjrl/5ctPkbNqO7n0vkKbqam6Kf5w6uXY
X-Gm-Gg: ASbGncuni/uiNXcQD6BCQHnaMvc0DtnpyZgupKK2E0lOhyZ3XIV7UiD1DjlIWebGyNP
	fcyJn2QgWcNSnaNN73pB5+4m3Ztxo5D70ze0IAbBvfpBeBGObbmAfBRqnHFxdgsHJfpOirzapdB
	hobTLiseOqN1hUgNvZIAsCdw6QggBOSvqrN5oRO1+Kznw/LRaE6tcIGEz85pchnrPBNexjOe5b5
	7CjN8BA2aTdmRHaaNM3fDXl2w+uQH45+/sv5iubU3SiFJK1pypFltN2H5SE4FvUduvuZpyZnbI/
	gYQ1nvmC4JeJbpKeqOMF4iwPc1XiKrTgX3PVDKGICVSWFdODBCy560PIe9ZHst7Z8UlKRuNkJ2h
	gr64JUDEi
X-Google-Smtp-Source: AGHT+IEDjgGNVWbzB6Xc4tHbi6ZRWUATDYuf4z8WnnwDr13qOhSHxOiNofBtLV/8u9BXBgZvL8GMGw==
X-Received: by 2002:a5d:6da5:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-39efbb09d5bmr12222914f8f.52.1745322664453;
        Tue, 22 Apr 2025 04:51:04 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa5a2300sm14767410f8f.101.2025.04.22.04.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:51:04 -0700 (PDT)
From: max.oss.09@gmail.com
To: max.krummenacher@toradex.com
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: imx8-colibri: Add PCIe support
Date: Tue, 22 Apr 2025 13:50:49 +0200
Message-ID: <20250422115051.1867349-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_045106_732960_A0837A9A 
X-CRM114-Status: GOOD (  14.14  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

The needed drivers to support PCIe for i.MX 8QXP have been
added.
Configure PCIe for the Colibri iMX8X SoM.

The pcieb block is connected to the on module Wi-Fi/BT module.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 .../boot/dts/freescale/imx8x-colibri.dtsi     | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index ecb35c6b67f5..e602d147e39b 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -52,6 +52,15 @@ reg_module_vref_1v8: regulator-module-vref-1v8 {
 		regulator-name = "vref-1v8";
 	};
 
+	reg_module_wifi: regulator-module-wifi {
+		compatible = "regulator-fixed";
+		gpio = <&gpio_expander_43 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-name = "Wi-Fi_PDn";
+		startup-delay-us = <2000>;
+	};
+
 	reg_usbh_vbus: regulator-usbh-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -261,6 +270,16 @@ ethphy0: ethernet-phy@2 {
 	};
 };
 
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-x2-pcieb";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
+&hsio_refb_clk {
+	enable-gpios = <&gpio_expander_43 3 GPIO_ACTIVE_HIGH>;
+};
+
 /* Colibri SPI */
 &lpspi2 {
 	pinctrl-names = "default";
@@ -454,7 +473,15 @@ &mu1_m0 {
 
 /* TODO MIPI DSI with DSI-to-HDMI bridge lt8912 */
 
-/* TODO on-module PCIe for Wi-Fi */
+/* On-module PCIe for Wi-Fi */
+&pcieb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
 
 /* On-module I2S */
 &sai0 {
-- 
2.42.0


