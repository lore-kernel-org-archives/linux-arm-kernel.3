Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3D0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUfisYcWp0a9uSKCTzhEOlOpswYrDKtyklCDtr9oI7U=; b=3COFLZoH37RD0OTfW/jxUopoUh
	dhlc1If8b1R0XJb66F1i3drpCB3FH+FnxAqvoBRLN6RXtE9Bdk7D50FMc+QZp5X3ms352tuBuDZdE
	8ZvaOyQZyOua4EjTQH9wYCvYIxKv+kj2z6mvMs8WtFUGYGM65lJsKpmG4mVZQU6TcYKqnxYn49Jes
	lo0FTLdGUmYvqoyOef7jtv3SACcwZ2+qgh4mdHQedyhiBvFIHMd42rQG4hXpjs5jhpKRsxs6wznwW
	LVrNSpxX4LaFf8COnCVI/CYjKh/6KzKpEULHvnYht1TPVd7S1QVc0eUpExBslx7eRre623hx+Ns9s
	ONuk51+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIM9-0000000Cbro-0LAy;
	Thu, 20 Mar 2025 16:02:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHlI-0000000CX4a-170V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2235189adaeso18915785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484287; x=1743089087; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUfisYcWp0a9uSKCTzhEOlOpswYrDKtyklCDtr9oI7U=;
        b=ihNK/4p8SXfvvPJKM4rADTbt+OqYjSJpCSS830cfb9M0tlrAuAJTjlI5LWEmggIBQv
         chQALtfeKuvlN/olHNW0xoEePNSCSgGA8CEjsVACgFYLD/LpJXNS7b3qdKwoDLCKvhnT
         imwdB3DreFGvkOQIBQ/7ArX4WZ98oquctpLtB73Ee0trkbAayAF/2QhfMjitzLh0xLd6
         6FtwPfXuMgkPfgBUy5SOjKYNLSOilvlS9VRGAwnaCM7p7v9sp5ZuYB1ybfrEacAFEwWD
         1YQie0YHVJBNpCZkrZSpMo23ULg1KHBP9dx2mZ+40UksaccIQE0V95JRROkWs4PEtPMP
         k/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484287; x=1743089087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUfisYcWp0a9uSKCTzhEOlOpswYrDKtyklCDtr9oI7U=;
        b=WtWj3fHXbm90+ISR+oqGPLvqlXOh74aMWwTBlrdyGFKVFwHf628qqCD4zR1BOYt1ku
         0okPDUU0AOfTfSobTuCdaTHL9dG6scVyuTdOYuRDPWGJu3BCn5pTVrzZKo/pHFu4IlYT
         cPH3H59f6ASXTytESsMGrXySylnpjT2jDQEzpJK6udCSObgYcqoam8Ea3DB+krtkLUEf
         ow3Q1XKWTqx5PU1shqezTcVc1DEEspUkc6aZWK14UeDR6TJZaoCa7fR5Xu0MsP9y2vK5
         +j5Rj0o2UAZCnUPh4PGQc364PPAZP5oM0nYgX7dVAUJS+xFK4Pr8veu5Iyr75VjTghK5
         aIFA==
X-Forwarded-Encrypted: i=1; AJvYcCVASFLxXYqHMT6S7FQ9dUiWgANgyi/Xw4AAiwdi/gXr+1mXvZuyL2mf+3XnsU2m6fFFEMSKqzuTIrNckZTIdCZw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7iKKYbYqiWvgo8Ci1/EAds8t/VvhvZuURB9y5W3YwERtqKpR/
	V9xYBr0rSlzGCVdzHfFo6bm6fmLC2hTCv9yAPmjUx0juvOW6vw2Z
X-Gm-Gg: ASbGncsGZw6PQsGrmCHVcF2Smh/3dg7xBn+AyJrpeS4LVOp/6B3vFHkBINDlcxvzbMr
	gSFQZ8QQwb5ijHV74kTvYFtotssYFwpPHSaiHsGFhf4biSppNjpXC4mbWKgfKJIkkmodhnYTFKf
	qNcGp5LgN6v51EdBADpfw04LnytKaInvTpWwv7V0HyKRPekWnylxq7e9Usq02Htul3GznCIYTJz
	DYhskR99pwCfCOTk0uCKtSXT/4ExkxDdf8+2J3CgU5q5BasqqPCIk7Q/SKKGU0Hi/kwczFOdRN6
	Y4GRlCyt3wHUzDvsEvOm1WsY6rs380A4V5nVtS7+va8OJSc4+jEWfGcudIE5aDI4FYzifzCJxdn
	INwDNNLA6/J78gIboiTQbbA==
X-Google-Smtp-Source: AGHT+IEhD+AwDbS1bWQ1xV8+/CAKiat6otvbsanGzMCX+jMw60SVH48Jml3Jk1BukssYExoZ1JfSjA==
X-Received: by 2002:a17:903:1a27:b0:21f:98fc:8414 with SMTP id d9443c01a7336-2265e7c2830mr65399575ad.26.1742484287128;
        Thu, 20 Mar 2025 08:24:47 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:21:57 +0800
Subject: [PATCH v5 07/10] ARM: dts: aspeed: catalina: Remove INA238 and
 INA230 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-7-e161be6583a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=2083;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=QdPjNftOZyhcrxaBENJ2ZcCMQ0d2Elbpse3JT06Zbt8=;
 b=ahiqRaLzLCuBq51XXJGrLe1R+4sfoCcFv/8CoxoOuZot1U3ktNGhpx9+KLCyQx04a92RUgyp5
 LimJ83PUITOBAM65OVPGU6vgHp/CdOyT0QXMr9zq1HR18oRBnRzLvxr
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082448_307378_B18928C0 
X-CRM114-Status: GOOD (  10.03  )
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

Remove INA238 and INA230 power sensor nodes from the device tree (DTS) due
to incompatibility with the second-source ISL28022, which shares the same
I2C address.

Move the driver probe to userspace to handle sensor dynamically.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 45 ----------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index cf8a31b50074..1e1bcc9ac2f0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -432,35 +432,11 @@ power-sensor@22 {
 				compatible = "mps,mp5990";
 				reg = <0x22>;
 			};
-			power-sensor@41 {
-				compatible = "ti,ina238";
-				reg = <0x41>;
-				shunt-resistor = <500>;
-			};
-			power-sensor@42 {
-				compatible = "ti,ina238";
-				reg = <0x42>;
-				shunt-resistor = <500>;
-			};
-			power-sensor@44 {
-				compatible = "ti,ina238";
-				reg = <0x44>;
-				shunt-resistor = <500>;
-			};
 		};
 		i2c1mux0ch1: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x1>;
-
-			power-sensor@41 {
-				compatible = "ti,ina238";
-				reg = <0x41>;
-			};
-			power-sensor@43 {
-				compatible = "ti,ina238";
-				reg = <0x43>;
-			};
 		};
 		i2c1mux0ch2: i2c@2 {
 			#address-cells = <1>;
@@ -753,27 +729,6 @@ i2c5mux0ch7: i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <7>;
-
-			power-sensor@40 {
-				compatible = "ti,ina230";
-				reg = <0x40>;
-				shunt-resistor = <2000>;
-			};
-			power-sensor@41 {
-				compatible = "ti,ina230";
-				reg = <0x41>;
-				shunt-resistor = <2000>;
-			};
-			power-sensor@44 {
-				compatible = "ti,ina230";
-				reg = <0x44>;
-				shunt-resistor = <2000>;
-			};
-			power-sensor@45 {
-				compatible = "ti,ina230";
-				reg = <0x45>;
-				shunt-resistor = <2000>;
-			};
 		};
 	};
 };

-- 
2.31.1


