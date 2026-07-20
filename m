Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A27BC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLETP574W//JLh+FTkzjcKwtbtDnoO3wAXCceho0s4c=; b=PFcUdN0/pKOlNVouHyL26YrfdR
	bcGkWDX0kZf/HZwba8s3nAeVeA4+yewwe0zVziYq48MgRKGwjkV4NgaU/OwiT63Px8AtyiWkIwmI5
	Ee7w5OXlcc8PscXEhaniVlAfjwBuIf270bc1ZKP/WXlQSiXrJ/ayZzuCBETT44yvMDB6xlVOPXG9g
	6fjwshC8aA6p/7QHUjo7VwruAQS2ZmdYXQtBNJFjs+pvoXilM5L4cl4ahzaAFFtFWs3595R6uuVjv
	tz6ELFasHjuAT7lqDnShpiRHZ6xi5Afg79Yot6dFRM7k5wEu8WUCKEFPkGLn2PlFfjJbmXgZPQt12
	4ZDDc+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkP-00000007MN8-13jg;
	Mon, 20 Jul 2026 16:21:41 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkH-00000007MJO-3cLi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:21:34 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cee9b74ee1so63493715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564493; x=1785169293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLETP574W//JLh+FTkzjcKwtbtDnoO3wAXCceho0s4c=;
        b=LvVM4UuRr9qeHzqHn/wwA6Jm/IjuYRtLj7qC0OOOV/n9WWS39BI5up/gNoedtJeFpx
         NRAug036V0G6fxrDMyFtFU2mc2ohR4a5Or9lLltfHOMjyeR0WptkGD3Sx6gVXtQAF0zH
         929TSDdd99bLrKrt0G6Ha+9D+NK1tTDAQoJt/bCk/hZROG0yxLRO3Bk2L0txIb4OK5Yu
         Ef3Z3mgG+8M5y454dDn4T67xQuf+xWgXLaWvgNEvoz2Teg+oHq+iqzj9byD5EMyTajXW
         kmo5/M4KJxRziSMXeyhQbPzSLMEbnR9jliov+GX/h8YJ4vrw/UjArZ2Im5jZemnOC5V1
         s3+w==
X-Forwarded-Encrypted: i=1; AHgh+RosaRML3oZw8LLYZj77s9sa6zMU08SBxt6zK62CKe/oLk/QXZYJuT0MCcuP7zeM4sm8JycsgNQtff+NaDUsCp8q@lists.infradead.org
X-Gm-Message-State: AOJu0YzgWQc88HrmzDK/Bb3DuXr3QXEXqb8fHKpuCi0n91FgmPjG3kfT
	wurZGrdXyyrPAl+JHDiV7Lwkz5SQVjn2oSQFWCfJretDqEfS0mxG9PI=
X-Gm-Gg: AR+sD109VVqX+7VXHpqyzuzJuZzKnqrLE+rOsVLlMOx2veSTaQrYFOGkQ6GR97kPe48
	TvZ07LPP6i0CQflbZrV/vlTqxUPGWG1bw6+TC5WxFVlVlPFkyykMfn2eOXmh7rprQHflRAr9kbb
	WOntFfLISsDSKl8ltBguXc1tcIANBmJmHvcROFOxTbMtRySnOmIglTbvY+kDmAjFYgTjNMaFcN5
	ffpiZD0MmiUwM8hk6DT+94hME4LOgZDb22I3uy0SHYPZppa+CgDsTq458IeFq9U0noJnP/Pmgng
	yKmuI+mGgRvCKKMHRDDOkfrmIeOR6A+/sgi5kaxBFQlTvQSRNEQjCnCtgKNNB7cj6cggyp88fqK
	9Lpycdl9pdlcgX3ZrlJVzS9QCiJiHjdkbDTpqG/JdKhG00aDFI/c5GifsXDZv/pM4Q/DVvIJ6B5
	vsSZnbirGN3teK6NLNlwaUznNjqfpBr9pkwAOqRyLPOy/LUGTTR+jlOn62EhHpMm4y6+4ixeMsj
	SyakGofHtn+93vbUBeQMolypAqn
X-Received: by 2002:a17:902:fdae:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2cf3466a93fmr166932475ad.0.1784564493132;
        Mon, 20 Jul 2026 09:21:33 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3479463bsm58467385ad.80.2026.07.20.09.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:21:32 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v16 4/7] spi: pxa2xx: lock out runtime autosuspend for Intel LPSS SPI in PIO mode
Date: Tue, 21 Jul 2026 00:21:13 +0800
Message-Id: <20260720162117.32304-5-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720162117.32304-1-fourdollars@debian.org>
References: <20260720162117.32304-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_092133_899990_EDECA04D 
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

When operating in PIO mode on Intel LPSS SPI controllers, runtime PM
autosuspend clock-gates the hardware block when idle. On subsequent
transfers, MMIO accesses to trigger resume are performed before the runtime
PM state machine can wake the controller, causing PCIe Completion Timeouts.
This issue does not affect DMA mode, where the DMA engine holds the required
resources, nor does it affect non-LPSS controllers.

Lock out runtime PM autosuspend for LPSS SPI controllers specifically
when operating in PIO mode.

Acquire a runtime PM reference via pm_runtime_get_noresume() in
pxa2xx_spi_probe() after registration, and release it via
pm_runtime_put_noidle() in pxa2xx_spi_remove() before hardware teardown to
ensure the runtime PM reference held in probe is released without invoking
runtime_suspend on already-unclocked hardware.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 6bfd3382acc3..34241a6742eb 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1473,6 +1473,9 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 		goto out_error_irq_alloc;
 	}
 
+	if (is_lpss_ssp(drv_data) && !platform_info->enable_dma)
+		pm_runtime_get_noresume(dev);
+
 	return status;
 
 out_error_irq_alloc:
@@ -1495,6 +1498,13 @@ void pxa2xx_spi_remove(struct device *dev)
 
 	spi_unregister_controller(drv_data->controller);
 
+	/* Release the PM reference held in probe for LPSS PIO mode before
+	 * hardware teardown so the PM core does not invoke runtime_suspend
+	 * on already-unclocked hardware.
+	 */
+	if (is_lpss_ssp(drv_data) && !drv_data->controller_info->enable_dma)
+		pm_runtime_put_noidle(dev);
+
 	/* Disable SSP interrupt generation on hardware level while clock is active */
 	pxa2xx_spi_off(drv_data);
 
-- 
2.39.5


