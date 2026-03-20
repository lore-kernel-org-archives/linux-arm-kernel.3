Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC6810987A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1LhaJIefzX5vaqzaxPcs+LSVJHAJAh5RGjg0srfeJg=; b=KuD1Dgjqjx5OR/ZbXOi26rHvFh
	FSt7d+MDFvSjMI1Tj7DJzW9c7V07fkvQsqEpoOrRmB0iWeFhG5FhJVtoWLzlvcbEVv9HiDLexxsvx
	dn9pALAteViqFt91R7cyLslDmzrHiycHGFZGwZ4VgGLlZukBeCuweHoG2ufFC0FLMKNiGzXOVMQaJ
	sZ209Gv7/wrSIzrkPQsXNYJOxgSgoUT2USKdhjXfsY7gyc9qQMp10sjdUQcWQk204nctGZ1mSAsue
	4h0+z5vBKHKT9IfdC3hHzN1l7w8u15gb8zcNg4vSkOJZjIGoS7ZZpDojNul/e+dA2tEksf/qPyW7f
	IVSWuECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ciQ-0000000D8jr-0g12;
	Fri, 20 Mar 2026 16:28:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ci0-0000000D8MV-1li6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:28:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB7F043D38;
	Fri, 20 Mar 2026 16:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F311C4CEF7;
	Fri, 20 Mar 2026 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024103;
	bh=b66Tl5kZoqYvPt0EneArcC4td5ZO+VTiTMrGRP4Ocis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BJXf5ZeuYCDIhrvsHxH1x2cWRy5dggsOMwsdh/Y2nmJ4+p2VWxuuAWYNEFkUqEZEX
	 c5zU/D5fcvlgkNcQhMcg+J4+kHBYh6zYnImaDb3QL6XrPmIqa5aYk7pJv5SuqthjfE
	 XP3v1PzxM4PxnrBzRVk6VnzOvBbWMFPa4EgjcT64CDMpS2tHGfeu85H0taloLObfeJ
	 p2/a7p1UULFu83tJjCpwTUhuIbS14XwM3xH0IKEhFkrBuGz2Fba1eQWkLTjspcQaxq
	 8ewdQnrfExXM7dmP8nAeMzqLUuwC5rnu8/IQqQzzhBQMvNImN+Xbqgnt8vRgw/FmWS
	 jGNtIzpcnK7wA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:27 +0100
Subject: [PATCH v2 20/20] drm/bridge_connector: Convert to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-20-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2228; i=mripard@kernel.org;
 h=from:subject:message-id; bh=b66Tl5kZoqYvPt0EneArcC4td5ZO+VTiTMrGRP4Ocis=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S3M2nqx88cjFOTf5hobf8dcX952r1ee4+OuTn1bWU
 vl131597JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATOTedsWHmilddlx2LQsS0
 J3AGCM+fufLdwqwN0ip+73KN75ZNP/IspnKnWaWfW8bG6PKa1FcbbRnrC3MCpxmZOyjqL2H1WSq
 R0VPNLtgu+H3R06dF0u5ffrlxnVjNKzDp9U+/pxovJHkWTVoMAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_092824_532173_96B93647 
X-CRM114-Status: GOOD (  12.84  )
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
pristine state in reset, which is equivalent to that atomic_create_state
would expect. Let's convert to it.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 929f06b290626d2091418a6377a5230e3c264b60..b640e7d5a065d165a901bd73fc836afaab967dac 100644
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
2.53.0


