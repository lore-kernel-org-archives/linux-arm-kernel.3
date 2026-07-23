Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418A2C531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lLUzOIGKVW69wGEnBNu6N7PXT6XEdjsL4J19TE4QfA=; b=Dq6akX1lBJtFEEDDxHOFNHBJ9F
	KRHn2RbEXLjnpcvm5MtwRjqe8loTIxJ6lC3MsOe+LaP5KpXYj6cuEvNj0liMsU0VYsaszw4cPE7px
	qew1FLjE1B2S80MLQtyrqMSrGj1BlYcRfVjFFQ9oQMG42PxEkd9O4+7eGVvs+nhRB0GiP1s4qmUmJ
	hdQAW7uXnri6cQPROOM/dPuV47DulnSFDGQvV193P6zYNCjMddcahMOvADbXcpRLM2OVKwG0Fsucn
	z8k2R3ssP3qQqWX0DU6EmFINQZ70l7ArGvgYGaSEburHBozRtRAokYrqdFwOLap1ttZYDxHgsM/9A
	tFGOh7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLd-0000000D3X2-2flR;
	Thu, 23 Jul 2026 01:35:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiL9-0000000D2rd-0iR6;
	Thu, 23 Jul 2026 01:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770509;
	bh=Pse1bTSm1Byr6z8ofKg6/5V6m8w5K69CIVMkbjjUiOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UEy9GKKKrYaQTIX0Th0B2Xj/1R+ryvugqGKcN5HIBbosQpBNf/NK0m6y+e+UY1g9X
	 2muf0y0IoDjbiS6MDz/t4m6OGSQt9unI5qTectDbaPJ4YoNRD6JpuLbTE3jnw6sLOL
	 8O88hF2uuAabMSqCikLuQbH74m/w0m4T8O+76ogVD+z2IJSivvEFqhS4vAfVeYTxHE
	 cGU5noPz9p1rkmepum8dIrHo4nXD58bMuoXnQOP8l7wQlE/KUSLTuoTXVgMLDiZy6A
	 2vvTfDUBUJs7gkEYNTPW3StNzAZccWoD63NkGD6PMca7P2IPobEyK1/AzOHdMJfWJ2
	 p+5WTlj/owlMw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07E4017E36BC;
	Thu, 23 Jul 2026 03:35:09 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:34:59 +0300
Subject: [PATCH v9 10/61] drm/bridge: Remove redundant error check in
 drm_bridge_helper_reset_crtc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-10-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183511_435489_97FDEEDF 
X-CRM114-Status: UNSURE (   9.33  )
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

Remove the no-op error check after drm_atomic_helper_reset_crtc() since
the goto target is the immediately following label and the return value
is already propagated correctly without it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_bridge_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_helper.c b/drivers/gpu/drm/drm_bridge_helper.c
index 420f29cf3e54..0a3c8fee66b3 100644
--- a/drivers/gpu/drm/drm_bridge_helper.c
+++ b/drivers/gpu/drm/drm_bridge_helper.c
@@ -50,8 +50,6 @@ int drm_bridge_helper_reset_crtc(struct drm_bridge *bridge,
 
 	crtc = connector->state->crtc;
 	ret = drm_atomic_helper_reset_crtc(crtc, ctx);
-	if (ret)
-		goto out;
 
 out:
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);

-- 
2.55.0


