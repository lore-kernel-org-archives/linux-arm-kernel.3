Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ECFCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 19:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LGwLQB5bGxTp3o5FBG+AuuU4O/ZCuDyuPvM5fbA0n8=; b=1Xda+tfDD4E+j9c2HeUk3mqa+1
	BzAkEdatvtk7iIvDUo5G9p74pr5S6/vFs567AkDDY2lyo3E0+Fz1XJ2SpKnjEg/9ETDY+bXge2BGp
	zm9bFhd023172IGy3GGH2PF9CYogeP+mNClc929vlaYqBBEJYkQLXVZ6AYKhv5cTRkyECOEayRSa+
	Af7QLIQgiNXC+DMUEFlIYyPMX70f3iZMh9jCjPK7khucCzgFARBTA5/vjgSuNsosRzIsqGAwhzTZD
	9zj+Wc8C5yHXL6cq4tX0w80TmwZtqrKvKERK+qbMEM00b+5kzVJEg47MuQF0NK9N7+11dN3w5xix3
	Fi5lyZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fT-0000000DxML-2LiL;
	Sat, 03 Oct 2026 19:45:11 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fQ-0000000DxJ8-1HG2;
	Sat, 03 Oct 2026 19:45:09 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LGwLQB5bGxTp3o5FBG+AuuU4O/ZCuDyuPvM5fbA0n8=;
	b=X6Pz4IH8HWtDAm/qWRnFijWbXaidHYNrhK0WFZ7qVDzicYaXteen8LxzEVEMQlXQOHgYDd
	VW4GIOwkYig6kHFB93yGfIpRqYyZgEUYaep5DrLZLJCLWhIWOHY0abLUJy9cr+XhgrOp8n
	A7UlqI/TQt7iC/esG9r7tKWNJIdpZZZ/+Z98A298ykySI6fbSA+0Is9aTClLcgE4GIhf0A
	i+WONWWRHkhy2rFSKPoQA/JTPZm8PGmcGgcwrRRJPC1Mnqqj90kq8aYeugfq2CaiM3/tAu
	5iXWgtmd4ONLexWSKThyNy2KF+lp9guWFeqy4fugAQBfmOzHuQvQu78SJ1CM3Q==
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
Subject: [PATCH 1/4] ASoC: mediatek: common: Keep codec references until the card is bound
Date: Sat,  3 Oct 2026 21:44:58 +0200
Message-ID: <20261003194501.832558-2-michal@nozomi.space>
In-Reply-To: <20261003194501.832558-1-michal@nozomi.space>
References: <20261003194501.832558-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_124508_490674_0591F940 
X-CRM114-Status: GOOD (  15.62  )
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

mtk_soundcard_common_probe() drops the codec references parsed from the
devicetree right after devm_snd_soc_register_card() returns. When a
component is still missing, snd_soc_bind_card() queues the card for a
later rebind and registration still returns success, so the card is not
instantiated yet. The rebind reuses the same dai_link array, but with the
codec references released both the codec name and of_node are unset, so
it fails the dai link sanity check and the sound card never appears.

Release the references right away only when the card was instantiated
or registration failed. Otherwise keep them for the rebind and release
them when the device is unbound.

Fixes: bce93a162505 ("ASoC: mediatek: Add common machine soundcard driver probe mechanism")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../mediatek/common/mtk-soundcard-driver.c    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 2d39ff23f8540..4bb98412feb11 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -129,6 +129,11 @@ void clean_card_reference(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(clean_card_reference);
 
+static void mtk_soundcard_put_card_reference(void *data)
+{
+	clean_card_reference(data);
+}
+
 int mtk_soundcard_startup(struct snd_pcm_substream *substream,
 			  enum mtk_pcm_constraint_type ctype)
 {
@@ -325,8 +330,22 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	if (!needs_legacy_probe)
-		clean_card_reference(card);
+	/*
+	 * When a component is still missing, snd_soc_bind_card() queues the
+	 * card for a later rebind and returns success, so the card is not
+	 * instantiated yet. That rebind reuses this same dai_link array, so
+	 * the codec references parsed from the devicetree must be kept until
+	 * the device is unbound: dropping them leaves both name and of_node
+	 * unset and the rebind fails the dai link sanity check instead.
+	 */
+	if (!needs_legacy_probe) {
+		if (ret || snd_soc_card_is_instantiated(card))
+			clean_card_reference(card);
+		else
+			ret = devm_add_action_or_reset(&pdev->dev,
+						       mtk_soundcard_put_card_reference,
+						       card);
+	}
 
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Cannot register card\n");
-- 
2.55.0


