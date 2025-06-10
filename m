Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861D8C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9qnn96fmtHaZD1+R5WRwp59jDZuGi5LbA9AZpO6njU=; b=3vKrOPuW4yCsOrNyAw5cX1djgY
	AdrZggAe91XN3YMiCMdR2l9LEHHJUfR7vPZdBkyAIGWEmEojKTNTHNfbXUdze5fmKVxlZFj2lQuEy
	zwLI8YGa93leJXtF1uhpVMtPTOfRPX1Zoj4vrU2N1fCD6Wd8aaTHpOoumkPBAIZka3Yymm7Ax/MnZ
	jXG9Z3HUqBitCsHXtXuZ+2G53xsfYX4j1x+LQOtkHMw+8rrwRuZy4MspcoHKbQNSWU2M6I5636meo
	pSqMpddWlY9Wij/efg+vCTEFI0K2JDQVprqNjZw02yrU+l72znRrOejLYBF380h0dkYmV+eopUcOU
	27qRmZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4se-00000007wd9-1DHT;
	Tue, 10 Jun 2025 19:43:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yn-00000007Qox-0jRT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 16:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=j9qnn96fmtHaZD1+R5WRwp59jDZuGi5LbA9AZpO6njU=; b=Qb8Iah0e/8cel+OwwGZ9GfA4Tw
	rgPY3AeK14xjjk5tUPXAv5OgAUUVNIljHGK/xcSR4HauApBEbLwfCmc6ItccsOmW9/vUTmSVBtZjx
	ojkLqu+mhm6662nTXhMgJ3cxtSdKYSoTfWF5CWmOHzmL5135/jwB2yxgCNCOl1Myp6S9tVrH1uL+w
	2dATTTz9D+TBMvkkcF5iowdko4wN86/HP868cZzV/QPQCkovTgAyY4BLjVdh+o6Eg5etLKu6arKJ1
	TpZlkWe3TPOvC0RYHe/U7AS4Kes7qeB8qYySibq6qzO69wrPhNFlmAgxgwf1u0b0SDKZsicI6oTnF
	lPS98F4w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yi-00000001vX3-2R6c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 218E04A8E4;
	Tue, 10 Jun 2025 16:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBF9DC2BC87;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749571839;
	bh=p9Wj3SDsVd05bKRi33m2+hhffQLnDh98AT3iDP+7Aiw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y+aaPdC6FJr0uy5k85ey35yjOAi+vwFTy1iyC4sNRHVSaaJWIir1dcX6qIAYCACTb
	 N0/xk2rpWUabqxZodeIdfRw5ma1xn86Z6pOIBLqe83K8tzijASVS2DDd6KHDnCllRR
	 jEFOx5/qG+Tj6eH/PJjA8J8HlhjjgkQMkDIoMRAkBxqGWYmKptXj29oQxX4k6b86gk
	 +mqY5NJvtMbBzonW13jNMoIEByegFNIFeTfecqftdgVzzivT/mxQGOLtT0qSbXW6zo
	 PYIHLvbZZ1M0RB11m6A3i9dGORHbCL7jnkO8YHt6oWMxLH3c/ZvXz/dVw92KL3ybte
	 XRLitSMTFR8vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E30C5B543;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 15:29:49 +0000
Subject: [PATCH v7 08/10] arm64: dts: apple: t8103: Add SMC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-smc-6-15-v7-8-556cafd771d3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=QseMb+jJFna0l2+kYOBbQAO/bcEYjG/Mne8IFhJOnBM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4aHfyVPnVPBhes8u9xPHf6VWdQUWetZncVilbeE30hA8
 Xf5licdpSwMYhwMsmKKLNv325s+efhGcOmmS+9h5rAygQxh4OIUgIlk2TL8d35galj+Kypb8YAd
 Z2Oc9cfW938z1+5IXz8nQ4o9JHqpASPDt4/t++szCwKOarXfd9inNlv3r7+xrZK3WqnbSeGAfnZ
 eAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171044_969013_886DD9BB 
X-CRM114-Status: UNSURE (   8.66  )
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 20faf0c0d80927b2e18dd966a61b5507b322c72f..614f2986518cdefee6277e048377a27e22aee570 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -836,6 +836,41 @@ wdt: watchdog@23d2b0000 {
 			interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		smc: smc@23e400000 {
+			compatible = "apple,t8103-smc", "apple,smc";
+			reg = <0x2 0x3e400000 0x0 0x4000>,
+				<0x2 0x3fe00000 0x0 0x100000>;
+			reg-names = "smc", "sram";
+			mboxes = <&smc_mbox>;
+
+			smc_gpio: gpio {
+				compatible = "apple,smc-gpio";
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			smc_reboot: reboot {
+				compatible = "apple,smc-reboot";
+				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
+					<&boot_error_count>, <&panic_count>;
+				nvmem-cell-names = "shutdown_flag", "boot_stage",
+					"boot_error_count", "panic_count";
+			};
+		};
+
+		smc_mbox: mbox@23e408000 {
+			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x3e408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 401 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 402 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 403 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		pinctrl_smc: pinctrl@23e820000 {
 			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3e820000 0x0 0x4000>;

-- 
2.34.1



