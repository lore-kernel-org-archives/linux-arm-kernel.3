Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4F0FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buYulQxvTlwfWwqEol3vAGsEg0H2py3IwPBEqxlnOrw=; b=qsusWwM7U0FbkeBQ3NseVbDDG9
	T1Bs7dEoTMdhgoiFCpmR+AxxoeT27qWVVt2I+vued4JUtQASItXZyb/2ENgb3vUPoH9rWWwG1o/IB
	SPrPB7AUQXiJSgfKxy1JeOAdz0YfBBw3trKHcjQ+H8N6XeLcfzDlrw3HuErpVhI3vWmpvVgNU1sJm
	WrKm0NTOZkDbXgh1Fl1DEOebTnI/M5cdLBqrD7MAEEc0jMMKTEHVRsxshbKv3E52Ki+KP3wcKN6WN
	gd5h1dGP1Y27jmocfujPVM3Tw7fMoQMHxmRjq1i3y2BFRm6oa3PR9x6M3WqzuOgN8MA80FU13fxse
	UYh9KkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkR-0000000621u-3pYO;
	Thu, 30 Apr 2026 22:20:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkP-000000061zr-0Wgi;
	Thu, 30 Apr 2026 22:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777587637;
	bh=RoqNrdAtIntnzN4QOoLbPlCuBCUoD2sMXqW3kckpQAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GWI+RietXIAZYicTQXGoKZhc2qZkXpjGOgSuGzni4ZQ9budFThyBRHSDhus+A9Ynr
	 1UD4QvK05mL7AREeY2y3wdJLTPHl58qHsMMMzNKi8PthFbqCQl772aKNpqc4DHj7dN
	 5Rt0pnj3FlTnyLIZHEDJiWGx7/B1ov9TYNKei/YMgiW9Ewtqt+Md3tybeGZfrNpYeo
	 9YoaB6FivXn2z31bEpJuP9wbfEKkaMjB9OTGYYPpsrOTuT3ZWgG+vEiiO9UVrrvbr8
	 NaPySu+DvkzIVUjeMpVFUMri48FPOnRYe3GYzPw07QpI+/ro1j+2BdGHDK9iM91Hkp
	 yLnYMww1DOtGA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6238217E1562;
	Fri,  1 May 2026 00:20:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 13F5C480035; Fri, 01 May 2026 00:20:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 01 May 2026 00:20:31 +0200
Subject: [PATCH v2 04/12] drm/bridge: synopsys: dw-dp: Support
 MEDIA_BUS_FMT_FIXED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-synopsys-dw-dp-improvements-v2-4-d7e7f6bac77f@collabora.com>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=RoqNrdAtIntnzN4QOoLbPlCuBCUoD2sMXqW3kckpQAE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnz1bTefDuFjSHuihDXrELYSzaun7I+ZlT+m
 mxxpvWrYpdWN4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp89W0AAoJENju1/PI
 O/qaa5sP/iwrvtecrjTownz8Bo0+JyHuIwTUhK5bIst+pr9q3+WvFHbhZOTcYmpkzK+X59Jufvz
 2DXyGs1S2nXnHgRDLR6xct6pFSGtNI0OB9etoPDlDLrex24L6G04rhx+bCDOz2opPwIA+re9od/
 Zxd55iPCVnaM93gR9lLvWSi1JedK72llKvAvnHhlCfRFWfTX5354xvi/vg7bl+QYRGXpLdUlPKS
 tfpR8riYvMIz2fri1NQLWv7IKZogfWzI4rtPqQMlgW7g2gRFPWlCMY7KUcIT9xW8RUShdo25VUx
 I1y+2ArSbrwabIubYkIidpUIAisNd6u2Pa3lAhohlaojw3X/cxgc6UV4sd3vZEuolXd27+JGnxQ
 qSHTwGKxRzO5rXhK1tfVKMq7pfi5DOTbSutnlPa+toLqtEsTmP/ViUZeofxEbYOpEPbQA0tJcbp
 DSY6dF8vNfwzH85UubNKxPwNeV9+7deMxNfGSaH66/3w1CPqH2LIV6z2MqxQGe96y4LSTlyrMWs
 wOZcFVy2Ls1aLdlnk3MF5r7aEXC+Yi9UkBaECYvmstOoGpXmm6NpW0g5gB/MqQ5AA+Yvwe1aDiS
 b3956nSzw83cQ7tQuDtfQmqT4K3ZX76/RmqBPti99o+zZdzNiFhIJsCwDvRq0ltVQrPXSSPdjYH
 RI5+yReX6L6ky8hC1g9Y3lQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_152041_330473_8FE49699 
X-CRM114-Status: GOOD (  13.07  )
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

Add support for MEDIA_BUS_FMT_FIXED, which is e.g. requested for USB-C
DP chains as the last bridge in the chain (aux-hpd-bridge) does not
implement atomic_get_output_bus_fmts(), which results in the generic
drm_atomic_bridge_chain_select_bus_fmts() code using MEDIA_BUS_FMT_FIXED
instead.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 6211ba6ba7bd..fc4ddb7792d7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1528,6 +1528,7 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 				     struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	unsigned int out_bus_format = bridge_state->output_bus_cfg.format;
 	struct dw_dp *dp = bridge_to_dp(bridge);
 	struct dw_dp_bridge_state *state;
 	const struct dw_dp_output_format *fmt;
@@ -1538,7 +1539,10 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	state = to_dw_dp_bridge_state(bridge_state);
 	mode = &state->mode;
 
-	fmt = dw_dp_get_output_format(bridge_state->output_bus_cfg.format);
+	if (out_bus_format == MEDIA_BUS_FMT_FIXED)
+		out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	fmt = dw_dp_get_output_format(out_bus_format);
 	if (!fmt)
 		return -EINVAL;
 

-- 
2.53.0


