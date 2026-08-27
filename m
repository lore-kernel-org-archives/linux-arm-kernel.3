Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB7FC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 07:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Azb2WKUqoTIadzU7GK4R2kpQQWV3Vb3gLyKN+DoTNE=; b=AQVKuMtJuROF3SM9vBkBZO7iF/
	Wo607YdtiTPLgUPOD95sDoo773tGcL7NVLQvKS3i3YHVjuqHR3xvkvImBoHv0ulvLGKO1Y67Mr2LC
	vTThPKfRAzh0H3Icy0b5NJG8NX4NYvnHSYwmH+cidUw3mh3q/dqQspoaySBHp8SXPoBiE/cPogerY
	zi6Xl1efYeZGRyVbZYqOVkwQLh1dmotprk2TcDUj8mM0aHFe/kwKufGQEYqSz0NTvadZnvuCLhhKR
	x2cBoBNJKLj5KI7OVziUQwI/uZGMbUqYSBVOZVAPF4eKiOQq1MlR0lmlUo6gvXqRYEnxAYpmDz5Kc
	aFvBlNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUOC-00000003XgF-2cJo;
	Thu, 27 Aug 2026 07:19:08 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUO8-00000003Xd0-30Ak
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 07:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1Azb2WKUqoTIadzU7GK4R2kpQQWV3Vb3gLyKN+DoTNE=; b=McafAhuuQ3FOYd+iCpMjqfCit2
	Zzw7S3zRylNjg7AoVP5b43tXcHBsBul4zs4Tm+f+L9ikCKG48E3xKkwtYfCw4bnyzXC+l1s6Dlaav
	EnpHhSmq7e4B0TOc+ZFBcC0f9c5SL1jopRSr9yaF7YTF7vov2ycURmpqNw5bFy1anaeETuxmcyhf4
	CZGEJfCjBiMfAUi5mZnH4tnwE4apqVUxtapr2oE0827pD9UAEF13iRY8oAYkzQi8AHf1RL69oFLDc
	rbXM81xgJUwezYScBRxBkm2/JDvVvxhGfRGbNXGw1YpBM04lOUramc2BrVzlbNDM/WEfKZNLqtjcJ
	PiGtgwJQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52078 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wzU1n-00000007k6I-3E2L;
	Thu, 27 Aug 2026 08:55:59 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Yannic Moog <y.moog@phytec.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI master assignment
Date: Thu, 27 Aug 2026 08:55:56 +0200
Message-Id: <20260827065556.2326079-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20260827_001904_920627_35EF6449 
X-CRM114-Status: UNSURE (   7.16  )
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

The dailink_master label was incorrectly placed on the codec sub-node,
causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
and frame master with SAI2 in consumer mode. This contradicts the SAI2
node configuration (assigned-clock-parents, assigned-clock-rates,
fsl,sai-mclk-direction-output) which requires provider/master mode.

Restore dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK
with the codec operating as I2S slave. Also remove the spurious clocks
property from the codec sub-node which had no effect in this topology.

This fixes the broken audio on PHYTEC phyBOARD-Pollux-i.MX8MP board with
PEB-AV-10 Audio/Video expansion board.

Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
index bb740f845855..8957b24a7ad2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
@@ -77,13 +77,12 @@ sound {
 			"MIC3R", "Microphone Jack",
 			"Microphone Jack", "Mic Bias";
 
-		simple-audio-card,cpu {
+		dailink_master: simple-audio-card,cpu {
 			sound-dai = <&sai2>;
 		};
 
-		dailink_master: simple-audio-card,codec {
+		simple-audio-card,codec {
 			sound-dai = <&codec>;
-			clocks = <&clk IMX8MP_CLK_SAI2>;
 		};
 	};
 };
-- 
2.34.1


