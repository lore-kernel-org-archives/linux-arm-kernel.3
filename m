Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC58CA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVFgubLFwSlRx0dc28Lupwth5R3tDS9aeaXU7vAsa6I=; b=wcwXwCBfTFks83nwld1r8PNTGf
	m6GanbcqUN8sDRfU2GU2MHmKUGX8MVd9rdrgIPhwT5PRU6fO5R+I9KG4PgRktWcc9RDFuSa0/16AE
	HvbbEg1GNb0auHmsfGJ1S1T2Vto2Q9M4nxqkyEwjraa6UKvQ9LQGHbVyuzP7QM2MzuHj9zN2CsLUK
	VgJ6+j6+YZ6V+dFyvcE8VZ6o6+VqDtp37xOj+zkrKiayVbkdT0+VnSdz5DXajXKF5rglpa8RQ0S82
	AQ3sJxQcTTnoxBRfnAm+EEYmD9RMeZ5IxYMT0qdG5eEz5U/Tz1R7z7bz2lRkSbEJ/8YAq/7ccf1zg
	TVl96lVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAQ3-00000009ppB-3GTB;
	Mon, 12 Oct 2026 07:25:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAPs-00000009plp-0rcQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 07:25:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1060552f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789946; x=1792394746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVFgubLFwSlRx0dc28Lupwth5R3tDS9aeaXU7vAsa6I=;
        b=sL5rkqCqEdHvYWlu8Pye5ZTYt1ANU3tiwSkklPgNHjg8XikyYYN19jltIviKqbMGtr
         mpDw8xqj8FSBSiT8qTzJCh9a7WaVLgHFW8sOEGd4eTQQXnCvoDVvlYb0wwiT0eDips4q
         xDyM+IZwIXqEKZMU8r6ufBdiL/t5pTNB+xE4oZHDNDarOsjuTr18MHmgfa35g/EH2Qcc
         +kyA61+7hHLJPalRAgMvVMFr/v/zZRly8FZPB/laP68pUz3X6pIOkSk5ZXHFw2/XIfuV
         NRomFU10bIROVhUTby4VtU+6OK5rGaY/GFGq62MoUBV1a4LDOdYxAT5+cjI83h+mdG+m
         6wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789946; x=1792394746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVFgubLFwSlRx0dc28Lupwth5R3tDS9aeaXU7vAsa6I=;
        b=2H/Za6201cpsxLOZcBQGk9VzcMOL7kr7Wthtdmn1OYnyGOq56awCugGg/UdTHQsyD1
         M1M8NfI4xgqtvnn8sEpNR8coSFEgGaScdWfJj333w1ekcn0WDHe4jB9CYG0nEGrH/0BB
         xMAcby+sPhKsecnLmhphK9QbdAGwz81t+VxdK+adYc/CAWiAESsQpvWJ7KSzH10QbVU+
         NhxmfYH9bis+octA0JDBdn+drokknm0//RjTSoQttepFnJfh+1BRzHFu7kJUFU2cwaMN
         dZtWXMxomtmsUXCGX3A+YQYU/3JwU+8Afot5xG/DlfvQkOlTSY2viC4xyRPys6+nARQs
         xeVw==
X-Forwarded-Encrypted: i=1; AKwUvBxEnxngZ1Nqq/2GHScU+E3bNsoP+f2toV+JO85FklnxRiNw1cdE5CX/c1gus+184BE2rJKbeKC5nwVdYJfIugvK@lists.infradead.org
X-Gm-Message-State: AFq9FYLSei6YmAK6Xt88CfXaH0eC63+0FEW7YncTdJG+yXy03hasHs4S
	tDNG51cuVM/BCvC04uz7hHbmKpIOUWnNdybiqTOL5Ww7SSTs2KNf5gVV
X-Gm-Gg: AYBFou1hiMwtvpYsWfdQEELz/qqDt0P9w1pIV1pq3lsKZ+ZTrFd79VvCqlFD6nsliI/
	eTK5sunyxwUEJOc6o9CO5RYAWFQ8T9AgJt5W112Zvq3nfxbdpqp+ZOZKNI9oolPHE0rdMozecGc
	z1vRTols+3Qdwxk6YuU5sOel0yVtpHiJr2MFcCL60RS5ZSaMm+lbkKDzaovdUIjOvVpXfKhKCcI
	uy+IgjrPivjXxoEOwgTPwnTGEPPa4pwW45nWt3ICrFd4ih1eKvXsQ9cjyL4pFemcIyYYEq2w5UM
	b+CMrBigj+bjKw6DiCdslQY9NiOZaUNUGARpyzpE3ziyLMFLeDExsaIsEC5UPLjUngMqSw6jyqC
	mV10fQ/SpF424WrjXamWGnLPKKh5M8EB3YNHfZ/XNdAOhGEaf6hiM9spt27COZISvSdyPKL4LRh
	VFBfi1nOo971y/ujuMwgbq+bH+uiU1LUGp2xDQHXPLOuYs+YVQ0Z29LzoqDBREaoUbe1KtVyMDd
	nVR1htrJDYaIO42sfO1CziMOeAZpKZpm49Odt+O+B6nwZhbze4JR1XyCthU+kFZ
X-Received: by 2002:a5d:5f51:0:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48dbaaec8f8mr15252003f8f.29.1791789946187;
        Mon, 12 Oct 2026 00:25:46 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:45 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:25 -0300
Subject: [PATCH 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-3-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=3858;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=J15XFPQXwHwXqajYWDHAsZeClrpxiXPgtU/y11V0Fb8=;
 b=YNznv4USjYwddWq+/qaJHmbbnVovBRRKYP/qeKShQ1yQNEDDt04txudw7FbYWa1YbUcBfvhlF
 4c32Lwb0NINAXgbhaKdb/hcrLlgT4dfPwEKirLnrKQUQndhNJbVX9qv
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_002548_355111_517AA045 
X-CRM114-Status: GOOD (  15.49  )
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

The overlay is also combined with the various Apalis Evaluation Board
device trees to provide ready-to-use DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..b5ad9172e1f4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -59,6 +59,22 @@ dtb-$(CONFIG_SOC_IMX53) += \
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
@@ -184,11 +200,16 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
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
index 000000000000..a449ef9fbfaf
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
@@ -0,0 +1,79 @@
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
+		compatible = "toradex,apalis-imx6-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
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


