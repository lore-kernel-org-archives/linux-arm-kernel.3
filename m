Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3E5C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21m+Db4cDkq7yxqqRATK2pTsEukot6oxH6Vfgu67kew=; b=qwEvKHXfz2idf5K2JUqQlGoPTg
	msop8w63U3BJpK4wuqrGchL1X4Hx+hk4rUF+Rx34GABWZRl3Oaxp5Dm0kE31RNoT0SK8WLbnOYNp0
	lJ1ZCbgVSO53N1DIULMvY8MUE0NgiC8Dmh/ZJm3QrasoULT1Tn0B+ra9unSi2ejm8KgzQsTDCn22Q
	2688zsSd9AnpbrUcEToOS01W7XeUIgUnXxeRalnHuHkWtLmtUUtPTT9NvQv166nC8Q4WHJ/eEsoig
	NpQ2bHcjy9EmW2HvexfT9ZeFbz/BOskLTY/trvw/tTys3BX5oBng+FiEUsTem8pCMJ62VpZQ5hNwl
	JcetFC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPAc-00000004tFR-3XNE;
	Fri, 21 Feb 2025 09:18:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP7d-00000004sTo-3YBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:15:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31F0B611D1;
	Fri, 21 Feb 2025 09:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FB4C4CEE6;
	Fri, 21 Feb 2025 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740129300;
	bh=BV6VLJUzkK8pZ9XtIRWtZGZDINI77ELQvsoIDlsinko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YTgml/M9aEOmiCRD9I7H0HQTj6OOGm5IDQahjFQQc/16sBZm3AzsUeczoatVjjzX4
	 GJWovGRKv0ZbQBji5L13Pkc1XCptpVlq2SWCY84HnEyhyDTMcfYfiU3JLcTCYhm7Dp
	 Fa3uAl7WIhcmUKbkW0ZvhcoycXJEoDAaZZ9j5oJoF0ZVYYfdv82j4xZ+I7FrVh+VW2
	 1IbTX+Goo/SoZymon9fIwbIjV5i4z1zlcyYwnSSS+3jquZLwmn1R86HGd0rtMFFfNB
	 SByCP8N/uY/0QPbTbOzNM6RQOS90mH6iFy61DJwerDAjETB91gMXkln0YVKxEVAQGK
	 xCYJsrPcIKj8g==
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
Subject: [PATCH 2/2] arm64: dts: ti: k3-j722s: fix pinctrl settings
Date: Fri, 21 Feb 2025 10:14:47 +0100
Message-Id: <20250221091447.595199-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221091447.595199-1-mwalle@kernel.org>
References: <20250221091447.595199-1-mwalle@kernel.org>
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

Fixes: 5e5c50964e2e ("arm64: dts: ti: k3-j722s: Add gpio-ranges properties")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 3ac2d45a0558..6da7b3a2943c 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -251,21 +251,6 @@ &inta_main_dmss {
 	ti,interrupt-ranges = <7 71 21>;
 };
 
-&main_pmx0 {
-	pinctrl-single,gpio-range =
-		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 33 38 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 72 17 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 101 25 PIN_GPIO_RANGE_IOPAD>,
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
 			<&main_pmx0 70 72 17>;
-- 
2.39.5


