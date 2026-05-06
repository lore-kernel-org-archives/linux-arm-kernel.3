Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB470CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=//nou2Qb1FnpkEvM0SdcsiAXuxlLxSwwu1Tjy8/lIKE=; b=1hmxrhLMzj5V+S67PLQZH83k3Y
	Eq5//RGy1ZI/qEcaxl9lma4WRncLIPd20TKycK1z2AvRtYXyNMayP2dxRs8aSCplW+ur+FyUXMnmV
	RIrjCH9HaehSTuFv9FifC0Yv5P/66tnPDCx22zvL/QESVXG8GxHCpdLvktU4j0+ATN6+C3+N90GwH
	jtbxlISoiCxNUMTujxR0tWcqkrRBJ4YPNinK1jC9/g4qG5AnrCG/uoMVBdfSYgspwbGn2o1XV+Gmb
	LH7ulTvU7la3CR4qf4sUwVGQNexiLAxmNFsplMBVLpjwZ+TkwrZ8swRhzO931PdFlOqYVhhpXYQyR
	2uqep+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYTw-00000000L5Q-03NK;
	Wed, 06 May 2026 09:23:52 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYTu-00000000L4k-28dD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:23:50 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35f9ab079bdso5021703a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 02:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778059429; x=1778664229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=//nou2Qb1FnpkEvM0SdcsiAXuxlLxSwwu1Tjy8/lIKE=;
        b=Bh4uRilCFwthYuDzqiRKUM54QUEg180b3cr1QC/+JwJgdaDp0rrY5fW8eh2r//Laav
         5wY+dt5I/nq/dwWxhG0wgpRmOjEwpYAXqaDXB0FZOFzwNjCu5FtX9v4HqKJVtjd+q2SM
         zgncaH1AJfJR3dMtVMNdFdnQvIkxjmiiiwTzikvL0IpHg1uaog5ePXXl2PlGNG/OqFDJ
         LvzBK6t13xkr9E8XMr9neoBNuKvS4ZmQvmRyxjbhm+V3PsVrf7e1DrQwvVqtrB3cREs/
         tujZGaGuZUQ2pAzhqxRV0EXQTHHdt+7LAvf46tmMmNbYdgjYNoZjMI3TIH4DD2gLb2Ul
         8DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059429; x=1778664229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//nou2Qb1FnpkEvM0SdcsiAXuxlLxSwwu1Tjy8/lIKE=;
        b=K5LOQsrRRtwb7aQwAwje92ksYkztu5CWf8ji+/635EoHxxv35gqSL+JVm99mg+Ki+c
         UB+nd6Xltw6Tek7OJ8eh6274sXq8dC39E0sxiuLivkSLppZHFDZVQKTk10XZbSnvZNEx
         MnmFMfDQoW7vM4UAnt/L1EFNp5ge27TI1s3lY9psqFGJCHOg2+pwNPaKdC6kwTC+HJX/
         fv3KgF3wlEEDCULK6GPDsy/6nTSHNk0FD7lZwfno7YVoVTBhwtLNBmOYgmdiLtKBjeca
         sudOVdgjzkAoqHrVYdq1w9/3jWP+wTb5VFSh0OQApvZLq5M0/YAXVzfEvWDCoyAhJsp9
         2Jvg==
X-Forwarded-Encrypted: i=1; AFNElJ+eg0igMrTBWmOrhz72xMxKZXLndnAOsBTzH+o+BHkRU3Z7bPDcjJYTiHnGOU4tGoErJm9+vIl6Hj9wWTz5X3EJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzqrRWQsHZvp4/8bkWaRxkRv45xjxMidO6nfYvcZP2gzdsPJsyS
	7HB9vgQyu5kYfrFPk2PfroDo07NyrnMS7aHa5X1DmG9TKOCfMgudW7N7
X-Gm-Gg: AeBDiesbrFrFSrGKAJPAf2kRKoKPTutn//mXI15+KpPB1gR9DlncROGbXzdvqh/5MIY
	RsaBOfOj5BZDrJEovEoyiLY87tz1xWVgCEyYOJV5mtwsYl0geu+FeyCAzuv+Ftc5kd6HPN962Cr
	Pkx4gU8CPPNGCojmsZ5yXpgLzmDNLKrUn2wRKKi3zwVLf3rcqkHDsFjgg+MNKKn8hwohCNsthwV
	S9R1iv7zsioLglrg0F0t+bR0HpwOrun1vc1sz8A1yQmBti6CwED3Riw4JKfA0sNEqBYDtF1DzBh
	6zuJ8G2s82f8atglaaFmsLOuqP0Poqt6KH+OGeDJyp+iR74t7b7fnhkNRvpA2C/Rxnbi2VqM/cU
	XXV8zizqCftcraFddeCf/U0xFpG1icdTpJLQxuj/AtjAijE4lWuNXDtwnKh4hIGiw7qGApK2k2d
	pA+S8begQbxc6lUk6x59OUlsuettrQmoug8A==
X-Received: by 2002:a17:90b:1c84:b0:35d:a3b4:2ef6 with SMTP id 98e67ed59e1d1-365ac47f086mr2457412a91.21.1778059429387;
        Wed, 06 May 2026 02:23:49 -0700 (PDT)
Received: from lgs.. ([118.193.33.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b06adc51sm716818a91.4.2026.05.06.02.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:23:48 -0700 (PDT)
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
Subject: [PATCH v5] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Wed,  6 May 2026 17:23:24 +0800
Message-ID: <20260506092324.635014-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_022350_549940_2A3DA612 
X-CRM114-Status: GOOD (  15.18  )
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

imx8qxp_pxl2dpi_get_available_ep_from_port() returns ERR_PTR()
on errors. imx8qxp_pxl2dpi_find_next_bridge() stores its return
value in a __free(device_node) variable before checking IS_ERR().
When the function returns on the error path, the cleanup action calls
of_node_put() on the ERR_PTR() value.

Do not store the endpoint node in a cleanup variable before checking
whether it is an error pointer. Use a regular device_node pointer for
the endpoint node, check it with IS_ERR() first, and release it
explicitly with of_node_put() after getting the remote port parent.

This keeps the fix minimal and avoids changing
imx8qxp_pxl2dpi_get_available_ep_from_port().

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v5:
  - Make the fix minimal for stable by avoiding __free(device_node)
    for the endpoint node in imx8qxp_pxl2dpi_find_next_bridge().
  - Keep imx8qxp_pxl2dpi_get_available_ep_from_port() unchanged.
  - Do not change imx8qxp_pxl2dpi_set_pixel_link_sel().
  - Drop Frank's Reviewed-by tag due to the implementation change.

v4:
  - Drop the sentence mentioning the custom static analysis tool.
  - Add Frank's Reviewed-by tag.
  - No functional code changes.

v3:
  - Do not change DEFINE_FREE(device_node, ...).
  - Fix the driver pattern by making
    imx8qxp_pxl2dpi_get_available_ep_from_port() return an int and
    pass the endpoint via an output argument.
  - Update both callers so __free(device_node) never holds ERR_PTR().

v2:
  - Fix DEFINE_FREE(device_node, ...) directly.

 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..f64f57a33c62 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -264,12 +264,13 @@ imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
 
 static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep __free(device_node) =
+	struct device_node *ep =
 		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
 	if (IS_ERR(ep))
 		return PTR_ERR(ep);
 
 	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
 	if (!remote || !of_device_is_available(remote)) {
 		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
 		return -ENODEV;
-- 
2.43.0


