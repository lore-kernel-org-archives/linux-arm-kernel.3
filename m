Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B850CE8E7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hQSm1B/bBPEQI6fCzkx9lfLG7DkGTIpXzv4hP+8MIq4=; b=nZ2LqD41jL2FvOyopN/d2D/BZQ
	9pMgEiomI21r7mXQuQeRgFsOjdum6+DFRyj1ZOKWPEGrzrOKo+KSUZzQWAmKlWbCfxQ/XDqpFw5sd
	hXpwCC0Buj8NZjjyWOD7zPSujTiQIqCDSZKKuiAxtb4fVTvXfM6NF2cGn9cM1IOs7TAwlN48UdVoP
	D+IDsyM6/WOhEFad2Nw1EJzh5KzxlsPFtSSuQlaKtF4iiOlnpyPYnrz/po7Ti0Cxht9m5dZHhinwJ
	LAN9UNXREN48yNmDOTvX/TfoV+UOgXiPLtIpdUmAEjkIoQAYDVHCjfr14sJO5oR1gGNfEwHulDCMR
	7OZLNjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yWe-00000000doj-13Gl;
	Thu, 24 Oct 2024 14:09:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yTr-00000000ceW-0eoo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729778784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hQSm1B/bBPEQI6fCzkx9lfLG7DkGTIpXzv4hP+8MIq4=;
	b=dvLaXhDFAQRxD9soh+Sd8QnFzS5nr9WoPJbUtfRZuTMQwjMhb3QgUiU/SiC6r7sjqcrSET
	+Q7gqbJk8YCWX+dNfy3UGOqdb/VwxWIvo/uedQf++pAmthNcvKZXVwT8+APJbTpSz4667V
	qZbZC6beVeAzbJHPA7EG/KsIK0C+/QE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-cDqhJza3MaSsBUhzf1egmA-1; Thu, 24 Oct 2024 10:04:48 -0400
X-MC-Unique: cDqhJza3MaSsBUhzf1egmA-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2fb53ef3524so6458461fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729778687; x=1730383487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQSm1B/bBPEQI6fCzkx9lfLG7DkGTIpXzv4hP+8MIq4=;
        b=ctQpvcfWlHvJgiDueyB/6kx3il4x/daOsHAt5CUzn2hbpJtr4hZk5jKX5JCw7snXK0
         t/y8fooUUdjUzSuvuA8xCAz8GjvrXZtw/CJkI1uec6D4QCXrZIatFbjCjD0y5ZHzVmA+
         BcaCfEo9xQ+Y20f4S/lmuJa7m0Tr5Rc18Zzrwszz+yVVQuwJ5kGGtXOLPSlHStcHqmu0
         ULPKq/auOtHVZYQ05yYf4a4+qB0Two9ffIG5qko8REuC46Qi0ZTHa5VW0E1MMp94SRRL
         8RIFIM9wLY9/F7SNldrNJoghhCAh7lp+7ZwOOgDYHrWlYksjsci8eM9B+tmvTwfjt9+7
         /pIw==
X-Forwarded-Encrypted: i=1; AJvYcCWQQJD1k+gAjHyipXjHDgvXGr4eiaj5FZom4ZwXwQa5XX6ukDjhOUv3YViyn2/6AnJHOuurefno1trMCzsODi3q@lists.infradead.org
X-Gm-Message-State: AOJu0YwIW1Sk9ZZQ52ozeL2i+dtiQ3XLUr/IykwVYLJ40f0MPyewVZtd
	lmUYVKTo/bgdSgdh6i4BsTR1usno13WkONYWM0Pnpjm9YouzU1CyqYUxhiPIRtoW4zxDIoHb12F
	wfnGNAlIWuHbXCCvdh8p8ATFVL7FAkAZQMpINonjzkllTsPtn+Zef7Jr29q59vxWC8Anz71Di
X-Received: by 2002:a05:6512:114b:b0:539:f9b9:e6d2 with SMTP id 2adb3069b0e04-53b23e33c6amr1060381e87.35.1729778686857;
        Thu, 24 Oct 2024 07:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK+Aa3uTsskL25IZrDrkMj9fVpwcg2FaoD/X/Iae1N1I2ol9nC/eMbTbhx8ycQe9G8SPKiMA==
X-Received: by 2002:a05:6512:114b:b0:539:f9b9:e6d2 with SMTP id 2adb3069b0e04-53b23e33c6amr1060343e87.35.1729778686258;
        Thu, 24 Oct 2024 07:04:46 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bde267sm46655925e9.13.2024.10.24.07.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:04:45 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Mark Brown <broonie@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] spi: Replace deprecated PCI functions
Date: Thu, 24 Oct 2024 16:04:27 +0200
Message-ID: <20241024140426.157444-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_070627_275405_2F86883B 
X-CRM114-Status: GOOD (  12.35  )
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

pcim_iomap_table() and pcim_request_regions() have been deprecated in
commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
pcim_iomap_regions_request_all()").

Replace these functions with pcim_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/spi/spi-dw-pci.c       | 9 ++++-----
 drivers/spi/spi-loongson-pci.c | 5 ++---
 drivers/spi/spi-pxa2xx-pci.c   | 8 +++-----
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-dw-pci.c b/drivers/spi/spi-dw-pci.c
index 7c8279d13f31..6b8cc26e06f8 100644
--- a/drivers/spi/spi-dw-pci.c
+++ b/drivers/spi/spi-dw-pci.c
@@ -98,15 +98,14 @@ static int dw_spi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *en
 	dws->paddr = pci_resource_start(pdev, pci_bar);
 	pci_set_master(pdev);
 
-	ret = pcim_iomap_regions(pdev, 1 << pci_bar, pci_name(pdev));
-	if (ret)
-		return ret;
-
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (ret < 0)
 		return ret;
 
-	dws->regs = pcim_iomap_table(pdev)[pci_bar];
+	dws->regs = pcim_iomap_region(pdev, pci_bar, pci_name(pdev));
+	if (IS_ERR(dws->regs))
+		return PTR_ERR(dws->regs);
+
 	dws->irq = pci_irq_vector(pdev, 0);
 
 	/*
diff --git a/drivers/spi/spi-loongson-pci.c b/drivers/spi/spi-loongson-pci.c
index 134cda0c13a5..892cf1eba1cf 100644
--- a/drivers/spi/spi-loongson-pci.c
+++ b/drivers/spi/spi-loongson-pci.c
@@ -19,12 +19,11 @@ static int loongson_spi_pci_register(struct pci_dev *pdev,
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot enable pci device\n");
 
-	ret = pcim_iomap_regions(pdev, BIT(pci_bar), pci_name(pdev));
+	reg_base = pcim_iomap_region(pdev, pci_bar, pci_name(pdev));
+	ret = PTR_ERR_OR_ZERO(reg_base);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request and remap memory\n");
 
-	reg_base = pcim_iomap_table(pdev)[pci_bar];
-
 	ret = loongson_spi_init_controller(dev, reg_base);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to initialize controller\n");
diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index cc8dcf782399..e51c1b492283 100644
--- a/drivers/spi/spi-pxa2xx-pci.c
+++ b/drivers/spi/spi-pxa2xx-pci.c
@@ -273,10 +273,6 @@ static int pxa2xx_spi_pci_probe(struct pci_dev *dev,
 	if (ret)
 		return ret;
 
-	ret = pcim_iomap_regions(dev, 1 << 0, "PXA2xx SPI");
-	if (ret)
-		return ret;
-
 	pdata = devm_kzalloc(&dev->dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
@@ -284,7 +280,9 @@ static int pxa2xx_spi_pci_probe(struct pci_dev *dev,
 	ssp = &pdata->ssp;
 	ssp->dev = &dev->dev;
 	ssp->phys_base = pci_resource_start(dev, 0);
-	ssp->mmio_base = pcim_iomap_table(dev)[0];
+	ssp->mmio_base = pcim_iomap_region(dev, 0, "PXA2xx SPI");
+	if (IS_ERR(ssp->mmio_base))
+		return PTR_ERR(ssp->mmio_base);
 
 	info = (struct pxa_spi_info *)ent->driver_data;
 	ret = info->setup(dev, pdata);
-- 
2.47.0


