Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6852DEF586D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn0j1K2MWkt0qaJPtZ+aFAPD3v2FfobPnhX1+9/1/mc=; b=N8kTamWEN58EfUUdc6Dz1Mw3to
	hCUv2+vtJT21TcNF2Jgg2cZvuDpAjBWNngxdnp+InpGaAap0eaq4/tNwXkiRB3ZWH3fENOi6z1Zk5
	zyyFWP9OT2i0kz9IkMULVTnYoiN9ifNeutRgZn05qtFmOIp87fiIB7roX7Er446jVQ9qws0tYoUxu
	EmM+IBn0r6amkcbf6hOvEvKnbt+aCg6S0IyNsA9IuPaHI1+AoG6WprjS3OCFuEBbAwCXEfTQ3d4J6
	isTtwrx59BHJPtpzlxTgB8rhEo/SXAfT1zca2RGjdsaRLjh4bRVfUCmR2kXGWyl4xX+afGu47WxeZ
	FBRjZa0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXv4-00000005HLs-3OZj;
	Sun, 15 Feb 2026 08:55:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXuu-00000005HAx-2PNT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 08:55:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4362507f0feso1442278f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 00:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771145746; x=1771750546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xn0j1K2MWkt0qaJPtZ+aFAPD3v2FfobPnhX1+9/1/mc=;
        b=cWmOeUPTZDDx9jrYUwPtNkdj9HRchmvTJ1+4rlu3HUCuY41JRFZvlxhRc7LnQXXXVf
         WitMAP7PRSt5V5HnYOsA097C5NAc2txmk90b6mZ7ftSVEDLCNfWqEs9GFt2Ycco7m7hB
         s7T6Ugkjweshofr1vXWIxXf4JIsdvhPhw19h0MrUQSNHU8sOi4IrdtSt/x702BrgR4pY
         g1vn0M+yePetbqEKbjfvusfXepQOpB582DsBWDKaQO6hEVIgbQBH+kwI1tHmdy0JsyOv
         reZCOBBuWAabAy5qbJSuCRAVhvy7RBWnaJ+byhGFiCgaBhJevSKRr0XCiAGLSObAlJSO
         3VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771145746; x=1771750546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xn0j1K2MWkt0qaJPtZ+aFAPD3v2FfobPnhX1+9/1/mc=;
        b=YCdbWPKL71HOIvfd3nUY7eq91sc0kOkIgufSvsl0JW4ZqsD9ZRPodkpT5YNv+7u0RZ
         Def4ynSml9eHEcRwaqLQ2HQ0HXWl91iAAVjHQlua5mttpju957+qMibiYsYYea11ooTc
         yjj3PHgjrEOCBNWjNmh35H0g7q6FVwLxP6KaC4aCGjb39//uMwiHio0JfqP8vpN10IQJ
         phl+eNs6gF1V4PR+Rh5Nc0Y80TcCCgMKFNRtJtZvR9UfUGirP9upYyOkCNP+rNxW8z4k
         6H4s/6JkPTWICW4LdVVo6USvJK37MCN5VJ6WPZdOuhgSWuwTXpZFSbxczQa1db5HZoZK
         Ttmw==
X-Forwarded-Encrypted: i=1; AJvYcCVqKdMsfw0uZ9cIFBk4tjCA7hKbm/PrcD2dJn+VAaFtCKtnS0yEQi0BgTqc+RkBLXdFKGuC7O9WCDn2PWJKdAXw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/pnPSgK/o+JOgWebvrNjGlx37auspQJEuKm3gYZGz1nv/dEHC
	Li8v7K0gm62HmX9luZ4ydZdVWMEJ2w64PtFZKmSw+4LGb0mZ4ir3CMyN
X-Gm-Gg: AZuq6aJaweCesEkr6Utt+rFvWs4P0lV/wTrueSZD1+v6FTZylYuCweGZIg/uWI3YBjG
	62zN+DodNjjfE8p2d6YaELHP6PHajak4m5aqGWUmONhLA7aABcEn+WVBFosZwTSYhPjm3Yd/4IQ
	vEbAMGUQzDdFE6YXsgpVXyRaD33o2ge1I5FE6tUNnH5tr1gjFiemIjH98CDmnqJXg6D4hWazE/Z
	o1uFl6UoY8lCWRbdkIsU+Xuxi79rQAynB2jXnlPQ9GM+GXEFJkOTZD/lJ8beueQbBFVD9a+m+NJ
	+a7FN3xp2dIsQlOnkmgKQjLwH3ce+RQsbvwu6179Vqv4xW7BjxOrBzKfhE+76a0LNdZlC360IJu
	cslS1GHcKYsPELZdycNobik9hbVrGUeAqPQ0/ptwvN4RC73Ab+dpCkuVJooeBNwBWlcIEtBZVSF
	+BeIm9jPLwSUBjEFoezQs=
X-Received: by 2002:a05:600c:870b:b0:483:6f37:1b56 with SMTP id 5b1f17b1804b1-48371051b15mr146178135e9.10.1771145746214;
        Sun, 15 Feb 2026 00:55:46 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm547211675e9.1.2026.02.15.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 00:55:45 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Val Packett <val@packett.cool>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 4/4] gpu: drm: mediatek: ovl: add specific entry for mt8167
Date: Sun, 15 Feb 2026 08:53:56 +0000
Message-ID: <b440a9c1972dedc4cfbf29a84366e635b0d7d984.1771144723.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771144723.git.l.scorcia@gmail.com>
References: <cover.1771144723.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_005548_680264_7103F7A4 
X-CRM114-Status: GOOD (  11.17  )
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

From: Val Packett <val@packett.cool>

While this configuration is otherwise identical to mt8173, according
to Android kernel sources, this SoC does need smi_id_en.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index e0236353d499..97a899e4bd99 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -671,6 +671,16 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
+static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 8,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
+};
+
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 8,
@@ -742,6 +752,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = &mt2701_ovl_driver_data},
+	{ .compatible = "mediatek,mt8167-disp-ovl",
+	  .data = &mt8167_ovl_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-ovl",
 	  .data = &mt8173_ovl_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-ovl",
-- 
2.43.0


