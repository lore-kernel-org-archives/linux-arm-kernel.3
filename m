Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D582BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDCevJO/jn4uxha5g3iGQ0Gi4sz+BoDakhPsr84awrg=; b=AnQRRRhCXjaRlqiPy0YInaoHoW
	r0qcZPz9NK9+ZBTOzxXj4Ymqh8CxhFnxqug6DrBvU2Xm+f4LHmYh2IMfRQbs1CdUO4YQio0Dq669T
	y1l2UMhMguZda2lGaYtVRGa0Spj3/GGVZBWV1ZIzUoFO6mz98Q5VmBkLGuQyIi0d+YVLkvkx4fkHC
	s6jKv0fvFHQ4WfZke+tAZgxlY53zThwcdGLZTfbflcMtwyQRVOrt8wLFF1FlAJakZUzFCT3p1zGmY
	17cIOzZIh6qtei+kRCZ3JAQaxuvzNwuSyJ+fBzV7qv/GDNQCi5w8gEIZ7VqAlY9KIcFcvjSzkRoCz
	UGddsfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ8T-0000000DTdm-3IjK;
	Mon, 27 Oct 2025 09:03:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ8Q-0000000DTcg-3seJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:03:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-269639879c3so38294385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761555806; x=1762160606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDCevJO/jn4uxha5g3iGQ0Gi4sz+BoDakhPsr84awrg=;
        b=nEqIvPwX8Y+fz1KyIw9dQ84DrVj1vshjWRgxOrE+7nFhJCxKKj/BqZ4PkZ8LaJNNRJ
         dUallhNZrs4SIZsDXo88Gme3sCBXaRyEtPRiL6yoCOCmZJHbKWvHASk8/Ld6Bt9jJUdS
         rxkLqybK3rLoQk2rJjKHFIBVTXNPW2VC0zA6YRAD5wf1gJ7SZBaSlmX8Hc4/eASYqyAU
         GjwcpUadrSOhavtHTBGz4lMsdCjUifhdv1FGifNevLRMtD+0AZxG+IZsbvg/rQbzz6lW
         CKCDeiuU3GmMYBVvC9a7C2Y/ittlTt7ff/PfuK30UuTfg/2DSxxG83N2X0S3LiDqkI8I
         5t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761555806; x=1762160606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDCevJO/jn4uxha5g3iGQ0Gi4sz+BoDakhPsr84awrg=;
        b=l5jRyxXoq4HKiQimT6sW/rcUcij9UCNjvO194L/HEtWJVirqa15N9RASFSaqnZg5iH
         B8LNuH9J3wogjsylyIPg8AkHlQHGBva7MNVLzTWft131CUOiWlO+RVaTkFOtHjfp8pfk
         nZcqT3W02CEfJp+oR+/0kYORz8w4x/mEjEi+9viR6/EWzLVOEkpE6QozW9z18DUuj4jr
         3pU8zWYkNk9TfyiSqGjyyvOSZ2o99BG/toqC8UcDKHe2XY9/IvtwLlf1BKHbsdoWHmlq
         xceevbIycHTeJUeAPd07qpkfXJ1ysmvUjVGeugOmM9d4hnfFg9CGm1BBaJtEu5Xj2zub
         PyQg==
X-Forwarded-Encrypted: i=1; AJvYcCVG0e2Ja0g3HXTXgICSSB1070pWRSHI79lF1mL70CL1ImYsTq0XcX2EPmjp25kqbQgbDLrr+SlzLPQnjB3w6vJB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9UZTbh/p1l9R3SQ8Q7mISIVCTmV792nZaaJCZLcmCgrfMUcLG
	o1DMsO6HaWgQuvsoIyTd8VhRADGi0TLwDw8+EUW1O8FdtutJyXCPb4ww
X-Gm-Gg: ASbGncv2GbstmVeT4eYQE2LRQ8XozZ16jUNn9rlvZlsbq8lwjfLqNWNIxfI9UIr+Xxp
	LG2Y7yIP6/kokyyFsJ5WVc1DuPp+OIQIajzw7zfNDTNeVNQ5WdF8pA0l9KOAjmpqtTgnSmJjtxb
	lDYweasfTw5hHH1vX0Pj2Wu3H4KMe8WwPmUtL31mim+qaSNW2q9Ec9Uo1WCBrSakFKIxCka6qra
	HNkbT0vN5ax9Sbtd5uSP2RUvE1uRdMbj4g4NEC/Wg1dNpl11hF2BJwOjf3TgyrE320FPTmmSZbt
	Ya7WdKU2lDkdXUjpyOFgILPoKFgj0p0HviX5xvS6QWFmA+9h1Ob+WNHd1j8Kt58JYCt7Z6AMl22
	M/KPahW4Cgi61sItN7ZYkNrmGONIsQfPOj4IxwG8LG8xyjxn6qlPsaVPamRJEJJ9CunIcZTDwCb
	EBFJJ0vFZDZkNtILP6bRk=
X-Google-Smtp-Source: AGHT+IHmIUD2h1GuwjjhJJdGb/O47J3PxX86EGpWbLGZgnTd2IndPXIXzCHY76GqEBfYMKQNDQz7ww==
X-Received: by 2002:a17:902:e84b:b0:290:c0ed:de42 with SMTP id d9443c01a7336-290caf8582emr559508755ad.36.1761555806053;
        Mon, 27 Oct 2025 02:03:26 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3433sm73881335ad.21.2025.10.27.02.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:03:25 -0700 (PDT)
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
Subject: [PATCH v3 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
Date: Mon, 27 Oct 2025 14:33:05 +0530
Message-ID: <20251027090310.38999-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027090310.38999-1-linux.amoon@gmail.com>
References: <20251027090310.38999-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_020326_968249_7627BB50 
X-CRM114-Status: GOOD (  17.19  )
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

Use devm_clk_get_optional_enabled() helper instead of calling
devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
the clk_prepare_enable() and clk_disable_unprepare() with proper error
handling and makes the code more compact.
The result of devm_clk_get_optional_enabled() is now assigned directly
to pcie->refclk. This removes a superfluous local clk variable,
improving code readability and compactness. The functionality
remains unchanged, but the code is now more streamlined.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: Clock needs to be disabled on Suspend and enabled on Resume.
v2: Rephase the commit message and use proper error pointer
    PTR_ERR(pcie->refclk) to return error.
v1: Drop explicit clk_disable_unprepare as it handled by
    devm_clk_get_optional_enabled, Since devm_clk_get_optional_enabled
    internally manages clk_prepare_enable and clk_disable_unprepare
    as part of its lifecycle, the explicit call to clk_disable_unprepare
    is redundant and can be safely removed.
---
 drivers/pci/controller/cadence/pci-j721e.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..a88b2e52fd78 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -479,7 +479,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	struct cdns_pcie_ep *ep = NULL;
 	struct gpio_desc *gpiod;
 	void __iomem *base;
-	struct clk *clk;
 	u32 num_lanes;
 	u32 mode;
 	int ret;
@@ -603,19 +602,13 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 			goto err_get_sync;
 		}
 
-		clk = devm_clk_get_optional(dev, "pcie_refclk");
-		if (IS_ERR(clk)) {
-			ret = dev_err_probe(dev, PTR_ERR(clk), "failed to get pcie_refclk\n");
+		pcie->refclk = devm_clk_get_optional_enabled(dev, "pcie_refclk");
+		if (IS_ERR(pcie->refclk)) {
+			ret = dev_err_probe(dev, PTR_ERR(pcie->refclk),
+					    "failed to enable pcie_refclk\n");
 			goto err_pcie_setup;
 		}
 
-		ret = clk_prepare_enable(clk);
-		if (ret) {
-			dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
-			goto err_pcie_setup;
-		}
-		pcie->refclk = clk;
-
 		/*
 		 * Section 2.2 of the PCI Express Card Electromechanical
 		 * Specification (Revision 5.1) mandates that the deassertion
@@ -629,10 +622,8 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		}
 
 		ret = cdns_pcie_host_setup(rc);
-		if (ret < 0) {
-			clk_disable_unprepare(pcie->refclk);
+		if (ret < 0)
 			goto err_pcie_setup;
-		}
 
 		break;
 	case PCI_MODE_EP:
@@ -679,7 +670,6 @@ static void j721e_pcie_remove(struct platform_device *pdev)
 
 	gpiod_set_value_cansleep(pcie->reset_gpio, 0);
 
-	clk_disable_unprepare(pcie->refclk);
 	cdns_pcie_disable_phy(cdns_pcie);
 	j721e_pcie_disable_link_irq(pcie);
 	pm_runtime_put(dev);
-- 
2.50.1


