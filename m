Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624F5CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLXsRk5n6kDSbBXqAg0ZgpidZO8HnPrxM/c4jPhcHYA=; b=Adq4C6uY28402CJp3GkYKvxtLO
	A/dd9CEjLYZLkmqsXEa+ZY8ce13e6rMpJkp5WoprXifYMMgkT/jJ/u5522vaegy4DhX37Cp07cBeB
	ADQ+gqwH4ICfo7Gg4DgZL95yz3arrpyltbtI5J4GX7R7KUlKovUexbbYb8f6mAtCsj4XJQ60cLUwB
	LJcTR6AiwnH0RFcHnu+Eo7XZQUdY33ApZJ5l7Mx7zbOwfXOXDg196u5HVGL60PzxykIgl8/dqps15
	HBjpCyLMO9A7fNXoPo0N2jN/KvIEIgiCNx3tIMxVnB7OZXzpoIs83naiimxOLjyrZDWHPqFzNCosK
	HNeQrB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQsJX-0000000DqHg-0kyz;
	Sat, 23 May 2026 19:47:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQsJL-0000000Dq8y-2qXb;
	Sat, 23 May 2026 19:47:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779565586; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g5eslkFU6W8Q8XdvE/G7bw+AWYwNR0cLnvO8aqaJxMFAA6hgZ5oiiDeLWT6C5sgCtSAK53EXKubaoDMvWohRE3uas4x71NaH48f110FwFy9PxL1UHmFXk2cZl3JSfbBBmVNX6r70KBcu04IZVE/4v7MClIDiF+0OaI+JZs1xOJQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779565586; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oLXsRk5n6kDSbBXqAg0ZgpidZO8HnPrxM/c4jPhcHYA=; 
	b=PPCNhAPMKDvP7I04TsbiBbcsIntiYCQiqwgTYrzPuniVlXCIUvOqU3xnE4ehLa5LNs5zhFp15R0ubu8wdQwkkYhu/60J68rXnRAIGNXvB1z4PWa+cZ72F5VaTPwfbeeounL42KCzszKYQ/qk+whBnG1BnQLo/+xrUCTlsUcnp/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779565586;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=oLXsRk5n6kDSbBXqAg0ZgpidZO8HnPrxM/c4jPhcHYA=;
	b=iNi8yvReRR1hsM0PZYOxJ6lr7uXgV6P+XpxpYxKLhO+lSKmyArO6OnxGxFASJ2kH
	WSkVf9yJyoxBYqVCVpJ5Ot66wpF+c+ThGSu2T4OIbrpwLBQPSs+/jK3vjmaKOcHcgPq
	4KRD7TG8iP416elVeZ+z0i33IwVJUPdko+Z6xrWo=
Received: by mx.zohomail.com with SMTPS id 1779565584064562.6777512097248;
	Sat, 23 May 2026 12:46:24 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 23 May 2026 21:43:47 +0200
Subject: [PATCH v16 12/28] drm/i915/dp: Add YCBCR444 handling for sink
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-color-format-v16-12-24340c5e4732@collabora.com>
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
X-CRM114-CacheID: sfid-20260523_124703_775736_A3963EE8 
X-CRM114-Status: GOOD (  10.21  )
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

In anticipation of userspace being able to explicitly select supported
sink formats, add handling of the YCBCR444 sink format. The AUTO path
does not choose this format, but with explicit format selection added to
the driver, it becomes a possibility.

Check for both source and sink support of YCBCR444 in
intel_dp_sink_format_valid.

Acked-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1920d2f02666..380933579178 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1344,6 +1344,16 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 					 8, sink_format, true);
 }
 
+static bool
+intel_dp_can_ycbcr444(struct intel_dp *intel_dp)
+{
+	if (source_can_output(intel_dp, INTEL_OUTPUT_FORMAT_YCBCR444) &&
+	    !drm_dp_is_branch(intel_dp->dpcd))
+		return true;
+
+	return false;
+}
+
 static enum drm_mode_status
 intel_dp_sink_format_valid(struct intel_connector *connector,
 			   const struct drm_display_mode *mode,
@@ -1362,6 +1372,16 @@ intel_dp_sink_format_valid(struct intel_connector *connector,
 		    !drm_mode_is_420(info, mode))
 			return MODE_NO_420;
 
+		return MODE_OK;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		if (intel_dp->dfp.min_tmds_clock &&
+		    !intel_dp_has_hdmi_sink(intel_dp))
+			return MODE_BAD;
+		if (!intel_dp_can_ycbcr444(intel_dp))
+			return MODE_BAD;
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
+			return MODE_BAD;
+
 		return MODE_OK;
 	case INTEL_OUTPUT_FORMAT_RGB:
 		return MODE_OK;

-- 
2.54.0


