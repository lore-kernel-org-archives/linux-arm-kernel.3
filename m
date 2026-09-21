Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC29C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrH1BPLpuLOqQDQpOONb+r82Ea0xWENpicF6PhqY/S8=; b=XiIrYNiEjl0oHSo4tFGrdQ6tW3
	lnKqoitg4bCXl+wHShAZ/g9BSwWEIf3sgCfzo5Nru42MnUQdS51xnS9ckH6hO4zuc9tgiBs9IYdhP
	y1SvxDypbdpeJSCfdRkOVOj2SmCM8xLzv+hAOFXaCcAoK1o0oFAsWcbRhJ0kOSNdFBwKw7hrnDAzs
	diiLK0pE0EevM+bUw6+TdrHy6abdsF8I1aGl+t6RGEh1rF+bHi7VL3qdWEZYg5Zi5kiNveogAIFRs
	CzjSvkW1i2CLIPdMgp8mkBDwsntguA1L+0jdiKrMoJaqvzUQFxDygoMgePXvZx0lACCC5NdHxRlbk
	oguffzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLB-00000002i00-2Icq;
	Mon, 21 Sep 2026 15:54:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gKo-00000002hha-0AEL;
	Mon, 21 Sep 2026 15:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NrH1BPLpuLOqQDQpOONb+r82Ea0xWENpicF6PhqY/S8=; b=mboP4kLVmThrPoEtkuxZcDwHBC
	t8JISQ0LktkCHVKqHiz+cngpWfs/sLv36mDSQarkqzkcignK1F1tiHCAoktSULV04MSK7geIWuguN
	G8o0w0t0lQPxXzVCQhEpVtbLwg8RPdPG3qVyDb/CTehxbsojNnvW05UeQueRVAD4lkBT8v2vHcSeS
	IU8vQhxc8xKPTTiw3Kv6svIeIuqC1jdjfYn58QCkOFH4sbK/dEdkvDLoc2D0vSWaox04NJ6Z0ru9+
	lO24ObSDQPHDGmPLQM4J+s+ovLfvkd6BZz3wrSOhWQ2zDzJGYR85niuN4CQnOOPPV3kQd+MZd12Zz
	aJJa9nbA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8gKj-0000000CVQg-38Rk;
	Mon, 21 Sep 2026 15:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790005967; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eXCGYJemu4BVEiqC5856QnRCmHqKrEkFRxM0YUtesxCydeXdKQPq9fJXqcKdysNNd1q5f9oHd6alHOvOWKnkVxafl+gT+czPlez0JpXNaDktwrIW4GrLCAashst6cEJY9n3SfR2pWMtNmuzrWyqZuT9UaVjwk4MSZjUsaw5H6tw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790005967; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NrH1BPLpuLOqQDQpOONb+r82Ea0xWENpicF6PhqY/S8=; 
	b=LBgNiCsPouf5SGKErMhoq7Bl/06lEezg5d0KulEtR6QJRS166y3Obn3fHWs1reLiKPxKZMN5EQcHfDBdSXENZaeFDOrTYM4b7LU1HBnEJGn2kOXoJZS5lGyIgxdW0VGzXEwitNR8yt89f570y5GXYNoI3Gi7hZNZyLo5veqlQsE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790005967;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=NrH1BPLpuLOqQDQpOONb+r82Ea0xWENpicF6PhqY/S8=;
	b=eoObOOP2Dc5eRhtDEA2ShosHM7hJxzu2HeIFqOlzIQExUrtPWD/UdiB0t2dDRNfw
	gpUucXuH46qfDDPYyQMBuq4n4AMDGVkcIQQWzUGtfCJtRVUsndEnQGCFdf4bN+qY/hM
	iF5/yDj8eu6yLjPmcZMZihVDmn/Zvr92ihZu/Hsk=
Received: by smtp.zohomail.com with SMTPS id 17900059663881006.9027491955;
	Mon, 21 Sep 2026 08:52:46 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 21 Sep 2026 17:51:34 +0200
Subject: [PATCH RFC 08/25] drm/bridge: synopsys: Add VTEM EMP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vrr-limiter-uapi-v1-8-2fcd7d011646@collabora.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
In-Reply-To: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Derek Foreman <derek.foreman@collabora.com>, 
 wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_165334_886772_5FCF467E 
X-CRM114-Status: GOOD (  13.50  )
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

From: Derek Foreman <derek.foreman@collabora.com>

Add code to pack and schedule VTEM EMPs.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 50 +++++++++++++++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |  1 +
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index c9568aea98dc..3315082d4475 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -673,6 +673,15 @@ static int dw_hdmi_qp_bridge_clear_spd_infoframe(struct drm_bridge *bridge)
 	return 0;
 }
 
+static int dw_hdmi_qp_bridge_clear_vtem_emp(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_EMP_VTEM_TX_EN, PKTSCHED_PKT_EN);
+
+	return 0;
+}
+
 static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
@@ -775,6 +784,42 @@ static int dw_hdmi_qp_bridge_write_spd_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int dw_hdmi_qp_bridge_write_vtem_emp(struct drm_bridge *bridge,
+					    const u8 *buffer, size_t len)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+	u32 val, i;
+
+	if (len != HDMI_INFOFRAME_SIZE(VTEM)) {
+		dev_err(hdmi->dev, "unsupported vtem emp packet size of %zu\n", len);
+		return -EINVAL;
+	}
+
+	val = buffer[1] << 8 | buffer[2] << 16;
+	dw_hdmi_qp_write(hdmi, val, PKT_EMP_VTEM_CONTENTS0);
+
+	val = buffer[3] | buffer[4] << 8;
+	dw_hdmi_qp_write(hdmi, val, PKT_EMP_VTEM_CONTENTS1);
+
+	val = buffer[8] << 8 | buffer[9] << 16 | buffer[10] << 24;
+	dw_hdmi_qp_write(hdmi, val, PKT_EMP_VTEM_CONTENTS2);
+
+	val = buffer[11] | buffer[12] << 8 | buffer[13] << 16;
+	dw_hdmi_qp_write(hdmi, val, PKT_EMP_VTEM_CONTENTS3);
+
+	/*
+	 * The remaining registers need to explicitly be rewritten even if they
+	 * stay at 0, as per the hardware documentation.
+	 */
+	for (i = PKT_EMP_VTEM_CONTENTS4; i <= PKT_EMP_VTEM_CONTENTS7; i += 4)
+		dw_hdmi_qp_write(hdmi, 0, i);
+
+	dw_hdmi_qp_mod(hdmi, PKTSCHED_EMP_VTEM_TX_EN, PKTSCHED_EMP_VTEM_TX_EN,
+			PKTSCHED_PKT_EN);
+
+	return 0;
+}
+
 static int dw_hdmi_qp_bridge_write_audio_infoframe(struct drm_bridge *bridge,
 						   const u8 *buffer, size_t len)
 {
@@ -1000,6 +1045,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.hdmi_write_hdr_drm_infoframe = dw_hdmi_qp_bridge_write_hdr_drm_infoframe,
 	.hdmi_clear_spd_infoframe = dw_hdmi_qp_bridge_clear_spd_infoframe,
 	.hdmi_write_spd_infoframe = dw_hdmi_qp_bridge_write_spd_infoframe,
+	.hdmi_clear_vtem_emp = dw_hdmi_qp_bridge_clear_vtem_emp,
+	.hdmi_write_vtem_emp = dw_hdmi_qp_bridge_write_vtem_emp,
 	.hdmi_clear_audio_infoframe = dw_hdmi_qp_bridge_clear_audio_infoframe,
 	.hdmi_write_audio_infoframe = dw_hdmi_qp_bridge_write_audio_infoframe,
 	.hdmi_audio_startup = dw_hdmi_qp_audio_enable,
@@ -1118,7 +1165,8 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 			   DRM_BRIDGE_OP_HDMI |
 			   DRM_BRIDGE_OP_HDMI_AUDIO |
 			   DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME |
-			   DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
+			   DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME |
+			   DRM_BRIDGE_OP_HDMI_VTEM_EMP;
 	if (!hdmi->no_hpd)
 		hdmi->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
index c07847e8d7dd..6ce87064a267 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
@@ -210,6 +210,7 @@
 #define PKTSCHED_AVI_TX_EN				BIT(13)
 #define PKTSCHED_VSI_TX_EN				BIT(12)
 #define PKTSCHED_EMP_CVTEM_TX_EN			BIT(10)
+#define PKTSCHED_EMP_VTEM_TX_EN				BIT(9)
 #define PKTSCHED_AMD_TX_EN				BIT(8)
 #define PKTSCHED_GCP_TX_EN				BIT(3)
 #define PKTSCHED_AUDS_TX_EN				BIT(2)

-- 
2.55.0


