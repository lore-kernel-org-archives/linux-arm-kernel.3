Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F42CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqfrzhCy7fF18AsD5JB6bOpp9EoQsE6oyoZkgRdu5vY=; b=evtBouGMfNKcAGn4UzNB5M1xVy
	FWG6F8dqQEVsUSbsQFGuZdG15x97dSa40WaQjdCAQXs7kt+S3GG6ZaW1NN8S7ZyR4Z1XSPRZkY+gf
	Y5Di0K7agMoGfKZQSU8X1QRCliasA+I791dWrecWGevrNfg8gCEGmi4gQf0TxhI1iws7vQ9pOfVyy
	USzIsVYa8b/820lE3CxDnyxBspwtKEztZ3dvFrUcMzx9x8g5gh1t++bDn0I/+wLA2Gm6B7aLCzFJS
	tRL1WmWva1yvY68ZhHBYng3CslmdSBJTUxa0i1Yp3OVLGCoivOQb3IXR+4eezeUDmFjX4kXUoiZ7r
	PNLcO9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlPB-0000000F8pR-1g57;
	Wed, 03 Jun 2026 13:13:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP7-0000000F8hm-3E5Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45ef29c5561so3118513f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492384; x=1781097184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqfrzhCy7fF18AsD5JB6bOpp9EoQsE6oyoZkgRdu5vY=;
        b=Mhrkg0n2I8FM314kjifGQWUDSXZWev+4rDRNUvECCDIPMZSG9/PauRFQXNBQ1Gqfwd
         8OVpUC3q/XB/lYoY9z8DLHL3X200DH4Zhp+XsE9tal3IwfHdBMROeVidBlKG9KiLeTcb
         StpOel4fYmA970xypXPoErX0+w41VwUGoz7Wsc4BBnQlDLl23vE3WMPTu/srBXGJwYt9
         LkL0vqySt99hwZ5sO6kzp1yPPuTjSzt7JAYCBd08PLl+VMm0rOPqjFvztG1mgug4tO+Z
         McU2wLZOhZamWGiw2p79WQzHWUt+yIz97pSQqSSXOk7LN8XB4Qg7W5rrGb7FmmRlqpyO
         Lr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492384; x=1781097184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GqfrzhCy7fF18AsD5JB6bOpp9EoQsE6oyoZkgRdu5vY=;
        b=IV+gKfhHmyHNWIARBLq4Y/igN+TUdsqRvXVKnEyUxzzzypWJesZMXfWNgTlEaZA180
         Dhp8jaKlr7RgygkBCtTaUgAraduzCWNUskD8JXYpILM1XEBv0eNS/WB3SOA7+d20k2rH
         eRE9IeXrQLiBNsinrFfqXhuHnz1eIbNxPEs73hVrQe1wAwrMeUrlReXoF/EoO9P8Il4r
         89MeQKZ4cBuA6aYz5hr1MMY8ugHBqKnER2cnedeterRYZsiptbeIdj7KYl8YbZREuAaJ
         6y1tFf5W0njBwYwOL9jYnbB8npmrmYu0e7bdKanlKldDQ4EPe1465S5t8EWFHREYK1cP
         K23A==
X-Forwarded-Encrypted: i=1; AFNElJ9n1FWmlqjsnUQ2jKATLnusQ39dnuizdSD56SGE3ilfdCJMZXqvB+5KlrsfL7KrvYDne4/QcO6cnOGjkzurYy/g@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2y7BQwZjcNODYyfQ0rT4x9lsASqWZiCpzGp9J/d+ZZCBKk013
	yBu8xxlPi5Za2Sk8HAzFloaLr/W54BA76xklZWRI7X9ESMpO5tfHbuL/
X-Gm-Gg: Acq92OH4Y7cHOiwY7KJTAJsvg7FuVZYlB4cUrri/79y5Mh0UEalXfrXs2NNYpxGjZz1
	7B2cz2Mi5uoS9eg5nvkIRMxKxKJ9MunPHNy9Bu6LZHS2yXNgcOCUmJi6OAha8IG2SJD5tLfoCkw
	Eyo9x+lYHbX20SThUHUvU3C+xFW8pcNxtnyNs+V5TW600v+746nrdJuQGUb2vxqynZ/tZxtoyPR
	bg7fQI2HaFVtD8AV4AtbLIR6ZgbecA9tNgo6slbroAqtqjD5zkTNON4ARjvrv591k7Wmh/Q6KMm
	Qyn+vi0Dnhz6BZU12lSy4SCHoF8ggHz4pjzx8OQpzyGY0KRz5mLUnUbjHNVdOTgphPL0NVZMNgm
	yBpnF4U/FJwmidUS5082z43yFRuBYoto6Ss9RMmhJV3cEkqiC74yJd5DEvrB3+IdfXxqrmjJgma
	xs+GHQ9qYwup8whzBDaivNwA0epyoCrbedl9DUIoDe6JoDYxEm3sjAyUbLmQEIY4t3hDzPieve3
	esqW9QTu/BMWg/e0r1yDJfjXw/iGz/77DF9nrxNYuzpX4Bsqepx7gmDFRg=
X-Received: by 2002:a5d:42d1:0:b0:45d:b14b:2409 with SMTP id ffacd0b85a97d-46021783ce1mr4027348f8f.2.1780492383633;
        Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 09/12] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Wed,  3 Jun 2026 15:12:47 +0200
Message-ID: <bb0c43d6aae79786a351083e5b2000b1ac8fb6e1.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061305_883305_B5698431 
X-CRM114-Status: GOOD (  10.92  )
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

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index ca0fc66193ee..98aea97e9438 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -326,6 +333,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3


