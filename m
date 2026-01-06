Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4211CD0439
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqzdzzYSnHYqd7lgLdiNXL8RderpADhP5hUHZURlmAE=; b=r60bgKcmPdgLVf5dzdUlWloVtV
	+Q8A0LUhXzs1C8agmAcJvhtfEpx9M+7GxbxAdFLtquNgoD9wsQYBPLY8nuoEmUFLPw3axWj9xFUlT
	f9C8PQUhpqO+abvzkz+6d257x9gL4y72+ahZLH+GeGnl2ZvCG2fmezlVwBOxsMtZWk4rEw5FXZJCm
	G5fWxkQpJs8hhDPe5ir/WeIwslKCJ+VsYz5eu9OJo1pbg5Bb+4QSkNjlTamFJ/tqMUNihpsoeI4FL
	Ww2PdY94632C+5FrFkai8xSRej0PtThqu1aoa8txJIzd+inDgw5gwB7KzKaMhen2K2iMBMGRIY9z6
	YROsFd4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdARz-0000000DXO7-2Bfy;
	Tue, 06 Jan 2026 17:02:31 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdARw-0000000DXLO-2CLa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:02:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767718946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqzdzzYSnHYqd7lgLdiNXL8RderpADhP5hUHZURlmAE=;
	b=w7LwEy50CG4d2rzgHh8MXAXS93w19v6C6ZdjF6NUmSRRQhAqC/V2umFn5Fu3/87a8ksfnm
	ITJ8KG4jiOECT76LBzLNtpOOOUhCq0OE0NsxdV0d+vVDkd8nOCSvJZRWGqN0eZWOVwpHXm
	uwmrrsmQbbB2nhOQqpeYMECZazyORew=
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
Subject: [PATCH v3 2/3] drm: zynqmp_dp: Use smp_load/store for status
Date: Tue,  6 Jan 2026 12:01:35 -0500
Message-Id: <20260106170136.501044-3-sean.anderson@linux.dev>
In-Reply-To: <20260106170136.501044-1-sean.anderson@linux.dev>
References: <20260106170136.501044-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_090228_709045_963684FB 
X-CRM114-Status: GOOD (  10.48  )
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

dp->status is read asynchronously by the AUX bus. Therefore, all reads
outside of dp->lock must be atomic. Similarly, writes must be atomic as
well. Reads with dp->lock held do not need to be atomic.

Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index f39c78b08e6a..caf2e0ce3644 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1111,7 +1111,7 @@ zynqmp_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			return msg->size;
 		}
 
-		if (dp->status == connector_status_disconnected) {
+		if (READ_ONCE(dp->status) == connector_status_disconnected) {
 			dev_dbg(dp->dev, "no connected aux device\n");
 			if (dp->ignore_aux_errors)
 				goto fake_response;
@@ -1697,7 +1697,7 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 	}
 
 	if (state & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_HPD) {
-		dp->status = connector_status_connected;
+		WRITE_ONCE(dp->status, connector_status_connected);
 		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
 				       sizeof(dp->dpcd));
 		if (ret < 0) {
@@ -1716,7 +1716,7 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 	}
 
 disconnected:
-	dp->status = connector_status_disconnected;
+	WRITE_ONCE(dp->status, connector_status_disconnected);
 	return connector_status_disconnected;
 }
 
-- 
2.35.1.1320.gc452695387.dirty


