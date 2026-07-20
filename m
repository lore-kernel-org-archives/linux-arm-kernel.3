Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1597CC44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scpaRJrlW34d2i0T3LPzlbqHWj1iPSwqpLVD8tv+N3k=; b=blal0tamAVp6NkQd++0dBS3+7B
	XXQ37jd2AJ8maqPVNcu5cnlfe0VjIPrUvCHvtFjpvIDOiMTMZ4rs7vQXRdsIBsLZshPILeh8QK2AM
	Qzyi2HJjA5EjwLJ9tFvKeaApjytanFZW+KQMogywMoC6p6eCplf/R1p1hzwpGmsSBYNjr3o0uLhP8
	y6oyoXejejjs9TL6L/jl0SobZ12xp/It4AaN2e77zx1mpo4D/Cka85z/GS6Mu5itulzP4olr9r+jM
	jxUSm9Tc86JON30JTTFaAXJX9G85jraX9ysWRpU3Tg6li1d5RKlgXPKjAjQ+tn5ReH+VfGGuhgefe
	cDiu6nwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlicl-000000067NA-0xkK;
	Mon, 20 Jul 2026 07:41:15 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlici-000000067M6-3ZDf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:41:13 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2406211a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533272; x=1785138072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scpaRJrlW34d2i0T3LPzlbqHWj1iPSwqpLVD8tv+N3k=;
        b=p78AtwJajd5mu3i1Y2cFGkW8QtHVMzhzfhCSnL38jjiN5Ffp58vsfIDDFsckPc83LM
         dnGpSk+xxFHwRrZsX5EbCvWysmtIBtie16M7DevwXiqPLEQKkrnJFygAAlZbnwNJcs93
         YzEd9LCKsGYKz66yPCUZVfFRkHmfw5JcigdThbNSPahtTp5xmKRJqyUQaB3LGa0bdlJh
         +CSmomV5kjXLvenec9qHDz3arXF7DC7nkbiFyNq0tidgIOJpOmfWq30K2th6IEL6xFQz
         ds8gn1zGnkfBdc9ab7ltnwXj2Iik1Xv/doj5NYMcwqxpBRew6B2jBPNaW2WN+lWd9TjS
         pxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533272; x=1785138072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scpaRJrlW34d2i0T3LPzlbqHWj1iPSwqpLVD8tv+N3k=;
        b=HW0UZRoITzKI9he8IhOUlvjANtLv8IDb6k5SNHrm1aviBJQ2IP0x0ciAoZwd1A5KVP
         MwlbtovFK5YpgA9Ju6ccq6yzzz9pnziLjcmEthIVzEWasehSSW4Tosb8lra8KnxR1t0O
         tuoIDdXo07rPpuaq2Is0Xs+m0pcQI487EHSk8eX4WxOWli42N8d6JisT2v6NeUIDNggm
         vY6U0WMml/meNc2vxYGnDs8KdfRnRBHfcNC90HAp5Fy8aTKNVsyApW9RJOaG1erAY53F
         WcsAIRfo3RTmMrOnxg3ZxoJXMXmVCKfYCM3phDXpaC6U5lzGITH8nn4f/iaq2yFN0lmI
         BZDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDTMnZuGrAmEqp5EWLzhEzIVFUBX0zqjEKrStbttdbJyPup/wLSMGSA78LqH8CvDR/AXLsTx5/v5g8qIEzhgts@lists.infradead.org
X-Gm-Message-State: AOJu0YxkYWFYT7NxaDo5faoD2Ioy8X+JpUMXlW3Q2rwQ/wGX/852/Css
	+gTMoL+dEfTPIH9Oq5k3oJQcUxtWUe/YpOtjxjzJ5Sg/QfxzrZOllQcf
X-Gm-Gg: AfdE7clHFOK3L+EO3VtJStbY6/dabNTZebS5tQlwpFYDi7jF4CC2C4cRuSQJeRag7a5
	w2ppuTRctmR7+Rh0b88Frj2DragiWzUrWkAxVq97GIaAMDWqfHXHMLFqOTEpbKJxcMUj8DrkAab
	GJwiLTdCy8Fs7VIF/VCGTi06iPtuXuMxK8T+hw/7aKXDd/dXWAOdJIWLewcEiC9nNxAF+sbfHv6
	2AWURRzbpja+9PKNpCSlHXRlcw86+8h8r7cHzvowUDXwbhLBpB/UIk/vIvofqTSmDHI/DzPr5XW
	zqirsLqOYUNw1rTDgQ7ndCB+85RKhCg/vDqNyRxL9PLTEyKyouowBiQ7JdakSXcgJsbTKOzX4Z9
	0mXRMH8V1oBdJuT1ErDV1qrhNyqwG6QkUVvhofLNeEyuCNDWbGurUzXI2VpwEUjEE9hYQYnLdI0
	XZ31mHkNDr/UlKY9A/V6KaL09i8hYN/KqB9XaV
X-Received: by 2002:a17:90b:1d48:b0:37f:9e21:91d6 with SMTP id 98e67ed59e1d1-38e4b610362mr11098900a91.13.1784533271902;
        Mon, 20 Jul 2026 00:41:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:11 -0700 (PDT)
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
Subject: [PATCH 1/4] ASoC: stm: stm32_adfsdm: Drop redundant error message
Date: Mon, 20 Jul 2026 14:40:40 +0700
Message-ID: <20260720074044.87528-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720074044.87528-1-phucduc.bui@gmail.com>
References: <20260720074044.87528-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_004112_896241_CBD77A36 
X-CRM114-Status: GOOD (  11.61  )
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

devm_snd_soc_register_component() already logs the failure internally.
Drop the redundant error message and return the original error directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_adfsdm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 66efb9a0acb9..73c6460a6327 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -360,11 +360,8 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &stm32_adfsdm_soc_platform,
 					      NULL, 0);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
-			__func__);
+	if (ret < 0)
 		return ret;
-	}
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.43.0


