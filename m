Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60146F8FA72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maE5jQDJwsycLww5UnLtB8sLxR1IdmgJ/9+EbDBJAp4=; b=n3uY8sKVYY/EwzYMGsqHyeEN1w
	QVSc6+He3zWo4s2bZhD1WGIkkRRT6LzM6huK6yyuBEx7DDGFbLiPvAXU7KEzX0VDuCJvjmP/dQmV1
	F0QvDgFzh7Nw1gG5i08vWWamHvi53FjbSsGtas5pqeh/NHpsxunHGFWxHltGJf6aCvyDy/JcwpsR5
	pi5zKlWNb9vkIpXTiwPlyX0FAnFRKcXgTVPoFmojUvf2tg5R75isMCt/25qEpc+Zr7mcui+V5fZ62
	EqAnRjPoRsZU2U2wEHanTJOFzjzvJJOR3Z598LdD33iDMEvYScL5GGmb6LG9RLt99uDNCUzvI2bFx
	+pGo8K0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAlf-00000008cxT-0g7m;
	Tue, 21 Apr 2026 13:03:55 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAlc-00000008cw3-0Ypc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 13:03:53 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c7980c060cfso1167754a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776776631; x=1777381431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maE5jQDJwsycLww5UnLtB8sLxR1IdmgJ/9+EbDBJAp4=;
        b=GkmU2aeLaV7zbONY83oyN4JoMPJm1EUwCZeMGRfTF4F47Y9FqA3nzs+0wJ0H9sl1jJ
         RmBkPU6uDkwBjHWWw+enN6DxcQR4thasqKpOQKGV94qB+bDjNNrojvuHRrVRZywGKb1z
         +B+NzrNDHQ8vfkiEW7QRX+JxcPGTHgwSt6Y5xJ13ikGcy8WdwxfHjZUKq9OWNeeTEbMo
         CHXHZf3bKYo0MVHC+4900Dy6grwB1aEs6FuBvupIyISxRrQDZHy8u6qdM5UrKJR4FsM1
         UkTP5IHPVk/kBSBJooqySl7C7M50mGsNCwLMPXcXUeQ6KkweIogqUjEvwnkJjsoPSQXM
         XpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776631; x=1777381431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=maE5jQDJwsycLww5UnLtB8sLxR1IdmgJ/9+EbDBJAp4=;
        b=OrAQtlY2BgQvEhyph+YtsLVIEcqcZmhgtTYZf3FitUiQqfQFl6FFnQL6x/NEf/0iFO
         bxBq49np3yVUa6vPI2lCZzw8TKA7qdLAQILOPgllhz/RQwCwt4V9JtAky+wIxfqoCEv2
         biFnNF3vnR4ltpu/hyy+SLf7OKmqBmofvHD19RN9r7CgYUlh9oMmmvxx7Q+t1PisYzb+
         YU+LndJ2PP38rTwW1yiBxd+kfCnBSfSax0994tXsYE7KTbVEvUsOqp7QL6pAJ+xWyc99
         a7AhGtkdpMSPzuZo57jTmYkeKjYITFRqdApmhxmX8o4cdxKlwYExA5fx5SM40KNznxPk
         Jmtg==
X-Forwarded-Encrypted: i=1; AFNElJ9dJqJSQbkwmclpW1wvRF7sv1H1pPpwS1FG++mY0Qcba9H0b/o4VgZQtpEIpN+kz2RqX7nk2/N3Y6Jkq6afoh9d@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4RrP8fi4NTGU/aidiITUAFFlC+jFUtL1FMc7LlGvZfzWqptwR
	+2Ww+bUklOICmfM7IGfyp1oJkgNk1S5OpGJifHJbqEHzuY0oeNJq5nen
X-Gm-Gg: AeBDiespyZ0S2zRK+qacX3cZKJ9z63ZYjRgHJ3pYOHtUd4ESHTzrvkqD2dKvkikG60p
	bUVBHKJ1gD3sslBPaDKf5frIQ93J5aGhLeGw3N01GYPPRMydSAgDfjuSolx4PHXgtpl1i4A5DZP
	9L8Rp3S9a30R4vHP5+wuVH/QoF1kBVOC4E1EmwtUx5z+/ls5ujp0+H64RjGoRgLDolWXZOdDTvM
	SPIJDjJfFq6jmJLrrA0scai92nZ/DrOdKYUQlhG/g5QRS4lH/iEwcVwWWpKiiNJ//z5Azkpmej0
	TOVHIJTETBFgYDfgCzcjXeT8ZJifiuJjAf8XHULtTqO0q5u9TUEdkEoCq9YdsD6LU6efSmGgv5Z
	avKgdIZltjbpnA3SaPD3oCilyN9I9Bi1k/pl3RLewF7V8Ycj4ei+aklPUuF+LJ9WitljD+ubnyI
	Z6p3ouhBphJ+fppy++CStS8TL0eDBGCCzYl9KeVFtemh12jnBrVOdZmeiksULDNPww69UqbMqGT
	ZLX2chTesLapuoG6J/sGro=
X-Received: by 2002:a05:6a20:9146:b0:3a2:dbaa:82ee with SMTP id adf61e73a8af0-3a2dbaa8538mr5955384637.9.1776776631018;
        Tue, 21 Apr 2026 06:03:51 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm14456484b3a.3.2026.04.21.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:03:50 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
Date: Tue, 21 Apr 2026 21:03:41 +0800
Message-ID: <20260421130344.2751662-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260421130344.2751662-1-fredchen.openbmc@gmail.com>
References: <20260421130344.2751662-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_060352_184011_CA932390 
X-CRM114-Status: GOOD (  11.59  )
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

Add several GPIO expanders to the Santabarbara platform, with ioexp0
(0x20) configured to aggregate interrupt signals from downstream
expanders to optimize sideband pin usage.

The new GPIO nodes provide support for:
- NIC1-4 power good monitoring, reset control, and fault detection
- Switch PEX power good signals and hardware SKU/Revision IDs
- Cable presence detection and selection for four SPI flashes
- System power fault alert via SGPIO and E1S GPIO expander interrupt

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed-bmc-facebook-santabarbara.dts      | 125 +++++++++++++++++-
 1 file changed, 124 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 0a3e2e241063..2a822e38f091 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -616,6 +616,8 @@ gpio@74 {
 				reg = <0x74>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <146 IRQ_TYPE_LEVEL_LOW>;
 				gpio-line-names =
 					"P12V_E1S_ADC_ALERT","BUFF0_100M_LOSB_PLD",
 					"E1S_BP_SKU_ID0","E1S_BP_SKU_ID1",
@@ -1335,6 +1337,112 @@ eeprom@50 {
 &i2c12 {
 	status = "okay";
 
+	ioexp0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <148 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"IOEXP_21h_INT_N","IOEXP_22h_INT_N",
+			"IOEXP_23h_INT_N","IOEXP_24h_INT_N",
+			"IOEXP_25h_INT_N","IOEXP_26h_INT_N",
+			"IOEXP_27h_INT_N","SWB_PWR_FAULT_N",
+			"","","","",
+			"","","","";
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PDB_PRSNT_J1_N","PDB_PRSNT_J2_N",
+			"PRSNT_NIC1_N","PRSNT_NIC2_N",
+			"PRSNT_NIC3_N","PRSNT_NIC4_N",
+			"","",
+			"CBL_PRSNT_MCIO_0_N","CBL_PRSNT_MCIO_1_N",
+			"CBL_PRSNT_MCIO_2_N","CBL_PRSNT_MCIO_3_N",
+			"","","","";
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"SWB_PWRGD_P3V3_AUX","SWB_PWRGD_P1V8_PEX",
+			"SWB_PWRGD_P1V8_AUX","SWB_PWRGD_P5V",
+			"SWB_PWRGD_P1V5_PEX","SWB_PWRGD_P1V2_PEX",
+			"SWB_PWRGD_P0V895_PEX","SWB_PWRGD_P0V81_PEX_0",
+			"SWB_PWRGD_P0V81_PEX_1","SWB_PWRGD_P0V81_REFCLK",
+			"SWB_PWRGD_MODULE","",
+			"","","","";
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"RST_PERST_NIC1_N","RST_PERST_NIC2_N",
+			"RST_PERST_NIC3_N","RST_PERST_NIC4_N",
+			"RST_PERST_MCIO_0_N","RST_PERST_MCIO_1_N",
+			"RST_PERST_MCIO_2_N","RST_PERST_MCIO_3_N",
+			"FM_P3V3_NIC1_FAULT_N","FM_P3V3_NIC2_FAULT_N",
+			"FM_P3V3_NIC3_FAULT_N","FM_P3V3_NIC4_FAULT_N",
+			"PWRGD_P12V_NIC1","PWRGD_P12V_NIC2",
+			"PWRGD_P12V_NIC3","PWRGD_P12V_NIC4";
+	};
+
+	gpio@25 {
+		compatible = "nxp,pca9555";
+		reg = <0x25>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"NIC1_MAIN_R_PWR_EN","NIC2_MAIN_R_PWR_EN",
+			"NIC3_MAIN_R_PWR_EN","NIC4_MAIN_R_PWR_EN",
+			"FM_PLD_NIC1_AUX_PWR_EN","FM_PLD_NIC2_AUX_PWR_EN",
+			"FM_PLD_NIC3_AUX_PWR_EN","FM_PLD_NIC4_AUX_PWR_EN",
+			"PWRGD_NIC1","PWRGD_NIC2",
+			"PWRGD_NIC3","PWRGD_NIC4",
+			"PWRGD_P3V3_NIC1","PWRGD_P3V3_NIC2",
+			"PWRGD_P3V3_NIC3","PWRGD_P3V3_NIC4";
+	};
+
+	gpio@26 {
+		compatible = "nxp,pca9555";
+		reg = <0x26>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"SWB_SKU_ID_0","SWB_SKU_ID_1",
+			"SWB_SKU_ID_2","SWB_SKU_ID_3",
+			"SWB_REV_ID_0","SWB_REV_ID_1",
+			"SWB_REV_ID_2","",
+			"RST_PLD_PEX_PERST_N","CPLD_MB_PWR_EN",
+			"RST_PERST_SWB_R_N","SWB_LEAK_DETECT",
+			"PEX_SYS_ERR_FPGA","PRSNT_SWB_LEAK_CABLE_N",
+			"","";
+	};
+
 	gpio@27 {
 		compatible = "nxp,pca9555";
 		reg = <0x27>;
@@ -1349,6 +1457,21 @@ gpio@27 {
 			"SPI_MUX_SEL","","","";
 	};
 
+	gpio@28 {
+		compatible = "nxp,pca9555";
+		reg = <0x28>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"SCO_UART_MUX_SEL0","SCO_UART_MUX_SEL1",
+			"SPI_PROG_PL12_SEL","SPI_PROG_PL34_SEL",
+			"","","","",
+			"I3C_HUB_3_MUX_SEL_PLD","",
+			"SPI_PROG_PL12_EN_N","SPI_PROG_PL34_EN_N",
+			"SCO1_SPI_SEL","SCO2_SPI_SEL",
+			"SCO3_SPI_SEL","SCO4_SPI_SEL";
+	};
+
 	// SWB FRU
 	eeprom@52 {
 		compatible = "atmel,24c64";
@@ -1776,7 +1899,7 @@ &sgpiom0 {
 	"MB_SKU_ID_1","PASSWORD_CLEAR",
 	"MB_SKU_ID_2","",
 	"MB_SKU_ID_3","",
-	"","BIOS_DEBUG_MODE",
+	"SYS_PWR_FAULT_ALERT","BIOS_DEBUG_MODE",
 	/*H0-H3 line 112-119*/
 	"FM_IOEXP_U538_INT_N","",
 	"FM_IOEXP_U539_INT_N","FM_MODULE_PWR_EN_N_1B",
-- 
2.52.0


