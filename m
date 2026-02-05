Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2012FEA7950
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 01:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNKXP9GpRqv+eSR2XeMEVjl61X03fT0QbLuz4FZVIqk=; b=3kuXwp0q857NjIqGL9jtVIvVhi
	Ei1OdApMc81fY+j4viyNQbYNhiF9pffXguFwsZmBAIY8OW/euehydP65WXrax9f9WIZ7vtrU5mYBE
	EvKd0+kbfZwLav4vL2+p95+FW99nOPqF4OUZrPDQ2917Usvur9A2TX7Yp1n6/uzDzDbu/OPVWeAME
	U6+OM6I7lw2BIpBnZaRIslnLrkUA4oTLrLTeEoe5+VDXJcEoIk9j/gmcAKlZJbl306bRH8zr24MKL
	oZUSnAPGDRA5ur1XFZEzCkdBox+xLWJwieawHp5YZHsYlVx5hyJmUoTdZUPTtBOhuQPT9sEcAKI+P
	guCOMbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoM3-00000009H1N-2vZY;
	Thu, 05 Feb 2026 01:40:23 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoM1-00000009H0Q-09N5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 01:40:22 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso945883a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 17:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770255620; x=1770860420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNKXP9GpRqv+eSR2XeMEVjl61X03fT0QbLuz4FZVIqk=;
        b=B/oHLPj6QcA8cPheKwFVEeRwNLAfN/nLgL2/e+TnCDLLJDsj+Bbji/3MQNhhI48EJK
         4g0cqvRqZHXpVv9fmsOXI9SdB/kItEGRFjCHQ7AJhj8EMe8Dln/koorILBl1Bwilhg82
         uVc7445jvjXgf3sYxic2CmmNTnNeJn1uAGKgbvkNi98dgnhfJ24UIzQd5yQBTjmOdoWK
         a/Ph73EyjX9PiMVdPxpxFs90f/otSH7UOi7a6Yy8vF8MPLr3PP9OwjMKNtv8hhJj0gUU
         /4xpD2xcWHUIZ52ZGPGvq+B1S2T7/aJsPA5ZZXn513adMxtBBX1JJMyVLZA9ETACcPSg
         798Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770255620; x=1770860420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CNKXP9GpRqv+eSR2XeMEVjl61X03fT0QbLuz4FZVIqk=;
        b=qxMogBP2V4V9kEydpLeBd6dcaJeHmnojf3uUmdcfBRG1dFESQ6GoNRy4GDfjQ1USzV
         T9bFvNnhZ4ZuhlGLpyYCPN3gJZtCScvTQxdZh05IIOduzA6keZDXogKlkJ3bL7xy10n3
         BQO2g+gIhM+wldd+whpRJ/P5ifp6lBlUMkHOUzl1WIvHGMPzLBPVBE2o8YroFPIgvBPI
         M13X5wavZ/qXj4qRNNUfxX1CF7y1Q0EcrUAV3QAHeHoUa5eHjS4aembK/0KKlh5n+1Be
         OdHs8jg0r9wwZKOTKR1LT/ZC23kGYEUd6olyiYum87wJKI5IWZVz9cwVI10+eRO+uTsI
         Yfmg==
X-Forwarded-Encrypted: i=1; AJvYcCUGkiGjOURl3ayl5FcPBMh5VfqS7yeNmDkGU4I7nYhVtLKkUkEvgTueOmwV4xkjS6huDs6eR7KjpCZ/k/i/hYIA@lists.infradead.org
X-Gm-Message-State: AOJu0YztosmdxorDFyn9BL5Bfs+KKqZ6G6F4xCW+ENaiL9wLGFu8hheo
	TSEFncWu3UYPDglxaknMLy+f1GAlM+v79XdVgGt+YZDkNRCbP+y6LXRj
X-Gm-Gg: AZuq6aIz4mv3RVuIqyCK7OjQvAPcJB3yMSVxEiB9OErtNxH8DFRnGkn2i6Ma4wh/lei
	/OsAhSoPX3JITgvbeu5ECzg8BRBo7npIQt2gjRYkabB9kOLtCzI/4F38PPVp461EFT+IdvncChT
	VVGOFMRFcegyIxu4fOuGL59tGPczienB42mOYviTrz/hVXCJTS6FPmD21vvQu00I1u9AleT2cqd
	vvLH7AOOgLPk6okUf3wQKwG1cLmIjUCoSYruDB5R3RI7LyC+F0BFTSJSe+OgZxyA79pdqEgaVt3
	+k/j0lnVGgxfG3Bhqh9wxFjEms7UdUcIYelgA4TvAAktHnjLle0cDdtWU4A9M8WrdQJ6/U+XH+3
	Yi4SfSzRFqPDdv9+t0Qj7ncgbpQ3SHfMVguNfjsieP9zc6Ne5t1RAVZv0k+ysc9Z09z+vDRKnKU
	wgyaIX3QoW6vPelEdB9XWbzHCFogKWUjjfkid5QFejTx65hbS/wNDZqvPyLiOYX6icGnN2NJbR
X-Received: by 2002:a17:90b:3145:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-3549be5a5f5mr861415a91.5.1770255619864;
        Wed, 04 Feb 2026 17:40:19 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c487a7bsm673571a91.16.2026.02.04.17.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 17:40:19 -0800 (PST)
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
Subject: [PATCH net-next v11 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Thu,  5 Feb 2026 09:40:04 +0800
Message-ID: <20260205014006.735408-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205014006.735408-1-a0987203069@gmail.com>
References: <20260205014006.735408-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_174021_078716_9A153AEE 
X-CRM114-Status: GOOD (  10.06  )
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
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 25 +++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 24 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 44 +++++++++++++++++++
 3 files changed, 93 insertions(+)

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
index e51b98f5bdce..a39c3640b322 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,49 @@ uart16: serial@40880000 {
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
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
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


