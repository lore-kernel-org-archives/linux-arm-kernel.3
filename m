Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8936CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 07:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAWi08Lab8Pg0FL7IYkK8ydZGRVaUiT7SC194s0JYPE=; b=160ZQ/9ZMyERWWD+JNId5tySX/
	zkDo5bNMcU9Sn2I71J92HveVC6M01ORJ5tDtKFM6N++Cm0HlwNGOmO4LTVT69Ykv6Ziz6NlGhbw+q
	IToCmh1j7UiIHceO/i2dONe9Q4wB0gsWhC3D3jBCJACWOzhN1NDz1AskvMcyRjuDPtobY9C91ZdAi
	Wp93O67OBWMRXDQbC+BY9ESrceJO/xykW4YFhzNRKFXh8Iwx/cfX+3gO0HLjupzBy7ZWgleNNMvXa
	n8Fvk1RJw3sBhqMY4SjpYaZvkblXF8jx3CFuZvqCtR6NybFlZoNpkgFdIr/KS4voXYJd0Z3K/hEhr
	E5jgJiJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYwV-0000000B5QI-3UFE;
	Sat, 25 Oct 2025 07:44:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYwS-0000000B5Os-0wIF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 07:44:02 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a2852819a8so1479578b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761378239; x=1761983039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAWi08Lab8Pg0FL7IYkK8ydZGRVaUiT7SC194s0JYPE=;
        b=V7vZ/4Ia43mC37K+NlAdM5HaBpzOGdmn2sEudYDlr2puuM2efULIr6EDfnPgFWJpnT
         NBtYaMUFJ6wnGhmlzMzZvmSYzzmtVDQ4xHgyy3sblh0ah6FLZTFhZiVZqlTL2kNlKrj7
         qMyID1J/jm7ZVYxN+9eR3R6BGmQ81meoGF4aN8FVJ2cvcAQSRIldDdFLnRih/kzRuUsq
         Ql20NamhjJOu/rhiPk1I4EXAGpp+Fs2xpM0p1XsBKSEAmSihPRzrdKN1vj8U5SYnBJUg
         ZthRJrS8AY9ghoa+Ir9UMRpbAB3Nn1oZbhN/ygQSoEXjEM7qsJiPr739VIXXKJ3y6FtF
         77Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761378239; x=1761983039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAWi08Lab8Pg0FL7IYkK8ydZGRVaUiT7SC194s0JYPE=;
        b=dH3U52TxgMz1ZqUl/f5uflJgQBgILCzOB1D+ZUblq5YvSh7Y80hNnTymwVOa2qC/LR
         kkQs03OJ/oZEdPkY6DTxrTp5xYPNJFWNvORxLCIijXAa8OgK3TjN/LcCdTzYkMlrUtBf
         9yROOHEKqTMQeqWwI+JeWFh+oFtgW+3/ZWFFa1wS0u7FoaO3RMHxFJXXs6OTmwdzv6Ji
         x97fa5gJgS+Nz9ulkb5mNuuUiBvkO83kYnXp4+7bLRGnpGP387WnlLVJEIvYPzhT0jUb
         //F7qmrXnYErRo88vEbsMPWHBQSlUdQtLFC4BiNKKkY7x7PF/QvuRZ5r9MPxSXLW8jb6
         33eg==
X-Forwarded-Encrypted: i=1; AJvYcCXDbDkPhQAV3R9UiOIReLfeVZ9i0PieFS3t89863QBIhz97OR4StniaHXOMX9x9qUqUtaC0oA2sM/PWrZe6uiiB@lists.infradead.org
X-Gm-Message-State: AOJu0YxckNJCocKphB1SYffCgIefdSByO8+BjVdsYetMEIcCRI8Sa1l8
	nTctfg2EpzBMP2dJhxvs3C1Q+H+kpVNvrPKD54nJhxbzFIXNMEdx1dER
X-Gm-Gg: ASbGnculqdw98wFMqQPlg6JBsZY/62TShUHw0w22Kl+uzBCIAm18L+NAEA9cupkE9q0
	8eRwgSiVFRBCBfqavzQYP9RkOr25t7FT8TEMqbnbQEg42QSsiIDoJO1vFFMzLra8Wun7CrCgdja
	bXaWdSRlYK+a7NmxCDchkI3a0iN2vzN2lubzsDbcnmOpwAA1GQ+RY7UTFuLIem1/xolPDUog4+H
	0Er6PBNiuFaeZCtUEs6uriNQiWkywj56lI08g2XpdhIJ3rUtbpbnZ0IjcyuyE9vCX1cMKsmLj4Q
	guDzal4DsIgxJX/GDYOqaPSAVzMhGOBGHJlBkWAJPZfVDW7f0TdS7qagWN31u2lj6DRJfWNlz5+
	NDAH9f3oLloS468SBhV7kPUiVs0KeoA21xsFyhOegmp6dm/8FRCWD+ueRSNiJTuZUEKAhuMmKup
	ta2Qq6Oi6JqUe2C0+PHNw=
X-Google-Smtp-Source: AGHT+IGHRGT9hB86/YyYWO+q0YYgQ20bBMxTaREfTvNN83eWQaMSQ0mxbxIpiJAX3TL83FC5ARBuiA==
X-Received: by 2002:a05:6a20:1590:b0:334:b732:6e5c with SMTP id adf61e73a8af0-33c600a5574mr9633829637.13.1761378239355;
        Sat, 25 Oct 2025 00:43:59 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404d760sm1395083b3a.39.2025.10.25.00.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 00:43:58 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 2/2] PCI: j721e: Use inline reset GPIO assignment and drop local variable
Date: Sat, 25 Oct 2025 13:13:32 +0530
Message-ID: <20251025074336.26743-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251025074336.26743-1-linux.amoon@gmail.com>
References: <20251025074336.26743-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_004400_268274_1902D21B 
X-CRM114-Status: GOOD (  15.97  )
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

The result of devm_gpiod_get_optional() is now assigned directly
assigned to pcie->reset_gpio. This removes a superfluous local gpiod
variable, improving code readability and compactness. The functionality
remains unchanged, but the code is now more streamlined

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: fix the commit message.
v1: Add Rb - Siddharth
---
 drivers/pci/controller/cadence/pci-j721e.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index b678f7d48206..633fe8f93102 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -477,7 +477,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	struct j721e_pcie *pcie;
 	struct cdns_pcie_rc *rc = NULL;
 	struct cdns_pcie_ep *ep = NULL;
-	struct gpio_desc *gpiod;
 	void __iomem *base;
 	u32 num_lanes;
 	u32 mode;
@@ -589,12 +588,12 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 	switch (mode) {
 	case PCI_MODE_RC:
-		gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-		if (IS_ERR(gpiod)) {
-			ret = dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get reset GPIO\n");
+		pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+		if (IS_ERR(pcie->reset_gpio)) {
+			ret = dev_err_probe(dev, PTR_ERR(pcie->reset_gpio),
+					    "Failed to get reset GPIO\n");
 			goto err_get_sync;
 		}
-		pcie->reset_gpio = gpiod;
 
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
@@ -616,9 +615,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		 * This shall ensure that the power and the reference clock
 		 * are stable.
 		 */
-		if (gpiod) {
+		if (pcie->reset_gpio) {
 			msleep(PCIE_T_PVPERL_MS);
-			gpiod_set_value_cansleep(gpiod, 1);
+			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
 		}
 
 		ret = cdns_pcie_host_setup(rc);
-- 
2.50.1


