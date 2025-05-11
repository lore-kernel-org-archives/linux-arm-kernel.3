Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD0BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2VnU6UaxmnLuRDrbZ0S8YYQV0nUUkEmPxvrOuzpSv0=; b=O4zRTdgYUI9gdy/otK4GZvo3dB
	fsJXgZpNUGfB5FlvqDjFjr9ZT375r5N3RKpvfuI1o+sncsJBMKc2RyM1I+C7d0BEJ28w+iT0U66oX
	CXPE9SM9tCOC1a/DMNRHGN7bTo4fzVhQndTVi3YxLC0Ly3W/hZbwH/jlZqPNM1Cc39/6qfVOPFrLD
	HYHWbmzFyTiACozaOgWCprSD7ZOOifuoW4nJoRMNnlTyV7VmaZvY7CPM6RlNEI19mVsCYGZHKtECV
	BPK75uEucJ4kX+RQLBTrQCX+CdnZXddUm0XiV767mhGyir0JyOsV/iYCquf79oIVws/EdXl7aErEG
	PazL0K+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE25v-00000006wro-0dta;
	Sun, 11 May 2025 08:31:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE1tv-00000006vjo-34pe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 08:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EADDB4A864;
	Sun, 11 May 2025 08:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FB36C4CEF2;
	Sun, 11 May 2025 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746951549;
	bh=CVSUjyhz00D84j/KWiAxY8mRUURJP6oMyU0SWCXX0Pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uo2M7FkCJLhtnFHgeDIjUvOi9nbMhqpKcDLNVO8cZAZ2TJy3PqXF7T//ASRTXKKtM
	 4bs6RuRQ66XEPcf7R12GZ61wkwGB5/kmhR0iEz/0Zf+NeE7CEEAgVLk+zPT5FNCyVz
	 Q746i0TannC0Cclhpl3Q36C2srUcA+n+a5t78d0zbV1+1Kr8LLKKMbOc+9tQAdBvEz
	 plmZ68lGZ+78nJ2VIX88M64O2JTn0QH0ezfdC7EUJO/Ce+sQoqoWLfafGgMcoUreJT
	 NWetK+a2S8ixIa9Hu+hNko7rHQ9RGYFoKNdG/q1ebqRiUBCIEC8GBJR1602Y+a6hSo
	 Ohg1tdfkD2SAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CB1C3ABCB;
	Sun, 11 May 2025 08:19:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 11 May 2025 08:18:43 +0000
Subject: [PATCH v5 08/10] arm64: dts: apple: t8103: Add SMC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250511-smc-6-15-v5-8-f5980bdb18bd@svenpeter.dev>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
In-Reply-To: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=fT8v/sQVB3xE7Zctd8LoWdDlMaKp0Khx3qTI/93mIEU=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZCbEX2+eSIG4s0LFtfCj7ZVlCbJVL29ojxdtW2Pxc+7
 Xy88KRVRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiEbqMDJeUHjLfvfVPu2bB
 t/Cir7rx3+NsQov0lT7rZv199Ttr4lKG/76ON+ybAv5M2uC9pzp4geHVox/FGZYdnbGz+lm3fPP
 umRwA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_011911_885484_C52109D9 
X-CRM114-Status: UNSURE (   8.34  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 20faf0c0d80927b2e18dd966a61b5507b322c72f..58270e7d79b07ee98340f140972a6f0d14c86dcb 100644
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
+					<&boot_error_count>, <&panic_count>, <&pm_setting>;
+				nvmem-cell-names = "shutdown_flag", "boot_stage",
+					"boot_error_count", "panic_count", "pm_setting";
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



