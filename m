Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A26C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv1JrJOdpXk7tQNYkQuP3Z86KVTV1n/M55hzFtu6+1s=; b=z85xnaHdI5YW7z7etMyUcVkljK
	6JVMGAbWe8x/Qr2P8GByRkkD9Jp9I4hL7IR6nncz61sbYaXyvpulH+MqWopggDYX4TSqG7DkFvqOF
	yVyGl1I1s262jMZCHzs0uwGd1mbjCj6uT8WaqN6clsi9IpNntbA24gN7MHwkPafalNSOjBXrggUKa
	XqtUwUdJbhw/rIyjC/JEzIoDKuErBMvv4adRtl+ZstPDw6wuiCPMM2Z0uCPHYr/RCv3sWNkd917Aq
	D1VOJxkT5EtmpgHF/bkz7pnKmw4D+usZsOg8YQe05nCZ+j5ONpLIa6YfuX8Ay92z3RMZu7+C6aOS1
	GItzqfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TcP-0000000D6na-2cco;
	Tue, 01 Sep 2026 18:54:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ta3-0000000D1aB-2gO3;
	Tue, 01 Sep 2026 18:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288693;
	bh=pKqbana09aMrPmXoZQ13pSEzcpiBN8VMqBIdy9PyH+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LSViJgRqE5XaH0tu+QeV2Yt5Nhsb4RcPAwkVOkH5zCEPt6mEg1Gv6ogb78QTe/a0D
	 WchtsdumRXsjJq3bkmfUW36ZJ9PT3xnPkvMHCQnhwPSbYZtQtXI3R6b7+MEJVgjRRW
	 MbZUllumUzylGiIUZcA20WiDP1JZbQKMs5EmSeO0qNtWbVpPPplO899vulJLTl+Aih
	 PMSkUyKvbtt+bEkp+b016wPO4vObr6F4sT4nYdJ/3oL1xZ8knb/OUbouBGwvCmYYhp
	 87God285IcFb+jMcaQ3Spmq5yyfxS0gCG0KMZkm27P7UePPBSnuZ7l8+rhDBIVqlCs
	 3bavdJFMzX8/A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B82F17E3CA3;
	Tue, 01 Sep 2026 20:51:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:35 +0300
Subject: [PATCH v11 71/74] drm/connector: Drop redundant max_bpc field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-71-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115137_528855_98B692AF 
X-CRM114-Status: GOOD (  15.30  )
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

Now that all users migrated to the new drmm_connector_hdmi_init()
signature, max_bpc is provided through struct drm_connector_hdmi_funcs,
a reference to which is already stored in drm_connector_hdmi.

Drop the redundant connector->max_bpc field and point its users to
hdmi.funcs->max_bpc instead.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 6 +++---
 drivers/gpu/drm/drm_connector.c                 | 2 --
 include/drm/drm_connector.h                     | 5 -----
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 687793c62d55..abe7e3061e4c 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -321,7 +321,7 @@
 void __drm_atomic_helper_connector_hdmi_state_init(struct drm_connector *connector,
 						   struct drm_connector_state *new_conn_state)
 {
-	unsigned int max_bpc = connector->max_bpc;
+	unsigned int max_bpc = connector->hdmi.funcs ? connector->hdmi.funcs->max_bpc : 0;
 
 	new_conn_state->max_bpc = max_bpc;
 	new_conn_state->max_requested_bpc = max_bpc;
@@ -680,7 +680,7 @@ hdmi_compute_config(const struct drm_connector *connector,
 {
 	unsigned int max_bpc = clamp_t(unsigned int,
 				       conn_state->max_bpc,
-				       8, connector->max_bpc);
+				       8, connector->hdmi.funcs->max_bpc);
 	enum drm_output_color_format fmt;
 	int ret;
 
@@ -813,7 +813,7 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 	if (!connector->hdmi.funcs->hdr_drm.write_infoframe)
 		return 0;
 
-	if (connector->max_bpc < 10)
+	if (connector->hdmi.funcs->max_bpc < 10)
 		return 0;
 
 	if (!conn_state->hdr_output_metadata)
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index db4d8daacfa0..bb02e8626c0d 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -662,8 +662,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	}
 
 	drm_connector_attach_max_bpc_property(connector, 8, hdmi_funcs->max_bpc);
-	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
-	connector->max_bpc = hdmi_funcs->max_bpc;
 
 	if (hdmi_funcs->max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d0aaa87dad7b..3b49799d12fd 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2458,11 +2458,6 @@ struct drm_connector {
 	 */
 	struct drm_property_blob *path_blob_ptr;
 
-	/**
-	 * @max_bpc: Maximum bits per color channel the connector supports.
-	 */
-	unsigned int max_bpc;
-
 	/**
 	 * @max_bpc_property: Default connector property for the max bpc to be
 	 * driven out of the connector.

-- 
2.55.0


