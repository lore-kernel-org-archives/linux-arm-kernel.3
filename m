Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7420C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMllDSNz6y9GDkrgwRaQVDA/pIhA4eMkvxsotewnFzc=; b=0u7vTTl9tQUGrIZLBrbtw0DSwx
	iU78iK+yFuYZChKySaQJg3BqA1Ch8peqNluNJmk/UvmSdghhyvxLGILnTDrVspbv+sNcmu1R/ARu/
	sG9se+KH28qIcDR2/FC/po9KXIma8uY28rE4h3TSyGvrejocNmnxqYtW/WSmYUaYN24HQHXI+7Qyy
	BUZXdRSy0Yas24Y65k3Xjy/r/DPOFAxSedbY9M+O9IQIPgiV62b0ZR0vBQgijLv0lt/829lAPBy4g
	ke68MPQHcDLjatcA20RIlk8Iig87x55EIzSiD6u+ElYSRdDTwROMeyPosmz5gr7rA5vPdHFV3qiJN
	LSlqhPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvfI-00000003cQ8-49U4;
	Mon, 17 Feb 2025 07:35:40 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvcY-00000003bsR-3uaK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 07:32:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so5231806a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 23:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777569; x=1740382369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMllDSNz6y9GDkrgwRaQVDA/pIhA4eMkvxsotewnFzc=;
        b=FTUT3gRBgSfB27Q3iWK++w7JLooSAeKSM3JRvJkyhYlAvqs/g5Bao8kDvEr1t2F+wx
         F1jGlb7Y4o59+Wj38FcelYlP7FEKXX9os9FoqLY5aZjqeNZuF/Dedsjmb3nLhIZUVQJF
         WDfdx/2A8mOy1trcOkcBWudAdAC7UsKyumz0pKBWE1EBuQjEkYI0mhd7Krl5QE2XomW0
         wrENwY7jIjmpz8aXWxEs6ELU2pQlPJnzl4BXwuPnpj03EndMmRnuAwuUvJBobVXTheQL
         95qF1cbcJKgBAsPxbRc8rr5WPOkatyvzMp+h2oS1/VHKu5/3dDP7gEBgEipt73ii2zj8
         QIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777569; x=1740382369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMllDSNz6y9GDkrgwRaQVDA/pIhA4eMkvxsotewnFzc=;
        b=uuxB1haKAOwdSkZB2uvQm21WrhWZsMndBgQaHIwN5PcKG6SMc7Fd2jcJOFQv5R2KdH
         tFZfK/msvR3DinV2SF9d9kTJrfUZKk7KKVfXAnBABfvHIg/op5mo1VEo9/HCeyA3Ead8
         QsHdiFdiqIHLs7ptKnAkJfpT03d+rKpse9fObxe9B1imYnDTRRyRJJ8lGkxUyO6oRxEf
         voRtLtgsYpljcfsTYO15vOHQkZKTnaeM7XN4KZOjoOCuHh6mPj6LuqyCJpaXq4S59x6J
         YiUjicud01YAxXgxnLwvf05nYwYZPtb+DpySYvCvzZQwl3TP2+Fkx0yR74YZymh67m6T
         5jCw==
X-Forwarded-Encrypted: i=1; AJvYcCXCXNrATaQs0+UPNn2l1WrwKqgG68vQwe4CmeTlwdAbRp/+78RftD2+CQkO3dtwGW+hfwQubvTw3e3xLbI5g93o@lists.infradead.org
X-Gm-Message-State: AOJu0Ywib8hLv46JgR76+WZk3L8i75yC+Oia2K7yzVxdYuHImVNG6bDD
	v53dofZnBP8+tr7TArBjTG1T+5wVGpeJkQvtCnbrRbNdyeAnvVksKCW6IbOCIoU=
X-Gm-Gg: ASbGncteyCCHpGreVpCQopB4C03vgOy23aVgEZLWIvzTPXtXf50k8l72UHuirBCULZj
	G258i6mqj8FKM2QEdV++sPrC9IR4UTvqB26g0wUB+iUrdgkjAdwPm8gWjUjT7OMSdfb7Aosp+p7
	GpX4q5CT0c2OUnwX9YGDYqCj0zXy9HcEQ8LP3CaZf+9MOgRy7LydueqBrh8ZjSYR8QVo8h9g4FD
	TTlN+DjEb6t0CTXbpe8UbtPHEylq4j8xwKiyoOB6MlHzhIrFpnYSPkyDgMg4tYrM1U+bg1fLPSS
	T2iznWA/fDuryeMq+iOv
X-Google-Smtp-Source: AGHT+IHJ6d8K2hnOLwZegjEVoeae7Dajjoxiun/dSlgu+G3MOV8fyQIllsHLSF3ttg4CQNHc/VyvvA==
X-Received: by 2002:a17:906:2454:b0:abb:9c8a:fbcd with SMTP id a640c23a62f3a-abb9c8afde3mr235343866b.53.1739777569229;
        Sun, 16 Feb 2025 23:32:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbac867bbfsm7724566b.137.2025.02.16.23.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:32:48 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in
 imx_parse_ioremap_memory()
Message-ID: <68973636-eab8-4d82-8359-ae2c8f60f261@stanley.mountain>
References: <cover.1739435600.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1739435600.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_233250_967654_990773BA 
X-CRM114-Status: GOOD (  13.90  )
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

The devm_ioremap() function doesn't return error pointers, it returns
NULL on error.  Update the checking to match.

Fixes: 651e0ed391b1 ("ASoC: SOF: imx: introduce more common structures and functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sof/imx/imx-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 82057af1436c..5a385d140bc7 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -338,9 +338,9 @@ static int imx_parse_ioremap_memory(struct snd_sof_dev *sdev)
 		}
 
 		sdev->bar[blk_type] = devm_ioremap(sdev->dev, base, size);
-		if (IS_ERR(sdev->bar[blk_type]))
+		if (!sdev->bar[blk_type])
 			return dev_err_probe(sdev->dev,
-					     PTR_ERR(sdev->bar[blk_type]),
+					     -ENOMEM,
 					     "failed to ioremap %s region\n",
 					     chip_info->memory[i].name);
 	}
-- 
2.47.2


