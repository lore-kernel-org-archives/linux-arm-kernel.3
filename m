Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A5C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjQRdpjgs+LH9OPR1KHqpvjYOEdNhIXBhMpxvHX/HHY=; b=uXlkrBWrIiMayShu+7HX9IDFtA
	iwXhZL9riwKPJVhNb5WyfOzywElmKm5hU+Cs6KRLSvPbgxcqb86rYWEbxTvVZlcBXi5e9o322IIwx
	vKLRYEaED8WdUt9fPw9EoO+ovaafezoq6nQVsmQGeeRAN+kFvijsyxAYOtJn6sSpxU3/WfxWdPwKa
	d5EFbyN/LVBSpE41LSGfjC0ef6flNU1emM7u4w4d0sL4YMvhCn7ftQ23uiQWi4VSPLKTADAFoU2mt
	wmZTHwPjS3sVnbvzZ9uXdCHNasm+eU2tc2WiYjXrQjigwY0ZayUH0FGca6x+uO03zdfUJtM/+tBsP
	QFKMIMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5zB-0000000FrFS-2Hfz;
	Wed, 12 Aug 2026 10:15:01 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5z7-0000000FrDq-0r5n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:14:58 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38deea72eebso902324a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529696; x=1787134496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjQRdpjgs+LH9OPR1KHqpvjYOEdNhIXBhMpxvHX/HHY=;
        b=GL79vzXxivS30soHOmjhPMRgClIzmjDpvgeF8lHT421lpSYo0x8IDK4s0JdHi99oZW
         906VmAccFlrEOlQVfwpBnlAf0ACF2UN1R5ifSCF2c4oF06Ciz4jQUdGFZ88ZDj5PeCo6
         1HX/tCa+4blTsmUOPWkjZ8REujuIRuTVdOpm+NSan861wDAYOP91ErlwYh3rUKYHGgJw
         ApDKAyGBTXplwncMchPemQmX0dMl2tn03Bt0sxgpoboPImPMNtVjg8yuNoauqJe+Fxex
         cZq6HLDqgrLUivM72r5Pmk70JCZZudLjFfM+PyVtWA8/oq5tz7LzZF5zihMTY21mplSk
         nhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529696; x=1787134496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjQRdpjgs+LH9OPR1KHqpvjYOEdNhIXBhMpxvHX/HHY=;
        b=mKbf1c7G2ZINU+lzTdzXsZvEzyKhxfOMUX+c+3Zh8PtQ8m71E1jKZdajSz7IMtsfRm
         9Xfxy51Xac1tDTRqF4VMScYjNHOC0OdRl1S9LO4npP5VCxb6UkKT/R0p1YZT2nsl4i8d
         5uASc1058sQU6zx9xOv3r/plSbfo1A3I6SRru3afG58/MY5eoxuv0Wd86dN5BHEvpP/p
         laLVU9dK0MaGa/13Tn0AavDtR0ZZnNaPq87ss1Xi2y/CMWwdV2G5FcXlemzBxdUAviL3
         eEQA5y8z/c63FCCWwpxVoD719xd3Urt8ZlLGmdNvoMU0GDI5Ug3yx+tqZoNPaNnHt6dY
         SEJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmzMiuLUjeZVnsfJ8uxFszKWmTzA1Ob6ghlW+2AlJeTm3JQI+k5Qo3p5E/83TtOErxe18R0N3I2n45Ev0uQstw@lists.infradead.org
X-Gm-Message-State: AOJu0YwQBTtHTsZtRwR7lRIB06gw+kRU0fxBtHozKDDPbskW947espSZ
	K9XPyBHAwVoU6MshBIYH3LCkw/C627oQA8iVMwt5zFe2ezY10td+cEJM
X-Gm-Gg: AR+sD12QJa128Sjj9OvSRQTaxEQVEDBs9E4cQSQO4kkXT7npWLNe9FUGa79P/aJXJu+
	Pup8FQNvuqIps+7nitQtAJ4WlIVyyfgV81tKeh4INc4CIyWX9kRuZ2cmNhLRPx8cPg+y175ynMC
	3692Q8x2Zsm5ZfTbvPKQKcQXDAi3g6AZuTc1mEEGH6p2wQbISDdoxZ6I6sAShUmXgiW+N2bLAGH
	XRT2Ji67dZ2baOIanqkg1YsOTuncoQyLAyWKUHpetog/kY48FisDLY/frNHVyjZVHqkqUk9PpSo
	D+jMVAK4I1hjgU1B51oj3eqUfwpyHuDJ77la4qFjh/XbpXs/+2MCgzWGHRBeyNatVDNbH0e5rNV
	Hy5h/nxSLYFOTCgcaLj70b2tfjecbGYLu+VXqoJQ591fEST1KoW0Sgk/tAVfdbZulnnAigMmdON
	jVM3PhedqWOp9wHHI2eKc3A4SaGOHhbksyNXLeeWuO9PIC9kPd8lSfPinrNOrYUZ/05jZHWkG3p
	goi0+ch6ZFcb+QAiOMcHF+1eJWAgiwn+UmQrEnQwEtPgyxWBXkIQdb3Ct2a/aLT3Xnu4As/FZW4
	WQmL
X-Received: by 2002:a17:90a:d610:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-393014be1eamr4231403a91.10.1786529696244;
        Wed, 12 Aug 2026 03:14:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:56 -0700 (PDT)
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
Subject: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 17:14:17 +0700
Message-ID: <20260812101418.37966-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_031457_252510_3051F6D3 
X-CRM114-Status: GOOD (  13.65  )
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

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mxs/mxs-saif.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index b877c978a04c..a77cd516a1bf 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -841,10 +841,8 @@ static int mxs_saif_probe(struct platform_device *pdev)
 	saif->dev = &pdev->dev;
 	ret = devm_request_irq(&pdev->dev, irq, mxs_saif_irq, 0,
 			       dev_name(&pdev->dev), saif);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq\n");
+	if (ret)
 		return ret;
-	}
 
 	platform_set_drvdata(pdev, saif);
 
@@ -857,16 +855,12 @@ static int mxs_saif_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mxs_saif_component,
 					      &mxs_saif_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "register DAI failed\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = mxs_pcm_platform_register(&pdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "register PCM failed: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.43.0


