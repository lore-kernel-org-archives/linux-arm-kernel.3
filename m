Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B209BCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8Cz9UcWjAsiWLhCbUep462Inxeiieahrt2pMg/j+eg=; b=k8D5wPPq/PyYVw1TcS6G+8Dyx5
	z+vynltD/1HMtbeoh0Q6Xe52pUL0xjCN0GRPDsnLId0pCqKh5taGtMr1COj1zG6fC6Ch6zSrZD4iE
	z4H7tjOWeZp54QGBxTaIdiRhilP7HcxSsk9niDakY9/stxrRIR/sGDTlY2ydClw2Znq1yuzHvPHWl
	QP+ToiSZRbna6UEmqGu7UnljnZkQKpXGP1srF7M12bk8AiKjXxjdB3HHBamv7iW5nE3NGqBhX/2Jz
	YsD+6HBThhRwK4g0O6I7hpNnX2kan+H2uGqbLA6M3pRd17+U0C0c8oDq/FYrHcz840wFbu7aXEW+U
	YTN9XGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAbs-00000006NQC-1Y2V;
	Fri, 09 Oct 2026 13:26:04 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAbo-00000006NP1-2iE4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 13:26:02 +0000
Received: from francesco-nb.. (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by mail11.truemail.it (Postfix) with ESMTPA id BEA021FCCA;
	Fri,  9 Oct 2026 15:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791552358;
	bh=Z8Cz9UcWjAsiWLhCbUep462Inxeiieahrt2pMg/j+eg=; h=From:To:Subject;
	b=pXreqyPStB0ZpIQDqLInCmIk/4JP7QcIYVQ/wZWzAxrNv5d45ysXDC/vDsSFmc6zu
	 HlCdOg/CBDizKPWHgGOHlE8Rb2V5fYWtxkwzpKdazPlx2rLAdNk8UVwWV49rhSKXKh
	 OYsKSMEBZUdUcNCuLg4IUqPAIyppk9Ii19poH/i4ujRg2m8kXvlbQ42h1AVpbmeNrQ
	 YBmscAd7wL0DoHgknmzuA4UtYikQYvcJrT2e1MfjzHa5wSHuI44Fo61uiyhkLSjMmi
	 b/zrS5djWA6m58xemmQMjbRDmGH58rLAN84NY2fXE5FdilkYHGxQwKslylfsn0jKk+
	 A7NiWXsFWeGUQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-osm-dev: Fix USB_A source PDO to 900 mA
Date: Fri,  9 Oct 2026 15:25:47 +0200
Message-ID: <20261009132550.20793-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009132550.20793-1-francesco@dolcini.it>
References: <20261009132550.20793-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_062601_612270_7DFB5931 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Correct USB_A source PDO from 3A to 900mA.

The USB_A Type-C port on the Toradex OSM development board can source
only 900 mA on VBUS, but the connector advertises a 5V / 3A fixed PDO.

Fixes: 39be5a7e3ecc ("arm64: dts: freescale: Add Toradex OSM iMX95")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
index b3d54be07c43..e9646b3ca899 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
@@ -207,7 +207,7 @@ connector {
 			try-power-role = "sink";
 			self-powered;
 			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos = <PDO_FIXED(5000, 900, PDO_FIXED_USB_COMM)>;
 
 			port {
 				usb_c_a_conn_hs: endpoint {
-- 
2.47.3


