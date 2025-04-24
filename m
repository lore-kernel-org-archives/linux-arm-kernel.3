Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA77DC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dIyzL01cgo+crKLDEZdPmeuX1TlRguSNO13pBQrU7o=; b=CuexVZ6tQzaOunRNzpTs7qsw0z
	p0mIU4y4pmQLVDEKcDyyMT1HAd4WdVzmrAHOCo9at6kjKqhmeHmRuWDYnPV2R+EAMh/C4oUC/ypaV
	RFvfsDQBkhWfqN2i8xu6qId0sA2Aj9bBKzUCB6m/+oannwdc/p9MkCJL16AjgNiQTxp9/Gj/n5/dk
	75/hfvP03QtH1FBChn4XYQnY+RMx3mbKlTPBZE3GGHUH7xRL3L5wd2/1eH/CWcNQTRkdRfalneoFi
	amhXwqJMfu8GBxbLlMix6rvscfgYke736aQ1WpJf5x1qQzJEfg2NmmbEdCQw28/jADO9YDtaFu2ZP
	Fo0k1ssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uxn-0000000Du02-44Ei;
	Thu, 24 Apr 2025 11:41:56 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tm0-0000000DfU9-1Ud3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224341bbc1dso9311165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490339; x=1746095139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dIyzL01cgo+crKLDEZdPmeuX1TlRguSNO13pBQrU7o=;
        b=B1qeHAVByBPSjlFmQWGnr8nk+RAW+hIvNgdhjebKPlOSUYRGr/7YjDXWPPBuPrW4Ej
         GpjlNDloFVjRKskdXOZ3hlVqeblBVHN5T2Iz4UAGOgE/jNXpJkY9ruk+9bA9hTqG0lM9
         PErB5yHqSc88IaJwkhucaRwXZ8OX8SVaiERag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490339; x=1746095139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dIyzL01cgo+crKLDEZdPmeuX1TlRguSNO13pBQrU7o=;
        b=w99G+FK17CGhj409VqQ0SY6QQ7j4SxsYHvnQDSkSCdvxJ/VQHerpYD638faroe1lom
         F7JR0hELJgCsu6zfycF5KajOhpU6Yh7a+zTGmePXY6ZAqLzkdjuGmctB8TtxQLwOmyyG
         Z5BxqBqCitQMFzvV9w/H+yBIlKGWx1x2fDMrTcLvvRtM+4eTUog+rlYmkLLuEiExLyDH
         otDF+ovxN+hK5f9i0xWZaLI09tNfJ6vNd0NG3E0QLQvGz8AeXZvLznlG5DMBAc5pGA6S
         1EgiKPul5JjCqPCzOacphjfmpzFPioW1+ArqWN9+kxIwsnlY6GHX83cWE9SfHsEcmMtx
         xg9g==
X-Forwarded-Encrypted: i=1; AJvYcCXIeyXnro4LGiVoxqO6awb6jv5tQgcOuWVBAaJaz0bRiXMyo57QgZ99i62RRj1bh0cg4zZSsM8cVqPS/8+nhMaj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr9l2KD25t6cuF+/zjtZHJz2tN8JkNns+5W3CyWzUrqct2jon6
	sDj2KPdGoqd94Fl5r+rUz6GYbihy+D5hClWCsX9a/FB7HulmCHCYcnzsPuKPrg==
X-Gm-Gg: ASbGncvgIDxkR2MgAgXsfM9MntXXy204FjBoNrWQPIzWtj0HSAY8ftV6st8+mrX7Frl
	cy48UjhTdSdyx2izHzPWYhnd3rtCxFd4XMj3nNhHbt7PruAboszUHnQhSn4t7LQLLHMVtY1pjWe
	CmJP9AvdRKFBw9kyGhHMlCTgP4rxVtTbqR1uZeKI59rCTj86JhY+tQmQ4yetn+qACtn08vazxC2
	qVsR4BfO8JbRJM8Fgk9mUaYMEp0jMmytwXS+tWuUe/UAOZMx9x8WGglZ6gJJWNmpuKERgRLPNOQ
	xeQwyT737lFUtYW9wpkvxtTXKZaVQF/x3Qv2CgUgCkuuvn7AHrOSKoHF0w==
X-Google-Smtp-Source: AGHT+IGDFNqCsjcE5GSWvAg3se5R8IwE/tOMMO7jOQeDrhg6ysHM8d1FMTBh96EPdCO+C4822gNnlw==
X-Received: by 2002:a17:902:cacc:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-22db3d777dbmr28370545ad.38.1745490339232;
        Thu, 24 Apr 2025 03:25:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] ASoC: mediatek: use reserved memory or enable buffer pre-allocation
Date: Thu, 24 Apr 2025 18:25:00 +0800
Message-ID: <20250424102509.1083185-7-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032540_426119_1ED5B009 
X-CRM114-Status: GOOD (  19.24  )
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

In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
buffer pre-allocation was disabled to accommodate newer platforms that
have a limited reserved memory region for the audio frontend.

Turns out disabling pre-allocation across the board impacts platforms
that don't have this reserved memory region. Buffer allocation failures
have been observed on MT8173 and MT8183 based Chromebooks under low
memory conditions, which results in no audio playback for the user.

Since some MediaTek platforms already have dedicated reserved memory
pools for the audio frontend, the plan is to enable this for all of
them. This requires device tree changes. As a fallback, reinstate the
original policy of pre-allocating audio buffers at probe time of the
reserved memory pool cannot be found or used.

This patch covers the MT8173, MT8183, MT8186 and MT8192 platforms for
now, the reason being that existing MediaTek platform drivers that
supported reserved memory were all platforms that mainly supported
ChromeOS, and is also the set of devices that I can verify.

Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
 sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 7 +++++++
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 7 +++++++
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 7 +++++++
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c          | 7 +++++++
 6 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 6b6330583941..70fd05d5ff48 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
+				       afe->preallocate_buffers ? size : 0,
+				       size);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index f51578b6c50a..a406f2e3e7a8 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -117,6 +117,7 @@ struct mtk_base_afe {
 	struct mtk_base_afe_irq *irqs;
 	int irqs_size;
 	int memif_32bit_supported;
+	bool preallocate_buffers;
 
 	struct list_head sub_dais;
 	struct snd_soc_dai_driver *dai_drivers;
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 04ed0cfec174..f93d6348fdf8 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
@@ -1070,6 +1071,12 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = &pdev->dev;
 
+	ret = of_reserved_mem_device_init(&pdev->dev);
+	if (ret) {
+		dev_info(&pdev->dev, "no reserved memory found, pre-allocating buffers instead\n");
+		afe->preallocate_buffers = true;
+	}
+
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id <= 0)
 		return irq_id < 0 ? irq_id : -ENXIO;
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d083b4bf0f95..e7378bee8e50 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -10,6 +10,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
@@ -1094,6 +1095,12 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->dev = &pdev->dev;
 	dev = afe->dev;
 
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
+		afe->preallocate_buffers = true;
+	}
+
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
 	if (ret) {
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index db7c93401bee..c73b4664e53e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <sound/soc.h>
@@ -2835,6 +2836,12 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
+		afe->preallocate_buffers = true;
+	}
+
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index fd6af74d7995..3d32fe46118e 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <sound/soc.h>
@@ -2179,6 +2180,12 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
+		afe->preallocate_buffers = true;
+	}
+
 	/* init audio related clock */
 	ret = mt8192_init_clock(afe);
 	if (ret) {
-- 
2.49.0.805.g082f7c87e0-goog


