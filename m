Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDF1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 19:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfbMC2HhA7xBMS1KzsxBLdyv9ljn14w5eWUlV3IxwTg=; b=K62FypT4RS0zwRdfDtW3JA3RGq
	JP9p7ZuvRSctzhHmhQkfngUITAjX4be5wMNCQUchchwk0wutdnQPO3uDFW1UWphAPt7LvTb6FXeeE
	xys8ytTc18OTMeIgUkZnl+dPIp5yAkn0gNyA7wdRIkDgxD9cUD/yft870E0vEaMZPhAtLtKvuQ/sO
	5jDgZCnxNsREWW6vk7OeYEU4mIZYfc379EsZZje9bOzgP78khHuQkYHfq0Dwje5KVrqRllQ7/66/n
	1rbiWRU1gANXWOAu/N5SiV809x738Tm5JrnuDYzh2z08/0K6VWf6WjdZGoMkUWxnug7cZUpLd9c7u
	939Qntjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHLz-0000000C4GX-3vCH;
	Thu, 06 Mar 2025 19:57:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHHL-0000000C3cS-2BIf;
	Thu, 06 Mar 2025 19:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741290789;
	bh=8gQkP6DepN0m7HelKsDtGxBXCqBzzbYEFfCRfOoL0DA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ThdNLfFCftGl5+VlpJzO+5pUeDX+7v2GV5+E7E/CxLH4GeG+vkDxAN7PAb9LSSP9J
	 hs++AkY0DGrx4FHvyhUL01kwTheQuyiYYJjKdHvqpZHMKKWwdxDE3S4dmuargRwimP
	 3FFletfVLHEEeKuMTaijspjlsvdr0lW95B0160kHA57ZnwsHXkx1UcDNtmw1K7t27F
	 P0DuSrwxvKHQbl2j6X98fYQbNW2/SXy6sY/BzsRLiQI02lf2EL0sEh8tRwUw3Cj3ml
	 KMXJccAa4DmpOJwwNssfLF8Oq6K0VEoXHaI2njQyDh4Ccy9Z7eV6sFPLXB7+FVTUIf
	 UHAgSP56hpJaA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1989017E05F7;
	Thu,  6 Mar 2025 20:53:05 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 06 Mar 2025 16:52:16 -0300
Subject: [PATCH v3 2/4] ASoC: mediatek: common: Handle mediatek,accdet
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250306-mt8188-accdet-v3-2-7828e835ff4b@collabora.com>
References: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
In-Reply-To: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_115311_729931_AA891B10 
X-CRM114-Status: GOOD (  13.81  )
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

Handle the optional mediatek,accdet property. When present, retrieve the
sound component from its phandle, so the machine sound driver can use it
to register the audio jack and initialize the MT6359 ACCDET for jack
detection.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/common/mtk-soc-card.h         |  1 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-soc-card.h b/sound/soc/mediatek/common/mtk-soc-card.h
index 3f6e24dd22df13ddb3aef1625a77d2e29e46fccf..a1d2794ac1f717997fb47023d5951a9ac4897788 100644
--- a/sound/soc/mediatek/common/mtk-soc-card.h
+++ b/sound/soc/mediatek/common/mtk-soc-card.h
@@ -16,6 +16,7 @@ struct mtk_soc_card_data {
 	const struct mtk_sof_priv *sof_priv;
 	struct list_head sof_dai_link_list;
 	struct mtk_platform_card_data *card_data;
+	struct snd_soc_component *accdet;
 	void *mach_priv;
 };
 
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index f4314dddc46075d554b4e3f3aae8bcb5498f8ab5..713a368f79cf049f7879075c675457e91ba8332d 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <sound/soc.h>
 
 #include "mtk-dsp-sof-common.h"
@@ -192,7 +193,9 @@ EXPORT_SYMBOL_GPL(mtk_soundcard_common_capture_ops);
 
 int mtk_soundcard_common_probe(struct platform_device *pdev)
 {
-	struct device_node *platform_node, *adsp_node;
+	struct device_node *platform_node, *adsp_node, *accdet_node;
+	struct snd_soc_component *accdet_comp;
+	struct platform_device *accdet_pdev;
 	const struct mtk_soundcard_pdata *pdata;
 	struct mtk_soc_card_data *soc_card_data;
 	struct snd_soc_dai_link *orig_dai_link, *dai_link;
@@ -250,6 +253,20 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 
 	soc_card_data->card_data->jacks = jacks;
 
+	accdet_node = of_parse_phandle(pdev->dev.of_node, "mediatek,accdet", 0);
+	if (accdet_node) {
+		accdet_pdev = of_find_device_by_node(accdet_node);
+		if (accdet_pdev) {
+			accdet_comp = snd_soc_lookup_component(&accdet_pdev->dev, NULL);
+			if (accdet_comp)
+				soc_card_data->accdet = accdet_comp;
+			else
+				dev_err(&pdev->dev, "No sound component found from mediatek,accdet property\n");
+		} else {
+			dev_err(&pdev->dev, "No device found from mediatek,accdet property\n");
+		}
+	}
+
 	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
 	if (!platform_node)
 		return dev_err_probe(&pdev->dev, -EINVAL,

-- 
2.48.1


