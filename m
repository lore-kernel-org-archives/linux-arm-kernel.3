Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FF7C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kfcz1OSp0uhR4QDmkrBkP81wa9pmSwzd+Nppwd8uNas=; b=n9xsgTvoJtuwG9NoVXberatK3O
	195YICGgvvuKlQrtp9Tg3ZFiAeTOR7/rOLPSMZbnW4UVmBfLwk58XYJJzgi35guwOvmtHOTdnFBly
	uc4YJeMJpjkCr/+G3hjvQXLFpquZ/DBc3UMQgouxcvjpFe8FBjM/4mgxWiKHE5saD6gKYyP/kROea
	8t3ogRqgVJ5RhP04gjvuGriPdyZknHxpBU3clj45lr7eudB3efd0UTw+99AtrE7QBEatlcoMndbk2
	YZuntfqYnlMSLq4EDLarhwDEst0wkoMRalE9+GVRzIO2F2Qy8gOjmyY5GvI7YlK1CcUkES9oaDWjF
	bXVvA2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP98-00000004svA-0PTG;
	Fri, 21 Feb 2025 09:16:34 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP7a-00000004sSg-3oIR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A7E361190;
	Fri, 21 Feb 2025 09:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E32C4CEE7;
	Fri, 21 Feb 2025 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740129297;
	bh=FPSnej4gRORvz9fIoO0ZHKVoxlk58vTwK5PRU598Dfk=;
	h=From:To:Cc:Subject:Date:From;
	b=iT8H/NJ9b3Nb0+G0ar4ucq4X7ucegkJRj4HYn1Urba6EsbH0WMjy/Ivi1CXS1IoyE
	 /wumnkPZYHrIDSfMbfw3e/AHfFwh3Fk87Tvhg2/CGEkQVqy03Be90x6ObhnxiBbLeF
	 V1qASkjq2K8SqczFy3H1vwxp2iKN6Ax96ikLus0a3LbvDFPo6GRQOtPDzf+OJlo1oJ
	 mYhic2hQlq1YPJOdkpdLySZfeIVeOf3TiTEe3JZC/SPnX+ffz8ufV2K5nEr83sSaT/
	 UTeQJBSbAemajlSfDYgQMWOMyD5J7/8Wb35dYDOJ36RLSNmHdVl0i1Vr/WyFzUXp/0
	 O3RAiCLqSdcKw==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jared McArthur <j-mcarthur@ti.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62p: fix pinctrl settings
Date: Fri, 21 Feb 2025 10:14:46 +0100
Message-Id: <20250221091447.595199-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
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

It appears that pinctrl-single is misused on this SoC to control both
the mux and the input and output and bias settings. This results in
non-working pinctrl configurations for GPIOs within the device tree.

This is what happens:
 (1) During startup the pinctrl settings are applied according to the
     device tree. I.e. the pin is configured as output and with
     pull-ups enabled.
 (2) During startup a device driver requests a GPIO.
 (3) pinctrl-single is applying the default GPIO setting according to
     the pinctrl-single,gpio-range property.

This would work as expected if the pinctrl-single is only controlling
the function mux, but it also controls the input/output buffer enable,
the pull-up and pull-down settings etc (pinctrl-single,function-mask
covers the entire pad setting instead of just the mux field).

Remove the pinctrl-single,gpio-range property, so that no settings are
applied during a gpio_request() call.

Fixes: d72d73a44c3c ("arm64: dts: ti: k3-am62p: Add gpio-ranges properties")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---

Maybe one could also switch the pinctrl-single to a pinconf-single node
which is able to control all the bias settings and restrict
"pinctrl-single,function-mask" to just the actual function. Not
sure.

 .../boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi     |  8 --------
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi          | 14 --------------
 2 files changed, 22 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index b33aff0d65c9..bd6a00d13aea 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -12,15 +12,7 @@ mcu_pmx0: pinctrl@4084000 {
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
 		pinctrl-single,function-mask = <0xffffffff>;
-		pinctrl-single,gpio-range =
-			<&mcu_pmx_range 0 21 PIN_GPIO_RANGE_IOPAD>,
-			<&mcu_pmx_range 23 1 PIN_GPIO_RANGE_IOPAD>,
-			<&mcu_pmx_range 32 2 PIN_GPIO_RANGE_IOPAD>;
 		bootph-all;
-
-		mcu_pmx_range: gpio-range {
-			#pinctrl-single,gpio-range-cells = <3>;
-		};
 	};
 
 	mcu_esm: esm@4100000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index 420c77c8e9e5..0a888392137c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -42,20 +42,6 @@ &inta_main_dmss {
 	ti,interrupt-ranges = <5 69 35>;
 };
 
-&main_pmx0 {
-	pinctrl-single,gpio-range =
-		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 33 38 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 72 22 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 137 5 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 143 3 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 149 2 PIN_GPIO_RANGE_IOPAD>;
-
-	main_pmx0_range: gpio-range {
-		#pinctrl-single,gpio-range-cells = <3>;
-	};
-};
-
 &main_gpio0 {
 	gpio-ranges = <&main_pmx0 0 0 32>, <&main_pmx0 32 33 38>,
 			<&main_pmx0 70 72 22>;
-- 
2.39.5


