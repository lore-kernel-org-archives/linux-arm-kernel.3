Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772CDCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QVOp5tGbHrDC3G6qaHcIKcSLvnrIVNz3UvDbdCum94=; b=M80SS6x9U8xBYSzdk73maroUIY
	SiawnyvTqgcmpuUowEPUTRaYJoHB+8fdnDDN+s3a1hkJPjFPsIbfIatvEwGjfArBAZzY7KqLQd9Bx
	l1+to/2V/4EO4dTECh1eKXJVjqDAvSgil6EujgcOKELNokfvtPevF3OyaKQCnfhcmgqYjn2JyNn0Y
	n7JbG1IPXrLC45QMbxdtTCxIKagRY+RxbZYpWidseNIvCElKQHtDzOHg2EkIPRuq9JOREhadzf49D
	iJAdwr02K0gXYPOE6O0ixknBWAmA3JGCt29y79nCYsmY8MCMKzosnheQrkyHJi53j11GolZfokhkD
	OxaC9ylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy96Y-00000004Hqu-3KvO;
	Mon, 15 Sep 2025 13:18:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy96P-00000004HlV-3pzi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:18:44 +0000
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 710CE32CA;
	Mon, 15 Sep 2025 15:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757942241;
	bh=BvTEpzL9SUVye7iesiVo3cTIXqu7j+cxMq93i5pmJ2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PBaAEPKk1NkgkedL5dGs3bnQjrCBAV6EFGFLvb07I+ZtHJ5HxIBij7UwqdJLJZ5FU
	 pUXVdjAgBXUlYLWO+Pq56CnXhqhLpkf2jzUVg+MKmn1rYj0cr0vsbfK6XJgLp5H1Mz
	 QZjA2uSVckT/1Ctcv66BDlnfpNPnhFaYBWn/da7w=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Mon, 15 Sep 2025 14:18:34 +0100
Subject: [PATCH v3 2/3] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-mbus-config-active-lanes-v3-2-97a1282a410b@ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
In-Reply-To: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_061842_098780_9B377CDB 
X-CRM114-Status: GOOD (  15.91  )
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

The number of lanes actively used by a MIPI CSI transmitter may differ
from that which is defined in device tree. To allow us to be able to set
the number of configured lanes without changing the maximum lane count,
store the number of lanes configured in device tree, and adjust the
debug print to reflect the device tree value.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c0..6afbedfe131e 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -313,6 +313,8 @@ struct mipi_csis_device {
 	u32 hs_settle;
 	u32 clk_settle;
 
+	unsigned int num_data_lanes;
+
 	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
 	struct dentry *debugfs_root;
@@ -535,7 +537,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
 	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
 	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
 	if (on) {
-		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
+		mask = (1 << (csis->num_data_lanes + 1)) - 1;
 		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
 	}
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
@@ -586,7 +588,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 
 	/* Calculate the line rate from the pixel rate. */
 	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
-				       csis->bus.num_data_lanes * 2);
+				       csis->num_data_lanes * 2);
 	if (link_freq < 0) {
 		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
 			(int)link_freq);
@@ -631,7 +633,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 				 const struct v4l2_mbus_framefmt *format,
 				 const struct csis_pix_format *csis_fmt)
 {
-	int lanes = csis->bus.num_data_lanes;
+	int lanes = csis->num_data_lanes;
 	u32 val;
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
@@ -1299,8 +1301,10 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
+	csis->bus.num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
+	csis->num_data_lanes = csis->bus.num_data_lanes;
 
-	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
+	dev_dbg(csis->dev, "data lanes: %d\n", csis->num_data_lanes);
 	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
@@ -1498,7 +1502,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	}
 
 	dev_info(dev, "lanes: %d, freq: %u\n",
-		 csis->bus.num_data_lanes, csis->clk_frequency);
+		 csis->num_data_lanes, csis->clk_frequency);
 
 	return 0;
 

-- 
2.43.0


