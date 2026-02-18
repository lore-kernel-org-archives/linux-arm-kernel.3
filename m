Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27248E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvFkedKwU7Tki1WJjhUdJTuzQZqOqROBb2WWlOoeJHc=; b=uA8EGOrgjIKeE0o7rRDNPIy85O
	d9Vt+IYyQLnaJ7L8y0aF10t+yPb71W0xOAlxPntFS6I1aYPQ86nMzrbr0bCnsxxW2eYarYSKZpG20
	DrrbU1KBN0uqh+8PadUveu+WHGtpejmA/TGBkA6G0dmgoHVWbjkbzwtqii1O3XEvtESE2zwjvQurs
	7KSToNRe9Bj7at14Kewt1f0Tte8DipGNC+jJWZ3TBP0Evxe/Jb7iuGCFsu5xJhRO19NRJbLhR/odO
	6OkVodOKKqok9agb91227d+supFwjCnX5GB4Jetb8LpEXbC15iMO1zKeTZ0KP1rOGTiPm3vb0uMzy
	n6iXn2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsi1A-00000009v0g-17ur;
	Wed, 18 Feb 2026 13:55:04 +0000
Received: from mx-relay97-hz2.antispameurope.com ([94.100.136.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsi13-00000009uxM-2qrI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:54:59 +0000
ARC-Authentication-Results: i=1; mx-gate97-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=TvFkedKwU7Tki1WJjhUdJTuzQZqOqROBb2WWlOoeJHc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771422887;
 b=d+pTuGSXR030cO9xu4KjBbYYVPavD8NVkRCUvdBOeODFHNGlQ3lGscKp+xzXTyxZBTAIQaYg
 w657hZVA1CeEXNLZJ5nClBSI9I4gwTSuCi1rDJPFg2K0Ao+Yds0m6SNtj8jhBeVx2PgZWOF7mUK
 6M1ET1/6vgrmIouCNYBCduGPXWQbQOZBX8k9M22TJWNSNFSgrNzcDCrUkWvsUmNgH+ZKuBVadjG
 P/WqxBU64IgDo3qP5C9vuOYL2YQHZ1bRAp+WkfoVxe5A8bxLXi/j9iYTxSUfsU62sBWg0tcTgxw
 8vBy2YN5DevmCZcKVtxq9Y2Is3m2rhzgJqsdNujTqgiMA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771422887;
 b=S1rHsX8XQaXyzHfcYWtWJ8FY931pZASiUKE9Zt73/CoM8Wv8ZoPbDOI6dTpUdi+XIPt3/8xd
 Pd23DfT1y02zWQvJVHOOrxGygtPGhFkidKVhq1a6oSGM4Aj1A9cYwjZWbJkE4QfzNaTB8QnnsqP
 qq49TXalG9RMGS/AI7tPnN2oQ20iHMeO/NQPyclsZozAuMwbThm2pxT9af3BFscNYnLlK03tKcG
 Rs5R+WRSVO6BtPTXwMPGNlozMRGacv59f5G0hgaJq83mNJSuXK1EMSnk1L3bSzLvTf5TsQSZdzN
 jmkue3yKt/TVBIjly9oXQZ8A7HfpRFh8Sk4OzccuOCRjw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay97-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:54:47 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8B61D220714;
	Wed, 18 Feb 2026 14:54:27 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: tqma7: add boot phase properties
Date: Wed, 18 Feb 2026 14:54:13 +0100
Message-ID: <20260218135415.204974-3-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay97-hz2.antispameurope.com with 4fGJ0N5DXnz1yKnb
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 3ffff1d6d88180f557de01e140f7d817
X-cloud-security: scantime:2.271
DKIM-Signature: a=rsa-sha256;
 bh=TvFkedKwU7Tki1WJjhUdJTuzQZqOqROBb2WWlOoeJHc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771422886; v=1;
 b=eDAPTgcxaIPH2aSUPhdKD4WFG2Gc6cdlzrlNDB50QdVqIz9l42L3hjYPDki6ji6YMM12ZIZy
 QJwRgEvUVI8EKfec4eb47DipHVU6zjJHqtoBsTa9xNvsR2XtoM/Xu4Iyp0HhVrLuqftC6Xv9uSx
 sjtKNs8G7rHHN2eFMoVYCDjTAsDFxvMobgTRmySlGApXQQsZ0oBnagMMOB7ST3hyQ7PGdhB+Cij
 C4rmna4C9NUXWrsXb+vZNS43bIptu/KjmeJNFZM+/9vW0Mjp9MtAI8f8rudcgNr+bjhm2bELoRY
 Xka1FzYY68YQaXLYDbgzMh0kFJ/lzdPTRf9dE6Lt4BHtg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_055457_861474_82F41AB7 
X-CRM114-Status: GOOD (  11.48  )
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

Adds boot phase properties to essential resources in
tqma7 device trees.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 4 ++++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 4d948a9757f9..03f2f2cbdfbc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -477,6 +477,7 @@ pinctrl_uart5: uart5grp {
 	};
 
 	pinctrl_uart6: uart6grp {
+		bootph-pre-ram;
 		fsl,pins =
 			<MX7D_PAD_EPDC_DATA08__UART6_DCE_RX	0x7d>,
 			<MX7D_PAD_EPDC_DATA09__UART6_DCE_TX	0x75>,
@@ -511,6 +512,7 @@ pinctrl_usdhc1: usdhc1grp {
 			<MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5e>,
 			<MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5e>,
 			<MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5e>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1_100mhzgrp {
@@ -602,6 +604,7 @@ &uart6 {
 	pinctrl-0 = <&pinctrl_uart6>;
 	assigned-clocks = <&clks IMX7D_UART6_ROOT_SRC>;
 	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -646,6 +649,7 @@ &usdhc1 {
 	no-1-8-v;
 	no-sdio;
 	no-mmc;
+	bootph-pre-ram;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 2966a33bc528..3a01b1cfb5fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -214,6 +214,7 @@ pinctrl_usdhc3: usdhc3grp {
 			<MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59>,
 			<MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59>,
 			<MX7D_PAD_SD3_STROBE__SD3_STROBE	0x19>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3_100mhzgrp {
@@ -288,6 +289,7 @@ &usdhc3 {
 	no-sdio;
 	vmmc-supply = <&vgen4_reg>;
 	vqmmc-supply = <&sw2_reg>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
-- 
2.43.0


