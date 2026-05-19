Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19858CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eN6pL5kosuLFHDQOEEYHtqbm7sPqAq+GeT70rFRs0LQ=; b=0CoDXiQ+Jbispx841GSovsie1Z
	EVFiLolJ4Kl7k+Y1xSUClGHl+1awYhLGr3jbaIqPHkAytjJ15Vos4quXuYOHV6vIxW2qDemfFxnRp
	UgIvG2CVkATDMk/yvuzPiHENTawWJPYuRQqPF0JYoYXaAYt50U9rdaMd+kdVAeFyG72nktFCSLIIz
	zszJNc9QA7us1R4lXxJsJbuwaPQcK8hp8ASw1wR3G8sD/wzrWGNE76htTfDEn8tB7Cpy16/G231Bb
	9scbQxoSEczs/WexLq2CO4EssdUP8wYL5KHc7p5K+ioLmd9qr1r7toYDBK1Pht0q9pG+sN2P4LZsH
	gMD0oDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHs1-000000019Pv-3ir8;
	Tue, 19 May 2026 10:40:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHrp-000000019B0-2cFa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:40:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2779BC2B9DB;
	Tue, 19 May 2026 10:40:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBB4D606E9;
	Tue, 19 May 2026 10:40:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7FCA107E8AFA;
	Tue, 19 May 2026 12:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eN6pL5kosuLFHDQOEEYHtqbm7sPqAq+GeT70rFRs0LQ=;
	b=gOj+U7XaOXqqhRiCtqoWTExaKf57PI5lsbopBhQnoItip50VmAyxc5ehIE2oflvHG9ssjM
	SY2QhjswtmJaiFlXE2fcoiAAFVRNt/bNNH9qvjYCh44CZ5RZLyZUKi9NB00u1U1O4nIpmD
	3fstKXeQ+gjFJKnvVqHhY/oaMSlQLlZ2oBMbR4i7XqsAmmzQhUBr+pPcDGm51TZd7JkdjC
	CpDEeniTkrfzAnRnE1usFaMKGot0iD0zkjzV/t3LPdDRpBXqktYjQfa7VpDWAwu2tuUfDl
	K0WM4fjVBfEuLNN+5YCy564YQaejBvOokM+sigsyWrvjry5asQGLnJMiJazsuQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:44 +0200
Subject: [PATCH 27/37] drm/bridge: notify about detached bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-27-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_034005_853927_1FE90B2A 
X-CRM114-Status: GOOD (  10.24  )
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

In preparation to support DRM bridge hotplug, let the drm_bridge code emit
an event when a bridge is detached, so that this event can trigger the
actions needed to deconfigure the pipeline and unregister the connector as
appropriate.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/Kconfig      | 1 +
 drivers/gpu/drm/drm_bridge.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 18eb33e0e5a0..081660f3a0f2 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -17,6 +17,7 @@ menuconfig DRM
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
 	select VIDEO
+	select DRM_EVENT_NOTIFIER
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d45fb74ec8c2..c62d17e84d4f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -34,6 +34,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_event_notifier.h>
 #include <drm/drm_file.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
@@ -638,6 +639,9 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 		bridge->funcs->detach(bridge);
 
 	list_del_init(&bridge->chain_node);
+
+	drm_event_notifier_notify(DRM_BRIDGE_DETACHED, bridge);
+
 	bridge->dev = NULL;
 	drm_bridge_put(bridge);
 }

-- 
2.54.0


