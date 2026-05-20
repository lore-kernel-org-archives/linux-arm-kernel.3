Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EC3CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUhYmQC0oLHlMpF8CQiJbpLyulIzG84PGqeYlj+RNt0=; b=zuKpFmlI5n7iiU4UYH0/qUHrHm
	ib75AMjOkeayIwtTT39NN+Ikw7aPGSMI+ShZ8wRdx9zVh2pzcfFNIX2x3AyuPQ+VIGFig2Lbsyk6F
	ixx3uJ6CKMPXyPPrgUM5RNUSQ0/5dlfMNONdP8xez77OgDnH6V/Y1sJhdlybha+MklYNAErR0dmAz
	766Gl6Ji16x9swSt64H9O4dj7zuxt/UQSGW9wVXLlFGXx+np8quYAaxKqgeLDsUomLDMZYs3U2/cM
	JQGNRhs3Lp1AKJvYzuWOVpU+kteoYu2BHQA2hOSFHbJmX1xpyP/6OhTYT9kSXEgNMI3jkNNQ1Rkf6
	rjkEb/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlok-00000005T31-3SgU;
	Wed, 20 May 2026 18:38:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloV-00000005SjS-12Wq;
	Wed, 20 May 2026 18:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779302315;
	bh=7OTwCMF8wJOc4Hjs8SJmTuTCvuPd0TbfOCgAGCzQHM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H6vyJyDrGEn7ej8lwfh6solQE+7LKI83GMwsBcmJEc0XI2SvuKtzPjAq/szGt+jAb
	 lhJ+s5loC2TP9fbe5RvSipke1pfgJpxCy+u4gcLc52sd5EvalqzH96wyMquroTDMu8
	 ynXCKhxlEtA1l+I11i5albHffQ7Q9Hg3FGO0HoOl+nSRO/VMSgHjRm6osR/mnvUdAf
	 khNhEemb11w9/IbKhsALykPAvioDMFL21EfIia48FV7rHWPssdBm/4ZcPn8OGV0qF5
	 8iJKQ+xKus6q0OR0exCv4CdaKuVlY6nok+j3za8xzt8qHrkGIY08/QHg47O7TQ5TGA
	 OEYwTzZCGIaHg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7EA1817E14A9;
	Wed, 20 May 2026 20:38:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 20 May 2026 21:38:17 +0300
Subject: [PATCH v6 06/22] drm/bridge: Remove redundant error check in
 drm_bridge_helper_reset_crtc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-dw-hdmi-qp-scramb-v6-6-24b74603b782@collabora.com>
References: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
In-Reply-To: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113839_463001_881F7061 
X-CRM114-Status: UNSURE (   9.90  )
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
2.53.0


