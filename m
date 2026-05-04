Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D392BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9eV2D3TS7gKH+wZUMRrIiQzv2fQ9qi/JsMp4cHZiF8=; b=rJQLtjNFqF4r3CIWFWNGDW72xo
	3N/RQD/Rx6WCju7Sthwh1YLsigNLpL7iOeo5dg+VjS0//Ng/bHPoz6tiPlRcbo1Xy0gWkqC017XzA
	CtiOaKNTDkUUWwUObuD8uL0vWjN5Q9jzdhIHJrwDXT7BL6JlbrmpcZ2R2KERcGMfioerIyY/XFVdZ
	hmRi62RynHsZeSA+RzWIuwlk24J90fki/ZZA6sLsyemRvhas84EKQx8IhHCEVEFeTcQugRyjN1g2s
	/gtb46Suf+vidWY1WJmt5C+/11yf6lO9lrpnFAecyxBXgAe43M0mSwRD1oU0rgeBqLDxP5td6x5L9
	bFCUIikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2CN-0000000EXEn-41hM;
	Mon, 04 May 2026 22:55:35 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2CL-0000000EXCz-0Kkr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:55:35 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8cS2742Jz9srB;
	Tue,  5 May 2026 00:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r9eV2D3TS7gKH+wZUMRrIiQzv2fQ9qi/JsMp4cHZiF8=;
	b=wTzBxyL1yJCkJPTOjiUTIFlEfa6+afpwGxjzHivw2MZXsmy8rr20XpdQjJWc1P7hNS+9oK
	7fCe/S5nJgB3nbSrziU0YcD22lH3z0UIZz1kp8vruIS3a+6iUJha+dBGXyci4QpNTD4IIx
	jxcdjyURK3IWk1eoqNA2xhGS2akJ3at75mTfbtf1Oq+0ZXwU0sqFq5tCZ6QHLxSM7aVdSW
	43fBxzBeQL7+RDq0nKaxJHgA9kjNf3IjM/Oq/yulSKk1lpvV0XLKNfA3bneuzMJv9erW6z
	B/Aobl6QtlcwC3rI8rUMWokwsEhVf415OT5g9gZVL6HExM5Xax49Ftc33Z57pg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r9eV2D3TS7gKH+wZUMRrIiQzv2fQ9qi/JsMp4cHZiF8=;
	b=GoSkeMm2hoQQ10LB6KEGtCDKnxk/D2yQtbD/J+O9IsJezeyEHtSA3K13cUiqwerYbiZCZK
	hnNjdW9fR2LA2ERMUUR/Z6iKwNrI3XU2w6rEuAHHRR2IeGDN5xjmze9SEWr7ZdzhfHwTrk
	tGD4kImiMvFbN1pXlRXHhSkCYML4rZiBsA/eRm8jd4rjlffvIasuvipEHnjcLTiOsqHkjH
	7Km55M2JTfE79EJuTxMtXgCv2VbgTuLwiIinj/j+F3u0AXDuExGMpfUccbw6IrUzhrRHnW
	eRegjYIWsqGm1269ZSTAo/9fqWz5DtqK7YFdjG9p+uRfBPt7SOQquz6uTm5UOw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: salvator-common: Sort sound node
Date: Tue,  5 May 2026 00:54:43 +0200
Message-ID: <20260504225515.114986-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
References: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: o7kfb6w1ysnwmkt1m3sicx3punoa5myn
X-MBO-RS-ID: e175057cfe656f826ea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155533_263719_70EF8DF5 
X-CRM114-Status: GOOD (  10.24  )
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

Sort /sound {} node in the correct order alphabetically.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../boot/dts/renesas/salvator-common.dtsi     | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index e505161caa675..0b29bf9564eb1 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -211,19 +211,6 @@ reg_12v: regulator-12v {
 		regulator-always-on;
 	};
 
-	sound_card: sound {
-		compatible = "audio-graph-card";
-
-		label = "rcar-sound";
-
-		dais = <&rsnd_port0	/* ak4613 */
-			&rsnd_port1	/* HDMI0  */
-#ifdef SOC_HAS_HDMI1
-			&rsnd_port2	/* HDMI1  */
-#endif
-			>;
-	};
-
 	vbus0_usb2: regulator-vbus0-usb2 {
 		compatible = "regulator-fixed";
 
@@ -281,6 +268,19 @@ vccq_sdhi3: regulator-vccq-sdhi3 {
 		states = <3300000 1>, <1800000 0>;
 	};
 
+	sound_card: sound {
+		compatible = "audio-graph-card";
+
+		label = "rcar-sound";
+
+		dais = <&rsnd_port0	/* ak4613 */
+			&rsnd_port1	/* HDMI0  */
+#ifdef SOC_HAS_HDMI1
+			&rsnd_port2	/* HDMI1  */
+#endif
+			>;
+	};
+
 	vga {
 		compatible = "vga-connector";
 
-- 
2.53.0


