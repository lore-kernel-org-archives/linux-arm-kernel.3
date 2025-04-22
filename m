Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4209CC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/fyz2yaJz0xzEAmSoE0Y6ROcbmBH4Qm7psFQ48hLAY=; b=KyGYzGGI6/BW2jSMma+40gjIQR
	lJDUa/KvdF15QyJspI5mFWzM8s/h2TICzUWYTh2cSDyZrikj1yDau+0rCM16YX1MPKO33oQzPmCT2
	mmps0HPfExyy1Xysu60vL8n1UkedAn6SZkpaDuN79TRkW81l/cXPtmnfR76/9riLkiau8DmrHVvjy
	3VJPhKrvRyB8N+T/jc5ANwA99zjdn69suSgni34nuwSJZ2jqW3gbS0cIBlptX/zQ6QWEksVcrmeGn
	JhGXmPEvCf7x7TZU9usUoHQrI3t+6VEIu0Pa4b0cMfsEBAJXnX7ifTC/BJ3qtqH+RVwzRhEukLKxp
	gDvlX2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Bni-00000006wPX-1nb5;
	Tue, 22 Apr 2025 11:28:42 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJI-00000006qi7-2Tjk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=k/fyz2yaJz0xzEAmSoE0Y6ROcbmBH4Qm7psFQ48hLAY=; b=FTDJ0Hi4Xv9XLHxDnRjW05RDWB
	+jy2cg1nOJfAAzQyzLEjjPZkEwmfq1wGVGFNoae5BI2O7bGZy2LoZ6V0hQ9xGea7f5GVukDPxO0nP
	hQcPjWSDDQlGxza6aomUrZMtA9Qh37YLc2taEbPMLad3nmcwD+h1k3EfbTnBAE/ZzuwIq8F/0kg1/
	0mXD5rIuqzK/EcRAfESV4Y9GHSwIOIF9D8CCpl/7/CUOsgJxSdlY37HU/W+Xc/5Yy55B0KWAIy8r5
	P9lM72DfkHNPGD/Ne8Zi2Ir6aua1T9cVz14FfuUA15sQNN7Kq76QvY0klPm+fZBMDjLdBjtFto8q0
	LzyWItzQ==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BIz-008kyr-2e;
	Tue, 22 Apr 2025 12:56:45 +0200
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
Subject: [PATCH v4 03/15] arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
Date: Tue, 22 Apr 2025 12:56:32 +0200
Message-Id: <20250422105644.2725168-4-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250422_035704_783222_FFD579BA 
X-CRM114-Status: UNSURE (   7.46  )
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

There is already an external pull-down resistor on the LED output line.
It makes no sense to have both pull-down and pull-up resistors enabled
at the same time. Thus disable the internal pull-up.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- fix commit message (pull-up/pull-down)

 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 0528e293c03d..06a9e674e338 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -196,7 +196,7 @@ MX93_PAD_ENET2_TD2__ENET1_TX_CLK		0x4000050e
 
 	pinctrl_leds: ledsgrp {
 		fsl,pins = <
-			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x31e
+			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x11e
 		>;
 	};
 
-- 
2.34.1


