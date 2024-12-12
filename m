Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A75BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 13:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWMAc4zmfYhsrt0DV+vmCYXKX/GHYBxniAba73eEZ6c=; b=iM9huj7JYTaG36asWzaYR3p1Wy
	Topm+kNJ34ToGVZFr3hk892iYjrpkUAYMMfbcxYoj3pZ03FttA85MGVJ0mbLevFMvXBJvKUC/WJDy
	TmC7+fmuiECEJxtjIImYCFWJg6PLG6+GcIpulCWxLfb/IXKTFlv+i9VbdfsA9iEP4Nqm/MPymb0P8
	TvA9jd7otyGVKrPuMD35QH2ssWSnqRiQUL2Eg6n3cU4r+ybe9c03X7vxA9Ww1KotY/1hZaO5JZYdW
	LrOzTmoit+WF3iGRFsd6M61myzOb7WcR9Uel1TFKHYxYWnMj9JQ3nfx/jidoGoMcsnzahAShLiSY2
	dh61GSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjMx-00000000VE1-08eO;
	Thu, 12 Dec 2024 13:36:43 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjKt-00000000UkQ-3tD2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 13:34:37 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216426b0865so5336495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734010475; x=1734615275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWMAc4zmfYhsrt0DV+vmCYXKX/GHYBxniAba73eEZ6c=;
        b=cnTf6No/ubkNX5h0+bnu5nZqblE6ytM5b16ZBIOOAdwggPYKyg6XLjE0IH7taEhrDw
         1MS4/5dhKy7dZG/n9RefeK+HLDA9tYGDpMhKYEVBrEpq/EY5pXZ6l8mhpUlGvm00nu/n
         o5kB5hNNce7OZgFs3wne98RWR65bTtAIHugQJ+5zsTRU4rqsr0+nekktSmWSRWVPJ6ol
         ZszqWj+LIO7rop4fjAYKAKK4IQlQ9nywoyCgyuKE06HR1k4cfoLZ+PjAlAfDceRC0L2i
         wUhennKShrqX6CwaUKnt1PUcGE6Ns8XOooaPLdetYonFT28/91cQKB9Xa63n4sLiVcGw
         sPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734010475; x=1734615275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWMAc4zmfYhsrt0DV+vmCYXKX/GHYBxniAba73eEZ6c=;
        b=L2vcdgjLJb1+6bJ6LxNp11DYJ0Tax2twMmay/ROtr0B4A1UeMDOiZu++S32cZ1vwwA
         Z/STHs2+MENtXsyF13K/Y3CAV0pvtwusLnGXD4qaNvH094iqlWPxx1sHtPuFD3dQ9sea
         wnY/WFzKRfPiozGq5aXu0ukU8lDtMPVOJu9CbW0KhdiW2kBorHdxy74bd8I+vVIukFDI
         alfcM0K7qwMpBx1amycCwPhUZT640KKtfo66sefAyAFB0jCPjJBUlAaXqa0j93uBfuT8
         SsuuNXzdoMQcW1TAlcDVYQ1j/Deglp/MipPmOx5COgLH8GnhpxBIQCashuYFWzY8N3Ga
         cBUA==
X-Forwarded-Encrypted: i=1; AJvYcCXLP/jKkYa7lMuAkQqQvaS+Na7Z4ZEKDK/+HBQ5Bg471qZWWn44hub3E+1RwGQrmUf5IP7ZLn1eVvLbdL/Xih0y@lists.infradead.org
X-Gm-Message-State: AOJu0YxZFZyjUrZZpR/3PiUgBc0AUw4alMb77BNGpOGIUsjwzKcKXp1R
	UaeFscvywPPNb115WHlxbtNrlRDeBFsL7ySPjq3j9gh0++8R+Eny
X-Gm-Gg: ASbGncuQVdCseJPCciQV8PadFssXuO7ARIjvi+mkpwWrXjR5Bp0dvhEyuX+blR9EtZz
	zwmIRI6CXzEfbnF5BuLFwgBFvx8FPopX2oArdKUh45MV5A9mk7JJR4Bdrpbr9gbWqcQ6t7iGbsS
	hFM7GEXsPOr0dN8A0gjc5wnQYjqGmrbEZPp012OsQ7oBXDvAY6xSjOpxgVI4Y+ds19SApp6FmSe
	fqZVBcCWs6SQ+4XFyTlDPhjivjFkkxj9q29PVcmcecs3Cvsw/Y5BpMubeeRnzFnAeBvRF5pk1qd
	q3huuV8qQ8rLunhO0b4bL1IGoJvJCDIZ/IRAzpgvsIk2S0Cae8q/yAaKGtFFaZApuvmBlJssSba
	hEkWd
X-Google-Smtp-Source: AGHT+IEkAjpA5aepVMZDNkc8vUvUYOwLibC5GFvwj+RJ/gySt8BuEg8jjIp5XHCBFQBsOmxVfSqR1g==
X-Received: by 2002:a17:902:ce86:b0:215:7cde:7fa3 with SMTP id d9443c01a7336-21778509fa3mr108167325ad.25.1734010473524;
        Thu, 12 Dec 2024 05:34:33 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163562a838sm83390165ad.29.2024.12.12.05.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:34:33 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz,
	amithash@meta.com
Cc: Jerry.Lin@quantatw.com,
	yang.chen@quantatw.com
Subject: [PATCH v1 1/4] ARM: dts: aspeed: minerva: add i/o expanders on bus 0
Date: Thu, 12 Dec 2024 21:32:23 +0800
Message-Id: <20241212133226.342937-2-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
References: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_053436_403554_03A782B3 
X-CRM114-Status: GOOD (  10.14  )
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

Add three I/O expanders on i2c bus 0, assign the GPIO line name to each
GPIO in use, and specify the interrupt GPIO that has been used on it and
give the interrupt gpio number.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 468a33f50ef2..426e249c3326 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -208,6 +208,63 @@ leds_gpio: gpio@19 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	gpio@11 {
+		compatible = "nxp,pca9555";
+		reg = <0x11>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <238 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"PWRGD_P24V_SMPWROK", "P1V5_PWROK",
+		"P3V3_PWROK", "P5V_PWROK",
+		"P12V_SCM_PWROK", "P12V_PWROK",
+		"P24V_PWROK", "P48V_HSC_PWROK",
+		"ERR_GPIO_IRQ", "TMP75_ALERT_N",
+		"BMC_PWROK", "P12V_INA230_ALERT_N",
+		"P24V_INA230_ALERT_N","",
+		"P48V_HSC_ALERT_N", "P1V05_PWROK";
+	};
+
+	gpio@12 {
+		compatible = "nxp,pca9555";
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <240 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"P1V05_PWR_FAIL", "P1V5_PWR_FAIL",
+		"P24V_PWR_FAIL", "P24V_SM_PWR_FAIL",
+		"IRQ_NW0/1/2_N", "IRQ_NW3/4/5_N",
+		"RTC_INT_N_R", "ERR_GPIO_IRQ",
+		"", "",
+		"", "",
+		"", "",
+		"", "";
+	};
+
+	gpio@13 {
+		compatible = "nxp,pca9555";
+		reg = <0x13>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <242 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"", "",
+		"", "",
+		"", "",
+		"", "",
+		"RACKMON_A_1", "RACKMON_A_2",
+		"RACKMON_B_1", "RACKMON_B_2",
+		"", "",
+		"", "";
+	};
 };
 
 &i2c1 {
-- 
2.34.1


