Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C519CC98328
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpzCtQ/x5w6zYJCz6BFrhS+ES9WYNEAKtYj1bG27RGA=; b=4+wL+Nw8Jpt4IK8+dJItsTuXTB
	yYSIDl6dNWCByObvSDsazRdqBf4swsFcd251xqyt8hSRfS4nIHu1D74w3Nl4yBLAztM4eY4w0APxC
	VfcJCczls6jxOpl+6Xwm3JqeF6Y0APdniL8NIovZX+Hg27wAkUVE8L7jltMVMMttTqOy6laeqi9id
	sJcQM9/TYPWgYmYTrlphchL5bnftrhYtTw9Kzta3ccz1bfVRuoMpQo6qagWbUJ4bizY4ASCihsCTp
	rQ6FtOVHIGN+/3XLrjhsMJtRMIy6JFXJR+FQEB4R5ThTBSEkiDHvgs7JqFpsNf5lvk2DE+tm9XQAQ
	vkv9BeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0tq-0000000Csea-0CnR;
	Fri, 25 Sep 2026 08:03:18 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0tf-0000000CsZk-0mMN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:03:09 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2af3a4f193so8760666b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790323385; x=1790928185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpzCtQ/x5w6zYJCz6BFrhS+ES9WYNEAKtYj1bG27RGA=;
        b=wNG3MblYU+1nRpSbeez/KWTb65+wfBvI8zEOuZlJ46+km7WD+DLKoH+90hQ2ZJl55r
         7NO7YBOZTOn/k6GmDCFx97bu7bLQetugnSBQPzG3eJvFeK9izvJ5fmoxSBR5CXCJbhmd
         1pw3FP1v72FJTK0OIlRxrtx1OiZ1lAVAEkooKP3BSqHenZCSSA+1B3sGg9sHC03yoDdH
         5UPHJ9h/K0yIVhuHDW2ygmWdI4T3QbQGopqkVMnm6i9xpbRjzbsDW02mP2y2yEM6x6qk
         sWf5/QZdhwQAr9AdKUaLxMxfMbY0EJk3nbWfspMkg8k39tcTvUgHma3Y305uRklUfPd+
         aGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323385; x=1790928185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpzCtQ/x5w6zYJCz6BFrhS+ES9WYNEAKtYj1bG27RGA=;
        b=flXljaEfI8n1DrFXICJ+UjUJbN0ED4eVxm3EtELZi9DCzQKxXET+hc86/mcPJvDB53
         O76G4o0xbHE+OAdOy4TXcDXuK4s4EC65SX80N876u12W8a0ngwZxKBzJJZzVlYJEDo7c
         2jHgAeNeEB0P5ZhBJq0UuXvQ9f3rBHMw6dKkHzjvlSbrUTlaAzvpB3pbbc1P/CO7P8si
         b/slEDKoE27khdYO6JOj4Z/x0n9hHgn4rN0Ah37iqMCuBsBh6kTPCzsA3ykUlOdIA1ut
         VPxD1CVNGPT/2by2CfWlXbIE3xj4wGNTamETfka2IBxdeUEKIitplPiQkEgSC7pxVS+8
         lpHQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2TIblvPlejDIohSD+pXSPKswK4zO5qn4oz6UFpOZozSEaGsbxKtivFUtA5a/IyRmqqDK3C0VDStQ/Cp1HeeQC@lists.infradead.org
X-Gm-Message-State: AFuF++lMCz9ckl38EjAoZ2Bk2E/TyYZvvfZyiPpkNY4bfjwcFIbpgguH
	ubfpOV48axmJR1COEtuMsF9bLIHefBgIIXAcykKojg3+3zbcrm1rCN87vahWfsJrjCc=
X-Gm-Gg: AYBFou0dHhvxvvA11D1mEh9aDr/Kkr8BZ6xl+NYqV8RFclo+7eiaCikNkysdaHRKoMS
	D/Rz0wI9kJCW38DO36arnTMQG2bUlclwDe4kF1MKGinP+TS7BS5xoTREGUWrH9rlG4N56ENHy4+
	IR7YkN4qbQcFIhE48Ga37J0vttoDBAI/mQSIkCNokn2er+wAD/zf1cdnc4mccLSg0jFRDu9dVl2
	bQ0gFd7Vmr0RILEVQuvI1DWdAIcbbbJpF147Yyks0BoGrfU6QLn6oZBrbznE/TczzDOhFK6KjdA
	NoacN162cert4l0qfON1tdOh4UDKtKEp8tHX9Z1sg5vLZGkrBd3NgZgFjWOUIgFJYL2rwa3+1zS
	hoGIKXcR1dxzXLygMzvSTAjYOuFiFapnrV2LOS1xNHHQ0plcaRDs5I36LNxFdbjji2hSJzqAyFt
	TuomIEcnhYyrSrOYg0ij50hZz3wWqZEoBF/KWX/KDb55KkpvHA3Rx7xOjgUMIgmRmMKXH90KsMp
	X2Btq2Ae8xpeRQ3+lUh7o1uDdboxsJ+0IEZk/+4MwiX/tw=
X-Received: by 2002:a17:907:97cd:b0:c25:5d2:acf0 with SMTP id a640c23a62f3a-c2ac241f82emr459322566b.8.1790323384750;
        Fri, 25 Sep 2026 01:03:04 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm76976966b.33.2026.09.25.01.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:03:04 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
Date: Fri, 25 Sep 2026 10:02:57 +0200
Message-ID: <20260925080258.46489-2-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925080258.46489-1-adam@wermuth.pl>
References: <20260925080258.46489-1-adam@wermuth.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_010307_239991_1775CF0F 
X-CRM114-Status: GOOD (  12.34  )
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

The ROCK 3B has a 2-pin fan header powered from vcc5v0_sys and
switched by a MOSFET driven from PWM8 (pwm8m0 pins). Enable the PWM
controller, describe the fan as a pwm-fan cooling device and add
active trip points to the CPU thermal zone:

 - 50 C: fan at 25%
 - 60 C: fan at 50-75%
 - 70 C: fan at 100%

each with 5 C hysteresis. The existing passive and critical trip
points are left unchanged.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 149a5306bb03..b9f09087b176 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -24,6 +24,14 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	fan: fan {
+		compatible = "pwm-fan";
+		cooling-levels = <0 64 128 192 255>;
+		fan-supply = <&vcc5v0_sys>;
+		pwms = <&pwm8 0 10000 0>;
+		#cooling-cells = <2>;
+	};
+
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -186,6 +194,45 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_fan0: cpu-fan0 {
+			hysteresis = <5000>;
+			temperature = <50000>;
+			type = "active";
+		};
+
+		cpu_fan1: cpu-fan1 {
+			hysteresis = <5000>;
+			temperature = <60000>;
+			type = "active";
+		};
+
+		cpu_fan2: cpu-fan2 {
+			hysteresis = <5000>;
+			temperature = <70000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map1 {
+			trip = <&cpu_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map2 {
+			trip = <&cpu_fan1>;
+			cooling-device = <&fan 2 3>;
+		};
+
+		map3 {
+			trip = <&cpu_fan2>;
+			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
@@ -670,6 +717,10 @@ &pmu_io_domains {
 	status = "okay";
 };
 
+&pwm8 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8>;
 	status = "okay";
-- 
2.43.0


