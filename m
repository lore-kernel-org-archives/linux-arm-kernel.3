Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DD0C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjG/L6vRX47pDzFHeJpXAhEEn3GJ7KDceCdHzawl8to=; b=gHy+9IthqeKaXeI9Nf2NVUoi+K
	7mMOSKZGp/2QhfQuhxSyU2Cw0hi10QLpLbUHLVoJxTLpiRkwY1/JZCd+pBgwK/HS4dRMEFIHAm1od
	j8pDm+3DZdGHcNYs/cZzhx5OJ4h+IRl+SewBx2nPTL+jQ9qJOycvhgNIxa8GX4rHxZ8P7U3mnuv1X
	JRenbNaHDTyQ2DD1kWK5dlz+mDR56gJ24c8LUSbgrFZoo4P7ZiveEB1IJ5GohhrcT2qP6wBGKmi8g
	MRdDQ8m8yDBuQa4ivW+OaN2tEMtmoUm2I7cpGlKedUHGHh/3D64KExIXNpB3itq+lxpgNz847fyeO
	2sH8zKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzl-00000007QCO-3YdI;
	Fri, 07 Aug 2026 08:32:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzk-00000007QBs-1pGw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=CjG/L6vRX47pDzFHeJpXAhEEn3GJ7KDceCdHzawl8to=; b=Wcq5NiuloAaVG+8xwhnU83wBbI
	YHywq9kzP++9o/Z7KVZSpjpBZXibmybVcSV+C7UnXnoJGrJK7S0P/8QawwrulpUMVPMaM8PAdRZkk
	97oGIi4Ax0tCmIzwseKQGvEG6PWX0OthXlqqoLXWwzNvGscUCRFvhasI+w2lnsyPvE9nPdcKG4h35
	3kowlc+TEDAXCxuAxNG8UOgSd7G4LRYmCpKCcZCKSAUH0l9sVKxXtdUzDDHROX1o0MvXZj8IjtyxR
	rYC0JCzNKoPXcVbpNPbjoIE6DUAiWtTjOaTEiDXgQLS7+FMEfxDzrv2xOOAH98DUoT7ZHhlSqb1oO
	p/4jbGtA==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFzg-0000000CCRz-2dKx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:31:59 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso2199875a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091514; x=1786696314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CjG/L6vRX47pDzFHeJpXAhEEn3GJ7KDceCdHzawl8to=;
        b=ZpYW5a2LzmSwv1K3A2+x2I4rcYF7U3pfWm0PqPiJW04VcGzdDZY1G9+VIcGI8xoBXu
         vAenx3Vgi2MnNBq+oRy+Jtht1pHBaD0l0+/0WapAb7B04Q4L3tDeymAkN6PlQz6b9MC0
         DqM6trF/J+n55pCpMUezaUtb7Nt+g1LoKlfqnOGbhYqGH4lnq38Tkve89p5znQoU0n8p
         RXaDCcD8tpBOD428nE4MPAOZKOGQXKEQQnJKfG3k3zwtenQCjY8ye1GqesRfflPc/JJg
         G/j/UXh+jZ5bm3xIIAjMYjpiEIrSvKeABO36HB3JxicsfYMQKeXqPBBhmFuB4JV1lZsf
         5FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091514; x=1786696314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CjG/L6vRX47pDzFHeJpXAhEEn3GJ7KDceCdHzawl8to=;
        b=r8GoPV17CU90/BBb0yRvocn0el8fucm2iWbsXZfhTis9GD4cf32jkvh2+eipKLi3Cl
         tOhq+5JDXQYO3KYmVshagpUVb+MDjXpi57v5NqMigwGE2v9LwF8aud0bFmAoaxMbng0U
         mBccV8zVlwdODjq4o3ruoUDBUzuHBt5/CSCBDw+qs2lZaa1xcILDJ1xqKN8D+/t54iXo
         czb78zfJFiP+NSJWsyYNBmAA3Y6jIizuPvJ7sdwMoKe9TRULE41/EtilgmpPT5n2v+vS
         sP/4OXwS5BWHB2OVSzeMWzI87qYUYLxOavvoxX39PtOsTRi6WaBlpJYEg8fQ1RAuOwTC
         dLFg==
X-Forwarded-Encrypted: i=1; AHgh+RoCJBICMq+GU7ly2aJ7ILlErbeTMfKHNgMppaOUXEG9JlChh0AYM2u3Izf2k1BSkHwHOriUXW+vaKiSE7jnXweS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0ZuoZO2MKKqjh9jSXrnciPk9HXXsY2YGvXrUJI4FsJmOKcy64
	ygu/Hrv3T9NHAmn9AiNJb2Kfalez9pq0L+zTL5qD8+j4lP8x/B4p4yUX
X-Gm-Gg: AR+sD12Orx0UN+hn0R5tsUBzZYVlyXaRAYk2jgwkKJPvzt2ZzxMkLqPrrXlja/AmR2Y
	kDV5TCR/O/HeT3iWpVmoFD5hhdrDkKqD3kv0gg68rLGn2GBCbvQ1/sRiueBQCKZzAUbQOEQZBS0
	N4o1cVdG1GxSOTcQGT/GD6VQuQEdvekGzslJuJs3FNB1lz3GFrcURJOl8NcaRQfDDX3WL2kMpYr
	oitFd5VvyLQoB9GF3a1d2Xptx0ymYMLK4nNn/KXcJsw6XSNIt7+x5Qo6zbt88qyyiAMl8k+qKMp
	97I2AM/FN16oTwLRBfeo0+n/VHKlbLU8KdOPx/MhTuKbrbzUVrcH53Dzj/KWYAvVHbMctVFPqV+
	tk5RsmpDD8LIliUV08+JfZAhNUgvMyEWhOuQuIY6I4XDWjsADGkTJWkPqbgfwPwWKhjcgdFOVop
	wrl5VvJ6VxmE3zQhxLgXXhSKKrRZ6Vvt9r9yrvnPDOUU2BT/xiIP1iUdSQNP1iX0l75SmNQLXPq
	+bcnMaxdaK/kUK2Mn8J5zUuXJOosVEG6QVPJ5mD7l9mQ6n/tw==
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr22800889b3a.19.1786091514166;
        Fri, 07 Aug 2026 01:31:54 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:31:53 -0700 (PDT)
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
Subject: [PATCH v3 1/5] ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
Date: Fri,  7 Aug 2026 16:34:04 +0800
Message-ID: <20260807083415.672008-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093157_694424_0CF1F87C 
X-CRM114-Status: GOOD (  11.58  )
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

Add several GPIO expanders on the switch board for NIC, PEX, and cable
presence monitoring. Due to a design change, ioexp0 (0x20) now
aggregates interrupts from the downstream expanders (0x21-0x27) onto a
single sgpiom0 line, reducing the number of sideband interrupt pins
required.

The new nodes provide:
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


