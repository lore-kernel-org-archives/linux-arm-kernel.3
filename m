Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E16DC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Itmuf2YdiTbmwIMamc/71asQgOph9WVmB6xFeHxYhFU=; b=VR/LDT1NuIi5RFFBG2wakS806m
	nZfO0fdRIpXxNhqbrZS3VT4XEmqkMdjWZFXJeC1h0IiskE9T8PYJi7Wa13hdieJhHNBUdKUtYooRt
	WYzmgtXBlrk1ry9EUDJHaIBCMfUz53nr91UqFZ/GYSgLc++651LbbdbK9rb7ibE/2I2HShhE1p8uh
	aqG2muFVa3aIZp4Sa8jt9bW5LAkfu2CPVbYXa9sCz7B31Rk5BTi8AreZc8girpiiMuMqmzO2kE8vj
	qVbKVQafC0zsGILAGmUukcXRt9fLSeV1I4fiXNBkbgHBKc9u8J3TVtfucQCf+Nzprvdwg0SJyItIM
	/UtJK4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJDra-00000007Jiz-3uFu;
	Sun, 25 May 2025 16:06:14 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJDpV-00000007JPW-4682
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 16:04:07 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b53bt4NTqz9scd;
	Sun, 25 May 2025 18:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Itmuf2YdiTbmwIMamc/71asQgOph9WVmB6xFeHxYhFU=;
	b=p6BaVQEwaVVx1c5Q1BlAYVHGhgdM237qKzEFBqmHgOB87lzeL38zX5wp85G4b876aOH5Um
	yBF9yvV0/CKp4cIErMZnJoKIUCAsuwQYK/fclRVBb0cgnmu6ZCZinvb9m2MO4chptxmnRe
	EytYQiWqtapY8ZLdVxVjxY4a/xPRwyjSNhTBxrdWD8ARWZ/mXUB9UVbllmNcbRbDnEstLZ
	0RTlBate4JPKOnbU7yM5LG3nPOfqlXPZQ0kRbLzXUGbilLPBIVv+x9sgRxFfOd6M2kjsm/
	Vu1Sm1JrbUVvYQYnTd+GhvlNJm1Wsh0aarudH9Zx4yzvRobq30whl3Hmw9yT/w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Itmuf2YdiTbmwIMamc/71asQgOph9WVmB6xFeHxYhFU=;
	b=HbsHrf31tDx773iC0C4d1OyiBZAqBk4ZNJ3NK/wnnCBQjQ2diDhAX8SUAxbGt5vXE2nNJ2
	D7otFtUlWwFAZnD4zqQi8exFtuj/dKPDZFnibv/Eivkr/AuklP5gK0bPQ6GdzDshQef330
	LV+xENyjigwPMHjGQr1z8gzk3unPlAcXsshSD4Rbv0QFlbW064Eq7H+23o+fA2JAfT+rLF
	Qitwb1qa5qlxI1Fn0JXQeYOh7bq84j/AFn7vDe8HsaTnu9kBxIcDb3OIM9qMXx9uavu1LP
	f1WHVCcqQk51dq9TMhijZ1hwjarKpDsvFcblADe8oxM0t8Cc24HDGJQr68qdZw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Sort DT on V4H Sparrow Hawk
Date: Sun, 25 May 2025 18:02:43 +0200
Message-ID: <20250525160336.82960-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f8b1095690e590fc411
X-MBO-RS-META: ygbne5fdc6gxm7kdpujnnhwcszrw8iya
X-Rspamd-Queue-Id: 4b53bt4NTqz9scd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_090406_198640_2A3EECEE 
X-CRM114-Status: UNSURE (   9.56  )
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

Sort DT alphabetically. Fix up the placement of &rcar_sound {} .
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 6955eafd8d6ab..b8698e07add56 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -679,19 +679,6 @@ sound_clk_pins: sound-clk {
 	};
 };
 
-/* Page 30 / Audio_Codec */
-&rcar_sound {
-	pinctrl-0 = <&sound_clk_pins>;
-	pinctrl-names = "default";
-
-	/* It is used for ADG output as DA7212_MCLK */
-
-	/* audio_clkout */
-	clock-frequency = <12288000>; /* 48 kHz groups */
-
-	status = "okay";
-};
-
 /* Page 31 / FAN */
 &pwm0 {
 	pinctrl-0 = <&pwm0_pins>;
@@ -720,6 +707,19 @@ &pwm7 {
 	status = "okay";
 };
 
+/* Page 30 / Audio_Codec */
+&rcar_sound {
+	pinctrl-0 = <&sound_clk_pins>;
+	pinctrl-names = "default";
+
+	/* It is used for ADG output as DA7212_MCLK */
+
+	/* audio_clkout */
+	clock-frequency = <12288000>; /* 48 kHz groups */
+
+	status = "okay";
+};
+
 /* Page 16 / QSPI_FLASH */
 &rpc {
 	pinctrl-0 = <&qspi0_pins>;
-- 
2.47.2


