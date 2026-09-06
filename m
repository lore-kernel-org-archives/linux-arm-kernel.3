Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA48C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F9xCmB2n+lLj6Lxf5ydEPeDJb7JUokXtCFqsV9aq1YU=; b=C5j75xfZUmVeyPO3xQ4Q0csbjy
	UM+WjdycgAW/OB5fIMElZjphv2O9KsLhTnZkxhZVybkQS1kjvQVFChubOfRJAYU6mvsLkhiokgWPk
	clgyhuAB7lPYc2lJIRkiuZd9q1HGIOOxRD7kbNzDMK376ubWxa7VqK+awM4dcU1UC8ipZFaL+2etB
	4fJQq5KYk89o+wG9oCrvUy/Jm4Cz9YSK8xr5yCm3Rg4+AJA0I5/uwybW0OQIA/SqOCIbbhvEgVvr/
	omZ0HdLtMhLLrj5XTroVG414MhcJUm66Y8GpIqLQH8X3pf7rNcAFWCMlQDqgTwRu8zpH+kevlpwE5
	QFWfWQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ImP-00000005WQ4-26S4;
	Sun, 06 Sep 2026 19:43:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ImN-00000005WPi-2YdH;
	Sun, 06 Sep 2026 19:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EE82601DE;
	Sun,  6 Sep 2026 19:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C8ABC2BCB8;
	Sun,  6 Sep 2026 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788723830;
	bh=0Z9VlpA0raG6r7XokDnQP1FPgmzr6zyFAP4bptvzFbc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FXgathLCtZ92nmpHgh1MgOPol30uGB1g34FojDDPo0uKFAGEp7U9lvJ2NaI6X7j+p
	 lCH1zcv17uN6R6K4aE/UsiNIWFz9rA56TI57H7Qn5XHT1qR92dW27FpygEiZwIwc9S
	 x8Dwn0NET3Mrik+dUAScxc/BeC6Nn5ceMYUT7erGYS2q02/4oW98CMU3mt9USm+3mC
	 2ydKlTkvSvTTQJ40682kaw1NEKbxRXKYTpKLYCT3BgZSciPErPLBGbeyI69TrrVPXF
	 uUVaL775VlZwB10T3nFS4CB7inmhO54DWkgDjErV5zD0dxDayiA5JPyGDGSNtHLtSZ
	 28n8rbyNX8tCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC505C79FA0;
	Sun,  6 Sep 2026 19:43:49 +0000 (UTC)
From: Miles Krause via B4 Relay <devnull+mileskrause5200.gmail.com@kernel.org>
Date: Sun, 06 Sep 2026 15:43:48 -0400
Subject: [PATCH] drm/meson: fix device_node leak in
 meson_encoder_dsi_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHPCnWoC/x3MTQqAIBBA4avErBswsR+7SrSQnGqoNByIILp70
 vJbvPeAUGIS6IsHEl0sHENGVRYwrS4shOyzQSvdKKsaPEhiQC+MccYQPeFObsPWmM5a7+q20pD
 jM9HM9z8exvf9AD146hxoAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miles Krause <mileskrause5200@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788723828; l=1903;
 i=mileskrause5200@gmail.com; s=20260906; h=from:subject:message-id;
 bh=MzPOZoQJIZouNhopaY53pEz59ebt1korUstt2TswX5s=;
 b=n7TDRXCuDuGLEEk4/VPeuku3N6NRmryW5wydClhaAsHiByeSusM+Nz8hYgNrxmDeRC7QSYUTm
 N24E5yCU0OhCuzbiwy8lCyAhHI/GXTrgxQ923wq10hBuHkzwXY3Jr/P
X-Developer-Key: i=mileskrause5200@gmail.com; a=ed25519;
 pk=zcIfq4TGtPwMRJUW6WsbE2zLHvOMwk6ZyT/CGd6XzyI=
X-Endpoint-Received: by B4 Relay for mileskrause5200@gmail.com/20260906
 with auth_id=1010
X-Original-From: Miles Krause <mileskrause5200@gmail.com>
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
Reply-To: mileskrause5200@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Miles Krause <mileskrause5200@gmail.com>

meson_encoder_dsi_probe() looks up the DSI transceiver's device node
with of_graph_get_remote_node() and hands it to
of_drm_find_and_get_bridge(), but never drops the reference that the
lookup returned.

of_graph_get_remote_node() returns the node with its refcount
incremented, and of_drm_find_and_get_bridge() takes its own reference
on the bridge it finds, so 'remote' is leaked on every path once the
lookup succeeds: on the -EPROBE_DEFER return taken when no bridge is
found, and on a fully successful probe alike.

The two sibling encoders in this driver already handle this correctly.
meson_encoder_cvbs_probe() calls of_node_put(remote) immediately after
of_drm_find_and_get_bridge(), and meson_encoder_hdmi_probe() releases
the node both on its error path and after of_find_device_by_node().

Release the reference in the same place meson_encoder_cvbs_probe()
does, which covers both the error and the success path.

Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 3e422b612f74..3fe604496294 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -120,6 +120,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	}
 
 	meson_encoder_dsi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_dsi->bridge.next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find DSI transceiver bridge\n");

---
base-commit: 88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8
change-id: 20260906-meson-dsi-of-node-leak-744899da5712

Best regards,
-- 
Miles Krause <mileskrause5200@gmail.com>



