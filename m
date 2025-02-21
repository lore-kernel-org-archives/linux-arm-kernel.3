Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563F7C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFXO1Gy61HIc3X2s04g2rF4mqurOzi2/2JTsODv/dro=; b=XtbhmdgrZBKmw8/fEOIG1QK1aF
	D/2f+g1ccoDb3yUYG+XYiDhzPofAbboy5fq8t+aTFPBuaWGgnkBzoWkgBkyBYqWV0i+JxeNHSKmym
	ilSijHqF4guRpjumGp8ZOmfbdeE1i6dGMcgueIDogGeLJmzRclUJm9zaEMXaQB9pWops0vvwGC4u0
	5ABG8EEU9Qo4EebcF1mdrRFcOeBBSm/kLV7rhMZbaOnkNxbhAsBropEPyu51rN01bsaIJykS7xbvv
	xToa8JW//3/dTo5A8gmTSXwZfQXrG0fv8YGiPPBvW0j2iGSLCSsh7UWNB1fGskSRqy7sllXgVCFW3
	1GNgxQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVqd-00000006AhL-3zwQ;
	Fri, 21 Feb 2025 16:25:55 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj3-000000068Jj-2VsB;
	Fri, 21 Feb 2025 16:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UFXO1Gy61HIc3X2s04g2rF4mqurOzi2/2JTsODv/dro=; b=1o8W83wHSBrDm/t1B7qCpi4ixz
	kf7OYIbWcpgCR+W1fnJIk9ILEvIsEbePlyNmxteQto38eQZK6X3bWzcIHM/uNLN/bnhwOwlEZ78Pn
	/Zac86Vl6IzLzK/YrbB8gywurgnIbab7Cu581QjuwUxEMpO9rKuVUdB4dSRULi8Vo+CYFWIH7cFFK
	nCxQaB55szc822dBf1LSfD8LYwZf7ackLHJsjLAkagUpwIdbm9rAxE3MyMp92QrVNeJll1F5SGzaW
	X2m0uBcUfIZTv4I0Ijn5OlcF7PBhwgI9esG8YF2zqsZ4B2v/UOE59YT0NI1fL1OIoNRK+3lgLWORV
	WZTju8dA==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96-58-g4e9ed49f8)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1tlViv-00AOLX-0d;
	Fri, 21 Feb 2025 17:17:57 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
Date: Fri, 21 Feb 2025 17:17:48 +0100
Message-Id: <20250221161751.1278049-3-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081805_810334_B482BDCC 
X-CRM114-Status: GOOD (  16.94  )
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

On Allwinner chips with a combo D-PHY, the TCON LCD0 should fetch it
from device tree, in order to enable LVDS. Since the PHY also needs to
be powered off to disable LVDS, add a function to the quirks.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 12 ++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c82..ccf335a61 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -183,6 +184,8 @@ static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
 	} else {
 		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
 				   SUN4I_TCON0_LVDS_IF_EN, 0);
+		if (tcon->quirks->disable_lvds_phy)
+			tcon->quirks->disable_lvds_phy(tcon, encoder);
 	}
 }
 
@@ -1245,6 +1248,15 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		goto err_free_dclk;
 	}
 
+	if (tcon->quirks->has_combo_dphy) {
+		tcon->dphy = devm_phy_get(dev, "dphy");
+		if (IS_ERR(tcon->dphy)) {
+			dev_err(dev, "Couldn't get the combo D-PHY\n");
+			ret = PTR_ERR(tcon->dphy);
+			goto err_free_dclk;
+		}
+	}
+
 	if (tcon->quirks->has_channel_0) {
 		/*
 		 * If we have an LVDS panel connected to the TCON, we should
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index fa23aa23f..b270d1a13 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -239,6 +239,7 @@ struct sun4i_tcon_quirks {
 	bool	has_channel_0;	/* a83t does not have channel 0 on second TCON */
 	bool	has_channel_1;	/* a33 does not have channel 1 */
 	bool	has_lvds_alt;	/* Does the LVDS clock have a parent other than the TCON clock? */
+	bool	has_combo_dphy; /* Is the D-PHY used for LVDS output? */
 	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
@@ -250,6 +251,8 @@ struct sun4i_tcon_quirks {
 	/* handler for LVDS setup routine */
 	void	(*setup_lvds_phy)(struct sun4i_tcon *tcon,
 				  const struct drm_encoder *encoder);
+	void	(*disable_lvds_phy)(struct sun4i_tcon *tcon,
+				    const struct drm_encoder *encoder);
 };
 
 struct sun4i_tcon {
@@ -282,6 +285,9 @@ struct sun4i_tcon {
 	/* Associated crtc */
 	struct sun4i_crtc		*crtc;
 
+	/* Associated D-PHY */
+	struct phy			*dphy;
+
 	int				id;
 
 	/* TCON list management */
-- 
2.25.1


