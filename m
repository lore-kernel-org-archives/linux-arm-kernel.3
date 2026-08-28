Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562A0C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nA8khfK9BGBw3wrTBA9ND+VxUf3wQXF8xR+nj1K1NC4=; b=c7UIyFWsMi0P7N9DAfY1i8ggDU
	kQuTaEGddnBXCMgjDUz0yOyGuGk10fVVl1hE/87GzNvGUfzVY816aVqZJSPGDuLGqxUg49BFxzrlM
	noprmkwf83cCcHgc8lrclAukgGtEQ4lN6QbLopDw3jpXgZSR4IO4CSDusGnqjP4zZeZG1BDDRZe73
	QtbeHCpRmrn5W/GRnk76eK3CuB8P9+EUVflGGF2erZe3OyxVzGKbntrkdLu5kgTvj3jJ4mmZWV10u
	eDL0PqG3FaRaIf0WOU5MH7p4GGsfIAS33hWegiiBzTajEl6HSuM4Pd0pA0YSDZlxcelB/7FiFKbYM
	Mx9hE5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01YM-00000006Jh1-1Lzo;
	Fri, 28 Aug 2026 18:43:50 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01YJ-00000006Jge-24Ig
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 18:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1787942620;
	bh=2h3DDa//eNay2ZbolqGNQSd9EYRIEmORHIbYAWxoYz4=;
	h=From:To:Cc:Subject:Date:From;
	b=N2g3K6DLjRfl1umNwjS4XsbBBeIolmVcBVC8MBzOWa0oNP6q26SFaFkFMcy2ulMEq
	 sELwj+byihFT+UPzGBT+8cQ+EBK/fgnWOIUbfI1yZhZlleQkjCk+Tng+PwOjt8gSQ1
	 sSxKbJQarYlq1/KP7LMReURl/BJAZqS/Ln/C2ABU=
From: Paul Cercueil <paul@crapouillou.net>
To: Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: dts: samsung: exynos4210-i9100: Fix Bluetooth node
Date: Fri, 28 Aug 2026 20:43:31 +0200
Message-ID: <20260828184331.655804-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_114347_707091_22AFB739 
X-CRM114-Status: UNSURE (   9.33  )
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

The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-rtscts'
property.

Also add the missing 'max-speed' property and set it to 4 Mbps, which is
the maximum baud rate supported by this Bluetooth chip.

This fixes extremely choppy audio when connected to a Bluetooth speaker.

Fixes: 8620cc2f99b7 ("ARM: dts: exynos: Add devicetree file for the Galaxy S2")
Cc: stable@vger.kernel.org # v5.8+
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 8a635bee59fa..96db40102adb 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -875,11 +875,14 @@ &serial_0 {
 	status = "okay";
 
 	pinctrl-names = "default";
+	uart-has-rtscts;
 	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
 
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
 
+		max-speed = <4000000>;
+
 		shutdown-gpios = <&gpl0 4 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&gpl1 0 GPIO_ACTIVE_LOW>;
 		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
-- 
2.53.0


