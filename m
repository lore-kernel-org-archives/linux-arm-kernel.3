Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F763CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=; b=rCSRx89jkDM5/lJwqhTB1K1gOv
	uNeWpJ2O0fNU659y+cCnPg23U/bbYOvndt4eJvBk0V8Y/vbS6bxY5ndFR4aZun1sYpkC+NrluUSVg
	T7br3wsEo391L3xDTd4SUB23rgIapZ2u4ukQVVde1Osoc49fGrQn/mAFk10a8DfdywcbThHHoURv0
	XwS4Di5pbct31amkYzIjkuPA3Cv8ZpfuJgxhtV7Xt/BDU+UxzVgXX2485h5bfwxjUHdfLsG3gSCcn
	zK6+Pycpxf6GIkvDOJNa8AcjvoOb92DgAKFf/LvjjbcPmzbhVTC8NkPWcjY/P+7awRwP1E69QZymp
	JzSeQNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3n4-0000000DycF-0Coy;
	Mon, 15 Jun 2026 09:39:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3n1-0000000DybV-34fW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:39:33 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so1798687a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516371; x=1782121171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=UnoIKvbH5LU6muzlHNla74vtzwjoxdqbQWP0qVTdvS1keSUZdA3utl+l4IWHz1F+ya
         yT2dusdgX0qPPNZLliWqtk01HRltE2DI112RWa2gF8pQ9I4nVrOwx9a+WDKyxlpDrfHe
         LigRlJ7kMkOQ5+0vHSgoYLXl+AYVT36R7VM6QSgMqqqUv1bZAJOE+icrM6T/PZuICI8b
         3HbSbY61nQlkdqEvt3VurMCGc827zfzqzykC/W2Qjaqlrq7AgQKgRFxGnRfV0zQMqbBj
         aWCZ+XY0VVzYGx5D2+KZ2Uf2fk5v5wAfPb6lExKKEJHT+IC2hKOYhkQPwrh/D+QKW6pS
         DsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516371; x=1782121171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=RfAe8FRkHrLpcP8RMM68ZDBs0+Rc9r9VbvdvijDF/M4bvZDTq8WXTrHGMbv+yLyF0H
         PVyiBrK1qLuShPmsxYcqwHGsZZ2JYEGWOkChz9SSWpGL8ZjOAXiWxAxYlWMY+e5PmI+w
         qEHTABkFygJS64Xfv+dXNMYgBNDOMRhv7xJhB74dCkbeqCBVNfSWxjlxPqHIi7M8Pytc
         Y67seC8RWdau2iMryberL3uVnHMupe9t3p75a5bMOxn5984J1iy0tLwhsmpyRdgz7YRz
         IWtIU+dR3lCyFNZ+lphzgtm4qFF0l+5SBf01FtlqkaOuEr/mZnlp2E+T6N35QQkY3QJA
         WCLw==
X-Forwarded-Encrypted: i=1; AFNElJ8GE4PFIrRpG3Qz5kmszgE0U+eB4Q1F5KbF2eaGZB9VcAjAYr9LlyjY8e09dYX4/wSut71IZMYfxGludOg2C8Qx@lists.infradead.org
X-Gm-Message-State: AOJu0YyRmuye4DRo/S3P0U5yV3jHU1A8lSqFaMFrnZev3GdiOMUHmZy5
	dWhx119Zx9mj2Q/y1QeYzd0Y0rVz+pUr3XY3C+NCiwPU/ReYUTBljYeK
X-Gm-Gg: Acq92OEPXYgUx5uiiIimcQGsZghcCf6FuWomLMsfa6YA4DauZAcQEfmkfdpnjIgju5k
	8BfyKELlKDI+tStNDrX0azhkrbWifTxEkCwIWTbvsbTqWfs7pBNnvVd+Tmax3wC6c6AuAsA8wRF
	0fAmm15fmGIe0yjoAgUYB7U1YRIdJKLIb5/YdDjxcGi+0xOvzX8AzCLDhI/ewMuSrbpmJEpNwAU
	XRJrhaPv7FVff8e0W1HySmUBeLNPknhAe4Uxa7drofPU0ifOmEroTE9Ms7L6daoqdPVgx2VIndd
	CjM9T5EPQ3a/UYwdxr0/eKbe0CYZ0/9EuhEaFNxMVccE3CruBnlmcGVtXmjF3Abq0g2hs/bwi2g
	X/L5yMBbrrMk+zUYtdZp6cRtRlgKEcgvIeatZEWG3caOr+kHaZnPuuO5LJQSN9nPHfFYcbV3Wje
	HZGQ/qXDCeFxi34kwQIONuqNx6lLNyDqA91NI6j1DoKVDsWzZXyXxjkqFgaA==
X-Received: by 2002:a17:90b:5685:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-37c2bc86b05mr10709031a91.10.1781516370882;
        Mon, 15 Jun 2026 02:39:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 01/11] ASoC: fsl_asrc: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:14 +0700
Message-ID: <20260615093824.115751-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_023932_077973_980BCE6F 
X-CRM114-Status: GOOD (  13.86  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 5fda9b647c70..0b28bcfa47fe 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -222,10 +222,9 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *asrc = pair->asrc;
 	struct device *dev = &asrc->pdev->dev;
-	unsigned long lock_flags;
 	int i, ret = 0;
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	for (i = ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
 		if (asrc->pair[i] != NULL)
@@ -250,8 +249,6 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 		pair->index = index;
 	}
 
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
-
 	return ret;
 }
 
@@ -265,19 +262,16 @@ static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
-	unsigned long lock_flags;
 
 	/* Make sure the pair is disabled */
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_MASK(index), 0);
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	asrc->channel_avail += pair->channels;
 	asrc->pair[index] = NULL;
 	pair->error = 0;
-
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
 }
 
 /**
-- 
2.43.0


