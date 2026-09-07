Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED73C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hypdJ1T8+wnBdNrqYZPIpZvq2yuPSL7MjBj6zT473gM=; b=h5YBdIxDskjigHmRYOruun2WGS
	yjBN1H1NZN7QWGPA7Un7pAjdlRY9FmOrXTNmeYkziKvRarcubsmLc/V+qezonjUb/5b3BnEAST+8V
	gc3FI12/lxdKcv7ZQm8/OmIgBS0qZxVQNn5W5rx0YZ0ZnXsf3b8nnGYWyBELzojAAxmPQ5Flo6D/F
	s7CNKYNfxc7Ofg5dIx3miLXSTsB/+nTEZv3Y4UfTRnJ68aO4gob8ISyDZENM90XzKAAgdahNpaFQg
	t3tsjhEH4JJivRJRTvUe79+LJr/y1Uag9xtqyAQnAzPkFIsxPy5IUokvU6uVIH4BzGb/482xgYB9Z
	gl6g08Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y54-00000006kem-1FjD;
	Mon, 07 Sep 2026 12:04:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y52-00000006kc9-2ZLc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:04:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d5335cf904so33456395ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782648; x=1789387448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hypdJ1T8+wnBdNrqYZPIpZvq2yuPSL7MjBj6zT473gM=;
        b=n+UuRDxwQ2PgEkKYZZPPfCQYJUmVL94aBBejO1lpHYdB5nhkITPhQkk8Fy5hYvgQm8
         GCXObn590Mbnu3TNO0Io2ANMPgv3wmqCT9EhnWifkmfWppiVYXHkURoMeiw3XKJWl2v5
         pX0jOs/ESWlXqrWUBC3Kq6K+FGwFOXvP9bzvUUhnFkNhTRj9lPkpt/G82lAKGNQApBE4
         sNQYliBiRiGx864uFpYssmZ/18YsUjU4qcQhF3ZzmYB8HqmjIjRhasmu1Eks2KSmB7xw
         IMzTcKCsdH7TGQ90FSIeIAOj8LIiKuWALHuk/e5dIc9HS7EPhuDF45Z0mi5yzaZ//lT3
         jRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782648; x=1789387448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hypdJ1T8+wnBdNrqYZPIpZvq2yuPSL7MjBj6zT473gM=;
        b=NQ+GVCi3/R1fM1qidddgBNRVHDVKcXrWxhe71YUQcQ7B1Zqhu80tMQOt+F2kZXaVUk
         Xl5oToZHiZ290l0WPmEZjmMKbp+/Ga//35w9SINdIEA6DnLHgO7NqngQV9cD9TdFK3yl
         Yd86E49LSV8Cm9+zFgedGIq4z1JFrvRxZv4uGWT0ZlZ63G3EAPbw4myk4ssloEpHI630
         uhFqTgng9lKccgw2tTCg1EcupRzLPw8Lniat3+nYcK8tdWvRHOLDEcd4+EYwDAV5OuhC
         /B/d16xQ+nkuRcyFAjXPt1a7KIIXJDPKxeHU4zBtTQq2u0ofKGbOIc5OflNPyKTYtGho
         1XCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwObkOEWb2aDQu1nhxnValUrvJz4ZgWwL+bEjvkWep0W6QLBwrWPqU2KieUwtJIRK3sI13t3Xb38XhYcz6OLti8@lists.infradead.org
X-Gm-Message-State: AFuF++kWcj0S4xkRU7lkC05J6AOrxY+LtanuP41V48urimtgpmznYb63
	OTiS3dzIAoBph9/CeyIyO49UslLhCnWk493Sqb1Zl6HVoTuRWHoTEfxG
X-Gm-Gg: AYBFou1eQ0NIdTVIxGI3P2M9ad5pv4WWROdOBeKO8w41OJTet20sP/3XAdmCZZx314R
	muuzoxabPmcXYmeaJEsJ7JkZB6UL+a02O8TSVG4F3aRvfS+fJMjidEO4G5KE4mOPJ2A6Fg7lV2F
	gfIpZaJLg8b2AhmFYnt/3LXWj1aNaU0aBuCIn81rvaR3lHM9kpvht21YPD40HJLk62oEqyIaZil
	n4LC5k0ABLix/5QsiCx7eNluHlvbDmYb6AeZPjQbd6i1JY/zRayVRHifTDaN53Sptj6ymcthyar
	b32R8WzGGi8OKfyMoXmsNJjZDImasvv4PkijlKBs0WERw0APfuTVDb2ssH8R3GMhPDGWo33AYh7
	bzT6i/OAvbA0EXCUYvlB03th7E1xBlXTq4DR74O3rhcRThycqNzikAUok7evuzdSDBTY0vMBtOz
	sCfbCD1XSOrg1j5CCsQKotmN3SEm6T/1akjb+Oe4gq8wf8C4S3agW0AKXt0w6QCAjKGN0Isv0II
	N7eJEzx0Xkjt1SXtbvQSYQCXQOKVSvl20vuctp7OjYkWZgjZGVIZcoLQ9bfSjgb28UMy/l6LUNj
	WYT9XQ==
X-Received: by 2002:a17:903:3d0f:b0:2d7:3f6e:5cb9 with SMTP id d9443c01a7336-2db12637ca1mr316713255ad.8.1788782647486;
        Mon, 07 Sep 2026 05:04:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/7] ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error messages
Date: Mon,  7 Sep 2026 19:03:09 +0700
Message-ID: <20260907120310.135693-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050408_646068_742F035E 
X-CRM114-Status: GOOD (  13.79  )
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

Several probe error paths print error messages that are already
reported by the called functions.

Return the original error directly for devm_platform_ioremap_resource(),
mt8188_afe_init_clock(), platform_get_irq(), and devm_request_irq()
instead of wrapping the errors with dev_err_probe().

Also remove the redundant "err_platform" warning from the component
registration error path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index f8cbe7bac36d..efad0af977f4 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3232,8 +3232,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	infra_ao = syscon_regmap_lookup_by_phandle(dev->of_node,
 						   "mediatek,infracfg");
@@ -3269,7 +3268,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8188_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error");
+		return ret;
 
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 
@@ -3302,12 +3301,12 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3363,10 +3362,8 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
 
 	mt8188_afe_init_registers(afe);
 
-- 
2.43.0


