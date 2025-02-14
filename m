Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A097C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hy/v/JU8BPIjcHWmK+Ogizxv2cgnNmOHVawTDT9QvGs=; b=2KH22wiCd60mx1ip6mw/ZZN0mQ
	GYnYJ1YKrMBGTlub3lPPt9fD5JuPvzcAJe5T5I5aUesaIzN1TLf2wkUecJwmKjg8sb7iD8w7vmQfr
	MEyruyAAH++2f5p2IC6wj0+22+wjP4Xioejzl3jUjm+8f/dwGirCDfj8MyY9cso+HNGIYY1tzoRQT
	VacvChOiw+gOnZarPLBVDy3f/esSm6byw9h8UrJipzXzYY2BEbwpFlVyhe6+jI1V0MI2pwo5Zi7yD
	tMfduKvwUJPSUQ9L7abccbwXLrIpbDT+VGNS85aJ2T1sAjZPU/C3UmWjIAWsrfkvtl+nyXQGE+oFz
	HE7xL6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixcN-0000000FJo0-1ZEk;
	Fri, 14 Feb 2025 15:28:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixPL-0000000FGi0-0kbF;
	Fri, 14 Feb 2025 15:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739546109;
	bh=LrLIXtRuehdwykIBttWuiZuw5wRuaIW9+FNl6glcXx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NVl3gfVdX0tAUHmBP+Ujt/sbBjxJhyiDXGHoqG64RegmsUc5nYqGcH5kQlVWquV8T
	 um5om9ZCOmuH7BYvISmlO0DyBEH/BAfl1hMzCXyCNNH8IbFVzxWPMuY1PjvVz5KHpn
	 rQ41DTxZbJ90M06ao+a20OwuWsI4luK3x4HyJqkw2pgQ4Tawd5QDvzQo8mUhKHxROt
	 QN5rbMOeF4ljfHlPotsV3hDYwfn5WjdDHlHa6Eiu9S8+ldNakIhtojI3sn+WRMkKgZ
	 H784A0aidpwU73e5rI7CbDujADRYf9UwX2idcoNvCrJ+RTNGNFbXJFvJuHbS8TYnM2
	 ZRsBBpTS4NMMA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8426B17E0FDF;
	Fri, 14 Feb 2025 16:15:06 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 12:14:30 -0300
Subject: [PATCH 2/3] ASoC: mediatek: common: Handle mediatek,accdet
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt8188-accdet-v1-2-6bbd5483855b@collabora.com>
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
In-Reply-To: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
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
X-CRM114-CacheID: sfid-20250214_071511_364392_3FC9C03A 
X-CRM114-Status: GOOD (  13.55  )
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

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/common/mtk-soc-card.h         |  1 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

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
index f4314dddc46075d554b4e3f3aae8bcb5498f8ab5..4e1c546a994f5e6b7068f70ac8dc2af7e87d141a 100644
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
@@ -250,6 +253,16 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 
 	soc_card_data->card_data->jacks = jacks;
 
+	accdet_node = of_parse_phandle(pdev->dev.of_node, "mediatek,accdet", 0);
+	if (!IS_ERR(accdet_node)) {
+		accdet_pdev = of_find_device_by_node(accdet_node);
+		if (!IS_ERR(accdet_pdev)) {
+			accdet_comp = snd_soc_lookup_component(&accdet_pdev->dev, NULL);
+			if (!IS_ERR(accdet_comp))
+				soc_card_data->accdet = accdet_comp;
+		}
+	}
+
 	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
 	if (!platform_node)
 		return dev_err_probe(&pdev->dev, -EINVAL,

-- 
2.48.1


