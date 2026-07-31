Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3B5C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ynxt6nnGr9ZpoII5NNS09ANueCg3dsaSLnrXsJ5AHY=; b=BL7uvjlnSRQp/6fMq8dqAQfvET
	ekqpgLBhYc4XbT6aLOEItgxDus/bxIBcjSESDKc/SVK3FOBtEQCqej3iTC9Gc73oWMv4FVyZECxem
	JZfDdAwTjZTz2jPIrTkJVoW2snDUjpDyIk7eeQ591JqCKyEXh3L45xlFoYIrUDkk1Kv0AzeZm+29y
	hZET+yW+0Y+VEkRUrA+Hk22khV9IgCDL+PBQ8soJSaGY+M8gXiWrTF0RsVhqU9tnfiDwlfiNYmqE3
	VLYVppcx7JLnIjqtjowTAZApaB1AoAAW3cX0LvKtYW7fB8qOERLRrVs4prV4D6sgQeZKmgZz2sicc
	pNj9O73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoW4-0000000CpB4-0ojT;
	Fri, 31 Jul 2026 14:47:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoVq-0000000Cp4S-0KgP;
	Fri, 31 Jul 2026 14:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785509219;
	bh=sA6n2KnvSEaGkPQa1ltQhKRPY6bSR9ZrwCTs622Bkcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QKjctK5wplc07k/8nJcHHK8bCY5yzBHDVVIK4wk7mIfxDzO5leJP1i1c9kJ9VOJ87
	 XshCPgB5ETOClVzmD1N0K5hgxAY0klFm2lX516J/DIqr6qIUhOFKgsY8eUGSCyfR67
	 pkMKhIgp7+b1i660BccvvWEnOe8lUIqUw7N78ONJIRrMZah6r3fumnQjnydel4BKaw
	 wz2tLFmCYDo0wLhAfi5uB0BZjjPLwK77Km0QoBPTxatbStyeSU8csic2uOM+HCE6HG
	 kaAR3nyTTHoBLopj9gw4y9dLj1PcgXXiYgrz9IVsnr8dbuGQBaMzJ6YnO83ew3Pxh1
	 7An9eRoAGQSCg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9ABB017E0700;
	Fri, 31 Jul 2026 16:46:59 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 17802480064; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:23 +0200
Subject: [PATCH v8 18/21] drm/bridge: synopsys: dw-dp: Clear only enabled
 SDPs on atomic disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-18-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2746;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=sA6n2KnvSEaGkPQa1ltQhKRPY6bSR9ZrwCTs622Bkcg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEBR9IwxpVYWBl9gXgbpZ7kyXR8qYdMhe
 KXEeU8r/3IHcYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qaq0oP+gPvxR6ppz4VoOZhM5y+b6HNwr9SCItrGYwBXHj+ke9h4M535bpLUkCSJO8M1UDiq7z
 4tG/jy+fBrxooAXxDqHyWAX4QD3uM4cXNWW+mAGFiC2bv3HlM5cp8XQipiJQuy8cq0kuZ7+Kc9o
 fCLVywbWPKDX1JKk6O1FnxOEYPsWW2aGtBc1tmU/yexIzWdNUMpBxHWWYO//7uBBl/UzOSySo8W
 KBu6pn4RON8lUPA/gq+7AQUU6ivYWKIwAOi5PDuGP0plAIkqh1jxMOkxdeY7AN9E/cjDtUAQMxJ
 Mms+MfCM9Ook3KGF4Qndg6q7KtwXUx65KFjQKKhi0k7caFMxwZApANfjfw568esYHMfIST09xCa
 NAMSjL9sh1lV+UWhVIr7jfxMeEzsIsUyf3xxxlT2gx5HvjlE2ByFDxqIdd+Nwa1Y+uuTEor8a2R
 2T62XUafV8vjv3c3yBmGjwXL7PG2JHXGr5p/kNrKAj+Ksxpg1k+vz5A3b7maK5Rj5HSCT7/i7mi
 JbjY5ur0BAp5rTNViSvzVlrYvN/wOuoIzRGO2GtsJuK/mGQnsJFUbsI64qm3XIi40cW1GpS/0LK
 PxQ3J5AIfW1HgILOLUyCLhScNLPCnvLobTbyRpDOghUcnhSNJ4wwHrYvGA+1vrOyFn2C6mF2IoM
 yIJXZSzjgfb2sXjwVTPorqw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074702_275594_EFCE76CD 
X-CRM114-Status: GOOD (  14.38  )
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

dw_dp_bridge_atomic_disable() bulk-cleared the whole SDP register bank
allocation bitmap via bitmap_zero() resulting in the loss of all
tracking information. This results in a slot potentially being handed
out again by dw_dp_send_sdp(), which is still considered to be held
by the previous owner. Then the previous owner might free up the wrong
SDP later on.

Instead of bulk clearing the tracking information, the new
implementation only clears the SDPs actually configured during
dw_dp_bridge_atomic_enable() instead of the entire bank. The
introduced functionality for that will also be used by the to-be-added
audio infrastructure.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 193816126e44..9b9c6d7c8cd2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -337,6 +337,7 @@ struct dw_dp {
 
 	struct drm_bridge *next_bridge;
 
+	int vsc_sdp_nr;
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -1078,7 +1079,19 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 				   EN_HORIZONTAL_SDP << nr,
 				   EN_HORIZONTAL_SDP << nr);
 
-	return 0;
+	return nr;
+}
+
+static void dw_dp_clear_sdp(struct dw_dp *dp, int nr)
+{
+	regmap_clear_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+			  EN_VERTICAL_SDP << nr);
+
+	regmap_clear_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+			  EN_HORIZONTAL_SDP << nr);
+
+	scoped_guard(mutex, &dp->sdp_lock)
+		clear_bit(nr, dp->sdp_reg_bank);
 }
 
 static int dw_dp_send_vsc_sdp(struct dw_dp *dp)
@@ -1396,7 +1409,7 @@ static int dw_dp_video_enable(struct dw_dp *dp)
 			   FIELD_PREP(VIDEO_STREAM_ENABLE, 1));
 
 	if (dw_dp_video_need_vsc_sdp(dp))
-		dw_dp_send_vsc_sdp(dp);
+		dp->vsc_sdp_nr = dw_dp_send_vsc_sdp(dp);
 
 	return 0;
 }
@@ -1739,8 +1752,12 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	scoped_guard(mutex, &dp->sdp_lock)
-		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+
+	if (dp->vsc_sdp_nr >= 0) {
+		dw_dp_clear_sdp(dp, dp->vsc_sdp_nr);
+		dp->vsc_sdp_nr = -1;
+	}
+
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2326,6 +2343,8 @@ int dw_dp_probe(struct dw_dp *dp)
 	if (ret)
 		return ret;
 
+	dp->vsc_sdp_nr = -1;
+
 	bridge = &dp->bridge;
 	bridge->of_node = dev->of_node;
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;

-- 
2.53.0


