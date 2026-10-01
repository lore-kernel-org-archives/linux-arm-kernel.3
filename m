Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEBECA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5CGv0/6w5gVrsPF9zExhSI+JtnFir6oWba07h7nJSU=; b=bFxH5HEknvtMWNpjmN5key2+SG
	xeGxIp+azIFHuM8KLeq2ZhIf7ThtxcXYBQNTw/pioSO9c+tDD/R2vOFwb4Mw2lBFVkhN7q33RyCFu
	6Pf5Pkii0FESnfCL77Y5dfO/eMQA1fGFlzSCS2oldL8SGFyjqqO/5D+RDqL98imTRpqE4+T51ZXI4
	wsptR0rybZuw/oumJTVac1NRjySomeX9DRY5iQ4Ey5T8HLAd5vGdxV/GGY9KhCyT6ffHyD7EDvT93
	P5fEXhJf+tpe7sao/Sk0G1yfijjpZZ2vB+GoU03ucLU0D/xYn8pgdW32d7josnsd3xZ5pPsTtsXkk
	9kuZZU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ7C-00000009bP4-47Yi;
	Thu, 01 Oct 2026 15:54:37 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ79-00000009bJf-0hMP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6351831so3943244f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870069; x=1791474869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5CGv0/6w5gVrsPF9zExhSI+JtnFir6oWba07h7nJSU=;
        b=J5sgblk/Hj/DiszxRXLEA2NNY+vrzEqy7RPHvGEIWWnz8t3VoIHX09QHuDwCIDIE8M
         VE7CmNy3E+zr7J0Q8eaZy75R9Qui74PIDo/5484YrMmvKvHl2Qjc4EqpGx2FlP34QCl8
         vU+gX9N4jAHBnt4b1oFQ0HMEnPtarwwTbyiK/EwYjDotD4hoTzQoTEF+K8aPCoxRYh9e
         ytws5pk3yhJjogM+v3CDUjTn0YjvtoPlqcVJC9vK0rX85VBcihqQD79WKe14JDsBX0I5
         CiGoknf4ccQMRVoNkucthhaZEfxBRDKpWtyYE6fAE5HQTmng8ar/mo54dWRPGQW/lXuq
         Z1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870069; x=1791474869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5CGv0/6w5gVrsPF9zExhSI+JtnFir6oWba07h7nJSU=;
        b=s0h+R/p1TUfUkO+8JtasQ1uYRt9R5/yFStCt08CJrb1BrLkwIYhNPr6GnpEX4lrioS
         WnFL7rEUe0Fj2zpn/dKL2MTYoNpr4qguGVwEk5YgBKo+eyg0rQEvwDdokNzB0tA5hhMl
         XL5RAgfyiHGSIGRvAMAo5JSTHRpJzAckXY91lJtBslI4hXrxyHZS0dSDyN2q2IoKVOSR
         yozFEfJVcMGFjW/BUMILkISoZlCr0crtr72ujv1P7bTlmKvNu5xRdH76rzophFoumFm+
         fyBKkL4x9ZA5MXw112Usy5CKnv46vPZCWT3Zz/cKmGtB1F0A0iAGO5IITLYlzquhQJet
         QvSg==
X-Forwarded-Encrypted: i=1; AKwUvBwkVSJs21AIavfHSKX3aeTSlEEeNFI7W6zhAJ8PUSf/Ylh44ExEYUzSAmDhkCMmJ5zVu169K00PCwyAxGAlM0VK@lists.infradead.org
X-Gm-Message-State: AFq9FYKTQWTx+2keJ+6Qjhj9NGCM1R165aHbg9ICxpuXj2XVkvxeCC5f
	tWxUv64jM5L2XeNFda1pL7yIMHVSv74F3QQSOhWQb1Bt0dON5U6ZTdqr
X-Gm-Gg: AYBFou2cI6gDUZtbAjdAi6wXaMdbKiq6tgDgtBMNB8rpH+DbMwou07nZL5pvj3In4NL
	+C/ptfGNlS192F6TpywQ0HTjQSBSILvkIjXBi7zAA1+K0+x9RvNd74yecAPMNHVIoFGRcjigfha
	6dvBx9m/ihbwugB5/wBlOrnWJicqsGy8WdBOWdup2fOlgXqtExiU+Y6FZ6ezp5RaXxXQcQRDQpO
	oE38VHEtLuUNSQCCwD43hSj+b7IZ9vSkRG/+n8Ceiw6H13iOq+1chSbJzDXgEOIIMzjIsWq1m4/
	yBbl3gZc/S0u9cSsHfpcx6aMf0iTAsU69VE9gyrgnPd5wsSPTLmjepY8TkQzPplMtkKaGgi0QM9
	h8tujDz3jVD7W8a7GJdfdhNV07i3kJmlyzU6wjgCUsrvvncHZNhLuwN2m/YMsoC3Ce5gllngUXb
	fOVooS3RdoHemgfFkAOUKP3gcFZt3Qg2PPvzpudo8MBHlQgNTdhkZG4q2/mfq19yAkNgdbT1NLL
	4PrY+viaKCPxlqfbRt5z5+RWVssP8zXiSR+x1weX4V3hHNphipCj5Eqc9xGxn1bKWKoMP5PGJkA
X-Received: by 2002:a05:6000:41c6:b0:487:81c:6de with SMTP id ffacd0b85a97d-48b1271f670mr44164f8f.34.1790870069033;
        Thu, 01 Oct 2026 08:54:29 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:28 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Thu,  1 Oct 2026 12:52:53 -0300
Message-ID: <20261001155412.3177428-4-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085431_236635_3CFCE376 
X-CRM114-Status: GOOD (  17.05  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via the Apalis iMX6 LDB.

The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
 ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
 3 files changed, 59 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 32d77a59c4358..23fcc80d7f309 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -99,6 +99,10 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -233,6 +237,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -243,6 +248,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 0000000000000..a84114e1d3fba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
+ * on carrier boards with a Toradex standard LVDS display connector.
+ *
+ * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel-lvds {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3_sw>;
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds-channel@0 {
+		reg = <0>;
+
+		status = "okay";
+	};
+};
+
+&lvds0_out {
+	remote-endpoint = <&lvds_panel_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 5fcd7cdb7001f..e52b55a386f7a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -95,18 +95,6 @@ lcd_panel_in: endpoint {
 		};
 	};
 
-	panel_lvds: panel-lvds {
-		compatible = "panel-lvds";
-		backlight = <&backlight>;
-		status = "disabled";
-
-		port {
-			lvds_panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	poweroff {
 		compatible = "regulator-poweroff";
 		cpu-supply = <&vgen2_reg>;
@@ -738,7 +726,6 @@ port@4 {
 			reg = <4>;
 
 			lvds0_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
 			};
 		};
 	};

