Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673C4CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rL5J7m8K3Q57j4xj9zBXrezHmBGdCc52xtlXGdUsdqQ=; b=sF1lyvQP+Zns8ZHdaDaWcBN1bd
	7S5LFonkHL9skTM/yhP11tS1PifmNXAcVy8v+G+g2YYqcT/xBfgQe5eQuhF5qS5FKLCPLMgYuchpV
	Ky30Wa5B45tWXmP2qzSW64vnl6lVheezoi6Jx2zoYjjfKJJp3b1gPh4aPOCtgJVNXw5hM20rDR5Ci
	30hJ5qukpNDISE1ALgPJkJvP02l/lRCArsLWkdJXLDc92prpG3LW9binolx+Rh7lc3DPFY06OTUGR
	3eAfhVDOSmEJ4IUHxCDaU3JDCDDpLjybC8XrI89rCXXWJAfLFGM2RCD5tTLd1ewup6wqEsl79xwnS
	p7oHNT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVzk-00000002TAD-2adz;
	Wed, 22 Oct 2025 10:23:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVzL-00000002SvW-0pIN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:22:48 +0000
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AF8C8FA;
	Wed, 22 Oct 2025 12:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761128451;
	bh=Snr3gpZ7+iGBKLCS7AvL2UYxmpcLXIBEkGrG9qyjAbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qluBMNrAEWD4GTaCR5h+4JCrn7OCRdtwCHPbVa/lr23RVBmDuj/mwIfP/IQSjESQn
	 Y0E/Mfz/qtSlVx9L669LIXwJMPjcrzsxSTDNH8NEKZTA1NRtLRuYatWDNorpSBtcCQ
	 4bThNWWYnm5xhtQHJx77QMCYcu7KKP/DoCjuJExQ=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v5 1/4] media: v4l: Add helper to get number of active lanes via a pad
Date: Wed, 22 Oct 2025 11:22:25 +0100
Message-ID: <20251022102228.275627-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_032239_394421_CD391AE5 
X-CRM114-Status: GOOD (  17.03  )
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

Sometimes, users will not use all of the MIPI CSI 2 lanes available when
connecting to the MIPI CSI receiver of their device. Add a helper
function that checks the mbus_config for the device driver to allow
users to define the number of active data lanes through the
get_mbus_config op.

If the driver does not implement this op, fall back to using the maximum
number of lanes available.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 29 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 20 ++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index b367d479d6b3..2b4cec25e751 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -573,6 +573,35 @@ s64 v4l2_get_link_freq(const struct media_pad *pad, unsigned int mul,
 	return v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
 }
 EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
+
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
+					unsigned int max_data_lanes)
+{
+	struct v4l2_mbus_config mbus_config = {};
+	struct v4l2_subdev *sd;
+	unsigned int lanes;
+	int ret;
+
+	sd = media_entity_to_v4l2_subdev(pad->entity);
+	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
+			       &mbus_config);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		return ret;
+
+	/* This relies on the mbus_config being zeroed at init time */
+	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
+	if (!lanes)
+		return max_data_lanes;
+
+	if (lanes > max_data_lanes) {
+		dev_dbg(sd->dev, "Active data lanes (%u) exceeds max (%u)\n",
+			lanes, max_data_lanes);
+		return -EINVAL;
+	}
+
+	return lanes;
+}
+EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
 #endif
 
 /*
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 5c0a7f6b5bb6..950df46cb27a 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -581,6 +581,26 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 #ifdef CONFIG_MEDIA_CONTROLLER
 s64 v4l2_get_link_freq(const struct media_pad *pad, unsigned int mul,
 		       unsigned int div);
+
+/**
+ * v4l2_get_active_data_lanes - Get number of active data lanes from driver
+ *
+ * @pad: The transmitter's media pad.
+ * @max_data_lanes: The maximum number of active data lanes supported by
+ *		    the MIPI CSI link in hardware.
+ *
+ * This function is intended for obtaining the number of data lanes that are
+ * actively being used by the driver for a MIPI CSI-2 device on a given media pad.
+ * This information is derived from a mbus_config fetched from a device driver
+ * using the get_mbus_config v4l2_subdev pad op.
+ *
+ * Return:
+ * * >0: Number of active data lanes
+ * * %-EINVAL: Number of active data lanes is invalid, as it exceeds the maximum
+ *	       supported data lanes.
+ */
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
+					unsigned int max_data_lanes);
 #endif
 
 void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
-- 
2.43.0


