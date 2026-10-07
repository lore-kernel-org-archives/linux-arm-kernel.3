Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5551CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 02:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T0pC+g1pgTGn4VTUvhrGyt6O3bxv6jxRh/sbMmdk4+s=; b=aAvhL7YGhd+g04yNxvh7/PuBtL
	m/mE6YkIEofI27kEcRhpXIjBVvK4XK1TS0fVi62P2lh6nUmv+5f4dZlNgxAi8c5cpdFuPtuDY+dmg
	w8MQU2RgpzcPYchmiaM14WGYdxZDLd46+/xLvrUID78fpqqGHG+REME0KiArdaySnJz5rLeXQw/dJ
	BAnrv0eD3TfWL5QpTzRdrWifI4sMm/CAa5K+Tz2TzXlciFEOLCQbXuW7m01JTFmy3yJWwIizvqXmi
	zQ6GDWmf4OFNSTsFYVL3m0nR7L9oKRrS3CEoj07KAgR1l4EdDbjhepGp7vZxZk2TFXZzen9XIIi5O
	QST0oI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEH75-00000001dNN-1Fil;
	Wed, 07 Oct 2026 02:10:35 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEH72-00000001dN6-32rF;
	Wed, 07 Oct 2026 02:10:32 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: i2c: imx576: select VIDEO_CCS_PLL to repair build error
Date: Tue,  6 Oct 2026 19:10:30 -0700
Message-ID: <20261007021030.2247147-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

or1k-linux-ld: drivers/media/i2c/imx576.o: in function `imx576_probe':
drivers/media/i2c/imx576.c:612:(.text+0xf68): undefined reference to `ccs_pll_calculate'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

 drivers/media/i2c/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next.orig/drivers/media/i2c/Kconfig
+++ linux-next/drivers/media/i2c/Kconfig
@@ -313,6 +313,7 @@ config VIDEO_IMX471
 config VIDEO_IMX576
         tristate "Sony IMX576 sensor support"
         select V4L2_CCI_I2C
+	select VIDEO_CCS_PLL
         help
           This is a Video4Linux2 sensor driver for the Sony
           IMX576 camera.

