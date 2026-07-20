Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7506C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pc9Q17L9G9Tp/hTZeKzZ+mFFZkDIc4OrDplBBsBLoik=; b=1UZdLP1e4MKmZBq57kW8GkcKGJ
	rJdNptXqb+Jdz8tTHdkh8NRXS6kds3JqIJsqFkEfJXM05w1FotqwxGfwaNl6Zw9TMhVJtYEoSlx46
	hTrfFqdcELZWx5SnyifwM+R8E516JIFGJECp30YrHs+ugoPawA6/sDHKRx0KEz3nHzqYRAmRgW+a4
	ekJH8jpagERah2reB3OnC/rXSQTMMDbmTuIji8ydfEvIOdhLlsDcSEXgYVQQEiVnGRjz2FJKjmo+g
	ZaQhsHPosfBPwYpy8EnMqQUXVjoPny8eG2HVbq1X8AJo7cPyVSTiMjm9x9L5UukpB1kqSVkGTiAn3
	UbISnpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQc-00000006Vpc-0eFE;
	Mon, 20 Jul 2026 10:40:54 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQS-00000006Vk9-2VRl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:40:47 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so58441795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544044; x=1785148844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pc9Q17L9G9Tp/hTZeKzZ+mFFZkDIc4OrDplBBsBLoik=;
        b=mV8fnYqB78iBBDHxNdTrTmMpvJmkg1EKAFEhjy9tqTWubT+JMmlMP9dV3NgZkFH6F7
         dGdPS4vTFl59TOM4iVPepDwA6m8cwp2lfQDXUH+1tct1ubC65yUK/LJ+id4xDVVc8oNr
         j/p5XAxYbgJpXBRIHzsH2M6kOefcUFNoWHYWZ1bBjbjbDQ2bh1UFFUVktn9d6Cv1xS0E
         K8SUmBqnp00qR5v92Cd0h1GvYOjHW4e7lV0YnKCOedfGtw89d/w79e8tQgQkrowcF6WJ
         peNUMOCfPjrF4HXTdjbzb3nraTk/cZYy8ZmXl2Uhcbv/5w48Rg7/Crw8abYV4s6h73ci
         b89g==
X-Forwarded-Encrypted: i=1; AHgh+RpQQdwmrZJ0bTj+qRfbl6aj2gGrphH+vNbU1l5ki9Zn4LGTBOjbYmmEwL5yPNZtwNdzgjAmuygvm7L6upYRsPy3@lists.infradead.org
X-Gm-Message-State: AOJu0YxPGkiBdW/aAQoLTI8nt4H6IXocJ0zParowah/8MY7VHLlugCGM
	WsHy1ETdgmz02twdXVo1aIgbjz48qeyN+DFexms9NnrzqDqA7LeB4bY=
X-Gm-Gg: AfdE7ckKINooglu9vMohJH75VKjmphYien7T9x2A450KMFxHJ9+Lm11e0EBZSpC/tSG
	CV/+douAKDee1+uoPFDfoP1KkHDeeEAVgsAtHGahQXLjjHA9Dr6p4SVd1kGjynr30eunJ6w43VT
	iGBRoyE1fBIIwxTrhPipQxGBSgiMEZs2PDiEVmXxJwiHpX1+f5iomPMH/VtMDvAHiX8avnMWFV4
	W+tiZKV6E/WfcTmpPKHOCDSiv2n7ukZcWjXJDPB6F13PM2fN3y+z+4KBrNH4UmlKirDyDEXt1CU
	/b/tW1pcul0EDP2YuzLL1m22LosllgazBrCAljlS293xp0p9rMJsrGSkFw4eF9+zjOwITSa7kLl
	Ll7NG265q/6hHMnDC8V4xMoPZJnU2wL2h9Y6Yo6UhwAXuwUb5kc5Hagr+1wGVJ19NAt3ag1DPIs
	Sva/XV30bGsS7iSmfroLTKhVKOXIr9JCIguvQ7FipEmJSNkEJhfZLKy06cNGVb+/rnp3Hf2Q6k6
	JgBVynlWE/yXbTPbkKgYF4K2bGp
X-Received: by 2002:a17:903:3c46:b0:2c9:97a8:afef with SMTP id d9443c01a7336-2cf349f4a51mr134654595ad.40.1784544043870;
        Mon, 20 Jul 2026 03:40:43 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f61ffsm54900325ad.33.2026.07.20.03.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:40:43 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v15 4/7] spi: pxa2xx: lock out runtime autosuspend for Intel LPSS SPI in PIO mode
Date: Mon, 20 Jul 2026 18:40:26 +0800
Message-Id: <20260720104029.13740-5-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720104029.13740-1-fourdollars@debian.org>
References: <20260720104029.13740-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_034046_121276_59E26E0E 
X-CRM114-Status: GOOD (  11.11  )
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
pm_runtime_put_sync() in pxa2xx_spi_remove() to ensure the runtime PM state
machine transitions to RPM_SUSPENDED upon driver unbind, preventing active
child count leaks on the parent LPSS power domain.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 64b5ec744756..88ed28096b07 100644
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
@@ -1513,6 +1516,8 @@ void pxa2xx_spi_remove(struct device *dev)
 	/* Release DMA */
 	if (drv_data->controller_info->enable_dma)
 		pxa2xx_spi_dma_release(drv_data);
+	else if (is_lpss_ssp(drv_data))
+		pm_runtime_put_sync(dev);
 }
 EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_remove, "SPI_PXA2xx");
 
-- 
2.39.5


