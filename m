Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9364C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ex53QN8qUaM4ezvj3nywtUMeXIR5OlcqRfF6FOJ3bY=; b=FzEZ1PbO4dgt+ZLIWt4zZ571/c
	+biw4pvYPN8S7JzHH4fTg/Tu6rK77zZX+vTxtt90mC+oEj/GmTBs0TcmMSQ+bwb7jLDpZSSMR45m/
	j2cqsyg4jPDIVc0N2a33RHPBzt8BtIcjDaiy2ZdFavZYaTxtzBLWl2xBUhMAl2ikvd24+VjH/Cz/a
	9CZHoB7oPAIllzLuumDoJ7SYi+JpNjRMNPii9lzYFuhgbVKARD5hD7NEPxnC2f/8P9YFlw+ikaziL
	PIRCbI883selUbQUYAldrPRbnnja/zUFW7uH7/J/IzhIAZLJ+m78Jhzhl+uouEKj4jZGaNFMVFbeA
	pbIAmQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZV-00000004yAA-0Fq9;
	Thu, 06 Aug 2026 05:23:13 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZQ-00000004y3e-1DBu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:23:11 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8485b358552so1453208b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993788; x=1786598588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ex53QN8qUaM4ezvj3nywtUMeXIR5OlcqRfF6FOJ3bY=;
        b=LmjFEXivKGUe8q4eqjUE1WbDXXr2oUlrF0n9vYAfiNJydBx/IacUHILnAAmF4wL0cA
         fmWx+WkAJpe21tzkJVsZVUq3lCfAa1yVT7ImZOASv2s0sjJ0itJ6HBfyOzxWGsxP2GiZ
         pela823PD5YWSM7KSG8Rrppdp6DzjzxaTUD14CmGOG1M9dAqmJ+7OQZnmzPGfnn5iqXy
         vgxhl8e9pTfyRA+qvBz5EropfpRoV19tFUvUvBIgIljPxbW2UiEQqaBIpjjxly/LRI0Z
         aV3a2C323pgn9+5g0aXETz9Qvp0V/vheZwH13G0/ujrzazAO4mbT//HXcGTMXNG0Iaff
         rb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993788; x=1786598588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Ex53QN8qUaM4ezvj3nywtUMeXIR5OlcqRfF6FOJ3bY=;
        b=FxQLnnlJGP3WJReHRLjhwd+5zbJ/1W1g1N3CSGsMYoopmhiETQp0w4P/4dUJ1Da53Z
         K+aGKdFdV8/kRb2Qv56lbkNPKHoMqTLmH7v6jzWkWuNCRY2rHtNWUTmtxQaFAYiYcjz2
         QkLSl8hkp9I2y+zSG/ygOCH4/iGjtCzpAVzyrTyI4IEk3nVJNesd2aKsUtnHFQx/QsCr
         E1+dszYsZuTQT/PO0CjPQerDQ+tImy8BLexWRIlv53MuLh5/rPlvpK3NrLQYe0qud5rf
         5Zgw6BmewEzX3A8Xa0azN8FBmuLukiw+iColI9cF+BTSSaszEhcJqJOjq3ndEe8c1EiR
         hOgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJewixnXUEreD+u1YLnONTyiCgfdV/VvNRizm5izVRdgzr3BAuxRd/xDwgIUWdeknDJSI8B4zdLvhir6EbxHWT@lists.infradead.org
X-Gm-Message-State: AOJu0YzbyZTRNpOtcPVyopttrG33v3C8UgEX2SF1s9bjuVj3l0MT7FOd
	SjXu941wlamp2mBK8h8Z7JNsZHaIX1vFJyWWTXUpJWfS7NlL/VIvIro+
X-Gm-Gg: AR+sD11AJ+12YDxYakysiSXfnJ6qA2MCF7puOV6PKomk+nf+DNJmZ5ZDp0yi4AkjUrn
	FeRSIhHMsvSsYYYZ+k0f2BbmfPi8l64/HtLLfEfkHPQnp80wZX8nyzRJ2g9i3GQ63pvp/rYXBFJ
	3zrubumD8ppWbBIJDu6HAMSv4Fwre/v/539xrPH8O60DPId4IXvDYaXzAiguCfGG2uCeh/aItPg
	/dBM9IscGwKP9r5bpScDgLHExv7oSaTvq2fZqEHqHWX1nojasT/yVAdIoTENHUP5yOvqnBVPhbq
	AFfdjDd+0at4FuPLYhe0J908LxOSRTmfdNvGZrbiZnul+DqX5bPhFmR+YTBGHxu0amD27CfBuDZ
	Z/Bg0XoeZfF37o2kB6mkiN2MJzgACAKo5YpOoAYPUhdTVkTUYbJlemPqR9tTSADwvbkRHjZP3Ix
	cM84h/GvPgkrKvvEPUifh5uojeBostN1OPpRbxuacunRfeCKXFdQeLlT0ZEF8TwHt/Zf2s7nQDE
	kgOmikRxSqnp4cDe8/fSozaLOgyvcXIWA1VMIor6fQQ/S1iNtbWfq9w2TafnUEMwNgDXDH1w7X6
	D1bd
X-Received: by 2002:a05:6a00:3c89:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-84f2dfcfcfbmr13260578b3a.7.1785993787706;
        Wed, 05 Aug 2026 22:23:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:23:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 13/14] ASoC: rockchip: rockchip_sai: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:35 +0700
Message-ID: <20260806052136.21034-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222308_338720_0FC62B84 
X-CRM114-Status: GOOD (  12.78  )
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

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 1fdec12a0d4e..30b5e71d0937 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1472,18 +1472,14 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret, "Failed to resume device\n");
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register PCM: %d\n", ret);
+	if (ret)
 		goto err_runtime_suspend;
-	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rockchip_sai_component,
 					      dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register component: %d\n", ret);
+	if (ret)
 		goto err_runtime_suspend;
-	}
 
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_put(&pdev->dev);
-- 
2.43.0


