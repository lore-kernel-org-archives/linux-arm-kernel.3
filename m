Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A60C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWjhUwz//7evtz5HtoiKNduoxXjnJthBXIa+so1f8/0=; b=ouvoNy81r7Z8NlHKAioHRdNZVj
	2IRpipD9jPmbORvAzTTrwRv0/QxJMI/ZEeouLfHLZzBoBpFjh/8jRox76XDsvbkOSKM42DLdnUZak
	poHm/H1h2DELchPBOuc1OgXDETQe8p86ylLZQr4+OHyrwvaOrXCru4n0/4UJDgAsn/8uHWx/ZnaVY
	hsiM0eYuGwQeMXZPyTB/TwKUpJp45mbFRZeWhHpxFOyT3MDec8fcvS4pAnH9AAq9YuwTDuUU0xp8c
	jG/+BTc7uZPkFLUqamE8Qqm0JVfmcDwg+La/5dkmmkJge5f6HWqw9qGVcDrhAo1FkhL9A3WnJXOBH
	W8cEp7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6AiT-00000001Vdn-3NRx;
	Sat, 19 Apr 2025 16:06:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Acl-00000001V90-1orS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 16:01:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394a823036so18139355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 09:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745078458; x=1745683258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWjhUwz//7evtz5HtoiKNduoxXjnJthBXIa+so1f8/0=;
        b=lPJiRgyqOoGSth0ECFNzrNRV7MJ/H7z5khYj5xDe7ESQ1EubhJfwtFEuvJ7eETUkAb
         CK0dwvCakClkzQPzVjg14N/9oLjJyrNaSmz1KR38QNxm+VoQNQtNgX2zej4XbVKWWH+d
         aJCJidlwRi3soNioiJE0cJSlHDdCcdIDArbUGwOAUDG1joqQuoehjB/U1H6Oa/HHDOAp
         YaWsNUPyC1NXCrDNbXdKYSpOz33pZeKU0pssVt/XvFP6lk70yRjz317bxxxtynk/m37q
         4jfjMFSC4qdlAa5YJE5H+UHr3G6gRZEVdhrWSbvfhcvGsO3MZXHMiPRT8XUBDMK+8y0/
         n+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745078458; x=1745683258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWjhUwz//7evtz5HtoiKNduoxXjnJthBXIa+so1f8/0=;
        b=sIUE2OvQzCW3x2aU+MuoabRjek+NzCFpmwn5swjrS5WB3I3B0xifrTxfbG3RL1CtNe
         f7DbZ7RyO8qbakg1VfmUy6hgc0gcF3gRLQvzzEzke+Yy6q6yQxL8+NAWK0fyhPCIprMp
         y5pirLmP9YtK8DHYwaecDdLDfFyE/bt4tP6qw0ou5sWDeCMTiMeSxNGYbwr9khrkTrF0
         D1srPM6lADzl7w5e10k4LB5fR0ydLmnCaBcqcgKGlLSyLmBfXFw6Mlb7h6IWr30TSU9L
         YiWEahMzgcbIC8XGtUOQ6UJbAHcPrWgyRWa5OdzvhcDMuZ0nWADjZ+yLDZD06vkJXOyB
         J/EA==
X-Forwarded-Encrypted: i=1; AJvYcCV+E4wdVfwIume7NqX+NepC51rfkB7xaFlm/V8wn4CDA3XtRKP0xw08Qw2EUSfn1BMYLGqxdk3s9xXQ1srhUgrx@lists.infradead.org
X-Gm-Message-State: AOJu0YwyqpjRZA5Rc9PZc29Xirdwz+7XeoCHENyO2GMOnamcgZl7Uv95
	NBdRyZrIkkfoUgtxxMTs3j4LP56hkrzkmj5A4q0ZGwkk+SMQd8qX
X-Gm-Gg: ASbGncs6V4N2KzOSMNZzwfCEkz3L1rd4Yf5eUAWOfUU+9SR7a/suM3zF8wvvxmr05lK
	C3ibSrMbCaez3IvQmyyB7HdZ6cOBCWuzqWNBxEoNR6o3TnzKGy+A6Z0gReA0iBCP83bz/4de+D/
	phcv4VfkCdxRgvjT7Wj2XKEjEE50Ty7hO6JARhXAVwkpl5nqUaiEpGqGBWlRxDrIKSqAUD34/Tl
	COWbs4EJO540XTmxrxotswoBgS6za/eC3D1emg+CkG6gsklrgSxZBoEqq+69AtCqDzo5IIv9VDI
	IVIRez10AKZ6Q5y4Dbi+vsoSs7/LMvZQwYu7E9gSeVupilTFQULFN5c7utt+QZFShX0+gGJp9sc
	tYcYpbhB+NMMrL0XcYrQKbxqrcF+tlzW9mO07WoVzVs5r9crukL46PNjhpcuiEvFutu2Dm/16ge
	Y=
X-Google-Smtp-Source: AGHT+IFibSa/W5S20lX1ZIerWQ4r767y0JrMahGOeoqoY2ep9DudBt3/PDo2q3Eq1Dwy2DGxhmaTAA==
X-Received: by 2002:a05:600c:1d03:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-4406ac6562fmr61019145e9.30.1745078457553;
        Sat, 19 Apr 2025 09:00:57 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4406d5acdd4sm65136215e9.14.2025.04.19.09.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:00:57 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
Date: Sat, 19 Apr 2025 17:00:47 +0100
Message-ID: <20250419160051.677485-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419160051.677485-1-pbrobinson@gmail.com>
References: <20250419160051.677485-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_090059_468735_1669689D 
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

This adds all the pin mappings on the WiFi/BT header on
the SoPine baseboard/A64-LTS. They're disabled by default
as the modules don't ship by default. This includes, where
they haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index be2347c8f267..64d696f110ee 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
+	};
 };
 
 &ac_power_supply {
@@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+/* On Wifi/BT connector */
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_dldo4>;
+	vqmmc-supply = <&reg_eldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "disabled";
+};
+
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_pins>;
@@ -175,6 +192,14 @@ &uart0 {
 	status = "okay";
 };
 
+/* On Wifi/BT connector, with RTS/CTS */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "disabled";
+};
+
 /* On Pi-2 connector */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.49.0


