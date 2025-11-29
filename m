Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92498D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 23:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=; b=1VJEO9ihwpHBdRDg4KjT+puQNl
	zLC/Y8GN32PsKR00jsjk9wpK8XjW7QfGI5Fim8vc3jG3A0kG/ErUX/CYQOw4TjYxXErfJ2jmZIbbC
	v87SCiQJV8NbsDHuYerVq8/OfAZFcCJMst0Avy86AjONIJ6w9vJMC+Ggw5dC5eySC1GFp1QQPDsXs
	mHoE9zaD+ybg+Oe5P/iyH8iVGXZvVYhPCN1+wqfGEgIpmmgU1B/3l4vKzZV0StTBQWjwa24psh4jR
	i3SXKzcV0+ECpWngnQ2lUE2rp4ux1MrhXH1rAYFX/f/ITrZS8OAyAbojXP0YFAtu9TmAz16uKwwom
	QKywStGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPUe3-00000001sMO-2XPV;
	Sat, 29 Nov 2025 23:46:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPUe0-00000001sLb-1bi2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 23:46:26 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so2006166b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 15:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764459983; x=1765064783; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=;
        b=b4/2Dv4djcFAn1+V/1AWo5FjhZ5VOjlnHFEZ7J9F8TXSAn4q6Jc7L3Et9AsWEyJO2h
         Lv95YdFQWV0/BbRmGrNuM78EdPdaz7wSRmqHC/Yl68TbwjhJswI0qwi1wJ+3KQ+mP8jL
         0ueWaHNXSfWs0FJlBzADk/7Pi+PS88bYTlctUXlidwKN8StnWmw2+UNUGWx2nwBrX5S0
         BhonbmgPM9W1F0UgZEFca8Jx7flvWt1KIu9qB9bP8ppxkcsw/EgJZBiPP2EzkIWssKgK
         BfLNl4WpHfbwlacHdU7p/dQQGfLV1LJiLZ5kEhe80Fq99aOIhR9PjZyx9wyKasK/T7Gy
         Dudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764459983; x=1765064783;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=;
        b=JpoW46fnYfNMl6dbqabQSIjuLOlFaKaB7c6yg5FL0nhrqB9QdpzeoSe2dhg6Y4EYJv
         JZywyiaFgyMbWIG5q5rJJXvkhk2Zs7lEqs65vw43Ie+O4esw3+Crbb/2uQLpMeLTBpy/
         tcCu2o+hEbCAk8Z2UgTJTD9ntQiBWh6UddFPY1DEMS5mzNqqR0qZ1KzzhoJn58s0xaUa
         SRq4Lm0jtjb+WrynZGQHu/cQNBlmawiJWOfy92Ovfq7e4ps0q6jhAyzInq5DlpGBhj++
         UYl5WxId6xVZsCRefqFcjjKGBBnS3nykOKQEyCOOkcBN6Vmh67tGibuYbvxR2y/A0AK/
         w/fA==
X-Forwarded-Encrypted: i=1; AJvYcCVLSm9eLeRomWjzwO93sq+5pNWzRWunYxW9bsT8nyakna9XP2chmeJ+Z+pdlfJsmuirt89OLyHoJniSzWzfuNVJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzVfqztoQZflFPuCX2ASTjT58hg4+0IS9ZZiGSTYewCqqtny4JW
	9O2lnx81zhxu40DCnnWPqJorsz7XCdITIeT1dUr3nZzuWGrPygElzPgu
X-Gm-Gg: ASbGnct+tU1AuryPOiQZkFaiiuXVFeWTeVl3j0T5XTnDClgEAB3+vSOrzFmuJwCxKEz
	2HLvMb8pcT9blZVcF7jEpDOTegQfeo3be00mVS3ik3yF9UxXEXn+JtzO4qe9+CJFo87XyJgAJeR
	qYXtRoy0i5DoiiNeU1TEEKJYlvTND2JlP127d7mPHvHUTNy7CvLfdAN3re/zi3FjFAwdAk1vFdm
	FYejnfY1YPfu3R6CgbJRvmzzm/QmAkaS6MG7nFUNMy+Gz++URfgj/RZPmO2Yz4u1eizBu90zzX7
	v3OcDLSb8w0RRcliidzrDP8m5QpaZUStHIWX89T+6OdBbqx+lXDFLXfu4jrbzuqEWUlqlW12IGT
	M9cV61K2hA+UhfnK2Rc9Sec1GzXFfBr7hGiNqvj/bA6CI0/zzoQQlj43O3pH0rnrYXFfT6P3O4a
	rEMgm6vYXbnLuMtnDxC/XYojcg8A==
X-Google-Smtp-Source: AGHT+IG1ssiyNwGsFp5F+wk0jylpdPRdZeUSnJ9+OhyOhmGPlt2Dzx5MOnNqeZxTuc6PCZk9MVCk1w==
X-Received: by 2002:a05:6a00:2389:b0:7aa:bd80:f4db with SMTP id d2e1a72fcca58-7ca8740ec4cmr18933879b3a.5.1764459982924;
        Sat, 29 Nov 2025 15:46:22 -0800 (PST)
Received: from SC-GAME.lan ([104.28.201.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fc08bd1sm8921049b3a.63.2025.11.29.15.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 15:46:22 -0800 (PST)
From: Chen Minqiang <ptpt52@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH v3 1/2] ARM64: dts: mediatek: fix MT7531 reset GPIO polarity on multiple boards
Date: Sun, 30 Nov 2025 07:46:02 +0800
Message-Id: <20251129234603.2544-1-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_154624_421513_A1699D3E 
X-CRM114-Status: GOOD (  13.87  )
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

The MT7531 reset pin is active-low, but several DTS files configured the
reset-gpios property without GPIO_ACTIVE_LOW. This causes the reset GPIO
to behave as active-high and prevents the switch from being properly reset.

Update all affected DTS files to correctly use GPIO_ACTIVE_LOW so that
the reset polarity matches the hardware design.

Boards fixed:
 - mt7622-bananapi-bpi-r64
 - mt7622-rfb1
 - mt7986a-bananapi-bpi-r3
 - mt7986a-rfb
 - mt7986b-rfb

Note: the previous DTS description used the wrong polarity but the
driver also assumed the opposite polarity, resulting in a matched pair
of bugs that worked together. Updating the DTS requires updating the
driver at the same time; old kernels will not reset the switch correctly
when used with this DTS.

Compatibility
-------------

Correcting the polarity creates intentional incompatibility:

 * New kernel + old DTS:
   The driver now expects active-low, but out-of-tree DTS still marks
   active-high, causing the reset sequence to invert.

 * Old kernel + new DTS:
   The old driver toggles reset assuming active-high, which now
   conflicts with the corrected active-low DTS.

This was unavoidable because the original DTS was factually wrong.
Out-of-tree DTS users must update their DTS together with the kernel.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 9f100b18a676..6f29ce828fdb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -155,7 +155,7 @@
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupts-extended = <&pio 53 IRQ_TYPE_LEVEL_HIGH>;
-			reset-gpios = <&pio 54 0>;
+			reset-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 8c3e2e2578bc..6600f06ccebf 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -137,7 +137,7 @@
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <0>;
-			reset-gpios = <&pio 54 0>;
+			reset-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index e7654dc9a1c9..8ec2ec78ee46 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -203,7 +203,7 @@
 		interrupt-parent = <&pio>;
 		interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <1>;
-		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 5d8e3d3f6c20..958ce291336b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -87,7 +87,7 @@
 	switch: switch@0 {
 		compatible = "mediatek,mt7531";
 		reg = <31>;
-		reset-gpios = <&pio 5 0>;
+		reset-gpios = <&pio 5 1>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 58f77d932429..0780b5a36259 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -64,7 +64,7 @@
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <31>;
-			reset-gpios = <&pio 5 0>;
+			reset-gpios = <&pio 5 1>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.17.1


