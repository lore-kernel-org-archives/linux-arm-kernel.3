Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1153EF54AD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5k1vlW62iXZjcOaFsSXyeVWlBMQFrsYlNjKb9M5MyLE=; b=PIqHv3VO1FYsqpFyKKg2Qu44C7
	qI5Bc0q9kB2rH/vJZDw32Y4GmaCCo+9pvVO0KvI/4LwqIeARBB9z6L6a1gDd2Ei3pd+F8mUVtA/h2
	7c+ZO807dgh5NXDhg7fLnBhHfUtFZQiJV3xstuTrqgxFd4j1/fMOElv574p1ZSqhgAFnre5azZmY7
	dPWQ+x8P4kxO3CrK1pExdNAoR/XcCJvAp1wMJVXN5ILgvu6pYR/jv1l4GYND+mezqJsQ0tcWgZJBc
	+MAhBp1Lh9u0hnttm9ZC4miThFjyygdaqS7MrleFcvdx5u5KxgweM/s7TiOw0yC2XZJZ99KO4YNhQ
	7WQrYoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Dv-00000001oVI-0oOs;
	Tue, 24 Mar 2026 16:03:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54DZ-00000001oE8-0yvF;
	Tue, 24 Mar 2026 16:03:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774368143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ULwMc1qvTpJgSSr0S+a5PhrfwumwGIMgOFrS9nANwoWWAosujeSbZuIU4j8N/BtL1AWE6N1oDqSNlQOkp4LWQT09HHpN1rzlcfXgYxBxBUpvEuAZS0GMFf4HxZS/OYeD2Wfyn0xPM4uF/C2UMwMSiuy+umAvS4zsZl0JAvs49Q0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774368143; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5k1vlW62iXZjcOaFsSXyeVWlBMQFrsYlNjKb9M5MyLE=; 
	b=j4IGUtuaHLT2/QGQ5qg7nB0hDGroR24s1LvBc6dJmdbhwyRZ9y3W84r6BlZETHaG/rVlUGhJqirkbMLIoMtQ8qr9z1PShZfjz8u4NvPE9UeDSYvltBGFtuht6kNv4mcvKVZxSKnM9mIcDElwrFatX4hYVumRTP0t5rAgsyg1Nwk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774368143;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5k1vlW62iXZjcOaFsSXyeVWlBMQFrsYlNjKb9M5MyLE=;
	b=iFcmT95EtQuXsRWxW5OkYScEnDDy+RRiIDlElkZBff2JA9DJHcFPg0h/7jwFQlCD
	Fs63HY+Z5JTM5qIQ+zrIwzTtu6MMyx87phFWtR+7PlVtUDfnMDN8ZKulO9z62GheW+/
	oe+Gu7x8Y4Plnux6pdmBIWJ6fBJY5ubNDs3IK6xY=
Received: by mx.zohomail.com with SMTPS id 1774368142936738.7591218826009;
	Tue, 24 Mar 2026 09:02:22 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 24 Mar 2026 17:01:10 +0100
Subject: [PATCH v11 06/22] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-color-format-v11-6-605559af4fb4@collabora.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
In-Reply-To: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_090257_341862_4209A8BE 
X-CRM114-Status: GOOD (  12.22  )
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

With the introduction of the "color format" DRM property, which allows
userspace to request a specific color format, the HDMI state helper
should implement this.

Implement it by translating the requested drm_connector_color_format to
a drm_output_color_format enum value as per the logic HDMI should use
for this: Auto is translated to RGB, and a fallback to YUV420 is only
performed if the original color format was auto.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a0d88701d236..954f8b2973fc 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -670,8 +670,39 @@ hdmi_compute_config(const struct drm_connector *connector,
 	unsigned int max_bpc = clamp_t(unsigned int,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
+	enum drm_output_color_format fmt;
 	int ret;
 
+	if (conn_state->color_format != DRM_CONNECTOR_COLOR_FORMAT_AUTO) {
+		switch (conn_state->color_format) {
+		case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
+			drm_warn(connector->dev, "AUTO format in non-AUTO path.\n");
+			fallthrough;
+		case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
+			fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
+			break;
+		case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
+			fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR444;
+			break;
+		case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
+			fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR422;
+			break;
+		case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
+			fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+			break;
+		default:
+			drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\n",
+				conn_state->color_format);
+			return -EINVAL;
+		}
+
+		return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
+	}
+
+	/*
+	 * For %DRM_CONNECTOR_COLOR_FORMAT_AUTO, try RGB first, and fall back
+	 * to the less bandwidth-intensive YCBCR420 if RGB fails.
+	 */
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
 				      DRM_OUTPUT_COLOR_FORMAT_RGB444);
 	if (ret) {

-- 
2.53.0


