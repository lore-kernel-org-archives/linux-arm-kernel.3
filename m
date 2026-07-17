Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C7AC44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 01:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPT39dJ1gtwLyIatxoxDgA9qUwXYidynUbaVwKzanpk=; b=Pybbp01WRlMiKrxQ0GQ5oJcs1T
	ak0Ve3Izt6FDTbsSIhn+LBVdkCqUBClCvKIw0cbcmAzH+Mr68Tslyuzk9Mf3zofM50PudKW3nd6/R
	npP4w3JMvPOW9gTSL0wsawqxkHdcZZqMknAJec6dW04dolOI6YDgrv4NkUL5NHHLzJViI1Ea5gJ6g
	217rrxTFtF1LK74Nmpnx3iwWiGZ1vDHTr8htFDuliPgn5RN/DFe1RxAAg49iy5vo/BgianS1sa77l
	NURcU7S6N48OqneaKKYMFaUkaeMGYZ8WDiC+OxGNNAPsYZ40ZeQG/ZqS31pYVKRv/OiaT6ECzoLz5
	NpYQV+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkX3R-00000000sNL-3eBC;
	Fri, 17 Jul 2026 01:07:53 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkX3P-00000000sLu-0qbA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 01:07:52 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8143daf89c7so37470807b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 18:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784250470; x=1784855270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPT39dJ1gtwLyIatxoxDgA9qUwXYidynUbaVwKzanpk=;
        b=T5dP4/2t0KYEbp8aBu7x7QJCzmac7U387n9l05hzPEhx1KR2VzaA2U9ihJnV4beEdY
         JCXCQUws4kDzVFd/2isZFymsKQN4CmCQBVSdv577O8DJ/1M3W+6tycXxJeIpNmI7xXZ7
         azopaWuad30dOVj9FUdFYUh5ewAwEqu3StG35j8GV92xpuZtJIBtM1uIFH657dcu0e+e
         a3kPEEBipVAdhsjuq+C+80fzehm6ceFqMemZ2wxiGzbwiegziXWdFSOPBue2/2Fi8/2q
         oJBG/DuV87Jwh2Ha48YUpg3nczRo1odT85fJUAUriuJjwe9xZ+wiq58XYWjM3eekwRih
         elQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784250470; x=1784855270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WPT39dJ1gtwLyIatxoxDgA9qUwXYidynUbaVwKzanpk=;
        b=H1PeNsAylxBduwHfKfNuNOihEzULcCq+u4PBO8zNcV+XtRGotEN8VQJpE2OmOQ56I1
         2vXRLzE9TphmYkvPndWHjGrTfU9WWqkRPLlaedd2i1vtsWwHJhWOmDxYwxM6sdG5aFSb
         ZeMBVVgIuE+gq8h0bsUYZGTBo5jlwcTFtjS+vTomhj2yExhwB779+5x5ZNnus0QBEmor
         uRHXW/DaWsFYi4nUomTMLQoS4xjo3xKMx0FzFx5LvlKNO6n9u+P+YQ4smLstfA/2sunp
         4DSBC8muxmPzGmpjenL6OmEI5DpRsDgyP+hjcPbyDaExfe6XqG/BI+GWJkdFboZTXgbU
         FTAg==
X-Forwarded-Encrypted: i=1; AHgh+Ror7DpXrnjNWLLiY03iGvSf28pyTMGHIZG64O3Q+vemkNUauWhLZoXhMoKPb8mGW6eo3OdN5Hsj2KPV8LiKEU9K@lists.infradead.org
X-Gm-Message-State: AOJu0YzK14FpkxgJBebGBQtNure/+LqoL/x5425N9Q7ieKBL8hbzTv43
	C8p/YPyuPZKhtcOKZSEJM1EK2gAU7XnHJIj0F4mSxZ8WVSM0s2DRcSC2FgfGgg==
X-Gm-Gg: AfdE7cn9PQEPHY5W4/S4yfunpPnBXvzVLxoHPLPQlIF9NfZR49AoznhCEzf7wgoTIfG
	7rHC/GepcYIzqCC5VGi3RLNZItCmiyd/iP3YXMTG5IiYFQE6JeQIdowYwmDaKUoysMxkNkOSCYe
	TvyP6E7pPRZO8ebv+88mUbfg3jvv5gveY102mMem+HsvYL3JQu6/+HNyvDNyr2f+UTtYJ6Wxokr
	hEOMFbi/s4LDCY4mO5Ptl0/E1wKk/eaiOyTtrChAb2IkvS1JWFCSoV3d2LsnXMRYUzzb8ViciSJ
	juhtLX1u4kRbxUG48iQIURuzZjBqsCjUlSv/7zOvmhoslYMZKer6gdznKAfOh0FIChkpGQx+2Fk
	vtqMySuPFmC6iO1yvEP/zjBx+TDGLxRBne/a/YfU4X1JjTdH1r0EcfhSiuS57JQihwfmZJizV8Y
	aiQ3HTSf1b4/6qT7uNWn+7C5zC3n3YTyM7lKcx3pDkA6n625A=
X-Received: by 2002:a05:690c:c0b:b0:80c:85e5:8744 with SMTP id 00721157ae682-81ef2611f04mr442457b3.66.1784250470113;
        Thu, 16 Jul 2026 18:07:50 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:a24:e2d1:829c:ccde:e84f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e8f4c5d3csm159095057b3.15.2026.07.16.18.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 18:07:48 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable wireless on rk3399-roc-pc-plus
Date: Thu, 16 Jul 2026 22:07:35 -0300
Message-ID: <20260717010736.578419-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717010736.578419-1-festevam@gmail.com>
References: <20260717010736.578419-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_180751_257379_9184DCE2 
X-CRM114-Status: GOOD (  11.83  )
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

From: Fabio Estevam <festevam@nabladev.com>

The rk3399-roc-pc-plus board has an Ampak AP6256 Wi-Fi/Bluetooth
module.

Describe the Wi-Fi function on SDIO0 and the Bluetooth function on
UART0. Add the Bluetooth wake and shutdown pinctrl entries, enable
SDIO0 as a non-removable SDIO device, and add the power sequencing
delays needed by the module.

The module uses the RK808 CLKOUT2 output as its 32 kHz low-power
clock. Drop the duplicate HYM8563 clock-output-names property and
remove the same clock from the SDIO power sequencer so the Bluetooth
node can request the shared LPO clock directly.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 .../boot/dts/rockchip/rk3399-roc-pc-plus.dts  | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index f6d62ee51f1b..f87bc7b6afc1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -123,6 +123,10 @@ es8388: es8388@11 {
 	};
 };
 
+&hym8563 {
+	/delete-property/ clock-output-names;
+};
+
 /* <4 RK_PA0 1 &pcfg_pull_none> is used as i2s_8ch_mclk_pin */
 &i2s0_8ch_bus {
 	rockchip,pins =
@@ -157,6 +161,20 @@ &i2s1 {
 };
 
 &pinctrl {
+	bt {
+		bt_enable_h: bt-enable-h {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_host_wake_l: bt-host-wake-l {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_l: bt-wake-l {
+			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	es8388 {
 		ear_ctl_pin: ear-ctl-pin {
 			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_output_high>;
@@ -180,6 +198,28 @@ i2s_8ch_mclk_pin: i2s-8ch-mclk-pin {
 	};
 };
 
+&sdio_pwrseq {
+	/delete-property/ clocks;
+	/delete-property/ clock-names;
+	post-power-on-delay-ms = <100>;
+	power-off-delay-us = <500000>;
+};
+
+&sdio0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &u2phy0 {
 	status = "okay";
 
@@ -212,6 +252,17 @@ &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&rk808 1>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_host_wake_l &bt_wake_l &bt_enable_h>;
+	};
 };
 
 &usbdrd_dwc3_0 {
-- 
2.43.0


