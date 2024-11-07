Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66DCD43371
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2u4fz0t80c7jmge2lYEu5zwMVfq+HYQLaYSrsSa9xA=; b=NYUhm3c4p3LHVwBaad6+6T8fGI
	UE/MW9+j9N3t0ncsfQrnYD7zqBbLVFxz2hQgeH5lwA6yjcq9xkyCGP2b1DPXTtmAbt7zeMXyiY2p9
	xPeyIreNIDh8wR8lGPt09yiawV/hXhtdM2do53qUu/yyc2yQ0zlBuqSuis2Aokvz+tcdirdFbFlMf
	NlgsOrq3U6lSSFQ1XPA4GGh+vASWTDVuGnkgTrsDK1QzSeZfLbMBizOLElIUR6QDaOsEuUXSuwAOn
	A0JFqd4jMcdPu0unPWxSC/qlKZp3SxypHj19iAwA395gEuBwmMIw5lEJVZdWaUISlES8TmUb449XC
	5/QUxj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94b9-00000007SrR-31yT;
	Thu, 07 Nov 2024 15:39:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94Xs-00000007ScU-2lKR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:37:17 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1t94Xf-0005DD-RL; Thu, 07 Nov 2024 16:35:27 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Thu, 07 Nov 2024 16:35:20 +0100
Subject: [PATCH 1/2] spi: imx: pass struct spi_transfer to
 prepare_transfer()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-imx-spi-word-delay-v1-1-2a969214d796@pengutronix.de>
References: <20241107-imx-spi-word-delay-v1-0-2a969214d796@pengutronix.de>
In-Reply-To: <20241107-imx-spi-word-delay-v1-0-2a969214d796@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_073540_742763_5D59E961 
X-CRM114-Status: GOOD (  12.29  )
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

In an upcoming patch, mx51_ecspi_prepare_transfer() needs access to the
word_delay parameter. To enable controller-specific handling of such
per-transfer parameters, extend the prepare_transfer() function of the
spi_imx_devtype_data interface to take a struct spi_transfer argument,
update all controller-specific implementations accordingly.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/spi/spi-imx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 85bd1a82a34eb4bc76a4b4528e087fc2ebfa8b85..65a8303b80b1191cd2c19d61f88836e7fd3c7ae9 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -71,7 +71,8 @@ struct spi_imx_data;
 struct spi_imx_devtype_data {
 	void (*intctrl)(struct spi_imx_data *spi_imx, int enable);
 	int (*prepare_message)(struct spi_imx_data *spi_imx, struct spi_message *msg);
-	int (*prepare_transfer)(struct spi_imx_data *spi_imx, struct spi_device *spi);
+	int (*prepare_transfer)(struct spi_imx_data *spi_imx, struct spi_device *spi,
+				struct spi_transfer *t);
 	void (*trigger)(struct spi_imx_data *spi_imx);
 	int (*rx_available)(struct spi_imx_data *spi_imx);
 	void (*reset)(struct spi_imx_data *spi_imx);
@@ -649,7 +650,7 @@ static void mx51_configure_cpha(struct spi_imx_data *spi_imx,
 }
 
 static int mx51_ecspi_prepare_transfer(struct spi_imx_data *spi_imx,
-				       struct spi_device *spi)
+				       struct spi_device *spi, struct spi_transfer *t)
 {
 	u32 ctrl = readl(spi_imx->base + MX51_ECSPI_CTRL);
 	u32 clk;
@@ -774,7 +775,7 @@ static int mx31_prepare_message(struct spi_imx_data *spi_imx,
 }
 
 static int mx31_prepare_transfer(struct spi_imx_data *spi_imx,
-				 struct spi_device *spi)
+				 struct spi_device *spi, struct spi_transfer *t)
 {
 	unsigned int reg = MX31_CSPICTRL_ENABLE | MX31_CSPICTRL_HOST;
 	unsigned int clk;
@@ -878,7 +879,7 @@ static int mx21_prepare_message(struct spi_imx_data *spi_imx,
 }
 
 static int mx21_prepare_transfer(struct spi_imx_data *spi_imx,
-				 struct spi_device *spi)
+				 struct spi_device *spi, struct spi_transfer *t)
 {
 	unsigned int reg = MX21_CSPICTRL_ENABLE | MX21_CSPICTRL_HOST;
 	unsigned int max = is_imx27_cspi(spi_imx) ? 16 : 18;
@@ -953,7 +954,7 @@ static int mx1_prepare_message(struct spi_imx_data *spi_imx,
 }
 
 static int mx1_prepare_transfer(struct spi_imx_data *spi_imx,
-				struct spi_device *spi)
+				struct spi_device *spi, struct spi_transfer *t)
 {
 	unsigned int reg = MX1_CSPICTRL_ENABLE | MX1_CSPICTRL_HOST;
 	unsigned int clk;
@@ -1304,7 +1305,7 @@ static int spi_imx_setupxfer(struct spi_device *spi,
 		spi_imx->target_burst = t->len;
 	}
 
-	spi_imx->devtype_data->prepare_transfer(spi_imx, spi);
+	spi_imx->devtype_data->prepare_transfer(spi_imx, spi, t);
 
 	return 0;
 }

-- 
2.39.5


