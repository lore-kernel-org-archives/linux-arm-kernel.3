Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB363C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgqY24t2LnW9I+18Wnpp+SZS+jYp8rky2mYR1kjD0VM=; b=FRLCaGJvS7SpCi+mF57NBa2n81
	EBtTtFhZP2i5XIxVzPVlru75zDzSpdBDUbi5jsmGzHEIYB0NUZqvvQ+eHLPd1rig5PBvb9WuKSOmC
	iwQu9P7ozYg+VLPUySGm+2f7EmIWXsBPvDocx3RInc915/tQ5PCpb8Yr99MuhPnVqVsINLyM+f1ZM
	V/qLcVfH20Ev1VOxzPkG/HTnHOGmbrYRvr/aNgpTYNhoq3Uh17fuYD1u2jZhXo3XfJ0VnEIQONLgA
	r/gXwyGvuJ/E5RtUMM3TPW9/yIFaAg678d9xN4bTrOJSvMJ7k+lcy9cDP7PZF4FW5mEp5mOQv6Syp
	mgtMZ2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFx7-000000029CY-2mcx;
	Mon, 27 Jul 2026 07:40:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFwy-0000000298B-2VSz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 07:40:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1036771f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785138035; x=1785742835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgqY24t2LnW9I+18Wnpp+SZS+jYp8rky2mYR1kjD0VM=;
        b=f47f5ugKXaP8Ho0t0SF/dE1srlXV6E9d9FE87AhkArMqi9i36xuioYipv9LvskNvp1
         6Sp0cUxJRO9flitVVBUuzITcZ62BZGWP1kvFCae8tVsYUu4mIrc66aVZf4HEgvDbZUTM
         r8N/cWtumzGp0+3SGzjVu2/x2PtjsR/UgbbN7SLZylaUoajXepzj09Sxl5aozrZLevMh
         ktWDy9iXshbidjPrjTE3VwursJHTIgamTlDJq5YlVqTHeEiRyPUdPijmIQ5otgWKxy5L
         9r7cdQgC/3D13s/XiXx8hbdyTW5P57QSnUMj+KEEFvL5NMh7ECdqYzYMXCQb+cu1Juic
         unqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138035; x=1785742835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgqY24t2LnW9I+18Wnpp+SZS+jYp8rky2mYR1kjD0VM=;
        b=kcyK1XJgtfAsFTAS5wAqRQ5IY7tjDU/AEnqMu+F6UQOaOftE34VEEdHjfdWyRhxhNc
         i943jwkjOXnVSA7mzbW+mEnTrfWb77HRAlSbLPo6el5skxDntzxRd73Hyz9Slq13qUSs
         2juhGqinw1hNsKI4qQ1SmCfCSSOwoe8JAjDnd390ckRmK9FeyKvxyPrWQi3UfuPXhsEr
         NaRkNYmtEEVGvVDBkAbu3+AE2f9p0ViROcr0XqA1/Fa95MDOsdgXH7TpnyflNeClrHAk
         8zSf8up2f2VnBrFMuR1QXM9J8njO+r27SAr0poLl1AFMhHAGT3TZdTpPvexcpPK465wS
         JLQg==
X-Forwarded-Encrypted: i=1; AHgh+RrWqmeEz1+hTH5dxFAagzSI1GU/ONVPkuTRBD3t889MQGFXinNlIBI/ONIxne3NrvSUyGdcr/EhojlwnIkGc1CA@lists.infradead.org
X-Gm-Message-State: AOJu0YyLzKG+91OxnW5j7DoHUxhTq+YLDoF9LN0r4QpaM0eFASn+amDG
	NHMO/nLjl/cfuaVnh3QxuTL5n6nkPFhkoMXYUSLbIkz2UmqoCSIZK/HiVMfY/He9Nv0=
X-Gm-Gg: AR+sD13WmG++PgmzPWoK8tS0o5tuFEUErjIAKGDvhn6LOoTcAWvbWUFRD/dWz+cz83K
	vB15YdbnWLQKGY2T0sUNA67CA5v3poCLDrXH9Dz167bBs72UAyVx9s6ZJpa+yHW4/17T7QKpU0V
	GCjjTXTT97YgPZsPibgTp0YibweL6hntuqwp3FhMcRK3Z9m0YA8K4KrnJj01P/jiqYhtXUuoa/U
	m4vecHv5TrRzv1D0QSiry040iciv6IugGtQ6cuqjCUFuuaGPheMgqTyEhBOhQDP+yML+qcfceXP
	FLNSXF2mCitZLc2jzcMgrVYtpBmFovE8TnLqHYonqb6LbvR9F6xHa2Z9Hb8S6mao2cgw8fqcv4H
	Tb5KVyaV0Rm9EXNggnrpR0K3OR+7k2aScSecmWsyCynNrBLSeHcLOY0OrtzCKf4Fq5JsANhfyRD
	mRFVKU1Nud8dxZrUnsGxvtlzUk/tb6R6ipK8jqUBtCnAwg2NgQf/dABfUFC/hipxpjsNBxjOh1q
	9wR5VzBGdj5CS8=
X-Received: by 2002:a05:6000:188e:b0:47f:7759:89df with SMTP id ffacd0b85a97d-47f9fc9d2d3mr9130842f8f.3.1785138034634;
        Mon, 27 Jul 2026 00:40:34 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43677682f8f.10.2026.07.27.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:40:34 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 27 Jul 2026 09:38:08 +0200
Subject: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial
 ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004036_737757_DC57C269 
X-CRM114-Status: GOOD (  13.72  )
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

On most MediaTek boards only serial0 is aliased, so the remaining
enabled uarts get first-free ttyS line numbers from the 8250 core in
probe order. When the console uart defers on its clocks another uart can
win line 0: console=ttyS0 then ends up on the wrong port and the boot
looks like a hang on the serial console, depending on probe order.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts               | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi     | 1 +
 12 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 0e086dd487d9..63659e240b1d 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -20,6 +20,7 @@ aliases {
 		mmc2 = &mmc2;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcd0: backlight {
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 8c3e2e2578bc..7bccad118d24 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 19f538d160ab..637e5567c1e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -21,6 +21,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 		ethernet0 = &gmac0;
 		ethernet1 = &gmac1;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 5d8e3d3f6c20..9dfd882ca484 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -16,6 +16,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index a8e257b21a88..ae957deac8df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -13,6 +13,7 @@
 / {
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
index ac2673e56fb8..233711cb4556 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
@@ -9,6 +9,10 @@ / {
 	model = "Google Hayato rev1";
 	chassis-type = "convertible";
 	compatible = "google,hayato-rev1", "google,hayato", "mediatek,mt8192";
+
+	aliases {
+		serial1 = &uart1;
+	};
 };
 
 &keyboard_controller {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 1f59b5786b81..13132a35080f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index a30ee523b0b5..c535de34dfac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -24,6 +24,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..26e24431d467 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -33,6 +33,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcm1: backlight-lcm1 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 888248a75e93..51f12328a1d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -17,6 +17,8 @@ aliases {
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index 9f5a0ec563e8..668985428fc2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -31,6 +31,8 @@ aliases {
 		rtc0 = &rv3028;
 		rtc1 = &mt6359rtc;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcd0: backlight-lcd0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index edc5539bebde..86e487fb1832 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -22,6 +22,7 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {

-- 
2.55.0


