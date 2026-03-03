Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95585EC0469
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=; b=spiWpJPVfRdsJTieGlbDYRijgq
	kNPFyelvOg/gnYqDyc1q8dhMYPYNyFBTCaiJ7JBBsefG2CnAFyG9+3uPbvxhvhjxFzkEOfxAWzstM
	73AxVS5CxgUhkY2Zve+MCA5KMNFYpa97wyA9obT7Aot96uUkao7v1DnJLIbmG+fC6dRLm0aGImp9w
	LuGqWzOJcG5lG4RlH+P6DfEkAe6QTpXgjgfqtzI9Ntk0jYl5KexXOFXMHtL3lQjHuuqVt4K67NL/l
	nqRg+rfoMZKE4k64wbPJSU+6mEuxOoKCRWb+bW0iLXLY+s4TCOZ/zcdbjA1EZzgPgr8OfK22nwdyI
	0P1qb4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLva-0000000Er5t-2ySb;
	Tue, 03 Mar 2026 09:20:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLvW-0000000Er4d-2Cgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:20:28 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ae4988e039so14721185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 01:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529625; x=1773134425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=lOIZnfKvnAl5nli8ls5aNpKbUQx8q6WELN4nEzOs460UKFZBKIcgyxQheJkyINKo3f
         xF8TbroHdm0eKtJd5WYx/d4G5JVF5QGGlTEZhCsDRZdqLk3iJNSQVTwb9oN4hksfJ2K/
         +dy/3jDzDACeg9jd/1FxI0riLj5756Rgl+rrHKgRMMNqB6HfhjpNwRBr2eO7eXI5/ta+
         d7SURp5GDhnDjIHPRi+cWOdKN0PRQSuBDy7dvi2I2POLvb7pgY4SUDMR98YEw+D1fPzJ
         W/xaa7l8A532Wd1FIzJ7medtxJyaa1sFMaaCGkxGER125vkzxpTDsNSAPDiXEzEJB9Un
         uQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529625; x=1773134425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=QRJXQ7/8FgHnHc6A85mHm74dhk+607QFLj2xB83QnGWG03L7Q21N/Siad5o8Xl9CHQ
         /7R3jixCsf8lqSkwh7LhB2G5Whu4Dpk0I6uGok5UPHggp2OXfModd+55VEacYMmGrOz1
         4soLXC7PBQ5f8qR2pdOynYsYo91Qgo+lTEefDPl60Db40qqBYwqPgimLA6JmXky409bc
         9LMXJpBbac0qehtRWDayzTME8tRlHqYWlcU2zmH+6jv5Ht6sJff7An240DdFRY+ozESd
         El2wl9ECKL4K/8IMGJNF2Y0WFBt6LfYIPQQeaO2yd5gJGTXMfWLZ0wIJGKSU4kx5oP5S
         kCsg==
X-Forwarded-Encrypted: i=1; AJvYcCXrror6pbkvdmP6wrODREs6rzdMcaVJUWQHGCuLqy+obg4ycUR2Qh8Ty4Nuv6oOrrJAmu333O9ORCJv6p1wuOwC@lists.infradead.org
X-Gm-Message-State: AOJu0YzMs6SwmTPJ1j8+O29dg3pXMDz2y+FtbvHRV6HJZ+N32fcqGXP7
	s/KWoIpJXcJfdyM13fhJjxVwmb/RLmlidg+IrRs1FODZZbUl2GbtItIj
X-Gm-Gg: ATEYQzzUJVCbbDTd+VwWi85I7vFbBW8xkCh5Kwf5w300wKKUIJxlM35tHvosgnp9x2I
	pK+XqBBQsEwef5NS4WXup5z97pzHq5KduttbUvAMe+9HSiFad4HvLLDVCjba2cbWInk4ponc5eo
	hmBo64ANuhd97YSWoOP0UqpUCG0cK7xplJ322AiHxibjKnidCz2wZ4mTZj5Zg4hk/kiul04JzWA
	ZKilKWpiyqN+YdwP0ez+9LbUXFejabLPSEvvNl09M6kwqJX9UlGpQzjW87LAJq+xWj+6V5cZKXN
	dJULoRUXDHbHi1O3chziTf6Ew7d6TJBvUKcM6ZWtQglUd2hs8Z7nDTAv19RO/ktCCB4cwdIRJpJ
	CPVSTu8pQ+MsMI96O7+hcd+rsrPoA8XRhZzHKyFfUMBQ5nuXnh1qU1KtG9+HaflU9RVVD87oxkb
	35QdizhN7FQlDb6EbbsrWybmJMK22GceZY26qXH7fYvowMvSiRgCRIkfvBaGrlHRH/wiE+AFQdy
	FmP43za+W19
X-Received: by 2002:a17:903:2c05:b0:2aa:e47d:e3b with SMTP id d9443c01a7336-2ae60b26667mr17936825ad.0.1772529625504;
        Tue, 03 Mar 2026 01:20:25 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm158777475ad.50.2026.03.03.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:20:25 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v13 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Tue,  3 Mar 2026 17:20:05 +0800
Message-ID: <20260303092006.263715-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303092006.263715-1-a0987203069@gmail.com>
References: <20260303092006.263715-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_012026_570876_C674DF56 
X-CRM114-Status: GOOD (  10.04  )
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

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 25 +++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 24 +++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 3 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..78534d613486 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial13 = &uart13;
 		serial14 = &uart14;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,26 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-mode = "rmii";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..a029b660e8dc 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -129,3 +131,25 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7228ad4735b5 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,57 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 	};
 };
-- 
2.43.0


