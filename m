Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA4EC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OwjnT3EpR0zZcIL3ISuwV1cjbLAr+BETB7kkTqGtQmA=; b=xubPdyDEQBtoDSiRKVH+nmv004
	C1C9VqiWDTdkdeAdavCEsC7FFsIdo/37wWykrTFegI0rDt22UfKLIZQmvwYXF9oSJyglOrU83dXqA
	vxQg2Z9ngCmWo780c1wOp6n93dC93FMUXfVRmKan5h3vPYuRYgMpBWFoe4Ijh/uZraZw1vDpcGnNs
	++LQ/F9KHZEp7g9qfQLledBUnCqjWwn54HxRFWNiOvQh4YZ4VIGVJ3VpH3hNXThMPbprG9mj/9NUs
	H+smvKrObN7+zUwlxdifNDoc6p4rhUXXn4n45+f3e1fGv2FAMX56Nh8cipliRQH6HOatXIiDKP4NG
	1bJ0piEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCys-0000000EtOb-47gk;
	Sat, 01 Aug 2026 16:54:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCyp-0000000EtNb-3b7Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 16:54:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-495590dde14so7689905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 09:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785603274; x=1786208074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwjnT3EpR0zZcIL3ISuwV1cjbLAr+BETB7kkTqGtQmA=;
        b=nBQ17326gHZZflkrrx3weBPurrc6tz0Z6U/msaO6hBC6HX4w+huv0Cp4wIlQq0fgq6
         YHKbvwEK5Wk7VLZgrDrsFQMk2w610TDTYULpTov2ejc2DGH0hvabgaMskcurMgUUyBJH
         x+C9UBV0QgdbnpGRZ+LQiBTDBWqRdHCGSH2hS4b7O2TJyhTRnGDHWLl/cBJnk4vFW+f2
         Ehdozex3nWN+8LsiaPynGyy5JUzt9YxbxB9MTitrkoOr3S+tex/To0D8LeBxDtg0RYWR
         ra1bpy5GQgqR/6Si/Y7Z15OfzUb4QJ+A2q8j1exMpS3cIJSh+SLLmBCXowQpfEA8vtaK
         A4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785603274; x=1786208074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwjnT3EpR0zZcIL3ISuwV1cjbLAr+BETB7kkTqGtQmA=;
        b=AjI09ERcLanfE620q4q1K1AiscXHBVz/551kxIZk2OSO/Udw4Kj15FLgFjXK/6Kdlf
         5tBujCb0F3uzMF/lzOH+Q2iidJc+wu19mej9bua9V78SJWBRCWLYRxqwDRk3jkJuJGfj
         /E44diQs8T5f0VlhNs3mPU1Rqrp+JJSrUHuq2AAQuGAsThid8Sj+hCBkR54KYWoZXfIK
         2ObghYXX2DlRTxUfIdAF51Tvrfh+77PjgAQ9I1NWzaT6nLxoGnjKxFdiYyfSVRMwMDR+
         to/WZtw24uDQHLohDfdta280TsYxo/m1DSDqBE+fbB2z4iBbHMn269EMsBtwxGF0Hwau
         4j8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr6wRqctIWpT1LXiHnMXX5n6tD5kzJsyp2qB3FyCK4zsqSLkIHO7HAhLj7z5l1IrX7K4h9mnRUB47h+zYu+2zsR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd0u7lS9QvXrwXZgdLmoLfNNJX5/fe5nbWOYYmXcX/g9Foq4dK
	0hOZzSYIuW4LxVwdWTjuMIJzpf0NKu0WFFrr1J1fvFyFCO11u9JJPVfj
X-Gm-Gg: AR+sD11bzXrWlDhuhiaZ37qNd75jtKGwn02tYMH5SvXvYHRHA/GAL8Fu0eKmnJGMU+G
	aSB0Uq+tJV5ZAHsfHg03yezH0VKOKZceRjTyYSNjz2gBmDRhdk8uE5WJ5Sr2n7H3zG0z+hschO3
	x2u/xxkSY9BGOmC1AUxAeoR0P7Kv2QkTMxfzynDbSTb7FMX+EzLQNGRjZRafYHRNR0T9iduGB35
	IWQrcSGdX8iu7g6Qjb6v00btMNqJmXVtbjdLJiOLGM3sE8Qp2nC4jX879i9LW1x4TFTu7M5+bNI
	3N7VRhp2Hb2f4VqRLSUXfpXe4/jxBJdCFGGLlkVmkSHP5qIYPri9Kkc+VgBSj+3MVZ4vJk/l0y0
	1xZfFoAaKQfG2/cww5dv1MpMcTq7LPDWIyWsyXQralhQKyKjTzaBJ1ffLsda2e031VyP/dfHjKE
	9FpxljSCo0QBnTC1DKckzSTZV5q/ACqN+xtyQZK96do+wXBe2jYBBrpMcA9z2EqoymS4YIyU2GW
	LtZwGJqRVWAr4EoyhAa7f2rW6rSqjBJ44sr3vjIKdYmTEnrtAnO2/C1y/Oly6lPvIy3VZUhOYgm
	ZZxoZNKw0qa2071vxzzJg3Q0+pxCRSPOXoOu4v264yKhhPXVHd9afsbAu/SCclLC9LpDhGvz8K2
	rDa59LHQGkdWvq7BoOz80qp6SgHHUXtFFC023d+nsSGrGpjzL/oQBNCzyh0uI
X-Received: by 2002:a05:600c:4685:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4980eb66053mr51984885e9.14.1785603273675;
        Sat, 01 Aug 2026 09:54:33 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm63964405e9.4.2026.08.01.09.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 09:54:32 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v3] arm64: dts: broadcom: bcm2712: adjust display status
Date: Sat,  1 Aug 2026 17:54:26 +0100
Message-ID: <20260801165430.598302-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_095435_944045_7AA08554 
X-CRM114-Status: GOOD (  12.27  )
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

Typically non critical IP in a SoC are disabled by
default in the SoC .dtsi and enabled on board specific
configs. There are usecases, such as some CM5 carrier
boards, where display output may not be desired or
connected. So disable them on the SoC .dtsi and enable
them on the RPi5 board.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
---

v2: rebase to align with upstream changes
v3: re-add missed vc4 okay status

 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    | 35 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 ++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1ab..d998bfae91acb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -104,6 +104,18 @@ wl_on_reg: wl-on-reg {
 	};
 };
 
+&ddc0 {
+	status = "okay";
+};
+
+&ddc1 {
+	status = "okay";
+};
+
+&disp_intr {
+	status = "okay";
+};
+
 &pinctrl {
 	bt_shutdown_default: bt-shutdown-default-state {
 		function = "gpio";
@@ -230,16 +242,27 @@ bluetooth: bluetooth {
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
+	status = "okay";
 };
 
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
+};
+
+&mop {
+	status = "okay";
+};
+
+&moplet {
+	status = "okay";
 };
 
 &pcie1 {
@@ -250,6 +273,18 @@ &pcie2 {
 	status = "okay";
 };
 
+&pixelvalve0 {
+	status = "okay";
+};
+
+&pixelvalve1 {
+	status = "okay";
+};
+
 &v3d {
 	clocks = <&firmware_clocks 5>;
 };
+
+&vc4 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc9..9b36ecd7bba54 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -359,12 +359,14 @@ pixelvalve0: pixelvalve@7c410000 {
 			compatible = "brcm,bcm2712-pixelvalve0";
 			reg = <0x7c410000 0x100>;
 			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		pixelvalve1: pixelvalve@7c411000 {
 			compatible = "brcm,bcm2712-pixelvalve1";
 			reg = <0x7c411000 0x100>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		mop: mop@7c500000 {
@@ -372,6 +374,7 @@ mop: mop@7c500000 {
 			reg = <0x7c500000 0x28>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <1>;
+			status = "disabled";
 		};
 
 		moplet: moplet@7c501000 {
@@ -379,6 +382,7 @@ moplet: moplet@7c501000 {
 			reg = <0x7c501000 0x20>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <0>;
+			status = "disabled";
 		};
 
 		disp_intr: interrupt-controller@7c502000 {
@@ -387,6 +391,7 @@ disp_intr: interrupt-controller@7c502000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			status = "disabled";
 		};
 
 		dvp: clock@7c700000 {
@@ -405,6 +410,7 @@ ddc0: i2c@7d508200 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		ddc1: i2c@7d508280 {
@@ -415,6 +421,7 @@ ddc1: i2c@7d508280 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		bsc_irq: interrupt-controller@7d508380 {
@@ -460,6 +467,7 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			status = "disabled";
 		};
 
 		hdmi1: hdmi@7c706400 {
@@ -489,6 +497,7 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			status = "disabled";
 		};
 	};
 
@@ -667,6 +676,7 @@ v3d: gpu@1002000000 {
 
 	vc4: gpu {
 		compatible = "brcm,bcm2712-vc6";
+		status = "disabled";
 	};
 
 	timer {
@@ -703,5 +713,6 @@ hvs: hvs@107c580000 {
 		interrupt-parent = <&disp_intr>;
 		interrupts = <2>, <9>, <16>;
 		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
+		status = "disabled";
 	};
 };
-- 
2.55.0


