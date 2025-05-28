Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE928C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y0d9IobXiw91z9fWsL1fagf4MsIBeTY/sxiexdnW7zM=; b=kbI5TRhoWUj4c+DcxQQThB9T4V
	ixyPzoN6x/QJjpYRZqfOuzsx4u66DMJzTgMRE47LREK9159336CY3z2btl7Vvl+Ro8pIczAddMSOE
	e7SqQH3ffU3AvQ+r++gR3Hj8B4q2JjTPSau53iS4d8g78Ttq+2Y6NG2IjcSd6YL9o2B5lGdZRkoHt
	v57HJ2i2gvbbxAh/pNrkxwtVMwTLxu+WmCcg3ihEX77gwh2NxmdIg/+8Bg6RZT/gPOMzq8aUWns3C
	lY4PPtqbDooZhu9RiIDvd2iC+6UxyWmPGxrANQiCYZPh0P7SRxdcETwdUHpSIsf4J+Rp3GDsTw6SV
	lidkCjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFl4-0000000D5g8-2M24;
	Wed, 28 May 2025 12:19:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEeg-0000000Cweg-0hEr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 May 2025 11:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Y0d9IobXiw91z9fWsL1fagf4MsIBeTY/sxiexdnW7zM=; b=skPvNYdnfqrER/8V0bJ2C1c5GC
	sKA+flnaX+8GD9AlYy53baYT7Agchh+uhZ+1TJ+4H3iP/Sz23Z3lGmPO/VRAohk13m0DYt+l0ToUq
	MiMsOrf1gTFvmGf+e/puu1mJGXE5+bDBd6QX+UXOAOcKlbe2i4h7AUA+KSCOLMiXIi1dZWJPNCc+i
	kiy95EBv9jGRdUbDI4l3ynCX90vJ/9Y/QXrBobTdjR0tb3BvbhS1aYSffKH04duikbwJ+mINDqW8g
	CA/qKWKNw6t8aLR89V+WQ6yG4FyUQuOGmtPwXhzVFFdemCQt7seGsB+p+pBS16QWCwQkQjAwceUw7
	+ZOhaSYg==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEed-0000000DXu7-0dly
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 11:09:05 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad51ef2424bso908618566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 04:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748430478; x=1749035278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0d9IobXiw91z9fWsL1fagf4MsIBeTY/sxiexdnW7zM=;
        b=J25La4myLZzm8x9O3ih711aLI0rlR8LVBfAKHj8P2HaYjA/1HZ3liGEoSJ9/L0c845
         wA+dsMbpzfwf+TiAOnqle1+X0wltXrgDbu/Uan5QD/fTcybIGx1/jbSUIA5rl7UMEa3O
         BKH5gFBF5owxCV2DGUKyOCfBIBMlpLxYBkjGSVu6Q6N5BMFRzdWrUOcvaXonytY0BZlL
         CiYmTagDcS2lNV6Uoe8qUdnB8+hfW4gTTHYqS7PLhSu/1s/RKpW7Fn47Pme9XmRXausK
         K9W9aiQRuiR1BdIfuoHJggELrGipw/02ZhO1boB91UH6qlkNvqtHZJilCO/f5K+c9u/e
         NI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430478; x=1749035278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0d9IobXiw91z9fWsL1fagf4MsIBeTY/sxiexdnW7zM=;
        b=lvdMlayswSgrdIaKsnrp26bPmioOkaF3fdK4O+HrMTL2eFt8n6GmyWv1R6gm3eCEYC
         HAVU7dcqBtFm5lr3V61E0WDFqYjW7cTngqswQVoIOg2K7HqBpl80b9sdSfjpzbhlZXQu
         VZlf/jlRoSZlaVhbKgQxhyZfcFYaEhkEx6gAUMgG2IjrajH9r/dSKHsSKRisBJSLrakU
         SLFy4xgVbjn3p+gfps1vU0jwRqJpHxo3XbUG5akJJs5bWQgDK7DYzh3pQFGIKlU8IUHL
         e9Wp1YNcicPfIL6iXeIeblfVRPfVFdb26f+Ytr91J6AIST5o+q1Mr1R4Clr/0+C8O7eu
         VTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2LEccUr//UgzYQALM+02AvVv0CQ43FzzeRP2V9bimWVkHeYU0g3DxQZv5DG2kbZd30FIg2KAFgo0iRd5QScFp@lists.infradead.org
X-Gm-Message-State: AOJu0YzH3gjmy7S47My3yLAD6yjRcPC/5x5hnrw12F1J8sWpwIX7rNyf
	Cb82EPD/7K1J0X8t64Uxynbtx6BUoxkSYgk7ckDqYXx3t2SuSMuMV/tQ
X-Gm-Gg: ASbGncsS4NUVZYWoL2yhV8l3jn1VavFpnT/9VqRiFC59yjoH59NczG65JXseBZgwpY7
	zpBAJK31R1b3ysHj3Xh0w2IsAAOJVgHW/f0Z+7eb/7vZGmqeWsFQPduadkGwlSXb7YBIiFRF7VS
	afYg4Kc0BT1CYDrV5OAedKUV0kOyP0XiKM5RiRnXDG/qIZcM9LoCqUaUvR2H0ltSaCwI4vMK0yF
	q45BMOLWd8yE9IxFM2znKg5hPvFRXGFcZ+qpgCs1nMB7eMIfuxZoky3UFHfTl5l9nnw1IeGLphO
	zOuAjpRTbF6KQw+Bh8wA8pPGgh27KZqxxgR0+l5BpSSz1YVoBgrVulYkZt/XfAKbo2DFVP+8
X-Google-Smtp-Source: AGHT+IEtyhnn9NHAemtfJzTKjrsDVohoBEwPwSRjHx8mSKQZYwXz0JyxONi4zbTF+2+ejSAk/iafmA==
X-Received: by 2002:a17:907:7f17:b0:ad5:2137:cc9e with SMTP id a640c23a62f3a-ad85b120246mr1545273566b.3.1748430477700;
        Wed, 28 May 2025 04:07:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:5a2:70b0:c9d3:7010])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5d9765sm626908a12.8.2025.05.28.04.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:07:57 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Enable pull-ups on I2C buses
Date: Wed, 28 May 2025 13:07:37 +0200
Message-ID: <20250528110741.262336-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_120903_203248_CD8F1BD6 
X-CRM114-Status: GOOD (  10.66  )
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Enable internal bias pull-ups on the SoC-side I2C buses that do not have
external pull resistors populated on the SoM. This ensures proper
default line levels.

Cc: stable@vger.kernel.org
Fixes: 316b80246b16 ("arm64: dts: ti: add verdin am62")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 1ea8f64b1b3b..bc2289d74774 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -507,16 +507,16 @@ AM62X_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (A17) I2C1_SDA */ /* SODIMM 12 */
 	/* Verdin I2C_2_DSI */
 	pinctrl_i2c2: main-i2c2-default-pins {
 		pinctrl-single,pins = <
-			AM62X_IOPAD(0x00b0, PIN_INPUT, 1) /* (K22) GPMC0_CSn2.I2C2_SCL */ /* SODIMM 55 */
-			AM62X_IOPAD(0x00b4, PIN_INPUT, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */ /* SODIMM 53 */
+			AM62X_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (K22) GPMC0_CSn2.I2C2_SCL */ /* SODIMM 55 */
+			AM62X_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */ /* SODIMM 53 */
 		>;
 	};
 
 	/* Verdin I2C_4_CSI */
 	pinctrl_i2c3: main-i2c3-default-pins {
 		pinctrl-single,pins = <
-			AM62X_IOPAD(0x01d0, PIN_INPUT, 2) /* (A15) UART0_CTSn.I2C3_SCL */ /* SODIMM 95 */
-			AM62X_IOPAD(0x01d4, PIN_INPUT, 2) /* (B15) UART0_RTSn.I2C3_SDA */ /* SODIMM 93 */
+			AM62X_IOPAD(0x01d0, PIN_INPUT_PULLUP, 2) /* (A15) UART0_CTSn.I2C3_SCL */ /* SODIMM 95 */
+			AM62X_IOPAD(0x01d4, PIN_INPUT_PULLUP, 2) /* (B15) UART0_RTSn.I2C3_SDA */ /* SODIMM 93 */
 		>;
 	};
 
@@ -786,8 +786,8 @@ AM62X_MCU_IOPAD(0x0010, PIN_INPUT, 7) /* (C9) MCU_SPI0_D1.MCU_GPIO0_4 */ /* SODI
 	/* Verdin I2C_3_HDMI */
 	pinctrl_mcu_i2c0: mcu-i2c0-default-pins {
 		pinctrl-single,pins = <
-			AM62X_MCU_IOPAD(0x0044, PIN_INPUT, 0) /*  (A8) MCU_I2C0_SCL */ /* SODIMM 59 */
-			AM62X_MCU_IOPAD(0x0048, PIN_INPUT, 0) /* (D10) MCU_I2C0_SDA */ /* SODIMM 57 */
+			AM62X_MCU_IOPAD(0x0044, PIN_INPUT_PULLUP, 0) /*  (A8) MCU_I2C0_SCL */ /* SODIMM 59 */
+			AM62X_MCU_IOPAD(0x0048, PIN_INPUT_PULLUP, 0) /* (D10) MCU_I2C0_SDA */ /* SODIMM 57 */
 		>;
 	};
 
-- 
2.43.0


