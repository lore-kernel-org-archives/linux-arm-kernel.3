Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCF9FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=; b=e+W081cR0DKVs6dtNrB8wvKIP8
	hys/OwK4ch84zaGtTKIEn7+iSJ67/AIuzNFmZZ0q0Ltco/DpOf7HD34SaAaG4DFghuJqgAQyEBdA6
	23idwx77AGj/YGbZpgloEgsNIUR3hDKclmDBNwNx+tTDxg1M1YntMcc7W8a4N2Pe5yJwQcUJZKRIt
	XV0esom4roGoVMSdfyFLXEH2ItLOoaGgRXnEjJN00WZ+bSf4tNVoPNr9YQmVZn5zsdBed/2sbJmZd
	K8ZVlhngiMDqNz2/JGNvb90/Sidtydj5tgX9Tq/B8vMd/6f0fI44mkUu2dfeQoCVJmcKowfb3wqTs
	kbRi+2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnV-0000000Fqtc-1NwP;
	Tue, 05 May 2026 10:14:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnT-0000000Fqqd-1V0E
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=; b=a+R7Fd8fi6qIYVkdnG4VZHwi01
	932hQTk6NOepvxIeayTozlmfCD/reHGaRVWZF8RYa/4AEtdYmRgbj+xQEXL67kYL8oEkFiGLY6Ryd
	RXwTM973F6l+tH+/R4vGuBRPRlZho+6/r9UJVvdVimieDLc1gNbI0lSq5ZYlMssk8ABLpKffAyatt
	XtEGtBonvzDw62D7WYXizZMRMXS9QqWCVI9A2t7CVWKgSunv9+M6MOngC+v7DpvIpUphj3LTmyaRw
	U47gia6AcaDgDzBVnmDV/P2fxodXxhh84wUA4qHMwYXw01BeSv7X5XZsjoA0NDtEv0xw8zrt6arak
	baa1N42g==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnP-0000000D9Vm-1L6N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-837dfccd950so902496b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976069; x=1778580869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=;
        b=oQXULrN4vYJyKvjGLGGkeWgvvcjinEX8doK6Ada1RA02ynZfZ5NrwobUthHk2yLS26
         Sa7fvRd33KZEt1T4BYtJhNNzniGzsQtLMNrdKugRdWeC+mhAgRapIvHvKaQj2dip+qum
         97VWr9XvVXFarbEP63mvv1B5meVpJLxpKINoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976069; x=1778580869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=;
        b=YjLoGQhjxDvAk9c6RVxDmK1nixhfvGMZh2nUNnQqJUcqmC/O4BsGBvi8VuscY6MrrT
         JP0TIV4I3SipmuP9oMtkaib3MJkLUESmgBHTnvAxbdWp0tcvvnLiCnZjSCv0EUWicoIo
         VglLraubtpquEiOxJpKvD8AcryQCn4wRuNgrdj65lQdUAUkTP+Ainc3EZIjb6aTC55De
         zMgL3G3Yg/rc6KjNk+fNBLpkAqLN5L4u3643CGdUxsdqmmIIJ7CNR6HX3c+Bz29oq9Gn
         VLjk0qgneQzu1UmM+lgZO5i/kDJ9NjIZNw3WxMtQ8lcIE6xA9pfORIIscWRz7RgDV5O7
         h3Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/dPXdW9htN1bRmXujBdN/TPhWGnULS7p7OaV5xEnlVoOufb8XXxl+bFXAv3hCDrcJx2x0oXi1VUuAeERkHmI2Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxawzebaBrJXAl9ivFvT0nxnKCfsaoR+QMEdmlP1psYLheTBeM7
	FMl3lNW4OwChpLNrkl77xr/5zwVvUs8N2E/YacCEy+XvqgXoCrFKqeAXiaRnGg1NRQ==
X-Gm-Gg: AeBDieshWvEVhWUg9oa56l93CyTV6aM7iJ9H/ZLLDg4Dmcxd5yAwfzCL8GczOWfecBJ
	KacD5MB5rZEHfEIt2cw6uSXglqQGHQtU4BHA2xsTI+Pl7wrtdasbLdwN8ZZiem90b1G4ZB/AGwL
	EG88d6N96hOZ22gbtrbGAZNS+dUKQYWZOpKAcJEITtFoH7XI0h6FfwJ/NqEkiYd6XAhtMeMGQt2
	wNDhDi6Oujy+eJVqMRaI/Y+khnvS0zGJfptfo9NgqpeEefBXD5TZRSreiYY6iEGSjcGpLCBgQ6o
	h9ukvqv6Fb5TJz/46EFbeNLLFAig7/SFedb/bxeQ93cMxbZ1+xw25v/ZO3S30nLmiWKhlDpzBux
	e+UnsY5jJkM6jpjCgalg0oLj0VKDEpyavGTGETr9rJtdlPO2MVXEawpGo80nR4hGKIGbmyy+pPP
	si5gm6Q5WAKjx9NwlVJXTD4cH++3RtTH5bgyAegjoFJty9gujPPLNmFkqksvqIsXdcfq6tBsSd3
	R0dxgaLXGnihBvwTAU=
X-Received: by 2002:a05:6a00:1783:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-8352d2024f6mr12963934b3a.30.1777976069323;
        Tue, 05 May 2026 03:14:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/16] arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
Date: Tue,  5 May 2026 18:13:54 +0800
Message-ID: <20260505101408.1796563-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111431_466447_951EA6C7 
X-CRM114-Status: GOOD (  12.08  )
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

There are two MT6315 PMICs in the MT8192 Asurada design. One has two
outputs ganged together and two outputs unused. The other has three
outputs ganged together, and one left independent.

Add supplies for all the used regulators. In the case of ganged outputs,
add the supply for just the first output.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Fixed pp_4200_g regulator name
- Moved supplies to PMIC top level node
- Added all supplies

All supplies are connected, but since the regulators are ganged
together, only one regulator node is present.
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 8054e2d20bf1..13960d1c8a02 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -175,6 +175,17 @@ pp3300_wlan: regulator-3v3-wlan {
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
 	};
 
+	/* system wide switching 4.2V power rail */
+	pp4200_g: regulator-4v2-g {
+		compatible = "regulator-fixed";
+		regulator-name = "pp4200_g";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
 	/* system wide switching 5.0V power rail */
 	pp5000_a: regulator-5v0-a {
 		compatible = "regulator-fixed";
@@ -1604,6 +1615,10 @@ &spmi {
 	mt6315_6: pmic@6 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_g>;
+		pvdd2-supply = <&pp4200_g>;
+		pvdd3-supply = <&pp4200_g>;
+		pvdd4-supply = <&pp4200_g>;
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
@@ -1629,6 +1644,10 @@ mt6315_6_vbuck3: vbuck3 {
 	mt6315_7: pmic@7 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x7 SPMI_USID>;
+		pvdd1-supply = <&pp4200_g>;
+		pvdd2-supply = <&pp4200_g>;
+		pvdd3-supply = <&pp4200_g>;
+		pvdd4-supply = <&pp4200_g>;
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-- 
2.54.0.545.g6539524ca2-goog


