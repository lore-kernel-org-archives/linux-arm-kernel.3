Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3D4CC6B20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 22:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYtilPzqPXCnIDuAgNHfH0KQUIcCbca4y5FMXD8c9rs=; b=fZV3Y16DPvu0cBs2atnrl7lwsY
	qZ+Zoo+O+J8ORixzWy+YgoSTwD3stE+HbSxxfax33gQPJPH/t6CC5NNoyNdKWMwWrtAFI3SNOv8CL
	LumK9yG16WIQgyoHM5vicemZRK7WIiMQFue/b3qNxxiqNzOmX0d2to3W23b5lTCrWqTt8Ag3NFHOJ
	7LzUMh21c6XA0j9mteQiBSA+b6MqkR9WYFgC55vL2nof7XS7ks63KwofVdrKf716L2/5HNRKud9fD
	bhO3Z4sKJ4jB6FCN4n3LeRiYWefCVCDZisUkc0/La6ToBE7i6938xoYavTVMDg4mIrKhaXIo+fv1t
	jvOlyxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlN1-0000000EC0i-1tDR;
	Tue, 13 Oct 2026 22:53:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlLn-0000000EAzx-03hx;
	Tue, 13 Oct 2026 22:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931919;
	bh=t4xm3scI4l7rWR2iBzxLstmE0RTUxpACdTblDz3oXNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CFVeqWm9bZ+b2qYqAyW6WEpI8vPhOwqd06tI38Fo7G+7VirPG5DQgRCp1R/nABSVf
	 qQkR8ZzJ2LDrzOleN4SQWWjn/3+1gVpn1cFFupHnNq/CE4/TZTjXWP9JzYv8Ddkh99
	 SOq3lCVBniNaGs5lVLfhwGI5xso2ykivJ8urd5cMpxubp41BZRR4La+NoP5e4dMm02
	 +LeLuMKMLWqjmEdj6+Tn2uNQZQIB5AmdZfQl9x1iHZYF36Q7PMqq+TA5mjhftczIVT
	 +usZqzS25oWkvGTZ2ARJG0braLal0GO55OFZEKUjClBPPAeKCTuWJ0/udB9/NJHQZT
	 SSy5iZ9kpRc9g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1726417E1509;
	Wed, 14 Oct 2026 00:51:59 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:29 +0300
Subject: [PATCH v5 12/15] drm/rockchip: dw_hdmi_qp: Do not mask error code
 in atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-12-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_155203_556301_9F6EB8E3 
X-CRM114-Status: GOOD (  11.87  )
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

dw_hdmi_qp_rockchip_get_vop_format() calls
drm_atomic_get_bridge_state(), which takes the bridge private object
lock through the atomic state's ww acquire context and may therefore
fail with -EDEADLK when the lock is contended.

The DRM core expects -EDEADLK to be propagated up from atomic_check()
so it can drop all held locks and restart the commit.  Replacing it
with a hardcoded -EINVAL defeats this backoff mechanism, making
otherwise valid commits fail spuriously when multiple threads perform
atomic commits concurrently.

Propagate the error code returned by the helper instead of
unnecessarily overriding it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260902230603.AF5C61F000E9@smtp.kernel.org/
Fixes: a18aa0dd7a0b ("drm/rockchip: dw_hdmi_qp: Implement "color format" DRM property")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index f2a1ea8dfefa..db1933d75ced 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -203,7 +203,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 
 	ingest_fmt = dw_hdmi_qp_rockchip_get_vop_format(encoder, conn_state);
 	if (ingest_fmt < 0)
-		return -EINVAL;
+		return ingest_fmt;
 
 	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate &&
 	    s->output_bpc == conn_state->hdmi.output_bpc &&

-- 
2.55.0


