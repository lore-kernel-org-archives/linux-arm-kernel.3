Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD865C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqyOJwWDc9siUyUIf9HLEiRZ/UBmYkZ2bG5NW9K2GYU=; b=iz50EmWpwHsr5lt7hBUYWm74mH
	KH4kaJkUJUdY7O4cQ8No8OfkORvHF8HGPABq6F4/DNfn83Wzbj1Vuc8SHXVAECROwmcDrkdLovgn2
	5nAPwQgXwiUnEKBBOCjsjpw3xteKhAXCrnOvi/szo/PdFOaQjl9qVlJ7nxnY2fz5UDwvGXgAZC9ur
	evvZlyV8cCOUOBWuRGHOE/RtKOH+0z6CLiaiDoPuOmWWF5j+Z159yvPRWSqTvWmZXowxwK0KbJQvR
	xcrW2iObEAQgg/nCVI/IYDZ27WSf3MAutGxoYw9S130QpFuiUN4+H1wL4ocsjWTkCTmQ+Vmwai9jn
	o9Rp9puA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MDc-0000000CVVU-1bBy;
	Wed, 09 Sep 2026 17:36:20 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MDY-0000000CVQV-16H3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:36:17 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48435bcf9d9so580360f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975375; x=1789580175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqyOJwWDc9siUyUIf9HLEiRZ/UBmYkZ2bG5NW9K2GYU=;
        b=CGd0UBrnJV9Or0UH/W44ts/yFKQXWWs4R8u630TJRHUUUamqZ5X9HevJIUpKmy5VWf
         n6uPC5qUhNld0q/QQXSbF1tuAI48VqJH8GIvTP3og40Ajjh+Y5OZTra5K43YG4V32ORs
         kB3+iH///PT6DxiIrEnqbSHIPf+S9NPTBPUqV/SMFOngLDn09rfVD5zNVOhmsc7nti2b
         mZxogqHYBNe+gAGqYlm0nB33a7i1rbcgJbRRHrZBHYgTt+itJoZqQHjZqRxtkUbLD9l1
         o/zEeNMethdw/LfgfLan37T+Y9MlSTlc3Bg8NSLJN6El0Ny2feBdK13PXJPD7USWlIpf
         0n1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975375; x=1789580175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqyOJwWDc9siUyUIf9HLEiRZ/UBmYkZ2bG5NW9K2GYU=;
        b=sPtyAI5uq9P0DI/7IfMgizaVXNVjWh8CK0oDMtzbS4L0QBaV3f6IyBgkxmq6/eg+ek
         iss603z4/KUl+DRz1s7pA0El9Cfx5D7uSVx4DJMQtum38sNkA51AtHBfK5wmTeFwt6XN
         vfwKIqjvh/GlIznBHZjwcWBttUG0kjySbgB5QRmnSQbVMUPrBfyyBKqP5B4dcQoWxdKj
         6R8aMyoGnA/eUsaEyIMRbDuhmiu4eYhNiI6Zk3edxziG7LkFZtC4qGpYjgNvXHQE0GFd
         g4U3a3frr5etSNKMxCloo8MzrTr0xp5Xlzqwlyv6Ki8WRmVlPB0d5DgTx2dATS5Zg/WE
         LP+A==
X-Forwarded-Encrypted: i=1; AKwUvBzEH3Gh8T79BHcIp52Z4FJ42x3d5ci3BTlEVtzZQIdBbBLe4GtfB4HvP9TdBeC0GbW+eKqSVbNw0KFO45aFtanX@lists.infradead.org
X-Gm-Message-State: AFuF++lzhM5hfx2J52j8kJDEM1t+gObGUObZzhLY9bA2kMQOBPpqA4TP
	btXN65c8m9zye5pvMN2DD9Z8Wngew+XzXH4AopOSky12SvqKWNlxDe3a
X-Gm-Gg: AYBFou2Vchoum3c2B46CKbRkARhZfJH9WxCTRQB1C2RFaaQ9HWChKXmM/4M5v81xi5b
	Prb3iuTN3olr9ZbLKxSM65sIhht4HiMDXyeBXbqzIkpIguhxTh4zgg8W5ZMt/zRG9dw31AI/BaM
	Q0NdibHHEDUEaaswlfiLrQ0/iwNcli5e0cObfG9idAQSR+71qB3HyGVYy9pefG5WPXm5Mtl22JV
	0V2MZg4LJ7TlJlRwQThcp9TDWkq8Y59ZyzVwdQwQFvNl4YKnRv2p3GbkTe/cKBz47e++83XhQf7
	9ehk31oHQbuT7fg7uThxz2OIBz1JnFOdqy/RByCxmfrC2uM1JKs5E7znVH7flYOedRvGov3AS2i
	lD+DN0wjUsXeJj/uJMthZs0K23uev6cM7k7ss3R2SZpbIKHEHGCzufeQ2CHsdcWHO3QGIUyhiGT
	WHf8cuV4uudAZ172c/U17Q/D4z6koqWniGQ7iHbu9M4UBesfKtImkvIHBhi+rQ5sHzI32V0TE01
	11SiKE3UDaH3lp1lddqtX5kze+/X0Zd6r8ia29NWdTyXFnUR3a8iPi6a0RZvvKFK1l60FDQh5OY
	mA==
X-Received: by 2002:a05:600c:620f:b0:49c:eac2:ddad with SMTP id 5b1f17b1804b1-49d2570acaemr24678895e9.1.1788975374390;
        Wed, 09 Sep 2026 10:36:14 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:b011:705:bf09:2680])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:36:14 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector property
Date: Wed,  9 Sep 2026 19:35:40 +0200
Message-ID: <20260909173542.14030-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909163206.36409-1-royalnet026@gmail.com>
References: <20260909163206.36409-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_103616_326634_32A70DD4 
X-CRM114-Status: GOOD (  17.68  )
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

The dw-dp bridge already filters candidate output formats on
conn_state->max_bpc in dw_dp_bridge_atomic_get_output_bus_fmts() and
validates the result against the link bandwidth, but the connector
never exposes the "max bpc" property, so userspace cannot limit the
bit depth. Attach the property with a range of 6 to 10, matching
dw_dp_output_formats[]: the smallest entry is 6 bpc RGB and the
deepest entries are 10 bpc.

drm_connector_attach_max_bpc_property() initializes
connector->state->max_requested_bpc and therefore requires the
connector to have a state. Rockchip binds its components before
drm_mode_config_reset() runs, so the freshly created bridge connector
does not have one yet - create the connector state before attaching
the property, exactly like drmm_connector_hdmi_init() does for HDMI
bridge connectors. The later drm_mode_config_reset() then re-creates
the connector state, and the preceding patch makes
drm_bridge_connector_create_state() restore max_requested_bpc from
connector->max_bpc, so clients that never set the property (fbcon in
particular) keep the full range instead of ending up with 0.

With the property attached, compositors such as KWin write "max bpc"
on every atomic modeset; any in-range value is handled by the existing
format filter and bandwidth checks.

Assisted-by: LLM checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index b23efb153c9e6..8ff27353b1417 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -112,6 +112,32 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 				     "Failed to init bridge connector\n");
 	}
 
+	/*
+	 * The components are bound before drm_mode_config_reset() runs, so
+	 * the connector has no state yet, but
+	 * drm_connector_attach_max_bpc_property() requires one. Create the
+	 * connector state first, like drmm_connector_hdmi_init() does.
+	 */
+	if (connector->funcs->atomic_create_state) {
+		struct drm_connector_state *state;
+
+		state = connector->funcs->atomic_create_state(connector);
+		if (IS_ERR(state)) {
+			dw_dp_unbind(dp->base);
+			return PTR_ERR(state);
+		}
+
+		connector->state = state;
+	} else if (connector->funcs->reset) {
+		connector->funcs->reset(connector);
+	}
+
+	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
+	if (ret) {
+		dw_dp_unbind(dp->base);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


