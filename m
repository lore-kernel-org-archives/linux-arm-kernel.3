Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D33CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daXZ5T1J6xGzZ+80r2pd0PG+1O1afureKS9uR9U4CE4=; b=szfelxWavBkOQgGeW43QcmPI3C
	Pr4dJAZ62xWjUytOC6BaUo/G0/guqNNodQj3dtUXV12Tz4yvElEowXPcSOlVb/TMmVHMhds5qn8pv
	dXH6qbNUQG0tD4Cd8iQpgFaUlvjpe4Z3TMeig/dAdn3QBu7e/NLL1rF/WA4x+MUK6Fi7BcbsfNYgj
	yEI9iYlMp0Yb8gY5WtdfOhX2X5BCdPhugy3i8/4uKqNG8aKDic1q4Zmg6NohEKmSadbVXX2YhyJ2T
	byWd7eLdEVRK3GPAgEJTcrUK9c6icOH/HIdGoA9dXnOC2oBAM/cZRDU7kr0OEtGB0zOx3tTgbruB9
	bbJ1v1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVzl-00000002TAW-0Nv8;
	Wed, 22 Oct 2025 10:23:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVzN-00000002Sww-3RBE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:22:49 +0000
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0E1A178A;
	Wed, 22 Oct 2025 12:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761128456;
	bh=YxLHFykL3sVDstB6QqAhE2alQAOsXneyIHwU8PQ/9I4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IvJHQBfv/w/CGAJCH6/+bepYpYHaqLpWXCLP+k/jTb1hrZYqrwQhIvczOXGuwrKQq
	 FabTU3iNazT54Cyyj6Kj7Zwn4qr/yzFmqoAgTDHJPNUbvbMn3014sZp3Strl6tMY8o
	 rroe0T+M6A6MBZgxTCey+Ei24RzPyG/DZtIQpZi0=
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
Subject: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes differing from maximum
Date: Wed, 22 Oct 2025 11:22:28 +0100
Message-ID: <20251022102228.275627-5-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_032242_073452_5777137A 
X-CRM114-Status: GOOD (  10.57  )
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

Call on v4l2_get_active_data_lanes() to check if the driver reports that
the number of lanes actively used by the MIPI CSI transmitter differs to
the maximum defined in device tree.

If the number of active data lanes reported by the driver is invalid, or
the operation is not supported, fall back to the number of allowed data
lanes.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 838a1ad123b5..637ef6e614fa 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	ret = v4l2_get_active_data_lanes(csis->source.pad,
+					 csis->bus.num_data_lanes);
+	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;
-- 
2.43.0


