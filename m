Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555ACCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgK4Knz1UTecYHn0SL3JT3fee9wk3Cp4TEKus9TadaQ=; b=EmHvEOoGTLwd0xhPgkL5CNo3ZR
	k9CYAIX5Si9RrTmnvgmuRMDGOP7d3/s1pDgEQ6be9tTxxFJd05QOXUSn039RFvPx1f9KToBstGIEi
	pSrj8O1Uqht5cdWA40RntZmPIefsU5uzbabZtwWXmuKGwMvFzLqBq2QWmMxLU2AddUJhz4d7BBYJM
	c7hHYBXhUmh38Ltl90mvzw7FdPeSPdfvSBYPbBl1x7VWPJsu2ZbD90UyyKSSLPVQtAbR9EOVjwLw0
	8urgwlNbzoxz6Pr4iSVY4ooEd7VV9kdq52ThcZmu7OUPUg/1JRWO3haS5E54AF6lQHah32gLs6F15
	IOxf7bVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkU9-00000007A8G-3v21;
	Mon, 19 Oct 2026 10:20:53 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkU7-00000007A6R-0civ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:20:52 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-17bc533fda3so2112422c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405250; x=1793010050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgK4Knz1UTecYHn0SL3JT3fee9wk3Cp4TEKus9TadaQ=;
        b=bvJyYk+Xh/6GWi7fTcjPPy1h5ZvQ2HAbWayS7uAZ5Os68qd8Zn4p1uWVAd8VeMusRu
         wwwscj9UDgwSLfZ2dEtBOXYGvmC+3kX0DUPjYO3rOTMvftm/Jhjg/FS5Wqsxo3xnt8xH
         p0BEQieTwJGVLXzJiYEAVBHow4tP0gP/4F8EdfWL05WF2tuyNXaPgM7dUNIHUEo1ASBn
         2BULeWw3DKvRZV2xX+s1IOxmOpq8zWtwjc+XZs4hONZUXQyDjDia7xa+vm+4g3Mzk1fM
         /pF+9v2m3v0rTTo8SmL8FB7Zpazyu4QscyQXXPEHh51StrBZHEhJiApj9JXw1EXfthgc
         m9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405250; x=1793010050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgK4Knz1UTecYHn0SL3JT3fee9wk3Cp4TEKus9TadaQ=;
        b=27PTHDudhvqwhs19YMfqcyN9rotwixspLT7YmJPRbj2UlJS1bEZuScHhjO8heaXPmw
         N3If/tcG4bTbesqKE/67Ha3LVWLArtsbs/zaRHuBv/uZfcsGFCybN00sfa+LuzafVYpW
         2G2KDe9sAcD8S6pnB2v2/F1vXOauQ70QT29YNXnwtCzj1iSh687TekA5skRtbB3nMzzX
         WSEFcQSQFbcIQzHPmBywW1DFO61cas5zLZJvYPHMKRMqnsodUPLldGebdiZ0OPgMFtqA
         kq59diMMf6Uh/c0v8DOmxHFOHpQIVmuzLmFfDKEJqajKGhIdsx8bNTFGNEEVQ70G0oEl
         2o4A==
X-Forwarded-Encrypted: i=1; AKwUvBys+A4EaBGq6TCUkC4+268rp0vH8Sx7taavGAMFlaDupjRRHk3HVe1+DHKVt5kk2aWq+HavDf9mqUai7UJa0cZ2@lists.infradead.org
X-Gm-Message-State: AFq9FYL7tEDVzcuYDHMWoBs16jK5yWDUW1b4vSFQ06yWiakz79JFJ/1e
	Hz1IzUen7R2HnN4FS1zsoxCZcKhpUXM4rDCyBwrDAC4OTNOQYxighB1O
X-Gm-Gg: AYBFou2YvEV9fFTuw2hsemOZdKOglfjpmIlwFhl9TBF+e1aKn9GZ8KwR25bsG8tnYRu
	n2o+GKvM5Wt3dofdWbLs4lyjPNi1Dvfw0cPrjJkNWTUBNS/irD/pTdNyNI9CHGULSgMKNCunKsv
	thW7ycdIta+/8ddM+B2VEd31q6HW4w6Z5tEJ/z57k6TjcewceoI3uiDlN01A4BDRa2cm4/+L2tp
	tSqnahBd9Y+IqFKDLBlTnZyex4uyo7lsg7BNGC+Pz9XZSjQXUEfuwP7dlPoIIZmGE0xnCjPpbRF
	MvaY+DdB+QSHzzgGWCbq+3Jo2hpads+5Uop77je7y0KouTRBqC6LGYUKjqs2ryn3evLEvO1a4C5
	RlhiycdAFXI9F+xbBS4y7my6JMGKeeYXHpBOWBD3mWPYEMVEEPWCun/TbGrvdIBbg3W96uXGqHC
	PINbWTCQzhbORfY2ouJKzn1g19FWHfkZnZzVIW+WkD0ewB18EZkM0JYjm4jN8FnecW1wTB2UwLV
	VA=
X-Received: by 2002:a05:7022:ea9c:b0:149:49c:233 with SMTP id a92af1059eb24-185138b5a78mr9592984c88.27.1792405249689;
        Mon, 19 Oct 2026 03:20:49 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:47 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:16 -0300
Subject: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=4062;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=r+aca+myZbkHcW0Bz/oaFLZH6+eopUpkEgtw7VP1FW4=;
 b=Zvh0iDVRcy5Gtps1SXd63pWalIOszDSoQM1rurde5ryRdO6K2rMFmCqUHSbRjy9tbneq4/t3j
 sSjRGYh4TiPDpQo5LJT494T+Ww6uL06s9RSdMfWvljaiQEMcGs5xrW/
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_032051_204864_1AA4F097 
X-CRM114-Status: GOOD (  15.87  )
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

Add a device tree overlay for the VGA output available on the Apalis
Evaluation Board, which is driven from a parallel RGB interface passing
through a non-programmable video DAC to a VGA connector, without VESA
DDC I2C signals.

The non-programmable video DAC consists of a simple resistor ladder that
converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

The overlay is also combined with the various Apalis Evaluation Board
device trees to provide ready-to-use DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index b5fad2ba764c..9c218260fdcb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -60,6 +60,22 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6q-apalis-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-eval-vga-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-vga-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -186,11 +202,16 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-vga.dtb \
+	imx6q-apalis-eval-vga.dtb \
+	imx6q-apalis-eval-vga.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-vga.dtb \
+	imx6q-apalis-v1.2-eval-vga.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
new file mode 100644
index 000000000000..991c2b7c2777
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to a parallel RGB LCD interface through a
+ * non-programmable video DAC with a VGA connector.
+ *
+ * The VGA output is available on the Apalis Evaluation Board without VESA DDC
+ * I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	disp1 {
+		compatible = "fsl,imx-parallel-display";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu2_vdac>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interface-pix-fmt = "rgb565";
+
+		port@0 {
+			reg = <0>;
+
+			vga_display_in: endpoint {
+				remote-endpoint = <&ipu2_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			vga_display_out: endpoint {
+				remote-endpoint = <&vga_enc_in>;
+			};
+		};
+	};
+
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					data-enable-active = <0>;
+					remote-endpoint = <&vga_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&vga_connector_in>;
+				};
+			};
+		};
+	};
+
+	vga-connector {
+		compatible = "vga-connector";
+
+		port {
+			vga_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&ipu2_di0_disp0 {
+	remote-endpoint = <&vga_display_in>;
+};

-- 
2.43.0


