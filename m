Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B3BF31E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QFgyuOG5afpYS03fcWAL5CdSy2aihqhs+a6jM8HpD0=; b=FX2nxzI9FcKwtqwyKSN8suAyiW
	kVGnaqkcySNv2vOppgK0CFvvX3ARiyn6ieFCkxMlozIz5kpIPqAIti5ucOZWPkyQ62bsiQTjgWFpw
	R7Ztbkk3LVzd0mw/7hypeARhqri0Az6QVc5T1PQmt4ETarXGO07VNiiZGa3WywJDX8Un/Y5O/9DjD
	J7Jp+qMG+a0sY/SeT7H7Wh0x+ClPBuaXVUuEW8MV6JU9ZVUvQZcImEtDAFmAKswEBF54pHhXpE9pq
	AbeMJgykIxgEYR3e3uT5v9QMBjkXE2LdivWyP01KjSoBJn2bySfMw6KNLD9Tp+seNaiixJoGLUe3l
	vCp9onpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArbq-0000000AqS1-0Mat;
	Thu, 09 Apr 2026 15:47:58 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArbj-0000000AqJk-1HNB;
	Thu, 09 Apr 2026 15:47:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775749636; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V1X4Ry0kCa3115ilo3/z0NrHJDbifDaFvUCH59g6JkLE7Dg6Okac6g7L9xLHa2sa9wZzhbr3bUhXNgsvD2uv05q/7MRzL5yjfwAD/KsU7TH+ezl86RjYAb+U1LfpXJDTwCYVc855hAvK3QFdg5Zg5RH9EdOAkRH7xRTxhCe/8Vw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749636; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4QFgyuOG5afpYS03fcWAL5CdSy2aihqhs+a6jM8HpD0=; 
	b=QH7/VPDZpEt0y2+VpmmgUi/mZgbalz2epSSiScGHbaa4+D6pyVJvBi2eJFIJfH6ZUi/+oLxISJ754IbmHIjOJOsI5nnaKRbcneEdJXbsIUgqEtMIelZ50m+dyP6o0eaSmwi7d5Wm9gAUaU5/9KrRpW6wK31EqNkU4+LqMM1ZUbM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749636;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4QFgyuOG5afpYS03fcWAL5CdSy2aihqhs+a6jM8HpD0=;
	b=YuIzTrNNrTjDT3thoaU2PfoFB1l/NrLarizMtNNkisnORFXRMJnC0uudB6NUTYWr
	z2Jfje0OXGYp9EcWOUv35Cp4dA9NRCgghu8smZsrRiUxrHyDEFAP8769KlKUIeOtmHR
	t2PotoXqy9I92qqJUk9Aqt554aIBlrcgYcuSHRaI=
Received: by mx.zohomail.com with SMTPS id 1775749633653622.1610684031497;
	Thu, 9 Apr 2026 08:47:13 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:45:05 +0200
Subject: [PATCH v12 15/25] drm/rockchip: vop2: Set correct output format
 for RK3576 YUV422
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-15-ce84e1817a27@collabora.com>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
In-Reply-To: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
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
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_084751_665369_91667F7A 
X-CRM114-Status: GOOD (  11.31  )
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
index 59d15bacf023..e76e00f0a530 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1702,6 +1702,22 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
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


