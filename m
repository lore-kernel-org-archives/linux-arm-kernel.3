Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964EFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 04:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rR4Wu1M9XEqQYciXvlXhDPAVP1lpgyRi5D/wKes5nOw=; b=4OKQTSuEzLEzu7XBCYI80W3x7s
	6GjZ+v5PVX1Bba6DdfLm1ZPMmf+pTbPQ+Bmmym2w+WoLsBr3fHZJArfnP8Ap5807N3l+LXWrprC3R
	elIZLBCktB1DLlJeqqfljCnYjkKOjURBWdvV9HFyz2vmpTgRX4tudezqx0sew8qyJUlgeECAdvi2C
	NkC0DIKcgq+XUQFt9/KpGp3tLs4nDp21pihhVoT7lQJm907V0h2/snIR36MYLSmk5JICTsvF5YbEU
	2PA0piDmdXnFlYXsNZ3+h/u+2oCsKKgdhN8+I/mf61dMqEJfMF851j8FyhnAXMrINOFYHF+opG4Wm
	m1PWyNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YIm-00000004UKz-3Nid;
	Tue, 15 Apr 2025 04:53:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4XzE-00000004RoD-0hoL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 04:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rR4Wu1M9XEqQYciXvlXhDPAVP1lpgyRi5D/wKes5nOw=; b=mKqykyEjJOswjWsbGGN6MpSuqP
	h3HCHv2Zs5AmZGjpEfqFb94YJvO8ugY8UDoyuzO4f58pH3wAKN0hupJElPLnPh6TH99OtSlzAIQJp
	E7qwLydcQc8jqzA4Fh3bI/F/WTYpZgdF5bmW7LZq7nWikR6X/6JbXv7un1Q+gBtg2lG1646CMh2KV
	i4+r9WqFtbzj1O6K6zawVKYzYsdbk8myKLHiF49yHbCh6G5IPYLSrV4oTmA6q4rRs6pG5mCiYIidw
	cqlfuDVe7NACNPVKLcTnKlsA21S6MCqt2BRQV0NmhjRqKIVp91HOAWrsWDqgfQ9RS7mbN3++lqrp+
	Myrh1qkg==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4Xz8-00000009olA-0lxU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 04:33:27 +0000
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4Xz0-00Gb4I-05;
	Tue, 15 Apr 2025 06:33:13 +0200
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
Subject: [PATCH v2 04/15] arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
Date: Tue, 15 Apr 2025 06:33:00 +0200
Message-Id: <20250415043311.3385835-5-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415043311.3385835-1-primoz.fiser@norik.com>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250415_053325_007567_1C7E0D7B 
X-CRM114-Status: UNSURE (   7.53  )
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

Improve eMMC on phyCORE-i.MX93 SOM by adding 100MHz and 200MHz pinctrl
modes. This enables to use eMMC at enhanced data rates (e.g. HS400).

While at it, apply a workaround for the i.MX93 chip errata ERR052021.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- no changes

 .../boot/dts/freescale/imx93-phycore-som.dtsi | 57 +++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 06a9e674e338..663530a7e2bb 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -166,8 +166,10 @@ eeprom@50 {
 
 /* eMMC */
 &usdhc1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
@@ -213,18 +215,53 @@ MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x1386
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x1386
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x1386
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x1386
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x1386
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x1386
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x1386
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001386
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001386
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001386
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001386
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001386
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001386
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001386
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013be
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013be
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013be
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013be
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013be
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
 		>;
 	};
-- 
2.34.1


