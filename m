Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C93CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFoM8NGxDUpybx1zeU+jqOplsaQouEb94conW7AIwoQ=; b=ign1bC7oMTvSJtZCwf0U18e1aC
	1+G5IL5WraThpEmKqDJUlgc+dkOuAV9oM1+jg6M5ku50qmWBCtCzrSlrq5nGbjVfnEPQ2Y4cJfK/n
	wtvvXldx/NWW7Rj90Lme+GV/VNiA7bElEJEPFnUWFmpKYtCt7KG+qcrfhkXOYa6ZnI3kEv8XC8B99
	pNDK7FcLpgnui3c20qVxhtIVA49Y3twKYD+H6Bo9DYLVxRE8LHwQjwP2w9bN+gIX1MVZzjqQt+mpW
	iqWaDmOrDpmMUopbp2U2DiBtGqiY1cNOlUfX8a6uXwmtiYdZppt4d43RFUilEMzQCm6Ea0gOi+eK3
	GN2zasiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fa7-0000000FL91-2Ciw;
	Fri, 18 Apr 2025 06:52:11 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFt-0000000FGhK-346X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pFoM8NGxDUpybx1zeU+jqOplsaQouEb94conW7AIwoQ=; b=L5b2WDGm0/K83FCrfHe3nfud+z
	gpYjTA+vHvrg4E6JQyY3LRCmp6e0invhhgnJlUnX5j1MZNrDH3xu9qS9pkxSy59smWIFP18Vp8VYw
	uMmtPya8ZCoW8K/yD0d6/xjW02ReB/CHhB8+ji9tYDrxrrU4fXFiodqJr1GZMeQqZN3AcnEnnryFy
	OHt48D0SY9ehVZ68d0J5IBE/70/jUJk0wIuLr5vWHVEJmHZbwA4WrMAw1R3yr4Y5iOEs0T55BaElL
	Of43CKaGIbKl8b8SNiboLHRSovU7yxrFSLdmFx6ZGIO86Hfoz3GrVtHBwx0/uszk+wdrUWD71EtXD
	0qWs6NOQ==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFn-00AbM0-25;
	Fri, 18 Apr 2025 08:31:11 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 08/15] arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
Date: Fri, 18 Apr 2025 08:30:57 +0200
Message-Id: <20250418063104.2202085-9-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_233117_932004_A8904473 
X-CRM114-Status: UNSURE (   6.83  )
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

Until now, all usdhc2 (SD-card) pinctrl labels pointed to one pinctrl
group "usdhc2grp" which was overwritten twice by the 100 and 200 MHz
modes. Fix this by using unique pinctrl names.

Additionally, adjust MX93_PAD_SD2_CLK__USDHC2_CLK pad drive-strength
according to values obtained by measurements from the PHYTEC hardware
department to improve signal integrity.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- add Reviewed-by tag

 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 3d5cd0561362..541297052b62 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -77,7 +77,7 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
 
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x179e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
@@ -87,9 +87,9 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK            0x179e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
 			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x138e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x138e
@@ -99,9 +99,9 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK            0x178e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
 			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x139e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x139e
-- 
2.34.1


