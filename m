Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6E5E81BDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2aw0A1Q7+XXVhB8aaJQe16/jz0kJyMiPsKTBLCCHa3s=; b=G7a5SeODwol1pyy+ZqnICcEo6I
	nafJwegOiDmocHkrJPWfmHdrzoYztnjwdHmngk4Dax9nRnZGqdPxwSoQUPJLLVnjLY5iYry91EsHk
	ilRrW976X6NabGYDFvLs8VhQXMfOMZkMxxe7DByb5Tnd+lJxZxBhrByDMWJCAejYUKHS5A2cjSHi0
	+9Ejbsr0uReDTeFJwQYbiPkUrKBVwjWsN84v2FJgm2d/yv4MsnmqzxAn/TAW8NAMGV9avCmn99n+n
	tPwwFtarFnbLLnr7YC2IghnKkeuyNW5Hx5TYARXq09/A1IgG3hrprHuE6zgwt9SBadTYItANGT5Up
	CcQPxWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTwW-0000000FfTX-146f;
	Mon, 09 Feb 2026 16:16:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTwT-0000000FfSs-44Lt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 16:16:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso5011635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 08:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770653812; x=1771258612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2aw0A1Q7+XXVhB8aaJQe16/jz0kJyMiPsKTBLCCHa3s=;
        b=Krbw0Gd9Sqa6ux8JiUI6/OvPrq5E0tOOv/uyCPysayyM4YKwPv2pHYKDDPoGDToHr6
         jmzpIrP0zPO5vyOVysqa+zsEzMO5Lv4A6driAQFIL3WfRRt6lVom/pptiICwHsfBbaMB
         FttcdWO5R1d6+1+9axquaqVd93MW0PO6R1XnJIqzgKG5T8iMGRwZo1Gfazz8eBv8r7M/
         0rCI+uXpp2If4jKKXYx94nrEdKoX6+7wD388BxhomeTpuIUhbxYgaRwbnHyxNLHNZ0ST
         vTH/70cZpfgp7ViSjfG8Pc1swdIoA3RZxYGOjCzmBLR+7uiUpUh/sB+Jsy36+Poy7bCV
         2vXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770653812; x=1771258612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aw0A1Q7+XXVhB8aaJQe16/jz0kJyMiPsKTBLCCHa3s=;
        b=M8MGlEKCWrMHqQoFkDihsRsr7McKQccBqCmP4ek+x8C/AvjSUtTLElzHxJEyu08Ku2
         cZoLCS83PJk3f2VR/f9bZDu9OZTh9M1IO2Antrco+796jcj6aRKElGh2taqIQ3mAMtDI
         s3w/61glhLyJZU7noXpTHx0neCJjKsOlPTLA9f+pXJP0oTwvvkRK9M1TqT8apykYb4GO
         6GY/QSvbuaRCrE38lSIh7LUWbDuwVtoPqs128OHoyZaRI0FZnTZjY3Ts2e+0UDbcIN0A
         BKRAQq8sbxS19mOLChyPCqgbfwkMgFGOf1njzHYgaDnLA3DgBQdo24AeEkbn6vN5LMBc
         v7tg==
X-Forwarded-Encrypted: i=1; AJvYcCUgPbP80Zc26V3/I+VLMXbVIBQEtYd0A8Yz9Ve/YD3o1gu8QhpkEtJ5zH8QIK8itgpxkb/pvVjaeKrUi5FDD0Q9@lists.infradead.org
X-Gm-Message-State: AOJu0YziHZr8KMNBBBRMu/G+OPL8njJCGZg9K9u900S3XE7nRp1oAqFT
	OjBU+Ohoi+haadix4vJzl+HSYULDxdpVwG1UP4OBZ5I/uhNy555j8fiO
X-Gm-Gg: AZuq6aLhZDkndXRDnAqO3MVMkw9ols0F7Zm2+nsE7c1fBiehkQdN3LKfOXqr2k5FHsI
	jg3vzUd1sVqOQ+kvCcnQyNortNVbHMnrisYcJ3KghPfn8sgSy8WirQU5f/eu6jATbPxEEzcpGcJ
	P2l4geyyS0LMs0nDW7SeivM6PWmUUnSEvCChc0wbsLAGc246svLKxV/J6Cr37emIdu1q3uNPlDZ
	8hfmvY0k55Iga7V6ABWLOmuNbYfYeDnvGsp3wPn1m6pRRnn9q0hoK7FxCDDSSrugC2SpLGUbUN7
	dlLSM2VXXrNeSmQ6QRb4y4d5WmT1Q/BVcDPWSb7Jm9gslscnE9gkzAOgPcKyYEtXh6Jsx7vTVsq
	rO7iz+8Zv7qbVYWON9Sk1FbyxkgvUM/gN5TB+3yZaw+tb5TkKdZ0i/m+4jyqpT6ixQ8d2uq0XYa
	ceV3lG+o+cbsDqgFbYfYSj5Xt+xXfGfFWq4iM6meUSrMu9ywFEfEuQhveAgA==
X-Received: by 2002:a17:902:fc86:b0:2a0:e532:242e with SMTP id d9443c01a7336-2a951607ae3mr114928935ad.11.1770653812464;
        Mon, 09 Feb 2026 08:16:52 -0800 (PST)
Received: from localhost.localdomain (1-165-93-187.dynamic-ip.hinet.net. [1.165.93.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aa3ec42e2asm110116805ad.53.2026.02.09.08.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 08:16:52 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH] drm/rockchip: vop2: Use drm_err_ratelimited() for wait timeouts
Date: Tue, 10 Feb 2026 00:16:21 +0800
Message-Id: <20260209161621.6136-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_081653_998753_99B71687 
X-CRM114-Status: GOOD (  10.01  )
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

Replace deprecated DRM_DEV_ERROR() with drm_err_ratelimited() in the VOP2
register wait timeout paths to align with current DRM logging helpers and
avoid flooding the kernel log when timeouts repeat.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index f3950e8476a7..02a788a4dfdd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2106,8 +2106,8 @@ static void rk3568_vop2_wait_for_port_mux_done(struct vop2 *vop2)
 	ret = readx_poll_timeout_atomic(rk3568_vop2_read_port_mux, vop2, port_mux_sel,
 					port_mux_sel == vop2->old_port_sel, 10, 50 * 1000);
 	if (ret)
-		DRM_DEV_ERROR(vop2->dev, "wait port_mux done timeout: 0x%x--0x%x\n",
-			      port_mux_sel, vop2->old_port_sel);
+		drm_err_ratelimited(vop2->drm, "wait port_mux done timeout: 0x%x--0x%x\n",
+				    port_mux_sel, vop2->old_port_sel);
 }
 
 static u32 rk3568_vop2_read_layer_cfg(struct vop2 *vop2)
@@ -2126,8 +2126,8 @@ static void rk3568_vop2_wait_for_layer_cfg_done(struct vop2 *vop2, u32 cfg)
 	ret = readx_poll_timeout_atomic(rk3568_vop2_read_layer_cfg, vop2, atv_layer_cfg,
 					atv_layer_cfg == cfg, 10, 50 * 1000);
 	if (ret)
-		DRM_DEV_ERROR(vop2->dev, "wait layer cfg done timeout: 0x%x--0x%x\n",
-			      atv_layer_cfg, cfg);
+		drm_err_ratelimited(vop2->drm, "wait layer cfg done timeout: 0x%x--0x%x\n",
+				    atv_layer_cfg, cfg);
 }
 
 static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
-- 
2.34.1


