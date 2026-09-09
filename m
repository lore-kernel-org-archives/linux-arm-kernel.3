Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44890C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLa/2IhG0uPxKott5hiW6gEdbabkA+pAUSYZZS+3kb0=; b=EJK18Cghgvs+k9rUJAfuC+aZGr
	qdJXePnmuzZXiobTTi1yB9fiNSYjPJu/X+g+RvaJmOwzwdLJNL2iGyrtL+hz9ob4J6VisnFo950Pt
	rsRXZMhd/7OHyKjN+F/zfyEvzchEOwdsWLakZbp5l+nBbPQuPLop+AQA9f1paupbEPb6tJMytfxjT
	iWKe/q3CPNKluq6Ek951qz/6TwkYNzfI7SkB+L728uUX1L9y0pgq6P1wN+4yi93cYMbInNzZn25Md
	yFabFLFI1BZpFur3Xy7YO0KXn55P6XnBSWjSykoyBi3N69VZhs2uLF09WMT3VJuCO6YZmoODcG0xY
	3C08N+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MDZ-0000000CVST-0VI2;
	Wed, 09 Sep 2026 17:36:17 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MDW-0000000CVOZ-0H3z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:36:15 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d157f691cso1653075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975372; x=1789580172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLa/2IhG0uPxKott5hiW6gEdbabkA+pAUSYZZS+3kb0=;
        b=ccLUVyDUHnsldbmCqXyAXuem6GASgMybgVxURY8teVwgs1M89HuRPUL/lXBGWxmWRv
         VuR3ORDiz935bu7X6TiiDQGUl43B1Wq11bx7soPfYO9r6gaIEA9ClQAX+MYhk1EntOOn
         355RtcZN2x9Lms2BwV+9vdi5O7YkQCWGrN64AVsY66WNPa6zXDLRulyxyvNsFNG3Ijtc
         pmaH6w+u4Px3HMfHxyV8zQ96EQ9PDlOtqZLPcvjRj83HqvUmN7jo3ITPEf4L5f49GQ9C
         hV4xtaHO/MzBkoy1jVD/y1AEQ3hSkOcqwi3JDbRcOtqNxeb4cqrPnmq+BtnTjBmp/aWo
         Q0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975372; x=1789580172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLa/2IhG0uPxKott5hiW6gEdbabkA+pAUSYZZS+3kb0=;
        b=Rw2DEfBaXLfsIqzf+SLTKUeEmu5Hzy7PWGBxQ1DH/09DW2Gxu3YgJcIjnf7XEhQlIP
         ddlvbIET1svm7LlHYThbpGakIAPEv31jglGMEBWCpTifhbbzkQCJYUayudIjS+Hk0mWy
         HE6g64QZjaHOzPtmmL2H+Wae9uoxLBVA1PeiElNMH5WWtLHZ2RzJ1hUuTuw1eU73TYYk
         SfG3AZaTnWfuvDOCw//AuNAzLFetQEIb6ArMIX6anlUWNZa7SWX6vBhtuivf0xcF7z2X
         UFSib52GktOMTi89M8MLoTM4HmqQzxZRCocG/ygyqAyAKdKRV5IBl5CCWCPSkV/zmVaH
         2lug==
X-Forwarded-Encrypted: i=1; AKwUvBxtLuB8dU3Lf0wnNGf8bibI1AVyTRjbgyUFrPCBOsgPT8JFnIgWeXQJaOJnlhFmdJ7q01FausvK+WJee4LcDmDK@lists.infradead.org
X-Gm-Message-State: AFuF++mqOLdFzaHHJkGZd/gig4Ab8OLkFwq3YE1Yxi2mPcRtp2kp9dhU
	vhSVTSGc3tp8zegEcbXFdBuVK+KA4WWj9d6du2FkRsBViLnvflGPYcKy
X-Gm-Gg: AYBFou3c3DaN9btoIsJLaQuDlIw+gjrdyxxZ/L8hTGMODNF0wEG9VCoNmUSy5QPvzs5
	7uoxEtVuhm6Y/dBfeIROQbYTBtZkrvJoFOh+h1axwpiPTSauX5z6UTZMd3Vf4pIzztuJ0JumXYo
	Eob3ugMo1RYm4hqR/49n1l8p4gveeIT2XCWwkCzb5FdvADV3gDRSThoVj9DbQ0BmV4/G/nimpDx
	IYJM6bSNktky/YYgN5bZUE1cN3T4o+9UDBrsbSZ0dlqtxP0JlbqF8T4jHNsvMZvGPiO2aHD6crt
	3rpblNno321triM+98MSEJ/FEqW6tHtfL8hFvvwCc7iWobgXDu4c9y1knjBKO6E9QdgXC5gJPCr
	yYDWpr2boE06NgPyMItXat1UZGCuWAxhjDlHMOaGpDqmWxQ5roPGpwcvy4ab+GHGt+zp8YISS33
	0ML90TeIHR4mBleolnLU9V7roMDmccwlwnyAAmvVzv06NliEWrldcmf/F9XGr8bsrdjpjUGvbSR
	t8ml8+9XCeoeipukeDMPu58r9X1w7q6xlFVrw0JIBmTT0x27UCz9AtS7oLypHl+pPfznPght7aE
	Eg==
X-Received: by 2002:a05:600c:a305:b0:49c:ff81:e062 with SMTP id 5b1f17b1804b1-49cff81e076mr237967455e9.2.1788975372348;
        Wed, 09 Sep 2026 10:36:12 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:b011:705:bf09:2680])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:36:11 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm/display: bridge-connector: Preserve max bpc across connector reset
Date: Wed,  9 Sep 2026 19:35:39 +0200
Message-ID: <20260909173542.14030-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909163206.36409-1-royalnet026@gmail.com>
References: <20260909163206.36409-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_103614_144317_B0A629CE 
X-CRM114-Status: GOOD (  20.91  )
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

drm_connector_attach_max_bpc_property() initializes max_requested_bpc
and max_bpc in the connector state, but nothing restores them when the
connector state is later thrown away and re-created:
drm_bridge_connector_create_state() returns a zeroed state for
non-HDMI bridge connectors, and drm_mode_config_reset() installs such
a fresh state on every connector that implements
&drm_connector_funcs.atomic_create_state instead of a .reset hook.

This matters because drivers can attach the property before
drm_mode_config_reset() runs. Rockchip, for example, binds its
component drivers (which create connectors and attach properties)
before calling drm_mode_config_reset(). After that reset,
max_requested_bpc is 0, so drm_atomic_connector_check() computes
max_bpc = min(info->bpc ?: 8, 0) = 0. Any driver that filters output
formats on conn_state->max_bpc then rejects every format, and clients
that never set the "max bpc" property - fbcon in particular - end up
with a black screen. meson already attaches the property on a
drm_bridge_connector before drm_mode_config_reset() and so already
boots with max_requested_bpc = 0 today. dw-hdmi's format negotiation
does consume the value there, but meson attaches the property with a
maximum of 8 and the 8-bit fallback formats are not gated on it, so
negotiation yields the same result for 0 and 8 - the change is a
no-op for meson.

HDMI bridge connectors are immune: drm_bridge_connector_create_state()
calls __drm_atomic_helper_connector_hdmi_state_init(), which
initializes both fields from connector->max_bpc. amdgpu likewise
re-initializes max_requested_bpc in its own .reset implementation.
Non-HDMI bridge connectors have no equivalent.

Mirror the HDMI helper on the non-HDMI path: record the upper attach
limit in connector->max_bpc (drmm_connector_hdmi_init() already stores
the same value there) and restore max_requested_bpc and max_bpc from
it in drm_bridge_connector_create_state() whenever the "max bpc"
property is attached. Connectors without the property behave exactly
as before.

Assisted-by: LLM checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 +++++-
 drivers/gpu/drm/drm_connector.c                | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 00feb73e63d7f..6197fb80f7cc2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -279,9 +279,13 @@ drm_bridge_connector_create_state(struct drm_connector *connector)
 	if (IS_ERR(conn_state))
 		return conn_state;
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
 		__drm_atomic_helper_connector_hdmi_state_init(connector,
 							      conn_state);
+	} else if (connector->max_bpc_property) {
+		conn_state->max_requested_bpc = connector->max_bpc;
+		conn_state->max_bpc = connector->max_bpc;
+	}
 
 	return conn_state;
 }
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3a..0400a6a92e2b7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2866,6 +2866,10 @@ EXPORT_SYMBOL(drm_connector_set_link_status_property);
  * @max: The maximum bit depth supported by the connector.
  *
  * This is used to add support for limiting the bit depth on a connector.
+ * @max is also recorded in &drm_connector.max_bpc, so that
+ * &drm_connector_funcs.atomic_create_state and &drm_connector_funcs.reset
+ * implementations can restore the property default when re-creating the
+ * connector state.
  *
  * Returns:
  * Zero on success, negative errno on failure.
@@ -2888,6 +2892,7 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 	drm_object_attach_property(&connector->base, prop, max);
 	connector->state->max_requested_bpc = max;
 	connector->state->max_bpc = max;
+	connector->max_bpc = max;
 
 	return 0;
 }
-- 
2.43.0


