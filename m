Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05BBCF9C42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d0tdadcaOllwZN0zF3sys/aIhLtv2I4tkzaAzDlX5eE=; b=ZQvSNQL5yAETel/N8gmyWLpxwc
	Pg0IZ3LzwmNxYBWyLZfTt4Ll+IzEVpSDzKyyXHAhzHjvik562E2mCf4R2WvYbkVH+IEc2nAKpMP1Y
	x90geinV+Ymj8R6ZJSCM/ue/PBn7fy5aPIY9wBG2bWgGugHtVJcxtQipm3llWw2WSW90ggegnZBCL
	FW1oGAH8UUMWh1s2WvhGkhlY9FjvXY84rRaOc4rRnB4qXi6gGj4SJd8M4G0wQyqsZZ5QKrsoIq5/O
	7KonR6dEl0Io+fH2QQ0Ih6cy7PB6SVDfPo56TqQxH72D71oLDspPcN8Cqq0UEPe5jZnawJ4TyGcfs
	a3Vj4Jaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7R4-00000006zw7-0hHt;
	Thu, 20 Nov 2025 16:23:06 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7R1-00000006zuz-1FNo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:23:05 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-3ec3e769759so279283fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763655781; x=1764260581; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0tdadcaOllwZN0zF3sys/aIhLtv2I4tkzaAzDlX5eE=;
        b=Qk5u2PnWIQwgWUSYRpqyrALI7bkYeyH7J70Z8uNaKc4hguhDHNkIjUpdQopXBVDpUt
         EpQ9yAJa5S2ZPd2r/6zIR8VWX/KnZ2I005armlyXHBlHu7z3sZekMD7ExqlA7pFm6RVs
         8lk2/JewUIe9VtQSnY23NTmNwJLyB4+vVXMTjy+78fexrbW0I1/7Gw3+nuW6iBXjB44x
         jUbXbN4SZqeV6sb0LTfiB6imNEMgqQMu8sc1CE1qjdELqUmDjvWfV8hc3ug08O2jCkmP
         aE3ANlwShsjO03A2LrMlF9mmeUwgbVxsoxSePrKqsAMct6ecxoIS9/CwmVI5bCUnmtoa
         fnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763655781; x=1764260581;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d0tdadcaOllwZN0zF3sys/aIhLtv2I4tkzaAzDlX5eE=;
        b=Tpsh/H7tECl7aWRegnzFflEQmUsIZeoAXA6+jSNxf9iIwXDATmox3bCwZFaLoqu8u0
         a3qjYFs2rP6baE8jrne9Uh89l/zZs3Uh4lVJm76Z8FGRNyMa2VlT9MwYEp8Q8SpK4rT+
         8/axVIV7Z2uVfQAGI5jyEfgQGO/Wpjw3YNQCmbab3RsC2o5OXF4g+QzaWulQ61431Q5+
         9VjacP092aknHFLq16eYuiA7T9gL6LSPr5PfpZfsjy9vPfVaBHCfwbZc38RLz9s/nXqf
         rIpeixn1n+dL2rvLAHDVitSfvNqBdJ4BH5RIs5YKzUeH0iivakJuayZrB+0j6r4ciDcI
         1XVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXMweVMpTjiK9BdzXrz5Zsq6zIPokUHzA2whYD4DNRbeAjZUmyfZG/YVpRmNM8bOCvLtM9XfTIXvjZ0zMrIeRD@lists.infradead.org
X-Gm-Message-State: AOJu0YwwPfJieOFM7EHH3DCwk9+BfbeOVFP7XCKpaszL54fMsD/vqNHG
	xiUDCq4Qhr699tMUOV6DDGmi7M6HIKVV2wK/L/ANjs+xhkl0iGHtFJom
X-Gm-Gg: ASbGncvL92vNG1VFed6Q9YBonQUl67daxIigfo3MetjdoparVsrw9qSa+kDjWHtF4gz
	5R7offz6UhL+V8k0as1g8vYWFCUiGxlV8fuogGovmmwHXTqArmcA6cdHzMJ5neo7qNDtslJGOQH
	bl6dN11L5y9OxMfxmz3S+7gFjMtOjp38jWAEGYmbjX75vUsXSQPOB9lgac8Cp+egtH1aFn1eUp4
	QE4KUV+1R7TK/i+KX3mBVkBH6uR3hZossUUw1dn6WiCGrLiX6/03oxKURzIlMDE07Jb3Lqcqrlq
	xa6gtwc4eAXyUKcfd3/kcUFggZeBcnubdrUbNdiMYJ4hi2V0+nahSV1qJcNZsU1JMk2g9b3pOEx
	sG/pl/VL2hgyfyO/o0mbPUMHHnncBwcWnO6/AwgE/ydyHd3AE/UnO06dbQkeiyaaESdPsraejfA
	ufTuQaM2p+TGeuc8w=
X-Google-Smtp-Source: AGHT+IF7ftfalNRw8ZNUBYR+5ucJXrX7efoW1K3ADp3krYp2GnXALht8+9gG/fjl1hp4DrgVDHKMJg==
X-Received: by 2002:a05:6808:1b26:b0:44d:a0ec:712f with SMTP id 5614622812f47-4510ee8ea7fmr71818b6e.17.1763655781076;
        Thu, 20 Nov 2025 08:23:01 -0800 (PST)
Received: from SC-GAME.lan ([172.245.56.104])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-450fffbf1fbsm766947b6e.19.2025.11.20.08.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 08:23:00 -0800 (PST)
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
Subject: [PATCH] ARM64: dts: mediatek: fix MT7531 reset polarity and reset sequence
Date: Fri, 21 Nov 2025 00:22:24 +0800
Message-Id: <20251120162225.13993-1-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_082303_352606_B2F8F98F 
X-CRM114-Status: GOOD (  12.62  )
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

The MT7531 reset pin is active-low, but multiple MediaTek boards describe
the reset-gpios property without GPIO_ACTIVE_LOW or incorrectly mark it
as active-high. With an active-low GPIO, gpiod_set_value(1) drives the
line low (assert reset) and gpiod_set_value(0) drives it high (deassert).

Update all affected DTS files to explicitly use GPIO_ACTIVE_LOW so that
the reset polarity matches the hardware design.

Additionally, adjust the mt7530 driver reset sequence to correctly assert
reset by driving the GPIO low first, wait for the reset interval, and
then deassert reset by driving the GPIO high.

Boards fixed:
 - mt7622-bananapi-bpi-r64
 - mt7622-rfb1
 - mt7986a-bananapi-bpi-r3
 - mt7986a-rfb
 - mt7986b-rfb

This ensures the MT7531 receives a proper low-to-high active-low reset
pulse and initializes reliably.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 2 +-
 drivers/net/dsa/mt7530.c                                 | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

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
index 5d8e3d3f6c20..732dc4f5244f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -87,7 +87,7 @@
 	switch: switch@0 {
 		compatible = "mediatek,mt7531";
 		reg = <31>;
-		reset-gpios = <&pio 5 0>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 58f77d932429..91809cdb4499 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -64,7 +64,7 @@
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <31>;
-			reset-gpios = <&pio 5 0>;
+			reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 548b85befbf4..e4caedc3eee5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2405,9 +2405,9 @@ mt7530_setup(struct dsa_switch *ds)
 		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
-		gpiod_set_value_cansleep(priv->reset, 0);
-		usleep_range(5000, 5100);
 		gpiod_set_value_cansleep(priv->reset, 1);
+		usleep_range(5000, 5100);
+		gpiod_set_value_cansleep(priv->reset, 0);
 	}
 
 	/* Waiting for MT7530 got to stable */
-- 
2.17.1


