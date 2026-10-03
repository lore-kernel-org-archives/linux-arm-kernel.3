Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3E7CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 19:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgr4pHrZo2qwDF8ZFgFdxiB9TN8wC+wKv8BCpLbDH7E=; b=uQUczkLvfmVNWwJLYTA/UXen27
	6bSkptBLwhXqFYQkdTYShSozZHzsU5T5bZEmlbUR6/CfwoF+3be5vf37tyO7K/VS3AqMJW50+LFaJ
	ECvYgKDpeGnEGY7BI3hdH6PR5aAzJus4REqyg06gu4iebwb3dINpANK7WAVLzBlfKM989Inzurgeg
	Z0U5fv+LZcN5wdfqc2c4attwQf6gQDxbMABIw5nCCWCY7HNjNwth/8Kru2ohyrj5es2ILLjri1JYU
	wHpJoJm25CGMDx4v9kbAHiNWcCB6pKJryzUjz/JptX5zMdC+pRXgj2IaiKUoZUZCcV20IaY+COuO6
	GfDWQTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fZ-0000000DxSI-08jS;
	Sat, 03 Oct 2026 19:45:17 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fS-0000000DxKX-2p2w;
	Sat, 03 Oct 2026 19:45:11 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgr4pHrZo2qwDF8ZFgFdxiB9TN8wC+wKv8BCpLbDH7E=;
	b=ahClsdTe7cTeQLSsKzawVavy2VEKP8wACr6NNn/bpmUr22gaHMmD7Ss26vtIV3m3VyVq2E
	ESrK47hKYUW0hXF+DMn6Ys7G8BrdEQN+YZOM6Tlmu8Jhdqr29W8cUFPQ9AGHybyBg/LcrW
	Q1CT5EX/iq/DxY9TeHP9QmL77bnd4HDfLiy8QJC1q/xCOjTUlaAEdux/nhv8aZ0jiXLOqu
	wc+olNPcYIQGy9W0bvH+CqlbF0UgUecIn5BP/Jdvd+64QV1xA9Z87D9Ii4srWVgmJg9kDk
	hynjeLat4Wh1D3u5yRgVww++j/74rj+9fWPqWX1XjJ6+fDLcTU5B1A0keKHurA==
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
Subject: [PATCH 4/4] ASoC: hdmi-codec: Don't parse an empty ELD on startup
Date: Sat,  3 Oct 2026 21:45:01 +0200
Message-ID: <20261003194501.832558-5-michal@nozomi.space>
In-Reply-To: <20261003194501.832558-1-michal@nozomi.space>
References: <20261003194501.832558-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_124510_882408_34D72CA7 
X-CRM114-Status: GOOD (  10.11  )
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

A bridge's get_eld() returns an all-zero ELD when no sink is connected.
hdmi_codec_startup() parses it unconditionally, so every open of a
disconnected HDMI/DP PCM logs:

  hdmi-audio-codec: HDMI: Unknown ELD version 0

Skip parsing when the ELD is empty and clear the previously parsed
copy instead. The ELD hw constraint already falls back to basic stereo
rates for an empty ELD, so stream setup is unchanged. plugged_cb()
likewise treats a parse failure as debug-only.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 sound/soc/codecs/hdmi-codec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 7aa50c5bd3df8..0e1e532dfc634 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -475,8 +475,12 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		if (ret)
 			return ret;
 
-		snd_parse_eld(dai->dev, &hcp->eld_parsed,
-			      hcp->eld, sizeof(hcp->eld));
+		/* An empty ELD means no sink is connected; nothing to parse. */
+		if (hcp->eld[0])
+			snd_parse_eld(dai->dev, &hcp->eld_parsed,
+				      hcp->eld, sizeof(hcp->eld));
+		else
+			memset(&hcp->eld_parsed, 0, sizeof(hcp->eld_parsed));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-- 
2.55.0


