Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81436C531C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41XaKI1cvbopxwzcgRPfC2FRyY1AIsMkwj+d58p+QxE=; b=vCOvamZc94YF4X5H5VmjRb/VQF
	+PL9wnb0MVzbPj8bDRaGOiZw1lh4v8nllDLFCrTl7BigKuVc2SDfivVFfGnwQjxNpEncN7Anv0cFg
	2vHVvB3ePuppZpFKWfVE0yGRQ6SH8OCk2RahJOyLE2UtmA6nu/jjbOTMOpX19BTx41ZCzOArXcIZb
	D6CAO+i7z0FAKcahF6ZlkiNrbYLXC2q7G1gmA1WJbWya2rCNvBIg9impw0HJbJGH82mnUe7wd9T10
	UuQmlzN89PJ7j66dRcDC1BFFZ4WkafC3E8g85jcKkHE+QN46HRLeYQi6se0HgDOYcIGsG8cx7bSPg
	m4eAKHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLZ-0000000D3OS-32YF;
	Thu, 23 Jul 2026 01:35:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiL7-0000000D2ps-1HCa;
	Thu, 23 Jul 2026 01:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770507;
	bh=0rSQogVSzC2wSRm6htlju5pAlCG/gNZfDiDKYD5uyWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HJBbHUe8p8IZ5trTneLmFWcx7vajr4CuhKqousMtb6gi3fleN+afkVKq4uXLMRGsW
	 7r1O56bczwcQ8DnhQEsAmbmZYk+EoyR7fx4k2wg/+8h6HTZrVmuWmlGJB93LuikauF
	 EOh54wrmjj1lcT5Rw11XfItj+dilMh7PDfvtLAy2s4/1xJWmrSUUnNqR4gW5YEa1Ef
	 ZMCts/rklETjwI3XuCZz/LAq4vc6JgyQA1IiF1bjgmebzmPkfnajCLfkk+EVQ+pMdM
	 kNV9EZzycrwcTiMtdynhZmcw90Sh2Xu4as2QNTKZG2z5OnMXewThbmqbarWnMQCxem
	 edI/hjbkR2+6g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E19FA17E1064;
	Thu, 23 Jul 2026 03:35:06 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:34:56 +0300
Subject: [PATCH v9 07/61] drm/display: scdc-helper: Add helper to set SCDC
 version information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-7-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183509_517667_CDB3191A 
X-CRM114-Status: GOOD (  17.63  )
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

The HDMI 2.x specs mandate that compliant Sink devices report their SCDC
version in the Sink Version register, which reads as 1 on any
SCDC-capable sink.

There is also a dedicated Source Version register.  Writing it is not
compulsory, but the spec advises that compliant Source devices do so, in
which case the value must be 1.

Add drm_scdc_set_source_version() to follow this recommendation.  The
Sink Version register is read first, both to log the advertised SCDC
version and to guard against non-conformant devices: a sink reporting
version 0 is either not SCDC-version-aware or broken, so writing the
source version gains nothing and risks upsetting such hardware.  In that
case the write is skipped.

The source version is passed as a parameter rather than hardcoded, as
future spec revisions may define additional rules for the allowable
version values.  The written value is additionally clamped to the sink's
reported version so the source never advertises a version the sink does
not understand.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_scdc_helper.c | 46 ++++++++++++++++++++++++++++++-
 include/drm/display/drm_scdc_helper.h     |  2 ++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index cb6632346aad..6d804ee19420 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -21,10 +21,11 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/i2c.h>
+#include <linux/minmax.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
 
 #include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_connector.h>
@@ -270,3 +271,46 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
 	return true;
 }
 EXPORT_SYMBOL(drm_scdc_set_high_tmds_clock_ratio);
+
+/**
+ * drm_scdc_set_source_version - set SCDC source version on the sink
+ * @connector: connector
+ * @ver: source version to advertise (per spec, 1)
+ *
+ * Reads the sink version for diagnostics and as a guard, then writes
+ * the source version unless the sink reports version 0.
+ *
+ * Returns:
+ * 0 on success or when skipped; a negative error code when either
+ * the read or the write failed.
+ */
+int drm_scdc_set_source_version(struct drm_connector *connector, u8 ver)
+{
+	u8 sink_ver;
+	int ret;
+
+	ret = drm_scdc_readb(connector->ddc, SCDC_SINK_VERSION, &sink_ver);
+	if (ret) {
+		drm_scdc_dbg(connector, "Failed to read SCDC_SINK_VERSION: %d\n", ret);
+		return ret;
+	}
+
+	drm_scdc_dbg(connector, "Sink reported SCDC ver. %u\n", sink_ver);
+
+	/*
+	 * Only advertise our source version to sinks that report a
+	 * non-zero sink version.  A sink reporting version 0 is either
+	 * not SCDC-version-aware or non-conformant; writing the source
+	 * version gains nothing and may upset broken hardware.
+	 */
+	if (sink_ver) {
+		ret = drm_scdc_writeb(connector->ddc, SCDC_SOURCE_VERSION,
+				      min_t(u8, sink_ver, ver));
+		if (ret)
+			drm_scdc_dbg(connector,
+				     "Failed to write SCDC_SOURCE_VERSION: %d\n", ret);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_scdc_set_source_version);
diff --git a/include/drm/display/drm_scdc_helper.h b/include/drm/display/drm_scdc_helper.h
index 34600476a1b9..90b0828364c2 100644
--- a/include/drm/display/drm_scdc_helper.h
+++ b/include/drm/display/drm_scdc_helper.h
@@ -77,4 +77,6 @@ bool drm_scdc_get_scrambling_status(struct drm_connector *connector);
 bool drm_scdc_set_scrambling(struct drm_connector *connector, bool enable);
 bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector, bool set);
 
+int drm_scdc_set_source_version(struct drm_connector *connector, u8 ver);
+
 #endif

-- 
2.55.0


