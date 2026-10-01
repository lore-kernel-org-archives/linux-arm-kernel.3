Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC08CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWEN958qzdMHbLCQjYOa4dCZMqLVicSMtaPk1knnWCI=; b=jfaP/HKnmdaEPBlaBGcsHL6h64
	n/eUveslgonC0uSWW5AOSCdewYVBu24Ef9kM1tUnzJBvGec3+Eark4EMmkBWP8xx4CYR6Zm7zW8c8
	ln47GKxA3Yf5CFewJPasjY++cMdj49teLPAgFxAQh6tXzEiMBg8MUTierBh3OWKd8Bi30oL9s+Sqk
	6Ax8XawAThXyvgbrfeLPsycgnCZpib/jLjmZxQaPbZK1Hl+atz4M8cm+/wSxbSjpRgzxIN7pu+Xgj
	hBuqu3K9uIs0eTKbUrdTlfjM/5tmN+4jtxKAbJJx67CTwi5tdtS+BAYgh+b9tX0o182aZlXFQa8fu
	FeFezTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ7H-00000009bSH-1GVv;
	Thu, 01 Oct 2026 15:54:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ7A-00000009bMD-45Z1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48b02a2359aso503130f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870071; x=1791474871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWEN958qzdMHbLCQjYOa4dCZMqLVicSMtaPk1knnWCI=;
        b=fFY9Tbs1PQYNzEgzP0XMTsQ984PIzCAhMsKIZDY77de6TO93QoWmoQ3mGLZ2ftNbe4
         gogt0taWsXfL6ukyxwTrinFMXMdscBYRY+Cxna0DylCy5STovXsQ9qyyZhRzca2NPSDW
         ExmwNtRdVHm3V0dUSiXYVbJLG2BAerCb6dJpIpZm+F/HQSc0nKUA+LQPPWcieUOWWqpJ
         vm/mddsUnu4ztQrq1p2H5AO4+PM7o5aFCipFdRg7STDVxlCXq0ZGENYxVYDceZeVMOmj
         t2tWHNuubx0+um8uq/T3lnPTnM+UOeNE3eXfCkJ2tqQQfq9NLWoBhbJwIyEK9zum2iib
         k73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870071; x=1791474871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWEN958qzdMHbLCQjYOa4dCZMqLVicSMtaPk1knnWCI=;
        b=QWchUgLeLyTbuvT0MTW7JaSZk+2aP5J9UP9Helmj9dOHjl5UHGRj1mA4x/kbRMZkAG
         sPKQK22SaswGkbp5qOUirlwMGERa1+UEOUy14BRGMLIVPRZ+BzCzxmvYd1xKwHnsM0mT
         DsjtsvGUzaFHHiLeyfzKALE5ekSTyd1V/kdbJw6LocnLW8y6h6qnV1E5iQAAmFTE5+fF
         B3BTH6XeeGz3oqRnkaDix65DWXJaRDNpwM7N+gc3757NxrY/cE1F/vhRaxCydepJe4kh
         R2DSeiHn0gjvpTUOVeGbhwHebVDH+kolXqTBeUhXRzEIidqRQT22h/AGTrjZ84CRhCqA
         Y08w==
X-Forwarded-Encrypted: i=1; AKwUvByjKO4xfYdb71aO8RnZGkx/9+G3SzmVcnti8WD95qpu1m3dMCqj7ql50umRTx0NuV0vVzg0p0rllI0632EKVhpU@lists.infradead.org
X-Gm-Message-State: AFq9FYLyqPXpNk+AeNJDA6YYSPK+0Ii5pPxmAmmgHGWeeLH2EOEn1F3l
	1Cs30C4qK7/Ywhe0ZaKm3pnTZpF591R2IQ/asofGKnAymtrO1Bl9aYLl
X-Gm-Gg: AYBFou0zWSmkDXn5/afjxe/4eYeadiVVIibsHTZlqaGqqmIi9/fJ0ogg95zQoSK6ZiS
	7WBK0XH7LfEqQaYHuFWhkUDiHQRC4Hn8xtFcBKOQhqpRXh1gQGG/H6MXz7MYHyPfpYa+lfM81Y4
	Mcx+ToczwM6LcJNehEu0oqEnj/t0Uyz+jCEMlzL6w/ycYwa3tbNQ1duWyQsuFA45zgI4B3Xtmne
	RU6vr0mXp/2JmmJmM1OaIpbyNemeG2SjxvStgf451ZMWc9eAvnA0Ew/R4O14dVBlKocRggUElmp
	Js3iedJdiQpDGvFMO9yEke7yPythPAbg00qE0ikdVYv1V6tjJe0IHKzn9tpuNDDqnKMYd+kCOLA
	OyQ7CrfSGfGMfbb8UCevFtbd1MuI+NavkyXgZt6YwsbsEc3H7y45YkAWcI49Fbzibxy/Vv1VgyV
	/0BgS27DR4f3BpRq+45YdhoK0xLk+SgUdzLuuW2JP/mE31x6fcCl3PoMX2cPYgcVLoNnqNm6+j2
	kWdoHop1G22+uzc/5cEeNTjAJL5/iP9oJjtXl5/nKzmo5RvSfqyGZrTXt8mnk7hMw==
X-Received: by 2002:a5d:54cd:0:b0:487:1577:9e33 with SMTP id ffacd0b85a97d-48b068bf670mr5217869f8f.25.1790870070993;
        Thu, 01 Oct 2026 08:54:30 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:30 -0700 (PDT)
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
Subject: [PATCH 4/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 12:52:54 -0300
Message-ID: <20261001155412.3177428-5-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085433_887088_ED392166 
X-CRM114-Status: GOOD (  15.12  )
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

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Ixora carrier board and Apalis
Evaluation Board.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
 ...apalis-panel-cap-touch-7inch-parallel.dtso | 34 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 23fcc80d7f309..5f35771cc3626 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -103,6 +103,10 @@ imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -238,6 +242,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
+	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -249,6 +254,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..f04516e3c5cfa
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Ixora carrier board and Apalis Evaluation Board).
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
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
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

