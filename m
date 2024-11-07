Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE95DD43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lFEM2XRj+4jfdUpSmt8rXreEAc43KfUaW7x9In1LlQ=; b=CjhfaX1pNq/oCSqGF4u0Qlo0c+
	58fJ18AxlUfZisOK50s4hmlDGH0FYDAnJFlADxpXju20/Agcc8899YLV0JzS6r5/bYp6OrKB01lpm
	7y8tu2YMCRguZ3G77N4uJdvbabAYH9wY8ncHzyhLXvEd8z8B+J09Fv54S8tZPJWU0boeE0Fu1TdBk
	x5/8/T6+CwamvpY0enMEVrtWvapZtseZR7pYpeM15Qr7akYsSYs8uEyfQpJpG87Nkz59oLAfbi4O0
	khheHDzwg6WekLBm+X5bNkgck95aH1O/qz2exrUENDfcarMTWbnTJ2l8RP5Kdr6nQ1zcN0HFsw4LM
	yZ2QY4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91vN-00000006ywY-1hms;
	Thu, 07 Nov 2024 12:47:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91qF-00000006xym-0CS7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 12:42:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-207115e3056so9212505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 04:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730983346; x=1731588146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lFEM2XRj+4jfdUpSmt8rXreEAc43KfUaW7x9In1LlQ=;
        b=LthYmCxX0hZVFLJvF7PCqS/+AbNusV/FMtBrfNnYpWMQF9RHR4Nl7EARvzuEoInA0p
         X8qXd8U73nd4MsRvU3mejKGiAW7Y6ZdkuLJmc92PLr0yWqNt3BJVHIOhiDBzgYulDfQB
         xB1pP/3G2lYTNh81gTec/ZyaV2uo7QdKKAMA6Xq3/tB9/4ooBry2sTJy6tFZqNZu+kX+
         xgq2Vj0Z3VwL6q+ylq+PL1dHRGCrSFMYG/tpLDl4ksP48FaWOqPM2j+k9vZbudCU/N2J
         LOD4K1385Nv2lwcCg8HN3+vnB4u26WlXx7mueSEtxG0X180qtecBrNc/CAiOMjShWDU+
         s2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730983346; x=1731588146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lFEM2XRj+4jfdUpSmt8rXreEAc43KfUaW7x9In1LlQ=;
        b=OjeFuKrBv+gjnREADoGqJwHCrNO4uduqfLAfZsFJ+JGSqemNwsoNhjp7J3KG4wdoi4
         aAAu6CgyE5lAXrZLi5gM8ZWSnRJ1TqBdRenEyK84H08nGhvBAsA7/eW2rTiKAplLGiCH
         36u2Dromwrkl5gBX5gYs/TDXium3ONXQLzmGQjfsorhxUd16a/RM6QlgDmHzNnKP9Unt
         AURPkw354iVreeyCh8jOPCMY4Mq2I8R0WpB/ZnLSrDQhpx7jargnzUYjaqfZwtDJrpnH
         IPRzKuTzmYgfSxsXoZTfWzcQpkBnxcrfltMH5dp9VryXXMYx9KxF0FE5cv0bD+H69qsL
         pKYw==
X-Forwarded-Encrypted: i=1; AJvYcCUM2QCzdx37CBrkU5S8gpiKPZU+Q8AYkdKgBx36sInGtfdbSAd8zO0nJJfc4p4DIcpCZHy/zs5Wv8u99kt8GXvH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9VI0APLKnpu026oqWLARwxchWD7pl2ttBkp52JbInatebnbKm
	fn/q2VfobATkGwCAC9ufTrJVf61vKOcvFOC0UdmvFN3bDWIzv9gc
X-Google-Smtp-Source: AGHT+IFuD+Xx2XTx19q908xHLwUL9xed5Q6pQGCkFR2QHhE8PIBdNyA98Icm/09ejWxglfMpDVTuYw==
X-Received: by 2002:a17:902:db0f:b0:20c:cf39:fe3c with SMTP id d9443c01a7336-210c6c34824mr585270765ad.41.1730983345945;
        Thu, 07 Nov 2024 04:42:25 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e412d8sm11101975ad.113.2024.11.07.04.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 04:42:25 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 07 Nov 2024 20:39:58 +0800
Subject: [PATCH v2 2/2] ARM: dts: aspeed: catalina: add hdd board cpld
 ioexp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-catalina-cpld-ioexp-update-v2-2-d7742eabc0e6@gmail.com>
References: <20241107-catalina-cpld-ioexp-update-v2-0-d7742eabc0e6@gmail.com>
In-Reply-To: <20241107-catalina-cpld-ioexp-update-v2-0-d7742eabc0e6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Potin Lai <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730983338; l=2806;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=YtgoH8nC8HzrEXlSjsTGbSqJDdm7lP26pU2kbrrMZgg=;
 b=fgk9z23oAMZdgTzX2DJ9eMhOC0Bh5c6Lmv07tC0TXF+/bgCq4twQdVIo5L2vKAQYhk41GZd76
 caMnNjnvwhLCoIWH3dRlsHRdQwMCRoERqqdvKvGDzODn4JHY73fjrKk
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_044227_427956_9BAC059C 
X-CRM114-Status: GOOD (  10.24  )
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

Add HDD board CPLD IO expender based on latest DVT HDD board CPLD
firmware implementation.

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


