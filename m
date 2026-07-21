Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2274C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUMJYK8D9vfLc1s2BPtc4WbrVU9XQ/XfambFUe9PKZE=; b=mRsVl747F+HhZf+0oavt7xaEJS
	K9VlqZljrHxEP7Z90s/q3hDKJkqg1z6KOvUo0yDFeE1JmLXnLjgOGTrpW0DjLkd42QCv/7AB7vl3i
	lK3gIwpSnxK39bA66f4mPOS4cMw+6JbSlaOR3Z3FFO6E2tDN23d0rKqGJnoxJ9Fra3YyMoqRFlAxv
	ogWS+4e5KozNyayknEit3s5OjOMZTqk+MwacmWoRrCSUt9bn3KVFWKS98oc4mMQzivCAnWEKAbfr3
	K4X2xMpoUXL3KqImSAjiZObR5EdZ8gd209tAOA9Ur7Kmifu9aeiCxxFS9mEwnVOjRTpydPnAysHAI
	DepcjM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEeB-0000000A6ww-0nb5;
	Tue, 21 Jul 2026 17:52:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEe1-0000000A6pX-1057;
	Tue, 21 Jul 2026 17:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784656358;
	bh=9OEEVTGH6CtYBorsugsyey8Z+5Bz4/YUYRXLfK0S0LI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZivdVdP33X3exby8TN0qv+TCDYL/lQl/TdISs605cXJL3ubhjEnYht3rvHHp6el/
	 Dc7QyyPmSgrz82rme9zJTxm+NwBJetDNwjiHU0VBh00pY0vxmBPnrmmFDspAxeSrOd
	 y+/oiPwjAip1JIoRfsrLKptb2QrM5vwD2r6rM3kkhgsUAefs38EzHoIvuuhcaK0evv
	 encYtz8WhAcoeTlyiujjTPjzjxfDEjuVCf8PVpvpAQAk0P/ZX7um6dpP3jzVfDsN+D
	 ReAQIalPAjFamOTSJsuxnTWFynNDS6wHQLPWfQGKWcrHzzj81y3ifEEBBL96z/ZxW9
	 0WrP5DA8gEFCA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E35B817E1064;
	Tue, 21 Jul 2026 19:52:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 99DAD480030; Tue, 21 Jul 2026 19:52:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 21 Jul 2026 19:52:34 +0200
Subject: [PATCH v4 04/10] drm/bridge: Add out-of-band HPD notify handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-synopsys-dw-dp-improvements-v4-4-f0f4a4ede712@collabora.com>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
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
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9OEEVTGH6CtYBorsugsyey8Z+5Bz4/YUYRXLfK0S0LI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpfseV3Iw/lPbZt2LprMMlfHmFycSj8HNlun
 7XgzmGmt5Ku2YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqX7HlAAoJENju1/PI
 O/qahgcP/0eop2idDCK50e5ARxK5ljSg3WSVEOfxbihD487+TdZamArvuOt8xWI4cHh4qAUbdyW
 +RpweD48urRKW1TL7hcwhOwqeWNdC9gsPdGlolg2HHRO41WEh7e5Vs96IdmPqw6G/CbNaqfNz4X
 zMxb+7oPrDCJJME66gYfue7/LvDAml7FnBoppX1yavtB09LPmA/14wJv6dE0QKvQvr/VQXyGITc
 oI0VR/L21FS2x1XdNu8YykO17Nx6Uub+36RPCUCYwmiVLyT79/asPwq6V3u+TpLQGCPnjpI0qaC
 qc8himXvBy/bjC73SytIfP9e3MkLa6ftXJTKBcrfg7imli298nz82rf7CzLOPrl3z5veSNbI3qf
 gpXiReU58AM81jnhOhaM+0z2FDhGWt1z16l/I6EEhec49v0ycvtoLbXglSpcUhY4GF0BKykJyOq
 mB6HHHHcNbP3V/nIB+1tY+hxxEe5/KQ+axbjWp5y0BPGVAiENHH2ExCtsDtHUXGsfJfVB7Nowe9
 P0NKsjIFP8VZeM1oCvHfvbPzB1ZN9ed4lqwhIYXtXErxS1ia1dAwnkju+1fycuGA3azq9PMCxzl
 grOKaG26l/USE9lgmuT0mHFH5OCWo0WtzesdHP8c7o19OiJrmGZSX8J8Akj/IlDq8P68yzTWk7E
 AYey8eHwLBva7Jo5yWsA2Ag==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_105241_455609_2A8C393D 
X-CRM114-Status: GOOD (  14.81  )
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

For DP bridges, that can be used for DP AltMode, it might be necessary
to enforce HPD status. There is an existing ->oob_hotplug_event() on
the DRM connector, but it currently just calls into hpd_notify().

As DP bridge drivers usually also implement .detect and that also
generates calls into hpd_notify, this is a bad place to force the
HPD status as the follow-up detect call might force it off again
resulting in all follow-up calls to the detection routine also
failing.

Avoid this by having a dedicated function for OOB events.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c |  6 ++++++
 include/drm/drm_bridge.h                       | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8b54069fa53a..632cc3ae3b54 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -180,6 +180,12 @@ static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connect
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
+	/* Notify all bridges in the pipeline of hotplug events. */
+	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
+		if (bridge->funcs->oob_notify)
+			bridge->funcs->oob_notify(bridge, connector, status);
+	}
+
 	drm_bridge_connector_handle_hpd(bridge_connector, status);
 }
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3ac84ed57ab2..f38010d2edd1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -540,6 +540,20 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * @oob_notify:
+	 *
+	 * Notify the bridge of out of band hot plug detection.
+	 *
+	 * This callback is optional, it may be implemented by bridges that
+	 * need to be notified of display connection or disconnection for
+	 * internal reasons. One use case is to force the DP controllers HPD
+	 * signal for USB-C DP AltMode.
+	 */
+	void (*oob_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
+			   enum drm_connector_status status);
+
 	/**
 	 * @hdmi_tmds_char_rate_valid:
 	 *

-- 
2.53.0


