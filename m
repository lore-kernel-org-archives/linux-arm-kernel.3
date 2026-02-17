Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C974E9A037
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYM6F+d+/mCJYfEA1rFS4pjBPoaqEPWbC++lwSRhFEk=; b=ZlIs4S6RRUG1c3o9maYaWiHJNv
	rWEtUN3yMvVxX618NR3AA7AyY9Bb51SwePuQ/a+FgI3Jo9fOQerbaAT93ZNte3iyxVitz0f6R7Mvh
	P33iLe9n0Hpj+rQnaWJ09NNF0LuhAO3xQznSmlAwWOLh/suL9r9DcRFPSt3KetwDKj4TxD738xmEr
	b3X9haygoPqAW8uhNNOZfF7/pPQFEMHIAFjL2q5NenlslWp0WtbFiBCR6wYJEWixK7fn5fO8/e6LT
	MH4ddcZxuaGPHr5auPN42JhYs4nNmDH/NRTx7ctE/t0MfaJ9kSgrSft4gPvuVaIqRCwQYSEqVBGZy
	VwvAxzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2q-00000008kJm-149Y;
	Tue, 17 Feb 2026 18:43:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2m-00000008kFk-2w18
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so24409765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353811; x=1771958611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYM6F+d+/mCJYfEA1rFS4pjBPoaqEPWbC++lwSRhFEk=;
        b=DfXqrCzACOQOjf9AZXEsZ0QfXdS0LzhJDssT0m7hn+lyKOhtyU0DGohmqDBcplSDQN
         jhhBZY3nmQzVFXOyzCZgELjw0VRuCYZ76n1uP93PqYnYrplYET6CZYiM0oemDBlfNuZv
         nUXoOo8j3tOS6qHQ3OG+wHDNFTrx5LVrYh/ZujAK6wiTtvSCZudri0RmfDbaFrcN1Kt4
         PPSILNvysB3RR6VQ7aPkJbKyKOWE9XLdsLEYHEyFTV3tH88WAwWVNQumksMWBOOsn8k0
         HCBKSM27EtxDBr/cUbgK2aT/s/GD72e8C3w7QfQDDwx/ObDmlzzG3FJycx3ooUpAwqdy
         yC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353811; x=1771958611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYM6F+d+/mCJYfEA1rFS4pjBPoaqEPWbC++lwSRhFEk=;
        b=u/0KoqphOTeO+yuTkskvezgHQZUoy01Rb64fJqYzIB/EV2o5UDkw2VefferulFXeq1
         2kwQ+huCaqptlcwtel7hs83n6BmmPwBL0Pj6BNcZDMkKx53nJv144gP2WIexJoONeQLZ
         ghGRW7W2TWvQgIrJ24d7iE/HAvfjlfoyjO6sMPMDHjA5iiVCyx1K2JkyhwuEx9oWoAfL
         vq7waO94o3Dxh5zaxVhOIF5rm9dfkUzRIlh9sEqtfQG3lkY8c6xqctqHbUOBFj47AV1O
         HdhVFh/TKt9vBq6SBnln5CmX7btfCCCf7y3mIqGEhn5Jov3mAQkdLTrDdxmxvJWFH+QQ
         YNtw==
X-Forwarded-Encrypted: i=1; AJvYcCVZmF3QuC/y+T/L0sjnl3B6x9k8GFK9kXPuSC8dQLex56OZzA3t1J3luQPlA8Nr6e6oDvGtCjQnhNyMSsj9D4s/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2r7nrshh97T75Ajw3ckOq3OeQgtc4rR+g6GUbcj0ou2H9i8fE
	j6AEquZi/dMHZHyv7ALVhQpgeDzG8qs+Km0U7WQFbWWE1Wwr4WTAgPV4
X-Gm-Gg: AZuq6aKPJ0B6Lyw4+szTM3VfmWUF/kKvqad7omN1eEngPgB3YPrLkdbgKmBfElUBG8Y
	iniRLOE5BWW4CXO/RJNXScMTz22kIAKQfv0lGgVSKXeoaGLJSdGGVvDJ4f/KbJ3bzCR/lWuCbht
	603SabidHcKdGTu9Xwh2cCGoOAeuTOvHar0qeAi/26NqYUtNQKQuGWWWcQOmyWuYWpn/Oh7riqS
	kO0i9lsgEgN/XmyniQ/UPsguk182kl8jswtgMQcBCXgwAVCz3nxfluUnB4sbet8bYo9xw89cKeu
	scTZ3ogVfzKdrPG5TaujGl/+5Ypd6M0HrGa2TnR1fbNT2lNpicj+0e702+CNEnV1k6n8xAOaNiU
	/fgIu+DTA2+X13yL709v9DUSrt/76Sr/QHZnuk8OBhDg4BPA4Lt7VIIsw5N1XYi2gIA2+hpOv8w
	oikKsMhCYapnFbL9K5NHFy+0Q7PD67DgI/YZTjXP+Wj36XcXlhiixjucWhR7tXKsX7JsJp94XWU
	9gQreV1b2Qf/Da9ck1lAdJwBeGQNZ+TdYWlxIiw
X-Received: by 2002:a05:600c:45c8:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-48379b9913cmr205411905e9.15.1771353810630;
        Tue, 17 Feb 2026 10:43:30 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:30 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 05/11] arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
Date: Tue, 17 Feb 2026 19:42:39 +0100
Message-ID: <0c3be1139d98e7ba9dab12aaf33112545760f9bc.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104332_765562_B4062281 
X-CRM114-Status: GOOD (  12.52  )
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

Add support for the Microchip MCP251xFD CAN-FD controller connected
to the SPI bus on the i.MX8MM VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

This patch adds the fixed clock, the MCP251xFD device node with the
required properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index e52080490ddf..cdcd8faad65e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -15,6 +15,13 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x80000000>;
 	};
 
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
 	reg_audio_supply: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "wm8904-supply";
@@ -140,6 +147,19 @@ touchscreen@0 {
 		ti,keep-vref-on;
 		wakeup-source;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk40m>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		microchip,rx-int-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 &fec1 {
@@ -445,6 +465,13 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x16
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x16
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
-- 
2.47.3


