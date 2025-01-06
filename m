Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47EEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1atVqydixNBiIRpJqE8NqhdGNOCyhlL11Qfna7RZHg=; b=AhZiphK6toNPa1NkGm+JwyI9FC
	0vKSst/MEt/zI5LVxGlg5UewcgD4Gt9RSj3ywQc8FvFfFqHUIxM/Ip8xO44XkjzTWcwRl72jF+bTk
	EYTeiwIOdEZMDYN0kaYUF/Q1FvSitQTTFNzYRASnD9gqsAQ6kMxQsT2VpUXTtkMDjt8OJkOYFFhlc
	A+SoxWNTOAgeUM6kbpnnBQWNMLjiqDvjtTR6xth7q1qP/fRmFp+Oz6sH4FmsoqPqmQvqukTeMZStx
	245k/GcTO/6OtEvIii+zHf543U8225kR1a9zusJckLZdPVVQFRG81PvdMlYlmP/NAh2tgb/x/KR+j
	eJaQ/peA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpoa-00000001vHz-2VdT;
	Mon, 06 Jan 2025 16:18:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpdZ-00000001tc4-1zRD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jan 2025 16:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P1atVqydixNBiIRpJqE8NqhdGNOCyhlL11Qfna7RZHg=; b=Kf4xIb8waie9hkIer2DdY0xQes
	R7l+s5v1pYSaVnR8I1zoQDzkk1cQWTnZuaKJb4y35ok1ulWjMbmIwjCZ5/qU0qndTrP2bkGVYamay
	wjjwRWkApK2kSMOHw6SsOnZQChFtyCaAugSDXp99nYjBkFlWVtn8T6B2dYI28Wnfn1uDHe2MMlJRP
	mzDJuq6XdjYI5d1Mb4aebj7HmsLWfTGgUoN4xp+a5csgpD1x9qk+dFXPy0t7pwSlmg/bizMoRJu5X
	P/CXFbjSKsP0nkaIgurpb8B/bT8FYazi6eezjJbOhRgp2ps0MaEE5XJk+vyl7iMiW7JGClRf/K+Rh
	Y6GsbNXQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpdW-00000008xrO-2SHN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:07:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcx-0000CA-KD; Mon, 06 Jan 2025 17:06:51 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-007C9s-17;
	Mon, 06 Jan 2025 17:06:51 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-009dVc-39;
	Mon, 06 Jan 2025 17:06:50 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 06 Jan 2025 17:06:43 +0100
Subject: [PATCH v2 08/10] arm64: dts: imx8mp-skov: describe mains fail
 detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-skov-dt-updates-v2-8-4504d3f00ecb@pengutronix.de>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
In-Reply-To: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_160726_912769_AA5D0100 
X-CRM114-Status: GOOD (  11.28  )
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

From: Oleksij Rempel <o.rempel@pengutronix.de>

The main 24V regulator will toggle GPIO4_IO23 to signal imminent voltage
loss. Reflect this in the DT, so the OS can take appropriate action when
this happens.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - no change
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index bce23d62cd277b89ec9ce5ed3651cfe787987158..80d212acc0c33af0b2a812e0b03b36dbb6b3b3fd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -116,6 +116,11 @@ reg_24v: regulator-24v {
 		regulator-name = "24V";
 		regulator-min-microvolt = <24000000>;
 		regulator-max-microvolt = <24000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg24v>;
+		interrupts-extended = <&gpio4 23 IRQ_TYPE_EDGE_FALLING>;
+		system-critical-regulator;
+		regulator-uv-less-critical-window-ms = <50>;
 	};
 
 	reg_can2rs: regulator-can2rs {
@@ -591,6 +596,12 @@ MX8MP_IOMUXC_SAI3_MCLK__PWM4_OUT			0x116
 		>;
 	};
 
+	pinctrl_reg24v: reg24vgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXD0__GPIO4_IO23			0x154
+		>;
+	};
+
 	pinctrl_reg_vsd_3v3: regvsd3v3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40

-- 
2.39.5


