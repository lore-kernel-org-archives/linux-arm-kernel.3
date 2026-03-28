Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F9D10F3DEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqrrS9uvTvJ0weuIXquOC2uG3YCXwOkehaDJ4cbhf3E=; b=G/8rJFFWwn1GlJc5OiVRtB1GgY
	EmOpV0b6S6qxzjZHIZHDxqsR6zfemHQ/XKx1+uWKylp6OGeXbhYEhG/kWcPHMbtoxIilXbKEF4e0m
	4gIaqv5tgiqaVsVslPSCTN5W3qUE8rhDoERtaNFK9bvxQyBwRB8OaEDDKqsSEOgr/DnEZLeQqMsPb
	BQ3Dk0mXnvHdvwiAIlOjDsOUSymnERyBSi22CdZU6I8gca+3TSMnYkb116oxLtbEE4xUxJU/PQvod
	34OsYOSTGXQN4SqWd1E/qCnKxQRrdoPvhvmCjtgSl1G+RmCegwLp2tQVJG2aR6NEIJUJts4Q/JFit
	kasTEJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6WC1-0000000960q-0FQa;
	Sat, 28 Mar 2026 16:07:21 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6WBx-000000095zn-0q02
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 16:07:18 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so6675a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774714036; x=1775318836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqrrS9uvTvJ0weuIXquOC2uG3YCXwOkehaDJ4cbhf3E=;
        b=f7wmGTVYX84g75f6oUdGq3Yoc1ztAWyXlkhY/CfL3Y/86QcEMkpTj0MrrRwOeMlc6y
         FpPcWbJb7mN8GQsiervvi9hgQtAWaeLav0YX22uI/1IlDuIk/j3QsrSuCBZSN3yzTLEs
         Z93+y47ocar8rq5CCYF3Zx1c54r1gyRScZNNCfkLjU2awZ5JiGiGQfRywuBVdQWAUbSl
         bvtObnR1Os54o6zrAQ1lxFt+kA03uPC17Wovd8/JKaZmCQ91ajAHDJWur5t1gbu83ruO
         z62YdwTHFD6bB0vt92mYGl9F77zjU7l2ee68QlO5I1X+xdjqmmAwan71u0w9OEb7Oe0X
         19IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774714036; x=1775318836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UqrrS9uvTvJ0weuIXquOC2uG3YCXwOkehaDJ4cbhf3E=;
        b=lSiyYXyo60QJwy77F2q471JfqTx+zyYG3rU3PJ5Z/oxhIfGM+XZOAEqbey5ZTK+LNk
         wsZvj/dv25SSv7iLq6JIrduggySJciOriaAOv+zIveM7of2JEW1tPlA5KhOo/2aLMugW
         WZpi3tBETPtW5m6eaMxnVCr4pvDLJo78Z7KZcnY9FUqNmEWRY8NjRsOdM0KffylY5k9C
         c0Ex4i1uhCGNXyUuk3jL+DiGuukanpGD/m4mjdwwHQJOsE/JZ+rsq5s6mbgL1vUKEMK8
         VI/izCSjOv4CxWFM6wEPxGbo/NWvfkVeoLmq3xeC+RloHJTTU1uL3iiFncLp/ryaurzH
         xlDA==
X-Forwarded-Encrypted: i=1; AJvYcCUYuLEqdimDsa4NHrb8HI4JsvGh2WF6qijxKkxxFYYlDvtof0gfUn2cLQwS+0Pn3EWld6dzLZWDYLIQA0woYnXz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdh14Gn9UDUxB3NPY62yPJnTGbK2U5fUXzFuEsP8UzPpOf3s5a
	PD/9pw+l0U4Rph4JrP0rGXHvU4awaJR00fIa4R3yKDi75Wazfz9IW35d
X-Gm-Gg: ATEYQzwLzyZ0048HJ+lTEBhcfeQOpmTiTRWS6KHA9vc3qdNmAIfjHF+Kqqot23YAt1s
	l6MBMl5RqDB1s/IzJd2/3ekfRnkjkILnkiUoLg9lJqM0/P8+Of5xjdN83WFnG/tgn+1pDs9kIU2
	bGHT9xeHBARjBlQ8Mfb+aVnhNqUacErRuIHttxiZiJof7EsdYZmiwkw6dOjzY1c1cb8vHpAtxZm
	oa349i3gh8lhh9ZUd8Mb89NwFu8+glvs+XLCMd8UkfrVH4N0pKLG1/9DDsxlu1yP26+rpn3qwKD
	GcFm6iUWLCBasWsswO+mNp0eFtOmXsFNg0qjZM6mL6F8ylhIJMwaBt+nzOdMBm9LZpPIcyUE4/H
	W94faQwRLrkKfEEchLpyNhqMOMA9kRFj1eZ6tNt8e8QuYrZYBNXbbVVtVpypXGWqrW9C0OFfFrW
	42vhJIuueUteu4/bNHVFHUXkxfRHnx9Hw2Y62V
X-Received: by 2002:a17:90b:390b:b0:35c:812:6126 with SMTP id 98e67ed59e1d1-35c300f9db0mr5029057a91.24.1774714036132;
        Sat, 28 Mar 2026 09:07:16 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec27da0sm1988140a91.8.2026.03.28.09.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 09:07:15 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 29 Mar 2026 00:07:07 +0800
Subject: [PATCH 2/2] spi: stm32-ospi: Fix DMA channel leak on
 stm32_ospi_dma_setup() failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-stm32-ospi-v1-2-142122466412@gmail.com>
References: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
In-Reply-To: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774714028; l=1104;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=g/NC5thUm9GobODU/U36/p17WTlVCj1qLtVx9sZkHSc=;
 b=aSWLNSCRp0D8866dSgcbY+JT4XedGUT6QeFZ4e3z25/G+O1t9HoLZs4yvCDebAVPEe6SBW0MI
 wJBP5VFN2niD5tp1lOmoFBkjn9PFB5InUP/CCkXoqJ2mkl3cCcQcxGB
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_090717_245276_BA98F6CB 
X-CRM114-Status: GOOD (  11.68  )
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

When stm32_ospi_dma_setup() fails, the DMA channels allocated by
stm32_ospi_get_resources() were never released. Add proper cleanup
in the error path.

Fixes: e35a7607e05d ("spi: stm32-ospi: Set DMA maxburst dynamically")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-stm32-ospi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 52997c3f7174..34498939bcdf 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -923,7 +923,7 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 	dma_cfg.dst_addr = ospi->regs_phys_base + OSPI_DR;
 	ret = stm32_ospi_dma_setup(ospi, &dma_cfg);
 	if (ret)
-		return ret;
+		goto err_dma_free;
 
 	mutex_init(&ospi->lock);
 
@@ -975,6 +975,7 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 err_pm_enable:
 	pm_runtime_force_suspend(ospi->dev);
 	mutex_destroy(&ospi->lock);
+err_dma_free:
 	if (ospi->dma_chtx)
 		dma_release_channel(ospi->dma_chtx);
 	if (ospi->dma_chrx)

-- 
2.43.0


