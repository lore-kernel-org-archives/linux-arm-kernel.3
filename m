Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86810FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 02:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=; b=DZvuFbO3J9E8i+mfsq/7YbW8LF
	EGCoCixmhpIOSJIl3jG5HIMzP1k2nzzIGAreYYwU8qEs6xLPuoQqhGvXPdfSljYFgSniuipG/DSfJ
	+Ij/tJ5W13KfJ0x8pgLkjyOLfk51cxC4xdYY1Pt5OJN4giSq9WyyqVuhtYdxWQPUUSt43BAbna/ab
	Mi2XBaDJm1PiwDD1hFFKG7VrJ1iucvpQS7wgPaDPIOPywiMZgmEIX+2qrCsi6m4b5Jcj8F341cKqI
	8qi+Cvm0rjT0flOqbuxx0j27I2C05qiC13KWMnVAGXdc3hge5iRKTpf46rw9bDDmCtiVT7svTB87A
	H1iImKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHuxn-00000002nly-0U8V;
	Wed, 29 Apr 2026 02:47:47 +0000
Received: from mail-oo1-f98.google.com ([209.85.161.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHuxk-00000002nkU-1hvD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 02:47:45 +0000
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-679f6ee3fb0so4657566eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 19:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777430861; x=1778035661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=;
        b=M4iH1HjYN51441MU/+7zlz9qDZKeSVk1lHDudlYOEBmgo7UkMx9z9ISdtbhyrUcVpS
         Z84DldR38esU4UyevpNRBYpGojqUgRt4GvKsRjeWBIPLt4NHTxSN2VlS854ypc9/AYKw
         LknrYcCmzF6XOO3yfsDmwg//Zy5rx6OMeFlmM78tsJgRjuVhU9S74yOTSY4w8XF2RhwU
         khR97PZ5up+l2Vy9tZH+5EUTsrgG2LoJWiGVkgdYlGavFFMk8/+tQ7QUDVjqCBUhCKAO
         KyIUVkBp58jmsoWmRTK+tA+/AUxfPEuKri6DGYkkiCIf+eS5lUVWmuuH6rRht6n4eMdW
         MXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777430861; x=1778035661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=;
        b=OZl0CeeoLsChBrcaWr0CFSFwthn6ahSChCkbT3qQo9YptxwRpXkTccO4do94463oOC
         kpb94s55S/MXtjuK16ujfi5M90Of8gS1gsWDVTmaLVd24DxzDtWONxvWWBFOq1WKMQ4I
         F7s2rU1piSo7gL9kmcNRTg6d78sQCPNdMrDiQpuMZPDXy8lE9Zq+8zaZOwbd8W0l6WIL
         /5Efly16hqIeQv9E3Ub+a3+2nPgZVJfM20TlHTMnm9FVSOqfMKZO1/Wi667ymFXpG49y
         BNOxButXvZqgV/4ofZlBNwZveU2QObr++C1jLM+WqGx+uM9Ga7lWUKTa1uCbBGTWZgtq
         GzfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zTI7tq1E9M9msOlTJ7NRU26MVVAK+D8woxQ5L5ckmfncPU3Q0prq37dGZ4OapHTYiRqCaEkw5gleTkcQ7XU9J@lists.infradead.org
X-Gm-Message-State: AOJu0YwpVUT8X7z/FDJ+VoThOAyZBl+MIRA0G/M8ku9nOMp5EWZsviN2
	szRtNDjpLs5xf4A7dAA/gcwk1LTNWt/S3ZdoH+zcW8N4V4m3iBaLOKMsb1i1zVsFqX5n+98jHO6
	BDEmkrCHdlA/SWDQxaGznIGz5hJoOBCxUSU5D
X-Gm-Gg: AeBDieslq3bMBK2M4kQqtWmvIUcmYI/49D6MJxQ2HHxe0jZWDNPggNJRXlt0flCz3Hg
	mXDflY1UTYYL5GTqG4shUqP+XEQF5x2qHH/GKWCFIELNigBevEcAaBUO7ETvHa9CkFml3gp8DZ7
	U69ZV2R/CUR+LnL8BmW/mzE4yL36/wsGO3Tvb9j8cFRnqG3g6xGxdUEV12wymiY4qk2f7LE0LZQ
	QDGbq4VS3nu3h6JvZu01+FjJV55uhzjOPLquNBrHxdJ1wj597XG1sX2h0vGMvNp2RnIIu8a4Moh
	iLghaN7aqBzPQM8Wbxu8e87xW/HGX6kLk6ngWPujFLZZsi/wP4FJjUA7u6AmmL6psxnk9rif2Nv
	Pac9VxLo3Wlp+fjSEWEPC/HhrvN0q/M75eSLI2zvVqxDhzToWb/6LVzA=
X-Received: by 2002:a05:6820:61d:b0:694:8ba4:e3bd with SMTP id 006d021491bc7-6965cb725e7mr2917108eaf.36.1777430861570;
        Tue, 28 Apr 2026 19:47:41 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4340e711c00sm110958fac.5.2026.04.28.19.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 19:47:41 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v9 2/4] arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels to match schematic
Date: Tue, 28 Apr 2026 21:47:33 -0500
Message-ID: <20260429024737.544813-3-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429024737.544813-1-dennis@ausil.us>
References: <20260429024737.544813-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_194744_458352_07824BE6 
X-CRM114-Status: GOOD (  10.29  )
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

The Orange Pi 5, 5B and 5 Pro schematics label the RK806 PLDO outputs
using the pattern VCC_*_S0 / VCCA_*_S0 / VDDA_*_S0. Rename the base
dtsi regulator labels (and the es8388 supply references) to match:

  pldo-reg1: avcc_1v8_s0 -> vcc_1v8_s0
  pldo-reg2: vcc_1v8_s0  -> vcca_1v8_s0
  pldo-reg3: avdd_1v2_s0 -> vdda_1v2_s0
  pldo-reg4: vcc_3v3_s0  -> vcca_3v3_s0

Also update the saradc vref-supply reference to track the pldo-reg1
rename. No functional change.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..fd5c6a025cd1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -274,10 +274,10 @@ es8388: audio-codec@10 {
 		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x10>;
 		clocks = <&cru I2S1_8CH_MCLKOUT>;
-		AVDD-supply = <&vcc_3v3_s0>;
-		DVDD-supply = <&vcc_1v8_s0>;
-		HPVDD-supply = <&vcc_3v3_s0>;
-		PVDD-supply = <&vcc_3v3_s0>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcca_1v8_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcca_3v3_s0>;
 		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
@@ -441,7 +441,7 @@ &rknn_mmu_2 {
 };
 
 &saradc {
-	vref-supply = <&avcc_1v8_s0>;
+	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";
 };
 
@@ -666,8 +666,8 @@ regulator-state-mem {
 				};
 			};
 
-			avcc_1v8_s0: pldo-reg1 {
-				regulator-name = "avcc_1v8_s0";
+			vcc_1v8_s0: pldo-reg1 {
+				regulator-name = "vcc_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -678,8 +678,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_1v8_s0: pldo-reg2 {
-				regulator-name = "vcc_1v8_s0";
+			vcca_1v8_s0: pldo-reg2 {
+				regulator-name = "vcca_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -691,8 +691,8 @@ regulator-state-mem {
 				};
 			};
 
-			avdd_1v2_s0: pldo-reg3 {
-				regulator-name = "avdd_1v2_s0";
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-name = "vdda_1v2_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1200000>;
@@ -703,8 +703,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_3v3_s0: pldo-reg4 {
-				regulator-name = "vcc_3v3_s0";
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-name = "vcca_3v3_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <3300000>;
-- 
2.54.0


