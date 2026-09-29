Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D17CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PODLXCRFLWkJ9Cd44TlRnXrHGHAgSH6/cDTQhJY6Y6U=; b=bQ8UbhwcpZ/PfW31pBqw7EMaed
	2YJ8mkHFSyCxsKr+TVZcaJy5q+Clb+wJhMrde5kZsggIupjzwcIFNBAwttCsf3YP2CW/YwnlguGgH
	GG+9yzrtNTVDbU7vubV6rtzQ4K+TwEovboNtUYC3UXMF2g3IBLum6lcly+YlHoiWD9xCpc0UAhI6I
	rW/aAb/WSq/ITQynpXUEDYFfo6pH50UdTYtpO4gpRPsNEwame0xdCexkpJFQTwSUQS+46XlvnQivc
	FCXNzcCZ67zBTXRLaIUjetYUCGlTwV0NbSgd4ANnBxsH+/3CFTW29k7+wz5HDq1bAbdfH1zByWATk
	CNtb7yzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhe-00000004OtO-1ZKh;
	Tue, 29 Sep 2026 19:41:26 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhL-00000004OjM-2r9t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:41:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45166106D69;
	Tue, 29 Sep 2026 21:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710862; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PODLXCRFLWkJ9Cd44TlRnXrHGHAgSH6/cDTQhJY6Y6U=;
	b=FeJJbuLFBuxSXWDfU8B+6vj0OXaX1XfnVMCl8aWUnHWWcSow3ciomC4WCtmQ0ntiZeNHBT
	g9bfralnnPzb2Ubvkat2fXP4Edc60sbHl5eIkBKqcYaJTVmVYX319pdgx0l5hZmoP7s9nA
	+sHBn03+tKiScSlaO0JBpyLaSvoY554DVmEQm5Kd5Zq+x4n2GwEJb86iw6sOlASXuaouBx
	PFplloFstxoQMssU8HojV0TDSiA6bKDszn748ZJmKT5T2aDOV00R+x7GAqVpAMLkdIIg5b
	L+X2RXV7Vn4hyAVj+e3bDllbNHJOE3WmWICBxxgEQU4+L4zJIzusxEmpBQIoBw==
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
Subject: [PATCH 3/5] arm64: dts: st: Reuse sdmmc1_*_pins_a pinmux
Date: Tue, 29 Sep 2026 21:39:57 +0200
Message-ID: <20260929194035.496244-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929194035.496244-1-marex@nabladev.com>
References: <20260929194035.496244-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_124107_866164_6FD04FC4 
X-CRM114-Status: GOOD (  11.79  )
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

It is perfectly possible to use sdmmc1_*_pins_a on the DH electronics
STM32MP23xx/STM32MP25xx DHCOS SoM, the only difference is the slew rate.
Reuse sdmmc1_*_pins_a with updated slew rate on board level.

Fixes: 9b584c92f94f ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
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
 .../boot/dts/st/stm32mp255c-dhcos-dhsbc.dts   | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts b/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
index 332a8034cc372..eea7a76953639 100644
--- a/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
+++ b/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
@@ -145,10 +145,34 @@ &scmi_vddio1 {
 	regulator-settling-time-down-us = <100000>;
 };
 
+&sdmmc1_b4_pins_a {
+	pins1 {
+		slew-rate = <1>;
+	};
+
+	pins2 {
+		slew-rate = <2>;
+	};
+};
+
+&sdmmc1_b4_od_pins_a {
+	pins1 {
+		slew-rate = <1>;
+	};
+
+	pins2 {
+		slew-rate = <2>;
+	};
+
+	pins3 {
+		slew-rate = <1>;
+	};
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_b>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_b>;
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	cd-gpios = <&ioexp 8 GPIO_ACTIVE_HIGH>;
 	disable-wp;
-- 
2.53.0


