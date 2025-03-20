Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A66C36008
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kb43eZp0bmT9XV4NUKBfJXCRO8FE0/kL/olt+g/XIUA=; b=X5pNUXPPoTQe7U3rttJ4dAblmR
	akZy9Wpnr6WPfVMFXwZelywWkSZV8/V40NB9m/NycjA8I5thGGxFp8CHk6tKnc7PNbhUkY5dvm12C
	JWBNw1Dg9VJccGXv5m3hVr7MMm5WltuZbsUWgwlTKek2QTaE1QCM5uOnZVmKvZe3iv3rx6Yd3m5ep
	+dI1hFZVVocRse0wjbyuaEzJMFqDp2XWUIPmdh5i0my8JKkomY7YZxSQq1GQ43/8tQQN6iiDOuhSL
	eoQ/gz5dgTQ/JWlqtw5G1U+WRlX3z4UJxOcAtlJnYIVyYju3KYum4bO3vOq5i54NNCxZrMuji2kap
	wTYicyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIMA-0000000Cbtn-1FW9;
	Thu, 20 Mar 2025 16:02:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHlN-0000000CX5q-1dT2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-223a7065ff8so28684615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484293; x=1743089093; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kb43eZp0bmT9XV4NUKBfJXCRO8FE0/kL/olt+g/XIUA=;
        b=hX35qw2VU4k0pmlj1DjWPXK3Ktt7fsOufZyRZ8vy68G++giuIY0T3U6ufYdt/ln31f
         MPGF+4pVq3BB+EgzbRb2iV2axc7Iit4GmD4aOTa/4BQJ/HsUtq/6dXJ6LgkAeFJXBdJK
         BQaHqCbwyFYsaeIcxGWxAE1atyMUQfEN4HVcBBGPr8R+F5dbRGsnLRjG+CcHUwSt5Ukh
         MU84eCAlV99a5x4Uyt8YX8E3R0s2SIMd+xTLEnOFS2vBAeFJxTu/uuTwDAr1lPQor4Hz
         I7OYMCRGPzzWKuGZ5PtavBnItLLOFl5JM/5xrQRaa/3YAKX3CNcnUybQO0W5Dk8equ+5
         6wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484293; x=1743089093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kb43eZp0bmT9XV4NUKBfJXCRO8FE0/kL/olt+g/XIUA=;
        b=QwKiU6/+W5oO1/lq5+AMl03ooxEbgpXTKkRMuWnhMYOsn5b3UYzYkgNl45KNoJbTIb
         1+fOZSY7CY0zPoPHfX+wTxhPcY3iyfEhSUuonQpHF2ujIKmxn7cVmRJZWgh1Ew3wOP9h
         65307Dr0Iy97+5rnT7rWeELeQVeQ3kWH/WhDJa98y8sbyuNDA6IFXyOIEI7WKev1tnMc
         jRvvTsEK7cy0tvgAmN0hnjIDBmUhvx6fx/R6wGleGveAotLxorrgLhIuyX/r4OJWTOhA
         vy5NblKmrkDAdog18rShRoCCZzQgWi1GIYzxy5jsC/esiTdPcX0FB5wezwEJbYsVtnP4
         eOZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWiYQI/2D61zwPCXg2quglnKcAVOc33I2AkddjHwBBfsjx8gK1cRJtRz05i9h2XA9nY7xIxLnkuHIMtySrT+8T@lists.infradead.org
X-Gm-Message-State: AOJu0YxiWTeb8NFBO/dxuiBhqSDvn1xxekZq6ZBsyq8u5bAJu9eoNUU8
	daODOyn4m1HJwQVZ3u+rFjzttKpY8kwoOAneZJbotp5aQLfhIjrh
X-Gm-Gg: ASbGncs9sB65Z8LbHAWwpAHUIQBOpyZOtJkuL38UTVdrfFbk+o0HIU1B3fAC6uPv9E/
	EflzoNjdwxLhSTOlBnOuX0J0RDd/ZhRNgRRuVaWrD1GXF9qNgwWGc7QUdUqmBNbtfwZwu+lcwHn
	izW4a4ga49oNUdvbTnpEKqVKEPaKKTvjHrtYkc0Xc6UlhSxWBmwneiJyuWalefcnEpNyoAloXO4
	T/HbujYfhMB6nJ/TVzCjeAxtyM+PKk7RHINtGOTXMebU6CwiartK2QJxACYO/l7mS+Oa+GOP9p0
	RObEOEljgub6E5aEx6EZb85SrT1KeY92vw3SuyWS9IYmedvDOBNTYsszGPumX3hKuSqJLpzsNqu
	AobVrX2aQ8GDR7GSH05az0CUsx671T5N5
X-Google-Smtp-Source: AGHT+IHE92AmQP6pSQe4X5Gxq1K0w/g80wdi5cdppZrIPKVLtb+T7vCPI1VmndKmWdZXwXBLIpl/jg==
X-Received: by 2002:a17:902:c40a:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-2264981d956mr117086675ad.4.1742484292652;
        Thu, 20 Mar 2025 08:24:52 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:52 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:21:59 +0800
Subject: [PATCH v5 09/10] ARM: dts: aspeed: catalina: Update CBC FRU EEPROM
 I2C bus and address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-9-e161be6583a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=1195;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=8Sc7+TmNtcYLYM8RQCVTgjvfsStUP1z0J+a5AZtpYRA=;
 b=/KhOPweORghlVtVjwU/eucupg8Thf8Xswg+01HtHScRvBcJV0CZqRNHJSG6xuAj/O2DZIQnHJ
 rpNwnn+DS2/C6KpcDvLKNTwchNFSz2tpuQnjFoOO6ZxJd3a+vsSPb70
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082453_436555_D382FD2A 
X-CRM114-Status: GOOD (  10.40  )
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

Revise the I2C bus and address for the Cable Backplane Cartridge (CBC)
FRU EEPROM in the Catalina device tree.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index abf15d322605..653afacc7af4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -822,6 +822,12 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	// Secondary CBC FRU EEPROM
+	eeprom@54 {
+		compatible = "atmel,24c02";
+		reg = <0x54>;
+	};
 };
 
 &i2c13 {
@@ -834,18 +840,12 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
-	// Left CBC FRU EEPROM
+	// Primary CBC FRU EEPROM
 	eeprom@54 {
 		compatible = "atmel,24c02";
 		reg = <0x54>;
 	};
 
-	// Right CBC FRU EEPROM
-	eeprom@55 {
-		compatible = "atmel,24c02";
-		reg = <0x55>;
-	};
-
 	// HMC FRU EEPROM
 	eeprom@57 {
 		compatible = "atmel,24c02";

-- 
2.31.1


