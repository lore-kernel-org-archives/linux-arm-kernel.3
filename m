Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD848C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 00:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbXVz7THxq41XXbX+Ta6DxAbOFx6IEkJ0j7aR8P3qfo=; b=hHhojW9ZCmoV/YW3fSL7l8HvT9
	ca7/czfF1PBt4W9s1ZBuNZP+iYJWRJRHYE0J60NjNe8MeuZUHkxhBBS8dJbaL2Rcq4YCEOKEQFyvx
	AFJp2kUmA2CnGUm5UnbWBFQH1+3tmmIjO+1Or8EWyW1xSvEf7fCvC09bpaxO42DIzXX2iTzZvIfnO
	5xspZqf8cTaPHXPpIpxnE071n7KGe+WxmlZyZeZ/KH/+2oV8sBX5H2NDWD63wPyT9PqkCewPchyTS
	+xyrWTroRHtyeqTsO5EfrI2qm7b3AUB5ATu5DF0ZIM8kTW289ljgTRdc72cKSAtbVKMS0Dh0PYFnr
	UxxrCgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHAzj-0000000B9Uz-3EyJ;
	Tue, 20 May 2025 00:38:11 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHAvU-0000000B8Yh-2qAJ;
	Tue, 20 May 2025 00:33:49 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6f5365bdbaeso48773446d6.3;
        Mon, 19 May 2025 17:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747701227; x=1748306027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbXVz7THxq41XXbX+Ta6DxAbOFx6IEkJ0j7aR8P3qfo=;
        b=F5zFqGIR6h+8alG5YuwFiMCB6+/7i2pS+8zfwQhs3gD9m9xjqXF3fmmTfvxo2Wd1gW
         TlGP9Tex4aiCZLJ8r0AnoC1dDpwlChswHBl6bme9tzf4n4rLHE8LRbIFrEqnXuFIefwE
         9MGsKhIW2/MaBc3PL4Efb8EZP2Tm3cSZ7a4I1OP3yuxB4gKQ0X+AHmfFC2awLMvg8Gyz
         JBDaT5f9nU4hV1sPCGhoGVAHpeUCoNz1ya+IwuTA9b+/YuDouZVCXnFlN8fxwJiOnw/A
         kTM8db58z43+XV7Y2QrtAuNylmzmlds6rXDPtXLxGXWQNY8qK1ZdxXBIgzm2ggt3j45P
         t7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747701227; x=1748306027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbXVz7THxq41XXbX+Ta6DxAbOFx6IEkJ0j7aR8P3qfo=;
        b=bcY5L9czutGU+unNuZML1ss3oTGgjX2K/Da4+8xT+4cEt1SthXRGSmZEBB6iIA5Glw
         zr7XYrcTatkHN7M3T+ElGhl4YWxBpNxKwFkzHwwC9c9dT1EKfriiS8sTkk+D06iR3VCv
         OK6geIKJwLWIztMJX3Yw66O7ZOezZ++4ss3oPHTXawnncp0fVkiOG6ICbE+XD5GNwG/W
         PpXBeOr6BUOuL+Tju2NNwIEDQ7ucqvSmc+RTrYHwZ4wFJHQBtH0oN4fSUgrpm/JTSqYn
         SV1FYeGJDGoQIM0EU7tfGjeiTw8R3Pzm5mIJSqLxi4Fff2cPduXyLaJ3ww27E2YV6yjj
         oI/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi1oNVP7xRaKxtCU3Z2lFfHoFlPEc/dUX5zy8iBL/ESLR2Ue2SPxxfo/qTnGNwfYF3ThV+E5oWZbXrcQ5yP2Mj@lists.infradead.org, AJvYcCXMEvRCI6XWX1KsKABQ8WfUp19s68rNLkgpLViL9BRMXKyapOv9CyvN0vV+HYzx+ymWrDoX1Atix/8/HeyWQxA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkAUn4XiWNjpu7OfsteQ3BTmn1KEHYRt/xpXKzchlbmEq7Rseh
	IU88XxMPe021dyUHE//rElbojzA/p1wxa4/rN4czRowPF6b69h1RleCf
X-Gm-Gg: ASbGncuiNyOkoYUKlPJQBo6TW+PW39n3vBzi0IWpA9df9llOE/fMz3DNxzraLApBE/V
	JNiE1BIIMa1BZTcEcfwXId+q0Ps7oIjFiJMAVNY4VuLKZmGIcmKSGAlFIK49M06sNSza0Gmbnr4
	UzuVk5gbBtuEcviXP6Qr6ueWER0mgMlxpEtamLYexqoJf1pX5MmLdMCofDDYaAAGnjHYdnm3HSe
	+WvFX8r5rhlSSokBRSIBU6vbj84qwn5BwWEefvs+PuvriBl/4VUfSHoqVAjrwlnQecGg7x7rzqK
	wcZRyDKp0e298KpSFIxLDfzOUcWyXff7MdSazrmrWOlobpeDqyWea/qKWoLW8YU=
X-Google-Smtp-Source: AGHT+IH+LrGl+9iriixlunBHdb8EDuPa+Xmcz/4PNR+ptbaVlBb8JaCluI67fVY/vS/voEGoISSI+Q==
X-Received: by 2002:a05:6214:20ab:b0:6e4:4274:aaf8 with SMTP id 6a1803df08f44-6f8b2d08d6emr225004136d6.17.1747701227458;
        Mon, 19 May 2025 17:33:47 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ac4c7sm63479556d6.45.2025.05.19.17.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 17:33:46 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH 1/1] arm64: dts: rockchip: Use standard PHY reset properties for RK3576 ArmSoM Sige5
Date: Mon, 19 May 2025 20:33:32 -0400
Message-Id: <20250520003332.163124-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520003332.163124-1-inindev@gmail.com>
References: <20250520003332.163124-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_173348_719795_A53BD1F8 
X-CRM114-Status: GOOD (  10.54  )
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

Replace deprecated snps,reset-gpio, snps,reset-active-low, and
snps,reset-delays-us in gmac0 and gmac1 nodes with standard reset-gpios,
reset-assert-us, and reset-deassert-us in rgmii_phy0 and rgmii_phy1 nodes.
Add pinctrl properties to PHY nodes and define gmac0_rst and gmac1_rst in
pinctrl node. Reorder phy-handle for consistency.

Signed-off-by: John Clark <inindev@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index b09e789c75c4..34e51cd71eac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -218,30 +218,20 @@ &cpu_l0 {
 &gmac0 {
 	phy-mode = "rgmii-id";
 	clock_in_out = "output";
-
-	snps,reset-gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 20000 100000>;
-
+	phy-handle = <&rgmii_phy0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&eth0m0_miim
 		     &eth0m0_tx_bus2
 		     &eth0m0_rx_bus2
 		     &eth0m0_rgmii_clk
 		     &eth0m0_rgmii_bus>;
-
-	phy-handle = <&rgmii_phy0>;
 	status = "okay";
 };
 
 &gmac1 {
 	phy-mode = "rgmii-id";
 	clock_in_out = "output";
-
-	snps,reset-gpio = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 20000 100000>;
-
+	phy-handle = <&rgmii_phy1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&eth1m0_miim
 		     &eth1m0_tx_bus2
@@ -249,8 +239,6 @@ &eth1m0_rx_bus2
 		     &eth1m0_rgmii_clk
 		     &eth1m0_rgmii_bus
 		     &ethm0_clk1_25m_out>;
-
-	phy-handle = <&rgmii_phy1>;
 	status = "okay";
 };
 
@@ -680,6 +668,11 @@ rgmii_phy0: phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gmac0_rst>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -688,6 +681,11 @@ rgmii_phy1: phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC1_OUT>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gmac1_rst>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -700,6 +698,15 @@ &pcie0 {
 };
 
 &pinctrl {
+	gmac {
+		gmac0_rst: gmac0-rst {
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		gmac1_rst: gmac1-rst {
+			rockchip,pins = <3 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	headphone {
 		hp_det: hp-det {
 			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
-- 
2.39.5


