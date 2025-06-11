Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182BCC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKbu1o95QNnYrie8L7Z3Lpp3SPlLgdV1zXb1UY/Ga98=; b=0F4ULlsKuGyyzmcMGAi4yIIhIJ
	KBAyQPhJaIEn5s0DqSIK/tCyeETLEBGySL/3TG7LtkjYwnrqopzZ6gsIJSDE62XzkkGqGwYpNYrM5
	NxPCKXqRUa2Rbk3hJDM4lKKuagrDb9Cb7H4SumuAxuBIupROqG/KeIuK4diuVg242kcl+Ex31exgH
	3Yu7pDghVbr3pNL59F2kVn3W62l8BdaPdu/ZiNTcvUTgrKFfrzZU5E644RFJbpXN5ohpzKXuVpbjS
	s4mXztALh8PYhsLXObef+i6i45NVQ1gp50GJFqOxJa+WoXFCJmOL7DlKeGdj51WNJ9911IKfnl/op
	6wUKOdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGrp-00000009H2s-0zEz;
	Wed, 11 Jun 2025 08:31:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGSf-00000009DFW-0evg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:05:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-234bfe37cccso77386015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629128; x=1750233928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKbu1o95QNnYrie8L7Z3Lpp3SPlLgdV1zXb1UY/Ga98=;
        b=Yr4UEEt4uezKL+3m9kWn125HQGTwvUmL0dxHK8Q4hMhmThIDGcLl7+rKVsESjU3AWt
         yTUwZDT9LN2Y9pJknIajudX9rcaTpgWaa3pdAc/0HII+nfk5eiHbCBnZQJP0uRaD8XDX
         1rqQucppWrKz9FWaN9T232Z85lCa0mts/oZ6tnk8g0hqoYBp9MtNNc2LCh7q/G9VC2Gq
         m5sT0jhCx3ZzG2A6r1r7F9r25EQKPg2MqL6NTN5Jxwn4Jm4HbrkLo1qXI7SAfIzf4HXc
         HKVTebZdDP3rjeS/LclkmutLc3u2ZHifMlT79+xzgrLIYC7RRCd+TQ85d++QJqdlETHo
         5epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629128; x=1750233928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKbu1o95QNnYrie8L7Z3Lpp3SPlLgdV1zXb1UY/Ga98=;
        b=sxsxiKf1lWc7jJbeP7cK/bXp+JxqSWzJBtmfR0rC/aa1VdWTGiahg1q6ja7pF+Resm
         U6aL0zhd7fCllEIPyOqH0exPW6NaOHbl9TbVGBady+BUWGyq0KADtaLEG+Gt76cY4MmV
         LuOESl7aWp/9YC5YDIZtrgBwwGcjFwi6xl6zMIZTGecFW77krRI3RazgrEY1BO8ySsns
         hu1AzM+2GFPnBF4hZD4OCeySm/Gv0aeTBG7yRl7IQ+s73WZhVpMcwIfDE8WegWU5lk3z
         cIRxTTNYI1bu6LRcAnhmEJ3iamv4fxzpB5Hb0th2mqMW+4Hof+p6bJVka45PDz4I2p0c
         ifLA==
X-Forwarded-Encrypted: i=1; AJvYcCXff0+V0DY820Yu3hSsiXbkr1h6TZzn59/HfR6nUxgbh1+6+ozFusI0qVbucHbkkUn1wez822RcetMoEtgOVUtr@lists.infradead.org
X-Gm-Message-State: AOJu0YysIJ5QUe9ReMna732j55xH55LglKfLRQWxtpXu2KdNBsXOCDLy
	nEbexbQ3RFHp7xpvsELf+6h8gmXHSXSQAcXTejzLK/iAC7jhRBtxbtSN
X-Gm-Gg: ASbGnct7N5K+siU/AXRzX4s1bVDfbZaB8PShR32bfXhVEL+DiWgDwyHrEcb5wP73ELn
	rWrU3bUJ9JfUNVv/NxJ6uRh32KOto0oRuSW98fAJ9swBuM7ziJedrczTlhMpQw5/eGap+23cn5q
	QuikHj9wUXZ0jkGi9Y+g8kgWgkc/5xSq6V9pc3XX3mMBGoWa5MKpAoVt+96lLKWZ3DipzUaOq6S
	cf9U12oX8uaxP4ipJo5/uFEB6BYLny/8v9aCEY5MhoGZQsNqJHoFPR1C28eqUEryanQY15em/5o
	aNDxVOHcnI/nu6FC7bKgsKZkwMb+mYsE+saZqlCplM9BB7wxAml88UazP7AVvLG/1s6VRYzJppF
	1TyC5Pz3PltKHnssC1CKBqHrOS6leT6Er8UD//yA2jPklCSyRpO9ViPPOEDjS2XzDGN3iRYo+HH
	sQ2OL8qQ==
X-Google-Smtp-Source: AGHT+IGeLq1+OHxDZevQ6QLgjMpafO8y79YrpEjfJFZArC1M6ed/pAiO8LgUIMW+68fVDNOZqDVkAA==
X-Received: by 2002:a17:903:3c47:b0:235:2375:7ead with SMTP id d9443c01a7336-2364269a903mr28755145ad.28.1749629128388;
        Wed, 11 Jun 2025 01:05:28 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:28 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 3/5] ARM: dts: aspeed: harma: add ADC128D818 for voltage monitoring
Date: Wed, 11 Jun 2025 16:05:12 +0800
Message-Id: <20250611080514.3123335-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010529_203531_59B4F6E4 
X-CRM114-Status: GOOD (  12.19  )
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

Add the ADC128D818 device to I2C bus 29 to support voltage monitoring
on the Harma platform. This enables accurate measurement of system
voltages through the onboard ADC.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 344e20394665..25b873ace2ea 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -529,6 +529,19 @@ eeprom@54 {
 				compatible = "atmel,24c64";
 				reg = <0x54>;
 			};
+
+			adc@1d {
+				compatible = "ti,adc128d818";
+				reg = <0x1d>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			adc@1f {
+				compatible = "ti,adc128d818";
+				reg = <0x1f>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
 		};
 		imux30: i2c@2 {
 			#address-cells = <1>;
-- 
2.25.1


