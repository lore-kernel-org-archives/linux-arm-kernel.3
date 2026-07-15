Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C13C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbwPz53OQjxnJig2YQsbZ1pk7oPIkLRBw9/Vd+k0PqQ=; b=RCiPRHq8Uukf0ZbkJV4b5NENXc
	Lq3fB/ff7ZvreudLxgQ8XjNPymVOA39mkRk+6g1iVTQHMXs0BYTatyC8lry0dsBlDeLgxPRiXe2av
	B6j7mThJVrl7P4rIUvbgKP1MmI0Uf4gE6ruCg0jvsAbfhBUS4Elbycj0LulZRGk0o4DdCc9bv8HLj
	LN7ahevjTAmohdlDN2IsifgUqekUmqgohZql4J4yKUfJoxblBdjSRy8AeePmVwk7zanUxq8Nt9SUy
	3NNkpJfTTe7AaA1RWG7BS+/0lXe8NcLy4PRVG+yQ4dhsnfOqO5O1JiM14lkw3DEHhbJSlgMCC/EVs
	Tn7jiymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLZ-0000000ENkh-0byh;
	Wed, 15 Jul 2026 09:56:11 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLX-0000000ENjg-108f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:56:08 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-ca88130e09aso3505117a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109366; x=1784714166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbwPz53OQjxnJig2YQsbZ1pk7oPIkLRBw9/Vd+k0PqQ=;
        b=HH4qVgCLBsbl8oWY2i3s/j3CimWSfXcaWCFcqpPgbVIHIO0aH28G53u5OVmExzvoGE
         sMUYN1ShT3o0axNzYBvqEt+5yhbq5YY5KY0IV0a7X6Zfaa6ecLhgv+5SPdT349j/XJVd
         DWS3QxqNeaclAQ+5akhrXyR+HxBpI+HBPHAS7uBYmTFrlgCcXh2MdXlVQI6RUj+6ICei
         QwtYNN+AGtao4qfMWWfKm3ocT0e/0cLQOtgMSuAuR0bmYkEOAG4Zco3WbC7mXp3Hmxz4
         qHDp8Lc7FksfhMIhQOoKHNRo6ig7+cfqFh3ylEtVEfT0vF6ue63T3K6SREqspBqG+gR5
         6Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109366; x=1784714166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbwPz53OQjxnJig2YQsbZ1pk7oPIkLRBw9/Vd+k0PqQ=;
        b=JRzG40/sqGHkpBEbnl6p31xMFYjrKvLp82wOoTBNLIOfB7BKfbzUIqXqLhGD9ulbw6
         H7A54dhNdsb5bXh0x29aE+iksiOGC588FFZKYOGOEw81N02Ipf3kMDtGHOBO2u9BNORP
         gIo8Km66gB/oTJKwl4IKRu5spPYBbLeSG8DCenMcQaRBr1f7W/pDdL/WdcwVWxpw209R
         ho8vKNp8x6aewyKPFwZ4+GISLC7JFl9stIqIUtSdpGkHo030+q2ns0gd6KVWe7ijNqaA
         g/swXjZIK/w9JCIzVycDvdjNgl5qvJvIvf6rmcmYsxXmZyD3fO0RsdSwt0i+no/gljTa
         pEkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVO4RE7zN+PK6sR++IGldWKUJ6fMg3tM6Nc+SOabrEYqMDOLmHwAleXOmgrfNVv1GFSQe8fycbzSeYUTxMtk0J@lists.infradead.org
X-Gm-Message-State: AOJu0YwwGgP8KZO3NafGYbOrvsz+CHulnYFYQaSWb1p1ab02q4Y+av40
	MVLTfsNlZx18M03J8Gd25XmdnQr1nJbkpfg8PHhFFr9sOb3OS27oQMUn
X-Gm-Gg: AfdE7cmhbM+uLjAdJtGu+0PBNPjQAoeW3+yEN7Rd7Pbo81vzGbmwmrutIs9pjjuedyo
	xhOTuXh+gVqdMuykmiZ9MPwSoilRiYlsdOV0FtStrtPcEuRXySmF8vOVh0L/tSogcJjJzMumfyV
	iYsFdV23n5dQb6hM0PVdHuhwBeinbFXg4rCdKyVgif1Jc9C0+iz7V3wDDuruG7V64/46DgY7U7y
	kfKtBMrB71Lg1pFPFjUn5wMnhG1/gJtYO2dy0vGVYjthpT7sBOpwiDwo42KkWY6FW9arVMYeO1P
	BjmrUWv0BMAiUydNU6wOpzVEA+XlisdlryWa+BeLpuP76LUwwKv0TEoCeSH2lHUxJl2eE0DP4e5
	mQ59bMEfGstNBe+svaDNQzjW88c+W76deHh4F0cYs2aP1MqU/xdBtpmJAAJ1xzDiuLxRxER80cG
	QI3qvRVYI91YXbgRsUpeBAO6MdahWKWlaBQnMDHcSBmpwMCUs=
X-Received: by 2002:a05:6300:2787:20b0:3c3:7019:64ad with SMTP id adf61e73a8af0-3c370196776mr1215140637.66.1784109366301;
        Wed, 15 Jul 2026 02:56:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/6] ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe error handling
Date: Wed, 15 Jul 2026 16:55:22 +0700
Message-ID: <20260715095525.40668-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_025607_290744_073426C0 
X-CRM114-Status: GOOD (  11.30  )
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

Use dev_err_probe() for probe error handling to simplify the error paths
and handle -EPROBE_DEFER correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 40de99a34bc3..716fa4d872ff 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1550,30 +1550,26 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 	}
 
 	i2s->bus_clk = devm_clk_get(&pdev->dev, "apb");
-	if (IS_ERR(i2s->bus_clk)) {
-		dev_err(&pdev->dev, "Can't get our bus clock\n");
-		return PTR_ERR(i2s->bus_clk);
-	}
+	if (IS_ERR(i2s->bus_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->bus_clk),
+				     "Can't get our bus clock\n");
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    i2s->variant->sun4i_i2s_regmap);
-	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "Regmap initialisation failed\n");
-		return PTR_ERR(i2s->regmap);
-	}
+	if (IS_ERR(i2s->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap),
+				     "Regmap initialisation failed\n");
 
 	i2s->mod_clk = devm_clk_get(&pdev->dev, "mod");
-	if (IS_ERR(i2s->mod_clk)) {
-		dev_err(&pdev->dev, "Can't get our mod clock\n");
-		return PTR_ERR(i2s->mod_clk);
-	}
+	if (IS_ERR(i2s->mod_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->mod_clk),
+				     "Can't get our mod clock\n");
 
 	if (i2s->variant->has_reset) {
 		i2s->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-		if (IS_ERR(i2s->rst)) {
-			dev_err(&pdev->dev, "Failed to get reset control\n");
-			return PTR_ERR(i2s->rst);
-		}
+		if (IS_ERR(i2s->rst))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2s->rst),
+					     "Failed to get reset control\n");
 	}
 
 	if (!IS_ERR(i2s->rst)) {
-- 
2.43.0


