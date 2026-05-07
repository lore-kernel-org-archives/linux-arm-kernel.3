Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7277CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8iw7EC9Hql0J/OWsMobIQ+qswHWUeAMDhLnl/FCsQmc=; b=XFHmMtBRssv+iGqnHtRhvlFXVo
	SmU8yhPy9lUXkSJ4851pZ7PXNgnsYGvRKkfZOnoepCTevtjk02YNU5y6hAGRzZtQjOhTWL1bBgTSR
	couVbDDfYS3DTXB96XmRC/fnOnVtegmX3rVpGf23oviUxSck+BE/bkpDPJ3qIWBm9Nc3h+BLjkLEb
	KpdK3DfPqXSdjoLHqvsyMInVolQH4aaHgahbQbmx0h3AQqJj1cxRbMObOyeWf8ESlRr9XVZIj4nPq
	NfiAZfpm3jg1TObY1lRw3pkuZqHELRWd3f4Hp0NJSqdygSw+Weaqvu9GJXmyXo49P8zkynjKvty6N
	flXZSOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsZW-00000002x2e-0ulQ;
	Thu, 07 May 2026 06:50:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsZU-00000002x1w-430y
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 May 2026 06:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8iw7EC9Hql0J/OWsMobIQ+qswHWUeAMDhLnl/FCsQmc=; b=MsGZ4rtu/OnQ/L47Ds1tIeUNhI
	PHngTQXgENJ4n5yPPghvg6Ny0s4pnc3GgYQBmAW4SvmJ7lfp2HsMn7QCh425PrmDSBiZ27CfxW3SL
	1FhMiMsaK5oOgbX0nzrevMFwsJMXzSWTYEuoHhzZQUhA0uXaHHg0AQyqsvTdilEWdmHQljgr2zq0h
	5zuGgCoqK7T/Nwi56bPn0sCyOGnsqHUh5cveuWblhguuHUt81fAuCp5z7+LfTG0ykTY0/0ymg9Aer
	keilxkhsQ7eF0ei2Zif5P8fr8GKt0uB+zwksI75jlUBqeSq2Jv2idKtQ8Q1VAV1zxu0Z2V5iFarLI
	+BeBdURQ==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsZO-00000002kBK-0YyU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8iw7EC9Hql0J/OWsMobIQ+qswHWUeAMDhLnl/FCsQmc=; b=Pfy55lYkmeSHAl/heQ0UJKv6Do
	mwdokG6ZL+glEA5IzVFsL+kyAEe+YvI7p9k7/AOxJWR3lypzNctCMUPHm4xqhOjNk0LpMYbu075H9
	LBsBr5d1p5OHO1ui32pxOOdK4NaJucAksI+ImvG01LveCX1I38YW3Mk7KkEMqjs1EHRoEFKJrE0RD
	IARNyvI8LvQN/gC7AbMyy2LuJHE+JX4HTM3IRgoUr9KPu2JTFhNmWlVRpx0Zxr09PEUKwk1TWHgTO
	ppuft+IQ58/B2Q8EzqDblvdYCJqckvzFxlUUcHyydMOqbptvxZD8dgs6afTqhb22Agj7isc3whEew
	uHY+5gFA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:40514 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wKs6Y-0000000AGWs-37Mo;
	Thu, 07 May 2026 08:21:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/3] arm64: dts: freescale: imx{91,93}-phycore-som: Set BUCK5 in FPWM mode
Date: Thu,  7 May 2026 08:20:56 +0200
Message-Id: <20260507062058.1711292-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_075050_630958_9DDB9C74 
X-CRM114-Status: UNSURE (   6.43  )
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

Set PMIC BUCK5 mode to forced PWM (Pulse Width Modulation) mode instead
of the default automatic PFM and PWM transition mode. FPWM mode produces
less ripple on the output voltage rail under light load conditions. And
since BUCK5 supplies SoC internal ADC reference voltage we need to keep
voltage ripple to a minimum. This solves issues with the occasional ADC
calibration procedure failures on phyCORE-i.MX91/93 SoM based boards.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
index 29a428a052b0..19e7e84ad6f7 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/nxp,pca9450-regulator.h>
 
 #include "imx91.dtsi"
 
@@ -138,6 +139,7 @@ buck5: BUCK5 {
 				regulator-min-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				regulator-initial-mode = <PCA9450_BUCK_MODE_FORCE_PWM>;
 			};
 
 			buck6: BUCK6 {
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index ebc57841f27f..626160132e3c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -9,6 +9,7 @@
  */
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/nxp,pca9450-regulator.h>
 
 #include "imx93.dtsi"
 
@@ -140,6 +141,7 @@ buck5: BUCK5 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				regulator-initial-mode = <PCA9450_BUCK_MODE_FORCE_PWM>;
 			};
 
 			buck6: BUCK6 {
-- 
2.34.1


