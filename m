Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C3ECD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5YqRur10Nj/J0FxlJmN/GyyGaN4JlEeGez0siRR5LU=; b=fJypdtOnwx+fjcUrFS2JBEIS9r
	n3udy0vcNgVtRZq10R4cOT6jGmfH1zhYubACsNXkmkLxCDuhn859dd7VVyFk054cppstl839AEIE2
	T+tQu0ZMk27JTOjq49/iWqGnptIBrxgnDvg/sO88GbChEp5/wis9O66kDOvRseFw0V26S/UODnFyA
	i1JKZ9XjeQ5IfxKQoiIxT8Zw4zb6GNlz/fL/NTWGu2XUBB/JffpY2ulgfjyfzFzlY64CZn09YE6I6
	hy2W3JUUnRveBaaSIZkO7xopOQOk4G7ndaouEbcBwNJfmN7FrhW31OMjg3CS6PNXt6QARY99behre
	D30vB/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvN0-00000000CWs-1awW;
	Wed, 17 Jun 2026 18:52:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvMs-00000000CLq-4BA9;
	Wed, 17 Jun 2026 18:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781722322;
	bh=C/AphHeqUmYgEpPCNKjM0R3CijmfEx2tuybcOWNfG/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UQ8W+ubZpP133M3xLQmpz7U1GO0LzqC62rTLnNVk+OQ3JIX12gG09317MAabS5im4
	 3c9zuqQORZpGfERlFdpwcvX/In5U76JJ0iBEWOe1qQW+z3eMvffuVGopcTwLDv+lDQ
	 fJ+OKdPGezm/GWbzsQxH+aE+22DRLyJwS30hFIlQ0LDn+d/L2ES2Z92Qmd602e1jh/
	 v+JNFM5Vb65Orrul2gbeewgoRZfwvR0xO+ZX9pJ8mCfVfyW6GlO9oTO1wz5JumuW7e
	 Pdqpd1Mnu0Do8UycxN8gHOj79MJA7VWs+EaO5RlwvA0X7JArn/CDUFdbw4FyeTcSD2
	 lM3DOPQN4YTmQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 906CE17E0E64;
	Wed, 17 Jun 2026 20:52:02 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 17 Jun 2026 21:51:58 +0300
Subject: [PATCH 5/9] drm/rockchip: vop2: Switch to enum vop_csc_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-dw-hdmi-qp-yuv-v1-5-a665cfd06d7d@collabora.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_115207_248031_60423077 
X-CRM114-Status: GOOD (  10.57  )
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

Improve code readability in vop2_setup_csc_mode() by using enum
vop_csc_format for the csc_mode variable, as well as for the return type
of the vop2_convert_csc_mode() helper, which already returns CSC_*
enumerators.

While at it, replace the nonsensical 'csc_mode = false' assignment in
the no-conversion branch with the equivalent CSC_BT601L, which carries
the same value (0) but is type-correct.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index df475173dc8e..e0d6e42fedb1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -648,7 +648,7 @@ static void vop2_setup_scale(struct vop2 *vop2, const struct vop2_win *win,
 	}
 }
 
-static int vop2_convert_csc_mode(int csc_mode)
+static enum vop_csc_format vop2_convert_csc_mode(int csc_mode)
 {
 	switch (csc_mode) {
 	case V4L2_COLORSPACE_SMPTE170M:
@@ -711,7 +711,7 @@ static void vop2_setup_csc_mode(struct vop2_video_port *vp,
 	int input_csc = V4L2_COLORSPACE_DEFAULT;
 	int output_csc = vcstate->color_space;
 	bool r2y_en, y2r_en;
-	int csc_mode;
+	enum vop_csc_format csc_mode;
 
 	if (is_input_yuv && !is_output_yuv) {
 		y2r_en = true;
@@ -724,7 +724,7 @@ static void vop2_setup_csc_mode(struct vop2_video_port *vp,
 	} else {
 		y2r_en = false;
 		r2y_en = false;
-		csc_mode = false;
+		csc_mode = CSC_BT601L;
 	}
 
 	vop2_win_write(win, VOP2_WIN_Y2R_EN, y2r_en);

-- 
2.54.0


