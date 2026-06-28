Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C646C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 20:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYbNSlbXzmZdo+QTPpl+J2/pMoMtbvzd1t0gafKRqIs=; b=RESvb4ipU4XjIqzGRtiqlnU8o1
	s+GpO+ql9Vehab7SCehTkAImwHn9Ahqwi0KXVQnKVKdtr6hRSNlUvmUDlsHTu+CLAsqevvcKHn895
	bwD8oXvxdsXdgMXc0T3Swiiza6cqrjx8dvmwM3Iy1n5nAEICsn7n4Z2dsUyH4RdcwTBQRXee1X+bf
	upDm1pURZL+XmXhwUnxPeHXGo0Hq6Nq8XTbRHWlb/CfW9znGICCyjFXRo3ys8EskOIMNfU57CaC6P
	j1yp7P8zwucUHKkKszpFQoMNGDSKCWKchjXWVjC2u9Hb1dzfurntDsT6VWy2s+o9cfzAA8Z+38VEn
	jhkBIlFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwYF-0000000DNQ2-1AdV;
	Sun, 28 Jun 2026 20:56:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwY9-0000000DNNc-22q8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 20:56:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-472326ca506so335909f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 13:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680179; x=1783284979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYbNSlbXzmZdo+QTPpl+J2/pMoMtbvzd1t0gafKRqIs=;
        b=Vrjs3crP12e8DOUe588jrw5TKM5DZtYHBQr6LbjCMgx4fL6HJVG4XJ4O1KqM1kOM90
         yGXipFlf+K0XifjDV7AK9TyxceU1HZwi9PtHpfdABpsfwYtOzsakXTmbjChsqHh/nWYS
         WYZf+sZkCWvDCChrBVg1hV3eKxSxjzcvyDhmEFoI0EgtENTmrru9h1D1j/TOIwAEdZto
         sMVP0tmieMLVBG6Q3RBq9ukeZBTLRRjU19xdaeWbyDxk3h9Uu1u5W+Q17XZVifuSbJcv
         glPzAonTbyPlGiNUIya8peWqH6GcyavCeSTgg/L7A31GvfBhV9tXgiMOACJ7yEyy7HmS
         ok6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680179; x=1783284979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uYbNSlbXzmZdo+QTPpl+J2/pMoMtbvzd1t0gafKRqIs=;
        b=SqRdXW+CSDakOw/GY0EbnP235KRD5TxML7XdKeHb0ocuZFc269J+ZYXogzgq/P9rjl
         8uuJe1wm8l9NeAMvRdPO0AWgRfohJOcRwuELHjh+AkWd9PM6Vva99CBdDpPMwWmPfHHD
         EiF2cKPZrOkdeuWDVuIgTw6f9xsGc8z/ak4ptkvfdORdddEBziRkKKn1N5AZ9rCsl3Jk
         G9T2X2D+JcJlZG7WxnEzRZFKVWx5qF4CTqZ4m/n9r1890dyWk6wZBnI/mNIbez3iw7SD
         NXMxknEXxzgUXfxPkn6cD1wkcHC8p8cNDF9Opn85DOwFwowyhFhkyUN4hgo4To1A2aOJ
         WjXw==
X-Forwarded-Encrypted: i=1; AHgh+RqJDxhs6mqzOOvmL6hDkA2GwzjEvJ6lmElSn5QcuXo4PnNuBFkO13xdDea7mncr9IQKTIrVI1KqSkItSusbM/4L@lists.infradead.org
X-Gm-Message-State: AOJu0YyuIk4k4WZze2SzLI/9Ao0gV7pGxSDdaOOrn4Ik4mD5S3ybjTh2
	XVNHFWu4Y5t3+CdaHxZtp2bHTwlP7y6lKn4fq74D7n6dxNbrFoHnf4Bg
X-Gm-Gg: AfdE7cnC0nZm8fKnjIm4phm0MZ0EOloZTZ/3wyHKx0LX6yJXXtqsjtkD8o8aCAubwVp
	uV+CglUgImU4I8e8J+ntbMGKC/OPrhoZgYCGyG5242OPtyyHvXPfhVZPyR24PjZPtcChV5zyQB6
	hgmz8Kl7byYUR6llB/7vsxwQwj/3vGJLKmXWeBvd8pU+uZpJD3nYiWv68T+IYgetHDY7MbPYuhb
	BmAxsUR1gMgai093OG3SJNCFGvCiCVCbbeMa3wsCAs7D2a0gedMCZbQiiu2VEVY0mD6/ib7twY7
	3BBM29pqFZF9Znpd+kF7LyA2Huq68pVhm6kflRUEtpRDHir42oJYaQoLaw3XvofCskSRzD0OZkS
	ZCp9LtAeW31kztplzsGZq5e++ZCl69pZ5w+GmVXkoto93ZhCqmdnVvGdiGLoeLXxgA5a0O0GGcn
	fWV3HRuWvl000HzUYjD9PICCfOpFkr90tZUJN8y8+DEBboS9hEDGr3QGzCBo2Kepagn/bsnjwCa
	pQ3Wz0yFY1QRjl0ZkvjWpHGZQ==
X-Received: by 2002:a05:6000:2f83:b0:460:3233:beee with SMTP id ffacd0b85a97d-46fb9453004mr14202865f8f.42.1782680179266;
        Sun, 28 Jun 2026 13:56:19 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f86c34d76sm19448910f8f.3.2026.06.28.13.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:56:18 -0700 (PDT)
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
Subject: [PATCH v2 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
Date: Sun, 28 Jun 2026 22:56:05 +0200
Message-ID: <4d1ba0d1b9bd4957224213cf17dca93392788e03.1782680023.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782680023.git.stefano.r@variscite.com>
References: <cover.1782680023.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_135621_545157_CE3D4F8D 
X-CRM114-Status: GOOD (  12.85  )
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

Fix the Ethernet device tree description on the VAR-SOM-AM62P.

Enable the CPSW Ethernet controller and correct the Ethernet PHY
description by modelling the PHY power supply and adding the required
board-specific PHY properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Remove unused eth property

 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index fc5a3942cde0..ca2483a04b9d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -113,6 +113,15 @@ reg_3v3_phy: regulator-3v3-phy {
 		regulator-always-on;
 	};
 
+	reg_eth_phy_vdd: regulator-eth-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_eth_phy_vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&main_gpio0 46 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;
@@ -149,6 +158,7 @@ &audio_refclk1 {
 &cpsw3g {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii1>;
+	status = "okay";
 };
 
 &cpsw3g_mdio {
@@ -159,9 +169,9 @@ &cpsw3g_mdio {
 	cpsw3g_phy0: ethernet-phy@4 {
 		compatible = "ethernet-phy-id0283.bc30";
 		reg = <4>;
-		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <10000>;
-		reset-deassert-us = <100000>;
+		bootph-all;
+		enet-phy-lane-no-swap;
+		vdd-supply = <&reg_eth_phy_vdd>;
 	};
 };
 
-- 
2.47.3


