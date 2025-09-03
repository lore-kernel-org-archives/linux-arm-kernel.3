Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FD0CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIbfupc2yaUlHyk30QEvZDSWnB6BQSnl9uhJ6LQ67Ew=; b=eeVFzXpqm1Uc4nYZmWavEjVqA3
	qxY9ve/DlsdPfj41iU3gSlIsu1pDMx4hMrmD3Ez3yhgeG0RuCHKEweMdh4WqQBOYXBoOpomaQGaH3
	ewtYXJh66ZO+P/jdP2rzApQ0X7pW686f1za0qS3Ifml7l3KtKy7qsoVRO7aqJsIvcx3e4+/pmqX1v
	TETwqshdFu7AkM/rhCVE3IvZ8wZFpvDNfWz5oBlOLomaMAOZtGLUSMNA0u9vTLx6vEB1j0iFkXY6D
	2ZPry4p0DBEgGQLIJwfiW5e2UMSqtEmvpwGzkWE4xZd4FK3H5pdxyqhyeC/QTf4sPLDuNXF7oXutT
	36iPqJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utliJ-00000006Eo0-2LYd;
	Wed, 03 Sep 2025 11:31:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utke7-000000065TK-1syc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:23:20 +0000
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BC271026;
	Wed,  3 Sep 2025 12:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756894929;
	bh=j1y9w4zVSTWdKaySI00pSSbx5Q3O9jpXo7haUuEXkdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m1LIxV1kOlHdB5TjOrinTOZZvgc2N1xIEBzcH0wrmaA7X0+ddSb60RmdOCmX1500e
	 ZxsrZEQnA/sMf4x+o90/65HHyUEvRseJ8+lrCieeHGV6dRDzRUvC5rdytReL0ORLRz
	 kcy+vdfNfa1kO2/R28uAgO5rjEli4fYOQ6gXKFXg=
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
Subject: [PATCH v2 3/3] media: imx-mipi-csis: Get number of active lanes via mbus_config
Date: Wed,  3 Sep 2025 11:22:42 +0100
Message-ID: <20250903102243.1563527-4-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_032319_627934_C0BF2472 
X-CRM114-Status: GOOD (  11.49  )
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
v4l2_get_active_data_lanes to check if the driver reports a
differing number of lanes to device tree, and use that number of active
lanes.

If the number of active data lanes is invalid, or the op is not
supported, it will use the number of lanes defined in device tree.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index fc89325f2f94..985be511bcd0 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -967,6 +967,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	csis->bus.num_data_lanes = v4l2_get_active_data_lanes(csis->source.pad,
+							      csis->max_data_lanes);
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;
-- 
2.43.0


