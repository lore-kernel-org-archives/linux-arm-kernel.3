Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AF2CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qn2vPl+bLf1rEfvW1ixik2K1+aWCQFjBxOn4BAqqRA=; b=K3FX3p94zgDBq5Uip1FuKMkpPM
	wA1LCBoqc8JWirE7e+0JU9Oh3ppyAlfNQcLDk2wmeZOGGAji5DKWytwlkAB1WSfNm+Idm6Oc5PgEF
	qclEj/xq9Z5vaSoNRbSKq5yGwkB1/qphUxH+kjv1OUNNdvQciXzvRbhcfdVA7Ou8dW5o0qWzbWUiQ
	Kn/tdKskaB/seh6wRdUZJwvO1CGmgB/0O8iTY1/5dmqsPlCsw1hVVSARb6jrdJ8ek3z8tPCzBqZYQ
	1KQtp5Mvcuj2ptHwVrU6DiftKTBhqDePAO6OfYBWqGmP3Qx5mOVP4E6rVa+oywUh41wB+sZ3CeNvB
	L18KRTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhe-00000004Ou2-2oGj;
	Tue, 29 Sep 2026 19:41:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhZ-00000004OrL-31gy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 19:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1qn2vPl+bLf1rEfvW1ixik2K1+aWCQFjBxOn4BAqqRA=; b=lmVcYDuy/8zibaWf0GZOV946wo
	NPMHM54JxgUBDPaKDoKBZ59hnkFulyM0rLNVuMc4pcPF+waWI815s9CKtGvEibKBRIZ1Iy1sHPjFg
	ai31EQXHNl5IPmraTNC7vtBSjbppyODPilKUsMd9luzws47/AKAVCzkwyV9tl8UpyKeVjkwh7lAem
	6Q3qiZyzazxsZU0eZrJLQioLyOuXUPR4ppjS81vK30m37cqNAp6Zs/oQxoBv3Z6i4CwzKF4SK16b2
	PkcdijVMxw6gTdVGUpvVqjixpD+uEIfXL96/gNlfx+kCQgiwHLkgauBolsI7avg2opadaUzrSnpI8
	jE4Ui9YQ==;
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBdhQ-000000031be-3eP3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:41:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47BE0106D6D;
	Tue, 29 Sep 2026 21:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710866; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1qn2vPl+bLf1rEfvW1ixik2K1+aWCQFjBxOn4BAqqRA=;
	b=IPbdgafZbRjm9P+uVkyE8YJDv6d8AoAcee4lx/tfJc1tuez9f+sEHaxfrGXzwk8ZNSyYm9
	LSVEgf1bffW1fGM7Rieb01pvmGo9p3CK5LImECb7kuGg05Scexg8YdwgaFwZfTIqrVZfTm
	1rNOvV52FItXBtTjPmALC69Mj+3SvFT7Ou5hRwzlD+Cxc5MGkA7QQ0v4w64z8Gu5mwDShH
	MTqb9K2kmvloM4k7Ct45KYiVDC3jCPolKKpOKmJQ9CBa08Zi4PZyBnUL7FQwqs8L3OHjUN
	lNR546lam+hqoLTYYg28qdjZEOfV2+Jkwm7EX7bsYJmWCYSL5TyDX7hC7htkcg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/5] arm64: dts: st: Drop sdmmc1_*_pins_b pinmux
Date: Tue, 29 Sep 2026 21:39:58 +0200
Message-ID: <20260929194035.496244-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929194035.496244-1-marex@nabladev.com>
References: <20260929194035.496244-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_204114_402377_EF0F1D32 
X-CRM114-Status: GOOD (  10.34  )
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

The sdmmc1_*_pins_b pinmux nodes are unused, drop them.

Fixes: e2fce4620933 ("arm64: dts: st: Add pinmux nodes for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 -------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 674d30dac4d09..56c2c99a05d4d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -675,26 +675,6 @@ pins2 {
 		};
 	};
 
-	/omit-if-no-ref/
-	sdmmc1_b4_pins_b: sdmmc1-b4-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
-				 <STM32_PINMUX('E', 5, AF10)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('E', 0, AF10)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('E', 1, AF10)>, /* SDMMC1_D3 */
-				 <STM32_PINMUX('E', 2, AF10)>; /* SDMMC1_CMD */
-			slew-rate = <1>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC1_CK */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-disable;
-		};
-	};
-
 	/omit-if-no-ref/
 	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
 		pins1 {
@@ -720,31 +700,6 @@ pins3 {
 		};
 	};
 
-	/omit-if-no-ref/
-	sdmmc1_b4_od_pins_b: sdmmc1-b4-od-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
-				 <STM32_PINMUX('E', 5, AF10)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('E', 0, AF10)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('E', 1, AF10)>; /* SDMMC1_D3 */
-			slew-rate = <1>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC1_CK */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins3 {
-			pinmux = <STM32_PINMUX('E', 2, AF10)>; /* SDMMC1_CMD */
-			slew-rate = <1>;
-			drive-open-drain;
-			bias-disable;
-		};
-	};
-
 	/omit-if-no-ref/
 	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
 		pins {
-- 
2.53.0


