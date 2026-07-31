Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B258C55172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWFrFrjVtfbKBBjs4r4K1bZlmTng9wcO1QH/xLCh+dY=; b=drH1/dTl43Uy4a/7nDdcLiFP+c
	8DyDONkE/yLmN/zV21MzahvZjWKfsHo42yHVuPBXWHS/e8epy7kUWEZJiLTMc1FTEHNPBic+z+aVy
	wUXWPbE2Nzm4atW+/o9lQfKk+n/iDlBz9lWXthiPbzBwR4uoyUlztIcs2IHrlF1Bgln/ppOpe0/T9
	2WukPKlUHi4BJrYEsIzrNfAY0Ec7Z4u88dv23tpNDWmqsdRDm3UrUkcJf2YsyGiEQyy7aLK883p8w
	7vdt3LOltNmkP2FuCs6ZcBkXikjntHke3bx4j18pZPD5oTSDdCEhYuNUJy3Rip0gLDA0EK89y3GFS
	XW/7/VeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoTQ-0000000CnwN-1nRh;
	Fri, 31 Jul 2026 14:44:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRF-0000000ClcO-400F;
	Fri, 31 Jul 2026 14:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508930;
	bh=rAX8Gkdd0l2SvPThxGwSATdesygL1W5j4bmXRGpe4TM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BzgoTAZuLpIhChG1z9LFKGCcE9eLeJYj72GNPrzr2X4PfsrqY/ijCqUgTG/2dswUH
	 f+Y4yU0y8SAfqfyth5rN3KZo973UXA+RIGdhcxtrtRHLiw6c3UO6uOvtfS8BJ1JbxO
	 Q3Fzg87kyQeck5OATxVnPpXFmOsczJfXUnIGTgcTRbSscVovFbgLNZBSOWvSj43SKt
	 hXj7W25MBgaWP5s2oVO9ihZo6k8Fj2jWph0YbJ0VMSUj2r/tJQUI6HzT/wKIKqW4bL
	 9A4QS6D+Ag5fakCfdOZKmCO+kDl1CAuJMi2wPhEDOrwPdsdyawCQc0J9TyXx42BL/u
	 yjUUygFzcAL/g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B348317E092F;
	Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0CA3C480048; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:16 +0200
Subject: [PATCH v8 11/21] drm/bridge: Add out-of-band HPD notify handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-11-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rAX8Gkdd0l2SvPThxGwSATdesygL1W5j4bmXRGpe4TM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEABLQDVMHJP/uS0OCzQUhxcaVi2JD9G7
 61Rlu6ekPGfI4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qabekP/02yh/jX7Z0sGPbbBmuCzOV7MMLqYfCl52UKQubyh23VuD82JslrDfbwbUNgzkTO61K
 JNEmH0aPVS3ngw6uedOIA4cJkX8gZmpNi45VQoMZQVglQcbCHptbyXxy6yP0fjbMAP04WkYGdWt
 I7xp0ywcY0mbmuKm0x7k3KJ5Eupagaj8+JyPTYynqHZfu2YKFc2FMVUCftvdIXO9DLSn4Gv2bRF
 M0B9zTNtcU0uRXpk+gd4gKfnvifMaLuSgExTkbIc45e8Z41IM/sk3W41iUZsZxCKOYyojPgMflS
 HQEvzNjbYZ2EX/O/XTJUIQYP0cS3EsXRSkcn2IWs/k5WRPsAsv1M+g6qz1EGdJveZVC92yVx3V3
 Jt4ywSomCwgkUyqgJtxDCWRIYgJfOtly18utZawWreoQVtsijlyv+0o2bnCQYfP4nLUy+B1oifX
 7KQR0FEDmTn2WN9C9PHrj1Vu5MO1HEhO9Stc+EQcqKC7Wp4/r1JK44KkipwQIHzBF/dhX7IaQLr
 jlmOQvgYdwUkQMWuGuWmnoFo79phQf+pX+zdouNOFhKzNAQFqEwg2n31ey/4Wf+L9a1hLVbLZ9V
 K6K3xBsKY2gYJ2LA/wQxLKq216vNH3nQIqDxUjJ2nD8BNEpmr+HuYMjaBzcI2LUOnvvGtutZw72
 YK7s1fNDOtTa++NvGq2o0eg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074218_264160_8C588278 
X-CRM114-Status: GOOD (  14.70  )
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

For DP bridges, that can be used for DP AltMode, it might be necessary
to enforce HPD status. There is an existing ->oob_hotplug_event() on
the DRM connector, but it currently just calls into hpd_notify().

As DP bridge drivers usually also implement .detect and that also
generates calls into hpd_notify, this is a bad place to force the
HPD status as the follow-up detect call might force it off again
resulting in all follow-up calls to the detection routine also
failing.

Avoid this by having a dedicated function for OOB events.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c |  6 ++++++
 include/drm/drm_bridge.h                       | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8b54069fa53a..632cc3ae3b54 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -180,6 +180,12 @@ static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connect
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
+	/* Notify all bridges in the pipeline of hotplug events. */
+	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
+		if (bridge->funcs->oob_notify)
+			bridge->funcs->oob_notify(bridge, connector, status);
+	}
+
 	drm_bridge_connector_handle_hpd(bridge_connector, status);
 }
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 58fff047f43b..713652fca033 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -540,6 +540,20 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * @oob_notify:
+	 *
+	 * Notify the bridge of out of band hot plug detection.
+	 *
+	 * This callback is optional, it may be implemented by bridges that
+	 * need to be notified of display connection or disconnection for
+	 * internal reasons. One use case is to force the DP controllers HPD
+	 * signal for USB-C DP AltMode.
+	 */
+	void (*oob_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
+			   enum drm_connector_status status);
+
 	/**
 	 * @hdmi_tmds_char_rate_valid:
 	 *

-- 
2.53.0


