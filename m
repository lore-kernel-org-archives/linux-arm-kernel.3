Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EE6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjuVd7RI5k4hOIJinQsqh09SXyNVhRXdR0rTOUmxNmA=; b=IngbSpIw9QXSgAcMSUq3dk1Qh2
	Xfre2Z2bpiFy6qpLVYgtM2+rh9rgaJsUKZTPDOUSATaZHVSEir8A7I44IHpc5AD4PizLCWHp+Y4eg
	DN4/3/MJhztLIfbrLIoRgIMza3qHRfj8YuHJToEPrbsqkJpdt3sEYFXp7rz4KqPFgTgU/TnVmhQfm
	K+oiCMAzsNiMt8jkFYGycAbihiZZgFR30Ui6XX+uai3Mkj3tZ40qHEZGiyTfUECj824+euxaQZv9x
	am8pmLYBPqtqDs3R24Vjr3GegD57yVrZf4xbxs7S2ByJ7DonAGrMDU0WTip4DxVkOfbPlFomswDh7
	/T6KabhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuuo-00000005xg0-2OQ6;
	Mon, 17 Aug 2026 10:50:02 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuuk-00000005xdh-2X8V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:49:59 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2396825a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963798; x=1787568598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjuVd7RI5k4hOIJinQsqh09SXyNVhRXdR0rTOUmxNmA=;
        b=mDV+NDJi4JnqbO/tw/0OO+ooxtgGA7M8rr6WGphmu/ydUPZIruU/K2ZZv4rSoelS/e
         ADxxxMGC5GEyrflrIbBYmIHXfLBZOxjJahEC2chTQ6zSO3j60TalPTzz6pnXtkW3+t4m
         L3rOVXYQEctDzOJsmnpUA2ixUEkaLa2ULfLnO4uZWdDuUy4Y1wd9rf9Uw83qMMDCNMZn
         wpxXgLLj+ZZ/X3GL0Me/nqFoZAirpz9HcI/nSpZT5tvXdqbSWNI/3V147o8ujiKN2vUM
         3eG/8tpV0Nj7RCJVzIu5B6/hthWFxqNue6TSxbFnHE3cE7ltkVrJ3fZN5qnpQJt9TqoR
         byAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963798; x=1787568598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjuVd7RI5k4hOIJinQsqh09SXyNVhRXdR0rTOUmxNmA=;
        b=qS+j4Ejq3Hb+nR8S1zp98xT6fkXwvvuMMuwhkW9UjL0VP7ncQUS2tZED0l+Hwb6qnX
         mZK2oP58DFcM9e5eNZWBobgp6E7dEjIKt0sRAfEd2VngitTMgdjM5zV58c+V9d/4tH4i
         g0dvQi6UrFKJ5ndWDgcC4hJKpOWlRqgJTa3eX7PDgH3Xy7w+xPP+ujDvFy8WGNdmu+po
         0VWRtJMrvo5jbp+3poLEsMFBl20oJKV264iXGeV2vhGOlWV4PmSm3EqUZ8m/ztFveozw
         2wPm62sX/6A8hDdh7Fi8VBrf6nc2Lj0jb9e5AZod1kl58MWLzT1KeQ/g3pQnLs0X6rrG
         NQBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhRRApu7SjROeDEnucSszzUEaQ03Yt9eN8gUlhKTO9TLOu1waTP0mXy7Sl7xGJtjNXm4uyD03IMRFKjGg6wQp8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy980FzkasYZtGUfdDqQfKzgqyPm3tw0KcjPmuDMxTrV0vTn87f
	OaJdO/QyjHUwJEXGaKngXf9O3Df46jQ+5bOiJ3HVlXm9zBXNq7lvmKqU
X-Gm-Gg: AR+sD11dpgBHR9KciRsOpyrXfnIfFV6eSsDUF+GC86YuErLMgdJ0tSYvZ2M8thY0lis
	cpC/tCagmdNiW3DQBPR5cRAMxWZkbkfbXCi6jcu2VaU9gLymoRWXaw/KcNrzTqc3NQecwqBum5I
	xAzoizkX+3fFh5Q+EElutgFw7OwU2y2Sg/Wfpk26dMKqdztIzTKXOHb5oqzGna3XzZUxPisDf9C
	XudBmxKDdi6EfLsTHlwRplVlkUSpV4rVsMVtq0UYWsKIYmaaXnYbNpWCubGKG+QyFeFLZfPDiiz
	f1zAThy57XIGGnH8tLSU8gNlKm0cW5DJr1JPgboYAg1oAOSB84/R40oHsUXEicS9Qz8XI1JN0Cd
	sJamTK59U3lc5dllAeBfHW1G/sTcyHvrQw0yyqU63M7pPOcPxDx4Z/uWo7Vd9wKgeZXKHREgBa3
	sAyc4M+xNPymKS0kgwdcxzeW0QOXjpSNnls6V6C8nt/jn0SR0mnSR8PKszjlW3jGQXa5bfby59j
	76ctNUqTnIEGsFVhcQUIB1zJEZZfpyTyC1ax86pHQANAz1Nvj7ayJ4twuVyX0+TkRliWQi33NjX
	eJrK
X-Received: by 2002:a17:90b:3d48:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3933b8939dfmr26013326a91.12.1786963797943;
        Mon, 17 Aug 2026 03:49:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bd51sm1885413a91.12.2026.08.17.03.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:49:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt2701: Drop redundant probe error messages
Date: Mon, 17 Aug 2026 17:49:29 +0700
Message-ID: <20260817104929.63152-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817104929.63152-1-phucduc.bui@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_034958_652413_EDE48432 
X-CRM114-Status: GOOD (  13.05  )
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
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c | 4 +---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 4 +---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c  | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index d56b498e8c0c..3c5a76591ea7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1622,10 +1622,8 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 778a9dccfcaa..af833a8daa2a 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -366,10 +366,8 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 							= codec_node_bt_mrg;
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
-	if (ret) {
-		dev_err(dev, "failed to parse audio-routing: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	priv->i2s1_in_mux_sel_1 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio1",
 							  GPIOD_OUT_LOW);
diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 84b3d6cd77a5..25ea3e274aa8 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -137,10 +137,8 @@ static int mt2701_wm8960_machine_probe(struct platform_device *pdev)
 	}
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
-	if (ret) {
-		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
+	if (ret)
 		goto put_codec_node;
-	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
-- 
2.43.0


