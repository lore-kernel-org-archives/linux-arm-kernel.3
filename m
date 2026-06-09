Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D198CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tUUIKSX5o9lLF0adoAh7xXUMEysvTPjeMUVVMFRltE=; b=eXGWv5hDjXQOxkvoOUKiq+GE4G
	lc3U+uks9yrYvQRYJFHpo8WU59H/ihONVE2jHt2gmdS8XLEnCBa1S59aETXnyVK489JqqaXtTdGxs
	fUo6vXfYJ7ApKqj5QHUT46QviRrmhKu/fBchNagw40lVkqrJjiylUUWQO4PO/8gFbhoYmJD6GTNo3
	6ZBp93g6yrAon0vgNA4GtKu22IxU4+NIkREDvsMbeWaXw4+8aO17Aee6+00mT1sj4YinUTcDkHCq9
	KsVfcMz+yhXfM2vwJrRrzkkkZCoOXXLQ3RBThxOEecw3BPnri1ah8TikiTBf/QsVPmQi4LcpF3gT8
	xyw2NuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvpo-00000005XRJ-2Svv;
	Tue, 09 Jun 2026 12:45:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvph-00000005XLU-1Mes;
	Tue, 09 Jun 2026 12:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1781009095; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dGZSnWXWLh9tgkiDl1lrAnlQ+tFAq9MqdKQM0xqEmACdyFVX3xC2Cx1vuSh6bVMkRlxXuYlp4eo14LazAc8REfVqwc6xFEEKWXvG7VPCgkTq3n+oLni2ibORZ+PXCgcctP5mZ7yFedUmjwNVEKgmwJFfMedF5MTyTYBqTf89b98=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781009095; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4tUUIKSX5o9lLF0adoAh7xXUMEysvTPjeMUVVMFRltE=; 
	b=ZjW3yURe8mC6j4aN2kbK9Jv7RyMhvGep7ZJXa2LSBQif0ls0hCNA9miiFfLPSG/JHsz7pA069lkqn0cD1CSpdBvYTB4dtZCxYFOloU/HstKaPOMX15O+Sr02wK3pXRgtABhDlZNVKJRwQ0oHKs33M/V+PFuOqNu2V3Ncj1vKS5E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781009095;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4tUUIKSX5o9lLF0adoAh7xXUMEysvTPjeMUVVMFRltE=;
	b=j83cIzocQJTT6ZjBFa378Q3xqDoSBcRyUn4A19p7sSIOMMkDRBhKLm0Tkzq/27BY
	RYh79jXdzlm2m0t8ZOwyEhdioJg+8I5AgZ47bP72TSEIBIAC92IUFqWtficdAK7bC+y
	3AAEs3BRDd1BvmFjsfm+KMmg7InYPbEX0OAB3UTM=
Received: by mx.zohomail.com with SMTPS id 1781009094272636.6716829060467;
	Tue, 9 Jun 2026 05:44:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 09 Jun 2026 14:43:51 +0200
Subject: [PATCH v17 04/28] drm/connector: Let connectors have a say in
 their color format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-color-format-v17-4-35739b5782cc@collabora.com>
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
In-Reply-To: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_054529_524756_F6B20BB9 
X-CRM114-Status: GOOD (  13.91  )
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

Add a function to get the connector color format from a connector state,
and a new function pointer in drm_connector_funcs to allow connectors to
override what connector color format it returns.

This is useful for the bridge chain recursive bus format selection code,
which does not wish to implement connector implementation specific
checks like whether it involves HDMI.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 16 ++++++++++++++++
 include/drm/drm_connector.h     | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 296195087a4c..95c65ed18709 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3694,6 +3694,22 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 }
 EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
 
+/**
+ * drm_connector_get_color_format - Return connector color format of @conn_state
+ * @conn_state: pointer to the &struct drm_connector_state to go check
+ *
+ */
+enum drm_connector_color_format
+drm_connector_get_color_format(const struct drm_connector_state *conn_state)
+{
+	struct drm_connector *connector = conn_state->connector;
+
+	if (connector->funcs->color_format)
+		return connector->funcs->color_format(conn_state);
+
+	return conn_state->color_format;
+}
+EXPORT_SYMBOL(drm_connector_get_color_format);
 
 /**
  * DOC: Tile group
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e1f6072ce7c9..4317166562cf 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1803,6 +1803,16 @@ struct drm_connector_funcs {
 	 * Allows connectors to create connector-specific debugfs files.
 	 */
 	void (*debugfs_init)(struct drm_connector *connector, struct dentry *root);
+
+	/**
+	 * @color_format:
+	 *
+	 * Allows connectors to return a connector color format other than
+	 * @conn_state.color_format for purposes of e.g. display protocol
+	 * specific helper logic having already mapped it to an output format.
+	 */
+	enum drm_connector_color_format (*color_format)(
+		const struct drm_connector_state *conn_state);
 };
 
 /**
@@ -2619,6 +2629,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 				     enum drm_connector_status status);
+enum drm_connector_color_format
+drm_connector_get_color_format(const struct drm_connector_state *conn_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.54.0


