Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF31C47BE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiEhZggfL5Xg3vG4VJq5+2MUKP+PyMAkCqc8zsFcA0Q=; b=dtjcGnKTCTY2u6dVkW4NxVG2WL
	vmuzLuui+I0xqypMJ7cTeTHxbNIleYpWCo88fY9Fx+62FOpc4noqqfU7sBgMWnCag6LnvOek3UyrF
	ZrkRub39K2AwnQNEvuIP1N/PSUAp6ZuocMpdrVOSTNnD671VS5tSDAKomeZUDnTp+PER/9Qhl9yyo
	lp6Y0rZdBQww7Wvb4+Oo7IamGa0lNjSd4xf7/XYIURvktVHFumq96MBZLneYgXkuYLZBK2KYXUttf
	eUlKUdHVH9Xoe0FpWtCWfU3SM0S8arnd30TEvVGv794N8bJT4drL8x3zK0VMxL5oYoccfn5UKE+jg
	XDwY/acA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdARz-0000000DXNk-0utl;
	Tue, 06 Jan 2026 17:02:31 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdARu-0000000DXL7-11HI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:02:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767718944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OiEhZggfL5Xg3vG4VJq5+2MUKP+PyMAkCqc8zsFcA0Q=;
	b=fj6fdhXaBls4OvMR32hJmCUt7tuEb6KdeIF+vrmCfOc+awY0Hid9t/P1AhfvzSbq0q0dA8
	VxEtRGDncoo/OChHVi7WEvV9y55XLDbJ/gMbbeijCDjk4X+bqxRmsjMqtoKwrJQrvO98hx
	MoyOKxe3ZtOg/PDAPUwLulCfPk6HibM=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v3 1/3] drm: zynqmp_dp: Update connector state before AUX transfers
Date: Tue,  6 Jan 2026 12:01:34 -0500
Message-Id: <20260106170136.501044-2-sean.anderson@linux.dev>
In-Reply-To: <20260106170136.501044-1-sean.anderson@linux.dev>
References: <20260106170136.501044-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_090227_170934_A79CA428 
X-CRM114-Status: GOOD (  11.14  )
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

We still want to retry AUX transfers even when the connector is first
plugged in. Update the connector state before reading the DPDC to ensure
the AUX bus sees the most-recent state.

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 34ddbf98e81d..f39c78b08e6a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1697,6 +1697,7 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 	}
 
 	if (state & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_HPD) {
+		dp->status = connector_status_connected;
 		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
 				       sizeof(dp->dpcd));
 		if (ret < 0) {
@@ -1711,7 +1712,6 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 					       drm_dp_max_lane_count(dp->dpcd),
 					       dp->num_lanes);
 
-		dp->status = connector_status_connected;
 		return connector_status_connected;
 	}
 
-- 
2.35.1.1320.gc452695387.dirty


