Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B63EA718A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pmWG7OM2EB7RxxwskQ0/zeTI1Kmre4JByGl1ksiUCqU=; b=OsqQRlGzMeHoldUQB5UoKGx3dW
	76sAkidJ6oXSBqtKE+1Dk6XX+MnzsimRNLfinbOWRysXphkVHeMoLXtSuNKUa0nGg+x591bN0TLk6
	R1PxRLR8izgfOQktxXq/6p6teVgjUZX07BFy5CPXC1AwCQxUx97Y3CHUTGo5JMWd5DG/G7jreOpbd
	iNaY1AvxDCJGViKjVriS/6dZjJam/Ff7ndzOK46vLXm5xh6k9mfPcgFL2EGfri8MnNnXm1wlnGBNG
	dyCGJ48lYxqfTcHPVOIDeJXMLZldDmSkSiNVEX6SqdTJeUGXbykVQ8v7quSl+xLcqi8DmtHc7SnDF
	1f9ySh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wER9z-00000005mF5-2wVD;
	Sun, 19 Apr 2026 12:21:59 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wER9x-00000005mEk-1GGy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 12:21:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so964764b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776601316; x=1777206116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pmWG7OM2EB7RxxwskQ0/zeTI1Kmre4JByGl1ksiUCqU=;
        b=dB2sUDlgQYtBi2gLBcwA6GDsT9Ahn15Q/5TzU0yobhUDiguD4DHYOUUuW9khZS8sIh
         2D0TwjHHycmRrwvxfzF5XOpiWEJJXgwY/hsWJK5teqtQxpgqJJ8K6mOSxPbUVwU5ilM0
         Pc3ib77qYxQhH7QqPzjvd0JmztzWdjfb6DKH8zrtgOxy7yQRq8eOBNoYl+pJvQ7gT72s
         43J5M7g3Dwd/g7eDVsOxfs+RrptakcHRHNYgpC9m4BB9twAhh2LmQmpO/4f3B08xPUOP
         KRjXT8tavCYHnb3HYXSYYcb3n9LYQZ7MSOHhEim2XunChmt1IiWSSLB4knvAuSsOJvpq
         2L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776601316; x=1777206116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmWG7OM2EB7RxxwskQ0/zeTI1Kmre4JByGl1ksiUCqU=;
        b=Zy1sQj8JUx6Af+mlUyT2cggAbqjgKk9dYtQDH0y1STNyp7Z+nH8rU1QJeHqOx0PBib
         rX6aeUhxarR6+TCdb39us6Iu6B54wbd210LfmIXml6568jyS9Ls0P3sGH0u662txH8Di
         VwJA8xqzERmjLAUG0nHXvGACnmc5RsQ+NmHYej6v9puxUkP9YcdQX2Yp4t82z4n0t8IS
         uaypnuxNAxAX5l9mCeK8Cqq52sVppB6FayXxINF5jKF7wuT8vuGQ+tDRAyKy0cslI7Fg
         9LJUui5jsC1R58PKYatqUC7XHNPyzraREUY8BLUasx568vEh6fQEyhmSRjw4J9Afp96U
         SpwQ==
X-Forwarded-Encrypted: i=1; AFNElJ88sH/8Nu/JFApk0aaUJg1yLBbeab6smVOZlPCX8HCrdqAqswRn7ozvfNrGk+lvgfwwladLiuRaX7IdfRoHP0+Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyzS5JxY6kto7ezkBWfHOYp9GFAg+3Vq9dn8baEhbCJPOUKLPeY
	Sc86evuOErUGVvrgk3fOpfmy3p4slVQVmg3Zphn5gCjCC3RKtT+ehgNE
X-Gm-Gg: AeBDiesK0gR/QVsapMNPs8ZcbETZUfPhpQQ+J5Nb6IWBkFj55k6MzoWSNLBqxmGUvfz
	rnZsxs4opVMMwkEqGA2+tVpDEj2tmi7Fo9n9XGdurBNgCvNyXvKol6xmkkyCd+KXR7ELWmBe5lU
	DomkO8RGxE8yXbbS5atFUoDXr6Y0/yulqmL2M1CIcHhD3pjcQAph60IkYWPdpfNATQxGsyxMJc6
	iaVUlcCljekigRt1VThG+xtzg4gzuR/9kYuPtDe8ImMdy/y40E5e3HVf7pL7caz0bCA7GC4MR4l
	bJt3d7V7X3CdlqSJBESdFcdaTXbijoyZQz0Vw6m/PNU27c4Du3RfjqiKHb4QDH1YKUFLSZg8Fva
	mOrQ6+mu9qUMtZm7ngHOiG8tHBicfJ90O7Zkrx+7tESOiK+ZTuZLBzwHTpgH18dYf4e8OQVTEQ4
	Bz4YZmV99FH2AHgtox275HhBfCPSOE6BW+
X-Received: by 2002:a05:6a00:2d8d:b0:82f:1d38:f68f with SMTP id d2e1a72fcca58-82f8c8bee86mr10893475b3a.31.1776601315542;
        Sun, 19 Apr 2026 05:21:55 -0700 (PDT)
Received: from lgs.. ([2408:8417:d50:4775:fc0:88de:ed15:556b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d2fa9sm7700034b3a.16.2026.04.19.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 05:21:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/bridge: imx8qxp-pxl2dpi: avoid of_node_put() on ERR_PTR()
Date: Sun, 19 Apr 2026 20:21:34 +0800
Message-ID: <20260419122134.97529-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_052157_388103_37C95B62 
X-CRM114-Status: GOOD (  13.09  )
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

imx8qxp_pxl2dpi_get_available_ep_from_port() may return ERR_PTR(-ENODEV)
or ERR_PTR(-EINVAL). imx8qxp_pxl2dpi_find_next_bridge() stores that
value in a __free(device_node) variable and then immediately checks
IS_ERR(ep).

On the error path, returning from the function triggers the cleanup
handler for __free(device_node). Since the device_node cleanup helper
only checks for NULL before calling of_node_put(), this results in
of_node_put(ERR_PTR(...)), which may lead to an invalid kobject_put()
dereference and crash the kernel.

Fix it by avoiding __free(device_node) for the endpoint pointer and
releasing it explicitly after obtaining the remote port parent.

This issue was found by a custom static analysis tool.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..3610ca94a8e6 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -264,12 +264,15 @@ imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
 
 static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep __free(device_node) =
-		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
+	struct device_node *ep;
+
+	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
 	if (IS_ERR(ep))
 		return PTR_ERR(ep);
 
 	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+
 	if (!remote || !of_device_is_available(remote)) {
 		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
 		return -ENODEV;
-- 
2.43.0


