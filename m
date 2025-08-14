Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BB3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/cmZLXk9flEmT/G1PpoWfNhnh1Uc1dZv6u+Kntd5dXE=; b=gfw8Ps1D/id9sEKYorYiHr2RcH
	dO+MJs7J987KG9h2WcNCBHG9lTjMqgZ4yIdV9YrpfrPZ7PIAOzWt1xBXNc3O0TrTmdeBV0p0a6maM
	0VnXD1ZoCPZwAeLrglwLCLsJ1cYSbb31RCdR/0O6lWN7dVkZEyanOJ6i6sCsa9spcl8YTnnKm4us1
	+i8ZjKelxTz1zjeUqglcEz1BiJo7Wbza74sv+c8obf+B/6S6EF/muEFcxxKGra1/AfSv3SBiRJJLK
	i6RcbNWexsBTpWkCJ6qLImoG0ijwp5ljcVBlD3Ornl441t38QJ+Z4r9U8bl+4Ae2iFISL8MlAXGE7
	ilVx5/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXsC-0000000H1s3-1cIl;
	Thu, 14 Aug 2025 13:20:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWI0-0000000GlDv-2sxL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 11:38:38 +0000
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9620656D;
	Thu, 14 Aug 2025 13:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755171458;
	bh=0/kcF88SImS98m2EJ/3g0BxMqg048eR3mnkGCn/omCw=;
	h=From:To:Cc:Subject:Date:From;
	b=DcZYdkyJtE7iKxlaazF5aqwf7ef1TLMB/qs+dLqzuAZa3jgIp/Z6xe897brQpiNcl
	 EkuEOt/v/4yoW5I5FRAN2LikH7Qtz+hmf/lJWoGJxxbKSHrxIMgElYiiBNYn50djeE
	 E+ZQhHj41JcoFWgQWcd9dRWL9vtGfVOSRBtdTYcM=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH] imx-mipi-csis: Get the number of active lanes from mbus_config
Date: Thu, 14 Aug 2025 12:37:01 +0100
Message-ID: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_043836_865275_CBC753D1 
X-CRM114-Status: GOOD (  16.42  )
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

Although 4 lanes may be physically available, we may not be using all of
them. Get the number of configured lanes in the case a driver has
implemented the get_mbus_config op.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

---

Currently, the imx-mipi-csis driver parses the device tree to determine
the number of configured lanes for the CSI receiver. This may be
incorrect in the case that the connected device only uses a subset of
lanes, for example. Allow the drivers for these cameras to create a
mbus_config to configure the number of lanes that are actually being
used.

If the driver does not support the get_mbus_config op, this patch will
have no functional change.

Compile tested against media-master (v6.17-rc1)
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c0..efe4e2ad0382 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
 	return container_of(sdev, struct mipi_csis_device, sd);
 }
 
+static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
+{
+	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
+	struct v4l2_mbus_config mbus_config = { 0 };
+	int ret;
+
+	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
+			       0, &mbus_config);
+	if (ret == -ENOIOCTLCMD) {
+		dev_dbg(csis->dev, "No remote mbus configuration available\n");
+		return 0;
+	}
+
+	if (ret) {
+		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
+		return ret;
+	}
+
+	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(csis->dev, "Unsupported media bus type %u\n",
+			mbus_config.type);
+		return -EINVAL;
+	}
+
+	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
+		dev_err(csis->dev,
+			"Unsupported mbus config: too many data lanes %u\n",
+			mbus_config.bus.mipi_csi2.num_data_lanes);
+		return -EINVAL;
+	}
+
+	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
+	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);
+
+	return 0;
+}
+
 static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
@@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	ret = mipi_csis_get_active_lanes(sd);
+	if (ret < 0)
+		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;
-- 
2.43.0


