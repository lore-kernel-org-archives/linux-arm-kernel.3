Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2F4CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StFKrxbxfYIJoJBUUN3mU8RLnkw52PoELYYr9mlAnjo=; b=t8/kRuRRSYsp1LpSfsW9I0ySe4
	Y127y6B7ZFOwLW09JRlXdY1fXKq8V5rYUyMl8u1nNZXNlEUqT/JRPQossQRrPW1DeHTYP+HJvm828
	Bf0RPLBzDwdsjmec4oJcPaOtBC0xIlXcM+XxTfQuuNGw8H/RwwdHuNp5TgEh1C/PWiC5Hk9DLYeIA
	7yXP3HNU/m9GH7Ty9xxiJs+gGdoGhSMaZyLVzz2bp4FSHvFvHz5GXrqh6ajfcnb2xjSvOIU1yvrlI
	5ml3DZmaF87Whi5PFUnlAZZ/SUw6pytBAe/Q2cy3oqh9Ax7OQpLikCQpjgUfZaDJedEEFJL5Jzkpn
	F6dLGdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZOV-00000004qYh-2TWT;
	Thu, 30 Oct 2025 20:37:15 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZOS-00000004qXF-3aIw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:37:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761856630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=StFKrxbxfYIJoJBUUN3mU8RLnkw52PoELYYr9mlAnjo=;
	b=Ra39n0bkxPyoUmWB9kvA4rMKKA9GZXerdageuO5tse47RanAy8oS3/HETTj3LHZ6he2UpZ
	cnRq0BQC/dWbXiElShOq6FjeQlbLk5vzzARVsQd45DtlGrwiS9yAYAOOP4kKYyfbwlk3jN
	fq5c2n0IN545pwa4tjhvZrz1Bo7MKNM=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 3/3] drm: zynqmp_dp: Retrain link after HPD if necessary
Date: Thu, 30 Oct 2025 16:36:42 -0400
Message-Id: <20251030203642.3076656-4-sean.anderson@linux.dev>
In-Reply-To: <20251030203642.3076656-1-sean.anderson@linux.dev>
References: <20251030203642.3076656-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_133713_044864_1FBB2E00 
X-CRM114-Status: GOOD (  16.36  )
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

The section 5.1.4 of the v1.2 DisplayPort standard says

> The Source device shall respond to Hot Plug event/Hot Re-plug event by
> first reading DPCD Link/Sink Device Status registers at DPCD 00200h
> through 00205h.... If the link is unstable or lost, the Source device
> then reads the DPCD Receiver Capabilities registers at DPCD 00000h
> through 0000Fh to determine the appropriate information needed to
> train the link. The Source device shall then initiate link training.

However, zynqmp_dp_hpd_work_func does not check the link status. This
may prevent the sink from detecting the source if, for example, the user
disconnects the cable and then reconnects it. I encountered this problem
when testing a mini DP connector (although I had no problem when using a
full-size connector with the existing driver).

Follow the spec by checking the link status after a HPD event and
retraining if necessary.

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- needs_retain -> needs_retrain
- Actually retrain the loop (accidentally removed while rebasing)

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 38 ++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index caf2e0ce3644..1619aa61f7e1 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1677,6 +1677,24 @@ static int zynqmp_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static bool zynqmp_hpd_needs_retrain(struct zynqmp_dp *dp)
+{
+	u8 status[DP_LINK_STATUS_SIZE + 2];
+	int err;
+
+	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
+			       DP_LINK_STATUS_SIZE + 2);
+	if (err < 0) {
+		dev_dbg_ratelimited(dp->dev,
+				    "could not read sink status: %d\n", err);
+		return false;
+	}
+
+	return status[4] & DP_LINK_STATUS_UPDATED ||
+	       !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
+	       !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt);
+}
+
 static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 {
 	struct zynqmp_dp_link_config *link_config = &dp->link_config;
@@ -1698,6 +1716,9 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 
 	if (state & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_HPD) {
 		WRITE_ONCE(dp->status, connector_status_connected);
+		if (!zynqmp_hpd_needs_retrain(dp))
+			return connector_status_connected;
+
 		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
 				       sizeof(dp->dpcd));
 		if (ret < 0) {
@@ -1712,6 +1733,7 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 					       drm_dp_max_lane_count(dp->dpcd),
 					       dp->num_lanes);
 
+		zynqmp_dp_train_loop(dp);
 		return connector_status_connected;
 	}
 
@@ -2335,25 +2357,13 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
 {
 	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp,
 					    hpd_irq_work);
-	u8 status[DP_LINK_STATUS_SIZE + 2];
-	int err;
 
 	guard(mutex)(&dp->lock);
 	if (dp->ignore_hpd)
 		return;
 
-	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
-			       DP_LINK_STATUS_SIZE + 2);
-	if (err < 0) {
-		dev_dbg_ratelimited(dp->dev,
-				    "could not read sink status: %d\n", err);
-	} else {
-		if (status[4] & DP_LINK_STATUS_UPDATED ||
-		    !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
-		    !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt)) {
-			zynqmp_dp_train_loop(dp);
-		}
-	}
+	if (zynqmp_hpd_needs_retrain(dp))
+		zynqmp_dp_train_loop(dp);
 }
 
 static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
-- 
2.35.1.1320.gc452695387.dirty


