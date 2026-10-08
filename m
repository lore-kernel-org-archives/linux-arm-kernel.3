Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB184CA600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 20:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32knc5yptOaSTzPqRswLQEdRMbmmyBGuNbQZiUAho2s=; b=jlUWUdvqvgpS6gBZcFHShEBJnN
	bGT/2jHtHcQtcBZj9DPQW57ZpBtQAo8yx3vUiyMUKjBW8fza7vSFN5rGDEVO9Ils5TcEddvGkPmK1
	iBKBTEDvJM/Tf2QTEcou0yMILlXahb3V6IwJsN7RZ3Yk2+OUOXqN2wn2pY1BFHhP23h+g+RZHAQk2
	Zt+TQE40BSBVT1dXoRrPdP1tDA+7dnV3/Hpd5WAZis12g1jSyKDxdKRWt6Q/8vkgJQIzjaITFjklr
	oAly/ZSECiDizlDlM9C9vaWrdky2SRnfbT0XVGojFWvY/Y4xC/DaLW/s7NPAP7kggQ7Y5jXx/zYDq
	i0WDywbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtz6-00000004wum-3kmf;
	Thu, 08 Oct 2026 19:40:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtys-00000004wiF-0E72
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:40:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so29368305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488440; x=1792093240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32knc5yptOaSTzPqRswLQEdRMbmmyBGuNbQZiUAho2s=;
        b=J1Q8RTF/cM5Hmg0z96BnKpC4M+IgIhvJKrtlhpFQemVrNMeDn8w50xJZLG6hSr58wk
         UZEfiCX3G8Naw4YQqflleOSFieomrj9qizHxiMIdbu2cljOxZZvxlRytQ22qNqWvriIE
         yeW4YTfu/h/GYH+K9lS/jQ4MhaLNwbkSUo/2sVxzfwQaPzgCY1Hop8uHMoCSvMRvhKyc
         Gc59Ixcw8VDopnD+tLeiuMqFSzJXH9co8LCAbMEu9pOfaR+tT1mOPmPmWz7f2a1W8dYa
         vOS/XLz8XSpU6tGtvz5ggMiJZRRsS7Yr+STxf8tAOp6kirO0BRavG66d5+9lPr5x6Pul
         2bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488440; x=1792093240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=32knc5yptOaSTzPqRswLQEdRMbmmyBGuNbQZiUAho2s=;
        b=AlXP9EKbN1+LY2X6NUMKxAg542SEvAEJ+sNTW7WE8AqIbNIEwRZq7ufIX4j8bOfYP6
         yI1v9QmadeHwbgxfDyKTwnZQ7HEUVjcKbxf3c2NNab6NAZeV+59GkpYWcV+TEkmCJuoP
         hd1pW6x01hL+k7i3yC6rxYIEdWKkYCuOM4CAkJUdb5/J/HwV12Le7wfSRG2JAXt6ih67
         l6jQGcCfTeqwttZniQFA10rw7NU0ZKM6LXyEAToj1tkjm3WtBtGeAGmYHO5ydxRx/v9S
         B/pvX3Ry4Ebq8aNpLe1qAuA9P6sGPfWCjbSXL2EXNwqN4POSvieeLcDL63UTpc+m/VlV
         0KoA==
X-Forwarded-Encrypted: i=1; AKwUvBxirgSiBi34SHXC71QgIhDv9y42vfc+UUM3rmUkxuPyWwSL/2i9YQrLiUL0oeX3IcNzh7FokEtKqRoWsY705blQ@lists.infradead.org
X-Gm-Message-State: AFuF++l6cTkSFg6MmeU70OP+bGgStR8U7DcdZ6rinz6uiab3Xt1Ghoii
	jkNU01CFsPXlXBf5k80O3yY8DLkoC0v9i65Qd74VdObVfW9s9lSfe615
X-Gm-Gg: AYBFou2rPVtE6ZYtfnppc30lSk7wiQ/8PRgUACjOT193Q/qeptVLE+BXsi0NYy94mOi
	JCs+3QPoQVJcjCfyv5NkTu08IjVtJRuID3v5N0aujAoz0F2HjnjayLA/4p0Gauf7OkzozJPEmLm
	yvgdds8ijCDvbQeqs8VQWcrjHrJMnsiY51mHsaGDbGQV7mu3Cz6npw96K7Urb4vlnsCSS2FOqja
	BNhxK0j4+HdeV9W/zDWVqk0iS3i8pU3wF9L6MzPI/RmVp6t5EmnYxMdRdARsU1jKn2g3phtIg59
	sMOruUW/3wHSBECRoq46TEmz033YaLrq7rtAp24ndePSBPxwa+EIpdhMEyXkBp0xiFCZrPRrHbG
	MBaheRJ3nw8q6JClXOTN8Jf52MqmGWGgZb7FEC0CxYeRfNvPIiXUv4q1/D2v6787dqDx7uOd0Qi
	MCrhgsAnKQmTqEeS1MZfSQtKf1sQCIPHiepWcdIgkaNe5xD6aBMkZ3XmnFoREq4+Lp0SdNY9MZU
	az+AmfS1cLcp3MW23d6tAt3osIPggmho4xPU8U5rsA7nAfYxlZzUNLdUvQa6otrFw0lG6g7vzS9
	+8KXvo6a69EplcFN20i5bg==
X-Received: by 2002:a05:600c:3b8d:b0:49f:fbad:29c1 with SMTP id 5b1f17b1804b1-4a1806611acmr136284345e9.33.1791488439940;
        Thu, 08 Oct 2026 12:40:39 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 10/13] ARM: dts: imx6ul: Share Variscite PHY clock and update PHY options
Date: Thu,  8 Oct 2026 21:37:50 +0200
Message-ID: <3d7cd1dc732ff0dcb378ba8f41d06a06eaf1a850.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124046_031401_CA75C05A 
X-CRM114-Status: GOOD (  16.61  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Move rmii_ref_clk from the ENET2 file to the VAR-SOM-6UL common
file. Symphony needs the same clock but must not include the
Concerto FEC2/MDIO configuration to obtain it.

Encode the Micrel RMII clock selection as <1> to match the updated
binding.

The existing Concerto descriptions hold PHY reset for 100 ms but
do not specify a delay after releasing it. Use the reset timing
validated by Variscite: assert reset for 10 ms and wait 100 ms
after deassertion before accessing the PHY. Apply this timing
through the shared Ethernet files to both the existing Concerto
boards and the new variants.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Replace the broad Concerto conversion patch with a focused Ethernet
   update. Move the audio, storage and carrier consumer updates into
   patches 7-9 alongside the corresponding shared-file changes.
 - Retain the existing ENET1 and ENET2 option files and move the PHY
   reference clock into the module common file for Symphony to reuse.
 - Encode the Micrel clock-selection property as <1> and apply the
   validated 10 ms assert / 100 ms post-deassert timing through the
   shared Ethernet files, including the existing Concerto boards.

v2->v3:
 - Use the shared storage and wireless option DTSI files.

v1->v2:
 - Use the shared WM8904 codec DTSI in the existing Concerto boards.

 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    |  8 ++++++++
 .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |  6 ++++--
 .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     | 19 ++++++-------------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index d2a9877344ce..ef838ae07297 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -20,6 +20,14 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
 
+	/* ref_clk for micrel ethernet phy */
+	rmii_ref_clk: rmii-ref-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "rmii-ref";
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "3P3V";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
index 6b1e34347bec..ace6d9f35b87 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
@@ -5,6 +5,7 @@
  *
  * Copyright 2019-2024 Variscite Ltd.
  * Copyright 2026 Dimonoff
+ * Copyright (C) 2026 Variscite Ltd.
  */
 
 &fec1 {
@@ -37,8 +38,9 @@ ethphy0: ethernet-phy@1 {
 		clocks = <&rmii_ref_clk>;
 		clock-names = "rmii-ref";
 		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <100000>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <100000>;
 		micrel,led-mode = <1>;
-		micrel,rmii-reference-clock-select-25-mhz;
+		micrel,rmii-reference-clock-select-25-mhz = <1>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
index f0ed71798617..a207a720bd30 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
@@ -7,15 +7,6 @@
  * Copyright (C) 2026 Variscite Ltd.
  */
 
-/ {
-	rmii_ref_clk: rmii-ref-clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <25000000>;
-		clock-output-names = "rmii-ref";
-	};
-};
-
 &fec2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_gpio>, <&pinctrl_enet2_mdio>;
@@ -33,9 +24,10 @@ ethphy0: ethernet-phy@1 {
 			clocks = <&rmii_ref_clk>;
 			clock-names = "rmii-ref";
 			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <100000>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
 			micrel,led-mode = <1>;
-			micrel,rmii-reference-clock-select-25-mhz;
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
 		};
 
 		ethphy1: ethernet-phy@3 {
@@ -44,9 +36,10 @@ ethphy1: ethernet-phy@3 {
 			clocks = <&rmii_ref_clk>;
 			clock-names = "rmii-ref";
 			reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <100000>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
 			micrel,led-mode = <0>;
-			micrel,rmii-reference-clock-select-25-mhz;
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
 		};
 	};
 };
-- 
2.47.3


