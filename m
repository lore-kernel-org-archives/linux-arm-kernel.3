Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEEBC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adE2QtyHr5FA3h8p/vzzNysjwN90NOIzwiMJGeI1PXY=; b=kE9Pf9Phgi+MahWZnKOo/lqL2Y
	t2j6HlL1UuukH/cAWY0uJ4uwJnw5J6WXuubNkKY+rSmU4QzCjIAoXYa4kDdzMp8+2i+QGxHwUn77j
	Kfh4Qc7beWgBeycT8Jj41P3qG6/9ifTDcHDhe6PvRrKI+W3lBzEqDJuDa0SRXdCgrJk42vxg3YMYA
	5DN4ErdGo9b9is/nir3a06oqZ4L5WCi2jggiurZVIm7P1GI+pL/JV2zq/wvYs9UzDmKYOXufWyjFO
	azpiAx8oP7yiCLAy8XdggrVUAGPFRQmKBSAHG3csBuoqcNyqFLGtKlUHu10TMMHGiYaxoDdVdjoCC
	A9pKbT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWe-0000000BPp3-2QGI;
	Wed, 09 Sep 2026 10:27:32 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWV-0000000BPiL-20e5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:27:24 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 951967A00B7;
	Wed,  9 Sep 2026 06:27:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 09 Sep 2026 06:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949642;
	 x=1789036042; bh=adE2QtyHr5FA3h8p/vzzNysjwN90NOIzwiMJGeI1PXY=; b=
	aQsAf3yU3C8qLspcT5c8FQLB7rmSZgtzTzx5hYU19O/2Wy/AO49tHZd5QQUMregI
	US4xc739vlWUB4GBKr6rYFYX9wUkwLtzET8ohWpzfYs44Zp2GA4/RBKFZTGXjIjg
	f6nZ6HOTsgGEBeEiVV2zVQElrXqad+S6AjvT8U/+C4/rS+M6a40Qp2UeIUz9sMDK
	eSM5J5RFDEdpwFKFRTvHlo9zXnoMN//3FO/sn1aspLSyCOdWH0KFKReOr1LPfTss
	WhRGJlBU1vGaCQJ0+iajv3vBZNWhz2uMu7OxAiIjjcDIHNGtO9ml+0miBXDkaFFv
	DHfDxrr6Z3Jdm7kt1/Ewlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949642; x=
	1789036042; bh=adE2QtyHr5FA3h8p/vzzNysjwN90NOIzwiMJGeI1PXY=; b=c
	iOAI0CbC7GGXq1SPXIeYRUHS8JE9BhLNIKSO9WaJLkERZX1kAQgBICVu6Bzx4E62
	apAszPx9c/CqdlwFDlKl51+PJOuWKuV0j5oTCiMqLqWeG7TVeoQkQXLkz6T1uSA2
	Gy3SkaxsWvR3VijC9EYkI+xYsH1pNGONRVcQHFw10Wp4H0WIyV7MSKwiH7REb1Ax
	0B1v81Fa1jFG38DmcaE2fsxgNYzRvlD0LTJBGcWf6odJ86kKmCC5lRmsiirrtlFE
	Qrb3O4m687/kqN8SQM3ckn6DWIne8Wh9kZ6cItTSD6zYC7d2fDaAMXlcJeda5fgB
	MsQbKDt3o0bFfAUru+KWg==
X-ME-Sender: <xms:ijShajR8ojevaPd33bt5tZliZZyF8NVGz1nWQEkGPH4yMwkddx8U5Q>
    <xme:ijShas-qJwaD2p-jZwRmElilgwz2r03sOFPC5mnIFWPpfHEVYouwP-9l1oIi_h0nZ
    qat1xPmpnDA28Kp3eTCRs_08_y12bpndXelMi8zkI-_rAFfKmAys_XL>
X-ME-Received: <xmr:ijShakZ2qMR1toe1GaYaDI71ixSdSyVT-CUevxx0OCRi349hxEKaDT6YN3k9kT39V-Q__ME7tZpoaHxfgWbZVwcLWvfSO4-eZce5PA>
X-ME-Proxy-Cause: dmFkZTGrfMJS/BPnzvFtxFWH7T2NvqB5iRSUYFltsQYoqh91AcAlEZdgxuHZyrYLq3kEOk
    j5wvhkqN1OKl91HrWXzjjavcMXmgvEWC1tfNMr6YyuWRD6//RUDkmVO3/ATEajCWyfZedL
    8sHEPefu4TqdYPDdk53dU84dTpDQmvitB4Jd8BhRBQx2FhHfLph5+6E9Uyo985vYlfK3rV
    DNGLSCjFuasa5/IY8K3MZyQs8cwzlsSAXH1aJt2liMZr6UglJb7lvyAF9z6AbPEzIyhVzl
    HRoRmsqTYvRh/nPj5OrrpEMagZdYAssoR8SKXOADJ0/HyjV/ybNJdeD0QwSSZATBimrjYN
    lk1KDWZW4wWCzP1sTXUWHDsGLp0Pho9JyE+K3WfC6kTWgZJ8N2UqHBk/OpfOGowmE+NIY8
    IO8C60kgVqZB53l8BzPPi7wAYI5Sk2VqPuyvmyeCACzcvI9LVX1gMC2T817QeoVzJxsC00
    CcVeOuAHDCG+s7uDOLDAxEFdmsKfzObYIHrMOySADp/2DIaCGLwxwfXSCO6Fk1iQKCTOsh
    eKiS87GCUExKTrZqsSowY7TOTdZ1f+TH/2c6613OVyMWYDSPulF/mxs0imPrdX+kYUBAFr
    RWjL6h5THSgbQt4uqoVBqK/fFM2u2Klm8Y4bO9ONrkqnp9AzdcNKlFijSO7w
X-ME-Proxy: <xmx:ijShatrF_TSn1aA7h8mpTrRa4Y_R3MlzV_Vm-ngpDtM_YXb4O5e9AQ>
    <xmx:ijShaoRdFfi5oCs2XejhS4karkcokt6Q6r6ila1torKudd4GX32lBg>
    <xmx:ijShaho8sneoipfZ8nKmxHO58rl-HIqVVzgEgKF1Ef9YT7kzdT286g>
    <xmx:ijShai0OptwnQeXHUkgw4uQYhMK0df22POsaPFjrfmwBuXbymy72bg>
    <xmx:ijShasxtQcSIsd0uA7F6d0HcYagm_n0cVcN6AnAmqNZxf3nG2I2cydUm>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:21 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:02 +0200
Subject: [PATCH 06/13] arm64: dts: apple: t6031: Fix continuation alignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-6-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5573; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Oah0LgFEyGqOdR0+X4mlfeZgQU6B7d/SaS0qZscGDPk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpW3GI+Y1VZ2u36caJSeoxJxgtlEVt/kl9dNnjqFp
 Ld8HjM7SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATOT1Kob/BbvfW7l4VTu+nNlt
 8tfwOEecnuN6QQG7N99fH/zI7qt8neGfkfdn6XW1h05VPVj9NPCoQNLuGXujVMUyea55Hfe0ann
 JBAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_032723_610182_99CD33D1 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Align multi-line properties exactly to "<" of the previous value.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6031-die0.dtsi      | 12 ++++-----
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi      | 36 +++++++++++++-------------
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi | 18 ++++++-------
 3 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6031-die0.dtsi b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
index 932c97579f99..57f44f1fbe6e 100644
--- a/arch/arm64/boot/dts/apple/t6031-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
@@ -39,12 +39,12 @@ pinctrl_smc: pinctrl@2a4820000 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 904 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 905 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 906 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 907 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 908 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 909 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 910 IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_IRQ 0 905 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 906 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 907 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 908 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 909 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 910 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	i2c0: i2c@391010000 {
diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index 524a72f5483e..01fe459259a4 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -37,12 +37,12 @@ DIE_NODE(pinctrl_nub): pinctrl@2a01f0000 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ DIE_NO 710 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 711 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 712 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 713 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 714 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 715 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 716 IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_IRQ DIE_NO 711 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 712 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 713 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 714 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 715 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 716 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	DIE_NODE(pmgr_mini): power-management@2a0280000 {
@@ -66,12 +66,12 @@ DIE_NODE(pinctrl_aop): pinctrl@2a8824000 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ DIE_NO 595 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 596 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 597 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 598 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 599 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 600 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 601 IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_IRQ DIE_NO 596 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 597 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 598 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 599 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 600 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 601 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
@@ -80,12 +80,12 @@ DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
 
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ DIE_NO 458 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 459 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 460 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 461 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 462 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 463 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 464 IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_IRQ DIE_NO 459 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 460 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 461 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 462 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 463 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 464 IRQ_TYPE_LEVEL_HIGH>;
 
 		clocks = <&clkref>;
 		power-domains = <&DIE_NODE(ps_gpio)>;
diff --git a/arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi b/arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi
index 5e4727e357d2..0c0d09964e69 100644
--- a/arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi
@@ -8,46 +8,46 @@
 &pinctrl_ap {
 	i2c0_pins: i2c0-pins {
 		pinmux = <APPLE_PINMUX(56, 1)>,
-			<APPLE_PINMUX(57, 1)>;
+			 <APPLE_PINMUX(57, 1)>;
 	};
 
 	i2c1_pins: i2c1-pins {
 		pinmux = <APPLE_PINMUX(58, 1)>,
-			<APPLE_PINMUX(59, 1)>;
+			 <APPLE_PINMUX(59, 1)>;
 	};
 
 	i2c2_pins: i2c2-pins {
 		pinmux = <APPLE_PINMUX(60, 1)>,
-			<APPLE_PINMUX(61, 1)>;
+			 <APPLE_PINMUX(61, 1)>;
 	};
 
 	i2c3_pins: i2c3-pins {
 		pinmux = <APPLE_PINMUX(62, 1)>,
-			<APPLE_PINMUX(63, 1)>;
+			 <APPLE_PINMUX(63, 1)>;
 	};
 
 	i2c4_pins: i2c4-pins {
 		pinmux = <APPLE_PINMUX(64, 1)>,
-			<APPLE_PINMUX(65, 1)>;
+			 <APPLE_PINMUX(65, 1)>;
 	};
 
 	i2c5_pins: i2c5-pins {
 		pinmux = <APPLE_PINMUX(66, 1)>,
-			<APPLE_PINMUX(67, 1)>;
+			 <APPLE_PINMUX(67, 1)>;
 	};
 
 	i2c6_pins: i2c6-pins {
 		pinmux = <APPLE_PINMUX(68, 1)>,
-			<APPLE_PINMUX(69, 1)>;
+			 <APPLE_PINMUX(69, 1)>;
 	};
 
 	i2c7_pins: i2c7-pins {
 		pinmux = <APPLE_PINMUX(70, 1)>,
-			<APPLE_PINMUX(71, 1)>;
+			 <APPLE_PINMUX(71, 1)>;
 	};
 
 	i2c8_pins: i2c8-pins {
 		pinmux = <APPLE_PINMUX(72, 1)>,
-			<APPLE_PINMUX(73, 1)>;
+			 <APPLE_PINMUX(73, 1)>;
 	};
 };

-- 
2.55.0


