Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A553C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 05:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=syttJyt/Lir9Mf4QY//fRoVilpsEyO/rCWOHDim8BNU=; b=oc/dHD033W296zB9fiBwtSGFBL
	AcCJC0r8rrt64p+s4ZVxJk7mdLGoQ/E2VMv3/SUTFmZTMWlLdS4XOs5ZfbsMBPNKmcimMy4PoMwBa
	OQG2+79ZhShQL1darzNhBut2FXmhgfcFf99ff5YlENPwP7JsZYQtNAnk7gstc14IgAjGZTGXOo2su
	Zi7RA+F/MXcU5LPb19wyAS84Rw4k/DzlLQzU2kkzgHBj08glBIVRH/gt2Uju9BpIbIVbFek1+np6+
	naIK3XL8H7ZE6xl7tRWJZvS0ixa2bxayoW1TN1eeXw6KPD5Gbfh8n1Ce01lpKZ7ihn0yHqdf1QD9U
	WjTe4ovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBoIP-00000006QvH-00BR;
	Mon, 05 May 2025 05:23:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBoGO-00000006Qh0-1cVk;
	Mon, 05 May 2025 05:21:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68B1E61126;
	Mon,  5 May 2025 05:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9358DC4CEE4;
	Mon,  5 May 2025 05:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746422471;
	bh=eFUNJz44umhXOHrb3M8tG09Hn9kgygwm89YtP0GIyOk=;
	h=From:To:Cc:Subject:Date:From;
	b=j5Kr3f5558Cu0uGP7jS1QGHwsAcFOt5cbr8JZHzqZq21yX1qU6YrdAJU/GWazYj4m
	 PrGK6QZXEy3ZE+uW89sYOQruR6G+9IyPPwyigS3IXgx/98Cc2+Otpl3y1+zLO/bWHI
	 exIiGxegMJaCQX6GXkIN1YUGy8eR6oFJoswGvXSh84uUCuysabLEhngAcUyBIHr2jl
	 O3dxTQiRQeVIZe5GW6lBfEyJPO18wGHQQOSXB9wwlUkjoz8oWvOW4Ne8c2wYpE3nes
	 24XB7cdY1kk9nhYBaG53d3LKuZubPEgAJRdVN8oR1p/tpwl5ECoMKDYMErd3c93TKq
	 WqQc2KQQLhWXg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Zoran Zhan <zoran.zhan@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET
Date: Mon,  5 May 2025 07:20:52 +0200
Message-Id: <20250505052106.1811802-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

The driver support was added without selecting the codec, which leads to
a link failure:

aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'

Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 3033e2d3fe16..e148d4d94160 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -229,6 +229,7 @@ config SND_SOC_MT8188_MT6359
 	tristate "ASoC Audio driver for MT8188 with MT6359 and I2S codecs"
 	depends on SND_SOC_MT8188 && MTK_PMIC_WRAP
 	depends on I2C
+	select SND_SOC_MT6359_ACCDET
 	select SND_SOC_MT6359
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_DMIC
-- 
2.39.5


