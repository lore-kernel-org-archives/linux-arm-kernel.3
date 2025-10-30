Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40635CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqzdzzYSnHYqd7lgLdiNXL8RderpADhP5hUHZURlmAE=; b=EKbOSJjbqvEhNNCG4Raj1AMx7Y
	s5dO2mLObnYontPaAmKdzHMvIs5Wu/r3EZ+qcSuozb6n+Q9r7smfWKwr27CE3UCV3Wj8Ge+Ymrnon
	/yS0EcOjlRu4paXMURyViwTplFCh/NyjNLYsHvUK5u6m1UcMouQvKUvDxRyilv208skavRqjOOqQU
	OF6sTZRrk5AvxKa4EVrJAN6ucy3HzfFexC6F+mRUfGqGDuHiMQVvRBmhCkt65S4+c8JWAPJSOhRwR
	r5Yzs9rPhEYIY6rd8pGzMwE1JLSmsJE559c93WGkhRaIOIl5/6w18FZwzveAZoilGK9bzEq/TjiyS
	cag9lWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZOf-00000004qcm-3iqi;
	Thu, 30 Oct 2025 20:37:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZOZ-00000004qaw-3Ry1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TqzdzzYSnHYqd7lgLdiNXL8RderpADhP5hUHZURlmAE=; b=l2MYDyXWEZ4tpJSlcv1Ig7gZ7u
	9OLFPM+vMXFPFEkgD9Ffm1mkRpG+sT2qJcQV8sSErR1N2WWalsP0/kqBB0YuzAM1X8i55Yv5HL17/
	bgz+udLIfcLGRJs8Ykb7wbnbb2WO5a0tGDDPXfrfwxWmKKJRH9I/5eTgosuYLqAh/oJbAi1MXq5bV
	I+S0SiGBXjIqqXtCefA0EeLcEVoTEyKWN227KBmFnRWIXQf0fW9J2pf/2+NDC8ZNHmEnxe1k2xMAx
	s+iw2Pu4FMkiOhlyv9lh1SfofZmSb2xNAByxrKS1QEL9L8o2Cju3C0gIFoXUTIXsflV+odnHlplt3
	tNxmc/GA==;
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYWo-00000009ytU-0XR0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:41:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761856628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqzdzzYSnHYqd7lgLdiNXL8RderpADhP5hUHZURlmAE=;
	b=tMhNy32r1KcQAFPPDHGfVHcGLodrWtlciZGMt4iRCtbCiiOrRoxH5kwlCrG9GcEP2Fu93W
	IXKw4S6mthkgxWFegHfsJhApZCJH3/kl6IM6IJIwFTw3mGbi+3HsvgG+f6RNBQFsNei/7X
	UowFicSOo05cNxL59ZjBr9EabBivbKQ=
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
Subject: [PATCH v2 2/3] drm: zynqmp_dp: Use smp_load/store for status
Date: Thu, 30 Oct 2025 16:36:41 -0400
Message-Id: <20251030203642.3076656-3-sean.anderson@linux.dev>
In-Reply-To: <20251030203642.3076656-1-sean.anderson@linux.dev>
References: <20251030203642.3076656-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_194146_248004_459040A0 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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


