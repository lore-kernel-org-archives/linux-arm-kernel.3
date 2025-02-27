Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E22C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLRiMt6/Dpy2Jty4UVTf/yvA7e/j44jHTgLx5ffQrLk=; b=HhTrJMMK9ND9sG4lwLjwbzv848
	mxDp4H1Dt71Ss+/ob3CHB/rskwK+jAKB3aoELE70pjnIOVyjDuI0gRoqXUTXEdMnfbPkyYZnUpM8i
	WxDR/kRcHb4wQXWEHackVrzHP4seuwbWi2q0l7iCAg8kiGGtVBhgN5fqs3NmJh6XuxmYJFZhCRLhI
	WpT4oNALYjXd+sEryrHb/Psq3zC0HrLXIV5rp/0hUpmNVUDOo0axt2isnmQvyygtB1lrsenWZPrpL
	Qz/kzAWAKO0EdVvhFIUhNN+Y6aSYqrUyb1I2/t/sviMKKUwI8VJIYQcli7nU9427oDaIW1beD+Fpv
	8HTa3r4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjy-00000008ZIg-0kGT;
	Thu, 27 Feb 2025 19:40:14 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhFs-000000089nl-1Rr6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:01:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19ACC10375A1E;
	Thu, 27 Feb 2025 18:00:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLRiMt6/Dpy2Jty4UVTf/yvA7e/j44jHTgLx5ffQrLk=;
	b=ODvEJVWIhWmh+IobAVZwz92gr/HgIwjafRAW0V3ehEqsbQUOr8VqAzwPsDu2OOFd38Z/YT
	/wk0C7uAVnPyhMroKz0MWro3S9ixeeI2xnoEY24vjN5zYyXWxNnOgyIqABdJF2aJzPLsss
	GG3m1Rd+Zl7k9oUaNlQ3EXbMv0fdx6JaKbDXuC6nXa/Y5IOM2bvBu72UaRv6E/VkLteRIM
	SK3OCq+ZqoCaZj7dX+2s6osBzXmB8XJaqIu6jY+Haz/muhMDPTFLDvFUreBNOdlhc/Nn2U
	ICc84CI6rDTYs9nrjDEa6sJfB1LYz527IAMr52Jwa0uLyZjm5lLrG7ZWkbB46Q==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 8/9] drm/panthor: Add i.MX95 support
Date: Thu, 27 Feb 2025 17:58:08 +0100
Message-ID: <20250227170012.124768-9-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227170012.124768-1-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090100_522438_83BD99A5 
X-CRM114-Status: GOOD (  14.08  )
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

The instance of the GPU populated in Freescale i.MX95 is the
Mali G310, add support for this variant.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/panthor/panthor_drv.c | 1 +
 drivers/gpu/drm/panthor/panthor_gpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e320738..2504a456d45c4 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
 ATTRIBUTE_GROUPS(panthor);
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "fsl,imx95-mali" },	/* G310 */
 	{ .compatible = "rockchip,rk3588-mali" },
 	{ .compatible = "arm,mali-valhall-csf" },
 	{}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 0f07ef7d9aea7..2371ab8e50627 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -67,6 +67,7 @@ struct panthor_model {
 }
 
 static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */
 	GPU_MODEL(g610, 10, 7),
 	{},
 };
-- 
2.47.2


