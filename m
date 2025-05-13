Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8075AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Uzgz/IJ5yrsCl91qH+8t4wQoX41kDj9fnW0ZCwuEXw=; b=TA2Nk9HIUFoKOp75hR/D6sE0QB
	6bhhhMDM06P0ce5nE7u12tLNM7sAUYSI3N5cf3ULke8hx0+00CkggNMjAmli3ABJd5NHvON4Gjg7I
	re4/DqsDSCpbPcYWrHKiMs0tl1O7BzP7vdIL0EIJEWI17bT9JizI2ItujwdO4OFV7E2E0vEBhi0el
	rj+Fsv/PiESM3b8TepzUp5NAsgWfg8wO7v20uCwIbct3O0j6WmONyWL+4Pvj3b9eMJyKBc7+wrCjE
	KqEDF5h1TD1lmSSosp8JDZOX16nhO+evsuFlR3HFNQMHwZ1zV7fZh7aaZ2+Skp62HNdh/9o7U7/ax
	w8dOcBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqbt-0000000CbrP-2Hl9;
	Tue, 13 May 2025 14:27:57 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqXj-0000000CbER-3aYN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:23:40 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4dad6cc2be0so2153829137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146218; x=1747751018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Uzgz/IJ5yrsCl91qH+8t4wQoX41kDj9fnW0ZCwuEXw=;
        b=e3tvKnzV0vbqrj3xIDbiRAFeNoqY6iTn73qVW0h7yk20u4pBzN02uTehUp6NtBj5kr
         XdeP55Ih0IJvOo8NciYUOXDsEwMwbLuNf8LVpw2gBb8gPA04PMyly7n22FEITfMgnnpU
         jln+5enpjpJcAVdRGivWzzTPaMc7PZd6hekWNP+gO6sB8ZQe5HBucrazRP7jJkmlRTy2
         Ys7fYJhpn1qNNmXtuPcYzr7F6TRxikrnpWaXebXAnp+QKFfes9E6A3vZ8sIBlNLW1ith
         B7AUUgnLHvANJ6M0joSlaaPVU4q2Lo0vZkiokHRZQhD4p+9QHS5OsIGXz6UXhrkFxFEK
         iZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146218; x=1747751018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Uzgz/IJ5yrsCl91qH+8t4wQoX41kDj9fnW0ZCwuEXw=;
        b=dTg3tsLsJ/rCh1uzyXIDiSpWFRCJk5g5rCIYUyUFVdZF8S5A4dPlgDV662kCbmfFWt
         Usq7jDlVTD2nHsztGjCa3s7sz9gbJ25Hy7Qg+l0ffCdX6mNk6aYs52YU5us9xtl1c5tL
         m6Ko+tI+zLi/jWbhsM0dbziX8qMxvObUJw5u2FXO6XnwDLNOemSp5TPAPQDjyEqLRsWC
         b0x+eNHcEOhkPExqLQPvl1xGmmpDoOmdJclX2WGBd3l+vO8Cm/NPU4ISD3ZdgcKDkXnD
         ymj6Dml73fTVQxNV/oU582sV+Y/zMwYas2EdjWwi2eJ8gIAJKo0R/uxrVrtwHVGNYmlW
         Uo9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3B/7b7b3xrcQtAa6bBP7wyuvZ1Xq/LuLv0MQmPxBe5i2/HfRZrEgv5tpcIcDcRnyxiBF3VoluhMBjpOT2/M2e@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7AR69RCNfpLEUF1e82btYSN6zUzuZMUc9+jJ2n33gwerGZpmg
	4vtL+ie29vLoRKZ4wmZ9N9YZH8n211ya7cJ0lolc11QQ1umpYkSQ
X-Gm-Gg: ASbGncs7UOACwSgccxOPc1U5QCNk7pREvXahND4StFtBX2o7FD1UKzriGBSrEfuwalz
	cLfJuuJbYhe1hSag9lIxU22YHnXp/HQVos/Aw/DghxX01G+MvOu8L1QQRkOVfP0jT2Nxm5Wfmld
	NmBoHmPPypyFENy1DZRM4dqFUycOXNUxo5nsMPuwGb6vDUCXfOwPt5O2x2930/tR18ajefN8z3V
	SZ4u0Os01s2S4+ilV74ymKDhLDjhC6GW4JofW0G7pXmzA7Js+lFkzchxAPWtlflALDQkliWTPyZ
	tpbj3KsU27lRiMw8Yv2oDb3NGGJur1EU9HOaFRJcXxGU9cGhSbulOk1w8VKJ/oaLKQ==
X-Google-Smtp-Source: AGHT+IEFobOfhF6Q0zjJGc5PoNdvF02XzIXIzVwsYXq3HCC3Jx979kft8C4WQQVQTvNxXMdPfdO5pg==
X-Received: by 2002:a05:6102:fa8:b0:4c3:64bd:93ba with SMTP id ada2fe7eead31-4deed376091mr15377049137.11.1747146218479;
        Tue, 13 May 2025 07:23:38 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5c18:acd6:b894:dc8f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb203c26bsm6630965137.27.2025.05.13.07.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:23:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] ARM: dts: imx7s-warp: Improve the Wifi description
Date: Tue, 13 May 2025 11:23:19 -0300
Message-Id: <20250513142320.4036324-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513142320.4036324-1-festevam@gmail.com>
References: <20250513142320.4036324-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_072339_894009_2EECCA1B 
X-CRM114-Status: GOOD (  11.65  )
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

GPIO5_10 is connected to the BCM43455 WL_REG_ON pin and it is better
descrbed via mmc-pwrseq-simple.yaml.

Also improve the Wifi devicetree description by passing a compatible
string that describes the BCM43455 presence as per brcm,bcm4329-fmac.yaml.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts | 29 +++++++++++++-----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index b66e612d3329..f2cd95e992e7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -31,18 +31,6 @@ back {
 		};
 	};
 
-	reg_brcm: regulator-brcm {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio5 10 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_brcm_reg>;
-		regulator-name = "brcm_reg";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <200000>;
-	};
-
 	reg_peri_3p15v: regulator-peri-3p15v {
 		compatible = "regulator-fixed";
 		regulator-name = "peri_3p15v_reg";
@@ -51,6 +39,14 @@ reg_peri_3p15v: regulator-peri-3p15v {
 		regulator-always-on;
 	};
 
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_brcm_reg>;
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx7-sgtl5000";
@@ -301,14 +297,21 @@ &usbotg1 {
 };
 
 &usdhc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	bus-width = <4>;
 	keep-power-in-suspend;
 	no-1-8-v;
 	non-removable;
-	vmmc-supply = <&reg_brcm>;
+	mmc-pwrseq = <&sdio_pwrseq>;
 	status = "okay";
+
+	wifi@0 {
+		compatible = "brcm,bcm43455-fmac", "brcm,bcm4329-fmac";
+		reg = <0>;
+	};
 };
 
 &usdhc3 {
-- 
2.34.1


