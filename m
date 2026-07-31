Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD89C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaTfIXT+UTrY6g0gzEcgHr5BnZsRyX3lXcTU7ol/6nY=; b=TjOKR8YfW8brCTPPrFX7DLHuRq
	EEKhQdZ2E5yke1u1PeocHFeBaIzO8rwsNfoggnNIcJ4oNe4Ysx95q8wlXWM3YBhoB/xUQAzZVB5Sa
	s7052nb0Cc8sKCw4eezyDPdEBNfsZcExjzIJpNukgJwnU/LR5DwwFahE0SfUmrbo6sSNv4xV3w0EL
	kRQMpTsorx7a1wCOFgumL6DggSJzIcgIXXoR9SAcfVLNkWUWLzpZLXS5e0H8W6x7kJW96p6m14y9N
	dKsySuQF+NlS+jgVtxUUx2TXm3Fw1CipaRqWroDG4uX9cLeQLDB9oev3CMx5Xw2CWoVoGbcrZUnOu
	LIMsdv2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppzs-0000000D1Sb-3BhC;
	Fri, 31 Jul 2026 16:22:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxN-0000000Cyx4-1SgR;
	Fri, 31 Jul 2026 16:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514771;
	bh=y/oPi/fnmwrFajh0Q2Bmgy/nAjgH57+rFmteNZPqQ30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c5rFA9KSpWytkG1gOfR/SX/kk6TaMt5iTq+mOUZ1i0/fvUP7esFrVUsCTs3Fm3p2b
	 CefzERDAfHUD7Fb3A7DUOrSyN4Tf7bgedHthno16Apkjmdojp/gSnFeI/q2dHIWzqB
	 TV54XjGeH4qrSmKRgY+9LC4j+iPpOAjWGzAkCpbA11yMT3/o/TuvQaEYjZGpxmaWTI
	 yUCMHzAxEj9IRj+TX+phIGg3xplsvkCNnlWCr4pS8yxE3WnA38VtP8klA/MVvGR1cS
	 soZ2NQhgaY+GMdd4Bzeadkw3LXnAw5jbNTd6UY3vtbwwD91caaGAAzBa0XxNtKV2Xo
	 dZKFyVO3vSWUA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52C5D17E0582;
	Fri, 31 Jul 2026 18:19:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:30 +0300
Subject: [PATCH v10 23/69] drm/display: hdmi-state-helper: Set HDMI
 scrambling requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-23-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
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
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091933_703580_4DFF5573 
X-CRM114-Status: UNSURE (   8.78  )
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

Set drm_connector_hdmi_state.scrambler_needed when the computed TMDS
character rate exceeds the HDMI 1.3 maximum TMDS character rate.

HDMI 2.0 requires scrambling above 340 MHz.  Centralize that clock-based
requirement in the HDMI state helper so drivers do not need to open-code
the threshold check.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 3377ea936120..9544eb8659aa 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -594,6 +594,9 @@ hdmi_compute_clock(const struct drm_connector *connector,
 
 	conn_state->hdmi.tmds_char_rate = clock;
 
+	/* TODO: also check drm_display_info.hdmi.scdc.scrambling.low_rates */
+	conn_state->hdmi.scrambler_needed = (clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+
 	return 0;
 }
 

-- 
2.55.0


