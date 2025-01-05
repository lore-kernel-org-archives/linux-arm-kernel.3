Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA66E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 19:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOuDV8a14zXoIoSeFvjSZmd07jSEQLJMy50etppxByE=; b=pUf4WAGD/VH8gDngAgr/llTivp
	m69rBmopebkkK61Gvn1Nu2kcg2e2uhyi9iXdL+6sOepf3Gxn0WpArr2Da9IGO47ezYgo7Ab0ZH0ap
	vRgVhBwOsJ4BbOUJK9PsaKKOJQuZD+rzcRoGBUiB03ZrV2x/z+uW8hc1lbG52kJLBRzqcjcmdaL3k
	HHzCj3ZGVWhCy6aERkwpxtf55YvOaUgdptbYrBDxTorp899chFU5VBnGB8YjJ4wlzGkoFPmwHQDS3
	vewRqq48ZLT2onJBtlCREK9By8M/iznQLcb35LaZgtDye2Vxy7y/U9VG5r8ap44/Ix6cZiaevIudN
	pRtZirZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUW0a-0000000HI9R-3ZFZ;
	Sun, 05 Jan 2025 19:09:56 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVyH-0000000HHvz-1xf9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 19:07:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBC74104811FC;
	Sun,  5 Jan 2025 20:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736104049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOuDV8a14zXoIoSeFvjSZmd07jSEQLJMy50etppxByE=;
	b=fqVm5ZlVF64yMGqkhmXc1JZKUP0YaZCtHd3rtYMxRb43FkbnhAruX/L2doszWy1IVk54AB
	jxLJQZv56VpyoNrLoE9cgX2BaeiWZouSJAGUULwNfmyZxeEBPyVl/s+PZQMBaTJ6+oEr8Q
	VEYhOkJPkKTPpqttwl++W3loV56O5FV0S5mJTeDhNc2pZozkHIEMxwLaD2vSE65tIEGbaJ
	j/VjMYq5v7C71i9Eby5eSSlIRrkmhSP9PpizTmthZYZ5QzNyKrgL08EJEeXdoA6JbdhPub
	tsB4iuRu0oT1Cii6LdotfL+NazokwyDDFO4FqXMiRrXEIyEa3YC9cE/mbntPwg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Sun,  5 Jan 2025 20:06:04 +0100
Message-ID: <20250105190659.99941-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105190659.99941-1-marex@denx.de>
References: <20250105190659.99941-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_110733_647019_0F62E32F 
X-CRM114-Status: GOOD (  14.77  )
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

The dw-hdmi output_port is set to 1 in order to look for a connector
next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
The output_port set to 1 makes the DW HDMI driver core look up the
next bridge in DT, where the next bridge is often the hdmi-connector .

Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")

Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
the oldest commit which adds HDMI support is commit:

3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")

That already contains the HDMI connector node. Most follow up additions
of HDMI support to another devices has been a variation of the same commit,
including connector node, which is the proper way of eanbling HDMI on the
i.MX8MP.

The rest should be covered by output_port_optional which should make systems
with DTs without HDMI connector node work, but such DTs should be updated and
the HDMI connector node should be added.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: No change
V3: - Update commit message
    - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
    - Enable output_port_optional
V4: - Remove select DRM_DISPLAY_CONNECTOR
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 1e7a789ec2890..3d63200e468bf 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -101,6 +101,8 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
 	plat_data->priv_data = hdmi;
 	plat_data->phy_force_vendor = true;
+	plat_data->output_port = 1;
+	plat_data->output_port_optional = true;
 
 	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
 	if (IS_ERR(hdmi->dw_hdmi))
-- 
2.45.2


