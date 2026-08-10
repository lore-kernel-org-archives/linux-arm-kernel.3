Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CB7C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgq4ngVWmvwH/7fZSBUdZHTs+zKxzmXCAvxr+GPkjcI=; b=v3a0ou5+jGTRFoYI0RGhUF+Zl3
	4zUYJ7kHQtxqtdEcWYqGGTuZ6/oQtJIFYf7nmuNLu08usGSFGuROR0dUj9dyjb+mBTA6UC0v04ma1
	tmY6QMQLr7Vjt9adXXaGT5vQWpuXHxxTfJQHUVYUgjRXV9HjTZNevWwr5bfYBR9Ob2IdYDgQEOCnf
	irXMnOEYuiizLjTOPu8Jc8g6xnPZ4N6Gej3CdVOQb0BTxEZRSFHEcCaJjj9/r3ytHsxKFhqktBy1n
	o5GdY5Xec2qVO2WClZJXqmvU99sIKjUiCOZCQ6rRB76UPhfUnDYVCHObbGXuypXdzDaZzIZ3nObqT
	NVWmcYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMMJ-0000000BPMK-2mfk;
	Mon, 10 Aug 2026 09:31:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMMF-0000000BPKS-0WE2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 09:31:48 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84e04df8c46so1535005b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786354306; x=1786959106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgq4ngVWmvwH/7fZSBUdZHTs+zKxzmXCAvxr+GPkjcI=;
        b=F1Xp8wpZQuc2ReWSEXDcog4lGBbRGVaiLBd2Spi1S5Iv3LxzNjoF2ARnkCGC+ay213
         jClH+RHaodJBx3Iy3Uh7axYQGP2cV55ZkJuorVMVot4w3VWCjd4IeJquMFg1PCBLiuE5
         oZdnw5Pb72P9bqJhcM4F1aZFSO+PtB3Q/JoFsKTbV36k4ZNFEGuuALzAbbFNB1KorcmW
         YGeNWb0k2XVF2InJdjM+ARQKCpAkmBaFuAZIjun1UCYNZYbJZNlMKiAheAHgTdk5BY0d
         6OBN7X5TvHTVIixSQu9ZptbiroK8AnVMX981sQY7xI25ltz8G0PV16LJDk4f3Ps1VOkm
         pPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354306; x=1786959106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cgq4ngVWmvwH/7fZSBUdZHTs+zKxzmXCAvxr+GPkjcI=;
        b=QeqCwUGX37g2zwGZ8v0cxk3yI8BlsPJNRYTKiJaz+w1qLefE9WMc+ZzmrINhIsER4u
         EOMJvdJy2LCzEK978s1xW/TjZIIBmcPLiq94kc4CAFI22sj2+eFN+frpx+Evfxv8KCMH
         d7Js7qMjGndnOy2ZEw5e6smOAv4v5UgnC+YDxjihXgRL/AwObb3hDaS7jA6gurdgdlHH
         rjL1snKpvCL6mXwYhV9ChqsuROzIhMJscIDS5b0bF63zt6m4U+mZd81Ptwfne9JB8j16
         In/c9wF0Qyn80yOLZCaRMcQfOUfiDtjcI5CVgSyK4nOgIJKKNg3UPhu7f+171RV/5XtL
         LBFw==
X-Forwarded-Encrypted: i=1; AHgh+RrD/cjEhS9bIo/skCV+pCBcFfUT9O05TS9Ca7rw2JyysTPp2piKoBNEhDWZnsxWh9XbKL8a6Al4wc9pBRtdgk+4@lists.infradead.org
X-Gm-Message-State: AOJu0YxU3QrmQXyNRip3fjUJ6VypoQaqTsbJAw7z8ayjk8C+adZIyMgr
	Ne4IURJUMvDCv9Grk7hZOg3gS+eMcmxc0iKU0JCXrb5BfAWZfm2WFYt1
X-Gm-Gg: AR+sD106OOlSrUemrUFRHADRP+KSEKJmLsmMjQr5EUcu8xZgTWAhol7zqjBRaMNKaUx
	MzeLG12DwO12kvQU8vfsiDzw8r9CYfAJGIrvPaNDvCIYfvzxo4PPzuDpcMFEsdEY0x3RgAJS50S
	Ar0/2VCcomYf/OXMHygiNG91qFrs2WxG+2uk4IFPNleaQ0oFD/1QQD3N4zV47eif8xjtKnbXAhc
	PrQEhb5kWWO8I9GT70IzRN9DmOl7KramUeHlJAJmKYBtbrJg9a7unQrseZomjsFRMD5ywtgsdy/
	2rj5DpkfcAobDxZxrJgYGD9PYN0MkHr8++zUwWJZIGb0tN2RJ31+MVqHnVYdb8tiWwzyaFaOBhP
	WKNrwtzOxfYWsN00z2JQ5wrXNTcL8IuT9ShyaGMvxShUKE8ukW3mjC6VbAQDkvDqK6XWkEXLk5C
	BMYSZR0gaf+T/QNmFT0zzxARgSnTbQZTCvW9gVsZVNdyyXuk0a9WCLlbkbZxvuveQEVt7IUxJbU
	1qNraKv51slq1cVgXpvJrRWJKrR2bRNcFYMIsdCn0s6aNLtrEBld9xZpEYeEhVSrq0YeMoUbXJd
	OsQp
X-Received: by 2002:a05:6a00:3c81:b0:848:50a5:a70b with SMTP id d2e1a72fcca58-84f5e068579mr22565587b3a.21.1786354306343;
        Mon, 10 Aug 2026 02:31:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3fe7d6sm3592046b3a.26.2026.08.10.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:31:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Mon, 10 Aug 2026 16:31:12 +0700
Message-ID: <20260810093112.47807-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810093112.47807-1-phucduc.bui@gmail.com>
References: <20260810093112.47807-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_023147_167839_07616AE8 
X-CRM114-Status: GOOD (  14.07  )
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

devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
was logged with dev_err_probe(), but its return value was ignored and
probe could continue with a successful return value.

Store the error returned by dev_err_probe() in ret and jump to the error
path to propagate the failure.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2: 
https://lore.kernel.org/all/20260807065619.30604-2-phucduc.bui@gmail.com/
Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by 
   Sashiko's review. 
 - Add Peter Chen's Acked-by tag.
 - Add Frank Li's Reviewed-by tag.

 drivers/usb/chipidea/ci_hdrc_imx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 9e529398c607..edbf9df9b8f2 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -532,8 +532,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
-			goto err_clk;
+			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+			goto phy_shutdown;
 		}
 
 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
@@ -541,7 +541,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 						IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						irq_name, data);
 		if (ret)
-			goto err_clk;
+			goto phy_shutdown;
 	}
 
 	ret = imx_usbmisc_init(data->usbmisc_data);
-- 
2.43.0


