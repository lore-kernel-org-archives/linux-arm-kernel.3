Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83424CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 19:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Hv9cQ6qRRi2vVHLXfvCFJ0ztNKP7yXxJBYCkVumGr0=; b=xtbdxy0QW2suYwUhOtLQMc7S7e
	eUQXFy0x7UQeSBuozwJtd0L6JltPnQ80/8dpPhGOIQaAwempaHXMF1V3s53nODhNRoIdh0yMxbdfL
	s1ctbE5Bv+LIr7xFtdZMvngMUMnCx3NgjwZeUw/6Coh1fux7Lb4kTwbqUU+BOLn+iTFf3yudzdass
	hC2J03Jq/bzhiuN6SK+3auw390J7Pma+DJMyVRzMOjYq5s2VfpsjoTmBJ3XX5MeOjopfDOD/SpUY6
	WD8qG+uec2SD1+Jx8QVAv7NhF2vPHDnUUrAHz5QN21ZE+0ZES9Tr4tVJ7iwnfRJra3nqqkjv+jfKN
	oj6xXBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNI7-0000000AMA2-476W;
	Fri, 24 Oct 2025 19:17:35 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNI5-0000000AM7E-0Bsa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 19:17:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761333448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Hv9cQ6qRRi2vVHLXfvCFJ0ztNKP7yXxJBYCkVumGr0=;
	b=s/jCUmPp0JFWxmvc6dD3Mv6HLCLd0hsNa8sA/9O/qtRJTalPT8D0Itf6d0vwStc+JdTvnz
	qBETiCc1v4TKQZI7qjE/mSHbkZOPxZrzfWOiZS/TS4U0RpaCxYbx8wRyzRHNjrVRUQ9+Mh
	zQBWT7LkOD8hAy/5PQM2bNTYA18BYGo=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/3] drm: zynqmp_dp: Update connector state before AUX transfers
Date: Fri, 24 Oct 2025 15:17:05 -0400
Message-Id: <20251024191707.2310589-2-sean.anderson@linux.dev>
In-Reply-To: <20251024191707.2310589-1-sean.anderson@linux.dev>
References: <20251024191707.2310589-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121733_296632_AC2D114C 
X-CRM114-Status: GOOD (  10.40  )
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


