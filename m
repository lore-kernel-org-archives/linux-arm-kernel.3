Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670DEC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmlgcPwHF5jOxRxD1KT11UbnHWOCjsQAdwUgZ3L+zv0=; b=yUxtPv49eHdAKMsHvZaDM/+yD0
	rS6TP2y7xVKI/cT1EWuGCXi/+95axkCOQdAqUotoZN8lD/khTWuNdnH+MExbFc71sGuG8jcxGgmxM
	bUo8Ip6WDMDRDyrvt7hh8IZgqARJiKwqCIlSo3HTwKyud5UDOJnC7fNJcFxo1YAwZK9WsvDUCX/2t
	e82haNKvED/sEubyTKKIPvKhAYJP/UH7ivQWluyn4EQJ+cVKjqUEupmx+rgGdEUV0SizBJOfaaXxM
	A5WiDZ6TSm6oD1114vsLpQebZdNb+ct6Tc9eVHdYKsD3bgWSof9w1vTrtuye3f1yaMOandOq0trsZ
	+VF36uXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5z4-0000000FrCf-1HGQ;
	Wed, 12 Aug 2026 10:14:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5z1-0000000FrBh-2bEt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:14:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ceab75934dso10811485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529691; x=1787134491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmlgcPwHF5jOxRxD1KT11UbnHWOCjsQAdwUgZ3L+zv0=;
        b=fzENClWEGyEWDF+09F+bcYfqNbOO2cuhFG+yZ01QNjWjdAgZVZtAIqOTO7NCdiGt9G
         QzSrh76HCf7bNNSV9eF/T8XyrKuNdGQmqkUhAiz4J8mtMBeJAlImyBDtfLqLjLbJjSSW
         wXn5PygQXW4VzK3Q8oybvNFPPjsX40dI+/2Ht6qpitYKbNpqXrudSi4etL4YT8udIjHu
         gBFUtpQlUZr3SJVtRsgwp2H1CPSmm0Nuz2z5XIgL6uyR5dYTozhf+2Au46xMPNA/HtX7
         vkq4sr1C+CRD5ni/sg8sOZoSWTLHinKoW2jY0KKGnSAK8rY0ZU1YOZorFMnSOVzEuwb8
         l5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529691; x=1787134491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hmlgcPwHF5jOxRxD1KT11UbnHWOCjsQAdwUgZ3L+zv0=;
        b=I5WVb39HtUT8wY94y+61jvfLJSkDhCuTHvLFS18ttis9WEAJ3/5GYvkt0rpvxjkwkX
         d4msHMFOuJSfeT0R2vLWQ3xYFFBsx93fD/Sb10SqLCWkTkj0uZrBIlEKhapMoX2nGGEp
         l/siKoo6tIa/NRw7/9APLz1N5HRVB5d2+0z5uiuCpi4pDf3PKCSonuWOT5bmmd8Voer4
         Wcinj26rtEpM12Jztr/mP1zk96/E+Wwsa42+dozGqxRsZrhsTu6/syPskq3kPDycOz0w
         QDR5EdMX9fhwgTPo7ZgCrNHyTvB3xYf5O84Ljyf3yTq54ErlYbRe2fO4ZYjnuZ2PoFp3
         jyBg==
X-Forwarded-Encrypted: i=1; AHgh+RrPpWAg55iH/TdQIu9Nzj/Oo1fNOfMWm3NwWwFYLEk6zluDjSgv7wXqP6SaYg3w8c2GFNPbjF70UwUYYFU09UVV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7SISkmS7pjzK2khI8owcFjXZf0DfzMlfMNni3MEvIcwtTcsNd
	8iX0nKqP8sHokQdlPK/dkymnkox6Q74KPvB2S53IiLDSqjDbUdxy+ubC
X-Gm-Gg: AR+sD13ESqEHcAHBWIGhxF1KDns8qTkkhJg/8E/Y6yfIPcHe2V2CaCCpQyG/FVldB+X
	jljcx1ZHpEhq8F7DiG2sR96w1vhyfZYU8We1GhTz3SjgcP+F2dVX4YaQoKm1ZQ2QlG0OgvHYPM6
	GHjv4MvVoJOSxhxMtHxKASwku+ITgEyW7SFaY8TKlEBDbh5UCbkxAiYClaztGrnJcMHW4BXTIA+
	urkKaxVN6OPgB6SP/htDt0uzsdK5/YwkXXaZPgDUXh5EzZRPKaJreHrcPOp5s525+oGp5NAiXYe
	q/YqrjH9I96Pjo0YvXZEGtAovDKnbk9zI7FNRvce7kHrQurzG145HbYaMw60Yud8mE2JSgVQP0+
	DTwqdpyJMzhwBJ+j96P4i0aodrf28EeXEczuh2P4jaDv0uuyJXkP+VB5I4bojB9PihlCWXyUjSR
	k0oGvwI9PTtbg38rsTEm6WXW7wcTC8u4qhpTGTvV/byqnS3VNNuCA1A9tUCfzwq+YNpWf0YoJ3a
	IvBdzRGba/o4IiFWBLcV0ogBvsi3aIkCmyfsmCqtdOVadFOBhXu4iaakj9rMFrc085mhKZ7jc54
	bT+d
X-Received: by 2002:a17:903:2383:b0:2ce:9c48:22d3 with SMTP id d9443c01a7336-2d34569b01amr47085155ad.11.1786529690806;
        Wed, 12 Aug 2026 03:14:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mxs-saif: Use dev_err_probe() for error handling
Date: Wed, 12 Aug 2026 17:14:16 +0700
Message-ID: <20260812101418.37966-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_031451_674315_A0ACB310 
X-CRM114-Status: GOOD (  12.38  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mxs/mxs-saif.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index a01a680ad4d7..b877c978a04c 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -826,12 +826,9 @@ static int mxs_saif_probe(struct platform_device *pdev)
 	mxs_saif[saif->id] = saif;
 
 	saif->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(saif->clk)) {
-		ret = PTR_ERR(saif->clk);
-		dev_err(&pdev->dev, "Cannot get the clock: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(saif->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(saif->clk),
+				     "Cannot get the clock\n");
 
 	saif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(saif->base))
-- 
2.43.0


