Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43185FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOQASXH1zi/ymC17DpxSnsJj0Xv7qAzrcrKjqR45UNg=; b=svWdYBHw4/VlcFnCkccBiMCNUV
	gIO6PBZb2abnd5CzQG5kmlKMjuoANQG4T4TvR8mlGl3i93wk0P50GYsNuXJQhcwVyGVPylLKGW27C
	dU/QunNySX0oIB7ujeYO8P+iTL4q/hXqHBBUgwrIKJd2xO4V87ARNQwHaXpLcUlGG0oFAfZw5NZjG
	csqzg/s9AiBzTxQJbCHQQHJypV4P7knzg4YcUQj995Dc0FTDUsnHBr/IRAKLFbWGnbsAevDJvbxRI
	84P4UzJL8kuJkJwfNwyIwWycGUwk0Fg1xN5h4TGPZSwV5IhFBQJVkmlLdi1dqFPQXrDC8OWG8yh5d
	gHHXWWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI12I-00000003Je4-36tx;
	Wed, 29 Apr 2026 09:16:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI12G-00000003JcN-1yXr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:16:49 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso6823928b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777454207; x=1778059007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOQASXH1zi/ymC17DpxSnsJj0Xv7qAzrcrKjqR45UNg=;
        b=NRW4+2FF8xdNBMb3FSbj2MuIytF3fitn7ELtN1MnUaLRnTqsYt7io8fkNrrq4RBEIk
         p2s6RMgG7I2Mozq+KUDmrSpU9EeTeKqc6PJuxInl9+LRZuRTBi9c31gMVC2rOt6cWO2O
         U2Xm4OS20BlFUoxUVMnDSx0Pthi9SUkCQlE2+uT2U4oJYjusPBZAW4A/EcHu4UXLjGWZ
         YzkdSJ+ztzedWwpPHfBIm9/XbNCCKIKhqwRu6I2MfHZge/uiiXVQFkwNjk+cDO+7isBy
         D1MmELgTR66UEkKUxX1wCD8G8jvcUD4tqwJPOfuDJPrRiloAmjhhKwMrzq7Ey4FC2XBD
         qTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454207; x=1778059007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wOQASXH1zi/ymC17DpxSnsJj0Xv7qAzrcrKjqR45UNg=;
        b=IsGaQwHTk0VF/zVAfWr3qMhr/10DRTmgH/vK6ThEvatLTMpq1sWvaLOUdKvzdyOnoR
         OsC69TmaBxfcsQtmvuaabbDavsxUavyt/i5NP7TsiV8KtNMECGRzreSLHZV+FEBaCJgw
         knsp+tgFMTnF6T3lrHdzA5k47ju88r9ZhZPkhhBSMJy8BYbdxUGQKXVMvVmLcfkW3H7U
         BN9Rzn+DzpwWjEiGvPrjsy9zDnvaLkfi84u/Ey5Qyry7io9bDL0fsOVaKWwG5Xx9Hisq
         cs0H1oAg0ENIPnprpkk+JPJ1L8Ypf0cSkG8DYd04BS2S70Htoc84D3f/xBgEjNAhiAfx
         R3Sg==
X-Forwarded-Encrypted: i=1; AFNElJ9ycOYV+1EcIhY1Te9gV3HOsFBxb6ca1wvp1dw0OR+mylaMgW4cUD+oQqDJ0Jhe0fByAIHcDM8VP5RHcUAkaT5Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5tXwFFYe7jDaiBpuipvPiEjIo5v5PhJiieUc+RyW5fjbwMWBZ
	8sFeunRPlknNSlSJNoFgZ7odmqRmKLm5vt2n7IokAn9tbC8b6vVJgNOD
X-Gm-Gg: AeBDiesnGOw8C7etoiTO0IM+qgTbjaFB7A2MgfTBYlFczHMRDEQ1mrIWXVynDCbU4b7
	PhE1xg6NMt4QY9oYTVrUB66mTvOwUTvqb7casicaieU0RExgw6wJXa0BgfCHuoHaQp26tJ2MDW/
	S7E7CzGUTRaIO9iON05uCU/twaS6gZKOyPMvVNz9eOnyaXgYcBzAKEOrMk1toXDVBPLUi4laJmt
	4xpco2u+oTmwjqs/EehvOyVM46NqmBnmMNdhksKs3IQbQoZmkJbzTiRGKCBTdcxIWmO255UZNcX
	1L6Z4A4hrmmD6hafN4EOWrZgM7Pgy4Aek8Z/v6fBgREsBxOqx1Nz7KEI930lNzWP2mqga7qsEab
	A4SRUT87It1ymgacB4l3n3dGZP8vYm5a5GaHHnTtglPDcSpzj88speIhs/ZNsZe3sMitKUDC570
	70S/+K5YnpECCAnfxP567s1VvkXfFbawTkaaGj687ME1keRDEWFjbyIbDFJRr/UOfAfl0p
X-Received: by 2002:a05:6a00:1885:b0:82f:5c3f:94c6 with SMTP id d2e1a72fcca58-834ddc146c3mr6886356b3a.28.1777454207406;
        Wed, 29 Apr 2026 02:16:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd3b8sm1586865b3a.16.2026.04.29.02.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:16:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Joris Verhaegen <verhaegen@google.com>,
	Miller Liang <millerliang@google.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: uniphier: aio-dma: Use guard() for spin locks
Date: Wed, 29 Apr 2026 16:16:14 +0700
Message-ID: <20260429091614.96667-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429091614.96667-1-phucduc.bui@gmail.com>
References: <20260429091614.96667-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_021648_517512_B36840BB 
X-CRM114-Status: GOOD (  13.22  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/uniphier/aio-dma.c | 52 ++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index c1ca55997103..c01eae55d4fc 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -32,15 +32,15 @@ static void aiodma_pcm_irq(struct uniphier_aio_sub *sub)
 		runtime->channels * samples_to_bytes(runtime, 1);
 	int ret;
 
-	spin_lock(&sub->lock);
-	ret = aiodma_rb_set_threshold(sub, runtime->dma_bytes,
-				      sub->threshold + bytes);
-	if (!ret)
-		sub->threshold += bytes;
-
-	aiodma_rb_sync(sub, runtime->dma_addr, runtime->dma_bytes, bytes);
-	aiodma_rb_clear_irq(sub);
-	spin_unlock(&sub->lock);
+	scoped_guard(spinlock, &sub->lock) {
+		ret = aiodma_rb_set_threshold(sub, runtime->dma_bytes,
+					      sub->threshold + bytes);
+		if (!ret)
+			sub->threshold += bytes;
+
+		aiodma_rb_sync(sub, runtime->dma_addr, runtime->dma_bytes, bytes);
+		aiodma_rb_clear_irq(sub);
+	}
 
 	snd_pcm_period_elapsed(sub->substream);
 }
@@ -51,15 +51,15 @@ static void aiodma_compr_irq(struct uniphier_aio_sub *sub)
 	int bytes = runtime->fragment_size;
 	int ret;
 
-	spin_lock(&sub->lock);
-	ret = aiodma_rb_set_threshold(sub, sub->compr_bytes,
-				      sub->threshold + bytes);
-	if (!ret)
-		sub->threshold += bytes;
+	scoped_guard(spinlock, &sub->lock) {
+		ret = aiodma_rb_set_threshold(sub, sub->compr_bytes,
+					      sub->threshold + bytes);
+		if (!ret)
+			sub->threshold += bytes;
 
-	aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
-	aiodma_rb_clear_irq(sub);
-	spin_unlock(&sub->lock);
+		aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
+		aiodma_rb_clear_irq(sub);
+	}
 
 	snd_compr_fragment_elapsed(sub->cstream);
 }
@@ -113,18 +113,16 @@ static int uniphier_aiodma_prepare(struct snd_soc_component *component,
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
-	unsigned long flags;
 	int ret;
 
 	ret = aiodma_ch_set_param(sub);
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&sub->lock, flags);
-	ret = aiodma_rb_set_buffer(sub, runtime->dma_addr,
-				   runtime->dma_addr + runtime->dma_bytes,
-				   bytes);
-	spin_unlock_irqrestore(&sub->lock, flags);
+	scoped_guard(spinlock_irqsave, &sub->lock)
+		ret = aiodma_rb_set_buffer(sub, runtime->dma_addr,
+					   runtime->dma_addr + runtime->dma_bytes,
+					   bytes);
 	if (ret)
 		return ret;
 
@@ -141,9 +139,8 @@ static int uniphier_aiodma_trigger(struct snd_soc_component *component,
 	struct device *dev = &aio->chip->pdev->dev;
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
-	unsigned long flags;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		aiodma_rb_sync(sub, runtime->dma_addr, runtime->dma_bytes,
@@ -161,7 +158,6 @@ static int uniphier_aiodma_trigger(struct snd_soc_component *component,
 		dev_warn(dev, "Unknown trigger(%d) ignored\n", cmd);
 		break;
 	}
-	spin_unlock_irqrestore(&sub->lock, flags);
 
 	return 0;
 }
@@ -176,17 +172,15 @@ static snd_pcm_uframes_t uniphier_aiodma_pointer(
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
-	unsigned long flags;
 	snd_pcm_uframes_t pos;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 	aiodma_rb_sync(sub, runtime->dma_addr, runtime->dma_bytes, bytes);
 
 	if (sub->swm->dir == PORT_DIR_OUTPUT)
 		pos = bytes_to_frames(runtime, sub->rd_offs);
 	else
 		pos = bytes_to_frames(runtime, sub->wr_offs);
-	spin_unlock_irqrestore(&sub->lock, flags);
 
 	return pos;
 }
-- 
2.43.0


