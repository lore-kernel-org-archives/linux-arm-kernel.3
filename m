Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C39CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w96SqjT+TsHgZdmj1hGbH+BW+JwhJG22bjzQ/yIyVQo=; b=SdgTjEbsOWtnO1MmVOTkcvkE4t
	Pi1fz5BoNyZQeQXQZirn6jIyM2LNDaB/gKZ5SUIn5TfLPpN3Y7yQe0JIOXBd6hrsLWYB0ryBd1LsE
	ouK7r4ccqKdjqgTiimgBvFqXpcY0hgrGI4wk1XLimsSsDJxaVDqpvhMQ6UE6PgnWyPnw+7pWNacGF
	zJbAOuBcfZokcPTbU4KOVkwkEE1nvNWQHENmgm2LaEpqhBdEes5DfG8DkU9S3iVhEyAZyZYJATbLa
	H2BHs0wIKzVYGICs5oM7fTAJ9z+anamnFE5BI/SH/Gkv7N1yG7NEysCXaIh0qfIBJI6wdtq46tN9Y
	uTWUjr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlfd-00000006EQM-2uI5;
	Wed, 03 Sep 2025 11:28:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utke6-000000065Sr-0wiY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:23:19 +0000
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D495EF0F;
	Wed,  3 Sep 2025 12:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756894927;
	bh=wKtrXGuOI00qmTLY6sya8CgZIXHv8Sh4X0UtJ+kBBos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SN0HIu0mSKVqZ8lzu0YoXTlyHir/zVF2lCG49uM02XG7n/1AQnOyDMnG3tnUCL39L
	 h9JM6T3P1dqqS0jen8OQ366bKeCST1CGk8QdkQ4Vlzy8iqFhGDjCrbAVX+IyKfF/d+
	 hFr9J4DB+txdNoBe3xHSA66sNjYACn6nyi9dSUfY=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil@kernel.org,
	nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se,
	dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com,
	mehdi.djait@linux.intel.com,
	niklas.soderlund+renesas@ragnatech.se,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 2/3] media: imx-mipi-csis: Store the number of data_lanes configured in dt
Date: Wed,  3 Sep 2025 11:22:41 +0100
Message-ID: <20250903102243.1563527-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_032318_402214_E5C9B712 
X-CRM114-Status: GOOD (  13.59  )
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
 drivers/media/platform/nxp/imx-mipi-csis.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c0..fc89325f2f94 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -313,6 +313,8 @@ struct mipi_csis_device {
 	u32 hs_settle;
 	u32 clk_settle;
 
+	unsigned int max_data_lanes;
+
 	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
 	struct dentry *debugfs_root;
@@ -1299,8 +1301,9 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
+	csis->max_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
 
-	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
+	dev_dbg(csis->dev, "data lanes: %d\n", csis->max_data_lanes);
 	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
-- 
2.43.0


