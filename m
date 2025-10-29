Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF8DCCF9F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drvlRfVB/NoPKWYb6A7Zkbz4VYcKiU0cQ5EAHKwC8TU=; b=sBJkIJpuphQYVQPTPUXUYVkLeX
	KCDRAt6JwE65LjDPpakijBXdJaQNrI2IQvtH2u64Gx7+arcRbD8r27joBwH3tK85UxWzBiB3uw3u0
	AIjE+/8v6CdZ9XbwAB/j4bmFWdz9D1tX7Q525v3EE4d14iCo2knLDm6k33u6KAgdnFlEZgzVwGf0X
	x7suSJoYoxqMR+sUYUYWpCpGCxuxpuE343u8YEe7Fv7Z25HW9ur54erBPGB3yj1dPBt8JSrfDY0vl
	0hAPrurAFEb8Fm5xh/5TE7fKfbnoouIURAcjN+TJ38AK+ffS+eP3tgBidpt9QJSZMvQ4Xi9th7i/U
	IXws1t8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBrH-00000002bXe-1qQH;
	Wed, 29 Oct 2025 19:29:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBrA-00000002bSk-0V7H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:29:17 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b6d5e04e0d3so48694666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766154; x=1762370954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drvlRfVB/NoPKWYb6A7Zkbz4VYcKiU0cQ5EAHKwC8TU=;
        b=QSEUHb3g87+oUWZ/jYGSBmdSqdoLZocUHt1hmHsEFJhfnX+Qs1jFS8ymh1OxMpXRVI
         o2BoG5lvWMttohdUIXdeDbSAH9KsUR9rkwGXyMPoXYe0cctkBTUmQLzSmzZRzNpDUVRK
         qo57woml7N8EVID+JgUGp+SpRa+rash8y3HJwCHMqk2C1UYf6VjulizORhamr5y7BwnH
         19tkm/A935hEGDpc89u7KE8Cvqf8HKOBvABppzx50k27shJiKbFhh9A5+ER5qsgckCYy
         ENj69Wmf9qip3at1fkh6efFpZlevioEFcu7ikoXtAZzxhKli7gbzGQo/pKpN7Q5k65yX
         ytBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766154; x=1762370954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drvlRfVB/NoPKWYb6A7Zkbz4VYcKiU0cQ5EAHKwC8TU=;
        b=jmHyzoBzVJqaRJzKUazdRgzP1kJuUV47PD2Ajyuxe89OYOerr96u/3n+CJcAQj47rI
         2REYFpPVs0+qmRkFMsXdvrFguk7qE6SgWXjUnO3/Ft4Xda/R5bULGoCHx6MwqJH0pWGv
         13vnXkQCwIwyFdvb7BsFG39XOGdUx+LsSil5edENmsU8aLHigtIbEbxF+Uye3dLuztEL
         KbKpNNYNh74Y7imyCAvk7Z8CvKRRFsO8HIzcyBTMG9RpttBVI87nCv3QZv2BHM66rRzK
         wB68PDsxi4nQt4MhvXg9D/Md3aOhgYDTVHWQ/HLOmPon/tU+D6muOw5vxMplafG2JV/r
         +wfg==
X-Forwarded-Encrypted: i=1; AJvYcCXClQEuRzTznry3fzvNj725gakiMzs5fXnrg2S4CgUFeL0giqiHr2VQmUNrhtKHLoDPvgumsRkz1abMTVBaedo1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfx8tsbYQkdPQrSUCuvo+Fpb18M4i7YQ4lTmTDIx9W5dcAyTK0
	lBc1ydk0ikW9E91C2qcQAcwEU04M1OJvmcbDL3XSY92yQ6qDQDJzfVJo
X-Gm-Gg: ASbGnctdRKeAKNIEFOC9MKyoFtj0mSk1KE7NPaa4+zHRiaWX8Ibdro2627oek558CJM
	TqLpRehuWWemKmXjD22mCtmCHKfXyfzBkzX1OxJ37ejF5C2/EkrdlhWHvszA1XjN+r6fYgl6EIU
	xLB49Qbm5ay0omHslxiXenMf4UVOuGjnIoPp7c3gXm4DlZdK5a6Vf0BDaxwoV8W7lkRywQym28n
	11PDUp1HFEMcrInhkr7fSttPNX5OhFmxz83RkzrXvrFOPGcbAyModjbiPNgAJjprMu2UTDZDxc3
	kEGDu6hAdZkq5XA7vK18snscYfI+ou8pNf1JMau7vAboxXwKPNJvWd9acvJFzrojB/gQ0I4T9JT
	7viwmdcFPMvNjkNGCnPMIiJCASrAAM5PlkfyZoKz6NNu45H4v2KAaQID4q5YGhNQrkdKL6BwI5T
	D0/x/4w1ojNLuUeltt5F2QSmBfbL6ALGIHInme0LNefnmzGtZvevR12ePk/bnMBA==
X-Google-Smtp-Source: AGHT+IHVJORke3FbLcazCdqb6IzzPmDXwSbtp/S5D/AcSmwvYP+0vUHCAfCC9o5lV9yehDEJzSKsyQ==
X-Received: by 2002:a17:907:9342:b0:b4a:ac1e:7866 with SMTP id a640c23a62f3a-b703d52573cmr367554666b.45.1761766154134;
        Wed, 29 Oct 2025 12:29:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/4] arm64: dts: freescale: imx93-var-som: Add support for ADS7846 touchscreen
Date: Wed, 29 Oct 2025 20:28:49 +0100
Message-ID: <20251029192852.656806-5-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
References: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_122916_176929_0DB19F23 
X-CRM114-Status: GOOD (  11.91  )
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

The VAR-SOM-MX93 integrates an ADS7846 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the ADS7846 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../boot/dts/freescale/imx93-var-som.dtsi     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index d94b40d1d804..01adf7b5ac12 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -212,6 +212,38 @@ wm8904: audio-codec@1a {
 	};
 };
 
+&lpspi8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi8>;
+	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1000000>;
+		pendown-gpio = <&gpio4 29 0>;
+		vcc-supply = <&buck5>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
 /* BT module */
 &lpuart5 {
 	pinctrl-names = "default";
@@ -307,6 +339,15 @@ MX93_PAD_GPIO_IO29__GPIO2_IO29                  0x40000b9e
 		>;
 	};
 
+	pinctrl_lpspi8: lpspi8grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO12__GPIO2_IO12                  0x31e
+			MX93_PAD_GPIO_IO13__LPSPI8_SIN                  0x31e
+			MX93_PAD_GPIO_IO14__LPSPI8_SOUT                 0x31e
+			MX93_PAD_GPIO_IO15__LPSPI8_SCK                  0x31e
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
@@ -316,6 +357,12 @@ MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
 		>;
 	};
 
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29                  0x31e
+		>;
+	};
+
 	pinctrl_sai1: sai1grp {
 		fsl,pins = <
 			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK                 0x31e
-- 
2.43.0


