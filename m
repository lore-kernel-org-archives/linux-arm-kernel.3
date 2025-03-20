Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29988C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=778YCnhGu8OwS5VD6l1aN21sioD9+bOBBeqngUJxkTg=; b=DBPlDStxBF7wihWkSMBBezxid3
	FjDu6D0S2vZMMqvi2mIZdBKhMO51b0JCczI2FrP+s3tBlVq3fzDPBN2rNCJtOgGMK6Ae/6FVcaoXv
	byTN3bUuT1WYuC4VWmOyG0N8FYDRvwB7bEQsRNXN9XoKJo9JszGe44unt1sD+2S/mcuSPvubNttyN
	1EcASAKgYGQw3eRBqVIdUAd+tz91zeLB+ejmReaIGFDNlnR5HonAcXQviy6LtvDVs1h/ZiM6ftZlr
	qkaEHo9ptPXmVMVOjUzfOPcJB5DwRWKTEfKwfKvFBwRS8PG3nCSf21tZ8L9FTUn+W9EpOh74OVOIJ
	F9k5lIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIMA-0000000CbuA-3ZLu;
	Thu, 20 Mar 2025 16:02:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHlQ-0000000CX78-1lBk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-223f4c06e9fso16385985ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484295; x=1743089095; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=778YCnhGu8OwS5VD6l1aN21sioD9+bOBBeqngUJxkTg=;
        b=hjCdex2mvb04f2QSDHocwPYCQ+7FkGDxZUsX0R21w7yssszAT7c7I6pq/eRh2JRf43
         5yIhm1xauBgdonQ4X2of887/OGlPiXr0VhhZV13d92gkW1wQsCocHqDvu7Lv5t8O5LQE
         kR9aX8/BkzcNcCugfM6BCGLQ+DcWurJ7WiCdF9jRbJgPku4PkrgLz8/CuGqVKVc31YgS
         6Wr/b9voXx/EG3faJYS7Xx2bByxF3havIh8M1Brzlhzl4iYjABoD0WVPGkOaVc2/iJtp
         ndwGASMRuZyiAhHtLI75kaCY53W2oa650xKIFpy4z6QkF7CpmilZ08v0l4uXuNEjEC7T
         UmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484295; x=1743089095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=778YCnhGu8OwS5VD6l1aN21sioD9+bOBBeqngUJxkTg=;
        b=oemjbn57eN/XLiu0EhdLXmR6EeZf9p0bLVRwIgL3cPNaRCsnodar9g15rzO3Pcud5M
         9zqI9mP54jkkWdILBgcxrnUwpO52HakSOtK5tQatRvXq1wOtFUlUr5mY9Ueh+L7+/tWl
         1QxaNCDqja856AQsIlCxg2+GathauVHbRnrZJ6rRc232NbZRwAYx10s5c+HrvyusTc1A
         0IwzOlcrczdJAToYGSVRfCE80EPNaTLs2//yutcKAsX2Bl6gBsUuTlnOk83iyM0DG9Zn
         8arKeFbZxra40BF+qPupfcnAmyyl9RfuD6Emef7LMSGnmZV/qUptSTVON5m1e2jKCloe
         K3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJxX+svDkSHrsQFvQOt1KvnRv7aEIB4BjFdG4ZIdvB38n8j+PES9OS61UkKGyNjZP8BREzKM1AEbxJZQNRNt4H@lists.infradead.org
X-Gm-Message-State: AOJu0YxYX8RwUZjs9f1XoAQ68ar5X8eRKYweM9jH5e2FQSt/nmlk3oNA
	dTFwgqdnUOWuL7mhqlAQcE0UaUMkMKK8EHk5lPtofjV0qM88Fzvc
X-Gm-Gg: ASbGncs9TUsGVCdlo1lAMSEoA8qfYaU8kzlqf2gAMi+gITDPZR0vREczsUMKcnNcF3j
	PWRUNHo7YKqCrETDM3jP8OhkI+jXClTMHzhtYDoCFeyKRUn/A/qHWtJ3Vqki77tCtoEjGpSNhHY
	fbikkaWqNLcEuSo7Rqa96/bn/p0KQGEgMSB5HxEMoiEnrc29lyvvrmKjnY2UFABr39cQk0e0exT
	oExGYFovBmRlu6Xxf3s5/r5vGBSrqavOjJJpVAULkinwSEqJoMsatlPMfgPo0w5UgTBj3Vs32aR
	WJpFh7nf0ag29aa+Sn4LN5tKbdPNIlrotZcLQO6XI8pRAqKmN8v0vyDePZbufa+a4GU0i/kkC/Q
	azGgCZ+3lsyMazl6ZNLPwdQ==
X-Google-Smtp-Source: AGHT+IEm0o3IjdN4CK7bI1ZR5Cl6pbpHzpKB84eZ6aOsv2wGsYmuyJSpIXKgRxVZphiibOVU45xSMQ==
X-Received: by 2002:a17:903:228d:b0:220:ff82:1c60 with SMTP id d9443c01a7336-2265e6d467bmr56146505ad.14.1742484295352;
        Thu, 20 Mar 2025 08:24:55 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:54 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:22:00 +0800
Subject: [PATCH v5 10/10] ARM: dts: aspeed: catalina: Enable MCTP support
 for NIC management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-10-e161be6583a7@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=1803;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=mctbch+3SZnEdii4zFZGF0Iv2O1sUwEaKoFRoL6RcjM=;
 b=sqz6o+Uq8neZCbmc+XIXb5EqpCCu/Sv7ukNsWuZdglpzn1ESmULH+w516OO76HCLaZ4morgBT
 FpcXpZ2i6XdARxIH0ltRokrlXGjzJ9Dyv/tnxJ3kxTdAhSEYff8vmD+
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082456_463153_3FF4F684 
X-CRM114-Status: GOOD (  11.01  )
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

Add the `mctp-controller` property and MCTP nodes to enable support for
backend NIC management via PLDM over MCTP.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 653afacc7af4..6eb6c5889113 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -186,18 +186,23 @@ flash@1 {
 
 &i2c0 {
 	status = "okay";
+	multi-master;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c0mux0ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 
 			// IOB0 NIC0 TEMP
 			temperature-sensor@1f {
@@ -214,6 +219,7 @@ i2c0mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 
 			// IOB0 NIC1 TEMP
 			temperature-sensor@1f {
@@ -305,12 +311,12 @@ i2c-mux@75 {
 		reg = <0x75>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c0mux3ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 
 			// IOB1 NIC0 TEMP
 			temperature-sensor@1f {
@@ -327,6 +333,7 @@ i2c0mux3ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 
 			// IOB1 NIC1 TEMP
 			temperature-sensor@1f {

-- 
2.31.1


