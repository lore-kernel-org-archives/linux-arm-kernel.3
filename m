Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A2AC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQYvhd5nwDF+C0dkDYLe5yPvzGZ32GjjX1tx0SgEwRg=; b=oLp85rPXYctQQLfzluvMuDP2n8
	gVSxj66ejqbWEzXz6mSztG5njnPc+R/j5LOHMHDfDlRDDIvuRsJldL8pHdBxlA35XTrkzTyLJYnXi
	sabDBKYXk37gSeNm+ZYRL+GcuvDr27NfDe6vQdeBiI4npezbGtU/XDZY27zG8bX2tECUAppJ3pN+D
	MYMuLQ2iFwDcEUjAMjCUxmFbqcUJrK+Hl2HVwDqRChJUS7VEV04FXshqiVH34jIBVQ1W0JIsf15Wm
	RJvCH1FLypEAkhO1GNvCSWSwe6q92T5XK+x3i08r9vhDK9thtItgICBsnqKcUDJ2yZlYWZWB8UIEo
	sCxuinzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5UbA-00000001C8l-2WDF;
	Sat, 12 Sep 2026 20:45:20 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ub1-00000001C6A-3ZVz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:45:13 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 8ABAB240028
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 22:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789245905;
	bh=DQYvhd5nwDF+C0dkDYLe5yPvzGZ32GjjX1tx0SgEwRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=OOHWwWvQ1Buvm0eqMvV/4nQbi9B8c53edxOEqOM/3ScyY4XhEZFeFQIhdNqo911he
	 Fe4bEg7+G1yAe0cM0eSL0BnXpJkkagvJzkMd/CakNaT/PuxmlTEh0AsntSQPQ304yB
	 G0/EVTfHgoOLTyaJlCWBFXq3Npj8Nl1r2gaXk1eaG2VC4LCT55OuDZq3Hi9FlEQDYd
	 ksdKQwrk8DFLUa60kOBGssRqGBoRZFE5UUvhBbXXdfUq+aQ8crDVXZqb/nJhT6luGe
	 l2c37nWPCovKzTmg6OFwUkiK3xDnN8E6i286BVPJAssXXVVqaftyWVjQrPJMVlb11N
	 K89iK6lOpa0Gg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hj3M437p1z9rxL;
	Sat, 12 Sep 2026 22:45:04 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: st: add sdmmc2 pins on stm32mp25
Date: Sat, 12 Sep 2026 20:45:05 +0000
Message-ID: <20260912204454.219606-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
References: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_134512_190482_738B2C00 
X-CRM114-Status: UNSURE (   8.47  )
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

Add the 8-bit bus pin groups of SDMMC2 on port E, used by the eMMC
on the STM32MP257F-DK.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..ad55791a72fc 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -431,6 +431,75 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b8_pins_a: sdmmc2-b8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8,  AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9,  AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6,  AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7,  AF12)>, /* SDMMC2_D7 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b8_od_pins_a: sdmmc2-b8-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8,  AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9,  AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6,  AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7,  AF12)>; /* SDMMC2_D7 */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <2>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b8_sleep_pins_a: sdmmc2-b8-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8,  ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9,  ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6,  ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7,  ANALOG)>, /* SDMMC2_D7 */
+				 <STM32_PINMUX('E', 15, ANALOG)>, /* SDMMC2_CMD */
+				 <STM32_PINMUX('E', 14, ANALOG)>; /* SDMMC2_CK */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.55.0


