Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540E4FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 03:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LnJZvLH9bwq8rkIs+Lcwlv8aSN2xQ6iGFhBeGaXxuk=; b=wvCU3V1t5OWuqmwlp3VMtmm6Z+
	8o/teWmKnobu0lfO6t/FGUQ4zpfBh3BMtciB0jayH4J5HCaCf2GThH1tru+gn/WrWBrGmxrQz9Nmm
	g9/ja1G6T1//WxsBm9HkESebSfpprEcQxZYjQxtqYEO4hC4GMy0CmhwrfRN723lpjSlXT4RNYTGck
	SeBdJsyAMzGAh5hmmd92xtKnzzYjbUSebilyNfZ/9BOocJHLh/fc3TyPpEA8O7r6u00fhxIZRHbpH
	g8F5ijLmxbXXI8YgPZS8dffNbfmc6DIJI5DkXG0SZiCPdbpsK4AcQHATl5A+ItCEUScZspserA1b3
	n6uWfJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCty-0000000G73X-3BV4;
	Mon, 27 Apr 2026 03:44:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCts-0000000G6zy-2SI4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 03:44:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2addb31945aso61655355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 20:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261488; x=1777866288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LnJZvLH9bwq8rkIs+Lcwlv8aSN2xQ6iGFhBeGaXxuk=;
        b=h7bfdYjm8YgkGBWEpVDiEckwYxS90bHhEsuuOHV/I/gERxDazbWDSk/m1eDgRbYb50
         nBV5jfTnmOKHMbPncY82Ws6yF918k+KafmBqIl9TiI9HwShr7sQpD6aGQnH4Kks8juNl
         Qx2RbRQ+tN5hHJWmNaMDhFfYARURA56ZE7riPe5WVcVix1XmC1oCRFin5XuWrN9Q6ohc
         0/65Dwi4eJz6eTtrlkASoVRBzabU1h+Qqoycq3Ql/+JotZiW84EUxkk6nyclbI3/Jty1
         fzrIXY5A7cRI7fHIopMaUOOiCR4qFXyDRFdRHmpWJABLBbS7WANY7D/BFAXGtUuSYEC7
         MNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261488; x=1777866288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LnJZvLH9bwq8rkIs+Lcwlv8aSN2xQ6iGFhBeGaXxuk=;
        b=BmDZ4VfdFBoHI7TdiM82dQn+rPusNklk1W+qX3dSnMdNVluV4kwupP3xmaLSR5v0bm
         m0ZFRY1R8EBTJ/VF8hXwafKsKop08mouCpmwtUaaTVDxSqPMIi4r6cXWXemhV/6fYZAA
         w4HPdD+174zvlr0xHL1KJBB48+MLW+LHZT1wRuQ1niEDMqXawgzixhGIAMfoVG0ruKIt
         CPJY4Jl3dHnuzMapudDAmsXyiqg5hi6VXH+/efrhtrBD37sZyA9xgGFpV2DIbR0RZJ5n
         kcfgrcw4a++Y5N2ETTtWupqaHtioue29H2iGJ0az3vijIno58/R3mFuvlJXRI5T75sJM
         dqtg==
X-Forwarded-Encrypted: i=1; AFNElJ+TGrxxJz4JKwGMPhKhwC1t4FjtsEoPG8G1p0/rr1IyhdvLg7NN9bAsuyDGb3GblKw+NH/2X0F96RMnI/eiSmGk@lists.infradead.org
X-Gm-Message-State: AOJu0YyC8qwK5d07r9W5hxqX4eW8fbMug20XCGEOUb8lGJY6owA8WmAx
	dADmXlNJbeYBzO4tqXIIHT0n1jEBZAkf+O1staV0aTq6Ts0HCkTjJYzk
X-Gm-Gg: AeBDietX7a7rCDmIRPAfOyuUA6PxEoC/RSDyBWKgP9Oekli0Ibeyf8lIHOsACuamd0Q
	45WDTLX9rTArLo5kjQEiWYW1jGBB2sZ4zDB5ZGSHQZq8IcaeJpq9jqp8Dr1VcQM9xB2Rb576Wox
	FXOhEWKgMuwBmIWdF7dC+BQl3QFzU8XENdUVGYdMbjBSLrWl9tQ0HGMZEZ5v8BcgqRlER0SKCmh
	Nyl0WYRxOuTBtV8fq4oCQueDfqhsWmutdhNdAg3FmyurCW6vOZnbQ+K4MvAysv4ipcdP/7pTdPm
	YOoaegtC7Kkb9OHzTmYQ9zasiHGsPzeoEQnEF7HUc63HlN85Pqla9rDeHcd2MGJZpdgc1291l3J
	hyQXJ/89vVu8ckHYf3KpVC/LIiVQj/Xfwt4o4+q/3LypsYp3qqUG7XgA2L/oOfCJPpct+ytro3B
	NgvQd5tpcGLwRSo5rrMqicbURWBoAep4B24vYubl+6mD0Qhb0d21Uy5el5WgWUs173jcRLli0pa
	ChZYCUFdSTpsHtqihA8lC4eDw==
X-Received: by 2002:a17:903:120d:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2b5f9fbc5a1mr463142335ad.36.1777261487655;
        Sun, 26 Apr 2026 20:44:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 1/3] MIPS: dts: ralink: gardena_smart_gateway_mt7688: use nvmem for EEPROM
Date: Sun, 26 Apr 2026 20:44:25 -0700
Message-ID: <20260427034427.881389-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_204448_656265_EAF1ED2A 
X-CRM114-Status: GOOD (  11.76  )
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

mediatek,mtd-eeprom is a deprecated binding for extracting data on MTD
devices which has been replaced by NVMEM.

The latter is already in wide use with mt76. As this is the only user,
transition to NVMEM.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/ralink/gardena_smart_gateway_mt7688.dts | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 0bfb1dde9764..a8a8efbaf527 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -155,10 +155,20 @@ partition@b0000 {
 				reg = <0xb0000 0x10000>;
 			};
 
-			factory: partition@c0000 {
+			partition@c0000 {
 				label = "factory";
 				reg = <0xc0000 0x10000>;
 				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#nvmem-cell-cells = <1>;
+
+					eeprom_factory_0: eeprom@0 {
+						reg = <0x0 0x400>;
+					};
+				};
 			};
 		};
 	};
@@ -201,5 +211,8 @@ &watchdog {
 
 &wmac {
 	status = "okay";
-	mediatek,mtd-eeprom = <&factory 0x0000>;
+
+	nvmem-cells = <&eeprom_factory_0>;
+	nvmem-cell-names = "eeprom"
+
 };
-- 
2.54.0


