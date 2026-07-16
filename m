Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3A4C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0OTlWMyIHhFgUGrQUvQVfi6lsrfSqB/SXlDo2R7iDY=; b=FYWLQ3FjuiGxcriuhwtIqLv0OD
	zVxM9rYPchA0IusKd+0CeG1HAF4a+owYm5VFLi9YfnJDAD4xPJ3lyoKUKwtj7Ol5gemZs10C2t1hY
	uKjwkmOCelixjFZ+7Ra5/P/XY0qmpd+dS1bs5fPtow7egbweoeVAdPNjvzJrsVfz4LIMeN3T5jD/J
	PxKsDVowIEPNSw2QV/ADTPgbeGxhe5/caT1tdbBnmYO3XNK4bZihfJIEr4g2S69IATwis+nn8YhRc
	b5v7VSYmLB7S6uY4R0T5F8iqeaoZG1Mm/niUOqUi9ewKWsKQCdoLFNxUYcv67LmC3gqubYgkzjPyO
	/+sTMS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOod-0000000089o-1tnN;
	Thu, 16 Jul 2026 16:20:03 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoT-00000000803-1hnN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:54 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-848882fdb18so3759933b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218792; x=1784823592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0OTlWMyIHhFgUGrQUvQVfi6lsrfSqB/SXlDo2R7iDY=;
        b=UkwABaLMwQY4uNUkXojIUyq0LPrTMpxyWCJPyACssfdj9wFmM32yMWSuqEjOhmm7H4
         C5aOjEuRZxBpb9Xryhm8scmIjXinWysIsSczJKMB/PqNfwsm/Xb5g3l+Urx9XM1SJ51X
         HUTliYAsnv8U3BVtWcyeJkk/cE8zIoXgeWmKszTl1UToSDsrLbiVu5ZmR5cYM8Z7wrAj
         /ly/Pe1F/GeZI28zi1mLfaoL5X27gIz42vS/nLnEtT2/f4hteLzBh1Ew1VOwlLXeH1yG
         dGxTm7ZZ2rwBAr50nZcDrMDfo9lXGSaZSpMDk5XHAvTZz1L6V+NDuqtVvXH2UTKtTjy2
         4mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218792; x=1784823592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0OTlWMyIHhFgUGrQUvQVfi6lsrfSqB/SXlDo2R7iDY=;
        b=YeOC2kpPlRODtefpADJGVed+SkjUJpzHrZ8HhAhArCGHFculZeSeTenyLjH6OI+e8d
         NsMkAP8nhy1A3PxqDSmn0i99qZcv8ivz8JFGBCjeMQ1o6HiqNOK0Wzk2GrfyF3kntn1G
         xmAPu20EU8Rnh5DbLHO/bnhPsXFQ/OsT5390lmlP0+9kqta3DFyZ6XRG9reCWoMqIlQP
         C6dLgnAr4NY/MDbZR8b52og9D8zTiX0XGbfpnSOF5iIheZDlVvbizh1Ke/AeeIXKvdtR
         2xNdE9WzBbcpaAwoBDi+KqDrEnswkFCOERCxOtDobqLdVEGcIDgdkg5lBMc+hA1lmdT3
         BwHQ==
X-Forwarded-Encrypted: i=1; AHgh+RotJcUs57cp8K0fJhYtEJPKWspTHm157ikYvD0WyilRj5+DQWpn3oalWcSV3GsTF25Wc6Z8PPIyo6HLmPAAXLb6@lists.infradead.org
X-Gm-Message-State: AOJu0YwVIWUyQoBHZbl256CINnEhF08wnfTMh79jOdPf6QfNaEUzjd+J
	PuF1hl1K8RaSH3t0qGr37oYUU06uyKTjyikpmR20VMR5RUUpZkj/aJ1Z
X-Gm-Gg: AfdE7clEExWI7k/miVZdouJhBNfa6XZ/RsLLlaJEJO4Iv3Cy/jnDLuxNdFX8RFM2dHz
	5FlbLzBe9Yn9EDSB/l5fgYT/UMDprVwKSQa6pfer6XyCHQJwJ6C/4iqDJLabOD07e9LMdbIJ1Xz
	MuH9z1ukaQequt/Q+ad8G3srZhnJ+h7mUJmAIGOGudAgJLBGaQRbt8l/rIriWkOaaRkl1de4yd7
	AWVK5tpJLBv+sB+ZYeeqL/OHXo8pf64D7QJTB1ktx4O2KRrWeIHx/cBCke2tRuQYuN+Xd2+tgBj
	ELm3ee1MtfQs8EUpHR3vM5v37XLAroz9oFnJgHa9d3j4NE47Jq6pR/neOB4P6MJAipMDboHW4Y6
	y6KlDlfMp/pwHzBuUnU8EuLvh6LsafgqhNKGRCODg3F+FjBjX2muc/OrDxvXTnSAu5WJuXkEGme
	JIcq/bdf+4DWJTQMJqIaqVqkivkIrLXTobxDMTxteJqW8I
X-Received: by 2002:a05:6a00:240b:b0:847:973b:3d04 with SMTP id d2e1a72fcca58-84a6723fbc9mr7209157b3a.10.1784218792451;
        Thu, 16 Jul 2026 09:19:52 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:52 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 3/7] arm/arm64: dts: mediatek: drop mt6589 fallback from watchdog
Date: Fri, 17 Jul 2026 01:19:19 +0900
Message-ID: <20260716161923.266315-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091953_453853_AFEBF4F8 
X-CRM114-Status: GOOD (  11.02  )
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

Remove the "mediatek,mt6589-wdt" fallback string from all in-tree
device trees. Use only the SoC-specific compatible.

No functional change.
Affected SoCs: mt2701, mt6572, mt6582, mt6797, mt7622, mt7623,
mt7629, mt8173, mt8365, mt8516.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt2701.dtsi   | 3 +--
 arch/arm/boot/dts/mediatek/mt6572.dtsi   | 2 +-
 arch/arm/boot/dts/mediatek/mt6582.dtsi   | 2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi   | 3 +--
 arch/arm/boot/dts/mediatek/mt7629.dtsi   | 3 +--
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 3 +--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 3 +--
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 3 +--
 10 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt2701.dtsi b/arch/arm/boot/dts/mediatek/mt2701.dtsi
index 128b87229f3d..f23a6d860a53 100644
--- a/arch/arm/boot/dts/mediatek/mt2701.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt2701.dtsi
@@ -160,8 +160,7 @@ scpsys: power-controller@10006000 {
 	};
 
 	watchdog: watchdog@10007000 {
-		compatible = "mediatek,mt2701-wdt",
-			     "mediatek,mt6589-wdt";
+		compatible = "mediatek,mt2701-wdt";
 		reg = <0 0x10007000 0 0x100>;
 	};
 
diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
index ac70f266d698..5a6c9763bd6c 100644
--- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -53,7 +53,7 @@ soc {
 		ranges;
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt6572-wdt", "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt6572-wdt";
 			reg = <0x10007000 0x100>;
 			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
 			timeout-sec = <15>;
diff --git a/arch/arm/boot/dts/mediatek/mt6582.dtsi b/arch/arm/boot/dts/mediatek/mt6582.dtsi
index f941ea44898a..501aeb3a2848 100644
--- a/arch/arm/boot/dts/mediatek/mt6582.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6582.dtsi
@@ -63,7 +63,7 @@ soc {
 		ranges;
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt6582-wdt", "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt6582-wdt";
 			reg = <0x10007000 0x100>;
 		};
 
diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index aa42377b47da..48d6c348f667 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -281,8 +281,7 @@ scpsys: power-controller@10006000 {
 	};
 
 	watchdog: watchdog@10007000 {
-		compatible = "mediatek,mt7623-wdt",
-			     "mediatek,mt6589-wdt";
+		compatible = "mediatek,mt7623-wdt";
 		reg = <0 0x10007000 0 0x100>;
 	};
 
diff --git a/arch/arm/boot/dts/mediatek/mt7629.dtsi b/arch/arm/boot/dts/mediatek/mt7629.dtsi
index acab0883a3bb..b034e9ab5af1 100644
--- a/arch/arm/boot/dts/mediatek/mt7629.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7629.dtsi
@@ -141,8 +141,7 @@ topckgen: syscon@10210000 {
 		};
 
 		watchdog: watchdog@10212000 {
-			compatible = "mediatek,mt7629-wdt",
-				     "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt7629-wdt";
 			reg = <0x10212000 0x100>;
 		};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 8ac98a378fd6..fe81faee0b0c 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -218,7 +218,7 @@ scpsys: power-controller@10006000 {
 	};
 
 	watchdog: watchdog@10007000 {
-		compatible = "mediatek,mt6797-wdt", "mediatek,mt6589-wdt";
+		compatible = "mediatek,mt6797-wdt";
 		reg = <0 0x10007000 0 0x100>;
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 158bd9a305d7..0b5ffe9fa806 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -322,8 +322,7 @@ pio: pinctrl@10211000 {
 	};
 
 	watchdog: watchdog@10212000 {
-		compatible = "mediatek,mt7622-wdt",
-			     "mediatek,mt6589-wdt";
+		compatible = "mediatek,mt7622-wdt";
 		reg = <0 0x10212000 0 0x800>;
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..04b91b751853 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -528,8 +528,7 @@ power-domain@MT8173_POWER_DOMAIN_MFG {
 		};
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt8173-wdt",
-				     "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt8173-wdt";
 			reg = <0 0x10007000 0 0x100>;
 		};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 2e782558fb77..2b5b761b92c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -469,7 +469,7 @@ power-domain@MT8365_POWER_DOMAIN_DSP {
 		};
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt8365-wdt", "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt8365-wdt";
 			reg = <0 0x10007000 0 0x100>;
 			#reset-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..515eed0bee21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -203,8 +203,7 @@ apmixedsys: apmixedsys@10018000 {
 		};
 
 		watchdog@10007000 {
-			compatible = "mediatek,mt8516-wdt",
-				     "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt8516-wdt";
 			reg = <0 0x10007000 0 0x1000>;
 			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
 			#reset-cells = <1>;
-- 
2.54.0


