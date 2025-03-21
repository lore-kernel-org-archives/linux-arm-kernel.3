Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B845C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjCNidD1nDVnXFrMlTY1ibBRmDZZuKdhhSQi5Z6zBTI=; b=CxkfZaLlbsl3c5l1PpTjQVy+jm
	GP3euEsxx5KM+t+5h94YlSgTENXNsISSIsEuKPR5SKottax4OMS2uE/iGIfGSZWs8DC++MM0DX0UR
	QR/8mKJhmApiS71GVNWUrny1CdHRiRGclMGuEN8oer8lp7SicIxA+RsQbt8XNb/aRcmKHOfSyqX0m
	/nhO8ZfneQjlmbl4mtXpuE8tXyOPYBt5uciKNT+kV8AEdfuih37CTO6m8A5OfcvhXKD7lYiHBGA8n
	0dZHBz3NErEija185b9z33rBwOFJLvxb/WaJSI2KSR64QT4iv8A0Cio5iwMecMTZfmSnSw5FD0QQZ
	CqaBZm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvX2k-0000000E8jb-2d5D;
	Fri, 21 Mar 2025 07:43:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWoF-0000000E66v-0RRt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:52 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2235189adaeso31198035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542129; x=1743146929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjCNidD1nDVnXFrMlTY1ibBRmDZZuKdhhSQi5Z6zBTI=;
        b=ja2R0xIBIiSg21hshhq/d9C1lCJ+X2fto5A/yiRizsoGxNt5Pak/5Kx2zDsldIhdyn
         G/iMT5PQfcS2GWSNJ5wdlWw48GRRFCdTtutQ3wAGwhIYnsRHNdbrC4QLz6f1DgtGX5z0
         w3bns4zv5ngOPsJfTUtx2rze3MNgdXgvSxtBd7L0YWmWvqXO5ELUUsuZ63Ru6sYuVZLh
         Rbs+onxGn+zk9GiuKbPlLhVF9zw8K13J72YsUNgDBYH356idu9GzGalQxwbaVqysTyVY
         uGGaqpaS40njs0DXzaVws2K/cB7OoCTHptxKKzclxpQ3fgEmEczoyo3HoM6DfjNx0Bnt
         m0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542129; x=1743146929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjCNidD1nDVnXFrMlTY1ibBRmDZZuKdhhSQi5Z6zBTI=;
        b=cqJYaE7WFXoCWYDNQlmTvCduJ+mqYpxtOQDcdG2KAc8W2zmfoj4f8aYJaIk5TXCxyI
         LhF/cmmhEXr+9jT9d+9DY32SrpfidfxmxBIt2w8n7T/JsSnT3ehhmrvMmd2Ju/7AIpLC
         aAH19kaVvAYmJBE1djp11ad0cxElc0Xoh+wDrZi2Dyf5/+DsGVf0O7uznct4tYTQcJJs
         X5A/cu/kahDxFH5NbANmb5+Hmmwn2hxB/XGaAHpKQFLJFLTfagYuaR05uWLZrKnyMApv
         ABPOYr1LWZX9mLUeyNQ/x+L31cGdduBk72e3ldtMiOA8M4+xla/NnYR0lJNNy8RqTkB2
         SZIA==
X-Forwarded-Encrypted: i=1; AJvYcCV1TC1KZXugpvy4MIXE3zaXW2UnAzn9ygiXp7NMJBOTWAbMeqOALs0q/NZCN3yQUc5vWMK2bfbKMUopeuMulT2j@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9ti97/GbTdViEv+rAXb81ZViIeEcfFwpIuGV5Gfo+Dlj9XpcW
	cF60BX50TIrbNW8LsiikrXNBn2d0FsGGdaaMykTEpfLocTIRtJYmygdXng==
X-Gm-Gg: ASbGncs76sXwOXr3qdUtbgWcM16KgRQ8xM/Jczcdsgkr48Z76s72uwCjn2iFTCcaZjm
	OMILoXIFF8nE/WJ7wF+IllI1EpiL/jIo4cT9gseTgys5AlhBALkCBb0n2AIi/C7XAmw2Y3NYifJ
	qYgHv/B/r7Kwxynk+I1RkZcm22ZlTx/n9ihsPdSZEPDkNbN4Ang5rPW5qQ+DIBkyzHC+dE/ccP7
	P/XLs4B541E02Q9XcArq4Us16BXT7IF9zLOU7V3lW/Auldm9xXePg516bxOwYYreCvF0m0o60uG
	yorW9lHlN5sswPK+ooJtRWgOQ8kY7+NJS6YHgjgjB17jH1epQjRfERDJgz5BtHBBXdqo0TPMMG7
	yvcrzZ0esNV+YCRxDCsCFGw==
X-Google-Smtp-Source: AGHT+IEdlfdB78rjOGHfq1n06+OQDqD/5ZuI1NfpzlDEeEQ5t3Eg0NaxY/M0zpNx0tr+GcFTGiQYdQ==
X-Received: by 2002:a17:903:1c6:b0:221:8568:c00f with SMTP id d9443c01a7336-2265e24eddcmr97780925ad.0.1742542129526;
        Fri, 21 Mar 2025 00:28:49 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:49 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:10 +0800
Subject: [PATCH v6 09/10] ARM: dts: aspeed: catalina: Update CBC FRU EEPROM
 I2C bus and address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-9-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=1195;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=cwszt1VFQnP0f7obJVwFKJMah6f154vn4FcRq3Og9tY=;
 b=PJ4/r/ExlbEASIzj9UpkcDwcf+n+oj5TVo2Q1L3mJAQismWdHDQBLOQI4WoHNFtfXbLtQp6uP
 xhND1kGpY+ECVHJ8UZIChY5h1TLViPhywg/CVC83hJq95l2mDtw16Dp
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002851_149091_7F05BB75 
X-CRM114-Status: GOOD (  10.38  )
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
index 2dbb65db9250..a6a2dd725266 100644
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


