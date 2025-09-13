Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F652CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzFn7kd8uK/ShYLEe0VH6nm9kSl4BCKWLZJpFQcDLDk=; b=KPzGEbq7QHAQh2mYiDmm1uJ5Pf
	JorjsYRmK4i6CGBIqaFzu8qP/D92Yprc02UUp7WIOr6cGcbiUJfcH5p54JUnuHIDO/2i473w3lA+M
	3u9KdCXlPOxSfYsFnN57znqBEKspbUAI0algGmcWVLKjPWlSD+qcFmQcXlkXEEzJM+zAinzB30dTt
	NVUpFc9go1VpASssOM5aLIxpvOHmEMR1znkPRo4vzBlLmIKosRuxINVBXRguWiw3kLne/C762uwCh
	hvPG99La22icaocO6iU6HXokCP9mO7scqjTDpwEih73QqudBdDLdko7Uoo9WRkoysswGX5xRgsdhg
	eT3qTR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxNRK-0000000EIT2-1OMb;
	Sat, 13 Sep 2025 10:25:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxNRG-0000000EIQ0-0UEL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 10:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 320574413C;
	Sat, 13 Sep 2025 10:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E38C4CEEB;
	Sat, 13 Sep 2025 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757759101;
	bh=9RmNGj7Z6j23AVn/GaYxlJV8TZ+lS7l5OuBjWd83A1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KuyQHpjTCUOj0kl9bp7+z5S4WUK9QXtWV7aVEwTQDI8yFzgKvJo1ZSlCt+LtreOVb
	 FrwFZB9anGfujIdemPpT++KG9bMBpeZ7i50Z3RCAAq3vpo7cRjwRWI9GqGLW3Cms4J
	 GehctK5/bjygz/ce9u4XUekW2OaZg6UK6m4bfBW9wwKU6HzLu40h9rec8sF8ZuvQPf
	 2f8k/Cut+U9KPhA7hTZb5iiYJxfXKzbMrOviM2z4gadShg8cnXCk0tTdMKOuDYOCY+
	 bJXeolz6R/WsykGm6lJJsrliU8KszK5l9kPq/0Rh95VZmH/5cF3K3S/IOCOZEvQxIS
	 zoIFFHXDxepgQ==
Received: by wens.tw (Postfix, from userid 1000)
	id B173B5F752; Sat, 13 Sep 2025 18:24:58 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: allwinner: t527: avaota-a1: hook up external 32k crystal
Date: Sat, 13 Sep 2025 18:24:49 +0800
Message-Id: <20250913102450.3935943-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250913102450.3935943-1-wens@kernel.org>
References: <20250913102450.3935943-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_032502_209698_B7EAF8D4 
X-CRM114-Status: GOOD (  11.43  )
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

From: Chen-Yu Tsai <wens@csie.org>

When the board was added, its external 32.768 KHz crystal was described
but not hooked up correctly. This meant the device had to fall back to
the SoC's internal oscillator or divide a 32 KHz clock from the main
oscillator, neither of which are accurate for the RTC. As a result the
RTC clock will drift badly.

Hook the crystal up to the RTC block and request the correct clock rate.

Fixes: dbe54efa32af ("arm64: dts: allwinner: a523: add Avaota-A1 router support")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 535387912d9b..054d0357c139 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -354,6 +354,14 @@ &r_pio {
 	vcc-pm-supply = <&reg_aldo3>;
 };
 
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc24M>,
+		 <&r_ccu CLK_R_AHB>, <&ext_osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+	assigned-clocks = <&rtc CLK_OSC32K>;
+	assigned-clock-rates = <32768>;
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.39.5


