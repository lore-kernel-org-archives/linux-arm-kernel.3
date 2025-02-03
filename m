Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED935C02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 05:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31XzgfEM+1LFHGxho2u9u4JYE7XQW6zgDynf3Dbgkps=; b=M/HcZTPQh7zlw07Mn575DvstxV
	WTc/WY8ab9ldPn75u4GiEkXCuN1B1ZDhLnueuYJrV4jTmR5OFmV+c0OAbA9ReQ7Qu+3uEk+nQTeBc
	dbROHRGfcDoL4ku+pyl2NDjBKqGjS/WZjf8EqAkNUPKn94vyQwjptJGqgntYyAGiqqn9B3mM/lzP8
	B5BU7anExsSE5J8+pdkKMEi+tpsJuNUnZnzQvIyrtwliyatoidVxEsN/apDsyMRgh3Bf/RSMHDvh4
	OfRbjX7jpAa4CE/rqicflzkRKkVA5oYZH1wszgxegn6Tj0kqfZz5oe0sfDJmygfFgAsSMIklzRCCi
	+ZgeEWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepJN-0000000EbkG-0ro6;
	Mon, 03 Feb 2025 05:47:57 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepFR-0000000EbAW-0uNI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 05:43:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ee74291415so5020855a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 21:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738561432; x=1739166232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31XzgfEM+1LFHGxho2u9u4JYE7XQW6zgDynf3Dbgkps=;
        b=XKrs91r8OmxpUvH145z4A9gQTsccsDiH4Ng5TBgUjuK+YqkhPuN5EKwiDOh5KUuz2U
         FZqZtnOoBRSpX2CJUjAOAMElb9UOC2y0DQvBI9dsTWjg301mQJ//OfdmHKEsGGB6aVMQ
         tNsrlwSSOq9KtcBK2cY7jNEmSJJvXC7jRpY0X/ZyTwbSbgPu45qjpQrKpmnVDqdWX8Xg
         CCj8PWlxmoUWKy1hzgOQ1ezs3eAup6dfaDBPh7buuZlV9hYhOOGWJfE83n9OZFEfhp6Y
         I5yxlWIvuCGGZCOVoP0ceZ6lUPsIMz8yNuABXgnN+uwPhjzy7/LuOjqr+9/Obpj+aQj/
         MFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561432; x=1739166232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31XzgfEM+1LFHGxho2u9u4JYE7XQW6zgDynf3Dbgkps=;
        b=fDYnK51QCv50RisLS3bGC1g3T3osETMj+0sX6qbzy0sqtM6yD0Vi71EexFPjcCOZ/6
         ZZVAswXYJlokm/1P/0UqEeBXrIcY3siSUfhFv6bk+DDyj9QPgzzhVF+cj2+1RvghAwnS
         eo8Z2bxSobm+3r+mpQevDNZI6jqiY68MjtXT81gfpVq31zm+0vRSE/t1K0PThGGuomUX
         pzm7RK69iLaAde/0JDleGV654In2JvXn5fG9+kRb20meoHQSDu9bS7dMWSYa9y7LJ6Fc
         EJ9swkxDr/8/zhMdbyYWLFhuPjREARZBV9C5dP2x3wDTuCjE7eFsnTJm3T93ENjTwc7p
         Tqcw==
X-Forwarded-Encrypted: i=1; AJvYcCWkL7ikbunUlhuXXvkYYKJiznUJ8rg3M6brnmSixrSExkTLVemA9y0c0rIsU8l5sL/7FPFtJgpAw6a8RAqA+xbl@lists.infradead.org
X-Gm-Message-State: AOJu0YwW7T6/bMO0g0i6AKTbyQ+ppVDXqU59Bf+d+sODPsoesbftiCQz
	2p4qDUbo5jXRRDuJyWVDrHMLHS0kq4L6epMtUzKV1wA9bV03vKiv
X-Gm-Gg: ASbGncsQQAQDTPFoMRiyY/TqIGCm/xy2skqEgZMFF38DfxPC249kDg3HOkY9QanTTXi
	2oGssGbpUDfqK7KyxoGJXF2yvZXzy7bUVD4fQMGdRNdcQXUDu4vspW2BIcart5cCo60hZ6bGlRm
	w+LPUTBZG4TxaJljbOAk+nQ1MdKYlU8IYTQY3f6unEy9E6TTxIbYJYM2zis79Gc41VvIvxQNZgo
	YCn3tc71uadst49CnPwfJ6jJoBUwAbxS2Kh7y7t+wHru9/JaQQH3yQILiZD9duxWOKYbntxne4z
	2zJy9Ns1BwESHcTS6CPSEejV70gUDSq0rT9sxEXZH5oHVcaONBN0ATeJ
X-Google-Smtp-Source: AGHT+IEebl6qnAhUV7DcuC2+Gaci6mLgBlvTtBDmEY8dNeLsOpTRgjxFkU8HCj/XYZqe5f2xfVUW6w==
X-Received: by 2002:a17:90b:3a4b:b0:2ee:bbd8:2b9d with SMTP id 98e67ed59e1d1-2f83ac87b59mr25632915a91.34.1738561432261;
        Sun, 02 Feb 2025 21:43:52 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 21:43:52 -0800 (PST)
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
Subject: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon,  3 Feb 2025 13:41:59 +0800
Message-Id: <20250203054200.21977-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_214353_268198_43C7AB7F 
X-CRM114-Status: GOOD (  10.16  )
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


