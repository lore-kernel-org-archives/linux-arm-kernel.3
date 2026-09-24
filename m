Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC1BC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/egdCFWIbRkzpbcmj+WbRyQ1f5zUTpRIZSZMmMFc10=; b=2dBHVs+RFekYuajW2M0vdKmx5f
	IBvTs0rP38+Zl2nze5aLPEXKzNu8y3JPkkqn9AqcX+351y6sH4hs4rRrndb7f28pd+ymYXLLEmmHo
	x5pz2xbi0hVURSS+dZHilK61QHdiH3W/rP+bc5AcS1xdxNtVmpe6IgeXAEcdGCZzOTAEEkKbdFgtF
	8yRWOfh/BV1SeBW5S20PQtVd8faUyr/oC3TwNQzFlMu9QtYdH6Id7h1l86r1kJ1aHKqCHJzISCcXd
	dBxcCQfcztKQBbYh7rXIJHoOtAQ10RK/LXqlbZeFn3DxojQru/4waAuVruL8vdGeAiNEjQ54sYrTS
	KqmZykBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9p2M-0000000C1bL-2V7K;
	Thu, 24 Sep 2026 19:23:18 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9p2J-0000000C1Zp-3Ba2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:23:17 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 43103240103
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790277790;
	bh=L/egdCFWIbRkzpbcmj+WbRyQ1f5zUTpRIZSZMmMFc10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=AMRTLQD/HHa75B53Yg9ApKoUKCEdOzB9/b5EDO+qTvwkiWojhNlhlHbcUTjpsgPGB
	 u3afWRkDmryXZG/BXyeJ6mfnhPczVk2wfy+u0SLHooJaGwTnPH5jl1eELWS+692I9g
	 JU2e25HAoKvonF8FJEDTAxTWngDboU6mVos8cJfV/g0jvfPvLjFmGPq3Bf/LBtzDMJ
	 ggMXTOvonsf29gkqTzJ10VHzP7xDTF5edPCGNSsfHnObeGvKCgUm+b2sHTbG8JI/3O
	 yka9N/wpi+CXCqnCd3BS7I9owCHYEY0Hi1/y5HFqAh0JgeQN5yimE6/aLhLBi37L/9
	 NwA6tY5ja6zDQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrNz108fYz9rxN;
	Thu, 24 Sep 2026 21:23:08 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH 1/2] arm64: dts: st: add digital temperature sensor on stm32mp251
Date: Thu, 24 Sep 2026 19:23:10 +0000
Message-ID: <20260924192259.20517-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
References: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_122315_958570_AFDF46B9 
X-CRM114-Status: UNSURE (   9.71  )
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

The digital temperature sensor (DTS) of the STM32MP25 is a Moortec
MR75203 PVT controller with two temperature sensors, handled by the
mr75203 hwmon driver.

The reference manual does not document the process detector and
voltage monitor blocks that the controller reports and the driver maps.
They were found at offsets 0x180 and 0x400 on the STM32MP257F-DK.

Use the temperature coefficients from the STM32MP25 datasheet, as the
driver defaults read about 1 degree Celsius too high.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 44938c036e30..d57ae0c5574d 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1800,6 +1800,21 @@ package-otp@1e8 {
 			};
 		};
 
+		dts: thermal-sensor@44070000 {
+			compatible = "moortec,mr75203";
+			reg = <0x44070000 0x80>,
+			      <0x44070080 0xc0>,
+			      <0x44070180 0x80>,
+			      <0x44070400 0x400>;
+			reg-names = "common", "ts", "pd", "vm";
+			clocks = <&rcc CK_KER_DTS>;
+			resets = <&rcc DTS_R>;
+			#thermal-sensor-cells = <1>;
+			moortec,ts-coeff-g = <58500>;
+			moortec,ts-coeff-h = <201200>;
+			moortec,ts-coeff-j = <0>;
+		};
+
 		hdp: pinctrl@44090000 {
 			compatible = "st,stm32mp251-hdp";
 			reg = <0x44090000 0x400>;
-- 
2.55.0


