Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B54ECCFA1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29Q6xk7IFg8PpcWu8GRmDN8viS9VOyL7/E4COju7Xn4=; b=SbFOdCYOCToAyggRysKq0AUmes
	G6MvSPjceDZPAJtC6xgciNlnJUZStYVakljzsc8EdluAJAk6fqCxI+kyfd0L/mMvq3Ap5dRVWwMer
	2doLqDGxa/Y4dGBsvvwC8/13u8vWT6I/n8Tis+J5QKpNZ6ktOAkLqMrPslNsKpYcQGlrBWH7dS1NE
	/AXaYYCBoDAiZBHCSNgq03DLnyLcMTyuQfaM9Cleg9I31cVrPycRLahxvw56IsZTqGBNP/M3DoTqE
	YENTp+JoOsA4Ch9Cgd+CHko95/z5G5/bPsnCX8WnF5e6IiB6+TIb1KZmdexYylL9xgAUK7pi+Kdoj
	mMINVeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa6L-0000000DPcG-2wm2;
	Wed, 05 Nov 2025 09:46:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa6J-0000000DPZi-0Hn3;
	Wed, 05 Nov 2025 09:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A37B60222;
	Wed,  5 Nov 2025 09:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEC1FC19424;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762336005;
	bh=99fVqQTCZBU9q5RiQ5PSykLF8wyOcIjkV7EDXi3gtDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V0cvidc48untLCOIe0dsVO4llOu1xbYpPEp6xyO4M6Av56tPwhRTRCBd4k7uf9/t0
	 QCDTWiknhOlg+y9mVY4sdGNPBSLfV/ZpndL94mXBtRwX6Pi1ttx50f9re2wXVJ+7cm
	 /ho1sATEQOOJyKC0isDlXA2xMz6PIYfcuVYM3/oULigePrDA8edhWyqhNgU59TYvfj
	 zh0Nhkhi3xrdHbJw51hrf6AXMsuHCPEIX2W9MPvj2O401Bek6CTXgvPDX5YPFstKQT
	 AXvLnD1RRnGfoZoa4+RUhNy0LvecnOf0fk+CrXOtd4M22r79sCoVDLC8rpn5YZenJA
	 817jXuMX6NSsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B875CCCFA18;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 05 Nov 2025 17:45:35 +0800
Subject: [PATCH 4/5] arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-irqchip-gpio-s6-s7-s7d-v1-4-b4d1fe4781c1@amlogic.com>
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762336003; l=916;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=epwwC+3IrP75yFrjS6QYa+JuNwM3q8u7ctb1sF519+k=;
 b=9g12a7vCOUn6deBMg7xiDglM5u2DDjHNnX7gk6tSKw3Oz6vdJimIXuAuJ7zb4mu6Jgvs0PGe4
 DRwarPvJw0sCrFT3VpNbh5xHGHAVXNjVelV/aI6s1rM4aDdcNy2ansG
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add GPIO interrupt controller device.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index d0b63d3fc953..aef7aad95667 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -221,6 +221,16 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			gpio_intc: interrupt-controller@4080 {
+				compatible = "amlogic,s7-gpio-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0 0x4080 0x0 0x20>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<10 11 12 13 14 15 16 17 18 19 20 21>;
+			};
 		};
 	};
 };

-- 
2.37.1



