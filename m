Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D907AC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7klLKTxAqVvbufalhg35HG2HNYZ1gcqMNTnMqVx0mHY=; b=B4O4fwt7zsSjayRNue4FTgfzMt
	y20RpEdBLNe742huk2sNA0rllhzk3TtppXzd1jhV2d9V3ZssPumW8svu/4McC3owFBy5VZ1GiV6iv
	3xkD+hL5q3JwefnhsVu8L8pmgC5U8T+1pamGRgXHgV9Ti3cxzl8qB+ehaJkzr5O2mf0yX9ByTJTvl
	ENdIiZ5kmRnnirmD0JX6YLEgUiewJC7pNsOd1eP4EYoXCYWTBEgbcJ+kQbwIx5Phuhb1kSD0/khHu
	xznejOi8A3DBKMlio9YwmkHzSFfVPhDmcbZbLesdT9UNOOq1TQdtpb5nwk4MJkChs00Vs8j1sknhY
	VOXkTQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLc-00000002iiu-2uOD;
	Mon, 21 Sep 2026 15:54:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLL-00000002iGR-1UXX;
	Mon, 21 Sep 2026 15:54:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790006013; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mhxCIXPZ/+yEWUs1KgkZV/vPnjfe7MnmXqHd3FK9x+cOipio3AmrlBcvB623LhMN5Ee+IioCcYq+8mOPzQ9uJrJxg24Yv/otVDnPAZ4SIr6IRAtzue/HL4ZEjq4+xSylwUzGnCHVDuF2IXXtC/jqcye6GYmFbW0pacWgmjHQIzg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790006013; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7klLKTxAqVvbufalhg35HG2HNYZ1gcqMNTnMqVx0mHY=; 
	b=NW3OjKIFNJPYSqRYjjDTpZIeT4IE4hY60OuBMDKc3ZHjU388vwZtknP7N4QwyaAmGYIAnaXxsh/3bXoVMclnGIETLsYEdXNXaAorN229eE+fgiZoxGBvZBJQ06L1Xh5GlY2Ge/E3eAQE6OjjFt0xt4BCunbTbgmWSdLux3Mowsw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790006013;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=7klLKTxAqVvbufalhg35HG2HNYZ1gcqMNTnMqVx0mHY=;
	b=asM16ueiap+8yleJX486m23IDB91JBay041dbXpcDeJ/7nc2/i3hj+SS107jzWyW
	keL71rS8GRFqp6ndLhaG4cifBJggDHseN1xiG7ezsg2trvX7WdLrDD7pMBxZPIofX0S
	/9wl8xIW2JWWkEO1cqISCDU+sEzA8hosb7wWDlzw=
Received: by smtp.zohomail.com with SMTPS id 1790006011932527.0501784463283;
	Mon, 21 Sep 2026 08:53:31 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 21 Sep 2026 17:51:42 +0200
Subject: [PATCH RFC 16/25] drm/edid: Parse QMS TFR min/max flags from HDMI
 SCDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vrr-limiter-uapi-v1-16-2fcd7d011646@collabora.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
In-Reply-To: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Derek Foreman <derek.foreman@collabora.com>, 
 wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_085411_460144_3BA78B0F 
X-CRM114-Status: GOOD (  12.72  )
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

HDMI has two flags in the SCDS EDID extension that signal which minimum
and maximum refresh rate the sink wishes to use when doing QMS ("Quick
Media Switching").

How to parse these flags, and what they do, has been learned from the
publicly available libdisplay-info source code.

Add the definitions of where in the byte they are, the code for checking
for them, as well as two new booleans in drm_hdmi_info to store the
result.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_edid.c  |  6 ++++++
 include/drm/drm_connector.h | 12 ++++++++++++
 include/drm/drm_edid.h      |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5a7d3b7e65da..4fe754328b1c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6332,6 +6332,12 @@ static void drm_parse_vrr_info(struct drm_display_info *info, const u8 *hf_scds)
 	if (!range->max_vfreq)
 		range->max_vfreq = (FIELD_GET(DRM_EDID_VRR_MAX_UPPER_MASK, hf_scds[9]) << 8) |
 				    hf_scds[10];
+
+	if (pld_len < 12)
+		return;
+
+	info->hdmi.qms_tfr_min = !!(hf_scds[11] & DRM_EDID_QMS_TFR_MIN);
+	info->hdmi.qms_tfr_max = !!(hf_scds[11] & DRM_EDID_QMS_TFR_MAX);
 }
 
 /* Sink Capability Data Structure */
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c97cf0625fda..8439c82db905 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -389,6 +389,18 @@ struct drm_hdmi_info {
 
 	/** @qms_capable: The sink supports Quick Media Switching */
 	bool qms_capable;
+
+	/**
+	 * @qms_tfr_min: If set, the sink uses 24/1.001Hz as its minimum rate
+	 * for QMS. If unset, @drm_display_info.monitor_range.min_vfreq is used.
+	 */
+	bool qms_tfr_min;
+
+	/**
+	 * @qms_tfr_max: If set, @drm_display_info.monitor_range.max_vfreq is
+	 * used by the sink as its maximum rate for QMS. If unset, 60Hz is used.
+	 */
+	bool qms_tfr_max;
 };
 
 /**
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index f1e2052cb08b..d339acd9ee52 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -269,6 +269,8 @@ struct detailed_timing {
 #define DRM_EDID_VRR_MAX_UPPER_MASK		0xc0
 #define DRM_EDID_VRR_MAX_LOWER_MASK		0xff
 #define DRM_EDID_VRR_MIN_MASK			0x3f
+#define DRM_EDID_QMS_TFR_MIN			(1 << 4)
+#define DRM_EDID_QMS_TFR_MAX			(1 << 5)
 
 /* DSC specific */
 #define DRM_EDID_DSC_10BPC			(1 << 0)

-- 
2.55.0


