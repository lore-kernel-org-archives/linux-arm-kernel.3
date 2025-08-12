Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D036CA0EE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQxP4ZxPVh/0zmN8q+FGcllVOnKIVVQ6evAwUcgKqFw=; b=jLcucC/Mm2J7hN9rhmgclD0OFX
	gWx4/8DqHkR0KaH18GmXQAR0k//fY0TQrCD738ECibbtOl6J/Ro+DEB420C/8wZ1eDwm3HKyDjfbH
	+u4PBkJEuOGLLZ6Q+a6pqZxfjy5MtA9oNh0021Z9fdu5oS1gq33qTm+MM3nkDz4pG8Inz44dcllFf
	axsqkW0f6Lvk7E0ISCJphyMs5Ood7di2yDTLo8SBKV/9y5FtWQ3S2rSsGXnC1HIWLKvARpNW8thhL
	ESiqEyAXnT4PP3HN6Ciaw3/eaD0m0Izv7D0wKqlqdcpopVtJIxTLE40MYDmTlfPtKeYoVWV4wdN5d
	1RgtOR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwHt-0000000C1fz-3BfZ;
	Tue, 12 Aug 2025 21:12:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvdg-0000000BwPy-1HUb;
	Tue, 12 Aug 2025 20:30:33 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-af9842df867so1045319666b.1;
        Tue, 12 Aug 2025 13:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755030630; x=1755635430; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQxP4ZxPVh/0zmN8q+FGcllVOnKIVVQ6evAwUcgKqFw=;
        b=nSCRxSOxAmuWUZLDBYTVLD9s63emjHVdszhfzRZGY9kYzmHqCbn2gL5cGuDTTz2Dbp
         7d1tDb+mv/1f9DuUB2j2tYfOAbaebKKCYHvFo0uBnDcvp0W1PKfxRPuBeBsiQ/Ro+0Ix
         Oy3v0X7RybSjPeeKP8nR1laL4MWuPG+shS7JLG9kwuQV0OL4rJijDX24srbuwWXxGSux
         S0gmknFo9onO10rSBLiLlWs8GjakwuwheKJJl598G+7KyKyryUwld/Je7HCs21Z5hyjo
         sa1ru4NwWY/J1UI8hI9FHECsWdyS8QcYK4qMML9+lHhII2/5kBOo4c8ev1oWmYHW9vhf
         OKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755030630; x=1755635430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQxP4ZxPVh/0zmN8q+FGcllVOnKIVVQ6evAwUcgKqFw=;
        b=DM6zjem4Q0HUBkuEO7b8XDOZHybfZkp7mNXFXEUI8aqSXmM2GrfJJYwDyZBfmadii6
         VaSSHP0vxNioRIEM3yzXqThqN0Kq5Yx+BdY+G89fF8SUcnnfPTqg3bgy6tyTQL5YydDn
         347q7BHIHnSvVBw4FqrwE1Q2tWgDPJUxir6y73PXvQXvuvDMyyxRtpV7L78xl6G/YpTk
         eo/CAZMlX+gldaM5OV+mlxYTyzl9kj/wmvGZzJU9ZBPApog+kQfqkYMm87YQDSX3qJ3n
         rXzLv+/efFaNDOF0PNj53hDTRRQJoZyLC5Bxjc5shkYCnTX43rUGRGNhHChzTfzmjeoP
         7uGw==
X-Forwarded-Encrypted: i=1; AJvYcCWVAH2MNpsNvgTSlcGYoz/C6b8R1YFAn83T9SCFeFGShWqjFzyE6BgRKPryC/O5eZ0/YgoKXNuUOVq16G3UBvkJ@lists.infradead.org, AJvYcCXDwZwn4wdfqR3/ztpSE+PzPOowQHsjN4y7KkPOsirTIm8NesGQypgZCA+eH1lEuqnq9ORxpc/XREdiJvSDXjM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuYB8766SBH+maprMvwa1YiaRw5VviCiLNvC5SG6xSDc0BjwQo
	lJaav4u/Vtu/pUxoOga2xqXp+MkvVIVayA//ODxFt35hLXe8P9pTyx8NEWqCsWRQNjk=
X-Gm-Gg: ASbGnctFn+I8SIUFB3dE4oXYVsHo66q3OU8z0IJ/XIhviS+2/gkDStqi6Y3ZZ7lam0g
	JBARuJkG4gO+ZYA2cGGL1/skYV3JAkehc3wPkHnJcm9TIwJdt9BokjhA+y+SDu26FY1wQnfchw9
	+mcEHKGoplS1LmMdXgyTc3JayNhdO18LqWTERBR5bMYdheOM0vXfU1hrLzyit8RRDXT+tZzrLcv
	KVvQk+Jx785YL6itHpywRls7ln8hVpFSB5fjPB7Lgr7qahJ6Zn6zghwnESSmSQfcGjVfueFbYGM
	5XoxtJyR14RqWKMllFLUY19dV/8DXJByHqh+3TFzWAgeRaWxlV/7AFGiJc18O7GKiseFfR5Mt7R
	K8YeyOSKolLmATv/241DHWMw0GEq/ydU/kW4z+rFa
X-Google-Smtp-Source: AGHT+IGha4sQDhBjwAomOdfxTOZUbG5FQlqdvkbkrooNysCTtFOhxRuOvRoX/lUuqT8RtD0v7pbAgA==
X-Received: by 2002:a17:907:3e82:b0:ae0:ce90:4b6c with SMTP id a640c23a62f3a-afca4e94064mr55627166b.49.1755030630283;
        Tue, 12 Aug 2025 13:30:30 -0700 (PDT)
Received: from alchark-surface.localdomain ([185.213.155.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b58sm2266073166b.58.2025.08.12.13.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:30:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 13 Aug 2025 00:30:23 +0400
Subject: [PATCH 1/3] arm64: dts: rockchip: Add RTC on rk3576-evb1-v10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-evb1-rtcwifibt-v1-1-d13c83422971@gmail.com>
References: <20250813-evb1-rtcwifibt-v1-0-d13c83422971@gmail.com>
In-Reply-To: <20250813-evb1-rtcwifibt-v1-0-d13c83422971@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pavel Zhovner <pavel@flipperdevices.com>, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755030626; l=1495;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=5E+fde8ovzmzTUceBtn7CI+O9TOIbKRLOSEfBeB3oUM=;
 b=4GfNGPMEuHD+WSnU0tE0dxfJvOveME+1Z720RhoesCNNM2yy2dYLpgN5ExP+nx6CMs4TxIGOX
 eNd/ZdrbhqAA8yX4giSRlbTIOJovEnIOfIil+HFpMrw9U07Wm99r4A5
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_133032_347825_857C3C68 
X-CRM114-Status: GOOD (  11.44  )
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

Add the I2C connected RTC chip to the Rockchip RK3576 EVB1 board.

Apart from the realtime clock functionality, it also provides a 32 kHz
clock source for the onboard WiFi chip.

Tested-by: Pavel Zhovner <pavel@flipperdevices.com>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 56527c56830e3fd81855652f7bcc31215c771c0a..bfefd37a1ab8c67a17aba0cdb80980102d66bb76 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -680,6 +680,22 @@ regulator-state-mem {
 	};
 };
 
+&i2c2 {
+	status = "okay";
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int>;
+		wakeup-source;
+		#clock-cells = <0>;
+	};
+};
+
 &mdio0 {
 	rgmii_phy0: phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -708,6 +724,12 @@ &pcie1 {
 };
 
 &pinctrl {
+	hym8563 {
+		rtc_int: rtc-int {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	usb {
 		usb_host_pwren: usb-host-pwren {
 			rockchip,pins = <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.49.1


