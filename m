Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4366C5AD4D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g22IUbt8ZLLCFwaMoIL3xYIHr/pNgXlbdNwWp0/GjnE=; b=T6K/H2jdFkswCKFrVVmJ3UJUfQ
	gHVDlUQHke2tnj9dUi5XQ34d9wWFV3lzZ1T2Qq6RLSYTkUWz8a2n2dj8makZKTmdvnSdoWVM+NtSD
	S2U4zVgD0/W4+krKPil3IkIwix5itkUHfNA8CBBjx65YEsCBBxJMu92WNvgNS/Wk5TOpNQMDCXZXE
	IRafLsIKkT2e4rFfEs6brhbzLoy48BTwO0yrv1GQF0phs/1lbc7zRs11ytwbKLPA85dxH5B02pyn9
	EJG2JxpZ4oOf6A4rgO0EGQ8jXFSg2b8MbZ/713TcZTnfhFfw9Nbp0vmmP2Oe9SOh61knl7yPvrCwj
	YRK2U3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdow-00000009F2T-0mc4;
	Sat, 08 Aug 2026 09:58:26 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdos-00000009Eyu-42Gi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:58:24 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4765eec32e1so21607f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786183101; x=1786787901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g22IUbt8ZLLCFwaMoIL3xYIHr/pNgXlbdNwWp0/GjnE=;
        b=T9aEtzZaXgyy9fmcHYeaDVK3SfN8PiM/FhtflOlkLaZzpYe337VmqmQ1AmL0ACsjn2
         Epb+mnn+s4nr/dxWpEE9n4SuW5TDZPL1SCIUirj7FngGqXIurOyStgrSoNlnFH/kVDED
         vOF4DHppNYqd/SD9s3/6iPmINN/MQsh0wkJCIX2iDv5o0YyZQNDOxogfbpiePWQQi8RH
         tjtP3Vb5nlz5nNEYUidwdfAylcqdV6przuotsOsvpNb6MgLAjBw7wAiQ+edP5oe+ZBSO
         5KT7Wo63OHdx2l7Eif1Mcon+oMZQg/Wig8OqnCEB1MCrnWsJyBCHJYHLc6yU2Lq4rtb9
         kFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786183101; x=1786787901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g22IUbt8ZLLCFwaMoIL3xYIHr/pNgXlbdNwWp0/GjnE=;
        b=aAy+4FWHfbWfmZXVV0nO3d6nGnNt5LKOvXUK6NRqsQ1xOETgwLKFnTMkCRVlcZ9UQD
         2GGPHsEtx0drbY6TKE0ytgyT2YabibvYtzIAvLxvm2D8FXWlDEzi2ayK/1cBYNJEMxNV
         ql9VZjeWIa2Bmi+Y7N6ls9to4MWIi4ef/r8CKGo/dpXwJtqMn7OeanCFbfoCFRoLrtFL
         JN0Oi11/bDLjpMaKS8XBAq+hO4N6Zu96cWTLjNua2hh/h5TV3nZ7yQ4ra8rIKngSr1en
         ZcrEm8GTWre8fw7GapAFIdcgFocvTau2KSbexAgw2co7/9y2d98NfKlnlsmqJ0ehJ+Md
         GSfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqK/bBEn7Ozhdk7DQ9kNtvc6eXpX/VZAT7U+njBAz2dB7gBQ5faDs3nZ8wOuuk1hg+6tFG9pOOubdvZcpajBS+z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2CEd/vYrqT4cE7I8055hAbNtEpebXc/ZQOuculavLpGz6oryc
	t9aLeyDSrgmIgiakzo9UoXhz+JrS4nXglwVbjCnuUQGKh5JmxHJf59j2
X-Gm-Gg: AR+sD123Cyim0nQTvB2wyutcFP7rDpNZLX/bvVgYfJBEZ6mvquX+z86xJYHVNRsTkDc
	P/7eb0Zt9JRyE1NkrayeNufxoqGVILi/sc/kkdyAllikyKz8JF6wxkyuOiTbeZ6ZBScr3QPtZkF
	4nQJ9pel8HUKRXxg9zOEx0maXP35d/ps4XOL1lwjjSiwcp22T+Dp3ILlvb+TABOT7SW2RCAS4Vz
	lEXX6DcSMVML9YRQSpAp+js3bjMw/miEyFsS+Nymdj5utJkbgpQeWZHyxSL3zvdRyeO9QU9lKQp
	rQZHzOq/UojFITJYAEC2z69DYzaBZnSb0ZxBndk3qnhH2+oeMnHg4WNYfw7tkew4bMKJyRkhe00
	kWR+mH608BAOSUbZ0LUyConGxfISeZNcz0HJ66EVeRtlVWJ0A+WWtkUFdqKg4M1Rzmwf1YdEeCv
	/MCOyA1WEi6Ov7gxT80ldIxTC7BJKDMgHRj7GNfdz2MN8AaLUQO1MXXqSlDsc1b+1aETS8gpPoD
	LrJp9tGPohLhKM1LrKi0hfz/5G7JGeCSlP3GRRjcs0RxFZfVbNtFS3OslHdFr3hDQ5Eyw==
X-Received: by 2002:a05:600c:4514:b0:493:f42e:1b3f with SMTP id 5b1f17b1804b1-4994e7c7360mr190359775e9.3.1786183101054;
        Sat, 08 Aug 2026 02:58:21 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480020be8f3sm13255725f8f.0.2026.08.08.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:58:20 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
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
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 2/5] drm/display: bridge-connector: Preserve max bpc across connector reset
Date: Sat,  8 Aug 2026 11:57:21 +0200
Message-ID: <20260808095749.9428-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260808095749.9428-1-royalnet026@gmail.com>
References: <20260808095749.9428-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_025823_046643_59DA105D 
X-CRM114-Status: GOOD (  20.27  )
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

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 +++++-
 drivers/gpu/drm/drm_connector.c                | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 632cc3ae3b54..d33c4fc42fbf 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -282,9 +282,13 @@ drm_bridge_connector_create_state(struct drm_connector *connector)
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
index 8b4baed060f3..0400a6a92e2b 100644
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


