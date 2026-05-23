Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0918CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xfpcy5Pc7GXDdgpxKAx9vJpVILZgmDMu0yUlgXlNu5c=; b=dSbw0td+S00vjawwsv9yeuocoz
	mCyX+baO5DGhJ/T2o0oISU1sumQv4SfTHxsRhyE5LYJvYtHAyARpse3Wv3Lp7hUFngJpHvzbE3rtD
	TegUAo9NN71HSWKfPAV4VOuoVAioE3u+pSzilhtVY1bc6fa6Y5DcJg8TuC3nI46Vc6+kgvlqQ7BGP
	9CH1lKHPcyBwDeLiNrubAvOnccgMP3aWLifBQ4p64L4YrBYy3GO2RoB5D26atpMEwySqXnD/ufNYy
	XSCACrq5m7Bgm8KBKdQ8tRO+3cySjnsgM6wj55AreNYzxIxK4M1iJA/4Q49Osl61ceFPDHOEnWHZI
	ch7Dqwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQsLV-0000000DsDQ-37ly;
	Sat, 23 May 2026 19:49:17 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQsLQ-0000000Ds8j-2G2i;
	Sat, 23 May 2026 19:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779565718; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iS1XKWee5Q8UjkjGM+ZWQhLMA23nQNlWAlo+em12zPo/HyC5MA4o77xTUh/y1Dn6fe/MmP6p1n/comOCvE8LOjqRqWvHc+BwthkOrRwl7kVI8GPs+VcnvoM12ti40hlp9xn0MMXkqoaWRfJRISLHg0bl8D3eo97ZYkYEgFs/xFw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779565718; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xfpcy5Pc7GXDdgpxKAx9vJpVILZgmDMu0yUlgXlNu5c=; 
	b=Z3vkRD2rYqMy+j6d0KsZs3SqJJhtEjRECuULzNIO+knjRrob0hX5JUytBbKKPT6yh774besYSQouN9keSpJW4YSI0CTStug5A7hkr4al3PED6ZIz69u4PcbA9GpE7yIJvNLt1jwmKl0ZeW3nBIajCTYKk9BrRq921zPx9SAAfOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779565718;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Xfpcy5Pc7GXDdgpxKAx9vJpVILZgmDMu0yUlgXlNu5c=;
	b=JrEbsDdz8qXxpwr7rSVFTFDX8VcwRuc7quGh4jGcc3++ipvzmNhYFq2XUcmLCmiM
	QaGGO7DfYRnCQJ+QZdrbPyzbJxS5U0YgyY12m+HO7AAv8DMUlyl8RPSX7Cg8BMnGSu6
	UzdI7ElDxr9rnNZn301DVhB8Sy9mXUB4m75cK5Uk=
Received: by mx.zohomail.com with SMTPS id 1779565715787918.2798085690775;
	Sat, 23 May 2026 12:48:35 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 23 May 2026 21:44:02 +0200
Subject: [PATCH v16 27/28] drm/bridge: Document bridge chain format
 selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-color-format-v16-27-24340c5e4732@collabora.com>
References: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
In-Reply-To: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_124912_643834_788F3582 
X-CRM114-Status: GOOD (  18.06  )
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

The bridge chain format selection behaviour was, until now,
undocumented. With the addition of the "color format" DRM property, it's
not sufficiently complex enough that documentation is warranted,
especially for driver authors trying to do the right thing.

Add a high-level overview of how the process is supposed to work, and
mention what the display driver is supposed to do if it wants to make
use of this functionality.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/gpu/drm-kms-helpers.rst |  6 ++++++
 drivers/gpu/drm/drm_bridge.c          | 40 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 80453dda33b8..94cfc26acecc 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -171,6 +171,12 @@ Bridge Operations
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: bridge operations
 
+Bridge Chain Format Selection
+-----------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: bridge chain format selection
+
 Bridge Connector Helper
 -----------------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 6ec8c23b36b5..5cb170328850 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -198,6 +198,46 @@
  * driver.
  */
 
+/**
+ * DOC: bridge chain format selection
+ *
+ * A bridge chain, from display output processor to connector, may contain
+ * bridges capable of converting between bus formats on their inputs, and
+ * output formats on their outputs. For example, a bridge may be able to convert
+ * from RGB to YCbCr 4:4:4, and pass through YCbCr 4:2:0 as-is, but not convert
+ * from RGB to YCbCr 4:2:0. This means not all input formats map to all output
+ * formats.
+ *
+ * Further adding to this, a desired output color format, as specified with the
+ * "color format" DRM property, might not correspond 1:1 to what the display
+ * driver should set at its output. The bridge chain it feeds into may only be
+ * able to reach the desired output format, if a conversion from a different
+ * starting format is performed.
+ *
+ * To deal with this complexity, the recursive bridge chain bus format selection
+ * logic starts with the last bridge in the chain, usually the connector, and
+ * then recursively walks the chain of bridges backwards to the first bridge,
+ * trying to find a path.
+ *
+ * For a display driver to work in such a scenario, it should read the first
+ * bridge's bridge state to figure out which bus format the chain resolved to.
+ * If the first bridge's input format resolved to %MEDIA_BUS_FMT_FIXED, then its
+ * output format should be used.
+ *
+ * Special handling is done for HDMI as it relates to format selection. Instead
+ * of directly using the "color format" DRM property for bridge chains that end
+ * in HDMI bridges, the bridge chain format selection logic will trust the logic
+ * that set the HDMI output format. For the common HDMI state helper
+ * functionality, this means that %DRM_CONNECTOR_COLOR_FORMAT_AUTO will allow
+ * fallbacks to YCBCr 4:2:0 if the bandwidth requirements would otherwise be too
+ * high but the mode and connector allow it.
+ *
+ * For bridge chains that do not end in an HDMI bridge,
+ * %DRM_CONNECTOR_COLOR_FORMAT_AUTO will be satisfied with the first output
+ * format on the last bridge for which it can find a path back to the first
+ * bridge.
+ */
+
 /* Protect bridge_list and bridge_lingering_list */
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);

-- 
2.54.0


