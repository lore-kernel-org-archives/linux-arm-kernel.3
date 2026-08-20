Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A08C5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJCRYDZE3VyQeQed1gNiTmBloNm9vN2iVU/zKNvs6Uk=; b=SmTfytYV/ntae8kXoDjs9bdd2j
	2y4k30Xjk5VUGd/KVtJjNgPHBDjOT0utFUN1keoBr/6ny4hrPMx9huxU7cPAkfAwNSZEi4nsE0PIw
	lMr/Y0eoG3kfOsSB4nGBjVFAWZE5a1OgZa9udYWGBEEmDk2v9E++WDBSvz6MtmcRiLFrHEL09k/R0
	WFdCvJMQwgjIl7ldXkf/QohPRDk6+zRp3fOObTQp7TgGX5yuECBteMYGN1ZGUNCjnfFPKeweRAtX0
	znWd1u1ouTf5wk2TJqoZINBjy8vW3FtRLTLYJ/FWtLWbehwa7HSRAVc821V3o6YC+Uw+CaHKvcLwy
	bLuJbahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iO-0000000BQF1-0kIk;
	Thu, 20 Aug 2026 11:13:44 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iK-0000000BQBe-38up
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:42 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8486672f03cso1949273b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224420; x=1787829220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJCRYDZE3VyQeQed1gNiTmBloNm9vN2iVU/zKNvs6Uk=;
        b=J/DBhLvqPF2ExzsYDP6hciLoii9UWNRgW2jJdJlHOAkytFC7lGIIBeynmU9oM9tvPE
         D7RYDbAp0bI4FifbCyWllXRY1kLtoPrYHFjJhlK+Tqae3RHXBbfqJ0oR9KB/03dQZ60I
         bMbP9NmhxXcz6MSr2KXfjfrZUWOxP1AKO2YsXJB78sjgsliygzoHAVfw1Wo0Y8fvI1vE
         DHK6crTFGTXERseTW2PUFPogQRBwaT3r4UsQG8bP1rXXH9d9cQnhoNPH+zBabSuYg6je
         zTztXO1Yi3qQWBUN0MQlQePGSk2G1dJB6F4izedx4iCtp/EatlP6yT9xeZ8T79QBdP2F
         b9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224420; x=1787829220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJCRYDZE3VyQeQed1gNiTmBloNm9vN2iVU/zKNvs6Uk=;
        b=dSSaZ1VJ0U/UGuziv5jvORKmt7ZKZtVMzHauv4yY6s3sqjy4QwIs9thgo84tcQzZM1
         cqHP4O5Ynfih+MVhBTYpUL0v8/ADAYca6opj/edEUeCXoiFWVPhM1AjrmPBxPCTJVdEt
         sVO94FRtjQQlbLQcMkcG6ngUNFVRq8rUhB6pQA928l0VWlDYDFyKNMsSDA1nDLKfSCDA
         +rMK7Ec2DR1NJqYnAxjRTlFm+oHLfSeKXbXLyDTI3jCm8oIyLjfMPl3+YxfdkpvfIsh5
         FaY0kgfKGuGkP3ddXfkhX1LFMpqFJ6JJeyk6JEIWQ8qeu6dtxdaTkKsK/S7K8MRbqrxG
         6QVA==
X-Forwarded-Encrypted: i=1; AHgh+RpsHV9gZX9G9uU2LCWvTj7OCUYkdXITqDsrmQuiYLmI8LREAahn7LystlS8mPS0j9NSHxKEhIj1DH1+oYUMseB6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbh/e7gUp5wpmdXOKMx0wFiqsKQzcPLn40HS1LBUzlfxr2LM13
	XVMry2Z/qQR7l+ru8ETfLdavWNgf5VZskyFYbDbe8oohEvrrwdEF4u/W
X-Gm-Gg: AR+sD138Rn/bfuHNGKbIn4eartQ1snUnehaKjZ7sVlhwDJfF5+B9gSv6SmFBJCPjGXn
	LgE0RHk5YnhSiNXvD/TwJ9XXb/GsRklY85LrMoi9iu3YyKVlHmcALLmPYhCzxdV1Z0Znx+auZ2l
	mWcxrHIz/ZmcsZIxtP0h2wkhNb2pYgMLnudkQxxM4UGz11GMMsmaiYTBEpDsO0u5Auu6JKsuTIX
	JFHdepG1hZboll+MFkV/gn0EG4EMEyZsL59mUGUkubhZUDuz1TQgINWF5fZvYtdmb3InfaftqwW
	MRG6CzeaW1Un4J6tCOljn4i0TnbSSaTbmR9mLoV1G2DXy7TOVIBIMT9JEf0oWU4FrG4khCQGTF6
	oZ5lyRjCJd0O75D/OjRJZhhG8KmH/e08L/WfPhew2X0hNlE/Vy5ZlrnzVTg83XNAPa2jAIkxgnL
	Tzr5eqw7GyTMlGijAe96muz5bwnEFlsJMHWeY/kaUa5uzr5G3DoIGaWlVDvvDXL0zsg5wTaOcTO
	3m2pKwLZpja9dpmgRnuSxZhe4xQGUvF2VLG14DWl0UVrwMGMPj+9FqgM/+Z9Gv2OT0rE+sGcGCU
	Ff0tFkhJd+FA5xY=
X-Received: by 2002:a05:6a00:148a:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-851d3914f9bmr20061259b3a.11.1787224419796;
        Thu, 20 Aug 2026 04:13:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:39 -0700 (PDT)
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
Subject: [PATCH 3/5] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Thu, 20 Aug 2026 18:12:51 +0700
Message-ID: <20260820111253.97866-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041340_809174_025E9A2F 
X-CRM114-Status: GOOD (  12.32  )
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

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 94bcaf92e396..d6b0174e2655 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -359,7 +359,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		goto err_apll1_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -384,9 +386,10 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
+err_apll1_mux_setting:
 
 	return ret;
 }
@@ -412,7 +415,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		goto err_apll2_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -437,9 +442,10 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
+err_apll2_mux_setting:
 
 	return ret;
 }
-- 
2.43.0


