Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C1FCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnluJ6Mta9yYcmtq3aOb9bOnNMSPyiKv709+YjBCRsY=; b=PY1Cnq78GuDQRWppEvrj8m3383
	bbs2+GEXENefvlgkUZJM2nFNVLUTT+fp6Gm3sfhu1h5Dq4vULRMCASHETraC4+ONt3Md5uhGmlnYF
	eccvXRKlV3VZo1l5lk2VgrMTCMj2+fprCIu4t2IKP7mmRcB/mfXA5+SjB1Y8GtGECbfFdaEnl1wtr
	SymI1XVl8p/9RQgHxWqapyc+X9QbN7341X0nZ9YDy/u8dj1mViZyjcYof4giEIFaPiUj/Ks7OTovx
	3MYWSB7NE4A5VqkwaSlqsoCJNhjW80fY04D6f3+t/G8lbMRQA2TdSimYBQLQ2SkiD3JdipxrGcaJS
	I85maIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd7M-0000000EhOG-1Yk5;
	Sun, 16 Nov 2025 13:48:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd7K-0000000EhNw-3vDG;
	Sun, 16 Nov 2025 13:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AnluJ6Mta9yYcmtq3aOb9bOnNMSPyiKv709+YjBCRsY=; b=OFvZOyOKDusFJSIWZNAudkFddq
	y/N/VB24sCO39CkIX/3Kv5QlEXldmhN88HPkJJHSMpOAonxs2TcxhcXSQntY+Yzi1hRVhkCZ0ab7W
	JdrlA3L0EnvA83hAwREWaC1gFlCa540nGRNsvGBUWcu1Nqn+lAlPUufkFGSCJOsU8KBl3BNIG+HVD
	yYwwBgpLnMWcne0PAZhrap34a1lzAkufaGkY8mrxQ2dhURQ8WsjBNZiTs1nW4ruvfSB87ImXpDlls
	XNvh1snQhCejB8CQ39ctx+5zW6aG6+0ZmDTE11B4JohlnGxeAcgoqHEBmiH3y5P322yAnTsktiWIx
	4WjDR3JQ==;
Received: from s2.avantea.pl ([46.242.128.95])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcFd-00000005M4q-3T8u;
	Sun, 16 Nov 2025 12:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AnluJ6Mta9yYcmtq3aOb9bOnNMSPyiKv709+YjBCRsY=; b=vmNalNjfG+z3PNdpOoQ5ip9Eas
	7XMmR+waCSwCZOHwa6EECAbFYPGNTicbyAkCAAasLQTeNDRmPkUxO1vJ/lNQbSQ3YAc2fdIUAAjDa
	k5lMuc3LuK1ioLmUz1xM490yb0CnRKcgwkqF1kKVU8fsRZrRLR4jxKDh+A0HxrCvu2bJwk6M/ok9q
	DxVa934oFRRjsas1CDniLrbmQakKsb6VxRcHfrhkIGNiosZ/uVQEMySntgDuAjTPpKJmuk3HZ/6yo
	sC60wT6EOb1PdXaoJeJ+RWj4nsekYAaGab09cKt7IVu5cB1x+pcI+h6oSeU5Q53FSksx9tNx7KFSR
	wN1Gc8hg==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd7C-0000000FXPA-2jbh;
	Sun, 16 Nov 2025 14:48:26 +0100
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
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v3 2/6] drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
Date: Sun, 16 Nov 2025 14:48:21 +0100
Message-Id: <20251116134821.447272-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_125305_987259_A01322FC 
X-CRM114-Status: GOOD (  17.56  )
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
from device tree in order to enable LVDS. Since the PHY also needs to
be powered off to disable LVDS, add a function to the quirks.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 12 ++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c82..247400785 100644
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
+		if (tcon->quirks->teardown_lvds_phy)
+			tcon->quirks->teardown_lvds_phy(tcon, encoder);
 	}
 }
 
@@ -1245,6 +1248,15 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		goto err_free_dclk;
 	}
 
+	if (tcon->quirks->has_combo_dphy) {
+		tcon->dphy = devm_phy_get(dev, "combo-phy");
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
index fa23aa23f..82b65a2e6 100644
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
+	void	(*teardown_lvds_phy)(struct sun4i_tcon *tcon,
+				     const struct drm_encoder *encoder);
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


