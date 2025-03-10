Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD935C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G90UB1UvzNNgGavSwYmoTepOzDrA/XYawqsQEZns3Ic=; b=lGtXcTq3DzH3pu9cwpUMq0dL2L
	ynTI5LVPi227DmfKGck13/myz+kZL7ogZUWo9SdOz1qM5huafyIOUXMwlev59AAK7TZVCbgYPkAq5
	tdCg9NuaE/jGOo6DOkx7Fu0aQ7jBwR9ykne7FtsuaNQhGtmAO54qVaSHBdbJ7ynGvtuQd2WJBU5Sv
	0IXF55EvKgHa1dBOVPgLtDT1dvdfZj1aafKQhEawJNUjvBcKJZUhk01KVVNsFOeYY7ahr68trEn0+
	122XEm0DVq7EOlGPpN4IHJIeiyyo5BOWdtYsP3MSZLT65ocs94asIo2qxwJ3G7/SoI1OSo+PMa7uC
	zj/GCL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tres9-000000038pK-2gnk;
	Mon, 10 Mar 2025 15:16:54 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdqd-00000002tTR-4ADk;
	Mon, 10 Mar 2025 14:11:17 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 55FF820E07;
	Mon, 10 Mar 2025 15:11:11 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNrT02Q0KMYU; Mon, 10 Mar 2025 15:11:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741615870; bh=h7IG7Iw5c8FBRHktz05awjGUOLRAhFTuYTO3Fk3rjPg=;
	h=From:To:Cc:Subject:Date;
	b=LrCLI2fmEFFUjqJfD6ojRGOv5jvEJu08U1Mycn2bhc1P+G0yAf0j+SEqO3LDGQbTQ
	 T9ejM1B9XkwiWNjm2+h9NHjdzLEFwVM6MyEjkStLJzHX81iTKMfQlerSkboX0A1q+8
	 aO0oDX1Vo/Q7F9v+SacOUcZWeKLTVqCNq/LmVWVuEbZ9M7EJ5PRVIXjw/gQIykemc3
	 JgspNxqf8lJVuzWYYN1fPlXHbqsBRwGdGcvHjN0aoPuTl7sbFxx1JgVDLhrNRVl+J9
	 iuoIqcs21uSNXl1k9aoIMnx62lKmQTaS9f9JJIczdDuGtLgZeN2szmEf8VAT59f4gF
	 Q6bBtONyrrSFQ==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andyshrk@163.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Jing Luo <jing@jing.rocks>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix PWM pinctrl names
Date: Mon, 10 Mar 2025 14:09:17 +0000
Message-ID: <20250310140916.14384-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_071116_439969_F0C18DF0 
X-CRM114-Status: GOOD (  14.44  )
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

These Rockchip boards assign "active" as the pinctrl name for PWM
controllers, which has never been supported in mainline Rockchip PWM
driver. It seems the name used by downstream kernel is accidentally
brought into maineline. Let's fix them.

Fixes: 4403e1237be3 ("arm64: dts: rockchip: Add devicetree for board roc-rk3308-cc")
Fixes: 964ed0807b5f ("arm64: dts: rockchip: add rk3318 A95X Z2 board")
Fixes: e7a095908227 ("arm64: dts: rockchip: Add devicetree for NanoPC-T4")
Fixes: 3f5d336d64d6 ("arm64: dts: rockchip: Add support for rk3588s based board Cool Pi 4B")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---

It's uncommon to have a commit carrying so many fix tags, but otherwise
four seperate small commits will be created with the same topic. I'm
willing to change this if it's inappropriate.

I don't have these boards for a real test, but the change should be the
right way.

Thanks for your time and review.

 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     | 2 +-
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts
index 629121de5a13..5e7181948992 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts
@@ -147,7 +147,7 @@ rtc: rtc@51 {
 
 &pwm5 {
 	status = "okay";
-	pinctrl-names = "active";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pwm5_pin_pull_down>;
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts b/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts
index a94114fb7cc1..96c27fc5005d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts
@@ -274,13 +274,13 @@ otg_vbus_drv: otg-vbus-drv {
 
 &pwm0 {
 	pinctrl-0 = <&pwm0_pin_pull_up>;
-	pinctrl-names = "active";
+	pinctrl-names = "default";
 	status = "okay";
 };
 
 &pwm1 {
 	pinctrl-0 = <&pwm1_pin_pull_up>;
-	pinctrl-names = "active";
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
index b169be06d4d1..c8eb5481f43d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
@@ -603,7 +603,7 @@ &pwm1 {
 };
 
 &pwm2 {
-	pinctrl-names = "active";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pwm2_pin_pull_down>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 8f00e0444c00..8b717c4017a4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -433,7 +433,7 @@ &pwm2 {
 };
 
 &pwm13 {
-	pinctrl-names = "active";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pwm13m2_pins>;
 	status = "okay";
 };
-- 
2.48.1


