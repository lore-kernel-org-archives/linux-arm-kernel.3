Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7378BD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 21:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSkvAHcP/G4a6alQDdr5rtYAAoRHlQiW07L6MnzhG5c=; b=dIWbsYCg2fOYl6u97i4soShIsf
	PIDr7QVK6bJF0yIsKWHSzNjJlQfOeT4MlfXdDDyMRTLTsaPrp5CNMLnpjNqLGrmihTu3m+F06tZgO
	0dyJ7l5C6AdL5JAlnJimy+y7AmfIKvBEVT9ncXG/6O5qHezU1mIjaahi/J6PVz/epw0eRYsVeQ7MK
	5d56MnkC7l3FdZ3xxKOD+PH0+UngAB2sLuDA6VwbKROBFejLJFvyN3N2JxcVuQRBvZpwuz3oyieCG
	GXH/Pqr1DuqpVJHq2oots5h0Wr21DBlrbuTYCIFf3S4lGon+s1kl/hKJwKtY9ZWI6FQvDr++0/MOn
	uYyN0ZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5hN-00000000wQa-1YOg;
	Fri, 28 Nov 2025 21:08:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5hJ-00000000wLs-3f3y;
	Fri, 28 Nov 2025 21:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MSkvAHcP/G4a6alQDdr5rtYAAoRHlQiW07L6MnzhG5c=; b=QYf0xQ3SVzGgAoT4XqLOZIPSdS
	VMgF2mFqkL5+isYmmGCRexta80zgIvfQl+aTd9ftaiSRMuI/gJxNudGZtmR28i6N3fKvXHur8CLe2
	bGKIG/3OM24Id4vMRue8XeDsTsHuZ0yZjWUPOSbFgTG5ooi/IOMoU+9Ey3gLGLJSF42iurbPn/6V9
	gWzn8rtN4cxzuPNiOg0sADeOvgn5+g24smNuJ3lKnEJfIx9qKo1bBdngSFi7RTRoCPVZc31VIwEFp
	qx/GiRDufmxExAAkFautL8Q8eW12ArM2IfzF1in/RR2oC34l+Xq/ihh7RyGtLs98ozOFIgk2hgO+L
	vogmfamQ==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4ph-0000000CWux-0u6W;
	Fri, 28 Nov 2025 20:12:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764364054; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UPWmRUTKbGui/i5e6sB805AxnGcH5CqgF+ej7cYhQX0k1JnqLWxYOjaNF8Blao2Otv9Bj3YyqYU0NI4u/1xjscc207xN4uMfIkiQtoRlWSyK0Y+GNm1W1h2ywKWx3bIT0AAlKrEw9g5f5wWShKcdpvFtcgVmEAgN88/SRO2Fe0A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764364054; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MSkvAHcP/G4a6alQDdr5rtYAAoRHlQiW07L6MnzhG5c=; 
	b=k4dMunZWoDfjtqEr+6rY/CekD00x/qD9DVlEtY8+h/GKOBXy9oQVvd4p1ZIgp6MyQOCxpk0EdfAldtrBhJVbNZDiZu2P/AaNFhcTPK02dclXy0PdfVJAk82pobo48/lsDbzJdCaZ7MUz9hAA/D8EXBlPeCrBXkUVFguhZlsroxE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764364054;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=MSkvAHcP/G4a6alQDdr5rtYAAoRHlQiW07L6MnzhG5c=;
	b=fx7Q5EJ2kkDka7ehv/XNboSqkwzCv3eVBtdhurXogzwSL985bn9Rw5eo+7ROZigA
	KX/hclhyz+kHjApR1nbf/05LRBJg8RZoh+028/OBXpbhhDulAgDGe7ebjXf/C7GB/Vh
	m/br9ZI78b68hafj0EZkLsWtLemNW9X60TyFdXY0=
Received: by mx.zohomail.com with SMTPS id 1764364052859213.44634754490573;
	Fri, 28 Nov 2025 13:07:32 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Nov 2025 22:05:49 +0100
Subject: [PATCH v5 13/17] drm/rockchip: vop2: Set correct output format for
 RK3576 YUV422
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-color-format-v5-13-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
In-Reply-To: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
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
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_201245_558548_2A7C5E52 
X-CRM114-Status: GOOD (  10.32  )
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

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 21afcca1218c..cd18876955e4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1707,6 +1707,22 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
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
2.52.0


