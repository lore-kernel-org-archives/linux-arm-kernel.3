Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713E4D46BE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hVKMA1mgA2HarFubchDZxxQcSE3jYQpdUJ9TpOSCc5s=; b=F4u0E4TF6eOduk
	Ma//cd2sEaOE2L/mIU7qoYTjJvGyjxIWkEvePh5xUiiT6n0D74Mo32+a2GCEqIeiCShca39kkLcI+
	+4ZLAdLsFsRtCPRr815rcCTy7zwxBHq/MJ9kk903iFJWHcoMzoUtKvh3R8rfe1ezClwz/0YpikuwR
	YU3Ml/mLwjHCv886l6Pkswi+UdOR0k/gYy2ZK55d2B3cqeV9lKVtTKhdVSWcbBi5ZR6ViMJdFjMaq
	DFCaexBvMnitSKqNN3Q7ON9Oryx4+7dhxD1bhuZ2ZGPr7obbZh9+MyJjkMIVqGBI3aVH5siT+GN7H
	BhoQ+rt3/NpXgBk4WIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9mX-0000000GWux-417x;
	Wed, 28 Jan 2026 17:56:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9mW-0000000GWuq-1s1C
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 17:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=hVKMA1mgA2HarFubchDZxxQcSE3jYQpdUJ9TpOSCc5s=; b=guWWABqjI/n7McdcJdPO7BV9he
	LBhZmZsRL1uzV60FVMMa4g2j0FLr1PnYyHhprvpTpNlKBpHhooxiW5S4vrdocU4Wtpupew7msGewi
	P5wDs6XIw3Hgz4zG8S5Kuy5Lj3V+QqbweXrsLGAf/eu59gbQXNW76P98mSPUp9jjuIZpmit4cFYwT
	6pTh01FOQamCFldF4xqQqXPs2tuacGE+pS4Wz6QGffD6ZK2fc8306zS4s/vJnfiN/UJUvp67rktzr
	BoJTlLFPITZGhqZyokge9YxcKDAMt5in2cQS/5WU0W3a03Guz1hUN4QS2qz0rPYkveWQVTXVvrscn
	mDpaWTWg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9mS-000000098vq-1LLN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:56:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 09A9F1A2AD0;
	Wed, 28 Jan 2026 17:56:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C2F6071F;
	Wed, 28 Jan 2026 17:56:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5B70119A8687;
	Wed, 28 Jan 2026 18:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769622996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hVKMA1mgA2HarFubchDZxxQcSE3jYQpdUJ9TpOSCc5s=;
	b=yN+4QHWXe6CnQTP+XwB3m49VFo6G76tnT/zYzEvY0lAX5ySVppGySpmZRZiiSi2ZZE+Vn5
	CLKx4KldLsoahjIf+rb7Iaceu5zbtk33Lw786p6PjC80o7afcQ/cEJAlxo6CSukA3vd5GL
	4p9/OSkfM3a5hmXddf/RtJ84O2WXIuEcxUB3GF17hNGvt2RJn1aJfuoZR7yfCztF3Ppyzf
	pKkcEeX24bfhs3bU6NZINsoxexD7j37xjNt013w/Ml8Jne+jOVCQBqCqWEelIk/R0nzL7q
	bu7TAZTJ8HTbvwUdmy2Ko2qMCHS0UYp5Cmk69GUp3/mDrwNl6+yjZ2/uQPeakQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH for drm-misc-fixes] drm/bridge: imx: A few fixes - backport
Date: Wed, 28 Jan 2026 18:55:08 +0100
Message-Id: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-0-2138d0933cf1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHxNemkC/yWN2wrCMBBEfyXsswttqiX6K9IHm2x0ITc3KIHSf
 zfFxzkznNmgkjBVuKkNhL5cOacexpMC+3qkJyG7nkEPeh5GbdBJxFXY9cZzQ47NvFvBwo0C2hx
 XTiSYPiGgIyGP3pyvfp4mN100dG3psI+Pyzv4LOowRq4W/3jZ9x9fgUswlgAAAA==
X-Change-ID: 20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-f849f633d352
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15-dev-5464f
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_175640_854798_077457BE 
X-CRM114-Status: UNSURE (   9.11  )
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

A series was sent with 3 fixes for drm-misc [0]. Patch 3 of that series
should be on drm-misc-fixes (the bug is in current master since v6.17) but
does not apply there due to conflicts.

This 1-patch series has a backport of that fix for drm-misc-fixes, so that
master can be fixed ASAP.

[0] https://lore.kernel.org/lkml/DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (1):
      drm/bridge: imx8qxp-pixel-combiner: Fix bailout for imx8qxp_pc_bridge_probe()

 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
base-commit: e535c23513c63f02f67e3e09e0787907029efeaf
change-id: 20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-f849f633d352

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>


