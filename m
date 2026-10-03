Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA28DCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 19:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElBWia5JS4/SUpc+pf3CM3tN4U00hfaycVh4BT6HqIY=; b=QVruLlfeGEXNjU70GybkkzyfaX
	E2AODCP19U6ixIJsburOrzqjScPzengNaCrpCKHOzfpssD716K0gfFkZWpUDW6Etrw0PzS2EmeCd2
	Je9i/5+nHCMm7/fCZAdwZa8dBqoqN+9CpJh0gFjwoCfnzbM5EofFw778XUN1HkL/Gi8sJXoaVOONO
	OhOe3ctVPMqsFfhdpXv7aeqg42mBShRHDlwaRQELp5+XnhlGC2OfOdkM+0DGbqJrBETIvu8THKsXT
	DUi/i3+jjY9NjLYh/4JgoZcZrF4KRupsnbtoTOAM8wA6iKus+2uQ2nZFQmmUXxv4AulOP+9oj3zOf
	8aNEZHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fW-0000000DxPm-0yh3;
	Sat, 03 Oct 2026 19:45:14 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fR-0000000DxJo-465I;
	Sat, 03 Oct 2026 19:45:11 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ElBWia5JS4/SUpc+pf3CM3tN4U00hfaycVh4BT6HqIY=;
	b=UgcKNCTOuCw8LJyD0onRpa/oupvCUmsEBzixnV3SGgApXsXwHN+dAmNE0kQyzBILLgedKV
	23j+YH1hcAJS44e8b3yclgAFSgAdqibeLIH/jfbR66DovW5mStRf3QCpdtZzrGPXyiFV8v
	5AtcGH6UOLfvxdWA+haU4uixLSGKKt5qv5QzbXIvdFyKyWPrEanXLCWiFlUj7061yEZks4
	9aE0qR8eGbsmllBaLBEVx51MTBBJg7MZTxuq+pAlhfZHUWxZG9Far9LSlFl+y5GWvu6p3/
	ogJ+iCoBWvk6hlqFjwhitbc1sUT8TWFJm1GUuPmNpJBQ4H9Zw+brtWkYLvx0yw==
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 3/4] ASoC: mediatek: mt8188: Constrain UL8 FE to its back end's capabilities
Date: Sat,  3 Oct 2026 21:45:00 +0200
Message-ID: <20261003194501.832558-4-michal@nozomi.space>
In-Reply-To: <20261003194501.832558-1-michal@nozomi.space>
References: <20261003194501.832558-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_124510_189829_41CA5FBF 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

UL8 advertises up to 24 channels, but its only back end, ETDM1_IN,
supports at most 16, and its bit clock is limited to 24.576 MHz.
Without merged constraints, userspace can open UL8 with 48 kHz, 24
channels and 32-bit slots, which then fails in hw_params:

  mtk_dai_etdm_configure bck rate 36864000 not support
  ASoC error (-22): at snd_soc_dai_hw_params() on ETDM1_IN

Set dpcm_merged_chan/rate/format, as the DL front ends already do, so
the FE only offers configurations the back end can accept.

Fixes: 96035d46d4b4 ("ASoC: mediatek: mt8188: add machine driver with mt6359")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f7..f07aeb6371083 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1142,6 +1142,9 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.capture_only = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_format = 1,
 		SND_SOC_DAILINK_REG(capture8),
 	},
 	[DAI_LINK_UL9_FE] = {
-- 
2.55.0


