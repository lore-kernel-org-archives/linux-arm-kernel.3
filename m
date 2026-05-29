Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27F0CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TI5NRrZ+zLBkpp0luXsxTg5zs9xhBdh65yF3aHf9xC8=; b=tnNnTR8+caQX3xe/a1VC42Ruqf
	tEG7pXGKWMCVYqwKiEr7UfiwTN/czM6+EP9D/8FSVqsRdChTTu9hUE5OLYJwj6VFyVDePZiwGe4EV
	ZvmKfaOEQ4TkpHNanjrJU6cUPxIR6b3ci1w9+a1seOiSfICh6EzYVJZLstfaHdLAPSFpH6dtLudWv
	1qCBuXf7A9yevzo4hYrfYLnvn7lrZV/SHZDk9kyCXJYA7vaTTCN4hvx8BCrm84QiVxAc53bgNJLzD
	HZbtq4ZdfJm8Ji13o94rMFxrjAbIl/ppPa3hOcY5jlNHi6WnmuLMe2kfW9kUF8TWxrZJQv9+FzEl8
	3ZMZ5srQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssq-00000006zKc-2aW3;
	Fri, 29 May 2026 08:48:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssL-00000006ytL-0dYi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:47:30 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2E7C291F;
	Fri, 29 May 2026 10:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044427;
	bh=vNhPG3gt1iNAQede4sSDJktbqWiYm6dT9TVVZYkS1Jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FEJWxiuGF6wP43Zgf6HmN+hw5/smgGyVqtB4l7IhSWldva1WPbDZuh326o1XCzM1H
	 rOQHoCr5idk+QvHidVh0SNy9IZvdXCkzWVmG5fYYGBT2gHMUdTp6sOphGbMrU6X9t6
	 UQUWmhgfDR0r2TNWls/y6yRL2+7o13NkYNln+eBY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:41 +0300
Subject: [PATCH v3 11/15] drm/tidss: oldi: Fix OLDI signal polarities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-11-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4997;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vNhPG3gt1iNAQede4sSDJktbqWiYm6dT9TVVZYkS1Jg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKPLEqXtvNtESuoXqfgthiAenLg0OEjFo3sS
 qX/TSc7QKGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjwAKCRD6PaqMvJYe
 9RJ+EACg3qKAWrMv5tLQrO5C/lIMuyM2T0knuft0pt2V9UdgGEUgrzKUuWs349rvbLJBmRX8ydg
 FWEas6wVr1d9AmMkwrd8piR3kWB4I2hBs2l3EjuyTfUgDsZbbqi1qgRmyryVa7FOhCaU7z25HMN
 i2H2XprPgWieOip1fXuPbqccc03dLFMVmSp5QiJ0LroWEaDZjiEPUh2X9mXyGQ7vTKXXOAk6wXm
 AvYhnpTj0akHifeTsJqK+P7qlU1FbWYQrEVb/Qt8ack9NDIXJWtIV+3uCW79bOco0ew6GD5nQ81
 zWyR+MnG/oKIu7lubA3agXgsioCrGIKVf+QtkbCTR9zqKh6BW+TY8RvtLMuU76kq8Us2Fyv/UeP
 TqZSpRDiONNrBaayfRvraM/nWmFqCpKKDjuFM11i/qENkf7mp2EaZOKnGjIHcUkWMmdY77v3zve
 KiEJ8NVIvo7rScfYGtMlPh/2eqNNXhT+jpkH3EvL/dhXqk3qIq/7tQENvifIzv7UCCAO0c4ISWk
 dVWcF1qhLFSThLlFrXYNcZjQc64lJP6XajSvojo+nFQRSXDL3QaDp1B/Ce482LonEOSrrRYOuWH
 2/eRHbsVZ1drjWNhr1JTap7t7dMaMiWPnLNfzgKzo44meepAIkErkNhdhzC3Su6fpOVYucZYYOo
 rCIEzAoGOAFuoeg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014729_370042_DEDC858B 
X-CRM114-Status: GOOD (  18.28  )
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

OLDI has a few issues with how it handles the signal polarities:

- It always sets OLDI_DEPOL, which means DE active low
- It sets DRM_BUS_FLAG_DE_HIGH in struct drm_bridge_timings, i.e.
  reverse to the OLDI_DEPOL
- It sets DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE in struct drm_bridge_timings,
  but the TRM says "The DSS interface is clocked on the rising edge of
  OLDI_FWD_P_CLK pixel clock", which I read as "OLDI samples on rising
  edge".
- But the defined drm_bridge_timings is not actually used anywhere, even
  if it is set to bridge->timings, so the bus flags are just ignored.

However, based on my testing, OLDI_DEPOL bit or the edge on which data
and syncs are driven doesn't seem to affect the OLDI output. Possibly
it's not as robust, but I did not see any effect with an oscilloscope.

However, the code is still quite broken, so let's fix it:
- Remove drm_bridge_timings
- Set the correct input_bus_cfg.flags in tidss_oldi_atomic_check()
- Set OLDI_DEPOL based on the DE bus flag

Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 17c535bfa057..e925ddaa4fd6 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -164,7 +164,8 @@ static void tidss_oldi_tx_power(struct tidss_oldi *oldi, bool enable)
 	regmap_update_bits(oldi->io_ctrl, OLDI_PD_CTRL, mask, enable ? 0 : mask);
 }
 
-static int tidss_oldi_config(struct tidss_oldi *oldi)
+static int tidss_oldi_config(struct tidss_oldi *oldi,
+			     struct drm_bridge_state *bridge_state)
 {
 	const struct oldi_bus_format *bus_fmt = NULL;
 	u32 oldi_cfg = 0;
@@ -183,7 +184,8 @@ static int tidss_oldi_config(struct tidss_oldi *oldi)
 			 "OLDI%u: DSS port width %d not supported\n",
 			 oldi->oldi_instance, bus_fmt->data_width);
 
-	oldi_cfg |= OLDI_DEPOL;
+	if (bridge_state->input_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
+		oldi_cfg |= OLDI_DEPOL; /* 1 = active low */
 
 	oldi_cfg = (oldi_cfg & (~OLDI_MAP)) | (bus_fmt->oldi_mode_reg_val << 1);
 
@@ -220,6 +222,22 @@ static int tidss_oldi_config(struct tidss_oldi *oldi)
 	return ret;
 }
 
+static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	bridge_state->input_bus_cfg.flags &=
+		~(DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		  DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE);
+
+	bridge_state->input_bus_cfg.flags |=
+		DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+		DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE;
+
+	return 0;
+}
+
 static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
@@ -228,6 +246,7 @@ static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_display_mode *mode;
+	struct drm_bridge_state *bridge_state;
 
 	if (oldi->link_type == OLDI_MODE_SECONDARY_CLONE_SINGLE_LINK)
 		return;
@@ -245,10 +264,14 @@ static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
 	if (WARN_ON(!crtc_state))
 		return;
 
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (WARN_ON(!bridge_state))
+		return;
+
 	mode = &crtc_state->adjusted_mode;
 
 	/* Configure the OLDI params*/
-	tidss_oldi_config(oldi);
+	tidss_oldi_config(oldi, bridge_state);
 
 	/* Set the OLDI serial clock (7 times the pixel clock) */
 	tidss_oldi_set_serial_clk(oldi, mode->clock * 7 * 1000);
@@ -329,7 +352,8 @@ tidss_oldi_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
-	.attach	= tidss_oldi_bridge_attach,
+	.attach = tidss_oldi_bridge_attach,
+	.atomic_check = tidss_oldi_atomic_check,
 	.atomic_pre_enable = tidss_oldi_atomic_pre_enable,
 	.atomic_post_disable = tidss_oldi_atomic_post_disable,
 	.atomic_get_input_bus_fmts = tidss_oldi_atomic_get_input_bus_fmts,
@@ -440,11 +464,6 @@ static int get_parent_dss_vp(struct device_node *oldi_tx, u32 *parent_vp)
 	return -ENODEV;
 }
 
-static const struct drm_bridge_timings default_tidss_oldi_timings = {
-	.input_bus_flags = DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE
-			 | DRM_BUS_FLAG_DE_HIGH,
-};
-
 void tidss_oldi_deinit(struct tidss_device *tidss)
 {
 	for (int i = 0; i < tidss->num_oldis; i++) {
@@ -598,7 +617,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 		/* Register the bridge. */
 		oldi->bridge.of_node = child;
 		oldi->bridge.driver_private = oldi;
-		oldi->bridge.timings = &default_tidss_oldi_timings;
 
 		tidss->oldis[tidss->num_oldis++] = oldi;
 		tidss->is_ext_vp_clk[oldi->parent_vp] = true;

-- 
2.43.0


