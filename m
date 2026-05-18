Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76710CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zO/JslR4dtpUare48IWPEh7zby/iEoySFzUlGPOX5Q=; b=rlVU9n+o+jpln9RZZh2KETWIXn
	uklRDBzwjeDkgkzrj/dfaW/m1NajbsN9i1jXQb4XA7Oa3UskdnpnEMk8XqiyrYkf7MgGCwj1Qk5ZK
	vOkZ9MXwBmpD/UysX3Xs4TVmqFZwd0maKDdqyWANJAdgmrAIYA/PcxhG37lYIbomFsJgNCzHRu3i4
	ofUlpJECYOfI4wX/51ScMNXSIEiHzgxzQSLXIiaa+Znb1TUMssuQpzB8WSNXAoZA9Ivk3KVX98yFO
	eRKr8cpqgq6rTELK0b53I2jYyOgt3ZVJoVKP7iRDUAw8T7EyPKnXuccBChkHfAWWsj3xHxJmH+uuz
	9JOrWISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3ws-0000000GlRM-2AGG;
	Mon, 18 May 2026 19:48:22 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3wn-0000000GlKB-49Qb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133697; bh=4zO/JslR4dtpUare48IWPEh7zby/iEoySFzUlGPOX5Q=;
 b=fxtTYUpfelm5+3PenQvU1Jlz5qg+LbRTCikqBPcscSdOVs+AreUdH+OFLCuSBs9+YPUWTRxjr
 w1z9E8hAfUGl4577+xal7tOBe+75Zs0phBYXMARcwLrW1ha5nmUMO/dFcGQbJKBcT+OSQBwtJ2s
 oh3wUeWH5R4zFCgiUdcCK3Svcw916zUcUILhRZ/Hzz5gL3RLMRVwG9hOSMRuBXq4jhXi0MDrSMe
 KxoPZIniEgMtQFCmBW786dhD4cHIa4KbU9pAutRmoYqcAZouhuomKBrGTWwvBsyDoQJrWCQg4cU
 +QV1sKc1WkCydEe8z137K8yilUEnK/D24qDt3DTTMDdA==
X-Forward-Email-ID: 6a0b6cfdb74b0ebd362eeeab
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 05/13] drm/meson: encoder_hdmi: Use CEC phys addr from display_info
Date: Mon, 18 May 2026 19:47:33 +0000
Message-ID: <20260518194744.2483580-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518194744.2483580-1-jonas@kwiboo.se>
References: <20260518194744.2483580-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124818_112312_AA851718 
X-CRM114-Status: GOOD (  12.28  )
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

The dw-hdmi bridge detect() func now updates EDID for the connector.
Something that ensures that display_info.source_physical_address has an
updated CEC phys addr when the hpd_notify() func is called.

Change to use display_info source_physical_address directly instead of
re-reading EDID to set the CEC phys addr at HPD interrupt.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 26 ++++------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 55c0601df3c6..1b9a1d9ed3d3 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -330,28 +330,10 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 	if (!encoder_hdmi->cec_notifier)
 		return;
 
-	if (status == connector_status_connected) {
-		const struct drm_edid *drm_edid;
-		const struct edid *edid;
-
-		drm_edid = drm_bridge_edid_read(encoder_hdmi->bridge.next_bridge,
-						encoder_hdmi->connector);
-		if (!drm_edid)
-			return;
-
-		/*
-		 * FIXME: The CEC physical address should be set using
-		 * cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
-		 * connector->display_info.source_physical_address) from a path
-		 * that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		edid = drm_edid_raw(drm_edid);
-
-		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
-
-		drm_edid_free(drm_edid);
-	} else
+	if (status == connector_status_connected)
+		cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
+					   connector->display_info.source_physical_address);
+	else
 		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
 }
 
-- 
2.54.0


