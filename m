Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80FCC4453D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSjlflOS3FMwgNu3AUtwmsAmjNssW5SNs+85bXJdDto=; b=rKFmD91ocDzTmBqeqiscIoXzj4
	f4jfl1SA2kP29kZEAqhu+BlMOkwKyvB/YJjuJ/feoaKTGQIqxerlVAnVhsmURwvYZe5mRIOhButsB
	e0f+ewkEjBEtsVHmiTi5CtulO0+/gILZeskBYYftiCntVTCsAKyTA5bdysoAq/+YidjPPPhjHdkKs
	WXUpusiP6cVIqLARQjVbHoHWOIJOcKjY/gIC/JzK28itkyu7Gl4tVGKNKXtZbAP/O7F95VFntEGLt
	pX0bUOpS1Cmz28tB5w4ZnC7LS1ZEubdqN1Wp20BzlvTzukdq9jcRjPun0Ql0mChTMw7rru5ITJagA
	UDJ9Wzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLn-0000000D3wg-2jqF;
	Thu, 23 Jul 2026 01:35:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLD-0000000D2w2-41Sa;
	Thu, 23 Jul 2026 01:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770514;
	bh=C+qlzdbw0LrRZWJU2laNITp1UVPSNhb2R/WB9UGEDqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UC7lq7OdUtFVuKSwcH5MXuHlxPYA2NGlvUY/IoHyWaF1r/rD116EUoPZ7jTtc5qGO
	 swduMaxzRWuBuc2z8ejhM/bQXZkcpt77SG4ZQsb4eCF7CFB2V/S3MnpnDiiqm4oZHQ
	 AoP1Lg5xyMB7JokhzTys3H2LHd6Ng+jaP5a/VdO/6p5rzxiWRo6KC6fO0h3GUiJ60C
	 dn7tRz7ujAxuGO9E7Vj/oOeERMaPyZzX7/yQq4Dubo8HynAEdcqLEbfm+a7awNb0Nz
	 VmZv0H4+VTVMNJbOAImM22YxCzABtFZnmMI7GoI80ufY22o6BAs3KmJfXu/ur34SHj
	 f4QaOSTdcfmYw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA04E17E371F;
	Thu, 23 Jul 2026 03:35:13 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:06 +0300
Subject: [PATCH v9 17/61] drm/display: hdmi-state-helper: Sync SCDC state
 on hotplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-17-4fb12ea22ac9@collabora.com>
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
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183516_184495_AF846A71 
X-CRM114-Status: GOOD (  11.11  )
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

drm_atomic_helper_connector_hdmi_hotplug() does not currently
synchronize SCDC status on hotplug events, leaving the scrambler state
potentially inconsistent after (re)connect.

Hook drm_connector_hdmi_sync_scdc() into both the connect and disconnect
paths, replacing the existing TODOs around missing scrambler handling.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 04d5196a2010..ad59318a3e85 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1205,13 +1205,16 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 					enum drm_connector_status status)
 {
 	const struct drm_edid *drm_edid;
+	int ret = 0;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle scramber, HDMI sink disconnected.
-		drm_connector_hdmi_audio_plugged_notify(connector, false);
-		drm_edid_connector_update(connector, NULL);
-		drm_connector_cec_phys_addr_invalidate(connector);
-		return 0;
+		ret = drm_connector_hdmi_sync_scdc(connector, false, ctx);
+		if (ret != -EDEADLK) {
+			drm_connector_hdmi_audio_plugged_notify(connector, false);
+			drm_edid_connector_update(connector, NULL);
+			drm_connector_cec_phys_addr_invalidate(connector);
+		}
+		return ret;
 	}
 
 	if (connector->hdmi.funcs->read_edid)
@@ -1224,12 +1227,14 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle scramber, HDMI sink is now connected.
-		drm_connector_hdmi_audio_plugged_notify(connector, true);
-		drm_connector_cec_phys_addr_set(connector);
+		ret = drm_connector_hdmi_sync_scdc(connector, true, ctx);
+		if (ret != -EDEADLK) {
+			drm_connector_hdmi_audio_plugged_notify(connector, true);
+			drm_connector_cec_phys_addr_set(connector);
+		}
 	}
 
-	return 0;
+	return ret;
 }
 
 /**

-- 
2.55.0


