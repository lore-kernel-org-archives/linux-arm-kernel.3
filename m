Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35B9CD98DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 18:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJ+PTA26wHi3scybqtQuyaUNa8GCDIP0SRt8KGgTNBE=; b=uWmheZaZZZ/0Is25n58/z0mQE8
	cZExIco8We0vyOxrHUtmdLXSGGA8jbMhFXISYJTiX1I+Np3p4RVe+jAxtnNi3HKEMhNxQ/sCwRJq3
	ssude/esk5DGPPrSkBQ3U23O9lcPxl3gAtv2kTNVy/t3HooamzA1BW4dNCTpkAFsTwnnpjgrDFwGs
	TQT5BYdDTaq5Tljh5nsJ1BGaRP5bl3mJlg392Ku0k+Uut5FfTlXghD/lgoFh/3AK2y696dPNrcwpT
	c0utvcIq4r10kxP7IWhtElmMToK8aXFirIsb1MJUwwgd1dqld0bvarzVLtQ8ZZsfxy98WVZAlXBeP
	VW+Gp33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY6Bn-0000000BNKZ-2I7a;
	Fri, 12 Jun 2026 18:01:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY6Bc-0000000BNBK-1z5j;
	Fri, 12 Jun 2026 18:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781287253;
	bh=5FzH6D5Iw4bwqKNNxbyE0JcWBKVjdha2iUi0EcsbYIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mn6NU/hTtRNg6T4zR43ki/rvnjc6wDbUJlzZ4hAvpEAEeKyEpPLQX6myxrdf80azD
	 wr25yq46MjKk2veZC+flr5do8MFVqn+mS84nKfhNHV8Y42H4++2IxJOBjG8BKox2Mx
	 PkhG3NKtWFHYtEUyQ75okzQwHp5lIlRgBnl2VwcgklQtGJQo3l/8hqLRVG8DUijd37
	 Ja1ePeC7BxzT27oUy7IuME6rLOYw+7llVPXe9S6m5049yX9vW+zCV5uVDyse2i+ujD
	 OYKkAyt3Jw3JaSrbutO1b/tMa43kScvl2Z0jwnviob700E7XnPDkPzZRun4SmLr5dd
	 WqZQV51kWv0eg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC62717E0D68;
	Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7D45848002F; Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 20:00:50 +0200
Subject: [PATCH v3 04/10] drm/bridge: Add out-of-band HPD notify handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-synopsys-dw-dp-improvements-v3-4-dc61e6352508@collabora.com>
References: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
In-Reply-To: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2384;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=5FzH6D5Iw4bwqKNNxbyE0JcWBKVjdha2iUi0EcsbYIg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosSVTaZMcIYkPg0WvAY1uZHxTpvSJcLp/dT
 VIv07+Du0SvbokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLElUAAoJENju1/PI
 O/qaY4MP/2ti0fNHRbgVMfK2R+vOPcMwsOulVHNk+tfdSC1ZxEboAHes1tiJTM1cjQZ4gM349sB
 8RK+nlXVJ+B9e0ip9ARqV+k5MvMQWEknIB7s8n8MBXW4dyohxS2yzVpMlzl3mFe8RY8XGf+1zYW
 2j2EZYvL/TaWQfbCfwE3h4Nan/mn4k12R84Q6wvawkTNn0/dRwmTZ1MqHir0k196E859kildFaF
 AG+Mhb71K8QnCpuaaHPGIRnDl3YVnBLgQSNLNphPWjbrJZHvwH+FBaRMwhhtYnyZNAH9VfTIDax
 vgpkXqqhMZn6hX3BRItO/tISm0Gq9Qy1Jk1FysVu6ZWaZE4RiN5ebgmmj25VkUaI/aI+JXx73Io
 c/yQsy2CWfvDzns++vYJDNtn6m2qEpolKY1JdqUBxRMMbyi5QdYhDrPX3SUoRc9tmpnmci0ZaZZ
 IY3ew7T6/zVe0L4ZZzbQQ2XM6zgELM3+OULlXPfYx1s+nWlnxSlbCx/CBYxT6oIqLvuQBL9FrBd
 MqPYsxuQnVKOUTb7IqhobnMFE4jCII89nZLTR565tQEmi5rUQKCccrNYxeHCYpWW9OR/ZASM8KB
 WoWvdsGmJNzzTvQIWeKEb32Ry+Idbi0nVXWGkdl3op7lte9gPfuKBzbLT/DGr2SiryrdDluxVBp
 qOmODRlBHmWVObUNAVOgvjw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_110056_689157_51A8937C 
X-CRM114-Status: GOOD (  14.56  )
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
index 92f8a2d7aab4..802b5677194b 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -180,6 +180,12 @@ static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connect
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
+	/* Notify all bridges in the pipeline of hotplug events. */
+	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
+		if (bridge->funcs->oob_notify)
+			bridge->funcs->oob_notify(bridge, connector, status);
+	}
+
 	drm_bridge_connector_handle_hpd(bridge_connector, status);
 }
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 00a95f927e34..11802e39d1f1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -646,6 +646,20 @@ struct drm_bridge_funcs {
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


