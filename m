Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE4CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4dDThd5ZpwLx+nX8cPrB+1Z2henTpAL9SGQAqbGbYw=; b=ZQSc4s/ExMZD+cJ/XlATvJlfpG
	gqraorRK66kRIJlie4xHcCJ8QdqVX8+VSkgtyuB1X+QRuqxDqDa1MH4qSgabH3z7NonKQZTW+pJl5
	6ruR2KAV5mxK6eB5ZeINNij/S+U2bSpW/pU9PpFz/4yRIEqxJZSvFOzjXz2DNgD1y500n6HWvyTBn
	qh2IQLTArKQVR67Et1fafHkHlSKTXd48KGSj42c+z/kq6+Cdtj2aOmi9eRA429rx0cWaDFzJR9sQA
	P20MCcHih4MrdGGkXhbHV+2aR7bqfpP6OgyefaZs6Q6WHj/D2lParUS5plrth+OWEzPd/E0517LlE
	GRUvak4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Be-00000000SyM-0pvi;
	Tue, 06 Oct 2026 10:14:18 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2BY-00000000Sut-0ZC2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=y4dDThd5ZpwLx+nX8cPrB+1Z2henTpAL9SGQAqbGbYw=; b=o2XngMi4PJ1y3IvQPrb3T7BwVH
	p11DBlSeHQkaATfZdNlorgiMpTeGABbHMYDN9ty5YUkQLSye5OrIh8IyLNaf1jRHBhuOsg1pCn3By
	OLpuiLNTcUbnhn3BKk5gfZrxyTyRXlsrYhUz7oHX4elL8LqgUaiZ54RNJB+U0+yHrseGmDMyiS7j9
	3zH7VVF/qVYsPVGA/Qb2XsQRIm4daT7vCJaeyslNv0qgrRnEfRAC/JTOQnUL5JUj91Gm++eOiU5qd
	ou4ojZSq8F8NIKpCil0Bt1zVggC2iRumPEFu3bThsc92yuWvHGYXrMF/lgWO3PiIQrj2b7WM2eUOJ
	xouK24Iw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2BQ-000Eyx-2z;
	Tue, 06 Oct 2026 12:14:05 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2As-000Bni-31;
	Tue, 06 Oct 2026 12:14:04 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: imx93-tqma9352-mba91xxca: remove pullup from CAN pins
Date: Tue,  6 Oct 2026 12:13:47 +0200
Message-ID: <20261006101358.2189639-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
References: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031412_289488_DD8CAB80 
X-CRM114-Status: GOOD (  10.01  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Board has external PU, so internal PU are not needed.

Fixes: e5bc07026f94 ("arm64: add initial device tree for TQMa93xx/MBa91xxCA")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
index 737326ba1b2a7..f8e4c9cea53f5 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
@@ -635,10 +635,10 @@ pinctrl_fec_phy: fecphygrp {
 	};
 
 	pinctrl_flexcan1: flexcan1grp {
-		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
-			   <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200>,
-			   /* PU | FSEL_3 | DSE X4 */
-			   <MX93_PAD_PDM_CLK__CAN1_TX			0x039e>;
+		fsl,pins = /* HYS | FSEL_0 | DSE no drive */
+			   <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1000>,
+			   /* FSEL_3 | DSE X4 */
+			   <MX93_PAD_PDM_CLK__CAN1_TX			0x019e>;
 	};
 
 	pinctrl_jtag: jtaggrp {
-- 
2.55.0


