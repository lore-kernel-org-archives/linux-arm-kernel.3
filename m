Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C876C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLT9tnAhwfFe3NqnJodbSY3Vtw0xAUm3ovu2KEBnMLg=; b=07pfB3VJ+GkfpiROBtbygqAVP5
	lBzId9TeH7JEGlOodc9MmUZHqAfRE8EcIScftfGVhkpVx5+qxwUX/fqWSh/AX0WKL/zei90pfYG/1
	O5qV48VdHmGneHd/tnIm7MC1pMqeM404htDzInCUzdn6/rBtyLxwfOPp/vGHGFoSooasGqFddNjzh
	FP5Qqkg2Z9Qzu8TdYy/9Q6VEJKvfHGvdxTbEIjpTGYfSS9Hvs2dr7CneM80pU4WkULJnQMWcLgpcR
	E21PlGET79OUJd+0e8DKVnRFU9Z1wLNMEvbtJwIlJ3QJpPU5klZyd2zcjyAr4sx6i2fE0DF75kTQ3
	Xa3d1EIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvo4-00000000U5d-3eB6;
	Mon, 21 Jul 2025 19:04:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduTt-00000000L3s-3rh3;
	Mon, 21 Jul 2025 17:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753119556;
	bh=FL2EBBa+wSm77LeCRuxbxYL7cW7Y0BEpaYSJV7FVF5A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CRtEapz+FWAhM5zcEGnvhUmfHhzRnTaKs8ZI48vJaeYGrWyo4Dg9shRY/fW6oGs1w
	 Y+rhdoZG/7ZpqPOzRDNnHGU+6FS1ifZUq/MSTrFIQ1hqcHrHheje9cSSDLXxO2GwGi
	 pkFE6Zlh3uI+xcLhz1qsg4SBEo37GcUIFDh4ZdE9/bvaAmQojVKejrb6XPqvbqxnA3
	 Ufkd06epzR0rq4/xxfDGFaELibMIby99JPKovs2b9RSRJsbJsYijGqLiIZAo6WYSlb
	 slrauUWrPL6p52umvpAnvfI2qlNXlpmY05i9IaIEOjnQXceKSFQGW+T3JM1DvZfTpa
	 x8unM6QfhX8vA==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 4460F17E0FC2;
	Mon, 21 Jul 2025 19:39:16 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 21 Jul 2025 20:39:04 +0300
Subject: [PATCH 1/5] drm/rockchip: vop2: Add high color depth support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-rk3588-10bpc-v1-1-e95a4abcf482@collabora.com>
References: <20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com>
In-Reply-To: <20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_103918_137179_F1A26BFA 
X-CRM114-Status: UNSURE (   8.56  )
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

Take the bits per color channel into consideration when computing DCLK
rate.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 186f6452a7d359f079662bc580850929632ea8fe..a714bcbb02de16267e7febbaeb1eb270c70aaef2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1731,6 +1731,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 		clock *= 2;
 	}
 
+	if (vcstate->output_bpc > 8)
+		clock = DIV_ROUND_CLOSEST(clock * vcstate->output_bpc, 8);
+
 	vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
 
 	/*

-- 
2.50.0


