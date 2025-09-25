Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05626CAC5B7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0QxJHexJRyL9ZZbScg0I0v1sA2ckYUks2jcWL1NnxE=; b=Ed+nPI/YbprqUKypV5G7TFbS2E
	iOv/DXaBQvOB85wCksBPVrRznWHC7kMDOU9gUqJU+4HEa9z6dHK1p4Pn2T+9lfIyZwp50chd1RYgL
	UXL+6R5N1gpauPrUxP/EkcuHjoRMZFzy4whbrIS9gU61bDITLcBYh9gs2+9YgrGmIUMtgq2Mx5HKQ
	Gto/IM9cSqhgFELTfjZlNDMaOzRTZbKt6/gzj4Rm4kKDdaZ3GuC2IRUVuqwNMJwXjyUZwHaCxb6OO
	B2P+ct3kPvcINDSFO2EiThL330vazRyYCrDrZMVL1SwtaSj995hsv95qqbvG3/KmCZ1J/yL8Jl0hP
	icHNLQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oJj-0000000AsiJ-0F3q;
	Thu, 25 Sep 2025 15:55:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oJf-0000000Asaq-47i8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:55:33 +0000
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFC861E3C;
	Thu, 25 Sep 2025 17:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758815643;
	bh=id013NlFyzuJMf+mdvtdKKj31ZyAXitg+Te/hkly/4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LJDTh92dkIfWw5AwKRlog+j+7eoH1q4eIYu5fw8Y7uG0zP/uxJ5yqr5gGdS9tATZk
	 lTj23G0bblsByB51GiZ2hxv2xryYVWnmO0qpSnH5+55ehsuCj/sCSCHeRCqCK3yGPe
	 auneg2BY4ItMk2QLpoLud6riamaMEQQYxXdA/DYg=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Thu, 25 Sep 2025 16:54:28 +0100
Subject: [PATCH v4 3/4] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-active-data-lanes-v4-3-8b54e3d5af6c@ideasonboard.com>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
In-Reply-To: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_085532_162179_AE66946B 
X-CRM114-Status: GOOD (  13.55  )
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

The number of active data lanes in use on a MIPI CSI2 bus is not
necessarily always the maximum. To allow us to configure the number of
data lanes actively in use, store the maximum to ensure we can configure
a number of data lanes that is supported.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 7c2a679dca2e..838a1ad123b5 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -351,6 +351,8 @@ struct mipi_csis_device {
 	u32 hs_settle;
 	u32 clk_settle;
 
+	unsigned int num_data_lanes;
+
 	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
 	struct dentry *debugfs_root;
@@ -573,7 +575,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
 	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
 	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
 	if (on) {
-		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
+		mask = (1 << (csis->num_data_lanes + 1)) - 1;
 		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
 	}
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
@@ -623,7 +625,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 
 	/* Calculate the line rate from the pixel rate. */
 	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
-				       csis->bus.num_data_lanes * 2);
+				       csis->num_data_lanes * 2);
 	if (link_freq < 0) {
 		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
 			(int)link_freq);
@@ -668,7 +670,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 				 const struct v4l2_mbus_framefmt *format,
 				 const struct csis_pix_format *csis_fmt)
 {
-	int lanes = csis->bus.num_data_lanes;
+	int lanes = csis->num_data_lanes;
 	u32 val;
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
@@ -1366,8 +1368,9 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
+	csis->num_data_lanes = csis->bus.num_data_lanes;
 
-	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
+	dev_dbg(csis->dev, "max data lanes: %d\n", csis->bus.num_data_lanes);
 	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,

-- 
2.43.0


