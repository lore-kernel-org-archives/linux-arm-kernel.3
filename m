Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8676CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=; b=kQxqilH8YvWiCbkITp8HDWGSPk
	4DNjMxnJvgCYScZxk5xGClLhOv7MvB/CO/m9G5kry2pPtsFxlhWnFuBlRMn7FVzaDyXc2ugcCOwdu
	+ji8/bY+8IKNEkR69B/YTrUz3oyXBsIC7y79vTpDjt5IKGv6A8jC3KrjoYafiPhI9aULbODDy3juo
	CIU8elCpP0cvY8ZYyDt6KaAIWbFhmCdqCt01B/12xQ0TIWrwLQQfRZW6/ii31I0K9fe/GsQNKhpan
	usJ00737vORE6dfOfx5Yj4+5bZydFILcLGkRAWyGHLrWLCjSNq9FEjrHAwKAzCjXIdOVMmAKLDQXu
	yiBC2+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2Am-00000007Wns-24Oh;
	Tue, 10 Jun 2025 16:50:04 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzJ1-000000071mO-0UOr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:46:24 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so3796792a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563182; x=1750167982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=D9s8nviqoYS6kEsgW+Fcz5vKdtye+o/bJQDwY5IQqcDFiL9aRz6mQ4wHoew1gZLuD5
         jUz0pNoK8vJFiGKC62Ym62NRG5JJ4thlUpL3LQa3s6drGYY1wJVWlslicBXkGtlM6G5B
         T8+ybM/tvtNsOw09PPU8+rUjGWzr0X0CeBvxX3oTWBA6Ug7+aCh8TodqGZVABUwxHgbZ
         Ea86VuFinM0MBpULqQKqXbI8OvBcOTCknEoI6mSX27/gRT19CpikRhZPKI+zkDKaXEec
         VWevMu1Lj+dxJ+Ixw5Gt9HvgjhuZAIjGVa/2XXJhVcgZSOjFQg3sAXxYlVqbRtI5xpOJ
         x+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563182; x=1750167982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=oUaHymR0bTcEcoSX9QDWysoZX/KLmyC86r4L9w6fU/EbGT7fzyRid3njG4Tm0BG/yu
         4wA5rBUXp7CMxBlR3CHScPPpUkp50M0I7WyClSGBtC9tzf3q1v34wEyaNkz04AxYNMDE
         KUypXk9kU8Q4ByTuCUhnzBwP1AlBHNK+pr68jrc+FqSeLSw6FzeXR7PcBSAtm/sPQ8xM
         N2gUjwjXnu7jP+nyqM5vjk60sSCj0dJTo96jyP8gVv/ov7dVxVzEYXge8dJcRyW6M0TN
         z0GYHV4aed5owsYE9NJ0U9TRQ/RwLyvId9ls4wPDeG477k5mYVkRKYp/KGnOui/KiwKK
         dung==
X-Forwarded-Encrypted: i=1; AJvYcCUq6oUziC7x6RjuRnljzl0SLi5yTBmZCIYbYWuWgmPVI30otxcYz9OnGTDrqAuKGSMbn9zT5b6xIl59Ef4lfve2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl8xOxuxHVXb1SqEhIhz/8OZpbmkoriBZJEt/vMC9z6jPiUuuL
	cngtjBhzGSTJuMiHwhpqSm0qVq2ce1fVip/Xdkv/aJ8c51HvNCfi1X1h
X-Gm-Gg: ASbGncuJQleK452ShX8jNKpudSdFtAP/0zlFMn7j7OialXFEqOGiQFObk14Z3PUKfv0
	ylijqu6igupDEJpm7X0RRu5BB2ZAvWc+lNASNGH2aJnwIrQlBOpwrTSgWXVWtIm4JFpMQqWDsXO
	0OMLVMRdgy8m0m1LKcy1uLDdphkBKl0k9UoQ+Z7P/A/xjKbW03R191+A5wI7lISiVST8jPQBdD4
	eBVfb9A7TADfD1NSkXp0sI6Qp1JS1S5/dCKfL8gDo2tx3kjKN+/0JHdxr2BJjCjtoadWmhhSBTx
	M67FAmiR/K7CYa4dYTfkfsW1RVFpeHAT872LbDyBpEFntY3ls4gvpEBohFtSjnKV
X-Google-Smtp-Source: AGHT+IFnBfu22zv3Ouu8/mJ9OqridU9aBWmKTkj+xaTICPJRqJSyMf3R+DvVjf3tmKBM0nKTvRSwLQ==
X-Received: by 2002:a17:90b:3c84:b0:312:e744:5b76 with SMTP id 98e67ed59e1d1-31347695306mr25071825a91.33.1749563182238;
        Tue, 10 Jun 2025 06:46:22 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:28 +0800
Subject: [PATCH v2 9/9] arm64: dts: apple: t8015: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-9-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMfQB3E9FUiFPW5MawR4g4G1LbR7F8Nl1PM
 MDN9xnbL2SJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JKJ6D/4rPbodonMfukKOY2SD9RCuDnOe3XuP5GF8nzTJHzCP92+5tU6SCrGWa5TcqVVJv9mRFoh
 +Ycv00c9BGxiIA+SgwwnvQye5fPMd6X13C8yrvms11oZlXjtx017SagHToOn0PDDa5Xh2l+30zq
 EP0npSyXzbfTfznBR8JBgrOreDdHhYKUMzDmdhkAeBvSx/4iUOrM2R5u1HRB7lXwurw7hXLVIsp
 7xUbfRN4KC9BOK+iuj1QVWKAUp0Zim52gdpLW+D0F4paR41WZ6fnEG5nmbIMV9V0dHZEfud9o0b
 o0u+4F9hb/Uc/nO7oXP5spiFP/0s+MvNhp/nInshMGqN5ntO2zJ0ug/TIGIJgIA1Vie4jHM70bF
 MUYTbV/WTXvwEFZqwqHdaCDyB8HScYxYZFYfy19G7S5HqkjNtGZZO5mJDSLteuhZ82cywO0RDby
 qgP/MjAr9vo9ZJCzD182C6qK2IA2e8lgfqhCZxEiWccYyMqRT3qcMRJmh3+Loy9Ab2aHRWyvpps
 qxCQszZIMSA1V3kBQbK1VVpJA03oi+kXo+B8ZZTrbKAXX3C68bHqlxkpKm8+CUPRS7r6a6u4p4x
 kPB59aDz6oSUFjE/Ws5z87RkYQulDA90++2JjacdJYB4fD6TeA2XHvOAJt6fyV4qBIxsI6oBR6Y
 14RtP6csmMrWLpQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064623_148143_4D257972 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Add I2C nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..e002ecee339013194537910db2168c143ab3d00a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -265,6 +265,62 @@ cpufreq_p: performance-controller@208ea0000 {
 			#performance-domain-cells = <0>;
 		};
 
+		i2c0: i2c@22e200000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e200000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@22e204000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e204000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@22e208000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e208000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@22e20c000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e20c000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		serial0: serial@22e600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x2e600000 0x0 0x4000>;
@@ -321,6 +377,26 @@ pinctrl_ap: pinctrl@233100000 {
 				     <AIC_IRQ 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 55 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 56 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(73, 1)>,
+					 <APPLE_PINMUX(72, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(182, 1)>,
+					 <APPLE_PINMUX(181, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(4, 1)>,
+					 <APPLE_PINMUX(3, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(184, 1)>,
+					 <APPLE_PINMUX(183, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2340f0000 {

-- 
2.49.0


