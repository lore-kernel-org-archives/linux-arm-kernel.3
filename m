Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81562C44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxfhfVFXLPGi+jPTouqRSV9wQYObASU5W++hCoymJqs=; b=wLJ35dabKFUMLD6CbpPfaSA08l
	pWRq612G1nrJlNanQxQScNanvhRyBX5bMwsSOusODTNUW/LZszviq6jFf2mXjPI5LufaxNWAlOS3A
	RkAiix/PC3mS/vgXHboaeTOLcqjNUSPfcAfNfwMT0JF6P//efnKuDbcegbseHm7NY4nYFOJZjHxcs
	W8bYcsGs7mEDFyaefrcsRSSSUnNEXTI5mxowEGW9e6nHwCQVG7530usRj38pk02+71mKYJx9HW5ln
	KvayUG3MxTlKg2VQEJw4FaShmH+VKcr2GlJRc/3aedFnKVKUFDcaRm0yzg6aW5VH2M7QRsyM+UbiH
	XRCYn2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlid2-000000067Y7-0bO1;
	Mon, 20 Jul 2026 07:41:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlid1-000000067XE-3HDH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 07:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BxfhfVFXLPGi+jPTouqRSV9wQYObASU5W++hCoymJqs=; b=cljYLPQt1NE4xVffaW5rUaBirA
	aCQPSRjfXuhe3zfsPt5nc7VGy9EK1G94JawOV1JHNbnd4VMxVfv6THNkkOdJ+H3WBf+owgeW+hfU8
	KJWDDzzUiaXcyk5xFUFvbvElA1jHimkcSxIlrUj8bgNaahqQSvomFVCsvfob4FheVlP8IoPXIi6un
	XL+zKQx6YdGXfIGCuwcyE4izTKqosx2j4Bca7fXdBcoTu8B3NtCku7mneOYG4aIjPfn2cP7kaH5aT
	KZ3AobxRjGI0dWJgXFX8FyyroCUj2ys5aOxDLvXw6BK61BjSXkw+/PJ9BIMW+QCchzpeL2x/RHcsn
	nchLTMxA==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlicy-0000000GLuw-0UL0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:41:30 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-384c94c9414so5382081a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533285; x=1785138085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxfhfVFXLPGi+jPTouqRSV9wQYObASU5W++hCoymJqs=;
        b=V/COsqaHEDLrXrAP3WA7/jcvB7rmKJg5NVvgXEoLGG4feyaK1gRa1D/ChPzCk5VtKc
         CycNKft6uyGRCZvSZqxgeRDXdsUmFg85J6fO9XvWzgmynICfUuNRYmNR9bB580ce5NOf
         N4gU0nU+clOFua2lItxYgB0L0rgGJ4YenVM4TsC0IQPY/tPDFjxZPpeZ1qb9PTb+gFJ6
         aGfl5VBgFGBNX3ivKVi5STowgeGL28l7lA65xn7dYn38h526uOITwOCtGG4tlbTawXWS
         g+In9aC1coBZmMszj8vqwYM8CVYrIrCBuiSNDPdMSyCz+23/NSbDbRdMp3CU4Dh1Xphk
         JuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533285; x=1785138085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxfhfVFXLPGi+jPTouqRSV9wQYObASU5W++hCoymJqs=;
        b=nTUMYo5PTAWzaQKgAK1XqimB3Dh90GQfs+VJSs6j8Qus7NLNC57kWCap8KVaqGsuY5
         PBI5wYtjJXn++H3lRR2Qh1n65Xq36jTsM3q1NILZTX2wxt3q27K3USPfOsNQtHbS6J3o
         xe5hCtmgdeP8WT12Ks+1oatln8mGx+AYmuz8NOF2kOnc2yqiqQeg45G5L5URyKF36O3R
         PPYqLzHDV+PTkFI0e8ya2APNLi7DbWlsU7B67HLetl3nfEDzUIhXXMydszp214OlKXCM
         PjUsaaHnbRYmlKke19vaGdxgu2yKvUepSp2ZyRN6XnKNe/mGgtCgN5SKGYxP4rMXQwWL
         u2pg==
X-Forwarded-Encrypted: i=1; AHgh+RoOt2nQZlk/mFZNYDEpjE5czX73PWOftlECzNTEKgpB50hoY19GCTsBkjXDLseGIsSFVkdEHm+U1qgF2NmVmSHx@lists.infradead.org
X-Gm-Message-State: AOJu0YycnUiWQnmGbOarQdZdG5gebOTRJhMfX6YaoKMeDrexKa3dUYhO
	YjJ9vlHREkyCAoE8yMT7dI6FEITs/ZVVhDIXDJEuV/AZ53IeosUf5yWp
X-Gm-Gg: AfdE7cnGCTdG7aItIQYB/YbvZAbm2FSV1h1bqR89Oz0qTfYHofLuG2SIF4O5SvUuMnY
	UxFmTMPLIgo0/0nxqN6JnTFXKP423K1lUKAskzlV/vFdm0smI5hUNqJfaVHRdOZ4y2UCfQeOdrd
	oLIXuvGPR3uSYnK8PG+RXBaaNag1EfMkE7zZ3uKHNFtYz8GDIk2TWoErmd9zrsnXKW3kdrIBJd7
	2QDGYw95WxW6S86T9bPeTa8tcKWND03Na57C9g9sIGzaDckUWMu+5PHG7pG7r1XweK4m6e+VEQU
	9+g2fcHyVYt6aVzf7VQvxJvXCmZR9H7RgjSsEsFeQ0oA2qb6Ou47Wdt7g4PsdsVNZUPN1LAbRuT
	51jdPikdiJq08R1lv6Rubk6tRXsyAihEo+wz0JmFngh0Wvx3whfJdgXO8CdrDo8zRtouY75wEHF
	cLjf4V3KqA3MMjr5Wv2zL2fXLCp/r0dmBtnxET
X-Received: by 2002:a17:90b:57ee:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-38e4b40292cmr13847602a91.10.1784533285047;
        Mon, 20 Jul 2026 00:41:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: stm: stm32_spdifrx: Drop redundant error messages
Date: Mon, 20 Jul 2026 14:40:43 +0700
Message-ID: <20260720074044.87528-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720074044.87528-1-phucduc.bui@gmail.com>
References: <20260720074044.87528-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_084129_108858_D0026E1A 
X-CRM114-Status: GOOD (  11.53  )
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

Both devm_request_irq() and snd_dmaengine_pcm_register() already log
failures internally. Drop the redundant error messages and return the
original errors directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 2f83ca989e68..e0fef47a227e 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -970,10 +970,8 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, spdifrx->irq, stm32_spdifrx_isr, 0,
 			       dev_name(&pdev->dev), spdifrx);
-	if (ret) {
-		dev_err(&pdev->dev, "IRQ request returned %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rst))
@@ -987,7 +985,7 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	pcm_config = &stm32_spdifrx_pcm_config;
 	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
+		return ret;
 
 	ret = snd_soc_register_component(&pdev->dev,
 					 &stm32_spdifrx_component,
-- 
2.43.0


