Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715D9EA3F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=; b=wLvWnfr0Jse3Toxpf9Ir/Bmf6i
	q9gWBXaISv1wom/Iy3BmzOgZx97BKtD8Gp0ucbxcQnXsUtitC4m84022o2894sTFNlcMfFi31Jyb/
	0QTWZE+zCdcAv+r/uCnD8nY2Yfj/LSJjwXO9bgXGXIt+plwqInlBgwd40aJNNMR0vdEvc5CZexIZN
	VKZQKhPy68trFG8MerjITi7U53HmmW11Aj8DLX/xZODHB1KUPTX9dO/UMpl9vIfDSehaWLb5pQ+kQ
	LygTzR8fqLjXyriFPzEQ3L2hwuWy+t4GYcGUQnKkjf972md4pfAnU3S3joCDIdk7KZwhLxQJeSUTW
	bGlV6pQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgD2-0000000GSto-39ne;
	Tue, 10 Feb 2026 05:22:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgD0-0000000GSsm-3VSi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:22:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a7a23f5915so34259835ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770700966; x=1771305766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=j44PUaXkE/RQQuRHAF19tLXzOuRPy8mt2TqHxDft7fBdZH732bgWRZIvzQyKfobJ5M
         kupPiC9F7iiTkYYTHt5svhVoG/afm6S65+9rXAPMALGE/Iow68bHuD89BoxJPnvrSbf1
         +gNYdLhYJqMgFpopzxpwZH63sNEewy2XPgAurU+XrpOywi/tBFgTDWrriO6vaHKGVfIO
         UWR+WMVJa0DDBc9cohTecFE6KjlBSj6WDsqb5Hu6r6OyWhRP27qW22kiRWO84yqOB7KJ
         hPSvmhTZ9rsaDTluHzn7A2NryxQwF6k+BS9oSxHvcWBdvu7h6JeyRP9KI41Mumg4phAg
         bYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770700966; x=1771305766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=N85E1OJx6OFkqltwOCI8xdCf1AaeG+dENpsjbpxQAGm3ZEewVjCfPbQvo2xIEu0KYq
         rQjTyiNWxcA7JVlAts9mZHgw2CUzlVZujbPpmPeHqqmxVb79ABhWlHuesFUCMM+y+Biz
         1PF/ilabKGWSOzCFtW15LANRh1SJLBzFROoo7Ixu3CnocGF1PTJCGzkbC09PHDzOE5SK
         iglFGRgGgQvfciu3ClqtJYnTctOJGoRUynndTDSOtvW5cSXKKlu6Ozv7Vbw6TKpEpLSS
         2nIQ4TgP62AXtUij1OwmLD4GuTB4sYXnC4dODqezyS0ebHF9ax4wC3ZMD89RISduEQYP
         KBpw==
X-Forwarded-Encrypted: i=1; AJvYcCVZygOXqNoSf/CdxnrUn5AOeAxkYt4O8lezLVNIqyTFpqTDFQnB/x9r/gDWNcep5snl2UU2PDGlR/CuQiF8Ke9R@lists.infradead.org
X-Gm-Message-State: AOJu0YzzLJzavTovqGV1am2RmaoUZTqCDRlQYlst5euvuwZ4rb+EtrmH
	ivNfA3cp8O7qwP5NiWz3kReKvqUxAi5XkHk6J0F6MCGmOnQ+bJWoLOft
X-Gm-Gg: AZuq6aKx6LlRHXESDbi9izGbp+g9f37M9NpYzJYg+wBMWtUl5G7eoxSmTpocWQDb1j1
	3p9a0ySuFSXY06kzvDurZoqv9ogbZwbQtEJ6CIZrQ68tiQMxoL1gKcwUq4NVnvPD9snxWt69sIa
	J3jlIJ3p+rdgbc6/cL0+QjUeVEQmXc2HnuhYcMU82/nhdOzTOuoi/WeMW8gWHMcRuBl+NrKQJVd
	fHRH7fCdzvhMU3EOMIDaFun1iPgewlEi9OQrxu8nBJ9+1Eny9ADBK7u+gVMo/wpPFwxaDA8l6Yr
	wAGlyo2UbAOvH2GgExt8G/gZ70pfcH3HkmVu0pNGfsJFpCsocrFHFqtx9v0B7VcVYA8+rmXDFeD
	r0LymEjJu0VJc9p0vty8s3MIx3QvlY6qg6QOrV2VybBST6kMDaym6pZ3WLEU4oy7icR64bcVyus
	luvERko2hnWsTEwA8bht9cyv4Jo5WbqpytjMG3PGF+hyan//7qkfDuLHyKgRWBDnaYfKuKlLRGs
	x78EjmJUiK2
X-Received: by 2002:a17:902:db08:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2a9521689bbmr159080225ad.27.1770700965772;
        Mon, 09 Feb 2026 21:22:45 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951ca59f4sm122114275ad.43.2026.02.09.21.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:22:45 -0800 (PST)
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
Subject: [PATCH net-next v12 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Tue, 10 Feb 2026 13:22:25 +0800
Message-ID: <20260210052226.3005666-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210052226.3005666-1-a0987203069@gmail.com>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_212246_879695_BC617327 
X-CRM114-Status: GOOD (  10.17  )
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


