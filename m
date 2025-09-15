Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20361CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEfR1XH1bMrVmYaoRtNyKhesOU2goaB7J6awZWHx9D8=; b=zKWM/bwYwwXe4Uv6oHuYe7oVqB
	VjMy1Dn2+q69U8jROzHu8g+vs1PpkRR7A+Qet9nsZUOKDwEkufqSYbBrXMtkq+4wI/+Tw+65ykMs4
	bXFofa4XCdvWj/RJXBfqJwLeBCjBVSAX0tkT8JZYs84I973u3HM4cTHypKXhOvg6xogy03ZZ3vGvt
	wbhs8E6sFJkqD0JeTAgI5IWXqAv/kR6zaZObF7SKaXG35aFYNhMPsLlaPXUmjDLeJWbzCNGiT3dta
	bxEAzcUsIqVJXYDo91FQf1UfXjFOsKt2Yzwb9Eb84L8u+n+RHi/YoBkzgpu8C4zV9i2RC2+nBWb4X
	o3c0bVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Cj-00000004Iwr-11sM;
	Mon, 15 Sep 2025 13:25:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Cg-00000004Iw8-0wup
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:25:11 +0000
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 082A03FCE;
	Mon, 15 Sep 2025 15:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757942242;
	bh=c4yZf5AiBVUDuy3InXPlki0Snp/s01BBP2Iy0btwSkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pojt6AqJkxMINXvJxQZxHVm7kpOq6nQXdFrHOCKJ9d3TD+/jS+I8y9gsrf8vcupuL
	 s8Zl7wchKZWBz8yfxVDv7Hw9UUkXuXEbUWwm5I5sdhZTz8/VUwkCMxtvKhLDOLwUP/
	 6zRThlCdMkxTV/zvFJ45dsEf46HQYAlESSmtJeTA=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Mon, 15 Sep 2025 14:18:35 +0100
Subject: [PATCH v3 3/3] media: imx-mipi-csis: Get number of active lanes
 via mbus_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-mbus-config-active-lanes-v3-3-97a1282a410b@ideasonboard.com>
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
X-CRM114-CacheID: sfid-20250915_062510_402049_9006C1B3 
X-CRM114-Status: GOOD (  11.70  )
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
from that which is defined in device tree. As such, call on
v4l2_get_active_data_lanes() to check if the driver reports a
differing number of lanes to device tree, and use that number of active
lanes.

If the number of active data lanes is invalid, or the op is not
supported, use the number of lanes defined in device tree.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 6afbedfe131e..d3424ad54b4e 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -967,6 +967,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	csis->num_data_lanes = v4l2_get_active_data_lanes(csis->source.pad,
+							  csis->bus.num_data_lanes);
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;

-- 
2.43.0


