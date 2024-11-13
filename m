Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2FED41C24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLcSgOR7aLvQVOBAvpbksa+9sDVbJ1+E1YZiE5RshU4=; b=Oeqw7geZTwvLML0fEx9h4tEXx0
	KbC7tTK0rcAWLn75ZdmVacZuaf3lopGTkvpzN4ruBTUj5gcADKC/fheFmf6+Mo6QtdJ5Okct3FO8p
	UOlD6Iix2BYhQsWtu0k+BGoidov19ZeOWAUKJA1KGWQBMtsy2N2pfvxoDPZQUtur5YYXpGKHL2WwC
	YTbTLLLY5wVu/TZrzAiUAn5u+zo7ctDhSHSlirhAf3BeluAX5trmqVA/BPe7Fuw375FtK/ROsRjFs
	HLAKlpE3fmu01RiZ/o40PqkwKTyCu1OTtctyqqF0YfRf/GVvttrDROyoGNovv9rvg08nfiroZRqyX
	ah6s+Pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9vC-00000006H9a-1JFI;
	Wed, 13 Nov 2024 09:44:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9om-00000006G94-3lDj;
	Wed, 13 Nov 2024 09:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=QLcSgOR7aLvQVOBAvpbksa+9sDVbJ1+E1YZiE5RshU4=; b=AknUwHG+oWVLpffYsEjJuU3kD8
	ozb1eUVzoWu9rlAgvvGkzc+QlqTosjf3JR+fKxr56JETqO+K9+Y6fpTbGxuCd1nvd+Yd1wRXqcsHq
	DhzT6qAiNKLwKUMmHxqnJ7jc2jzJ4B9kB0wOeBbzEnQMxRepzix8y8/E3g0uDkjX7uc45yv+HzJB3
	/4+lVVx/ZNhjN7GZFeIIWHdJz8CFikiV5kO9wCap+YFZ6IhT1kU6XwtXAx2JaFrTtWrPgH4M392us
	AqizYdalhw8wLHQDwmLS7xrIB4ErzD1mqPDi2HTecjAjnlGMx8pYh2upU92XC6ehCnhv+pfO8h1Mw
	FPF3/ySQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9oi-0000000DDvJ-2MJv;
	Wed, 13 Nov 2024 09:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA136A40694;
	Wed, 13 Nov 2024 09:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C410C4CEE3;
	Wed, 13 Nov 2024 09:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731490656;
	bh=emTg6gDh6BXC5WxZiY52CWHMm6aFR9q/BDSunW+ZUto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XiKqSUHLDjA6Tzt2f5SPY3sJde3lPOrmOpU3HZxIxwCbpVpPAb+BikJ4a1N3TCXNM
	 6bbKEl9vIM5u//JwkzJXH02WpJR0zLceVNPeJ4eb3JXAWHwRZqXykKqP9Gnt9AoGy+
	 j6csyDjy1xAcElkcRJbQWg7Bxch+0yfVDaoc/rHHPhz7mD0aj1ZKvwpmyaxtFfyJql
	 aPAKMdhokXAcFICMfbBmEaZPRq/8V6PqGImFvf0NtFRtDT/paHOKc/FiGgJhALAzaF
	 Lf24WwjXtU/CejQ6Jv9OIH2jt4ldUYrk99ImPGivT4LPCRDMZzdtinLv92miF/Aay1
	 +DAgrfxlvgBmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00195D41C26;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 17:37:32 +0800
Subject: [PATCH v7 5/5] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-a4_pinctrl-v7-5-0546a20c1c22@amlogic.com>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731490653; l=1622;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=BwmmxNbUHc87jVbNysKI2HGP1eTeZdpPlPo2pspjE6Y=;
 b=hn2p1wGZPfsXzU3Bx5wf7JMYkfyqeofIhyhq1sVoKupzAstVpSTr/QNt5Byp5/Nmm8EmodgyD
 FLLm00mF8YTBhXAYtT04iaM/UEpYoOIAFZTIQ87PBqeGY+wR6vPUKdv
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_093741_289249_BCE171DA 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..a176faf7f1ef 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/gpio/amlogic-gpio.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,38 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,a4-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
+
+		gpio: bank@0 {
+			reg = <0x0 0x0 0x0 0x0050>,
+			      <0x0 0xc0 0x0 0x0220>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <3>;
+			gpio-ranges = <&periphs_pinctrl 0 0 73>;
+		};
+	};
+
+	aobus_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,a4-aobus-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x0064>;
+
+		ao_gpio: bank@0 {
+			reg = <0x0 0x00 0x0 0x04>,
+			      <0x0 0x04 0x0 0x60>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <3>;
+			gpio-ranges = <&aobus_pinctrl 0 0 8>;
+		};
+	};
+
+};

-- 
2.37.1



