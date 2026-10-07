Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BC3CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=; b=1q4mM4GH4vO5ck0XdCraNIIcI/
	SX8LGzhdX2sA+Wn2KGPcade38tAYndS4qTe8boP9D9bgmGMKTUW0JxicsFLyfYo9+klMZhDPkZNFX
	ZII6x3LTv7mepPNPBZeTbbp/Y4xPDP1UvyUFzo8VB9i25jkfUvNx4TEkkUi2r24tr2m6GbO6JgGtl
	lJeADb9Yl1UYJWG6/ipv+ZV4QePCUwN5RMushEGhyTJ1K/O+yh9olWpw8oBCg+yVi6rvCpU1MmAvY
	N0f2b/Rc15IqpJTMcz/jVmQkRJm0BhgdhKtVfTiQlzCpEmg/RVQp8wFiEGaicJtKDydk/0rRVtEZp
	S5CCKNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWr-00000002Gtb-3Jhd;
	Wed, 07 Oct 2026 11:09:45 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWo-00000002Grq-1U6A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:09:43 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc751eddf25so975805a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371381; x=1791976181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=Lb6chD7/ojGsvVrSLnJ5t+4U+gffkDq/oHB126o5bZCWvxSwiTUaD4CS7MA1l+I6fK
         M7p/qWdMXbxYe+p8U+OamwROclxKcn+61zQDRNwxmoMSQIzZjqmlDquKOLSJ1vuGzmAu
         ro0IbT8kguGIa7rtKXNXPxyWTz9CU39VY1QDUqp+o9lYVTatdyYR1mksYV0FV6GxxwjK
         57LHbIBIJTrGPeDjx9B04xBF6A1f/2mRnmFOolWmnNL+6tobF/pq+FFXw5mqIuchtXb/
         NhLQEmxnUbQccEhH/iQYfPsv6x1r19kTM1h+5PUqrA3fuZDY6uhtZefgrrewYhtOS5HX
         iAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371381; x=1791976181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=jwCNZ/UTg6TNFwhFmYV9BVFkMDsSDYSkYOfrKeCNckxadMaxwoRhDQ8/5ubqz5xCQT
         CJAwDo28tJEcStL8JlXduDP8Q0lnGKiK3zchsaRsPG8jiUiJ/ni5SaWuDo6sPjUtSaNm
         WSwe9clasjrrnIzOh+LUI42Y7Q4hx4sB6llCBehT6CnwyerKTU59OjrHOE9WL8DF4syR
         IQmc9zHJFxvk8iE9BcfmkitX1QNqKYNyD5u6HEj2Zso0IM21lgFoXobMZRM35D+lyWtb
         5xsbWpt/MbTsHMoPzqV8/nPe0VddaEXU73JjzQcirsc7BGsugpnslB/YkoNHm17iXwOZ
         3LYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoVbkaunqOzqg1Ps5dMi6ZexxxBAg5sjputwxkTTR7eQ2IOccqXeOlty3YYYLLc0bUDLlnCfQYsF3IzIEPk6sd@lists.infradead.org
X-Gm-Message-State: AFq9FYIN24bEgp6vkmXAFtAxyepN0P8xtgPt3+9YRdjnx+utEWIOBdmj
	WuN9/g914hqmkX3wTmKXAIEOxicu15td0IGy7OBlTbQpLPIAuB7L3eQW
X-Gm-Gg: AYBFou3n2AI5A4UEsAq4b2mhw5b56AT7S8a3EGCkneuoiCb4yFZy58e6jwuEael0NEs
	TF8BNRGDWUZfmBBAxbi5WcI6ytz01JPv6TgFNWVs5BPfSuwF8rTUzAZJ2StJIR+zkRKboun0JwP
	VKG4QoBdptxb+JciFaCCZzDnWAwnzWcj3tXt6OQyKqUDNDO5LtAOXjFMkS97Mbxf3v2A6kgYD0d
	wS/BJyN/20KR/+yZ8Jzkrowtg88YH33T98ER1EokrXIggO0Ic2/a/tmEvq8boAIuY6o4bZExsPV
	9OFX/0e9PIZD4k7A3yrCuGP0hyeAcQ8TNddE2rl+xzYYeezMYCYMnDYe1fLQZGHqG1kMgz57mG3
	mdeog4HWGJmZP221mwOgg6i5OaleQsPvRSAjcFFNJj6IaVDgy+qY7kpMciCSy4JsMIkPh9N89Bb
	0zY0d2k1ak4UV6jXDksR2K0KuxZomYuwoLtt9yaO+qtA9iTN05a6WdDapMlQ5CMAnrS6xv4sig+
	R1l2RdciVi7f7jpRGKu76gxOKu6Uhbjhc+tFCJOBDd3it3dbUYFXnRItCLMldP3WYHOa+7TLVoG
	wXLSkECRiW1gZw==
X-Received: by 2002:a17:90b:2d0b:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a89f649916mr1577999a91.6.1791371381444;
        Wed, 07 Oct 2026 04:09:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/4] ASoC: mediatek: common: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:55 +0700
Message-ID: <20261007110858.509341-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_040942_393210_351361C3 
X-CRM114-Status: GOOD (  13.56  )
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mtk_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 283b612429a2 ("ASoC: mediatek: implement mediatek common structure")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 948f606cbaf2..ec99bc4a5d5e 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -75,8 +75,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -88,10 +90,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_startup);
 
-- 
2.43.0


