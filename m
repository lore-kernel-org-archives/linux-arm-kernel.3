Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FC9C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ig7/HqBzfoSVv6fdudTalNiMgAfFIlYLiYgMPPiaeeI=; b=Mi45PmuIqeufm3xoLAAbqv4unB
	e54TOHh9Ho9NiYJydlG3xB0IWfFs9KEJdADPnuuUdSrUE0MIQUc2XNUx46O40YI2Moy0ZQiFYbOYx
	wzhVvDpvfHXqrInloKQwm8q0484Wk6GN2/T/rbB6cw0QPPtTTxROs4QFgNlxLbUrj4Zeqe63uNP6E
	akWUYb4AkkT3mRdl4PtxLUhTamMZTceaSpQs87ZTlwqbVVZRq39YkzJRomNEPbLqwBgniN43kaq+s
	ic5Ay4E+Mbw+Ah2paUeRcnD78jibsdikaln601FtWC0bs7sPb0zxwph9yaqY3nb74Gea7z8+rRWkK
	7cxMPX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8doq-00000002Cpg-3eqF;
	Mon, 21 Sep 2026 13:12:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8doo-00000002Cor-2krs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 13:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ig7/HqBzfoSVv6fdudTalNiMgAfFIlYLiYgMPPiaeeI=; b=bTdpu8LTt0yrz8mX3E0FeUkYqy
	loA9BZ2iKoULbGc7e2zYhDkVGVXn0EkbEwOUw7/dZ/uvP5ecYNAOCPlKPmj+FVNpL/43n31urtUvJ
	BvEMG93qlwfHuOQ16VEPnpOZuskGbKS9lcHLVz9Z4k/xqlxs8q34iZ69ga8Efwop56HWRRJmcq29m
	bkL0IcGL+F22IwPV9wWDN/a7S4qeXK5FAP7GNGQmryokxSTKAiRpZqdZAJXAzxvvbU+zGOzAVHQrH
	SMRsdKACdaIOG0HvSjBEVHvHHWxIQWkWjPOaLqmBFpL4LMwqFfw8t7ZR25yC+bUjzm84+FVyDbo4q
	WjCVu4OQ==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dof-0000000CK1P-3uNL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:12:22 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so1770563a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789996331; x=1790601131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ig7/HqBzfoSVv6fdudTalNiMgAfFIlYLiYgMPPiaeeI=;
        b=Z6UymCX/JPIOdXycQdxjHxYeLld2jtSWcWGPuG38o5bf70csE/wt6RQrV1EWM+uTV/
         0FltAvdO2cWfTVC3sqhuo+sn9Jmvwcw+w27SxdZ0Sv1uT7VFu8zMDU+USSz3mgb3auvF
         R7jfjMoeRYjuGVlA311HNIpxToh7F1412ZoGK8aaY4IsIcOFIMBJcKQXMWRTbPvwBjyG
         MSvjIP4uwusBiF5HmmEn8le/bPqVm3K32ER984zICWTLlROKDlvKxjLMIyIUxjVBpDzV
         1FA+uhaXCfXpE2fRY1ayBPCU0aLqq54F8OyvNZ1a1TRbxu8a2rkIGWK+AUJPB319WAMF
         J07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996331; x=1790601131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig7/HqBzfoSVv6fdudTalNiMgAfFIlYLiYgMPPiaeeI=;
        b=aJqqc2vKgyjfsGQi6NeKxI6/aU0u1qZVpGuJ20HUhLr0hlL/NugCMOuXWU3TmSBMZA
         q6z1Z8U2l3KF6s8syOG5g4Bhe6Ehn1w0/EwAusre7Fz2LNu07W0DD5AE9JFHXtWo8g/1
         6J4bwgPzmxOBR552El3mL4TrAFSqyVCoQ51o4muWJZQsSpLdwBxF7UXcuvvsUaPFBDQw
         5zNFUK+iANlD0p4vB7PX2veLTMrFjMI/4ZebaOWNo31vdWxyabdSrLMpKhjN80g4f0DS
         /nvRNLr/DCyRTBV1pkU5hEB8blfJxFrZCmKRFlE3pUYhvAf6WweaXzHI3f3qy0xWYE/U
         5Fmg==
X-Forwarded-Encrypted: i=1; AKwUvBysRrMHlfUDJpeCmKfciazV5KvO4dQAfk9ZCZ2Y/sBNQhEHuHB1TTZ7oNck5ho41OTIlyN4B6zNRe97LlOEjeFC@lists.infradead.org
X-Gm-Message-State: AFuF++kNFNMI310PVElZwpMukYKvtSYfVmlXB6IP+biRqu1A20dmfPHZ
	4qae5G/vSmRSFLR+9x2oChscFK8sRyQUxaAHWDant2+x39AHYAJ9tXgu
X-Gm-Gg: AYBFou3PTQ2B9LMfn4JqSomtNsJPfskDTRwisFAeWWpvJmIzxlaO1rr5Ihtfc+BptKQ
	+GKyCikBvOvAzJ7ZBRhnD5KJzm67R7DEvDHjIrjhXFlEHiRa2zmslZm4T2KiZlhHKBU5PnbnIyk
	KQa/d5ivg3qfN0HjAbNGQpq4xGGAymvgBkgV0wOi9gcenzw6ogHcTxLrI8dGhrxbJ3H7yfPfKgL
	mjw4omFKd9WzJEjPatL74S2QHgPilg+/+g/N3hOHkjAngWshgRItgzT4xLPlW5t04SYgJBW/5XQ
	yfVxYFPwsAccmjoM/ssHo9gn29lvuYlBgNCKbZwAJ8sTkOqIKY9PHwEmNo6Aa09DSEaAjG9MWZ+
	bECtkipwWkzK8VE3B1wae+Ne3dVSpAL0ce9XQ2Z+9vrjWQagBLcg3QhtyTu7p2G589Y5k5x3dbe
	1pHhVYkFV3UOuDNa8jUu5VDwhXnST/hYx7HRMr/udio8hbwdnAIl6jglhQMfNLw2qw
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:4b64 with SMTP id 98e67ed59e1d1-39e6c6a5438mr8799720a91.46.1789996330968;
        Mon, 21 Sep 2026 06:12:10 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a063bcecc6sm80447a91.12.2026.09.21.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:12:07 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Nancy.Lin" <nancy.lin@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: fix ovl adaptor platform device leak
Date: Mon, 21 Sep 2026 21:11:56 +0800
Message-ID: <20260921131156.403652-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_141220_714899_A3303E50 
X-CRM114-Status: GOOD (  16.42  )
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

mtk_drm_probe() creates an OVL adaptor platform device with
platform_device_register_data() when the display pipeline requires the
OVL adaptor.

If a later initialization step fails, the probe error path releases
the DRM resources without unregistering the already registered OVL
adaptor device. The normal remove path likewise leaves the device
registered after the DRM driver is unbound.

Keep track of whether the OVL adaptor was successfully registered and
unregister it on probe failure. Also recover the platform device from
the stored DDP component device and unregister it during normal
removal.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c86a3f54f35b..d176e6496aa7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1060,7 +1060,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	struct mtk_mmsys_driver_data *mtk_drm_data;
 	struct device_node *node;
 	struct component_match *match = NULL;
-	struct platform_device *ovl_adaptor;
+	struct platform_device *ovl_adaptor = NULL;
 	int ret;
 	int i;
 
@@ -1205,6 +1205,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 err_pm:
 	pm_runtime_disable(dev);
 err_node:
+	if (ovl_adaptor)
+		platform_device_unregister(ovl_adaptor);
 	of_node_put(private->mutex_node);
 	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
 		of_node_put(private->comp_node[i]);
@@ -1214,9 +1216,15 @@ static int mtk_drm_probe(struct platform_device *pdev)
 static void mtk_drm_remove(struct platform_device *pdev)
 {
 	struct mtk_drm_private *private = platform_get_drvdata(pdev);
+	struct device *ovl_adaptor_dev;
 	int i;
 
+	ovl_adaptor_dev =
+		private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev;
+
 	component_master_del(&pdev->dev, &mtk_drm_ops);
+	if (ovl_adaptor_dev)
+		platform_device_unregister(to_platform_device(ovl_adaptor_dev));
 	pm_runtime_disable(&pdev->dev);
 	of_node_put(private->mutex_node);
 	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
-- 
2.43.0


