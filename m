Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90295F33A70
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjTun7V4sdMrqY3oz515484Kw69CJtG/jWkM2sUF4Ss=; b=cAI39j+GrRkUdnJOiVxNo/HL/P
	u02QfUdein5KNqJQyEXdQ7lgd7BN3R/8TAv/8zPnoosNAoB5eUasjt4mCx7eTnDsqy2ZiUpk5g8jV
	v/znp8l6SBVfxJzSRQB/3Ggmj5DyHx1uQ5el3YZ/mnVqQSSSDQqdmHL9CxDTo87grQA6j3A/hxMOQ
	hzzv2OTj7nTSWMiCgiZgX29tLHtstiv8xIQt6mR5LDpF9gKb8ZkrpFNbCH1FqvXx1uO5l9D+Jo7CI
	pQOJwknI/XSGUihzw7iBThH0IRRAnNHx3B/8L1aBPQ5tatbuXwm1qkk0fEFzzG4iCFMJj6zt2U0d5
	ynKftI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9ak-00000001xRO-2wTN;
	Thu, 05 Mar 2026 14:22:18 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9ah-00000001xNi-3YIR;
	Thu, 05 Mar 2026 14:22:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772720501; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TgCeDZZWRVmR46YKkdAOhyFr/9AjWT27GLJ1MdbZCm20rOECTJiMopX+2KGzkFqCP082GsTHyN4wRN+P/whGl1FXCGy8x/rPwTf6gAGMuZLKwIp3p1iXn2y0BNADaI4jFaOlR4RNGndQ6qimgg1ca0E3ypz9TzClllFdZLXCEfY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772720501; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JjTun7V4sdMrqY3oz515484Kw69CJtG/jWkM2sUF4Ss=; 
	b=feQjw4AZFM0/UgoSsGeqgK5ekauQp2DCR5EgiQxWIRLUQNANfMG0gvnmj4/C4LuN19rW9RbghpQAGFeTSKOlHuvBiHeER3G0TdSLeP4ELyKXkCBEqfF7LNYiQaGdOAujYOTF7sGh+LPvbkw4Eq2TgxJNuZl/7RoQ4WIsu8QImF4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772720501;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=JjTun7V4sdMrqY3oz515484Kw69CJtG/jWkM2sUF4Ss=;
	b=lLlzAe5eCtTj77bTrXyx/fhmmoKm8c26Cgf1gBrmGdtKPS8bZ6/3wYPs9R4nHOz3
	3gsypYjzpMMrl3ecfTKFD4xGPrEDZXijJpyIpIRnv+b2qbQ6KngeAqpvzI4wF57JAIt
	C7ir+Kx4VDJkEZszLD1xrGTkt6pLwbVTa0p1dKkg=
Received: by mx.zohomail.com with SMTPS id 177272049987123.476864387595242;
	Thu, 5 Mar 2026 06:21:39 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Mar 2026 15:19:39 +0100
Subject: [PATCH v10 13/22] drm/rockchip: vop2: Set correct output format
 for RK3576 YUV422
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-color-format-v10-13-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
In-Reply-To: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_062215_941562_0D83B02D 
X-CRM114-Status: GOOD (  11.25  )
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

For RK3576 to be able to output YUV422 signals, it first needs to be
able to pick the right output mode in the display controller to do so.

The RK3576 hardware specifies different output formats depending on the
used display protocol.

Adjust the written register value based on the SoC and connector, so
other users of vcstate->output_mode don't have to care about this.

Reviewed-by: Andy Yan <andyshrk@163.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 46d49bc98ddb..205ecf06abdf 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1686,6 +1686,22 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (vcstate->output_mode == ROCKCHIP_OUT_MODE_AAAA &&
 	    !(vp_data->feature & VOP2_VP_FEATURE_OUTPUT_10BIT))
 		out_mode = ROCKCHIP_OUT_MODE_P888;
+	else if (vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 &&
+		 vop2->version == VOP_VERSION_RK3576)
+		switch (vcstate->output_type) {
+		case DRM_MODE_CONNECTOR_DisplayPort:
+		case DRM_MODE_CONNECTOR_eDP:
+			out_mode = ROCKCHIP_OUT_MODE_YUV422_RK3576_DP;
+			break;
+		case DRM_MODE_CONNECTOR_HDMIA:
+			out_mode = ROCKCHIP_OUT_MODE_YUV422_RK3576_HDMI;
+			break;
+		default:
+			drm_err(vop2->drm, "Unknown DRM_MODE_CONNECTOR %d\n",
+				vcstate->output_type);
+			vop2_unlock(vop2);
+			return;
+		}
 	else
 		out_mode = vcstate->output_mode;
 

-- 
2.53.0


