Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE27ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51CzKYDEx2a9yVAc768Na++IHptYoF7LDAE19Kl4+7I=; b=Yq7l1Gr4qOOcsTnRMThZODbdLb
	sO9MbrUrY+5R0C4wHJIYDp5PgJpf2bnMqcZLMTpTJPZQHQk7KGE7cpJ2jBBUNegTtsxVZ/W+19ahO
	/eF9mb6W0b9z0UGw7FluYVHiCnAuvP91WO+PIBslAUE5jEyhoRYV+OndOzOrwvuZ+FgNizqEhtDJE
	AX/4rratgTWTYL+sc6uH4mg0XBOZS1K6+YBKklTf1IQp9KRzfxvVDyCfqt5ORStJRfM/KAe6qb641
	/gMS8msnlGLfXf6SZQTfW61opEbPjpIm4RbEGW/ZveFNy8QZRWvbGRRLb4I46unIZOcGUGmt0q8T1
	duFlmU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dFY-0000000G6EW-2FhR;
	Tue, 14 Oct 2025 11:31:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dFU-0000000G6BZ-03kA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:31:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B99A74E4108E;
	Tue, 14 Oct 2025 11:31:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DD46606EC;
	Tue, 14 Oct 2025 11:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AD5D102F2298;
	Tue, 14 Oct 2025 13:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760441480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=51CzKYDEx2a9yVAc768Na++IHptYoF7LDAE19Kl4+7I=;
	b=Qr6AoFSxr32F6mDxxdYbBXAVT1ujiJP11N7z44icP/Q/PhLiq34zX+VKaBACkajgO2Qh52
	3ZwUKEzfQNxycfhwM+xsCRcoF7nALRDLf91eUj1BWm8asG5Om8Cov7twUwCernFzfA4sBU
	pE8Fk4Poj1I1SlLMbSddA9snbZn0rv0sMg/kWEzmYnoAv4AyfcS1V+N5+mQHI1oUzC/AEO
	IqY3dYgeZZ/rmPLxrRLNr33Y2if9OaHrPfZq+2ThmtGwPpaJ7KANXaSxhVB42XifeODsVr
	eq8gkI7zyqYMn9OeSURX9WmtWIJJjO2qy5QG4psRL5BSYBJLqK1nK09QvWS6iQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 14 Oct 2025 13:30:52 +0200
Subject: [PATCH 2/2] drm/imx: parallel-display: add the bridge before
 attaching it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-bridge-alloc-imx-ipuv3-v1-2-a1bb1dcbff50@bootlin.com>
References: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
In-Reply-To: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_043124_191651_015FF3D1 
X-CRM114-Status: UNSURE (   8.80  )
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

Invoking drm_bridge_add() is good practice, so add it to this driver.

Link: https://lore.kernel.org/all/DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Note: there is a proposal to make drm_bridge_add() mandatory before
drm_bridge_attach():
https://lore.kernel.org/lkml/20251003-b4-drm-bridge-alloc-add-before-attach-v1-3-92fb40d27704@bootlin.com/
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 3d0de9c6e925978b7532b6d13caf6909cc343dd7..7fc6af7033078eef6be0672ff0d1c7bddda88ba1 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -256,6 +256,8 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imxpd);
 
+	devm_drm_bridge_add(dev, &imxpd->bridge);
+
 	return component_add(dev, &imx_pd_ops);
 }
 

-- 
2.51.0


