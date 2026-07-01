Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F67FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXWvJN+jQJMlF4JLEblvmzE6hfYR8mP5Kai5iiNSISI=; b=UfOLWYauLQ8gyoXZm2lVvJvKar
	xVKj2fGjIMir7iIJh+XC+o/cxw8lfA5nieYothWO7C/EDrPvEodoZEsFhr/zqDa/bGjkw/FgBD0+j
	AllDWxyON8ExLBKrWZq1c8CP0yqJYrIWgjj+doZ6yVWgh5of+ngEkDr6ZSFUnApp93R8SsduUGy3i
	ID/Rkpz5p7Tu0MHP0tNmYkSXWSPQUNGztk0u/QMosZgv8LXx+4sAOXjsKv4/Dbnhj8ouftG+wMkMm
	bWD1JM4LF/++gy6GQkgHpP9d/GYo6pD/1557ksaKyCExgqSfea6eZqkKvA4TwvjKEYmZfcEcAPHUf
	tnfGLTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwu-00000001vRB-1cMY;
	Wed, 01 Jul 2026 12:21:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwU-00000001uDm-193B;
	Wed, 01 Jul 2026 12:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mXWvJN+jQJMlF4JLEblvmzE6hfYR8mP5Kai5iiNSISI=; b=rbfrpqU9wFdvHuJbwY74/ve01U
	RvVB2x/vyZKIpdacgV/BCdtCE1xmxYOb3D1/JbQKcBzgCKP2nrwvs3aGxwnq6Kfs+wy0I9/uWrh8B
	E+mGX8YSDis8b3VJgCunQpFlfVsxuj2KP8VFj1ZO7yrReHJzyo8mP+hcZw8voezf9zn9M2+RGOlTV
	KRmctEP8RgPwEgkM1dH9qZ/yY3885SVbrlQEhj2tFZI+F99qeNOKeeIcnlK+Cp+Rc2AUHYzV3+sik
	T0qo8wE78N67pyqAFHwVLTHLXDJl5+ue9J2HCe/jjGFMAJZJAuQcJLBGW0RJIE1RN13dZdYqpLkDQ
	gQo/xT1g==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetwQ-00000002jlS-0qhJ;
	Wed, 01 Jul 2026 12:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908480;
	bh=OryipZnNxhLlRdm+3lpvG6AyEh4fSf3cynz+sCxHUWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d3k+IANNLCAne8Gd7yxoL5LTjOwfFJDx1bCV6CD6QtRYxbM7o2kwvATbE1QJBl70C
	 aCRACDUW1fI2IrZrnl2PuZSaeftr58GFp3d82bAqSGSDR6W2uYMZKJZqsldspnDTAo
	 bHokN1VLgXKs9Ypl+A9P8tgl3J/tGYJfnn32p9FurZehjWWUiHB4sGVvEzffaJNSdI
	 RXi2CskVXYiaHN+5qX/0w9VrTCtqTWx9C97yXi2AYU7yvkLUa+vYequuiMztXCwRM8
	 wwWrIZUJnJN/3IrwttMiIbXB1SYTD5E4Rn9fjC3B3D8g6XdXCmxYd8kVMGttSmEKMQ
	 JlrQYTBQN2k5A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 21E3317E116D;
	Wed,  1 Jul 2026 14:21:20 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 16/42] drm/mediatek: mtk_crtc: Minimize spinlocked time in cmdq callback
Date: Wed,  1 Jul 2026 14:20:31 +0200
Message-ID: <20260701122057.19648-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132122_433539_2688A4D3 
X-CRM114-Status: GOOD (  12.84  )
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

In ddp_cmdq_cb (the CMDQ mailbox callback), the config_lock spin
lock is being locked to read the config_updating variable in the
mtk_crtc structure, as, if configuration is updating, the callback
function shall not run (or shall run at a later time).

It is therefore unnecessary to keep the spinlock until the end of
the function, in case pending config, planes, or async planes
bools need to be updated.

Though the cmdq callback is not a performance path in this case,
this may be running for each frame that is pushed to the display,
so from 30 (or less) up to 144 times (or more) per second.

Add a temporary "cfg_updating" variable to aid with readability,
and unlock the spinlock as soon as the config_updating variable
read operation is done as a micro-optimization.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index e543fae9c580..35e78ece899a 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -287,6 +287,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_crtc_state *state;
 	unsigned int i;
 	unsigned long flags;
+	bool cfg_updating;
 
 	/* release GCE HW usage and start autosuspend */
 	pm_runtime_mark_last_busy(cmdq_cl->chan->mbox->dev);
@@ -298,7 +299,10 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
 	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
-	if (mtk_crtc->config_updating)
+	cfg_updating = mtk_crtc->config_updating;
+	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
+
+	if (cfg_updating)
 		goto ddp_cmdq_cb_out;
 
 	state->pending_config = false;
@@ -328,14 +332,11 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	}
 
 ddp_cmdq_cb_out:
-
 	if (mtk_crtc->pending_needs_vblank) {
 		mtk_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
 	}
 
-	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
-
 	mtk_crtc->cmdq_vblank_cnt = 0;
 	wake_up(&mtk_crtc->cb_blocking_queue);
 }
-- 
2.54.0


