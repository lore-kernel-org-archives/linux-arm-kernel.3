Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E79EE20A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mib8qSuKz/dqMMxLJ47BKHYisRGtocujstnMCZQJiTs=; b=1CwKHcGNdL91ds
	Z5uswr/HbQhpkgsy0uywbJAZAeZYtR6p9Kd5CRZl5ZywLLM+7V4h3j3NyzK/iuYQ1U+aaEPXPyGaf
	HOQ8GHQ3TAGX+0rMBjZDQKMSJ18A6GDYk2CDT9c3SC3uD3Z3Xu8apFSKtF3sqbCNFp2Q2RdUnqgY8
	cs1nPX4BLLA6p9svO5KjV3j5cgt5E3zt5SRUzpwgLy26JZYpqMdxkP9IiiNy+fiuVJhKc6dGMDqiP
	nAZK8zPloyT9nl2XAPAOqP/CAchfujBGmnFrNpSRPW+3R2qa8WE6vNSDtvFp2UXMmYyz9YXkajxGN
	868k9rD02uett++eVgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM4x-0000000BNW4-1FCc;
	Fri, 06 Feb 2026 13:40:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM4u-0000000BNUf-2P9r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 13:40:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-436234ef0f0so1128618f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 05:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385255; x=1770990055; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mib8qSuKz/dqMMxLJ47BKHYisRGtocujstnMCZQJiTs=;
        b=HgTNVKEB8bCQBbGEkiGRpOHuk4YxM0j3VyT1jpgHMKQewsttg6qGskFLii0J7g8p6e
         ZbV1YW90SUuG68KeVrHddqnj5Raatm7WjABRX/44EhBWi0Xd4Led4l89HkRMHOhaSYRR
         NFO+OthnWzEqRv9B9528Bt7KiVZAg6oY/lRa2rd/RFAkDOS8mNOYZZX/4HR5LSqM0EJ3
         Q4FWvx1Wv6WNJnWh9W4vDe2ANamuzcJVYQQuPHVrGvuJ17KiR0zc2mXNib84s4XiceO4
         FgG2lz5BLpU6Ga4kjOLEyImaDgzDtkGbPCqF+IvII/qLo9TaKbAFP3DOjqmNWdFm+pYg
         iVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385255; x=1770990055;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mib8qSuKz/dqMMxLJ47BKHYisRGtocujstnMCZQJiTs=;
        b=OZCEvgu8Ll3Kf7P+vynTUWJbwZHMCcF4HiXpF7KOKKGiAkoR0wnjA5yb++ZClgLO3K
         5iSxGOzfhske2qgVNcqxOggymvvumMbrWQemSGILxG7yE7BhpVzJh5CYglCkNYPRBHwP
         LkwLH2w/MCIyfpb5fCJioElyu7Ih2xFnnjtt55NSmXFaCsTmrtjryLtyZYWrRA+IMFr3
         EIqyvitn1B1cRyUBdtmGvd2rF+M/udjQKbrgZxqWUao8FE1fjk/Znbug2r6P3ec0UrQS
         28MVZLYNIZQ5g8ICGG1j4VT7ipBNkvgWGIXmSp65EObI+NkUJVBe8iU43JCPPLRLPwek
         BReQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrKosAmJh4dwppoJXJUu2cqQKPVFGNWNEfunVZIi43HVtp0X6f1YqhZh0g9joew0IflwMGABNKk1KbVYhHtK+F@lists.infradead.org
X-Gm-Message-State: AOJu0Yywq/9+vazNBF7aKFnTqzzv7m1lcWaxFsY4mm5317K8TSvd/sLb
	LOgQ0bMGLVwclndCVlA3ehVfUnWetuiGcfopCRDz0RdDRBt/W9I7/ZjGziJ2PqAtYr0gZuhfWTn
	Wlsfm
X-Gm-Gg: AZuq6aKOao0ZshxTUrCklsa4TovPxlTqwZMcCvJPxrKjWOem0Kj//DS493IBY+VK4P1
	5ener+lVV/hLLn7y3KbP4tFwnSiDUlwiqKcotyqHqpSDc8Cq58ofAzqX0XOkbppSwLpKUolvbGF
	509mf5MQg7eoA3rLHb2Qes5YgSWLesgiUegv10lu4JYOS//3/oX+4pBmQbfCcjMsb01QarPhTsi
	L+Mnevt7d4m2nGXbNt57TyFppxn85eAsqLLcXaYVEfz9hmHOII2jaHxjHNpleAnFcV2O8CwC/Nh
	l72izIQFrZnT7DeihhYl5Saiw5ngSZKFXCIbsfY+kvKr1MG0QnEktrbqf12OWzqWvD4j+ErEDto
	ImZVFBBeVz1wAfHTuqwk2gE1P3eOqWrI1dO1aimOy7IHsqOupMpbvkLCITJEnai3gSmi28twztj
	hTDHHP93LHdCX4ezBi
X-Received: by 2002:a5d:5e01:0:b0:432:c37c:d83b with SMTP id ffacd0b85a97d-436296590a0mr4325393f8f.20.1770385254516;
        Fri, 06 Feb 2026 05:40:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25casm6293951f8f.4.2026.02.06.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:40:54 -0800 (PST)
Date: Fri, 6 Feb 2026 16:40:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] spi: stm32: properly fail on dma_request_chan error
Message-ID: <aYXvY6NH7OlZ-OAF@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_054056_639826_DAADC8D3 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Alain Volmat,

Commit c266d19b7d4e ("spi: stm32: properly fail on dma_request_chan
error") from Dec 18, 2025 (linux-next), leads to the following Smatch
static checker warning:

	drivers/spi/spi-stm32.c:2578 stm32_spi_probe()
	error: 'spi->dma_rx' dereferencing possible ERR_PTR()

drivers/spi/spi-stm32.c
    2480         if (STM32_SPI_DEVICE_MODE(spi))
    2481                 ctrl->target_abort = stm32h7_spi_device_abort;
    2482 
    2483         spi->dma_tx = dma_request_chan(spi->dev, "tx");
    2484         if (IS_ERR(spi->dma_tx)) {
    2485                 ret = PTR_ERR(spi->dma_tx);
    2486                 if (ret == -ENODEV) {
    2487                         dev_info(&pdev->dev, "tx dma disabled\n");
    2488                         spi->dma_tx = NULL;
    2489                 } else {
    2490                         dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
    2491                         goto err_clk_disable;
    2492                 }
    2493         } else {
    2494                 ctrl->dma_tx = spi->dma_tx;
    2495         }
    2496 
    2497         spi->dma_rx = dma_request_chan(spi->dev, "rx");
    2498         if (IS_ERR(spi->dma_rx)) {
    2499                 ret = PTR_ERR(spi->dma_rx);
    2500                 if (ret == -ENODEV) {
    2501                         dev_info(&pdev->dev, "rx dma disabled\n");
    2502                         spi->dma_rx = NULL;
    2503                 } else {
    2504                         dev_err_probe(&pdev->dev, ret, "failed to request rx dma channel\n");
    2505                         goto err_dma_release;

spi->dma_rx is an erorr pointer at this goto so it will crash.

    2506                 }
    2507         } else {
    2508                 ctrl->dma_rx = spi->dma_rx;
    2509         }
    2510 
    2511         if (spi->dma_tx || spi->dma_rx)
    2512                 ctrl->can_dma = stm32_spi_can_dma;
    2513 
    2514         spi->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
    2515         if (spi->sram_pool) {
    2516                 spi->sram_rx_buf_size = gen_pool_size(spi->sram_pool);
    2517                 dev_info(&pdev->dev, "SRAM pool: %zu KiB for RX DMA/MDMA chaining\n",
    2518                          spi->sram_rx_buf_size / 1024);
    2519                 spi->sram_rx_buf = gen_pool_dma_zalloc(spi->sram_pool, spi->sram_rx_buf_size,
    2520                                                        &spi->sram_dma_rx_buf);
    2521                 if (!spi->sram_rx_buf) {
    2522                         dev_err(&pdev->dev, "failed to allocate SRAM buffer\n");
    2523                 } else {
    2524                         spi->mdma_rx = dma_request_chan(spi->dev, "rxm2m");
    2525                         if (IS_ERR(spi->mdma_rx)) {
    2526                                 ret = PTR_ERR(spi->mdma_rx);
    2527                                 spi->mdma_rx = NULL;
    2528                                 if (ret == -EPROBE_DEFER) {
    2529                                         goto err_pool_free;
    2530                                 } else {
    2531                                         gen_pool_free(spi->sram_pool,
    2532                                                       (unsigned long)spi->sram_rx_buf,
    2533                                                       spi->sram_rx_buf_size);
    2534                                         dev_warn(&pdev->dev,
    2535                                                  "failed to request rx mdma channel, DMA only\n");
    2536                                 }
    2537                         }
    2538                 }
    2539         }
    2540 
    2541         pm_runtime_set_autosuspend_delay(&pdev->dev,
    2542                                          STM32_SPI_AUTOSUSPEND_DELAY);
    2543         pm_runtime_use_autosuspend(&pdev->dev);
    2544         pm_runtime_set_active(&pdev->dev);
    2545         pm_runtime_get_noresume(&pdev->dev);
    2546         pm_runtime_enable(&pdev->dev);
    2547 
    2548         ret = spi_register_controller(ctrl);
    2549         if (ret) {
    2550                 dev_err(&pdev->dev, "spi controller registration failed: %d\n",
    2551                         ret);
    2552                 goto err_pm_disable;
    2553         }
    2554 
    2555         pm_runtime_put_autosuspend(&pdev->dev);
    2556 
    2557         dev_info(&pdev->dev, "driver initialized (%s mode)\n",
    2558                  STM32_SPI_HOST_MODE(spi) ? "host" : "device");
    2559 
    2560         return 0;
    2561 
    2562 err_pm_disable:
    2563         pm_runtime_disable(&pdev->dev);
    2564         pm_runtime_put_noidle(&pdev->dev);
    2565         pm_runtime_set_suspended(&pdev->dev);
    2566         pm_runtime_dont_use_autosuspend(&pdev->dev);
    2567 
    2568         if (spi->mdma_rx)
    2569                 dma_release_channel(spi->mdma_rx);
    2570 err_pool_free:
    2571         if (spi->sram_pool)
    2572                 gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
    2573                               spi->sram_rx_buf_size);
    2574 err_dma_release:
    2575         if (spi->dma_tx)
    2576                 dma_release_channel(spi->dma_tx);
    2577         if (spi->dma_rx)
--> 2578                 dma_release_channel(spi->dma_rx);
                                             ^^^^^^^^^^^
Here.

    2579 err_clk_disable:
    2580         clk_disable_unprepare(spi->clk);
    2581 
    2582         return ret;
    2583 }

regards,
dan carpenter

