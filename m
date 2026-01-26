Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D606CF65D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YG5zC5nRKtuL2pWJfWd5vRZ0VVU+WDTQCf+ZvwSm3ng=; b=ZwCtldhLCszSSAJLbKG73awr3h
	mIZBn73uGcFhCtcIUWKhdlS92yEaxgU8uZiHx35YPM9pKC6ZQYWO0V1SNWGADGGf7W8gbqo2if4SL
	w2fWPteos7FgaNVt5LXA8chRcOILL1RzI9wcXJeGOli0EXUSlzpd54Rkkh97hl3ueg6yCRryhrZxs
	3Y7TnjiC7nvpb05CUom+nUq6AN0G21IKEYIUDd6S73U4qFqAxLAGc08WdYBAXl2ANpYDqhEmM9FjP
	fUbqw8bbbF4n5Awq0ZHwXXEqmOBMgYQQP4MG5BSyWaUkstjG2AHkwCd4mSI/dj+TQGIgpW/0tPsFS
	nm4+KTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJkZ-0000000CH1V-2aNb;
	Mon, 26 Jan 2026 10:23:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJkX-0000000CH03-13Z9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:23:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a7aa9efc55so31182485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422992; x=1770027792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG5zC5nRKtuL2pWJfWd5vRZ0VVU+WDTQCf+ZvwSm3ng=;
        b=iQLDBBkpfQq1Ktcl+o0cPl3xgLAKVltQD1YDdYXCIsfbEZqDTiNFvGMEN8WymjhWl+
         TeVSygXwHic8sBdWhcudE8tVgRLl6WBxWM2zH5h4OX/zLNCGt+piSaMlBXeyaVnLMJIC
         WTbNi4GQcm1A8E7LarihOjEdsBomPi+3ruTQP8/PkEvc3xKG7xW0kqtlBrl5OWQbslKv
         REzkFkQhsLmWLyzFaC+xfwBr0izeFksIlobZC37gdcm26S+/ldkW12SsV/kfFXY7/izk
         E9AplqmnxkapX9bw5gpNlrgLYetbelUgCLQNttZ/kxvb2ZwJjoWUOXqus2+qi3oAnQ2v
         3YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422992; x=1770027792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YG5zC5nRKtuL2pWJfWd5vRZ0VVU+WDTQCf+ZvwSm3ng=;
        b=cgoCrELsvP/xOHCJD5C2TW3Z9BHKGf19rZpaFtR12xzmehN874VikKeUasMZ9PsHgX
         wLMaXRvEPMIc+YEacNVuLLdjL6rVIw/SAVybBgTV/1EyuOj1w8thdxciS/PzRwB6+dqA
         TA9C0OOujUVTHJfMjigzzQ5adMIwFPdN4Q2640KDHZha2NjfOLM38h0Pd83MLraGxsH0
         e9Z5QLPVNgDNpEqA9z0yLW9jS0EtSvRmw63aTVe+jMki8rSVs5zPSRiLTxNYhkdL+cFS
         k4JRLXEiKZoEMdGuUIpUQgsmdK3IwUnEpGq0J2QC1rp4OPybhx9LYLmzqrYcgESQcHq7
         b5GA==
X-Forwarded-Encrypted: i=1; AJvYcCVxpVG+EhHPObWM9pE1/cBfqidRozU1eqH5fthyYK7lmymVLTzlOwafIV+Tvvl4sOAP7EGGoSSqSALIFhJpn1yb@lists.infradead.org
X-Gm-Message-State: AOJu0YwwqIVHODKmVR/b8DOuxzZpIJ+BsaKATc1M5uHJRsv5zlCBfjMM
	oOwc/lx+WQYFct3Jg+i4hEw9QTNo8q+w9nJC8qaXfTmgMckdOpR895Tt
X-Gm-Gg: AZuq6aIP36U3SENO66d5f8Fk5+iZXT8N1vus6ihZ2GRjZzBoJbXq+FHxfR2GJDm66cm
	qO70WCLDMchwCaBOKbm5LX+GLjAb5LziXAKA+/7xK/ult0Px98VxteYwMi8WRSjheR3SYHj+SYo
	x842V0f4RHKc/verLRz5qqh1+UMw004P8pOmonVGIMgbSI4kv3Ywz1YFr9Ts8d/YnQw8MLDj1I9
	ysBFkb9N4VJ5ybdWRPmsxl6C3T0/iOWzwrSgl1B5YtV2+nJSovj7bMChAkDxJjY4Fk6y2mGcfOM
	4JqQN+xitWv90/niJfGy/L89RGd/Z+F85M4zCTquM3Jfj1p9LEln8S8Hjldp8WyeioCyyNi0OAy
	Nev4iV3kCwC3AyRQjcPkqFtw/UjggKw1DD0cHJcHiP6gYD7Rsroo6DBjqea+LyqjMhhQ+py2Kzy
	oQ/6KROlDGyL85PjB5ArgrCMtBhlr0Oa4c8VsSumnskUh0cduMRSOF+Fz97PsLuf3fBEEmZ+MW
X-Received: by 2002:a17:902:e5d0:b0:295:425a:350e with SMTP id d9443c01a7336-2a845240123mr34633815ad.8.1769422992175;
        Mon, 26 Jan 2026 02:23:12 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd776sm84958275ad.26.2026.01.26.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:23:11 -0800 (PST)
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
Subject: [PATCH net-next v9 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 26 Jan 2026 18:22:56 +0800
Message-ID: <20260126102257.2619862-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126102257.2619862-1-a0987203069@gmail.com>
References: <20260126102257.2619862-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_022313_294158_C3B99948 
X-CRM114-Status: UNSURE (   9.72  )
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
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 33 +++++++++++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 32 ++++++++++++++++++
 3 files changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..ee32cedf3d9b 100644
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
@@ -126,3 +128,34 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-handle = <&eth_phy0>;
+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-mode = "rmii";
+	phy-handle = <&eth_phy1>;
+	status = "okay";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..b1b3e45280d5 100644
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
@@ -129,3 +131,33 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-handle = <&eth_phy0>;
+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-handle = <&eth_phy1>;
+	status = "okay";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..477515ba9a80 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,37 @@ uart16: serial@40880000 {
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
+			status = "disabled";
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
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


