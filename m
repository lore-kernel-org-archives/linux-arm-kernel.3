Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8250FFEC0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MPILU45gcDsKK8jp+8jqoirIZBgcXX7ZY0CuqSl9cY=; b=xICbTuOazmGC9IApWUEOlU8HEM
	IfugWX69kio77WkWROQbbnybRtG6xKiOh1pKxLKDmHCAxA/09Z89QVzlAd+3SElJgXrtKBfujX/lo
	D7AsO5GFkKzfBi/iJu/fKJ9pt6ivtt4WISH8I6FqRumKKkd2YmH7nFGQIUN51NDDdPC/N+j+1kd4/
	C1g3Bgjfy93NN1uB1Hf/JiaZuaNugeMrmU4aATbiUbJUpWhhw/B1zdLb2FdiWVNcu5Oxv1BuD9011
	cmbPPBypH1dg+Kiz6/TqAC9IeeWIXFnH4swGNeqF3Z98TsPtI7usRNBBVHc00qDMBMrTHa8iSXSwt
	goLZEjfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Uw-000000024p0-2SlV;
	Tue, 24 Mar 2026 18:29:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Ur-000000024md-3ktw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:28:59 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso2429547a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376937; x=1774981737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MPILU45gcDsKK8jp+8jqoirIZBgcXX7ZY0CuqSl9cY=;
        b=EVDpq3B5DYAa8nnDs1fMHX5FSN8XoXWny199is/kbb6BKzQB3TveAdjSB3SqIc6kMh
         A3GMzyYrStDe0DUSuVJGBWbroOSy1UYlZaUlKCxJ3xKL3abo+DhiPfWdd8cqy6F/JOsw
         x6htXlfPmoOa7auEKwKxe/OSWItzlQJ/Ji+Ihqrz2IwQNf9sGEMqkvxZkW3TWv9KAXHO
         CtTUb4lvXgEqt9H41a3UbRyYmtcECgYFN1llJFLqoCmYRNZ8h3xNfbURhYQRNmTuLxaR
         1JSbH0L+ZnXvfW/m17ub+xbRIbEKGNAG25NPixkI89mlXmXxF06u3Pqov7gj4ZbgRpmS
         e83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376937; x=1774981737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2MPILU45gcDsKK8jp+8jqoirIZBgcXX7ZY0CuqSl9cY=;
        b=n+k+qifsYSbpG+DrPfbxBbCVs0QkZ+MtD7+Ku7bbVJLhWofPo2AwmgIKa4RStnq4z3
         q0DM1mp8SEWYb8MIDEdndYPcViZmyGw+bU6ZhY2QKnywm1+JYFhCX0JnwrJuMQNdZD7l
         DZXXhq7FA6LWVB66Kmrlqdt8LYCsqpdBBmfPkoms7x8tKZMTmWP8aqhmlg5c531/+mAC
         DmUKMmIrLNwoSvBpH9y+/mm9Cs3st5CRL8V4iNJWJ51c0gL9g6YFTr+hARC9uQs+y1Wd
         u6EGqgI24geqDpkOaH/RzYGgf24HmwgDwrhkunBXlZXOkEbPwr3Mrnm3w4Te4I0Ssiye
         gDMw==
X-Forwarded-Encrypted: i=1; AJvYcCUvxDwtnPhaBX6ggnBFEk+35hZ5SqiUnAbyB9eYre0qIp2ByDiDrFLPqzABSxUgN04XaqjEfTI/ANLNRvbZqa7S@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Q8ZPUTeinh+9giTL5H8OAfhl77kun99fw8v+E5AbTp0FP7m1
	ObkMkRKQnAseqBN20ht11DVvLXn/C5gYBfnlX4uFHNd6RgJFoOt6pGsP
X-Gm-Gg: ATEYQzz5DUPOaFtfgg0IAaF+ePQAT08p43fetc51dcljXWuuqvKeXMz3w6hb5wWXt1t
	PDB7t8UK73rwISePeHPelwkBJfhfRjBigpYMeZYzPHaxWjUYBv/7y6DLuJY+elF8tDE/tz6gg0y
	zB3Q4UeAABhBHbziKpDwk2dUnJEGyu1bFZ1UBhxXy7tJYLaFxHlElu1r5LrAD0G8FFWlA9+IX21
	ZNU8InW2Lpd9BZ2J1p1isI3fbBbauDzJ0T+TPh9ZLgtVhoGmDN1QhOTIMJFXT92Xw0rxBMEzW4S
	N/BlSwtoKjT83skbOPXUUhEmWvly6EStKEpO+qjRm9WVn6hr/0RJhPpcLglLSEcLJXhDnALMOte
	nCzz2DsmA7J9A4hBR74gDacBJ9fWI3wbc9vyjx/gJVvW1RxkmqZ8QUiQmk+ElrfXbvRna1S5hXt
	ERcuNp1KG/ZLW1sbeSMUJOYUjAxg==
X-Received: by 2002:a17:90b:3dc4:b0:35b:929f:7e8f with SMTP id 98e67ed59e1d1-35c0dd1000bmr297824a91.13.1774376937217;
        Tue, 24 Mar 2026 11:28:57 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:56 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:58 +0530
Subject: [PATCH 10/10] i2c: sis630: Replace dev_err() with dev_err_probe()
 in probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-10-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2804;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=nhsfDSLdFe3nGX23EexwATKRFgvnwZsN/uRkVIgsfDc=;
 b=MfTL2nua2/UaTOkuHox/mofQ9uGkaQFwD4ef2QTeyEIJWKrK1affTlrqYL2fD+dQbiqZ2kQf1
 368O9MeLyraCsNY7XiqbLSbdhihgwtkeZhLhsjgkAnvnbcpMTIg+zrj
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112857_957078_CC77C036 
X-CRM114-Status: GOOD (  12.73  )
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

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sis630.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index a19c3d251804..3d0638c2bc51 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -431,24 +431,23 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	   in acpi io space and read acpi base addr
 	*/
 	if (pci_read_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, &b)) {
-		dev_err(&sis630_dev->dev, "Error: Can't read bios ctl reg\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't read bios ctl reg\n");
 		goto exit;
 	}
 	/* if ACPI already enabled , do nothing */
 	if (!(b & 0x80) &&
 	    pci_write_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, b | 0x80)) {
-		dev_err(&sis630_dev->dev, "Error: Can't enable ACPI\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't enable ACPI\n");
 		goto exit;
 	}
 
 	/* Determine the ACPI base address */
 	if (pci_read_config_word(sis630_dev,
 				 SIS630_ACPI_BASE_REG, &acpi_base)) {
-		dev_err(&sis630_dev->dev,
-			"Error: Can't determine ACPI base address\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't determine ACPI base address\n");
 		goto exit;
 	}
 
@@ -469,11 +468,10 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(smbus_base + SMB_STS, SIS630_SMB_IOREGION,
 			    sis630_driver.name)) {
-		dev_err(&sis630_dev->dev,
-			"I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
-			smbus_base + SMB_STS,
-			smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
-		retval = -EBUSY;
+		retval = dev_err_probe(&sis630_dev->dev, -EBUSY,
+				       "I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
+				       smbus_base + SMB_STS,
+				       smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
 		goto exit;
 	}
 
@@ -511,12 +509,9 @@ static int sis630_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int ret;
 
-	if (sis630_setup(dev)) {
-		dev_err(&dev->dev,
-			"SIS630 compatible bus not detected, "
-			"module not inserted.\n");
-		return -ENODEV;
-	}
+	if (sis630_setup(dev))
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Compatible bus not detected, module not inserted.\n");
 
 	/* set up the sysfs linkage to our parent device */
 	sis630_adapter.dev.parent = &dev->dev;

-- 
2.43.0


