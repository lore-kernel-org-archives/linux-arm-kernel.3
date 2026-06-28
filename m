Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B1FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 22:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KArzNrp3nOw1lgRz1Z+GPBMY0eXF9VWyBsMl6ogscOc=; b=DEL1Jq2qpmyDEaMpU7/8sDW+wW
	nsrrnjINmR76plOyfK8RBzjAyqQVxVDj2gccPbSIOw9VzsToajusW3mhEzRfBfp0EN2jedrBCwJpi
	AnlnUuNwpq+TYeEx51EnZUTWJsvYQ7Tx/dRqWNwt4fvckBpIZF6d/TMFeKawqlEiuRw9vrvWbQcew
	FBaUvhpfCRfMzVsJoVK9hvwTJA1bLQxQ7fHQvK39yOXRTI5Yzq71VloQy0WrMLz02AcTz25rGOmdx
	2kW0oTbO1rOb+ogfENynFVlL/hIJ2uzcpAbVCXrW0bU/5++3y4/hZSVawW3TYkSSdDyrMPHxQWC6h
	uZAPrvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwYF-0000000DNQi-2OVI;
	Sun, 28 Jun 2026 20:56:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwYB-0000000DNOB-0sFD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 20:56:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-473dc4cf238so99809f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680181; x=1783284981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KArzNrp3nOw1lgRz1Z+GPBMY0eXF9VWyBsMl6ogscOc=;
        b=RPJenvIzTOMNmD09g8dsi4wT9UgEQCUU3siHUpaIrk32Wf1zliEmIRd+0s8r1RePuJ
         KSj0BtvcRYUFmegq6jQibdkvHjZGaGH00Adiyl6Jdg1C8vVD5vjsHelSORyBynnLdQWj
         MYG0qtiLW96vqjs3FQ4E2hKlx6Azmyds50H714+OcuTnfVk6SmpMQtGJqac4Q8Ev35uG
         mYBAmRyfEH5yT4ce8ntrw6DD2NDUbWbMfovKgf+tdw8qMplRiNKlcCyIx1q2dR+8BUku
         Ae15pUdEAFaDXykp1iDZagyFTABRRvRDthJmjkQYh75L9T9OS3nht8M5PHzFUwAKLSs4
         l6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680181; x=1783284981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KArzNrp3nOw1lgRz1Z+GPBMY0eXF9VWyBsMl6ogscOc=;
        b=Zr6GAaejvMNcBlk2R6aK+53nTBKveQ0H/+mDdlbVEisgpZStYsK34xoRSpJrw7x8FA
         KsOSmNFLAu1PFQjxgHW8ssBQ7BZj1/YUL3HFzSDioBYt3q4NyMNe9J1SYdF/6LvV8urp
         tq1Q/0aT5YFknJnYz1QMEnH9f0b1UayIUhX4mTlz2LZy50F/x4oGoKBDPWEnZNc4ADmR
         bv/adS8UDcJBYmtpWKIh33Yhu8oyBr1JU6fwcocVpl7FcNnZmpVeDBt9iBrLOsvAlr8a
         QSH4H9bQWySPyCiiOMemkoaG9lx932kY4YOD2h0PyHHpnmEDhbbHpfrviuD+ppIkZVUF
         0n0g==
X-Forwarded-Encrypted: i=1; AHgh+RrNja5aU+IlM34yvZxGh6CdtCp29ekjI/ui4GjbNaOC9uaVBQHblU8plv7o7ImzJsT3vOXU3j5TraWsZXP1oYRG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8IsNA7JK9Y3qPv1CJSQDiZTXlLKH3u4MgKtLea1TpqSCYCd2U
	H/hOm3sVe9R+pxa36SsQ6ifVdnYXJLrvuvrfXi7yCeFsCaxxKxyzBmgd
X-Gm-Gg: AfdE7cnfLAyInsdZLWminhZiTTXsABTNOokEzPepRIC4vJNNyZ5Mt0Ix0I5aEbJ9iIS
	QLm1eNbWEkr/cKcE05n7LKMY4lTswv4JaUk7XNf/BUePq0wraEZ6hCnqt68Rli/6+9JPYXE6dsr
	XDIsF32OlBvbzWh5YHj+qMvC4SsmCde4+1FTqeRB/SHvFhY8DhI6xBYKSnjt2UmjzDXj5jN1jYD
	Z+jEw8elqfV57lyAMExT+btENVdb7oU0Ft9O6SDFJTrLa4wcX+TPUSPOVJwKSAtGSFNv2dRi6X4
	WeMd4tzwsRqifCuWmODmodjxl9Xj2pkd8T9EuY6UjOR1P4+cTAbYxzxJsTkMfydQK5FPXzxtu+A
	lnKHzop91xy3LJZqKPcO8hWbSmZcyf2/vAk21mXgdfdX+WAsY0Gqaznxr497/y0s26xtfdrSSiR
	5e5hMgp34jrqkfYRdQZ2zro+rTx1QMcxFF8xtGCT9NWSmeRKssXyedibl6LHyocQlYGzjdzA37o
	HXqJhvLs7ZIrHPELUa5MuehNHGbCTQrMzEd
X-Received: by 2002:a05:6000:4007:b0:46e:ed68:d249 with SMTP id ffacd0b85a97d-46eed68d2cfmr16832946f8f.3.1782680181530;
        Sun, 28 Jun 2026 13:56:21 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f86c34d76sm19448910f8f.3.2026.06.28.13.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:56:21 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 3/4] arm64: dts: am62p5-var-som-symphony: add touchscreen support
Date: Sun, 28 Jun 2026 22:56:07 +0200
Message-ID: <eaf0479114137e4472b4adb3df82a5bcf78405a2.1782680023.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782680023.git.stefano.r@variscite.com>
References: <cover.1782680023.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_135623_271888_3C4E5159 
X-CRM114-Status: GOOD (  11.37  )
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

Add support for the capacitive touchscreen on the Symphony carrier
board.

Describe the FT5x06 touchscreen controller, configure its interrupt,
and mark it as a wakeup source.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fix commit message

 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
index 5ba4ed56755b..5c41647ff43f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
@@ -293,6 +293,21 @@ &main_i2c1 {
 	clock-frequency = <400000>;
 	status = "okay";
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch_pins>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -307,6 +322,12 @@ &main_mcan0 {
 };
 
 &main_pmx0 {
+	pinctrl_captouch_pins: main-captouch-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01b8, PIN_INPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */
+		>;
+	};
+
 	pinctrl_extcon: main-extcon-pins {
 		pinctrl-single,pins = <
 			AM62PX_IOPAD(0x01a8, PIN_INPUT, 7) /* (F25) MCASP0_AFSX.GPIO1_12 */
-- 
2.47.3


