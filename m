Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEF9C55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ea+bZkCNjldpdW5LJXsb6RfksFiwjMsn6ac/fCzIPI=; b=VtuKDvGkGrb/RJIaOkkFkqEGHH
	oZ/lscBQ99PAvPetR8DBhsMQWAdVmTXmJlX/L8b8AahI/Vqt2cDuvK1N1cZAGSJ6V8AYitZKSeuz+
	k4zBUR9fE2WDsN7TslTWqcT1TfG/fYvgUdgqvUGwt0+eO2ttYDIfh+wSZV+UTdoorhemcGiGD2iuk
	GHRj+RTCtnDokbMYY09U3geKpOv+F2a1c5OnIlufrdTgH3IO+qoWsCFEhcZ0opAF4YTro1JMLPSWD
	8YKIm4+W5qyg/giEYxCj4smfoXwEGEC7hHDHThOFW3Eg4WweKUxz9mVrWgpcByVtaFCLXjdlcbG3R
	3aL7sNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2Q-00000000IMs-0Q07;
	Mon, 03 Aug 2026 18:05:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2G-00000000Hya-2bzU;
	Mon, 03 Aug 2026 18:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780304;
	bh=31JR5ctnkUqP4a3j87tILTU3TX2Uxhcb2umS1hDJIJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nlo+VO/ZpwSGnB6wBmvvOovbVmGV24hwBlsE5KK6LZOf99QAh2Tx4jZKK8o/GNKWE
	 KUnExs1/wIgjdGdCplEqFcE92ijhG4+Pr1Dap0S64N3Bo53dmrl7w7okdZSZT29+Jo
	 MqhZWdXAF3REAQqValYUg3ZKqCbE0RWf77i6mnQ5ByPpEb0bSKxgNEM2pbAX9tEu8A
	 FXLeW1U86bMVTT8ao+ZLJ3OkmuipHHkjCGeN4L0hGGoFKRlEbrnYRBhq9fmZf2AXr1
	 ASzus5w+YZmBKd8syfvQnxayjpjvNSY+Yvdn7TyOANio94ES6DTKydOba1xzdcCCfT
	 Nto8eAX4QuG5w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 309A617E10F1;
	Mon, 03 Aug 2026 20:05:04 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6EF20480047; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:11 +0200
Subject: [PATCH v9 10/22] drm/bridge: synopsys: dw-dp: Support
 MEDIA_BUS_FMT_FIXED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-10-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3804;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=31JR5ctnkUqP4a3j87tILTU3TX2Uxhcb2umS1hDJIJQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E4bb2zzi9LBFhHjbW/ufrdTLfaLwFXie
 6Le8OjDbcF7WIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhOAAoJENju1/PI
 O/qaKQAP+wbs7PMJsZNyNvIO84mv9Lzrvn6H5T+BX8VgravZYj7iOHodB3hHLBTLcmsntcqzRL4
 Kr/JctFB31awnTylMiJ4hgsD9TiE37qZr5Zm8cOlnZ3zJgwmekOW6EDkxITv2T0ykYwr4/E9rVa
 rdid5dc8Wtmkrhx/JW/+LS1lZMq30RJgoZPmXcCkX1vsqHgT6tjoMec7ogyxSvrZhc8yUVka+i4
 CZv/XX06+yuGv4t+CospUYCadL/hPY4ZdE0OhpKFUVk8lAixi1MgMoy+LF/WxXfrhk6mmsK0U9X
 yJaxEXe/4f+3l+H5eNrsame5q/B+lR+pfPRNCfLwrKPhmcbQo4jYiXz+ktcCUNP7gIgUkeatep9
 M0lG8ykinrF5gMdXKP4xMXnZahEpJzHEmTL5G+rNaRNfSHT8G5kqY/MYGdGTii+UxAt35SSSfSE
 ilGxaYrywEHln3t/ZhnTmm9c+T1cGEXBDLKjAMpFMkt5ibcOgG1nUZkjUkyAz0s7srH+Y7KeHrN
 n2ofm+Wlo6CeuSJnODdCBlSH8aUrmoWziQhzK3Ej8FPFjQDyKXKuyq+OQ2JSmRteZQR/S2Opvgk
 +PIOfB1GwNOJ/EbL2tJcQb2rHzt7RpCdLYiT6NO13BoxY1HWeT6MaAWcMECAkPjCnG6NtOdrey1
 oFcQVj+lVFW9ALAze8uE4cA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110512_931092_C7F0560C 
X-CRM114-Status: GOOD (  16.37  )
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
instead. For decent support of this, two areas are changed:

1. In atomic_check, resolving MEDIA_BUS_FMT_FIXED output format by
   using the negotiated input format.

2. Implementing a custom .atomic_get_input_bus_fmts hook that, on
   MEDIA_BUS_FMT_FIXED, advertises all bandwidth-validated formats
   from dw_dp_bridge_atomic_get_output_bus_fmts(). This lets the
   upstream encoder negotiate the best mutually supported format.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 34 +++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index bde938b0d116..e60dab0d3b9d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1537,6 +1537,7 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 				     struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	unsigned int out_bus_format = bridge_state->output_bus_cfg.format;
 	struct dw_dp *dp = bridge_to_dp(bridge);
 	struct dw_dp_bridge_state *state;
 	const struct dw_dp_output_format *fmt;
@@ -1547,7 +1548,10 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	state = to_dw_dp_bridge_state(bridge_state);
 	mode = &state->mode;
 
-	fmt = dw_dp_get_output_format(bridge_state->output_bus_cfg.format);
+	if (out_bus_format == MEDIA_BUS_FMT_FIXED)
+		out_bus_format = bridge_state->input_bus_cfg.format;
+
+	fmt = dw_dp_get_output_format(out_bus_format);
 	if (!fmt)
 		return -EINVAL;
 
@@ -1823,6 +1827,32 @@ static u32 *dw_dp_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	return output_fmts;
 }
 
+static u32 *
+dw_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state,
+				       u32 output_fmt,
+				       unsigned int *num_input_fmts)
+{
+	/*
+	 * MEDIA_BUS_FMT_FIXED means the downstream bridge does not constrain
+	 * the bus format. In that case, advertise all formats supported by the
+	 * DP link so the upstream encoder can negotiate the best match.
+	 */
+	if (output_fmt == MEDIA_BUS_FMT_FIXED)
+		return dw_dp_bridge_atomic_get_output_bus_fmts(bridge,
+							       bridge_state,
+							       crtc_state,
+							       conn_state,
+							       num_input_fmts);
+
+	return drm_atomic_helper_bridge_propagate_bus_fmt(bridge, bridge_state,
+							 crtc_state, conn_state,
+							 output_fmt,
+							 num_input_fmts);
+}
+
 static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struct drm_bridge *bridge)
 {
 	struct dw_dp_bridge_state *state;
@@ -1869,7 +1899,7 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_duplicate_state = dw_dp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
-	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
+	.atomic_get_input_bus_fmts = dw_dp_bridge_atomic_get_input_bus_fmts,
 	.atomic_get_output_bus_fmts = dw_dp_bridge_atomic_get_output_bus_fmts,
 	.atomic_check = dw_dp_bridge_atomic_check,
 	.mode_valid = dw_dp_bridge_mode_valid,

-- 
2.53.0


