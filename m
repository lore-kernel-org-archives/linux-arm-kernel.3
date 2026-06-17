Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E136CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4V8d0Yg4cyesbpB3rX5XFizQgFDCgrflJrinbH7M1Rc=; b=ehmuI+TMegOmlGXjMUwrJGVrN+
	Oz+LUbriGl7087zDwEblfwI+CU9Tc0QviIuqu9HBKibyQ2/ws6MiQrrEZtrn5oY1N/z0q7T6p3oaE
	Q6vsFAXsRHjGZSH/Y9qLJwWEfPv7iX0g3LEvGFy+ssLrlNWhUre1sSYTlH9iZuVqJulUq0FGvdCQE
	YA+WT3aOUscfMYPmLeBfo21c3Bgji47DMi/PfQ4aY1m9WdhSV/cWH06humRIHLz4QW9JUqyn3/430
	nE3himMNFcBrOqFUEAmuzXg+A0E3TNNlb5m5kG+ftc4bzHODk7BqoJF87+rXBK+ChHWei7E45jLHD
	4vGMFFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngB-0000000H8YX-1JRl;
	Wed, 17 Jun 2026 10:39:31 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZng8-0000000H8WM-3q19
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:39:29 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-30b6dad2382so6296113eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692768; x=1782297568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V8d0Yg4cyesbpB3rX5XFizQgFDCgrflJrinbH7M1Rc=;
        b=NTRLz68ZZ9n3hhxEU83dNxsAH7abGJEnymjAbgrWSdvjjU0SS4VCyoxRjp+BF1QQhH
         H1vw1JbVQhTCOYQHh4etlfP7ljs+WHyQIw0Sv2c4jEqvTCrJpAGyxaCnuJDlDdbFAjWe
         ggrjUt+RzA6fySWwdwCZJWDiI2IESyJC6BEB+S1Q7zahtyDjzVNh+RazBaDhbx66m8lG
         fE+NguZrGKP6P5IEKXO0XcdyXJSFqHV9otnwFLQ8Ysl4eRzTWm4TXBZyEfaB/9WbfYhR
         qImjc6Np4GIPVZmHoT6bIqo4I4dT5q002svOU++qnea7uSjQ4gHZoJU6d8n8gtNMXbq6
         mdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692768; x=1782297568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4V8d0Yg4cyesbpB3rX5XFizQgFDCgrflJrinbH7M1Rc=;
        b=BOk6i7fK73CghvLjkYTViZCN71j3CLB+1hmZGN8eIJbIQ6gm5FeMxEE+8CuYSOVJT0
         atfjMEWVK1J0LGXLL4rlLMtz8JJjQoRx4Qy4W35J15clPHTKPIsPihT7wcczodKl7iZR
         cbUYnK8ckZc7VG2U4SWo9lvQX2Xjq6X8Pr0R1on9xQ4uwctBFMTWaO9Pzg75rprC2M1y
         2rDYWAkAWqPbRX9eMfAMquNwrAanEhMOuiNKybZhsBrT46SPgaTS2SQNAwnDbNPpQjjb
         t64C519nXbP+rNkgp8sh4ur8YvhF2+GSSAaJ0fABDjhnepn6qxKx5HF22XIzll1mdfOG
         vACg==
X-Forwarded-Encrypted: i=1; AFNElJ+QdStjTdiv8pe/zee2PCvtSvNsbB5NjgbpirIV3Ytv0DiJz+Jc5UJRX6EH8ayO60XFWNriNTGkYBpOMRmQG+6x@lists.infradead.org
X-Gm-Message-State: AOJu0Yynm3wtYmUbW2UwrVh7TVcuMERm3Tn+SR0Ei3qkz4FrUIUpbqPv
	WIxcc6yQccZncB0KTK9yI8jSjrvDSF6ibuPkiZ45v0RsuAAH1KNc1NJl
X-Gm-Gg: AfdE7cl7rAVRVoQaXqCHWMflIQzFC75xO7slujBxaEF4WjOziIGyq+38f7P3OQ1J8S5
	vPDUi6x3d11/MncnY5aALP82NZdCbnOTbeOOR5ceUbafoqOF30Lmhs+1ojm+OCUz9igxZPtI+LY
	1Vpl4RwqCZurolCmBOr+5dgE1jzo9YY+snRdSk+SN+hcgkJqnnuGwmiyjFzljwRXBRfLrOoRw04
	NTkVn0qR/pmEtnPEKle3i3PJt0iJWRBqaspPhfUYT43WurDtJ0W17emFhjC6+uUFpHhJBMRGXoz
	PNEL9cBFA4YmAK9spAP1Y3eIyvfkBYNjB8v/H7fr08bWZlkaLeeCzHon6GBvvL0XU1YIRWzvhsb
	hmOU4VNzsJi0SVVfCwSpUVubPqiiMiy1NKbK+fRaY1IQJ8wig4KQSnnkkcf5hwdT9bu6qsGYBbi
	vK01JLHhKZsMXQbgLvStH6dde9HjrUvL8VxLDUPzbcJZHtjkQ=
X-Received: by 2002:a05:7300:2d20:b0:304:d835:274 with SMTP id 5a478bee46e88-30bcae227f9mr1625563eec.24.1781692768114;
        Wed, 17 Jun 2026 03:39:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 41/78] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:58 +0700
Message-ID: <20260617103235.449609-42-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033928_957710_4BE2E79D 
X-CRM114-Status: GOOD (  11.66  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5514-spi.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 199507d12841..be4f5f7da22e 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -79,17 +79,17 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	unsigned int cur_wp, remain_data;
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	if (!rt5514_dsp->substream) {
 		dev_err(rt5514_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5514_dsp->substream->runtime;
 	period_bytes = snd_pcm_lib_period_bytes(rt5514_dsp->substream);
 	if (!period_bytes) {
 		schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-		goto done;
+		return;
 	}
 
 	if (rt5514_dsp->buf_size % period_bytes)
@@ -111,7 +111,7 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 
 		if (remain_data < period_bytes) {
 			schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-			goto done;
+			return;
 		}
 	}
 
@@ -146,9 +146,6 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	snd_pcm_period_elapsed(rt5514_dsp->substream);
 
 	schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-
-done:
-	mutex_unlock(&rt5514_dsp->dma_lock);
 }
 
 static void rt5514_schedule_copy(struct rt5514_dsp *rt5514_dsp)
@@ -216,7 +213,7 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 		snd_soc_component_get_drvdata(component);
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	rt5514_dsp->substream = substream;
 	rt5514_dsp->dma_offset = 0;
 
@@ -225,8 +222,6 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 	if (buf[0] & RT5514_IRQ_STATUS_BIT)
 		rt5514_schedule_copy(rt5514_dsp);
 
-	mutex_unlock(&rt5514_dsp->dma_lock);
-
 	return 0;
 }
 
@@ -236,9 +231,8 @@ static int rt5514_spi_hw_free(struct snd_soc_component *component,
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5514_dsp->dma_lock);
-	rt5514_dsp->substream = NULL;
-	mutex_unlock(&rt5514_dsp->dma_lock);
+	scoped_guard(mutex, &rt5514_dsp->dma_lock)
+		rt5514_dsp->substream = NULL;
 
 	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
 
-- 
2.43.0


