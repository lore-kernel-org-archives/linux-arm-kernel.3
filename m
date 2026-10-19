Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1871CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJYLGc5QU3lpfwnSQm38v3uKx0dsa52E0YaGaSh3dSo=; b=ZfdujtdUxdY/1b0HxSSlOXwuCU
	FhGCYltBgr/oumXsjZIz46LhEOZ5VEG6vw9l5G2yn4L0y+rpfCIz1zVNwmxgJAFoY7ynaqlio3HNo
	cmA11fbTDGonm+ql1GE/XY30YktVzSJ8/JShrdjpoX8SVTPSdjpPk+p20TmfgjHMxUeVhPcoV7LUL
	ss2TgK01PfF0HErpa5oqGzCyski0N+8IKfpna95pb8xxbotPiAKT+tDbvw0C+uMEnjj0AoTGZEtR9
	8XYLANZUMpNCMX8Kf6xf8hB6QSJdEDvRKKEtCUXI6MB+ALPvulKniQ2aZ3lcQn3dD+HlNbRZBzJtI
	P7mKmhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOE-00000007H4B-3a2H;
	Mon, 19 Oct 2026 11:18:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlO9-00000007H0J-2Wb2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:18:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so21464955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408724; x=1793013524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJYLGc5QU3lpfwnSQm38v3uKx0dsa52E0YaGaSh3dSo=;
        b=CYgq7ESyds3NZ45qYQrwKPJC1jfIJAR1UrfypLOyekkFmpclDE/0p7LjIMZtCF2JKh
         vls4uObrK/BuJfYt0fxFBZYbb6Wjpek1/+f+C4IwAN9PYBsOOUxvNDf8yW0GCU6Mg4F0
         oKFOsEl2wvWf5w1OB5iPYmLkFcmi4mp8nTHfHskvPhIGqIDIS5w/bj3eyry1xFOFSuLx
         t1Ssu1TIHHnZdSllqYdbBp8yGBhGsuXkKHVzb1Ouc9oxZCxnvvIHWdZf2OwzX52TxgNx
         kpsAnfV3q07kJgXf2Cft7LOP7w0Kkv0TVoyyKwmPxzBC7WX6Lh4s8hbICjRnwDlYqQ/h
         PHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408724; x=1793013524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJYLGc5QU3lpfwnSQm38v3uKx0dsa52E0YaGaSh3dSo=;
        b=fk1jJoBR1ob1A/N1HsvJbvt7hfQfX8EXG9xep+xVz30AJ9goCgE6AYR87S3+1P3ExI
         0Kir22eZEROJtNOIGPQXYZ3s3Zi6lJ8x7+gCUX8iNCexpg3217RPmdzXz49FHF07t8l/
         6yH1DWgRtYZWlLNJxH1R/ijH0sWFr0K1++rB98Pnp5SR238X2rNESX6NlUTD5e5uaiVr
         vpz4zt89cDLQL/r6hZ61J3fqzd0ANqq3m3HGpUVJu1LfedA6DuuXq+lJiBgwYG75jPP/
         /vzvAzqEsseIlyXdeO7Uf8FtABErksGnwFLWfQ0DUeVLBbtsJhV6FcqdpTD4SceFwkyB
         xjAw==
X-Forwarded-Encrypted: i=1; AKwUvByNnnjgqfwldD4d84JN+mOfYYIXXNxnrZBUULg4OFAKEFL+4WGMfqzSKMcP9bWi5r/KbKOjSUTDbkb8lfhvNAK7@lists.infradead.org
X-Gm-Message-State: AFq9FYJMmHn3qVudLC4nyaM7mUAUykHTx/NDkjii4KjSm9Lcq7aUbzsl
	lXdghO7264k0d29/XCuOqdXtiYupZdxeQOhkfIUcy88NJPepTemmsh05
X-Gm-Gg: AYBFou3dsREEe7ewC02O803frFPcg0mvZXulz9XEBkHe/kRhIXzol+TuCWwAdcNCu09
	/m7mZ2l3HYigYDTVyVE17RGSRHZULlJgv87XX6fYYypChk6MWzrEUaYKQqAu066DdHSU1LkihA1
	8eyj9qfIfIiMLpfyBd4Tk8qWDM8LyJJmyx1iRZtXo+JFof5hj2hadPtF3uaVEfSlAIa0bjZnLwi
	s8KFYdM7WDT3xUPwKnoK3hKBmcy5s4/muy5sNHajjBeqnIssPv08Nu39kxg+v2RwtjYOA6Sd10J
	GgVb6L+UOmGHfbHGUbMnQfjMMUWE0ZSrdoCyteNV2W10Z0uYqKsRC782JobI0da0vIY+iP6Nhm4
	e1kutETgs0gDXi9Jf1Lvi0nyIe76Ae8sBaRjaSOH3fo7Xhl8DTk/j8hzvRJd8mHB+SxkMNAyZv3
	QArZQmeA4yNMKZawhYdCqSVVy6ZPfMOvJTKy8tgZKHh3Jft9MNUwb2GHuKx5sfG1eJ6JZtTbehD
	srxU+EJM2CwofGWvoYLAbjQlplfEd/MoBZ8q7iBwilDVZFlk4cjix1tA8MQssMnhLWiGeXltdsW
	shXwHmQPllOrOItg3W258A==
X-Received: by 2002:a05:600c:3b92:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1d76315fcmr190697755e9.25.1792408723519;
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:31 +0200
Subject: [PATCH 2/5] ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch
 Display 7" Parallel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-2-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4162;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=myClqR21JNubd0OB2mhh3+DPt2M98s4uE3+qZ2frpw8=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qc/6F/bmfCcZQVfJk5IePZU4r54OsPGNIPuf6d2p
 T7S/cq9rqOUhUGMi0FWTJEl44mqIJ9CiKwHR3MyzBxWJpAhDFycAjCReyIM/5TuX7M8cKc1nSOx
 n+dkZcXVIw+2aM3OzrHSnZw5X+QKKxPDf4++DRPMb6pVXhCy0F7fcpbjYpKTn0nRxwTRpSI3WHx
 P8QAA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_041845_673970_61702293 
X-CRM114-Status: GOOD (  14.93  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The touch interrupt and reset signals on SODIMM 107 and SODIMM 106 share
their pads with the WEIM nEXT_CS1 and nEXT_CS2 chip selects, disable
WEIM to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Iris v2 and
Aster carrier board device trees to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 11 +++++++
 ...6dl-colibri-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 76e2ce85a4d3..7897d9dbdfac 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -80,6 +80,10 @@ imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -92,6 +96,10 @@ imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -132,14 +140,17 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
+	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..13b4888e07db
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Iris v2 and Aster v1.1 carrier boards).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&weim {
+	status = "disabled";
+};

-- 
2.55.0


