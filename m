Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A099D609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/EnK3Kc3qT8kjcCEbC4eskMJJiJRpvZhnnPzJbqBGw=; b=DlB18q2y1qS121tzlbBGqLBfrc
	HCh0rTIiy8OlzIahDLnsiaLt0dx8T+3hYC7+zyABKJYKxJO28Jve/MPtKSNos3uICvcYzEMprkPbE
	dklusvNUnIPeUSEusFuOvTmGMlsAxWhcxOx5oVT0g97ZLdKatndAdwcjk6qoCKs9fV9EJUpatw8HD
	k2M7wMzI38mgsPblw9JqEUYRp3ErwItqHX3czN5CSR7Rd5RCFmcnDFa2SO4SE+l0cYJLxVvl2l0Qq
	6GdhzrfZgyJAl3KVUePb9h3yvF+zws0LAZ/Z9AncphJXmre775jwuSui6J7xsmKBt9PQQepU6J7MJ
	BWBRbXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLN-00000005eT3-4ALW;
	Tue, 16 Dec 2025 18:00:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLL-00000005eNr-0hlA;
	Tue, 16 Dec 2025 18:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=K/EnK3Kc3qT8kjcCEbC4eskMJJiJRpvZhnnPzJbqBGw=; b=SuGVZbKsN7Y3dqGNMM5+hVyNPb
	MrpA53H3+AFmJJzf2COH9HHYqRv94Ste1nLxf2nQ81/hrWqIoNCuEhMMOQftT8g36LP2dDHaxcKel
	OYZ18I36VqGcH592J/Npgp+BCrXyTcp0msuKkxRny4zoff1ru4Ib8v6ndng+kBhLenX2kFmEJg5Sq
	DL2KzDIPuwpAvldl9tpXASJKkj85QWNTbPQ6f3znhSRPUSiC5fHMh7evyXQcPFOw/rsHu+o0K9wa0
	pwkNUCwkDCevqPJehKfeTCz7mPRmljNNF/z5rgdDtwjT4Y/T8ej3HPZzK/6+1EpYqf5Bl5liPOnAQ
	KMOe+NqA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYTl-00000005JXr-3lps;
	Tue, 16 Dec 2025 17:04:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6CC204E419EA;
	Tue, 16 Dec 2025 18:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EC856071C;
	Tue, 16 Dec 2025 18:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDC65119A97F8;
	Tue, 16 Dec 2025 19:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/EnK3Kc3qT8kjcCEbC4eskMJJiJRpvZhnnPzJbqBGw=;
	b=ojZexrascPc7stKrWSbLf9kMhrJ5re8TioIXXOAZsDVUrNKjFdSux3LNEBMkv6gBflDfKj
	ga2ZLh2B8afm3HZDlOOinRc+Ae/pXP2ahcVKQmhuzWMnVg+A7F+wKSQ/pm57ZNipBEhcO4
	xOKlWSpf8PKr97PAB/TizXvrP6dAXG4sBBNfjTCP6bD+Ba2t3E0duwcMsaXHNOyqjK0aRA
	MXajHelu+NDZDgfGa8BG/Uncen5QPfxpXkPJUueiOeP0gqJKLuMuFfOIKNoeJBwN234wag
	jzq9OzJXvQtUSmQI/PmwCGAuC+F9T7bXxFAgR4nLppV27XnFIXwkBdBJsTQpKQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:43 +0100
Subject: [PATCH v3 10/22] drm/meson: encoder_cvbs: get/put the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_170454_090200_733B9FDC 
X-CRM114-Status: GOOD (  11.42  )
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index dc374bfc5951..41071d6e05e5 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -33,7 +33,6 @@
 struct meson_encoder_cvbs {
 	struct drm_encoder	encoder;
 	struct drm_bridge	bridge;
-	struct drm_bridge	*next_bridge;
 	struct meson_drm	*priv;
 };
 
@@ -89,7 +88,7 @@ static int meson_encoder_cvbs_attach(struct drm_bridge *bridge,
 	struct meson_encoder_cvbs *meson_encoder_cvbs =
 					bridge_to_meson_encoder_cvbs(bridge);
 
-	return drm_bridge_attach(encoder, meson_encoder_cvbs->next_bridge,
+	return drm_bridge_attach(encoder, meson_encoder_cvbs->bridge.next_bridge,
 				 &meson_encoder_cvbs->bridge, flags);
 }
 
@@ -241,9 +240,9 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 		return 0;
 	}
 
-	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
+	meson_encoder_cvbs->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
-	if (!meson_encoder_cvbs->next_bridge)
+	if (!meson_encoder_cvbs->bridge.next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find CVBS Connector bridge\n");
 

-- 
2.52.0


