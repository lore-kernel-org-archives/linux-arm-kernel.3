Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A6CCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PP3YrJfeSiH/kZk6hzY38PaRv1nPTIZDqK5Cz2PweEw=; b=wYlnEEYIjByPJKrlVGJbdETSI7
	3ZDw6CZBio/n2Mx/W6Gr3Tw7+GMNKtt0jWhdmBIcFNvwWZAnQb9exf2/GMRr2CoXSujnvVfP/koUi
	YlVIEzXxq+NlcoR3+WNGZ1h/d3X+WZ1fuCF3Xj4J/qTyTK3tG9xIDMTH4y4d8Tg3wMD+/ca2RvKhQ
	ryTG2ZRPFSC/Gc2dXoHBVMU9mQ5YsCCT1028jsbekRCubXjWpucJF5/JdmSiQziinvr8ZVZsKqRwM
	Md7VXHuVyd82UD9TvB2zPINGlNmmRIboXH9+NwQBIuJ+bUHEN0yMzMkqjFv80c6y6JRMx2qm1P+D/
	mHAbB85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssp-00000006zJd-3oe1;
	Fri, 29 May 2026 08:48:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssI-00000006yp6-35aP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:47:28 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56BC57B41;
	Fri, 29 May 2026 10:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044425;
	bh=u7ub0LTq/LG3vy2G9rU1xYBZYiavDBGmr5fWkQDAfvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k2c0tiLMtbj9x3ruTO1G5u+mQPy872fvMwsRLRPoWQbSOTziBYBmvosni7z6iaHxL
	 VddCKR2s5RGHSnuj89m0LkmRplEkuUCS6zVfeNnroWT5klMtPdI334zBxmtXxhX1vX
	 3sJ0M9LdTgZJaSLOw4OKSmCWdeCR9Zw91HhWG5qo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:39 +0300
Subject: [PATCH v3 09/15] drm/tidss: Add external data and sync signal edge
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-9-7fefdc5d1adf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3376;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=u7ub0LTq/LG3vy2G9rU1xYBZYiavDBGmr5fWkQDAfvw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKOpGTOrBpu7DnAvMn2vUXlqc+3UkJIlVwgh
 TJrA2Odpg6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjgAKCRD6PaqMvJYe
 9WiPEACqKzBs/FHRnaiJRIHKrPMjTlqh9eERaooXqiPUii4kISHReqEVLizSgI6QLgAsjAWBXLh
 esVVvhFkp2beNEKidE84COGKtvOR6UtuloOQlwjNBXIVfs2OavSORoKohn4YDTfqmw+6PB+q98z
 51TVpqUevuiUdSBM6V/A59/xbIPMYcP2AZbOr5mDooSVQR4zCrU54v8Ef2ZYQFF9DwiZhJ0hR6N
 X0NPxaoaBQyrCHHHyxC79+vCo5vAMGioyc90Qd7Cpdt7ZVru8V8aTyqobRNmhK1XXg/HPyG599F
 oz1Kfl+S853lKrt1f2BPj03/Edt/Jd7yFWJdF3i4RSgwp/KhZhVY7Y0cax0SX2UfOhOJJFJg2G4
 ySKNcsj6D2rvxNKGKntW0/8eukDgFlBxqdWgc4Kt30qMCzOT6BZHwv8myZAO2mClsjusQBhsmgS
 BEBt/l2Y1vi67CIx1/4vYjSA80/rsq+46z1gJ4LQi1EPg68qzWqkIMKaRnQDl5nc9Tb0ewrK5+k
 2gZO45XsF+d7+DpFayY84D4t8wrSF6vkp2Q5mCGtc7vnA4+KzLBpn5kK4hcdzkKBHfCoov8d3dU
 sDe+xu4VT79NiNCUKwle6aMb4YM5YX4a6YLENAUtdapaT+r4IHWEhwGKoUxmel4OvyNj8yju2Wp
 BIPur3rlO/Ptodg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014726_945061_8446DE1E 
X-CRM114-Status: GOOD (  15.92  )
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

The DPI output pipeline in K3 SoCs contains the display subsystem (DSS)
which produces the in-SoC parallel video signal, and a DPI block which
adjusts the signal to the external MIPI DPI output.

The DSS IP has registers to configure whether the data and sync signals
are driven on rising or falling clock edge, and on some SoCs these are
automatically conveyed to the DPI block which needs that configuration
to properly output the MIPI DPI signal.

However, on some SoCs the DPI block configuration has to be done
manually, using an extra register outside the DSS, DPI0_CLK_CTRL from
MAIN_CTRL_MMR_CFG0 block, which controls the DPI block's behavior.

Add the support to get the regmap to the register via syscon, and
configure the bits before enabling the video output.

Original patch from Louis Chauvet <louis.chauvet@bootlin.com>

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c      | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_dispc_regs.h |  4 ++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index c21ac3f51720..08342a9a5e8c 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -467,6 +467,8 @@ struct dispc_device {
 	const struct dispc_features *feat;
 
 	struct clk *fclk;
+	struct regmap *syscon_dpi_io_ctrl;
+	unsigned int syscon_dpi_io_ctrl_offset;
 
 	bool is_enabled;
 
@@ -1201,6 +1203,13 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
 				  mode->crtc_hdisplay - 1) |
 		       FIELD_PREP(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK,
 				  mode->crtc_vdisplay - 1));
+
+	if (dispc->vp_data[hw_videoport].dpi_output && dispc->syscon_dpi_io_ctrl) {
+		regmap_write(dispc->syscon_dpi_io_ctrl,
+			     dispc->syscon_dpi_io_ctrl_offset + 0x0,
+			     (!ipc ? DPI0_CLK_CTRL_DATA_CLK_INVDIS : 0) |
+			     (rf ? DPI0_CLK_CTRL_SYNC_CLK_INVDIS : 0));
+	}
 }
 
 void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport)
@@ -2989,6 +2998,22 @@ int dispc_init(struct tidss_device *tidss)
 
 	dispc_init_errata(dispc);
 
+	dispc->syscon_dpi_io_ctrl =
+		syscon_regmap_lookup_by_phandle_args(tidss->dev->of_node,
+						     "ti,dpi-io-ctrl", 1,
+						     &dispc->syscon_dpi_io_ctrl_offset);
+
+	if (IS_ERR(dispc->syscon_dpi_io_ctrl)) {
+		r = PTR_ERR(dispc->syscon_dpi_io_ctrl);
+
+		if (r == -ENOENT) {
+			dispc->syscon_dpi_io_ctrl = NULL;
+		} else {
+			return dev_err_probe(dispc->dev, r,
+					     "failed to get 'ti,dpi-io-ctrl'\n");
+		}
+	}
+
 	dispc->fourccs = devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),
 				      sizeof(*dispc->fourccs), GFP_KERNEL);
 	if (!dispc->fourccs)
diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
index 382027dddce8..4cdde24d8372 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -333,4 +333,8 @@ enum oldi_mode_reg_val { SPWG_18 = 0, JEIDA_24 = 1, SPWG_24 = 2 };
 
 #define AM65X_OLDI_PWRDN_TX		BIT(8)
 
+/* Bits in the MAIN_CTRL_MMR_CFG0_DPI0_CLK_CTRL register */
+#define DPI0_CLK_CTRL_DATA_CLK_INVDIS BIT(8)
+#define DPI0_CLK_CTRL_SYNC_CLK_INVDIS BIT(9)
+
 #endif /* __TIDSS_DISPC_REGS_H */

-- 
2.43.0


