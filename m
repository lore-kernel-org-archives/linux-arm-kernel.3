Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414D8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bn5YXIcFILcy8+D6koE5PJVirhIe/szeX2l5bXBcO4=; b=pCV2Klyx5stkJKA2B15k7sdnln
	P+raiAiQf2N0QotZjysNM/eA5do51MRSgIvBUJZdBOk6cAlQ0zDaXguf9Ge/Witfg7fc0p81NTArx
	JcEvM7EJLZ8h4kI5qHkYpnBwVZ/GczH9eS0un6+P4oyafBenPB76bULOJoFi7fU1vELplA0ndaQZI
	rkzRv5Mk9MhBWbHJmmrs7qc6Of2uCJi7hwlzRUKwSPF8SAZjTa/6r2gMrRQ9eCdTREOJX6LrdqLKU
	HCQ/93CJsdwPxJqcVcuXEIstKvOQUKTCCrjq232rMzoEeR65u8VF5CJC7iZa9PL4d/08c5fKTgqPY
	r5J+4gKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDp-00000003H70-3eoM;
	Tue, 29 Sep 2026 10:38:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDL-00000003Gpd-05x5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7bn5YXIcFILcy8+D6koE5PJVirhIe/szeX2l5bXBcO4=; b=E2nRzBTlk5/yZh0J8wIOup2HKn
	jVprIDXOVNmSzQfcj2WjrMWIERfDcEbP+5kqTq3N9HmCLHT24mLWNdrLDjk962ihFMPRC2rCaHTa7
	QmZ5l0VuQR2IYvXnunUgu43bvBdQSUp33Bchlz21u9maxbxD/J3D6cGxepa+CaldDgsHV8NU7FHjF
	xb2wxfKhZcVlf4zgykCtLJvRXuSAK6r/vzWuQF+e5W6enhfvmTOL79n655ekNgZkzSbsutaSC0sbc
	/ChSsEBhs1KRinXn+HbiEMhbsu6kdDBwJJLfHS2PyvuF5JI0ceOkc/DKPeyCbz+P67+NPo3qQZQuW
	gYLBrisA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVDH-00000002VLg-0dNF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7D3694E410B7;
	Tue, 29 Sep 2026 10:37:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F595601BD;
	Tue, 29 Sep 2026 10:37:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78C41103295E3;
	Tue, 29 Sep 2026 12:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790678244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7bn5YXIcFILcy8+D6koE5PJVirhIe/szeX2l5bXBcO4=;
	b=RfgxFsQpYr8nSMemqAsTUzlMVWLzCV5fkIAi0yP1d53ux0NqMYtlmCirLOLFrHyf3QQlOX
	JUtF1Ong+v9YcPAtrHan7LADmTvTegVgSKQ9klVPjQukj1Zk1eNNz4uKdF/6bvcUspZNDA
	UHvdmdHMS45V8PO9GFOTlyEhuBwTLRtDL1Y8D2QTtqxKqObAMALV6izccg741TtMNnqjgP
	4ZxdsxP96j8sY6iN6FREoxWeECnZoffxZQgYMr+YdaZA4tbu+5nfIRGqyfLo7QADS9MPOc
	HuMpspvg38N5JH6NjasFIBKx+hTxWvYFOL8wFtO7Zze6+AjbfEQ2yNbDw6zrCQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 12:36:38 +0200
Subject: [PATCH 6/7] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v1-6-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113731_823618_A5845CDA 
X-CRM114-Status: GOOD (  14.80  )
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

devm_drm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put by using bridge.next_bridge.

drm_panel.h becomes unused, drop the include.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 0148f2befed1..30598738cfcf 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -35,7 +35,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -555,7 +554,6 @@ struct vc4_dsi {
 
 	struct platform_device *pdev;
 
-	struct drm_bridge *out_bridge;
 	struct drm_bridge bridge;
 
 	void __iomem *regs;
@@ -1165,7 +1163,7 @@ static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 
 	/* Attach the panel or bridge to the dsi bridge */
-	return drm_bridge_attach(encoder, dsi->out_bridge,
+	return drm_bridge_attach(encoder, dsi->bridge.next_bridge,
 				 &dsi->bridge, flags);
 }
 
@@ -1749,9 +1747,9 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dsi->out_bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
-	if (IS_ERR(dsi->out_bridge))
-		return PTR_ERR(dsi->out_bridge);
+	dsi->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
+	if (IS_ERR(dsi->bridge.next_bridge))
+		return PTR_ERR(dsi->bridge.next_bridge);
 
 	/* The esc clock rate is supposed to always be 100Mhz. */
 	ret = clk_set_rate(dsi->escape_clock, 100 * 1000000);

-- 
2.55.0


