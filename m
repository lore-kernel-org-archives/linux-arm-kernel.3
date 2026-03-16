Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461FBD58B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=; b=BD3ge8D4DCfgxbsC7PxeRq48gq
	Cv680vm1Jc+91YtRHmnItuEYPDssWy8BSOXRbSqRMTnf7ehCtJxaAcUPilcSMcLh+n4BJS+srsFB9
	1QqPt3ixHIz8or1TUrV3PJHG96TetoU95bSnQPba55b28Q6hfzUb2Xz7/0t8EPnttYvq0s4tIPwCf
	EkQcXzt6JjQCuBEqz+wVYQZlbqt0zzc1A4bCIPhG8Q5egtAz7oqFe5DpcUMBxmj6ckAfHj8mgJc2q
	4iL+y83Mqn2WlxSUADDnv/ASksAVO6A5foptjDpTkbTN3SxHcT/4X+ifu+N1HWFzDUg0PsUNaEsuL
	Yi42rEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20uf-00000003N0K-1aC4;
	Mon, 16 Mar 2026 05:54:49 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20uZ-00000003Mxo-3RUR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 05:54:44 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c73d251b93bso1743737a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 22:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773640483; x=1774245283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=aHERSJ4hT2sncovq7E8HoptXZ1pfNRw9E/U0CwazczUvCwpuQVSx0xgAYZGO5gew4o
         QAtpE4dzduq9OHAE8v1GoIcSTg9RB3LFCO4DfwAiny+k2sBG/11oTFHrX6olr93p/wKH
         bpTd/pnY74KSALNROjrqa6t4YUAZy7InwktKccDepWR5aT2/5ULrNuakQ7X9UueapuiW
         Yeh8D857px8+YStorJ9kvH1jqTf0PCvl77iBJVjvte89Mjf3ZgHFhTTMETLtccCjb1yk
         OkHk/cDUxC8jrQb1YtFJGgxHeSEfyr9A7brBMSpuD2T+yiFXJGBvrtzMwV+6NV4GdmQ/
         Z4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773640483; x=1774245283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=I6Vk0oUlTD4wOePTZTlgQUXhiGV26/BEyq50A+BAaTnSnsbopOLFFDo0MHs0Z1o5PS
         TP0+jLsXfdwhWkeq4UNMrUKD6eaxM7+kOLLv72M3E8SMyj1kv1QqauumB/BmqCJT1fvC
         o0vmD5BavpZ+6M/Bp4z5cTPFOEuROQNvLsuae4xngPCdgEckDWxesLekpO588njkoaMR
         nJqfdkAAHavKYWuTLZC311MDN2HRGKQwxAGDEDHYAq8vZxJA1JbrvTNpQ9qW0809WJxy
         eOXo1vxAoUWLfIoU+6YGtD/LOj978kWajVfMeQdFFUgq+ljKeBr+dZxYMsk8WYq/+NVX
         zpiw==
X-Forwarded-Encrypted: i=1; AJvYcCU1HeHWcjhA/rXLiz9fr2s9VloiQUhrZp05Ud5ghUMlucFT37sgHFtR1fhhkSAmnr8PWuc1fKv3kGgAikLWBQ/I@lists.infradead.org
X-Gm-Message-State: AOJu0YyoEyFIX+ckeXYifuwpsHppjuAZGphzDkVh4uzgsxHD0VJlTseO
	KtqHSvMlAfP/FDjdeGa3iGhHc/ZHHHbwU4BylJdDMN8FVDUhQVNzT1dt
X-Gm-Gg: ATEYQzx04te8/rXtWJqosP+jGP5I1ggZIwYOIhWRWpEvq0hzrFfDMtwRc7jnh2u8wM5
	Mz63DOd3NFmxASfiMBKfSiMlLnl1nKKSFoLQE5AjT8DhqRuo1ukZ4mUYRaw0tD/PUti2jcokpDL
	Jsz07IH9Hm4JQZR3F9sZ9UNO+5EbyMOHjaeqGtdcG15HxR1YyQApOQSH1hyoTGZQJuipObBQlli
	EJgtUS4QI4g2VQjNkbYh04/nGgLNR874d2FievN2vFYNK/tSx9ch/xVfvHnRS4qeg5fhhV9ArQ/
	Pj9e2t31K7ibkgk/OSGJYAUX3DhUknLTiao7BqinQB4I6XSXtKtCA3xWmHJX0hnW/G3fcvhw7hs
	eSM+lOz3ON6IXq62IokwsS6gcBImG//XI/IUUiSeWe3EajcE9mOLFitIdGnEYEw67f+1ZN3Wzpz
	mIdrsmmkwqI+15Y34plWGUIhqcBXQds0QmQeSqYSOijGOQeUIq22S4zVdlikYknjwPl+vvG7snN
	CiEHfMRAF3vL7oDWdUiOsU=
X-Received: by 2002:a17:90b:580c:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-35a21fd7ac6mr9309269a91.9.1773640482884;
        Sun, 15 Mar 2026 22:54:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9db7dfe6sm2166285a91.8.2026.03.15.22.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 22:54:42 -0700 (PDT)
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
Subject: [PATCH net-next v14 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 16 Mar 2026 13:54:26 +0800
Message-ID: <20260316055427.1310569-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316055427.1310569-1-a0987203069@gmail.com>
References: <20260316055427.1310569-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_225443_953035_47914495 
X-CRM114-Status: UNSURE (   9.61  )
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


