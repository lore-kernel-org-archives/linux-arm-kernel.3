Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A33ACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyU9YHSHeoRBlfEKzft75QDLwmm4JgRvAF2dZVDQfv8=; b=Cdls+i6amGSjB5GQbZDN3Y+Ob9
	GjeJrLBbhUDonTsPO0TWdEqifXuyzIm00O2/GybBuho2q4sOFv153m6A5scKnEioL3QBkkD97bovM
	9f5hDPThAVg7vYQuma7gynhPEzY32Tw/CB1LP1NnSNTXAy8g4F2YcFNYUt9/mm/7LoRq9qEhmnAIi
	6cbOvBr2StQB0SFt0h1Wbqn/Aa/I+4SR4VGd+z1yZZwQXtwZSZb5YqDsRCRKZzlRcYu4Gt1idljdG
	9uE+RRK/uBPl9uphpKBqlkvNpa7XzK2iTWo3omLLX0QVguqMPeXhE1zFAIOEwxrQLRbOPaGfMOV7S
	u7HVRDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlcv-00000006Dzx-3xG5;
	Wed, 03 Sep 2025 11:26:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utke4-000000065SK-2W9W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:23:17 +0000
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A6CBC6D;
	Wed,  3 Sep 2025 12:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756894926;
	bh=m7VoVORCRPmE9sJDD1t63RnEi0k7Sc7WqvjsbxvaBpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aTqTeDd2KK/HXBeiT9CweKPF0VShHez7ziwt5AHJpFXKXX/Xcgha5IP7J6HaQ9Cd7
	 +gnK4FOmCbGTrk8By0o6cwMY6gd3MB2A4+qlm4JjT5EqnaAnSeovwEhnDkplr1jcbI
	 Vxhp7/HC7UwJe0mM1KzLtTk+qPZoequlPF7NdTHU=
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
Subject: [PATCH v2 1/3] media: v4l: Add helper to get number of active lanes via a pad
Date: Wed,  3 Sep 2025 11:22:40 +0100
Message-ID: <20250903102243.1563527-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_032316_780301_98D2E193 
X-CRM114-Status: GOOD (  14.76  )
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

If the driver does not implement this op, fall back to using the number
of data lanes specified in device tree.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 25 +++++++++++++++++++++++++
 include/media/v4l2-common.h           |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 6e585bc76367..8683107b3704 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -571,6 +571,31 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
 }
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
+
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes)
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
+	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
+		return dt_lanes;
+
+	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
+
+	if (lanes < 0 || lanes > dt_lanes)
+		return -EINVAL;
+
+	return lanes;
+}
+EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /*
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 0a43f56578bc..3f8937260c76 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -584,6 +584,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 	(pad, mul, div)
 s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 			     unsigned int div);
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes);
 #else
 #define v4l2_get_link_freq(handler, mul, div)		\
 	__v4l2_get_link_freq_ctrl(handler, mul, div)
-- 
2.43.0


