Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E737D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGC6TPqRGXu1mF5aeFEhak+3rB765Th2HjWB1mjw0KQ=; b=Aj6RFfb0iwdzkXWdMGzMBbQwRF
	9r17Tjiht0S+IL9GbMGe3wkeAM/SRNKDO9sBkEKinfjhnXdanmHQ8JEHUh10USNOE4XKNtzL5vve9
	41Qwkx9ZrW8FlTGe/Yk0EH6YgOnv8i3nSqEqPF7FVTiMHed29MRuvgIMqq8H06nHY591HwarhzL9I
	u0zRCo3YcCBhdUrSQ/EwedIkBddDOG/MqhqrEtdgxlDLwF4TZXkztNFExO81QyI4246ExXcFFyO16
	Orvg1nd/+EzEBZws8edoT5f6/LsrL0sdB+/GWNcYq5LaRFXD6zRfCpTTxsXa7Xiw9lmg80XMM6HnY
	7eStbJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8c2I-00000002QTK-2Nn5;
	Wed, 06 Nov 2024 09:09:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8but-00000002O6z-0maP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:01:32 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20cdbe608b3so64287755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730883690; x=1731488490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGC6TPqRGXu1mF5aeFEhak+3rB765Th2HjWB1mjw0KQ=;
        b=jpU6h8yG50WsGLuIATVOsPQPsZCEuHkWH4CLpRqVJqJX4hILhiPl5Riu2DqxgHfSRX
         V9hyn5RFPwFhLLYkpvc1RojY+roDs6GUuxXK/sKyDvm9d4h1ZcHXoqjEfLbnfOFy6h13
         5rhmgaWr2CIjQpE5SbPOo8TLRxl3CoGJbEZT6zwMhgFhu7n7Zxwh+iPTdFjPaAN9mWjf
         xEQOSD6A2qF6pxL1pLnrjlk/UXaaGgj6eKIr5al4+htgHu37wsruQwjWinQGIuY7umFB
         nkGjCUVkK157bdGA4BsfrfA65AYNkND05f+vhS6e9Ec5gDxJ8Yq6w/ZSuF+Qf4jJysCI
         Ap1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883690; x=1731488490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGC6TPqRGXu1mF5aeFEhak+3rB765Th2HjWB1mjw0KQ=;
        b=LxvEt5Pz7WyPl/juV6W7RR5kE38moO6fhWdSKCfQ4U8oGNr7GyKuI7dJefdVQBWXH9
         yEG8Og3+BsZ+cmizLE/Yf+puoOtfj2FCfkquAl2+zuXN0f4rDfP1SX2szeXGeBqPqWuj
         RVZnCyIQkeU9F1U9cYPmP9tS3LoHWmqiTYX0Ha8y27eoZaxSLh81LV3ALKmjk15tLKz1
         U7OnIKJfkP0pJPPF738Vd0huFyDBYnXtr6qLzXPEsj9JJAMxm6L4lOdmxQzughoXiO7Z
         QAmOtvyVN3HKDZunuBx0CKeRGvTMCNf9ZIedDLCvFUombg0S5UrRa7iCkaGzt4IGA1kr
         XG8g==
X-Forwarded-Encrypted: i=1; AJvYcCUvGIl1vjMFyEOqomUHNLkJSuKJ8vdUP4AP6qDL9cYpv35KzhF0aHeocH0sovB0AfKlsXsHoUc62xJMIRMUlaAF@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ+7crdkH1uCazbUCnylzeEioqCBXqM+RmI5Geuue2z9S0mRsA
	iiyzmmvqU0uoIZ7Zg13AN8xkWqpxOhzkZ4AeLH8wNK/Z6SG/NVt2
X-Google-Smtp-Source: AGHT+IEERyee8yuMkqt0ER6m9QzckotlvCf7D5ZemQxV4YVnYPTWKduYZ7ohuFoSiKwCKIa+Cet3hw==
X-Received: by 2002:a17:902:dace:b0:20c:5cdd:a91 with SMTP id d9443c01a7336-210f76d6870mr381219045ad.41.1730883689798;
        Wed, 06 Nov 2024 01:01:29 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d380fsm91317665ad.240.2024.11.06.01.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:01:29 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 06 Nov 2024 16:58:52 +0800
Subject: [PATCH 2/2] ARM: dts: aspeed: catalina: add hdd board cpld ioexp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-catalina-cpld-ioexp-update-v1-2-3437bcfcb608@gmail.com>
References: <20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
In-Reply-To: <20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Potin Lai <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730883681; l=2784;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=Ma7zHm/VTawO0uhZBJJdi+x5g2IFHZE6w9ObR9Dz8mM=;
 b=9Mfn75WH2EHATjpkT8yHXktIYSE/oom0no6vIbpn29BER7AETsF/1yGpaSr1mOLp8P1Z7Jnx7
 BC/PFZV9qOlBWzy0AXX0GZ8TtazizPmWZFVoFLekpIsrhZ5YsIhjCBL
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010131_261720_F76BF58A 
X-CRM114-Status: GOOD (  10.49  )
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

Add HDD board CPLD IO expender based on latest CPLD firmware support.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 10a9fca1b803..102d71234932 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -632,6 +632,36 @@ eeprom@51 {
 
 &i2c3 {
 	status = "okay";
+
+	// HDD CPLD IOEXP 0x10
+	io_expander13: gpio@10 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x10>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// HDD CPLD IOEXP 0x11
+	io_expander14: gpio@11 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x11>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// HDD CPLD IOEXP 0x12
+	io_expander15: gpio@12 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
 };
 
 &i2c4 {
@@ -1067,3 +1097,38 @@ &io_expander12 {
 		"PRSNT_CHASSIS1_LEAK_CABLE_R_N","PRSNT_CHASSIS0_LEAK_CABLE_R_N";
 };
 
+&io_expander13 {
+	gpio-line-names =
+		"wP3V3_RUNTIME_FLT_HDD0","wP12V_RUNTIME_FLT_HDD0",
+		"wP3V3_AUX_RUNTIME_FLT_HDD0","",
+		"Host_PERST_SEQPWR_FLT_HDD0","wP3V3_SEQPWR_FLT_HDD0",
+		"wP12V_SEQPWR_FLT_HDD0","wP3V3_AUX_SEQPWR_FLT_HDD0",
+		"wP3V3_RUNTIME_FLT_HDD1","wP12V_RUNTIME_FLT_HDD1",
+		"wP3V3_AUX_RUNTIME_FLT_HDD1","",
+		"Host_PERST_SEQPWR_FLT_HDD1","wP3V3_SEQPWR_FLT_HDD1",
+		"wP12V_SEQPWR_FLT_HDD1","wP3V3_AUX_SEQPWR_FLT_HDD1";
+};
+
+&io_expander14 {
+	gpio-line-names =
+		"wP3V3_RUNTIME_FLT_HDD2","wP12V_RUNTIME_FLT_HDD2",
+		"wP3V3_AUX_RUNTIME_FLT_HDD2","",
+		"Host_PERST_SEQPWR_FLT_HDD2","wP3V3_SEQPWR_FLT_HDD2",
+		"wP12V_SEQPWR_FLT_HDD2","wP3V3_AUX_SEQPWR_FLT_HDD2",
+		"wP3V3_RUNTIME_FLT_HDD3","wP12V_RUNTIME_FLT_HDD3",
+		"wP3V3_AUX_RUNTIME_FLT_HDD3","",
+		"Host_PERST_SEQPWR_FLT_HDD3","wP3V3_SEQPWR_FLT_HDD3",
+		"wP12V_SEQPWR_FLT_HDD3","wP3V3_AUX_SEQPWR_FLT_HDD3";
+};
+
+&io_expander15 {
+	gpio-line-names =
+		"P3V3_HDD3_FAULT_R","P3V3_HDD2_FAULT_R",
+		"P3V3_HDD1_FAULT_R","P3V3_HDD0_FAULT_R",
+		"P12V_HDD3_FLT_L","P12V_HDD2_FLT_L",
+		"P12V_HDD1_FLT_L","P12V_HDD0_FLT_L",
+		"HDD_23_PWRBRK_N_R","HDD_01_PWRBRK_N_R",
+		"","",
+		"HDD3_PRSNT_N_R","HDD2_PRSNT_N_R",
+		"HDD1_PRSNT_N_R","HDD0_PRSNT_N_R";
+};

-- 
2.31.1


