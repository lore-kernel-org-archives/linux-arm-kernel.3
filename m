Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5893C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDhRsljiXwH4R/2v4DqxrYu1sHb7R4NiCX/UTlOHxi0=; b=JaCxVTVviRkQawG34YAUKOBLtb
	58XWzUImIvIERGmmQuvpsxrhB1yN7TOFFXvVWSHguqWj/wO49mSDKXSLuqVB9eZXPa6ntz9OQRINA
	1YPmxtUN6oeuXOxKj2RPby4I5Op+AY6qTZ95CWzfNJbfPBOga2KRWxoCiPe7chATF0FcfHndB9h57
	jLa+dpIHAUyfSzFyOnCl7vPYorTX79ivoCQFyDWpT6x/pDOz97wnRyzO0rUWpVgDIe7Ik395L5Fgj
	kHyn7dAHydoos54yfMNRUsp7TDAlionmz5liH+Q6fqOpc+3pp06pCoLc6op4N0TCSW+EIAEr+2xLL
	PrydUWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpX-0000000Eb8j-09n6;
	Fri, 18 Sep 2026 13:40:43 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpB-0000000Eaq1-2D6W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:27 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b350c6920so655091a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738821; x=1790343621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDhRsljiXwH4R/2v4DqxrYu1sHb7R4NiCX/UTlOHxi0=;
        b=rxvHhOM95dqHTdqMmjdjoJQApgLnmlO4LwASKpEQJesyqCYLZzvwxg+1kgqY4R4fWA
         XITR4lXmt16tYfbPisG+J8GZUwycFvPF+38LdUncFlQP+2bXhevPQXWI4aC3xn/akxLa
         G85nzp54wQ4xCm28g5p0uvR4RDjyJVMbA3/1P24xh84G7MGghkt4u6CXgOEGKANfMJXO
         LmSIcnxSJJl4eQ+LTD2SBOeOynVacQ7RUICX1pmmEf5PIEKU+j1aewpJKLPXcDHUU26k
         GgvF6fAk2p8t+2L0/xJl6GbSQcKLC8s3TTpJXb5595uVLDuwFVySvAUfdjiDBWrMlj6H
         U66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738821; x=1790343621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDhRsljiXwH4R/2v4DqxrYu1sHb7R4NiCX/UTlOHxi0=;
        b=0Y9P/9u2z6vlpQEojP0w4mLIKqwZjVJVC2bf8AEtmwFen/6Ce63KtEv048cf2OdyDe
         +UlxLhCc9XvJphhJeF1unOYohbqxgdWdxtSwAWitGyqrxXMGRPRjbUbBUIJ4u8IlA5PY
         kZdWqKKuco4KX1ELF3aNZHx62lFqZBPQcnp8uimEYueCT8q9eKoahnP/6HrWKZXL1ZsI
         hHynrZPmfGMWDAJwVJwDYOvzYmRIleqKlsIkFpa3GHDD0p+ABcYqr39tpAwRi1Ck/mjV
         T0Zm2uVT4wh5tWvcZQB5O5tqWnneOhe+JLmsSlls3rjbIdlELScZ5GAcI1tKilNEZLK7
         2hDw==
X-Forwarded-Encrypted: i=1; AKwUvBwqds2d3MFzvkq3Bi0V7ReyZ289M+yDUwbNPaBYmRSFalryglgGbi3BwgP8orAScwA0n2tPeq0JVOmXzpZex7LG@lists.infradead.org
X-Gm-Message-State: AFuF++lq58Wd30gEbvRHYCtGv+cNLHT8FAtYgStEzoDN6Hrds9l5qLCi
	Paa//NNpDLdGWWlwXOAnNZrrXx3Thdzj4vQ89H+AKJ7SVWbp5fTGr5yYmfvQhQ==
X-Gm-Gg: AYBFou1FAnd8njV7qRRdH+G2u9QdK1qyEGMiAT0JeVh1ueOBGYGzb//wcxf0QJKWSNO
	D/uzw7Qx0sB4ussTYFHcwU4EZvBc8Zu/petQXzo4QvoKAUGQviJIT8h5hqhyNBV14TK6m2kWlKB
	+fzgNYHfDuRAsCmnA1ob0S2UYiap3ql62HqwFI7EK2hzgDFJ/kt8mclYAhGnihFZWd2fPZMXM2P
	MerZeresT1dJ3VmzdxtyP2JoIgDb9NzRHPUhUvj4EyKpHNx/4L4BhfivCzcrZDeuwboTnbYzJSh
	8MRqAcz8UQY3NC7SdjcW7E8MrAqQwNF/4MDh0ic7XdYKZTFYiGb+evLOFKkXhxI3ZbyklAFVIZf
	Utm8iLGFsr4KABuwzWw80u8PPTUBdeFInTO6hVDjEBJdNN0/LhuGkOxTpb6eEp5GnTdRIRNP6aO
	jUIqIPlh4D/keHxY43kff6qty7MwNNjywWLVDt2A3nIUUpgoGV+WCYpT2PyGJ79Ufu/r8Kija7K
	cPa08xjMeejaNZwgbhB47eF5lf06QS7NgGsg9tPdSVGcJJEB8MmndOGMyDPyr+4sA1/gVnCwWhc
	x+kPgptOuIgrGg==
X-Received: by 2002:a17:90b:3b85:b0:39e:4c7f:7305 with SMTP id 98e67ed59e1d1-39e5504d3d9mr5689902a91.28.1789738820802;
        Fri, 18 Sep 2026 06:40:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/15] ASoC: mediatek: mt8192: Use dev_err_probe() for devm_pinctrl_get()
Date: Fri, 18 Sep 2026 20:39:04 +0700
Message-ID: <20260918133912.133799-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064022_545575_DA90AE0E 
X-CRM114-Status: GOOD (  12.25  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index ed6dfdf2589b..d4218f9708f7 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -132,12 +132,8 @@ int mt8192_afe_gpio_init(struct device *dev)
 	int i, ret;
 
 	aud_pinctrl = devm_pinctrl_get(dev);
-	if (IS_ERR(aud_pinctrl)) {
-		ret = PTR_ERR(aud_pinctrl);
-		dev_err(dev, "%s(), ret %d, cannot get aud_pinctrl!\n",
-			__func__, ret);
-		return ret;
-	}
+	if (IS_ERR(aud_pinctrl))
+		return dev_err_probe(dev, PTR_ERR(aud_pinctrl), "cannot get aud_pinctrl!\n");
 
 	for (i = 0; i < ARRAY_SIZE(aud_gpios); i++) {
 		aud_gpios[i].gpioctrl = pinctrl_lookup_state(aud_pinctrl,
-- 
2.43.0


