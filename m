Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B03CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=; b=GjkpJF1QGwyHZN2PBh25L9fT5d
	T1nb2/oHNJrVKNLWBtJrTMuW2f04lWQOsytaPSOcr1wWHfLqfeUdg1CVBbdsn8Z3kPXc26TqXIL/e
	blynHBLw+P0nU0gQqUUPjS7hUk0yjnT/9VBslDCZQlO6mw29Jcz3q1Yji3WogTxcg+u0XsKRa5wCc
	aNddKlq82XeJitbVrF+8oVZMSDOCyoSfJkWZFNCMPc+z6J54P7vW5XfFU1omwpbnAVD9bPLMFO+q9
	LnQcn4EdPDcmxG/FHfRbYgSkKbnr5SRDI5ikFMiDke/ojGxnc5yvWP268cLYPlBI4IW8lBOcyCQSs
	7D4GU8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncu-0000000H5rh-3yNe;
	Wed, 17 Jun 2026 10:36:08 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncs-0000000H5pE-1eHr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:36:07 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30bbb1bc064so3544092eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692565; x=1782297365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=N91K16UJUxD2fhp1GCuU15b7IjqHafSjXgQRQkFqjpOK55aofk6Xfw8wrFfTjPeBs7
         2IgN75maYXBPlPjZfVIKmxu2Dg/Esg7TxqI9b8voe2tUzjhR5fBcOrGJm8O5bfe3u4Dd
         OCeDyh4eVoVOlsyr/YxInf4MnM/EXLVQa2F3yZvfZ80ntfFzlSb3NvuyK08255nstqbR
         nl0B5zAiIpuXjzB1p73lCp8klYNAeBPsB/tzaJBZBmRke2QFU3aiINQcFNnHYjIVG6qs
         bDtxWp8SsuANrbwWS4gG6wOMJtljfZeDUAvuc8ESZILNeJAzvHATjpT0rohRLHrdGq0c
         4qyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692565; x=1782297365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=iF5CtE6nb+X1AEPDqx/F2xwjORWbcIEjc1NlifsihRQ/R4MeNI0VjdmkjszQTh5rfa
         CUb4qAOddWLY0h8Ck73kpD81exKX3zgvWd0NizZ87RnvYGsybvNWSWwOsKQI/J/sY86v
         nNyVOAnGcDATIt0K9Lq5FmLRzgqSrrAyppgI2IjVaHynWHgZtcjsBR3g8t5tSZ6toWHk
         WbTZjR+dJ/89IBVPWXP3ZouWFk2AbU5fre6qSjnTaosYKNFlxcXmN+X6ghwuDgI6NFnb
         o00ymJM3C18VfpxqibX4P9eQzDtxKcOgS2lMVYng1OuagjqSZcNZOoxmvJBpME0JfAFD
         AEMQ==
X-Forwarded-Encrypted: i=1; AFNElJ998rYUia76cjOz68MgeeCrCn9YgWsLw4lyuJZAbsjIMjO1L7eANfoNRGoRosK/scimdXNw4z9NI+gWqb5/kafR@lists.infradead.org
X-Gm-Message-State: AOJu0YzbVw0T0sT8PbZnojCzAeM/pTvT5ajeTO3l1L8KZr0mNK3LBJDp
	U1cIdQ3VzWnE9HLRnccY0pRfOSlRaC6OqbVOv1XVH8mONEyaNMERcP5W
X-Gm-Gg: AfdE7ck0886cgT+jm2BPCAZ5CS45rgguS4NO1KKQtz5CENbeR7uSPt0GeGdkzv4RsaG
	i5NJFdSHCw+/bK40PXfXMe8eA350XhmmridugZLOvmSy9h53isOgPendksLgQHpft1SRR3y+Kw3
	L0yLDP26iGTVyU2Z+JdlPypeWqkjdGs7lZG31xrH3wvca4looyrIk3iCvcpIf8Vw9AGr88rmPqf
	YP0G3uz8I3w+Cta9y0qDhtgLeOKjraQ5coEs4M7zmU7yvAxXCpyWMYBf5tQsFqbgqLwcry2OPNp
	cih7FSB+YiqQU3tmgKUaYdzU/8WvSiseT3+OhQg4j04cbmd2iTr34z60+VwbnYh3ksVb1R7tQh6
	8Djpr3aOG3KliV9InOz/rR13xFFYyXh5YYB/a0h4bi0fAebORdqimBlZSUPAmQvJ2eqIAC/TZLe
	peJtgSeD9G7z6b5AN2W7SnkNrCe2PWpnetJ5Qk4PQX5uLKGVqapwEYjsqfqQ==
X-Received: by 2002:a05:7300:2211:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30bc9ab88femr1691948eec.11.1781692565454;
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
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
Subject: [PATCH 20/78] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:37 +0700
Message-ID: <20260617103235.449609-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033606_428935_AA901AFD 
X-CRM114-Status: GOOD (  11.73  )
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
 sound/soc/codecs/cs47l85.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9c0eaf24bd54 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2504,9 +2504,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2536,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0


