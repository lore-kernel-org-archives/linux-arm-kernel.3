Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1DEE68956
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBDCI11+XOgB7ImpJa/QEyG1X/TrtVKRaX2Yf6u7Hc0=; b=auq6KUeIXpeKNMHsVvkgoHldGV
	5g/HV/QVXShlQOmOin9vh3tMFzEkDXhHT/44wTQ5oFKVmQfWL1Hd+3h2VLZAZ+mazqzuqMP42gkln
	8w+P0FP8W6T4BrjNKw0MrI1DwSVBm8bVKwPuyLL+oC3OOykR4R26mjytJdlSJaPnKo4bR+JAdf4tZ
	Nq7869RrN26ApkjbrXMKIz8Wx7w4hp+Sbe0R8LJqFczF/dX0w3h+SckxKM6/G1SsGsgAFv61P7OZZ
	1sXSbczkZr8rT0kg+Y9IMjcCYSOrjRpzGZuyrvNvdXBdUHNvAIrWzhW14pNs1RO6utZlEh5KDB6i2
	1PilZjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PGn-00000002lS3-1vZd;
	Thu, 31 Oct 2024 07:07:01 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PDK-00000002kSD-1M76
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358202;
	bh=c6mAFMfMnzUCM/bRTvKysE72zxNJKIHReq/xcIwXjco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KoXk0zKgSRD6rk7O1qpLi4KfKia0zDyEIgURK//B54b1dkGB4gPm864D9daazG6TL
	 H1YvKFix+yllhhFpcsmA19NadDcIvWb3WNei0P8mj3LkEZL+L6ugI9YJAeFy26SCaH
	 5EjJ2Gu2NHYpQVvlzI/QPXNhFCTEdxM41HoNyP9ViLCsuPTAT/gf6EKRnn4iRyVyw+
	 rJjB9hwO0h3X094JLD1xlsuCv333sp3LOeGNGAT74lFbEPK3EZbbTai2VvrlpE6ijK
	 7DUOsqI+MEFb73MPTW/MOvMW1vpLNHMNSnU3OL2kXvZyZNtWVEctEWCcy1jx9Z16SO
	 pEf02r4JButVA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] arm64: dts: allwinner: a100: add watchdog node
Date: Thu, 31 Oct 2024 04:02:15 -0300
Message-ID: <20241031070232.1793078-3-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_000326_488360_BC5F67E6 
X-CRM114-Status: UNSURE (   8.41  )
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

From: Yangtao Li <frank@allwinnertech.com>

Declare A100's watchdog in the device-tree.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 1eca7c220ede..adb11b26045f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -144,6 +144,14 @@ ths_calibration: calib@14 {
 			};
 		};
 
+		watchdog@30090a0 {
+			compatible = "allwinner,sun50i-a100-wdt",
+				     "allwinner,sun6i-a31-wdt";
+			reg = <0x030090a0 0x20>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dcxo24M>;
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-a100-pinctrl";
 			reg = <0x0300b000 0x400>;
-- 
2.47.0


