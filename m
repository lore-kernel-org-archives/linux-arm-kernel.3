Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BD9CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoXBOAsCBLkRgIlTLAaPNEvsIAgN10v/xLJsKPeWKHc=; b=FtUKx0Rwqq0PAFqFKcAI57IJtH
	Lt0oKfmJK6XoIHi1MHig4q3bKFwP1n0tjicNISzaQTwt8ryHmgYzY5IvtQrpz6bc32d6kS5jGp2/k
	mNy6JfrC/3yhUixCq3Pp3ZQi5eN4sP7GjmH6wRfp/LMBivJ/S5XHJ+VjbsNeye8bV8Vkw/b8nKmYC
	C33MP7G43LPOJCvTSVBF9BXLv3/u+PEOtt7xmzX0S30CabZpupuQ3cuSQI21+8n4GqHAOo4Peh2HL
	s8OKtJQkQveX3jBWBTJiffGYmhoAKBIvZek+kwvD5dMmGih7BK7fpUD3Lv9CoSsJEOjqHp9RCP22E
	mmWM5bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuwR-00000002a63-23sg;
	Tue, 26 May 2026 16:47:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuw5-00000002Zna-1fqw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:47:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 961014054F;
	Tue, 26 May 2026 16:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FAC1F000E9;
	Tue, 26 May 2026 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814040;
	bh=GoXBOAsCBLkRgIlTLAaPNEvsIAgN10v/xLJsKPeWKHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C8kmmIBdZcidMYCHRPP8N77C3zSxCRkolviS65VmH1HGOaOVhDqbY/xXyPDl5eK+d
	 b5K6y+5BF96u0pTcADOOytkwh/y98u8I1uqJRxYRo1Y8BtbTa3z4jU+TTx82RW2qME
	 BSQxczZxbFuJWBe2pdJvXTfNGr6OWk5MZ4FtNs29jbkYgLSW9e54grHQlf0Sh8ZDfn
	 gPM1ivgNT2VtN9qBCVJvk4ox5cU7E8kmrE3j2+NgpQyypdGyPuqkKwIuNV10TkOtkV
	 vUpXmKjplaLA+AIBtaqxVJlDAhSKlxfbv93r7RIwtpFshcjzCYGa2tdrwqSvyRahIK
	 hkcRssgmlr+Og==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:31 +0200
Subject: [PATCH v6 19/19] drm/bridge_connector: Convert to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-19-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2233; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n4eohByrrLdrAD3Xh6iy0bQauhz8JMCGndNHIg0F7dc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi5+KKsw9J67S4+LT7hnIIfvn922i2MV/qz8c/QrhsX
 DSTl1Z0TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgImk3WJs+C/7eeruiPrYPam3
 Ju94bjDFIOiLkcLuMIs5fYF3+OzXv7MujT8ULbKUaa2v6L5lHNuWMjZ82detLrREx8G8fOZinid
 aNwq9i17zmz+t5dHn2r7zypxdnI6bmyKLKhZ13lr4zDDkgjkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_094721_821904_046FA2DF 
X-CRM114-Status: GOOD (  13.02  )
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

The connector created by drm_bridge_connector only initializes a
pristine state in reset, which is equivalent to what
atomic_create_state would expect. Convert to it.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 50408af746d8..cafa498c3848 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -263,26 +263,33 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 		if (bridge->funcs->debugfs_init)
 			bridge->funcs->debugfs_init(bridge, root);
 	}
 }
 
-static void drm_bridge_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *
+drm_bridge_connector_create_state(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
+	struct drm_connector_state *conn_state;
+
+	conn_state = drm_atomic_helper_connector_create_state(connector);
+	if (IS_ERR(conn_state))
+		return conn_state;
 
-	drm_atomic_helper_connector_reset(connector);
 	if (bridge_connector->bridge_hdmi)
 		__drm_atomic_helper_connector_hdmi_state_init(connector,
-							      connector->state);
+							      conn_state);
+
+	return conn_state;
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_create_state = drm_bridge_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
 	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };

-- 
2.54.0


