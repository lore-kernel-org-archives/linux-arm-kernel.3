Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437DFC55181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSVGt/9SlrjuK/ZIX6ZAFF3RPTSVgBjbBKfDXd4mUBo=; b=jnOEOgSuRFcibZHHMnJGdo7aAF
	RsZaH4PtX24P323EDZQi4aNm2pywEHaf7klAD1ge4mPJeDR3HJZSVPvhtumSC5iIvv88QGYu1BLU0
	i07YnkW7gqwhSvgro4O9tSHS+He4TZK7Y8R6OVK4/E691RQUgdANI/pRoaAKlsoh2CWhD0tN+E+hb
	qJ6tXuX4U4UfuFL598euSXslLoaTy2Y73xsRRwqL7UWiZ0YR1DB/zsbCBHXSZYiFzPw/qGneIM+gU
	t2lFs3cfKPDOwMlfxwdGFORBHSHAalf3yqTX0/r6g2rVBLQYyY8mHbhXMmjvOc0uFN5nO0Rk3YTMo
	uloP97Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxL-0000000Cywx-38Yx;
	Fri, 31 Jul 2026 16:19:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxB-0000000Cymv-31lC;
	Fri, 31 Jul 2026 16:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514756;
	bh=LoKeK7pz3tUS/HI4nQVJBEnI7or53/FZb/3CkVSEbPw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QQM1/ODCZaPF1EY3Nxc7TDsGlmIpqDCOp1EloFd/Dg0nSRCI8T0Yua4Xa6iFFl0EQ
	 93L0dJXf4MvpSKPTrnZAoSll5FcXHffJWev2kM+iUT1VIky+BM8eqQjKbboK/cBqCD
	 v8jvuh5ULLoPfn4lFhAgNl7UfCwyLP+KTMafOUsQ/RwnfXG09kVG58/P/P8SfV3oIo
	 9Z2r0DVtmbO2ReeYVgWBLAMST73ftdx792z/gqpaqAzHBKjzaDb7hDh7Pnbl/gDVi6
	 krHJpbQkBGyYr5MQlQ+ouHuzD48rdOhbnsZzKc4qyUjQfnlowx83kkaJ2/dk31XZ5J
	 p5w1n8oDumsmg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34FF117E0700;
	Fri, 31 Jul 2026 18:19:16 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:09 +0300
Subject: [PATCH v10 02/69] drm/connector: hdmi: Handle reset() state
 allocation failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-2-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
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
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091921_938516_FCEF7423 
X-CRM114-Status: UNSURE (   9.62  )
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

In drmm_connector_hdmi_init(), if the reset callback fails to allocate
memory, e.g. inside drm_atomic_helper_connector_reset(),
connector->state will remain NULL.  This is unconditionally passed to
drm_connector_attach_max_bpc_property(), leading to a NULL pointer
dereference.

Bail out with -ENOMEM if the reset callback leaves connector->state
unset.

Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260723015306.C94241F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3..0e39431e85b2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -628,6 +628,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 		connector->state = state;
 	} else if (connector->funcs->reset) {
 		connector->funcs->reset(connector);
+		if (!connector->state)
+			return -ENOMEM;
 	}
 
 	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);

-- 
2.55.0


