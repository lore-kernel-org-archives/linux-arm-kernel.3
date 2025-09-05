Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61F7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqzIvvFC+BrxEI6IGIMLmoy28OTKBIYxHR8NJC86crE=; b=LAFcOqe/iF2IfaWH5IxZB0v9Lq
	GnFjQDmr6HmR5mmzkhwILxe/QtvUTIuT7ewCXFq5T2jud/2jZfIst9kvjzXK1mn742Ft/PctDKaUp
	V5TwQO7sZePtmvZHVxMYaThDqKS7EnN3Fq2tv+9UJ/JTz0maMi6lR1xFrxsMWGyO5c3ruIcdg0OqY
	OBhkar4b5LZspcCSwiCVZF8+HuxcKgSdV8zhRl0V24jI6SwRZZhRsZWbhdoUiOzM8WQWTijiT9IE2
	a+VLQmEUL/2h3KPV0sz64IqD/rIUnqT8BsKb1UKUP7Y5ocIFb2bwO8EgYY2qt4Q7NLiJ8gFonQqnk
	zzS0JKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRFN-000000009qe-1jJY;
	Fri, 05 Sep 2025 07:52:49 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQMV-0000000HPev-0JOT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vqzIvvFC+BrxEI6IGIMLmoy28OTKBIYxHR8NJC86crE=; b=C+jZY1ZFewpAbAWGnwrnijTis2
	ACB6tWcCzRIxqrCPI+PbkX03oZGKalheEEFaXqw4qM8w5sNn/oFwBrw/VdaM8V5MK7kZ5tqWTmQ1v
	Z3V7Ff6ygriGMEU5YbPaHiXXj/sa0xbs8A7egbZoh/9Dq80692MUFhZTHJ3lwdmZLUuD7qBpvL1lK
	3TkAtXqzU2z2Jg8Iu4krP3Urn/6S4AzniqQrnNo6HtEJO9a7mQ2vk3delJ3MSMm0KubnbdWLOPSAM
	XvN8r56geO/c436+galq0tXjlqwtKgiP2mjPpbTm8GhAiGk3pwbsr4XX6wRL0f6hXc4Lk2f5LxGQX
	b3XngPXQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37248 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uuQLi-00000004eMg-2638;
	Fri, 05 Sep 2025 08:55:06 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx93-phyboard-nash: Current sense via iio-hwmon
Date: Fri,  5 Sep 2025 08:55:03 +0200
Message-Id: <20250905065503.3022107-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905065503.3022107-1-primoz.fiser@norik.com>
References: <20250905065503.3022107-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_235555_264122_76B1A9CC 
X-CRM114-Status: UNSURE (   7.27  )
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

Commit 21179eae56de ("arm64: dts: freescale: imx93-phyboard-nash: Add
current sense amplifier") added information about the current sensing
circuitry found on the board. Now, lets provide current sense reading
also via IIO-hwmon subsystem. This way, SoM current can be read directly
via sysfs property more conveniently for the customers. No need for them
to manually apply scaling factor calculations anymore.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:                                                                  
- no changes
            
Link to v1: https://lore.kernel.org/all/20250903113700.3079626-2-primoz.fiser@norik.com/

 arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index 71a0e9f270af..d05645f25bba 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -27,8 +27,9 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
-	current-sense {
+	curr_sens: current-sense {
 		compatible = "current-sense-amplifier";
+		#io-channel-cells = <0>;
 		io-channels = <&adc1 1>;
 		sense-gain-div = <2>;
 		sense-gain-mult = <50>;
@@ -44,6 +45,11 @@ flexcan1_tc: can-phy0 {
 		standby-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
 	};
 
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&curr_sens 0>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
-- 
2.34.1


