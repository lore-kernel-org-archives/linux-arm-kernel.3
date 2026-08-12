Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75172C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbzzHBH8DpqZehMLNcK23Xh4Yld6J3JsAmwo9QAsqAM=; b=VsmJfvjkS7LxaAY8nt2qjRelG5
	skTWIHQC7bkDV+NXqZYhdm8rsJTxJdQi3ypd3Y2FmnSFqHEZzAvkgzRUTq6zMZYzStN6J9gvUMXor
	PZgrVbUS8h5N1B2t7JXALS3d9xKC9vh6f1OkIJCMyhTOk7cQ5mndG6+eZemjc+RNz2nb0IANjyK1M
	fkXBuwtVjW9d5fBZAQlMMCdn+dWnuloKI0QhS1jzKLAqpVj12Y51G7AumLMzizC1+anV27ikQdFEl
	6gIAZ9rWjP6iwQn+vauyJ0TMHYTV1aaoSptfloxE2LnnUSA6LoM8ldU7v9VCmEuGPG5e6qk1rDhtC
	sEJPLD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu714-0000000G2Kb-0SLn;
	Wed, 12 Aug 2026 11:21:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70x-0000000G2G7-3e2U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:20:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cf52d15d88so8432595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533655; x=1787138455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbzzHBH8DpqZehMLNcK23Xh4Yld6J3JsAmwo9QAsqAM=;
        b=Aw/IM9xgiR68T9+lF3weWxNGcJ9o24c4wS6nVDyjjnr91sRF+SAnnPp0cM5QQLGX5D
         Bxq3WgY2LTJkqVjVpM6VKTzKXwdNu/pDaYO0FeK3w6bLdQO8U2svakQ1V2605hMvjpn8
         hHzRcQpNbG+ewE0Sq+JAi+XjZYeeoTtzmIYA9yzAoJPAT5+Gva3R4pgJlsyhjT9RRrC0
         OZ/IgdeLEjP1AV6H5okXIc6yLQZvVS5JfFkBgGNF30D+tg8S3yTFeA6uUZdHaIwSFaJy
         7OlmzRcWOA5OCru+B1MbaHww/hR+0m/Y+wP9jf3Gg7TRqbMwSukFIQbM6FGUaelIeDmH
         PUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533655; x=1787138455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbzzHBH8DpqZehMLNcK23Xh4Yld6J3JsAmwo9QAsqAM=;
        b=Laykxu6/Ky9HaIzpyUmO4KucOHSB9oABjRpLG6fgHkmYR0El32O6JqvdVg+uNzs3O/
         wa08b16mQInk8qhmbQUzR+y1dzdwzfo3T6BzJiY84oDT6BQlc4Xrl+OqqEg6y4PgDYyH
         p42zK2zDCFJ4ZOBwoYqA4KLRHWQ13wPkLU3oLvSbRepzCszOmBzJzKS9+cmiLec7Jrxj
         Obchvv+8BrUXLC5jXBLmUNvHq/wFHrcH1PUsYDfUJGnIXfiquN/Jgo7vpu9ProP4ApeD
         Nm7OUor45/5+PSRyGCceE0mVQRQMrkWJ7lTRX6h82NSafDPXX8y8nMcIirvRZlxVyjPL
         2VRg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/ssu6CpOELaE2ropsB80PTJObL/1l+vagHa0F9R5psSmE6MyEzgfC0RiNqluZUevtxq3r8n8VR7FV8uF7mNC6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1+yYvh3hZ9lWGP5L01CEpRK2Gt/mMoSN7fcdHBMKRoW5JtW7x
	CkAaka3uhNrCYo8jWwWCYWF79t0EXeRpt66bYBvOB8kZ1UPxLuciw/fV
X-Gm-Gg: AR+sD11+pRdUpVezMD/S7fCE0ZnRUEQ9fT05WPFb3C8xvpMvH4lHOyTQkMheCSJj7hz
	bkTn/Qao1EtgCwnlCEEdE12sFP0md0+61mrcNzN8jck4iMNR+rzMCxtCG6CB8agi7DzcuMtYnT8
	pFpWwaLC7NbcdLum1KaCR+G/tw1kgBLiC6h+57RC1e4hy7xGYf4W4o/oXDCWWwC9xDceG9CujUY
	M7xyfV3laGtT/4hPx4d+Fs4/OnBpE9CPzeAW1JdlWprDtFbZXvC3kQ3VYYBDIfeC1uqUWmgFucG
	rJ0dXe1TunNvxcO3l5CxyVq2pRNu6hgfa5AcqHWz7EbUz05cFzx5L1zlJSxILUn/RR9n08LD0qW
	gYdN+M7J5JiWcfwCKNFpBqQo8CLwsgu+YyXcddFSNFvmXolYFEGqWHPolYrCNte//CW0GvzTL0v
	OPzHUQLhs+J077GA99eVFi2lQVQzqgMKtOuXJ9DBeha0FmJi2bZdVUil0W/jII+0m+zGZlPp8sZ
	n9M6rjKVafw8xuaQ1QrtdWLDyrsGFyV5MMpaqlI0FZ9XMv5MwSNSeWOyW8xA0AVl4Rc6IBCNqN6
	EgkW
X-Received: by 2002:a17:90b:1dca:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3930123d0c3mr4872172a91.1.1786533654838;
        Wed, 12 Aug 2026 04:20:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f5ecsm3193765a91.5.2026.08.12.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:20:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] mmc: davinci: Handle errors from optional IRQ lookup
Date: Wed, 12 Aug 2026 18:20:22 +0700
Message-ID: <20260812112023.42254-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812112023.42254-1-phucduc.bui@gmail.com>
References: <20260812112023.42254-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042055_941858_B9189022 
X-CRM114-Status: GOOD (  15.54  )
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

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

However, the driver currently stores the return value directly in
host->sdio_irq and continues probing.

Propagate negative errors other than -ENXIO, and only assign the IRQ to
host->sdio_irq when a valid IRQ number is returned.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/mmc/host/davinci_mmc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index cdb9fa94b56d..4765d2dee599 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1248,7 +1248,11 @@ static int davinci_mmcsd_probe(struct platform_device *pdev)
 
 	host->use_dma = use_dma;
 	host->mmc_irq = irq;
-	host->sdio_irq = platform_get_irq_optional(pdev, 1);
+	ret = platform_get_irq_optional(pdev, 1);
+	if (ret < 0 && ret != -ENXIO)
+		return ret;
+	if (ret > 0)
+		host->sdio_irq = ret;
 
 	if (host->use_dma) {
 		ret = davinci_acquire_dma_channels(host);
-- 
2.43.0


