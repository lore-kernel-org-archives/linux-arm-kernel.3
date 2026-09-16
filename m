Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D380C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6hZRc7AVMqT+dPho3OXEUUZfvSnaC+QBxw2ObR4QHA=; b=GDnrJYc2+xCYb1ihAxZSPeVBYV
	tiD0cdeGqL6L9Ph5cviRDHsSEqajtlPuKtsu4jmRXldZzJcKnXKNDYEpJk62ns0/TWFVOrfqcn8LG
	hpQ2N3oJoZyyuvZSykqFkM205h7mDVx3MUF5/0blgdcECVQZeXD59k36ZY1TLzdgjZP3vntWL3KwP
	7clMpNKuPDHmgA0ZzvmqgvRaUcHZfn4/PY4s7ROv5VnAXsgvilzLvOkqotsRxKq+VD5asKVrxn8e9
	0lapMoLILENlLbfyD1uFn/sc+b9k7GsIGYSDCm7EWBbpIepQXHwFKWs2HlYMJ+WtvVhBDSbpFucuM
	Sh84CEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hm2-00000008LeO-23s3;
	Wed, 16 Sep 2026 05:01:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlp-00000008LRo-22ct
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=a6hZRc7AVMqT+dPho3OXEUUZfvSnaC+QBxw2ObR4QHA=; b=jkZ0M+cUQWC/7V4GUU0BohV+IY
	tIT1ukGGlgSJh8h4oJRCk6ylrrBIg/hOf6kk8FEtgM6avGT8g5RqEcL2t2gAhsuu2fHud57mSY/C6
	dgdexJ5yr2Y4/amPhfqNCdxcDgaQZX76Ghi+EWnmC96o0+Wnu59UJhWcNDMRtvpVxZJFOd8M2pJTg
	tttyQD0MWBotuBxRs/XqGJbq4dJRQJ1H9m6ZCmKh65dcUlgqHxZfEMH93qP3OeOGl0f+z5V8jVBI8
	SRtGUZCwBAe6IMg3//HZUf2LI+YBs+LUYiqjskoR/GPchv9lX8gdAq0vmYQB5XByJpz4ohG2QXrQo
	xADj6Dmg==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hll-00000007ULf-46uU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:20 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so308947a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534876; x=1790139676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6hZRc7AVMqT+dPho3OXEUUZfvSnaC+QBxw2ObR4QHA=;
        b=DKh4R777JktjKgCpGWnJkUv1dGL9LGYyRpqC69hXr1Sr1Ho/xfC0VlzfVxjopKslLN
         o6vPrZzvtrHZulMls2H1Pkyt2OV+xN6EFWuVW5mQ+Wt69Y8eAu7jLqeB9rBpFzsqPOrW
         x8PeN4TUm/cJ/FB1oBPw0vexaNfFXoUF0Ye4GL4tbinU6Y/2fkEbQldBJ1Y6Qs6FItFE
         DkRXNKKluBzMsqM34nmXu6ZAeBC7raNAuaNOUf+VzfWwZtvyd76OkoMTbNdQsUcXl1zN
         MsMlFCP72cxuicaTBor6gkXh+XV5EWQ+ga6eUrt8tfqw+FqSGq6gQcc+w31kq1/k3A6w
         8oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534876; x=1790139676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6hZRc7AVMqT+dPho3OXEUUZfvSnaC+QBxw2ObR4QHA=;
        b=BvGsAr+D7IVur2rAgETLC9TZJjna0ruz52YY8zL20e8rxrbl6wCXU6gQFDN+XXRdvw
         MMc6P5OIWmp+Kgk0GpzIoZDzOgh0NQAqpMUroY8ZdlPgww4vF7tUbxhLqElLD2WFS8QR
         Yt6Gah7AvnuuToXWSeR+bmS3AUfRAb2iIIYb2HPzgdfSCl38pMmWHVAI451bBA+LDwdW
         dEKzJ19EqNoIu1Z96YHVPqieUM38cjq+FQPBOKFUaqWnOODJdb40J6uHKG0vmBnhx95e
         xcdQUxnYFKohCchmtG66qA1VV/Oovw8wUFhgoyLNcXzTrXop2TK8LWqEb9T362+mSKDt
         Ty0g==
X-Forwarded-Encrypted: i=1; AKwUvBxpqKEF6rVkNy5tg+Ih1DiIsIRwK7wry9kLP2QX64sQaEhw4ut1GRAhwChXgoCuKr/gU9j3/P/3KvpykCGEuEN8@lists.infradead.org
X-Gm-Message-State: AFuF++mLkOmvdYbQUYYKeEBb7n4V00MAtBsy13sSBgcg4zwZhoRl4iwR
	/bUbwNgojpOm+ONjWcc/xn4POjoRdgn1yHNGx1jGrmGpUH20zJ5UttLp
X-Gm-Gg: AYBFou0fFIKtXcwi2PkCEfokinzT89sbD7EgwQpGYqTSkeUfpoJWEju7CRi6H4vpIGE
	1pbCmsbcB0ApvB+JRbb5+FY8lmZ4l9RPDtjXG0HUE1PK88W1Xua8xAMCmEKh+nVNYUCBU35Y/Sv
	cbmszR53xAJqxnwSlFoXuC9r3KWfYIklG57b153hfQpZbQzGN49WzbUus0k4/cPbrLa8Ow5oDfO
	V2q5WaUIjhGQucfSfneZrayb69cMuRXDPiuP5WCtnOEVRJIdlnpWmS/mNoG8bx99UkQvcY8OZ1m
	6xQDMwapwVUzV7h6qc5TJlnNXy1S5QuITA28f7LtZ9icW5gEMxifccWDBU9i9osHs4J6MtIpSa2
	fIm2hImS66UqZcTOHeeU3qcPWziFanV7EUdv5kThfjziDEWtKV5hiqU3t44LW+vkUM31GMr7gwF
	PVJV/WlXAwxHLjTFImv8eJUg9Nt0SKc8hCF/gauHyb9HRdzx05MrXkEOr6ckCzOuV2zHgIMqdBI
	y3c3A6HvOOYxw1dlpHg3JuQOvMzNwj3LB3WaTcgPyUasr8Q88YBELU1UtpL5NetCnfmBszwm2Yn
	zbebKIktiQ3XH1w=
X-Received: by 2002:a05:6a20:d48e:b0:3da:1e2f:3be9 with SMTP id adf61e73a8af0-3dd5f720482mr3249802637.22.1789534875984;
        Tue, 15 Sep 2026 22:01:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 07/12] ASoC: mediatek: mt8189: Remove redundant error message
Date: Wed, 16 Sep 2026 12:00:14 +0700
Message-ID: <20260916050020.14575-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060118_757164_E4FE8C0C 
X-CRM114-Status: GOOD (  13.89  )
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
dev_err() and dev_err_probe() call is redundant and can be removed.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 39cc2804ad4c..11dba86c3e81 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2486,13 +2486,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	/* init audio related clock */
 	ret = mt8189_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2526,13 +2525,13 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2601,10 +2600,8 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8189_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0


