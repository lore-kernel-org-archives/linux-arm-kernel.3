Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AB6CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 19:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOtUI9LbZBFzrdoP5EONAONuH2mAdNCzMzef3tb6ksY=; b=XHMEklMCWsUbIzsAIolksx0Av8
	ZDtoJhW1BQgIT81uSR76FWDUGsmbZEX3AWIGJMktIeisQ0EmbGjup//Bp7stnRYwGpqai8uIQBpD9
	aIYhTq24p3vUL1eBgzocIGr1z5mjGDE/r3ATsJ2PShhi6QhgnDevYTuso2Di2FewvXxC2iqH4J+qZ
	CywCUNXNl3AwJZzaQc9JR1/NMSNwhdzEpxd64cvjhLg4sD1Q4aBdrAXJ2jGJD2EgsB8AorVxsbGDO
	ryvt82D3+lJW6AX6HObxfJgxRmkSspcFqoZtg/v0069Pk3/vHTJ8NgKgIGbCwoHFEzuziZCdUNpOs
	m4eU0Kqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fT-0000000DxMv-3hGP;
	Sat, 03 Oct 2026 19:45:11 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fR-0000000DxJO-0Q4d;
	Sat, 03 Oct 2026 19:45:10 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOtUI9LbZBFzrdoP5EONAONuH2mAdNCzMzef3tb6ksY=;
	b=Di9FEuevjwnMXtJQ+wJfqyQgGT7k9Gx/vhwJSmdP6snCsq+wwh//x/6JjTyp+4qv5i8XTb
	GVPv/fyHeVfYfKLGVwn1Axas2lJJ6YgJYqK9vUnAKtFjjKMGvPVcu4VNeey+CuIk05n2Xw
	fn7i+JkN5jKyLL4QTpUHVIensvYgLR0ZlfQMNLTfPuRDuKqiI/d93KSgC2Y00Mq+sssPPq
	pRj2YY9DSwAQXzm/XJzVjnXrED71GFfs4rO/RYdJhpkWlPF/E4r+pDJFAWmoI4e+uWiK8F
	ViWvanb6auSZeaM2q/HBp1fBXet/58RP7+LnI8dOpCR2Cn3tRPAM8Luv3GDkOQ==
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
Subject: [PATCH 2/4] ASoC: mediatek: Don't keep a freed topology name in the static card
Date: Sat,  3 Oct 2026 21:44:59 +0200
Message-ID: <20261003194501.832558-3-michal@nozomi.space>
In-Reply-To: <20261003194501.832558-1-michal@nozomi.space>
References: <20261003194501.832558-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_124509_292309_18CD1F00 
X-CRM114-Status: GOOD (  15.52  )
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

The machine drivers pass a static snd_soc_card, which outlives any one
probe. With SOF, mtk_soundcard_common_probe() calls
snd_soc_card_set_topology_name(), which devm-allocates "sof-<name>",
stores it in card->topology_shortname and points card->name at it.

If the probe then fails or defers, devm frees the string, but the static
card keeps both pointers. The next probe does not allocate a new name,
because topology_shortname is already set, so the card registers with
whatever now occupies that memory:

  input: \xc0cr\xc2 DP Jack as /devices/platform/sound/sound/card0/input10

UCM matches profiles by card name, so userspace then finds no profile and
the card is unusable until the next boot.

Save the original name before setting the topology name, and restore it
from a devm action that runs before the string is freed.

Fixes: ec4489c43efe ("ASoC: soc-card: add snd_soc_card_set_topology_name()")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../mediatek/common/mtk-soundcard-driver.c    | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 4bb98412feb11..a84f4ab4488b7 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -185,6 +185,43 @@ const struct snd_soc_ops mtk_soundcard_common_capture_ops = {
 };
 EXPORT_SYMBOL_GPL(mtk_soundcard_common_capture_ops);
 
+struct mtk_soundcard_name {
+	struct snd_soc_card *card;
+	const char *name;
+};
+
+static void mtk_soundcard_restore_name(void *data)
+{
+	struct mtk_soundcard_name *saved = data;
+
+	saved->card->name = saved->name;
+	saved->card->topology_shortname = NULL;
+}
+
+/*
+ * The card is static and outlives this probe, but the topology name is
+ * devm-allocated. Restore the original name when the probe's resources are
+ * released, so that a deferred or failed probe does not leave the card name
+ * pointing to freed memory for the next one.
+ */
+static int mtk_soundcard_set_topology_name(struct device *dev,
+					   struct snd_soc_card *card)
+{
+	struct mtk_soundcard_name *saved;
+
+	saved = devm_kzalloc(dev, sizeof(*saved), GFP_KERNEL);
+	if (!saved)
+		return -ENOMEM;
+
+	saved->card = card;
+	saved->name = card->name;
+	card->topology_shortname = NULL;
+
+	snd_soc_card_set_topology_name(card, "sof");
+
+	return devm_add_action_or_reset(dev, mtk_soundcard_restore_name, saved);
+}
+
 int mtk_soundcard_common_probe(struct platform_device *pdev)
 {
 	struct device_node *platform_node, *adsp_node, *accdet_node;
@@ -292,7 +329,12 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 		card->probe = mtk_sof_card_probe;
 		card->late_probe = mtk_sof_card_late_probe;
 
-		snd_soc_card_set_topology_name(card, "sof");
+		ret = mtk_soundcard_set_topology_name(&pdev->dev, card);
+		if (ret) {
+			of_node_put(adsp_node);
+			of_node_put(platform_node);
+			return ret;
+		}
 	}
 
 	/*
-- 
2.55.0


