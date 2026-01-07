Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDAACFD626
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD3g6EnD8+rcSwnk3c6GZ/METpYqJBufhGXSRbaDSWE=; b=OvhYN8Zjl2g/fBf2/frPf17xV1
	rg3H3+2u15Vn3WjeKLB1U2Qpl1+KRLU8hgaZgGh4celTGk7F4fWcRvaGZEGCB6OvhRbr+/nC8YP7a
	TEMJTS4Ih5nA6OZq9dHGWuVV/W0zglJP6cYMYo73/5R33Qf6Zp3c46n6EWP9hLOiDYdobMhaptSoc
	UsHUqoUp+NxPlgzkfIIt7zlC/oQUCsBT7G7MJMyHo40qtbQ0KrYQZsSXD6UQbqB3/xSps++RfOece
	Ge2bNDL4PErrW8Ei4ohdqZrFKseNY6BOEMg9n4rTT+nbX9VCQjyAiA0E2dz2fFNNLvIk2p8Wyt3Vs
	/fQAOS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTM4-0000000EyEF-2M8M;
	Wed, 07 Jan 2026 13:13:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTM2-0000000EyD5-1m2X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:13:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 46DF5C1EC8B;
	Wed,  7 Jan 2026 13:13:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63E39606F8;
	Wed,  7 Jan 2026 13:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB669103C821A;
	Wed,  7 Jan 2026 14:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qD3g6EnD8+rcSwnk3c6GZ/METpYqJBufhGXSRbaDSWE=;
	b=U4Knzitt5PLyQhIm35aPNRNQjblPaBg8FX2aqGtdsEeHi3qTJWdo9U1wf+xe0cgUEsnhQQ
	Uu3uf4/xT6JYYwUE3fJi2S7adFqBqKL2occnkU33mNx4g0RT/5PxJ++MWt3UJplWMihusp
	vfyB8Y6Mw1nmBa3uMBYYeuMgnUP9DsVuIK+On4aeYRpPbBVY4SxXvrcXm3iSBEOpqyXQFp
	iorKDMm4BRJMk+qqcr2DjKWuwHR2/kJfrDGW/UTtBbD/pKlJjI35q+q6HHQHFBD2t4v72r
	v/JoOeBuf14FdeKDQU4gcG4AzFcJ8vmAd7uMKChPzsuGxuHKfoMGdoKy3s9cCw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:53 +0100
Subject: [PATCH 02/12] drm: of: drm_of_panel_bridge_remove(): convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-2-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_051338_624655_9EB934DF 
X-CRM114-Status: GOOD (  10.19  )
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_of.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index f3e55ea2174c..f2f2bf82eff9 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -171,9 +171,10 @@ static inline int drm_of_panel_bridge_remove(const struct device_node *np,
 	if (!remote)
 		return -ENODEV;
 
-	bridge = of_drm_find_bridge(remote);
+	bridge = of_drm_find_and_get_bridge(remote);
 	drm_panel_bridge_remove(bridge);
 
+	drm_bridge_put(bridge);
 	of_node_put(remote);
 
 	return 0;

-- 
2.52.0


