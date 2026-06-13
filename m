Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2833CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjgRrDs4U/LfhcpHjwNP4ZQVGC7Y6QM++jnEtid8htI=; b=NY+eyAm6bR3qSqNNe5sCXwO3m0
	H7Hp2UMWyoP7KY9tEiNr0Qwe6moxesMFZkqvPFK6cvHP94YXVDgZu8JegqLRl1UpxKiMgVIzqkiMb
	9p2aF8YFYqP4Ni/ueeEtGSzbX9pfo5kF8nYY0jcG4+A34q74RMgHvLug0kA/AB0zZToA2n3oE7TuO
	PRobpkYc3QxGqYKz9H1sb12UJ6fVASVBsJaAtJuPOCCPBhJPcKJwqg5r69fWwYNgTG4w8Cv3DzvCp
	OqIGc/Ar065eSPxZaUOHbPWbgztCqdQv2CgKoIpzlxXc0a0asC+rtGWpp6pVcxSFXu1a/OgfT+qcu
	PVmoOPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCha-0000000BrAy-1DaR;
	Sat, 13 Jun 2026 00:58:22 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYChV-0000000Br9K-1MvS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:58:19 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-69d7e72b052so1015114eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781312296; x=1781917096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjgRrDs4U/LfhcpHjwNP4ZQVGC7Y6QM++jnEtid8htI=;
        b=WSdEBoKUzToHs9xZDvDH9kkrmqyNR66Olp4FCUHO5iW7VQx2ux2ZukAFZiJ8gRxCIa
         OEN6PNGEz2IEX4JpfuA0ew1ECsA/JquDhalEVqOA/pi5a6q9X43THDoqdDCQbmcpmNR2
         C5yh8MxLtVbSj/ZrHYY8vZAtNZZs0xG61dqFOwOfWZ1xjlZsQvewaOp5nm//SsLhMvyi
         Xq5Sco4DZavKARncWg7GMGDiX+0yHr8U17Pls0g3oGww9oubYZvDbTG2LlcnKSIcybtP
         KQt/OlqFEqPXzEMuQqj5hl9pxYagNiGhxo7aSBCzxt700BwfhkKllaM7WvN1CVjJnd//
         NIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781312296; x=1781917096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjgRrDs4U/LfhcpHjwNP4ZQVGC7Y6QM++jnEtid8htI=;
        b=fn1LOZLHDFwv3+J9j6DsH45jnxzuqMEXalpCsQvwSmQqhgTMWhWPazOKq45SqWXdrA
         t4CRwjzarGy4MbZrtlhNwtUJ60H1Qy5zZyUzI2dWm4MpcIOP9Pf8WsHtePqZPCWaH4Qe
         28GnOccwGI4zTJakdYOTA1s5ZMX9A4DNealAszT1GtoQnCeuW2wtnU9I2ymFtWkGXwjc
         IDIKup1YL9lOo7fVpOhqBimI0xpY11okeYQNFucgRis4raRbC/NDCdby9jGB+4KP3kIY
         qDMPmcNfOF+YzU4rqKX/h0z823NCBtX8nh1wOuuAeG4yMt2uCX/O1sUiV1AzoWHV9Z2o
         4k4g==
X-Forwarded-Encrypted: i=1; AFNElJ8rPb87xmUzkyf5Vk6F67jRCMFPQxykoltUjZqcE52qyHpdeoBFopa95boPcUOq03bOwDdl57dBGt+NkcleHIPE@lists.infradead.org
X-Gm-Message-State: AOJu0YwOz+gEXOfoTtO0mQybTC/8CEULCQSfppr52ddqJ8DM2tyWjrDV
	ZLwEEf0hVGJDQd+8dykDmHXPEH9a/CcbFaF5F6JJWGW7LTlKc4peEf95
X-Gm-Gg: Acq92OGnWkBb0RJXtsoUmUzBq6wd6GbkeJRb2+Ht8IWjmXEeO4qPW91f9IgR/ib9Yn1
	qYrC3obOS2MYDILhRTPdz8Sh1Mk4YF+/x1sVHZPNc56SW72KwVvVAa8aPYnuHviA2eA9z/RT27p
	mVO9J4gsEHzU+JrKdIOpu6XSmPKTyx9yZmSV7ttc36fKCfGN7yT0QHl7v8sMz52ZhiN1I83TkbF
	KE5fAbIWaxZikYsS92pBtBUa8E8eW0+B8eOHUJD2Myp+9FJNuqQ0Ksn7xNWPGLsV7OQduKUEDu5
	7ZNaxyp/qQjdib3Q+1h1Xx6ENQhcKeAyFqnVhirUWTb0iBoN7FNvzmlFXfK41MaUD99ldbCHdRC
	70c2xq8KJF88cRZyXZaPduoGIQSb6ObG1xL6hV2WdSjlo4dW0IDoxd6cWV81dKvusL0j/Q/3FQq
	C9n2mJXsZkdC/mcKR7+Yck+RMJrdFmxdUhef5VkCi7MzRu4L93BTY8eZYwLQ==
X-Received: by 2002:a05:6820:811:b0:69e:43a2:349 with SMTP id 006d021491bc7-69edc78cffdmr3361367eaf.47.1781312296313;
        Fri, 12 Jun 2026 17:58:16 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4426abf260dsm3150731fac.6.2026.06.12.17.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:58:15 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Hartmut Knaack <knaack.h@gmx.de>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>,
	Jaeyoung Chung <jjy600901@snu.ac.kr>
Subject: [PATCH 1/2] iio: adc: lpc32xx: Initialize completion before requesting IRQ
Date: Fri, 12 Jun 2026 19:58:10 -0500
Message-ID: <20260613005812.160572-2-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613005812.160572-1-m32285159@gmail.com>
References: <20260613005812.160572-1-m32285159@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_175817_367988_A4BCFFC5 
X-CRM114-Status: GOOD (  14.33  )
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

In the report from Jaeyoung Chung:

"lpc32xx_adc_probe() in drivers/iio/adc/lpc32xx_adc.c registers its
interrupt handler with devm_request_irq() before it initializes
st->completion with init_completion(). If an interrupt arrives after
devm_request_irq() and before init_completion(), the handler calls
complete() on an uninitialized completion, causing a kernel panic.

The probe path, in lpc32xx_adc_probe():

    iodev = devm_iio_device_alloc(&pdev->dev, sizeof(*st)); /* st kzalloc-zeroed */
    ...
    retval = devm_request_irq(&pdev->dev, irq, lpc32xx_adc_isr, 0,
                              LPC32XXAD_NAME, st);           /* register handler */
    ...
    init_completion(&st->completion);                       /* initialize completion */

lpc32xx_adc_isr() calls complete():

    complete(&st->completion);

If the device raises an interrupt before init_completion() runs,
complete() acquires the uninitialized wait.lock and walks the zeroed
task_list in swake_up_locked(). The zeroed task_list makes list_empty()
return false, so swake_up_locked() dereferences a NULL list entry,
triggering a KASAN wild-memory-access."

Fix the chance of a spurious IRQ causing an uninitialized pointer
dereference by moving init_completion() above devm_request_irq().

Fixes: 7901b2a1453e ("staging:iio:adc:lpc32xx rename local state structure to _state")
Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
Closes: https://lore.kernel.org/linux-iio/20260610115700.774689-1-jjy600901@snu.ac.kr/
Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/iio/adc/lpc32xx_adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/lpc32xx_adc.c b/drivers/iio/adc/lpc32xx_adc.c
index 43a7bc8158b5..db3a602327ff 100644
--- a/drivers/iio/adc/lpc32xx_adc.c
+++ b/drivers/iio/adc/lpc32xx_adc.c
@@ -179,6 +179,8 @@ static int lpc32xx_adc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	init_completion(&st->completion);
+
 	retval = devm_request_irq(&pdev->dev, irq, lpc32xx_adc_isr, 0,
 				  LPC32XXAD_NAME, st);
 	if (retval < 0) {
@@ -197,8 +199,6 @@ static int lpc32xx_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iodev);
 
-	init_completion(&st->completion);
-
 	iodev->name = LPC32XXAD_NAME;
 	iodev->info = &lpc32xx_adc_iio_info;
 	iodev->modes = INDIO_DIRECT_MODE;
-- 
2.54.0


