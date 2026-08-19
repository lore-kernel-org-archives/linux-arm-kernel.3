Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C60AC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=; b=eKFV3x8ibSLlyPMfvtFXUt6NGh
	/jFbWw04Lt4/OU5VUA9/328ua8dRIWlM9f3P5VfBodmR735YmaPL4wp/RCRRNXuagJXBnE0WpmWQo
	xIHmqCnxIV810Rl8MQ83h40gZI3nOE2FkjKw+pyc5BntJBJt9G+MnWm44q333SfP59jkyXSEP04Zw
	jwR6uW3NZD+Xj8SLb/6+stuXhvqbY9UVy7UHnfrj7x/pgOUpu2noPaqEUlOh1QKDeL5IX4GQaVCw1
	FuM5wWf73om/F9Txs6CA/gnsXsa5gR38W2qdzNFNX+fSRzuiX6VewvJiZsP22xHgedeXz1098xEhc
	jsDwUqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOQ-00000009W3M-0kun;
	Wed, 19 Aug 2026 10:19:35 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO7-00000009VoP-3tHS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:18 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1436514a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134755; x=1787739555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=UZkvVPd9MHdAe7M8FurdskBB5tjvPt5cWf3ek3uDpHJCoinwy1G/4GH9CmUPmh7Y4+
         kbg5FZnEMestsiuwtBlxTBwgbkIQHd3LeM8jFi6CGOW/EnGZcVDRXPy8C8944nveZUHw
         QTc12KqsTZI77M/HrjPaHikQwfHgB9J66Lg35dJbbdMTOVVL6BogVpYsV6maJbPIwDQB
         wcQLpscGvgZ/LdBiSJeiTUUhQWweCL1kldLpwSqwg4jaXNaiaKlLSE/LS6GsgcVTS45h
         6Q5oZg+paUSl5NB1JCL1Slu2P0sF7OGWo+6/26ie8uAwi8V13gLX3xUaiVrth+4xwrpo
         VVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134755; x=1787739555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=jVkyjJFvA9Wd7Vpt6bAq6yNGiw+Am8zo61M8C0FfNdaQ55FBhBOp63ARXITyJ8el+J
         NXNePTTRvkp7l1H4kkvI1yaNNi2+3djNDOHhaec1tQYUdYVI98uCRnLNu/twrSf+tq0w
         ZX51DvtD5iryHndC0MjmoRh87M0dBCZPtmeq3nIbU0zisRi63EjAjBcPLh2t/Znk00XB
         PZKOUEAWbP06KrVrErso/1Ny6uol+KRj/TBbATm6qmgyeQ4ftXCS+XbkIRwGoIfwQJGl
         Ys+yPJ0A2kMxbg4G/c+x5wRUw9iw1F//xknxJJwJFMIS5MXmHG1R4ShhKVEqVgEhajaa
         XPzg==
X-Forwarded-Encrypted: i=1; AHgh+Rqi4jW/saxfDBvsv/2aYzzV4puIVBc1U0HOZHnuBfjF3aBxDbZDYCToMXOgA6vTmIN3RHpS0NgtEd8BWVfcWXSM@lists.infradead.org
X-Gm-Message-State: AFuF++lhvTrNRcq92iGl+WwzeXD56iHd32jMOZAcY6JFgWgXDFzWRjbJ
	LW3BV3de530JgRJM1COlT177aWCt0XppQQSmHgI6vfkNZgurPfCpCBNi
X-Gm-Gg: AR+sD13ZJxrD+cJgL6rJ/H4jNujED/qOc9Ymw6kDW5Xnv8k55KsWPyBJM0yjaubuJI4
	0eC1c3aVBn4KbIhpaZjbq8pklkYAztLSV4m6faoQb1nqH61epmx0zAqbA+vBaN8f1/9QdabIvSV
	QTommbO03uRpR/EUTymTf1fWAEFjzoABXOsJbGxcdzkfn+BxWPuuZrY85YK8vrNPkTIPapDIbsq
	BrCxBEfd7j2/COJyOGe2oYLWEbIPjol/j0vrb3yjjoDxzaBt0suCHcbVz9Q8p0Pehg8kcN2J9Zn
	z6ljVzouvg4d6mYXcqDqBDswKG+AJjvt8AWO87eP7DP5XtP5z4uOCCWllvLzym/sYuHzTVKH2gJ
	/9lkUYTzhAxl6PeVeOs5hINaq1w+hAh9QcksxJGqvkA9dA55ERNk+xadZHYIaYCDC8bfZWZYe6Z
	gH33xivrZFR0VFtDV38OEEeoXi6F/m+EpyeMPFV6J78F92zfT9234jeCynTmXv4tjNM1u14j/Rw
	v0nwaoYBFsqPPcf3ZM9bfFf/2aMmhuVYpQMiFZB7+tfFY8iNK2FYI1rMPGkudYf0J/bgiRZG6b3
	lgZBYMvlDv0J7xk=
X-Received: by 2002:a17:90b:1806:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-3957fa95452mr3353886a91.9.1787134754818;
        Wed, 19 Aug 2026 03:19:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Wed, 19 Aug 2026 17:18:49 +0700
Message-ID: <20260819101849.68010-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101849.68010-1-phucduc.bui@gmail.com>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031917_751234_9529EC0D 
X-CRM114-Status: GOOD (  13.50  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


