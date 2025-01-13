Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84900E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 06:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSQkyqkgqScHqXzJErwqcEAXUJOMjLKNEmybZd7oQIk=; b=kN284oQ5ZV65IbwBBwqj5r7e6I
	FtCnCnH/4sGBmYYM8UM+lO2LqzRpV8ez5P2ny1G9PX4alksxs9d+2ZUr9xlzMiDIOplWjSTiMSjk5
	QLVzUE4mo5o5hPCiX3S+lqt/b3g9OYlHBMiUVA2OGqm5xxIWhiI+72d2vsmm0dt++PsAm3TWd+MB5
	YyUh1GYZFifo33VZmPruu2dW8LLpGxA9ZpBZMNgsFOBsy0ZR48rb9smpSyCNzvjiIkMTrHza5ZjYH
	C7tIzQLN1sU+uojttMDIn81VDC6NtlW9y0AaWMnX2PZnEQoNwui4YWYY28ffibFCtblRYqzerkqnV
	MgXCJExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXDUj-0000000465g-4Bi8;
	Mon, 13 Jan 2025 06:00:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXDR1-000000045U3-0s0Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 05:56:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso5193980a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 21:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736747782; x=1737352582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSQkyqkgqScHqXzJErwqcEAXUJOMjLKNEmybZd7oQIk=;
        b=Y35dI1TyJ94AwHzcxOHXZjKqlQviZ5ygdLlHahiCHhnsiP1gO9NnpCg+QqpNO7GJ2W
         eypl6kunPL9n64kTbGHChEpnsM5Ym82WuRTqMO7OGNLNuE9OqyI26wji74bdep6JL9vC
         Jx9hEl58RJFtrwmaInF1teFeM9+3GgqLvXVI3r5eOt2qiSqV3h1faWU6F2miwEvVPSga
         Qg5vX1++17mkm/3YElj0aoAT0lbmMPzIyLyFfGoarM3yXNJt4jM3nc5B9hbX4Lo9MNRJ
         9zattgnv0CC2F+Syf9l6o5MHyxgbrWJ0T2rymPmMgRpO+QP3WHC36wB20dNE+bcaVvN4
         1vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736747782; x=1737352582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSQkyqkgqScHqXzJErwqcEAXUJOMjLKNEmybZd7oQIk=;
        b=lShUrQ5tKevg00pwsEt0dZt8REvuJcw32YWMXJjn55Hhc3+GB9KdW+RDOaulATIf01
         EhDedNSg21GPgVl0BhrnU1RCJ4xNuPlgEb2LWfMlFwHYa7o9emwstPdGy5aQlf3MFzEl
         RLeJXncw/Lu6kZvwZZvngxSxHjBmVMOQwV1tdEjNR6yG59pfvIzKFnQNU59av26Zr/79
         2hsNnL7m/Rlhvc7AUNeLavOboLWXPzmnIVBQnPXwNBRjd2ehrvMeEaVUPAlmSSKW6pER
         jTSqcfTr4bU7ZAIRRGEKeTvDgBHN28W4cmG3F1EnEkqhh17nvEWrFhU63RbYcg4r0faC
         mMgA==
X-Forwarded-Encrypted: i=1; AJvYcCWdktoMJqihToPsTWRz1NhwQZTl7g0m7x9r5VB9eOxW4qica6cr3tcMU2wFHULiEk76Wz3x+7cUXNYbCzQtQRpn@lists.infradead.org
X-Gm-Message-State: AOJu0YyG+GbTJ/0VuCpT+KC/mpA3W2k6Vunw5yufAmVwlszbEoI2RjAA
	YPU8mUNz/zeSM4KKoqqStZ1EWUWzeASV2nXdV3AiihYtg8uLnbJx
X-Gm-Gg: ASbGncvs8Y1/uQBMnD9dKxPkiUyhDMQMAhOujh/iRYWkDg39s7mtZVM7nyblBLA88Hv
	EFiKLCr9UiB2vo+r/11byXW6SqzaB73bXLrxTey7weAR2dJzUk8vdobdV249qXsp02OBCD6KmdD
	A7hHnrZPM/1IY2NXigl+m8dRrfYJZbtrluXEXEyUNjcqSOqEU3ZG4K5diAXTgEjIvszHfYL9rEa
	KSClyA/Qy4QPYhP2UL3bYn8bEHO0HYjbMAb+Yd/ndSjrviW1Tu9CA2JevmAEpZCja6ffL0XH/0k
	ecJUb7Sp459h4DNxalaGLg==
X-Google-Smtp-Source: AGHT+IGK0pCUlGTYvHgXQyXKxRtr0riStVYSpTVlyPsCu8rNr3XTWRKoYOATBlijrdcahHUK+OCu1w==
X-Received: by 2002:a17:90b:224a:b0:2ee:49c4:4a7c with SMTP id 98e67ed59e1d1-2f548ec8a4emr31105280a91.18.1736747782317;
        Sun, 12 Jan 2025 21:56:22 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55942188csm7768806a91.23.2025.01.12.21.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 21:56:21 -0800 (PST)
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
Subject: [PATCH net-next v7 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 13 Jan 2025 13:54:33 +0800
Message-Id: <20250113055434.3377508-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113055434.3377508-1-a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_215623_254575_64E6416E 
X-CRM114-Status: GOOD (  10.32  )
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
two RGMII interfaces for SOM board, and one RGMII and one RMII interface for IoT board.

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


