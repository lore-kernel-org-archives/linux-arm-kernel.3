Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF51BC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vshi1N7J5OljKhcVya8edgEtObhqIiHhco9ZmNE6wmQ=; b=SzhZJdHaDySFJ7SFj/Bnjlh/kF
	OAgJk5rbZLnyKEgCUMaFvEgdq6uv1yCOAit26jnqocI+34/CJQlIqt/S8V0AzyYHXFcHpbAgmmoJx
	eBwpGVjn1Qo8gtPbSjXEasTIM+BwhjKq4c4kbeLrsWGRhs6Z+l0y1QqK1jBf9hrChicFCKhFgV628
	PhuQzpvD6ugbBq+w5fn25PyzTrnQqMZqcWfaF8oc/G9N9SIMgJI5UnazTq9oRXWo043WzzpatNLDa
	/vMCa1u7TlytbHSueJiH2WDROHCtLupZfFj4rKriTDicf5UdShVP/vGx1ImXIF+s96Kri6opRIxSi
	W5OY8PSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l8-00000008Ea6-2PkM;
	Tue, 10 Jun 2025 22:47:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yl-00000007QoJ-2wD1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 16:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vshi1N7J5OljKhcVya8edgEtObhqIiHhco9ZmNE6wmQ=; b=Wc9gVd1Y8vlmQLzHZFnU2HDQYi
	rpLv62UaF3E6xPzOaG1U2/zo0iCqlhjFtZzcXBzjX2bwfVh/AYF07CLoWJNJMnM+eUTnqSP+AA6p6
	+srUEymSsyXz20cBm/YCzr2ivw8e9di8qmBGyQitFcnq5ZwB7Lj1bBudNS97//yBSQ52E3hzOVjUF
	7+mwtCLmZoCDAY18yBAbdBGpa7je4YW1C9kFYQwSDaIMz4Lv5NSxq07kAUkIwgezq2rFWMfawiX+l
	a+Fx5YtMcl/PETHe3oaWyk38ddkD9gQUPiceOb4UJZZo/I+pMRzOFQVq3TAG7a4240ONhbvwFd7kw
	gdrBdR9A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yi-00000001vX6-14Uj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E7584A6C2;
	Tue, 10 Jun 2025 16:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFA7FC4CEED;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749571840;
	bh=SXHxzaiiLT/m2k1jRME2dSR/Kfqf0in/78dSyfn423g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=is1xQi66VbkmDQLA6BmyUYeIDZwK7TCFnOQpK5v7y4eZFGN/SPkwTPlp6tEG4Ka6f
	 5OOdYKqZbQAssMIQsSHwe7cHF/7PzXQRnWLVJx/pKtA17ma9ih/ptr9go7wiK8WzRD
	 va99Vh6Ki4+SgSZc5Ioo2vvc38EBKLVOCBgjFHOevIbRj5pcYuZ9kSbbMiCLgRFOKz
	 Ohg2/Gs5H75gFpl++0OnZVKm//imP9c/hMvooIh9hHVUGgzzQhPL2gfV1RshgIxUAY
	 fqNHGHLUCa5rW5Pg5iW3y9sllOWuREZKP5fXLjCa0pUPqnEnG4lme0nJME2WX1EYIB
	 HhJyg9nKbmNCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BF2C5B543;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 15:29:51 +0000
Subject: [PATCH v7 10/10] arm64: dts: apple: t600x: Add SMC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-smc-6-15-v7-10-556cafd771d3@kernel.org>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
In-Reply-To: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=d8mVq62H2zbw5gGICFsvhQIy6YecpVCZ77lCLDSqOcw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4aHf7Xmm8vulmtud8lsO1CmsHu10GnvyYerXR5GJgaz7
 tr5IjWro5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRRGVGhh8v3rkm6f5/JP3w
 wBO+tq9hKctyLe2M47JVmIxSbrccMmRkWHBy5+cCl4eblr1InP2f7ajs802XfnbeubX0wrV9xTL
 bZ/AAAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171044_674622_E46809FD 
X-CRM114-Status: UNSURE (   8.45  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 110bc6719512e334e04b496fb157cb4368679957..9eb9b0656bf9c570983c90e360795b7a7c71cf90 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -24,6 +24,41 @@ aic: interrupt-controller@28e100000 {
 		power-domains = <&ps_aic>;
 	};
 
+	smc: smc@290400000 {
+		compatible = "apple,t6000-smc", "apple,smc";
+		reg = <0x2 0x90400000 0x0 0x4000>,
+			<0x2 0x91e00000 0x0 0x100000>;
+		reg-names = "smc", "sram";
+		mboxes = <&smc_mbox>;
+
+		smc_gpio: gpio {
+			compatible = "apple,smc-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		smc_reboot: reboot {
+			compatible = "apple,smc-reboot";
+			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
+				<&boot_error_count>, <&panic_count>;
+			nvmem-cell-names = "shutdown_flag", "boot_stage",
+				"boot_error_count", "panic_count";
+		};
+	};
+
+	smc_mbox: mbox@290408000 {
+		compatible = "apple,t6000-asc-mailbox", "apple,asc-mailbox-v4";
+		reg = <0x2 0x90408000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 0 754 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 755 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 756 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 757 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "send-empty", "send-not-empty",
+			"recv-empty", "recv-not-empty";
+		#mbox-cells = <0>;
+	};
+
 	pinctrl_smc: pinctrl@290820000 {
 		compatible = "apple,t6000-pinctrl", "apple,pinctrl";
 		reg = <0x2 0x90820000 0x0 0x4000>;

-- 
2.34.1



