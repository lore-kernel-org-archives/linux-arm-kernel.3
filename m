Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gll/9fA8Jon07mOpIIFXW4zhgEZAjyVUTEJee2eFAao=; b=ZKQqYmnCw0rfXnQE21nvq8biTn
	iWAdCVLJUzkv+ielJKF8jYtx+olPSI72STuCG1iUkuOowMT/taEuwSZvAVSrCJn8IMeEFai9N90Vp
	G7amRL+0ESHATUCledwLyeoHQb0O5pLDqmYUKTcW22XD3FXVMCWfs6CsOZa6Sn827xpTdZ0md0Khi
	pcZ3ZbV4TG9NzPdhg9AC1M3JY29750MDZw8JYrvbb5c7keSxl7We3kDSi6hH2NKexNHtWbhL1qDBU
	gIsv0qLId3o8xB4p6wrhBN5NXl4vCoLwFlYVA6JJj7OVdlYHlpS38mGYWlRZe2uq6w1cPZt0E95N9
	B/w2wBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgj-00000004epO-0IFC;
	Thu, 02 Jul 2026 14:46:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgb-00000004eYT-0fJT;
	Thu, 02 Jul 2026 14:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783003597;
	bh=4PyW8Jhg7IiTzgbSHOrnUha3BzbvIJ2MbhHineOQU4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HxfkMS7W8sBiV7T3rZB+k1FFRe/+kbErsAmzNf5jw8yypsDHIkmI9BXjg34DCh2mF
	 crYZeqX8OzHL/ok/SRBwmC8Fr0cIhtX0GD9nubv0doTB3y0juDtZp683jIaUxoGhno
	 tvJkvAnCZel4NhH7ITXnoiBene/Pk1FcVSfH5rIuJBBpyj2AHglUbQEcD1RvC6Rubi
	 jinKib9tuZ0GQoHAp1dm8PeRNpNUEESlWaDierF7FaML++WI9BZhlWlnrXMWSPQMTS
	 MZh6sHwSSfRDRwpZcIrCoMRAedVHBPosiV5w1McNVW6mPu3CevbjV1lhFKcp4kWHdZ
	 cKPJAFxO6QafA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7555217E0852;
	Thu,  2 Jul 2026 16:46:37 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 02 Jul 2026 17:46:21 +0300
Subject: [PATCH v8 08/39] drm/display: hdmi: Advertise SCDC source version
 when scrambling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dw-hdmi-qp-scramb-v8-8-d79890d00b6a@collabora.com>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074642_054739_71BE77E1 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

The HDMI 2.0 spec advises that compliant Source devices report their
SCDC version in the Source Version register.  Do so when enabling
scrambling by calling drm_scdc_set_source_version().

Failures are non-fatal: SCDC version negotiation is purely informational
and does not gate scrambling or any high-bitrate functionality, so a
flaky DDC bus should not block scrambling setup.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 7c96cccf683d..b8ed2a1e47f5 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -16,6 +16,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_property.h>
 
+#define DRM_HDMI_SCDC_SOURCE_VERSION	1
 #define DRM_HDMI_SCDC_POLL_DELAY_MS	1000
 
 static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
@@ -531,6 +532,12 @@ int drm_connector_hdmi_enable_scrambling(struct drm_connector *connector,
 		return -EINVAL;
 	}
 
+	/*
+	 * Advertise our SCDC source version. This is purely informational and
+	 * does not gate scrambling, so failures are non-fatal.
+	 */
+	drm_scdc_set_source_version(connector, DRM_HDMI_SCDC_SOURCE_VERSION);
+
 	drm_dbg_kms(dev, "Enabling scrambling\n");
 
 	hdmi->scdc_cb = drm_scdc_monitor_scrambler;

-- 
2.54.0


