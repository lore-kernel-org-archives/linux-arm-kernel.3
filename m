Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CBFE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=; b=TkCEgw40g1CzrRVZ76z62naCWL
	YSrrSIiVCcRg6cQ2IiMMCW4k6BdCagIbOm3t2EguVriwI0sE+04x0CW/rnKfWtrhp6ArCwv62mGVV
	dqHtdqtZNbxrKhYX23qa9Sg1KXPSZbd03BagXPRtLkchlkHBN35yJO13LUj/tTRY6z4MFj0l/JDO2
	tpzmaeKv68iGyatuAV/unHpGV1BbCJK47IjEETnF3IsTOZrm4URvUQjM6La4hePte2iRaUQT4dlzd
	AOtrDgvrkcRymE+iqeeZd2EkocsKX0SrD9jfeM8vGR7TM/baR14dlJbH1VexZ8BJK/EboU51+Lqjx
	kRSePfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsYK-0000000GVRA-2vOP;
	Wed, 18 Dec 2024 11:49:20 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsU7-0000000GUWL-3OpQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:45:00 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so150760a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734522299; x=1735127099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=K0mkG7S02Iyau01EnNee4K+peKSNYJeBVEa8MMLrkSPvJho+ZgXRIVoOqKWkpX3HdX
         rwXXj2vlU0e3JttH+WF6MBZeakaqqGwJd4Zn2KSRcPbJc63/ZZHKbHOlUKsXMgLNWbdk
         1o6FcRd1yMHiwXkD2uAhkAjCjF4y/N2D5GTbS5N4kDM0Eyk6qJSh4gkK9MqokPROprt0
         gkjf7yiiU75f5O9lKP+3xGR4w/6a+jMlWYH147FbOkhqSnnwkvFVfFBRH+P/XaxCD0OH
         Y9pg9+pz6qQj1XU9e137UaUhEQyrZD06ib1qto/b7B875UCEs8d7IdZK/61WVE0TxDWl
         yQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522299; x=1735127099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=Jb5LyALixqhxoIl0EREMdI085PODbUD8Zu4PKwVzSCwvQgZETLYzjG4nIyosyvPuEK
         PU0I3T4F8XY8To0ZM691qAFgAWpbaMUEklyLrLlriX1fjBXPLx4vib6/T7t11EnUjMNZ
         NgIhwOLvmNFyFVC9e7A6DvHerFl4psM2wNGMkEAiSrAoC/kbNSjGjGw1X+8dc3YLGK8i
         hWGs5w/3FMIbMYFPEJpDDzPdJdzXHdgSPOkbDLWpkvdxMkmL5XLyQE+pc2zrkR85Kp2s
         14oM8ibz0dZetH+U0HdvbwuwPQrMTO2tvc39k4rDGUiot3FyTxOx8AgkHMbMyiMDnV23
         9pOA==
X-Forwarded-Encrypted: i=1; AJvYcCWj8Zio+b9zqNROqBpEMAwNEIOytlAeUI2w+VYv7inahJkJMjlrr8h3w7gxeuBeNwuJLz4DiqSMOJ7fwlnfSLaz@lists.infradead.org
X-Gm-Message-State: AOJu0YxVhytMJDJZOpzFtiUQ3FnOynK74GjS5MMdriTjGAiSksbFXUiy
	1S0/RBhdRMUmZaEGFy5PRwtSEMshvaDtSRmlHO5bqo8XgqsSpww5
X-Gm-Gg: ASbGncvdBHahpxno5qBaQAJK/V603vzRCzs8Z+1B8EIbBd1ZJ7eeGXsOx11hjhc/YF5
	Kr6O2kSjOJ0JQN6Z5LDZvp+UZflTEh9waj8GbKeLMvZEofvCKjVQptZ07hyfnLRFcofxPIYmfsu
	xxK7IqUa79WSFFYbU2TjutVW5Im7nDG09opX4QoLpOFDtMaUKnfykYSWg0L4mh5QYsdHKur3hcg
	MJYXTFgt+Z5Hi/a90QMECybjAITZ4KOOitHGg8tHSGNAA/CeohcbnuJfylK12aDrdKHKKzwjhz/
	An7a52FjqpsxaQqPkuZFng==
X-Google-Smtp-Source: AGHT+IF5Ib/90iPtMR1ImZoOuveUzNiTCwjJb1vOUxqFuNbDY471/cF3KL5yw0aq8vc9EHNJa/MnvA==
X-Received: by 2002:a17:90b:2f03:b0:2ee:8619:210b with SMTP id 98e67ed59e1d1-2f2e9378f01mr3756869a91.29.1734522299091;
        Wed, 18 Dec 2024 03:44:59 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cddbsm1324362a91.15.2024.12.18.03.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:44:58 -0800 (PST)
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
Subject: [PATCH v5 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Wed, 18 Dec 2024 19:44:41 +0800
Message-Id: <20241218114442.137884-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218114442.137884-1-a0987203069@gmail.com>
References: <20241218114442.137884-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_034459_846242_E37557B3 
X-CRM114-Status: UNSURE (   9.84  )
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

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII and one RMII
interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..5cc712ae92d8 100644
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
@@ -126,3 +128,13 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&gmac1 {
+	phy-mode = "rmii";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..1d9ac350a1f1 100644
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
@@ -129,3 +131,11 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..89712e262ee6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,59 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy0>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy0: ethernet-phy@0 {
+					reg = <0>;
+				};
+			};
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy1>;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy1: ethernet-phy@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 };
-- 
2.34.1


