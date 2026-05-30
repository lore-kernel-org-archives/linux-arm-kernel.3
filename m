Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDF8CD6E54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzYdoEGmr65bjxJWetD/EjVXn4e5Tnw21bJieLO8qC8=; b=Jexxr/c4Yz4TKH6uPfAt5hBYMH
	n1m5IPANIHViMMFrgvgE1ag1P8r0mu25JtjesoF18dypX1e87TM3bc/1JwVPr5nzsrkPXPGNMbCnq
	8XmAIUq92jYUibeuwELFyHgfItzj979KHY/S/4Y8Y3augmBTU6nMkbrW+0cVxK9a2mILWrK8RIezA
	lLx4mUmLTx+v5vSX4w2RPwaIHVqTWtlWGRHufEjU0mKGi8/EpxMqiEHUGSTS9Qhlh+nS/UyTgC0ES
	VGSoPGnpqabAenDknOyHJKtdLEDJipMofgic2N15SKa6QSUGHRudj0kKirxqkzsCEjAWliJOUOhMu
	LC10RuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKHA-00000008nsK-22s2;
	Sat, 30 May 2026 14:02:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGw-00000008nk3-24i1;
	Sat, 30 May 2026 14:02:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EACD2600BB;
	Sat, 30 May 2026 14:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE231F00893;
	Sat, 30 May 2026 14:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149761;
	bh=jzYdoEGmr65bjxJWetD/EjVXn4e5Tnw21bJieLO8qC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n7MTmz+3z9CZmukZBdNfen+ZOVhcFHEfUVwO+bk/BWTpbyrX2OepmzocsqEfh5qYY
	 Z0QturNb+3xF6R4b+Z1woGXB6HPg8Ex4f4na3vMzMo0MmFWVncxEaGKTEScexrpHzt
	 coEjOi1FsJYIDC2oqhJ+a7NckwHNnFBVQIADzBdw1wXylK9RzhejS5Jc11lbdx7ox/
	 ekkXuelvf7uQJJaVhlpN88HfWBH+WuX9TtBD/3NrDd6ta12ec2kAEIvUj9eoL6rY24
	 q28AyyjSolNlmuN1VpSMa1bfBx+53fdxnwHQFBAVQZhLZoUH+tOCW28V4pMyRN2fIM
	 7OlO1cfbXdbxQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 16:00:07 +0200
Subject: [PATCH 62/76] drm/rockchip: cdn-dp: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-62-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=mripard@kernel.org;
 h=from:subject:message-id; bh=U4WwqBHB0mVgkbUd2c7ZiSu3xx3F36y2Ertg0bKK/mQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSbwMiZ+0rbux8sSx/3iLnD2JWap+/LHWd35nI3Jhgv
 Fr854KkjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRmwcZ6/QmRQrGb9qWfVnQ
 LPl8hdOL4DO25wJP6N9pP+CfILzBJPPc5rZdImYKmlnMG1MPCT1VZqwV28HdX/lK/uukXwUSyc2
 sO3oVzY/LLulgWn02adJnl+WXnp2dVV0qUNSZ1/TI92yTbxsA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Sandy Huang <hjc@rock-chips.com>
To: "Heiko Stübner" <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 190cce9530c8..e159e1627f3c 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -823,11 +823,11 @@ static int cdn_dp_audio_mute_stream(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.detect = cdn_dp_bridge_detect,
 	.edid_read = cdn_dp_bridge_edid_read,
 	.atomic_enable = cdn_dp_bridge_atomic_enable,
 	.atomic_disable = cdn_dp_bridge_atomic_disable,
 	.mode_valid = cdn_dp_bridge_mode_valid,

-- 
2.54.0


