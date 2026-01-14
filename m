Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199BDD38FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FZchd0EVjeZPDpfSc5KLMc9HueJ8+rJRI0TjdGf6xTs=; b=wiZ0FIqhg9n75u5ZxUVvBvR+yi
	vJR34XvxsVQjD8XWTWPpylHmUr2b40/eZkiu7pD6KiXpmJrrARxRLxWHr0fnHX8OBUi3AADf2ao3f
	T/fbu2U1VeTklkxanEGIzadzHTsULHhPdBhE6+6rUB+UoYyGKYv3vIBi2l3JbCXCuiRH2iT+lCPIk
	/OPKTCWTuKb8xdnoMC7g6VZQ4XNVI0Ykl6nlPV6PBKOWRSqFQZtVqV9+ENl3opqJSB6tcnh/ijCaH
	gSlObu95K22D18o96fdOnnaPlIOdxwJpAi1JydkhKuQL++TYZ4+D1R8e/xNYrp8nqCuy8NDorB/UW
	d25MU9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg44v-00000009zAz-0Ya0;
	Wed, 14 Jan 2026 16:50:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg44s-00000009z8h-0UC2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:50:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A75A44E420D7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 16:50:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 682FE6074A;
	Wed, 14 Jan 2026 16:50:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EF3910B682A0;
	Wed, 14 Jan 2026 17:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768409432; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=FZchd0EVjeZPDpfSc5KLMc9HueJ8+rJRI0TjdGf6xTs=;
	b=gmUPcwmnox7arbqkymc/qtB90PaAhg2we8YkoV33vJaDAMGVKGXNW90hJDwel3tDiEEtAr
	+uHLWRzLz1XDiruulPXjwsx9xm4pQg2Kd7H9RkI5rxIn1RrwuFZaMN3FKxLmLNO8u0OESD
	TNxQfePqwfX0NUA42bZUx9nQQTcGVE53LW9jQgWvxlxkfMvgPThOkS7sh5EHvH7ZZoPGC8
	5eizFw6nCyGx8GM10Mvn3h9x53w0wyY+JkUvzs0iy2RRgxbHaLt0sBu/7IpNDgKn/HKSz6
	Ilb5BYrkqTikoLh0a6wDrdgOqiLHwbiIf/Rb2/mORE6JjqkRJnsDwdwVKQ0Zdg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 14 Jan 2026 17:50:23 +0100
Subject: [PATCH] phy: freescale: imx8qm-hsio: fix NULL pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-v1-1-730e941be464@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAE7JZ2kC/x2NwQrCMBBEf6Xs2YWk1UT8FfGg7cYspNuYaImU/
 ruLhzk8hjezQaXCVOHSbVBo5cqLKNhDB2O8y5OQJ2XoTe+MtUfM8YuhJuS5nV8zRhUwcEP5pIR
 5YXlTwYkKBY2MhM4/rDVuOAXvQWezVtz+l9fbvv8A6zmjQYIAAAA=
X-Change-ID: 20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-67b110635f77
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_085038_280981_89CF72E7 
X-CRM114-Status: GOOD (  13.48  )
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

During the probe the refclk_pad pointer is set to NULL if the
'fsl,refclk-pad-mode' property is not defined in the devicetree node. But
in imx_hsio_configure_clk_pad() this pointer is unconditionally used which
could result in a NULL pointer dereference. So check the pointer before to
use it.

Fixes: 82c56b6dd24f ("phy: freescale: imx8qm-hsio: Add i.MX8QM HSIO PHY driver support")
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
index 977d21d753a5..279b8ac7822d 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
@@ -251,7 +251,7 @@ static void imx_hsio_configure_clk_pad(struct phy *phy)
 	struct imx_hsio_lane *lane = phy_get_drvdata(phy);
 	struct imx_hsio_priv *priv = lane->priv;
 
-	if (strncmp(priv->refclk_pad, "output", 6) == 0) {
+	if (priv->refclk_pad && strncmp(priv->refclk_pad, "output", 6) == 0) {
 		pll = true;
 		regmap_update_bits(priv->misc, HSIO_CTRL0,
 				   HSIO_IOB_A_0_TXOE | HSIO_IOB_A_0_M1M0_MASK,

---
base-commit: c537e12daeecaecdcd322c56a5f70659d2de7bde
change-id: 20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-67b110635f77

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


