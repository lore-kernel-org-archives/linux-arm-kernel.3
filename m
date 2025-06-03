Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F490C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0p9YpOZL8B3n4fRaefj3Tpdxqsf7wGzn2I1TfFc3lfU=; b=fjhaz68P+Yc3P4f4KN8NZXxnUk
	G/4bhafP6Cn6hIGroWGxS0Z5A3ESQscKAm97IMNURqwQ2OGtEkdy0ip59Z6kggE9jZej8HlKBx++n
	PwcGmDlSEW5X6eQPzZUMdbNPLS9mbPYUwH4G+aKJceRvjgrjYSw9cpvBMLZI1O2KCrb+NOCZ/nLZY
	CFAvOXtCZYUMyn5Ytmmhysv9GoSSL/htGU46DQj9VN9AZzGPn56lIfPtIWoc5R+AIjVce/YbxqNJx
	3Bb4edsMflS3drvOefJbpKSdHeZtQ6QJJ3Q1mZCl8xdS/hSLeZ8mlDfz2WBJJCIYLsAnSgJ/bI9Tu
	MS0RPgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV9a-0000000BS5v-1VqL;
	Tue, 03 Jun 2025 17:10:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV0z-0000000BR1t-37AZ;
	Tue, 03 Jun 2025 17:01:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-451d7b50815so21782195e9.2;
        Tue, 03 Jun 2025 10:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970088; x=1749574888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0p9YpOZL8B3n4fRaefj3Tpdxqsf7wGzn2I1TfFc3lfU=;
        b=evoPwqa+I94QldnJh4m8tTZLumLmVt58+42oHccTnlXoHNSuxEi0K0Mf5g8ryNgR+j
         sBswLi1PMYCiwNKRn1YDq/VarpiEKoJvClLwG0C13YUgnT1Qrq+Za7BRlQ+FhU+om54y
         FTE1Unqoiji31WztYc5bU1Z5ZVdIY6gcOqTID1hheyEYbRMUMaWnL5pnzdcOZTFjLCPd
         nQlpJXZMb2oREQ+VVw1Yvcmy2OK67aNybLpus8KeRk1Vvx3fFlV9er2eY4CNw7bWyMtH
         msoFwrHg0trTzo35l5NblZMrgQM8j69knx7khKsHnJ2/vcdNQXrxeP6uj9JUAIw8uOBP
         yv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970088; x=1749574888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0p9YpOZL8B3n4fRaefj3Tpdxqsf7wGzn2I1TfFc3lfU=;
        b=r98XmeJXcYM9GUiByKGck2p6ydVHGFLvZ3EowxXfc0KR/JDqOnrduUDoPDyZ7X0DTO
         m+cn55W4ixP50ANrRysKjiIW3B3CqhZ52VvqEstWIgVAmvhvcmOekWhtYi7gew1y2T+V
         mnYe9CJV7IB/wUmaeiLXXqsWXWBvrkkD70XBsCsls77ki8KY37grUR/mTKhHAMjXIZIE
         uffdMyn3M+IU3+nrPBVr2tUBiSf2BfzL3hLV1P7aHyrSU5/i6WVmqJaHSXMY2RshSOTj
         7gyKyUAl2npr263l/ohU4cddX4/YDErtezre9kyI+k5WOL+3NSa3c8QzyQsBThgeeGxf
         8kOw==
X-Forwarded-Encrypted: i=1; AJvYcCVPJzZ084+zF4OESZkV7aTxkYPMaQeKhxASRMhBeucEn2WEE4HvJoYEGi53el5n/UYe+l1OVYxCZhSc5GwwMfuf@lists.infradead.org, AJvYcCXvlxw9jExBuB/OjJXes+oYPWyoPO37B5VRn0uc6pT78hP6paunBsGWQRG63c2yFDyJnPDGUzW627aCIwO+VU4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyMpjbJlAp2SI8opVNMA2DrICJ4oMAaLjGjy3KGugiGwEfIxiG
	7Oh/uKpQ/t3+mA1PxXBkpEmyi5cXSilOjX6HYIXobxLqzzY/pOwcjIqz
X-Gm-Gg: ASbGncsKWsgHBLZuIEbTwdQH/Ur9xhMgI06EeRPVqUSxfbK08MsmtHX6w0w206RqED9
	GYzLx82gWkX0G92ahIYUOjFGTPsYSlOXdwCtF6Q6BeHwM8RZrfcl4qwrIYUzaCqghqvhDygDuAc
	3TKNwuXOxU9MpOC59yEfHi8OeGFZqiNLP6Gtq/CJ+yieHLFA4xySWpOfHywsJCuywcakXPI9N5n
	aU1KPoI/X1W5QkhmHGfCnqSuaJ6U0g8Ou5B73NgAo0/SRkZYzV1AeB1cpklOQpt3aTfoB8ZKY52
	3y9JrNp5L7ULx+S9rBWSnhec1DdWmaFidmjasyiasO9C4SiA0gR7vgQmMgLemFQmfz5mvodb5IF
	h/+JTlZMDAKC0+xxBzfQHhCaLRw==
X-Google-Smtp-Source: AGHT+IGKbbxaD/kDR25Rzuty7F9u0AzUaO85ccvL/fcRDLMAZpN9DkbpbEz7a6jeAZtl5y9tr7w8Ow==
X-Received: by 2002:a05:6000:4313:b0:3a3:6b07:20a1 with SMTP id ffacd0b85a97d-3a4f89dcaa6mr12878180f8f.40.1748970087673;
        Tue, 03 Jun 2025 10:01:27 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:27 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 03 Jun 2025 21:01:15 +0400
Subject: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=3205;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=c8oPro+LjYG34KNqLDV5AQvA8UmqCuFwCYmZWvt03co=;
 b=eLODa75WBe+LmN+NItUXL47WxdQX+Yvyylq1SEXx0DI4a0xKhhPyz+6YV8/1KeWZqxgqANvVE
 DWTk2XdUEkEC3pxm4GXu2D8tvEDqIdwm8behElnGAhMO/x1U173bCk4
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_100129_787111_95EAA542 
X-CRM114-Status: GOOD (  10.33  )
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

ArmSoM Sige5 uses a soldered-on SDIO connected WiFi module. Namely,
board v1.1 uses a Realtek based BL-M8852BS2, while v1.2 uses a Broadcom
based BW3752-50B1.

Add required device tree nodes in the SoC .dtsi for the SDIO controller
and pinctrl / clock wiring in the board .dts for the module itself.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 36 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 16 ++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 7ce1fb1380b0863c902fdd9cbc7454ee6011cf92..dcd033859398312f7693bebb7f080ee4f2ecaa32 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -219,6 +219,15 @@ vcc_5v0_host: regulator-vcc-5v0-host {
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_host_pwren>;
 	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on>;
+		reset-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &combphy1_psu {
@@ -781,6 +790,16 @@ usb_host_pwren: usb-host-pwren {
 			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	wireless-wlan {
+		wifi_wake_host: wifi-wake-host {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &sai1 {
@@ -808,6 +827,23 @@ &sdhci {
 	status = "okay";
 };
 
+&sdio {
+	bus-width = <4>;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-sd;
+	no-mmc;
+	non-removable;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	wakeup-source;
+	status = "okay";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 1086482f04792325dc4c22fb8ceeb27eef59afe4..a09582470bb7f654b711308da1e51fa8571ca1e8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1695,6 +1695,22 @@ sdmmc: mmc@2a310000 {
 			status = "disabled";
 		};
 
+		sdio: mmc@2a320000 {
+			compatible = "rockchip,rk3576-dw-mshc", "rockchip,rk3288-dw-mshc";
+			reg = <0x0 0x2a320000 0x0 0x4000>;
+			clocks = <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x100>;
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			pinctrl-0 = <&sdmmc1m0_clk &sdmmc1m0_cmd &sdmmc1m0_bus4>;
+			pinctrl-names = "default";
+			power-domains = <&power RK3576_PD_SDGMAC>;
+			resets = <&cru SRST_H_SDIO>;
+			reset-names = "reset";
+			status = "disabled";
+		};
+
 		sdhci: mmc@2a330000 {
 			compatible = "rockchip,rk3576-dwcmshc", "rockchip,rk3588-dwcmshc";
 			reg = <0x0 0x2a330000 0x0 0x10000>;

-- 
2.49.0


