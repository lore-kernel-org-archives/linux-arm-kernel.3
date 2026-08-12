Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ABFC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doym3QyHT8bL7rPyfRL2QEekEkOSH3JrEcV5LcFpHT4=; b=UrfGpmjge8hq99pezqh7No6Er0
	73AgJTGDFJKqFjZTk+Y8udSFji9RE/HbjrDghDUUbq2IJim8jRfEhGwTIWANooCfjZKAa+gS3N45R
	Wa2NUk/3hPIfOM1b/q97cScVJYo/1uCA6c1jdcppuJziCY6cgN1ZFzt2y5L5Q9ENm9aITFqv3ojqY
	7BKqvxtNDgLiCFmcMy2VtR6Uh9YlacZTxxGuwtHDBet6YbZ9KxIZ3wEbJ9ulKHhQS7RbAjTWmmWFf
	d58y3/9+mvoUcgYQ8QMfZJuX76iUPVcLT7Z71Rtj8jeStxMiBiGbpyGremLSPl8dqlVvrf9TBfY53
	vJzXmX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu719-0000000G2PT-0QZY;
	Wed, 12 Aug 2026 11:21:07 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu715-0000000G2Ld-2Vgo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:21:05 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1219547a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533663; x=1787138463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=doym3QyHT8bL7rPyfRL2QEekEkOSH3JrEcV5LcFpHT4=;
        b=nSXPeUix85jFNXn7oTwbJEz1smMZq0tlmEAbEa/GYVK1OT/RrhOmt5BGQTsladgkFw
         WLpEgMDv/yoyUUfBYfRryOZ5hNLbAuWPRNVMZK+TLM2HR60FkoQqbqYpL3JAZtAn+tlh
         Aj9u5yU5YQHIiRYsr9xwtFQPBzcMefVykX2YmYWvdn1IyevFyPV92Zih9L4cDwxEeGNw
         N5isoypaKnTvYUzBh6yZMn/BYQNZyXgnX+BZ+bdEzNnr4lZChnxW8J4wYcwUmf7MLyF1
         lXEPZAp6dqCpY1COCgb8jYs9phzdGnexm4oiUZW/07U/7uYvHzeTeN9OW0rVmZW5pL/G
         slfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533663; x=1787138463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=doym3QyHT8bL7rPyfRL2QEekEkOSH3JrEcV5LcFpHT4=;
        b=j9i6dT10GVgtbMTfM7ZBRfNNSqRV433xGepxldqaTX6RrOcUvGFJc/RaxXz/qQyYwd
         kF3M9awL7j1/mKo8jHUV7y7WMW33ucESed0JamwZW8cc8/m9l+XUpCg3/6xsT9z6rlhg
         7DbveFSxr4e/gcwKsoTGYOv8sjWHyq7bkattFaRZftvlbkvifZ9I6MgRq9lzqwnBZzvN
         XF1VIT7GTrM3KEbtEQRoGyHSz6+h66uG0yBPemSve1xZhOdY/xLZtIz70FHwezs8x8bV
         tcInDH2UNsDSLiQIaC6dqr+2Lx81K2cnyXDhB4/xHoYfbrKazZKuOzst1YNmYgnyocC0
         srFA==
X-Forwarded-Encrypted: i=1; AHgh+RpkCkhhvGss0eifx6SdwY34Ll+8v4cudZzIe1kIzmhhxcplpwuiEmy5rmZx9V/QuhdSEWa59F+mAUIjryu1ybt9@lists.infradead.org
X-Gm-Message-State: AOJu0YxQK0shb4uvIGS3R8MHAnrX8IZrIXylpC7y4fXEdHG0oB+Adr5M
	/zke/4y+UYIrLA3aQRPieMKmHSeFpNtW5eAhRiPa258SFr1BHRBMnV4OFOtBzA==
X-Gm-Gg: AR+sD120dK4cwYOmtOyOkChW8B9wwhdmc169ZT4oJfTscsQaJ166WqPdfOFgUfsKF8F
	aiPvHTejPrKigAoG2UMIBxct6e5Prf87EfzYaU8KRUvFz5pdR5tTTeUzZEj7BmMoUBndxUONOB8
	Qlcar41i+1jccU05i0cZyq4BnM2e5IkTqYlEMWgTq9hhoVxZZhnJe9iWgBfNUdZWn4wmsyAtjqU
	DfYcO1I90SBT61TfqRRszHyV5tO3AgdP+C9ZzvEgKcu/XMAcJ2cahhC4ioiecUeAsfV8qjUlaVY
	pkQpza/mwVjje5okpRkV6IDbTt108dnQLrPKzXrPlfFQU38YODLUPHYXC1TYDBNObM5PzV7RiHv
	RTKBoCua+6bkGoxTu/5ONMBlQTdPhXIs3szlnhNO5IyA0QX8H8PdBEQqJVcblVHVO3oK+ZdgrOi
	R2sy7vGVCUVhNbazyy980jE+6lvWXUKo149JrcFZPGsNiNzJqtFAodqlfQ2BFvhtp/Zl33Oy5gs
	Z06Vz3rs8hgW1gBEjRlHiDacg9BxJa3LFZc4yNoG0wJ+xatdIb1USQ5iWGhvZsw5BZKC6MzeBsU
	nNB7kvsq4w==
X-Received: by 2002:a17:90b:3807:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-393013e58ecmr4752057a91.11.1786533662842;
        Wed, 12 Aug 2026 04:21:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f5ecsm3193765a91.5.2026.08.12.04.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:21:02 -0700 (PDT)
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
Subject: [PATCH 3/3] mmc: davinci: Handle optional IRQ return value correctly
Date: Wed, 12 Aug 2026 18:20:23 +0700
Message-ID: <20260812112023.42254-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812112023.42254-1-phucduc.bui@gmail.com>
References: <20260812112023.42254-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042103_643510_64A261E0 
X-CRM114-Status: GOOD (  14.61  )
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

host->sdio_irq is assigned from platform_get_irq_optional(), which
returns a positive IRQ number on success or a negative error code on
failure. Therefore, 0 is not a possible return value from this API.

Check for a positive IRQ number before requesting the SDIO IRQ instead
of treating zero as a valid IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/mmc/host/davinci_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index 4765d2dee599..dddd152d2ec4 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1303,7 +1303,7 @@ static int davinci_mmcsd_probe(struct platform_device *pdev)
 	if (ret)
 		goto mmc_add_host_fail;
 
-	if (host->sdio_irq >= 0) {
+	if (host->sdio_irq > 0) {
 		ret = devm_request_irq(&pdev->dev, host->sdio_irq,
 				       mmc_davinci_sdio_irq, 0,
 				       mmc_hostname(mmc), host);
-- 
2.43.0


