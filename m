Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE22CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBhrbnQZkkDV1+28VAJe073K28r+xjYcWQgKCYCLNoY=; b=bABGSUT1aRdZUEuF8Tv7BzYL4M
	+A6Y8MgYRS2SpfqOCEdGoSn+pj+zLkx4W0KGXpKRDQjz5YWtREMTaJcWAfyZg9jQQep+yf07eZyxv
	CEdsJJnqlCT/VC6Lakz9aUuB9y0NXHwBWZvthTZo3y4NpdfJ5WPxte44reHxbKs9zEd97sHAnE1hu
	OfpJXnqKKHqtQ0JVXK+OngekMMyNvUsG/AjpyHY6Xy0tknTWGUUQmrzyTyWNW8CdtIFfXERJuCCi4
	UPrGsC6xDzgykxbhJhGQokJt1oDDCs2sXkdxbhadFLji5rqIAoZ/TjUuE6gmB8izpWqaNNyxINGko
	7QDZRt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaCm-00000003dvS-0YH5;
	Mon, 08 Jun 2026 13:39:52 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaCj-00000003dup-0cGh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:39:50 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-13807d2f898so3040643c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925988; x=1781530788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBhrbnQZkkDV1+28VAJe073K28r+xjYcWQgKCYCLNoY=;
        b=ohilFr1FMUpeVBaKMfz9FruDDWa0xF1dwajqg/5ZWZqE6IwyVLbWfPvTlVj1y7DPi3
         E8v0XjcWGFl1VqWVcw4UZMm7qSXFKfwTjxLnIGOhc3AGAzHDs7RXeO8uf1NcGM75poi0
         GYRiVrzrVaE9kaf0qIgKcu1NjNWO5X8ESyzrcnNHKZQM2FiiznijsEMHzdPvXUSOmaOL
         0YmtfSC3dnzWjsYbZ/IvClKkGX7tuNg7y6eTwk4qfq3YDfFY+b+CBUlcL/1uu9JpvHj/
         6tvKULRlJcq0vk7KA0bU7InMq6O0P2DVrluRUgOEvJMS1kBE2wlb+Z+N5mvEsTG/4M6E
         C1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925988; x=1781530788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBhrbnQZkkDV1+28VAJe073K28r+xjYcWQgKCYCLNoY=;
        b=UFE8cbt4TmYpNp+3KoWnLskdjcxPGjdr07K9RorSBz0ZDVxuYLN98hwoWQbFH48wen
         U4mWRvSfi5azkghiM4+ggk6F5XwdfrYU+io81SxXyGlQHo9K86KelcU1niEHIBf7FO8s
         yLI5+wFoj90qv32eeGXW88DRRmVIvwuh/gOyDNt9e/vjdlo+WpQP0DxqbrMnNj9K1Joo
         l5dUL/q7rMrmHsALwNU8p/apR8TOvGb1qvsNEiAyb5zkjMbEF89uoufiSAm7Y3pl2RkA
         pcQtEkdjEuKfVb30hRSaH5NYDtl0UAT4dYIjF/JHelaBO7Mac9+Y9MyUEX064+G6SKSj
         5ZYA==
X-Forwarded-Encrypted: i=1; AFNElJ/8Ylz6GsO7BhOopXGtolui4sNLnBU49gMsq7QMfdTf6317wg4y1/GgDzSGozADwytcaNVzDqZFOxFmvJPnaAON@lists.infradead.org
X-Gm-Message-State: AOJu0YzApE5UFr4cM7nshJHS1rWAv9+8tPoTIyRAuJXdZ7FYAQcXfgHX
	2UwYEaFLMxPny8KwSrpkjgnYhWLmUH5u5kT2ZAkXHSDn7LcUQnTafNVNIxOosx5c
X-Gm-Gg: Acq92OFDBUHJ8vqJsxJfIF/K86pPvoM3w2zBu19RFD4Xw0uyHwqdtBV5JmcmtvaKOaz
	SsCn76RQFWzoHjRch9NNevsRCmPyCiiI0bCNLSfG8t6ESWJ2NyE7lA1ciRPT4cDnipN25f1Vlpb
	w8ynGzQTwCQF9vKmif811nWtUQ8Z0DTDV93XbVB83XNpeKnPJlJ4grNjkt9xxhTUo0mhr3vIgYy
	m8xYUtFd6/dWLPS6NEdIDmPr7TA2VzphIFmFaaLbxPas4+wYym4WqO2sMsh2RRwueqdhuD+5acP
	5EXi1OhZWxn0oEqOey/qXWIkXAJXjNhX0Pdz//aHiiodJtlX61pL0oNu6Fsk38u4JjeuI+LCfxV
	a9hzCjdfUnuHgwohZZxp7EOd6P/A23bOy9GoPPJQoE0u4pbfMnT70FuaNYGJTilyLJ60LCRpl7C
	QCHHOLRPL7+7iRLjkOMaq8IUh934OzHB8gBPn1K/FweGWnxh7lnRa+95p5DK8oXgmK4WnC1riE7
	tluMk12WkEWmjj01CMeGx0=
X-Received: by 2002:a05:7300:230b:b0:304:2eb0:2726 with SMTP id 5a478bee46e88-3077b22df0fmr7429361eec.25.1780925987987;
        Mon, 08 Jun 2026 06:39:47 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:47 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 08 Jun 2026 10:39:11 -0300
Subject: [PATCH 1/3] ASoC: qcom: common: use scoped OF node handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-1-9e3ac518dc2e@gmail.com>
References: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
In-Reply-To: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4019;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=Fku3y1CGF4nhcunbUPtMiClanJb89VvqUuwkh2+knqc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxySsmP6Uc+po3Tn/8kP/s2fH8w/HHkoXC4xxXeCRb
 /CAZ39pRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzk1y+GPxwrOKKqzBacSJxt
 9/tcgR5Dgp68lparbeMO/TVCrQstljMynC35KmN89b1HxdbVHh9ufDaRTzlueZRld/yU+ZP/P/X
 ewwAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_063949_195021_E1F96118 
X-CRM114-Status: GOOD (  14.53  )
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

qcom_snd_parse_of() manually drops the link child node and the
cpu/platform/codec child nodes on error paths and at the end of each
iteration.

Use for_each_available_child_of_node_scoped() for the link node and
__free(device_node) for the named child nodes. This keeps the existing
ownership rules for DAI component phandle references, while removing the
manual cleanup labels from a path that has previously needed OF refcount
fixes.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/qcom/common.c | 47 +++++++++++++++--------------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..edc4611691f7 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -25,10 +25,6 @@ static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
-	struct device_node *np;
-	struct device_node *codec = NULL;
-	struct device_node *platform = NULL;
-	struct device_node *cpu = NULL;
 	struct device *dev = card->dev;
 	struct snd_soc_dai_link *link;
 	struct of_phandle_args args;
@@ -82,12 +78,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	card->num_links = num_links;
 	link = card->dai_link;
 
-	for_each_available_child_of_node(dev->of_node, np) {
+	for_each_available_child_of_node_scoped(dev->of_node, np) {
 		dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
-		if (!dlc) {
-			ret = -ENOMEM;
-			goto err_put_np;
-		}
+		if (!dlc)
+			return -ENOMEM;
 
 		link->cpus	= &dlc[0];
 		link->platforms	= &dlc[1];
@@ -98,32 +92,33 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		ret = of_property_read_string(np, "link-name", &link->name);
 		if (ret) {
 			dev_err(card->dev, "error getting codec dai_link name\n");
-			goto err_put_np;
+			return ret;
 		}
 
-		cpu = of_get_child_by_name(np, "cpu");
-		platform = of_get_child_by_name(np, "platform");
-		codec = of_get_child_by_name(np, "codec");
+		struct device_node *cpu __free(device_node) =
+			of_get_child_by_name(np, "cpu");
+		struct device_node *platform __free(device_node) =
+			of_get_child_by_name(np, "platform");
+		struct device_node *codec __free(device_node) =
+			of_get_child_by_name(np, "codec");
 
 		if (!cpu) {
 			dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
-			goto err;
+			return ret;
 		}
 
 		link->id = args.args[0];
 
 		if (link->id >= LPASS_MAX_PORT) {
 			dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, link->id);
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		if (platform) {
@@ -132,8 +127,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 					0);
 			if (!link->platforms->of_node) {
 				dev_err(card->dev, "%s: platform dai not found\n", link->name);
-				ret = -EINVAL;
-				goto err;
+				return -EINVAL;
 			}
 		} else {
 			link->platforms->of_node = link->cpus->of_node;
@@ -144,7 +138,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			if (ret < 0) {
 				dev_err_probe(card->dev, ret,
 					      "%s: codec dai not found\n", link->name);
-				goto err;
+				return ret;
 			}
 
 			if (platform) {
@@ -167,10 +161,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->stream_name = link->name;
 		link++;
-
-		of_node_put(cpu);
-		of_node_put(codec);
-		of_node_put(platform);
 	}
 
 	if (!card->dapm_widgets) {
@@ -179,13 +169,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	}
 
 	return 0;
-err:
-	of_node_put(cpu);
-	of_node_put(codec);
-	of_node_put(platform);
-err_put_np:
-	of_node_put(np);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 

-- 
2.54.0


