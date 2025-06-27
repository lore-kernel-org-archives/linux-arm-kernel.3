Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69380C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJDvBGyHImOjLMbMlylERVMAfTrZLH7q5YtWvNoL9AM=; b=0cOK8ECGVuNLS92Jl+XoMfjDqO
	gIHl/HK0qtjDRcLAZBO9oTwPVB950qnnCFl11mH5IPgvZ0ShQ6Z1J876S2a1j0TcdxkLkDw9cevw8
	MpSdXzcM/XT+hKv4QWnFL9RK2Yv7NLQf0JzOyV0HWvYXngib6LVXe8C5qFD3zkig3GAy26vJSkvhH
	KyaHmajtc0XDIox3o+RUW+oeJq0F8rxfHLiljENtJnY44YVnK1zGhdxR3Qmbxrwzgyqxm0kcyRAL7
	TJHvkaoTnC3GclLkhO/ZSpewbX3h/qfnxUgyAVNuN4m2zC0j3igKvDvdeeTqBhMmGaBBTkuJP3qfm
	kO4zRk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV73s-0000000ERtk-46LA;
	Fri, 27 Jun 2025 11:16:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6is-0000000EMyg-3cAX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Jun 2025 10:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OJDvBGyHImOjLMbMlylERVMAfTrZLH7q5YtWvNoL9AM=; b=a4tuxq/Ihl969IZQitu+4g3b48
	1gRlMaU7LH8qOozRf8aaqa/Ae6WpWBqmz7n7q/srknnnIIxyK5unA7s3LPVgBNom9voqtqaWdBiWl
	bcxDoQ2hheO4NgGlciR+bVyhH78Rgwgqeg6tukAqvZ+mEQEcQvJ0QrsrCGEKsEIXE/BRXofFuoOwb
	zOruxHGOlquBzBHUsWDR864VdA6auk5cE9RYBJn7/JsAMv2dY4qZ66Sk67XC0dhPqfoFYkSi/Db4V
	csh0DK5Z2SPePrkRcld89SnWfujfUn280Fd4y+7y2kpZFXvt/tsWjGt/Abz9FQeLgG6Na/xp7rtur
	kvOjqxVQ==;
Received: from smtp-190d.mail.infomaniak.ch ([185.125.25.13])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6ip-00000006J7y-1c2V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:54:21 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bTC9P1q2ZzZJF;
	Fri, 27 Jun 2025 12:54:17 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bTC9N13KQzw8D;
	Fri, 27 Jun 2025 12:54:16 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 27 Jun 2025 12:53:56 +0200
Subject: [PATCH v4 4/5] arm64: dts: rockchip: force PMIC reset behavior to
 restart PMU on RK3588 Jaguar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-rk8xx-rst-fun-v4-4-ce05d041b45f@cherry.de>
References: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
In-Reply-To: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_115419_546942_715A3AD9 
X-CRM114-Status: GOOD (  10.60  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The bootloader for RK3588 Jaguar currently forces the PMIC reset
behavior (stored in RST_FUN bitfield in register SYS_CFG3 of the PMIC)
to 0b1X which is incorrect for our devices.

It is required to restart the PMU as otherwise the companion
microcontroller cannot detect the PMIC (and by extension the full
product and main SoC) being rebooted which is an issue as that is used
to reset a few things like the PWM beeper and watchdogs.

Let's add the new rockchip,reset-mode property to make sure the PMIC
reset behavior is the expected one.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index ebe77cdd24e803b00fb848dc81258909472290f1..176925d0a1a809d1e2500f5e5efbbfa6a6d0bd42 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
+#include "rk8xx.h"
 #include "rk3588.dtsi"
 
 / {
@@ -693,6 +694,7 @@ pmic@0 {
 		vcc13-supply = <&vcc_1v1_nldo_s3>;
 		vcc14-supply = <&vcc_1v1_nldo_s3>;
 		vcca-supply = <&vcc5v0_sys>;
+		rockchip,reset-mode = <RK806_RESTART>;
 
 		rk806_dvs1_null: dvs1-null-pins {
 			pins = "gpio_pwrctrl1";

-- 
2.50.0


