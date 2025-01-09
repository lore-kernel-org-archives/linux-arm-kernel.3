Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F88EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=; b=rqb5MhzIe+l8UEECc+xePzAh37
	dNk+PxtS1AhD1HFmb1Qlz5/1VtYSMl/NTRbKomHH3e9qbNGe4MapC2Ac8fp/XVt4u65cdit7owySA
	b98vLOT80uXklmWs560kmk6TodE4OF6xrC4dfQNcuFILtihPo3CfB1RERuhhSlhLDKPyd8QgfLsZP
	Hgt0y77Ej7VYKDrHAu0N9Y/RCKZRucgLEY3dPkyn2MUQ340RqHupgDOB4a8O4thq4003/goz+LtOe
	x+/9QVLBYGj+E6Fw/kRW8O3M2an3fHG+e28zfh/qoRvJGs8056F44VjUjTauiBEdJNv0mUCd55zHI
	AF2yY/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVq08-0000000BZw2-466U;
	Thu, 09 Jan 2025 10:42:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpvP-0000000BYvE-0226
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:38:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385eed29d17so369792f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 02:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419081; x=1737023881; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
        b=xMwjJzYRuk/lg/jF+AByBYckaF6zeDGpZyGiiQ+xM6FAceO6u3oGZvOW6KgRERAq1C
         965VOBSdy24PS0HTzL98YW0pVsjcdtQ9Utduij1ygxreAJXr9vRPgIBKd9aRy+Muxv1K
         qNnOYblIbLauAJajQcXCUxEtuq04mUpTZNBhdBVsMED3raOY3rCZslJpFIVXFDe5eAgk
         Hg/65Yvuwb8j38cdIA8Qx+EBWYXTBAXEF4kVyRxU47PaZOkHGgXPb927YRqoRl6+EpoU
         gquhM+mVzaI1JV8PHQOIxxBJWmZqYfruZNjVj/5U2JzBXyNetMqMKC2WyscIgF41K5hZ
         TMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736419081; x=1737023881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
        b=pXpGvB9sOQoSVwZSljZeyJ8YvLaFaoOX19jOyi0t2PraG0I5yawYRYvUsjvuZ7o6di
         XZTEXzTwKDHSK4sbYPw2MsNif8tVixmWLvQMBKDHyH2Gs4Q+5ItPWdzA9uBMieUtpz0H
         MB5pE6V3P07xfyaoWRDs4rJ2h18bsRMdT74K9n4xEBXp1tHGeoyvkjCjUFwZGlu2Vr/7
         +nPFDhZCPLAQwlATqhW5DpXeYeAR0BHeXfV84Q5QvxgBRhLSUX0rBuG3P9FQu6eRsW/j
         y7eRU8CoR+lmdiI8P+E/D+zYcmba8rFGI9Yc5HUaU8c6NLeJ4bplFSDcTsGvVtcR+lJV
         viqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOjlyRqwqV5NnGt4oM5XINDsfOofq4wpAGJamSN2albqh8uWo+8yQ6OeVJ8H5dcpzqE9QsB5gVdOqlIWCbvURS@lists.infradead.org
X-Gm-Message-State: AOJu0YwkDUazCHFAkNGLftZOwVkWNY0Q2A/lEerGOn5HYthJ5YMSyESO
	9W2h+dbvG1gdKT0BcBDqx6fxhVVENJCJQGnED18c9a3GXE40D6+WIy8s7DG8xO4=
X-Gm-Gg: ASbGncvO5HNnKZ95QGhHny+cFcRXomHkV4lIzr0P+AEhQFR8VcolCX3fp97hzotCr/y
	NjVAMkO9Eru0NQ18ZAIbHo660fIg58PFrEjo4KO8iaIKqUMA476DXt6QnkifSnSSigLpE646ynD
	x6C+FR5L96unoZg89d5x/+UZiZqyO98bHL+FGnUedXjTso85zovTEtZoapP3me/70ASoO8uMSi6
	SYBgPyFhxeTUofrrBv69WDFHD/bi9/vNIUFqF3p18zfkQalxcKqiHP8CEk=
X-Google-Smtp-Source: AGHT+IFCYv4uf2yFMNDeWwu8dxDCALmnbFIR9ZT4+Lxq9xNx5WM2hH8pnTeOj9g7LOIfFfGA1HWa3g==
X-Received: by 2002:a5d:6d09:0:b0:386:1c13:30d5 with SMTP id ffacd0b85a97d-38a872f6ebfmr5116576f8f.7.1736419081275;
        Thu, 09 Jan 2025 02:38:01 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:38:00 -0800 (PST)
From: amergnat@baylibre.com
Date: Thu, 09 Jan 2025 11:37:56 +0100
Subject: [PATCH v6 3/6] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-3-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=wfidoNqLEIpqSK6RG2PAlzWtAyJfTIKDPdldVFKf2ag=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDp6kGOPVCiEv8hl9KLU8i+wGPmqu2FquHDK5H
 Q2R0yViJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURc8XEA
 Cu3Qoq4Wqg3WdgXcnvmUQIYev871ySwkgvnV7At88mMQ+GkL66NFNsB4PSred1m+OtwjUlWXQe0ryv
 SGBXNcYk4OPx5tyI8k2cJIGhIlQQNxAdQ0gG5CIntqQ6Q5OeliwrbiIm7kekFMGlRBeHMSE88+Fjs9
 BtxhIUR7SoG/WRJCiuaPp1V+NZu0akJj9bmUb+BbRjtcnYzZDapTE3nVYP7JcuI6sVHGTM2KLKnGkT
 gxPGwTXWvM87+FNMlCHcOGxmuIsYzt3Ug3X07f/pPlA5p1HLiIUKnBmyEel1Qh3f578e/bc96J3B4z
 Sz6YAbXC5d4wlRvQIkggqXZAgpYjuJXh0pcXJyQ4x39eF484WQjmKvvN100KMbpVX3anhTXG82vHr0
 VGb/u2fh0BgIzC2cpTbr/Mh60SGd8YiLWpeEdefIZANN0Z4eA1d+qKkQF+MGNIRZWlvVoMQpsalqFD
 1XyoCmR52dau4RmPhyUZ53FyhI3+1mh9FujyIwXqH7x5EhAn5lmmCPthg+Fysw2uU+vZWV4AZxzu/Y
 xEVF6zf+m0E3Go6wioVEbC9bq+FOr+5WQPqQmTRS0L8C8gGxXEgRnr6/6enaWGE7+nGdnIuOGCe734
 i4fZcUhVa5gefRq9qlSz6xBlUTS1Ra82yv1i4o8bKF+ukc1tLLU0fkbK2IpQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_023803_063131_894ADFBA 
X-CRM114-Status: GOOD (  11.58  )
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

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0829ceb9967c..5471ef744cc1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -328,6 +328,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.min_height = 1,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -355,6 +359,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -751,6 +757,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",

-- 
2.25.1


