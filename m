Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA8CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YwHUBeh8oC7O+HsWTZQdqDGpueop4Ts+TE8xfJfrL4E=; b=3oyPNwnVHYBXFzFZyedG8uWmur
	y5PN4xUfW8Wp9P5oKVI8WjipfaN/0QcvYtSH1RCCB6f6z/ienb8vG4eIC5WdvFw8HeZGCnai+0gKV
	r2e3IczJ4pOAWpqMpoM/wWGBOKhlK7U8EO0WgQQj4DRfNhj1VBci1lS6jvHvCML7POQLKHNWoONiW
	8DgoKtTsSu8XTYnjqnC4G0oC7mfxJjf87l3QO22mbrUebGImJn3AVfNODQHbd04aiy4l4VcBRIkt/
	CBs/TyCiVxHRCwizXdI3W4OwRZ0LPQ976CVRUYyxBAbV1inJ3ZxsTxew4DHf4qr4TgwOh4Iem1gIM
	GUsdzetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dGT-00000008cgL-2LGG;
	Wed, 09 Apr 2025 21:47:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cNs-00000008V2e-29j4;
	Wed, 09 Apr 2025 20:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0222461127;
	Wed,  9 Apr 2025 20:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D81CC4CEE2;
	Wed,  9 Apr 2025 20:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231851;
	bh=su9Uh7Pi40fxFZ7vHnTKRixkxjUDpywPMqGDrqPiOAU=;
	h=From:To:Cc:Subject:Date:From;
	b=Jm406k92ZdDOT1gPRSkmNrzswkzv/1WU2CYxnhW1ns6PpUTt2flHEkckgd92ceiF4
	 I91AmhUC0gXAGcgI2eKqmnFX5epOd50vseeznsxiuac5Cn3RqEHjhsSyJIprPUQSTe
	 M+5VhG0jHdyuakEhzGdUyIeYwG0sdVEJvnyKOrSO5DyqyW+yhKNEWqUQYqgwIsadYK
	 DZy9aeDFUrD1SOljbjrkb7Zqmbc8DH8zxVp0qw+0BP1XA4/t/qPTCmzoiCdy2krU6w
	 kr060D8IaiFUvJKA6HPJy0apYv0M84QZ+8N5wNK0dW0Na/M/X4HI9AXPILS2bVXMyh
	 4zn1pgeUDO27g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: px30-engicam: Use "regulator-fixed" for vcc3v3-btreg
Date: Wed,  9 Apr 2025 15:50:46 -0500
Message-ID: <20250409205047.1522943-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The vcc3v3-btreg regulator only has 1 state and no state gpios defined,
so "regulator-gpio" is not the correct binding to use. "regulator-fixed"
is the correct binding to use. It supports an enable GPIO which is
needed in this case.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi          | 3 +--
 arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi         | 2 +-
 .../boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts      | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi b/arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi
index 1edfd643b25a..a334ef0629d1 100644
--- a/arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi
@@ -31,7 +31,7 @@ sdio_pwrseq: sdio-pwrseq {
 	};
 
 	vcc3v3_btreg: vcc3v3-btreg {
-		compatible = "regulator-gpio";
+		compatible = "regulator-fixed";
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&bt_enable_h>;
@@ -39,7 +39,6 @@ vcc3v3_btreg: vcc3v3-btreg {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
-		states = <3300000 0x0>;
 	};
 
 	vcc3v3_rf_aux_mod: regulator-vcc3v3-rf-aux-mod {
diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi b/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi
index 80db778c9684..b60e68faa83a 100644
--- a/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi
@@ -26,5 +26,5 @@ &sdio_pwrseq {
 };
 
 &vcc3v3_btreg {
-	enable-gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts
index 165d09ccb942..5886b802c520 100644
--- a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts
@@ -39,5 +39,5 @@ &sdio_pwrseq {
 };
 
 &vcc3v3_btreg {
-	enable-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
 };
-- 
2.47.2


