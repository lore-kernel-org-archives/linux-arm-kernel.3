Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E308BC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=; b=SB/zYaJ1feCEuKdSg3ppvG+rFX
	/Wl9R0W8T0UQAtcv3/hDGYOh14Bd1nFV+BFgDUvlmU0k6LnRgeXfQ0xMSvZN2Ox3u6MpSYFm39e6W
	WV95u09rqW0c6YUsZAKVBnzJcBup5HNvzxAsmNWcB+yW3MJObL1zowzLrbLost3coJu04iAFYvrDs
	nBekoLxRia0CV1NYQ/ErUZLnOmkhJP5RluR6ZQif39Vh2LNMIBdbXUX6QPDhA93KRbkTME7K4U625
	Hh7eI3Xu+0BU+d1r4JDf5N9G1jgd3OannPR8gA2OfY8qV7Hnqo5w3ZA9r0nGUwNSNKoHUdlEoLAST
	f+VmFp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypj-0000000EbNs-2uOD;
	Fri, 18 Sep 2026 13:40:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpV-0000000Eb6M-0RA9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=; b=TvHgz3XEzFM0IabcxywpbUiCrv
	Pl1jO9Fd0YMPbstFuxPAGpVqLjvclrafCRs6SXqmVm7/x5vVbUJlAm3ZrRbhEyv/kZBxD+lVnGqxO
	76bw4skvnkeXSe2CRy2y0rXv9mp9vRdRWY/jVuA9b+AcLRbKZPX50IUVVKX+tJ5W7o6t6ZXFt5kOJ
	GEiX6gWwQjwoEWoq92ZCRDOOuA928G87sqZforqmmIho5Bjrl8m2xYPhEfIYCmpbPuqYsZfAt13nw
	yugBcHShlJ51yD3uVivu57vOG+K0fmgRS+HypcuztJ+tD7om86/xtEf9gvZvjroWlWfGhGwwdk937
	ijSqY/jA==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7YpS-0000000A9Oz-0sEL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:39 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398a147688bso755488a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738835; x=1790343635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=;
        b=BCVudIkpdkI7VFdv+emRCGjxihvt9rJ4MWaqJgmNgaLOoTeUYnCoIXi9GRHFgHKrgG
         dzTqca5ri7LbKHdbDCjYcijAOcPgtoH8W15QScTJcYLUAezDm771rkI2c+KOCa+oJLgt
         f6LEGmnxT8/FYoEeQ5ogqszQnQU4kO5lSB0EIGM4td2cvNcrxtHhJwnoAZhPESQK/C7i
         /SRsmX1vbqOi8wSNvjDee1j0J6SHXhrhdCOngkh0HP9YdpeOG3zYCRCpwB8raW8AjqkZ
         jwWVgsGjOmCnOyqbimhicAOWbj4y28hWb0/8WpCErFg+Z9Bc9hr3A7g9APL9qjqyNSgE
         josA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738835; x=1790343635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=;
        b=uXtqZhdX/3j1GEFyVxsSxHmFqrDsGlhQ3qG80DtnQcmaLdmvlJ2hrUBnmia9kLap/Y
         FMktaG9vseAiiGsK9oU4LeUHkXk5iOZcSJG+Rg554ezbArwnGYvBJTHalDLxrSbhtLzz
         X955ld3AvPgl7gaLybHjscM3BtnwI6XCPPfUx44kg7H/NA/dAdTbFAQ1lrqqig4IgAZb
         UhOxRjrmxR/jmt2PpW/+YoHHLq02QxeigKysndbxaBKM1qmZeBPC5HM733keW18BsvtU
         XhyAaPpEfmtUJpm3rxPvRlr8DXfYRVkXSRgKboqC420jSsQo+IyVfEzIXtGdzsnFp+ZL
         5rvg==
X-Forwarded-Encrypted: i=1; AKwUvBxysFf2vcZ4v/9dIi/BpHNEnITz2FPG6nqIb9bWA8ZlPVh219J2HzQU7YJEsou7kZoa3KlpxHVkNC6fcRrFc9wp@lists.infradead.org
X-Gm-Message-State: AFuF++kTX8xUIMslOjFKbe3VOqLEKNWKih+DCIqP9FXXfiSDI4M0Alvg
	AUlUnwDoTewJuI4fUcDo7ToWnhhnbfioSR8kUTu4yLePjdxPOYVBEU+e
X-Gm-Gg: AYBFou0CyRctTwXRp8gyz4Zs+deTen+SgzlgsHRIsjC5zgZgi/GaZi4pS7O14e6Ggk5
	4Ya1Mmssnnumdujeb0HVbGE/QMXuYKGKR2p6WgX+H3jweSY8CUL1sYNlLmTfYuQFCLZgT5A1rGd
	HmO75esRY8is2e2Qkw4/2N+0eRvbwYPoxq7mA4V69+su3JBdrUQgROw/lmZzNy4fwfuJZDxZf1D
	OcDTwq348x9czreFARSf5wWi0UqmLQreBW8u25q48HoHNl6JK1q15wvagq+OS+3ua2rRnwJlsHf
	TV8KcnbxEgBQLAqE7RFocdHISDwPb2JfeLU4hruPSqTQlfIcqcoIhrnh8WvA3Rf82M6Z8wvGVij
	Y8EK4ICzXJ1Z58mlY6qJ4k721nJXHFQZUHgn5BHtXLAiJ7hUIKdK4PG7SCfaF7RsWzn8kw+i2Ao
	KNVHHiqC/6vGBMGx/uBeJTpa95s4Q1EV4vGIIIRCKnpPhGZ2usbd2SsNW7SWRLrliWeihObS5Qj
	t2+nTyiK82zN3PAhDcsQRGvqBmQRpVb2juhrdWgiht7y4ivnK74K/qCZvCYdWD9TrffmdZb7khx
	AJaBRDD9cULUQDoMe8JvUC6U1Q==
X-Received: by 2002:a17:90b:17c5:b0:39e:1633:d29e with SMTP id 98e67ed59e1d1-39e54cc6ef6mr6089597a91.5.1789738835185;
        Fri, 18 Sep 2026 06:40:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:34 -0700 (PDT)
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
Subject: [PATCH 11/15] ASoC: mediatek: mt8192: Remove redundant error message
Date: Fri, 18 Sep 2026 20:39:07 +0700
Message-ID: <20260918133912.133799-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_144038_397076_9E0CEE42 
X-CRM114-Status: GOOD (  13.15  )
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
dev_err() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 5aaff5bebfb6..45addf9f3790 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2192,10 +2192,8 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8192_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -2271,7 +2269,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


