Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B5ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7VEd+Ttt8ujutNeib5W41dEQ7VwE5awjCGOWqT15+4=; b=4Bc65cyebSYFbiCTbYyVcaUNt2
	Br0z2k7lxqsywHBtZqySY1rahI78Uwy2+gAOap+Do1qo8pIiD2BNKBngacOc3fJALIcXIXjd44s18
	keN9FyKa9mDJBVwaYhAP8BPobi34CKjC8KVoZbWzQmPRnmQ0X4fIAOWtfEz/e0R0ne1C6e0CBqBW0
	O2sVUgoVrhpLElmkkPdsDfD2QZIcpLrQTUqlRoDpDxv0FOC/90wdvXj1FyDWueacnFwtIDeNaFRd7
	JlciW/U/+nyQuc8xD8Ni2PiWkSlwiUKSzQJlwTDtF+Pd0/JfVEu6bvSy/v+Y0FTipVZZPF55xffaC
	PykgD03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYwN-0000000B5NF-2Gdx;
	Sat, 25 Oct 2025 07:43:55 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYwL-0000000B5MB-0QaP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 07:43:54 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7811a02316bso2121328b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 00:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761378232; x=1761983032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7VEd+Ttt8ujutNeib5W41dEQ7VwE5awjCGOWqT15+4=;
        b=KDt0C5MKZQAftsuqJT/+dIQFnH6o54WlBn/y26nt51iFOd1xLrQ9TvPIyAIybgvspT
         fSrXp1v98pIoQsH/DTMvZLct1XqMNjRxcgTCjpl2Vg5wUV5X8iGu26B1gC1KAsoRcAhL
         ohspXFviehXlATF1t2qTNrVBD8TzNVUsJASLIS+1780GZWXlsljo648+DUrxOe9Fo1uN
         +jzdohdEaUGNQkZIkvV4dtHysbWB1AxAreU4ieEqU1WNex3q5kIImWDRIKUKqQAzTmtQ
         Qhz8PGf4KC8UK589mVHwSNtKjpyFeK9Kqb02NP9WIupCr6R4DabViVLJKLn7cJjC4+aK
         rGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761378232; x=1761983032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7VEd+Ttt8ujutNeib5W41dEQ7VwE5awjCGOWqT15+4=;
        b=CWqybEIK+gLzCt/KKkI38eiHpGKt0ozQJ4WGS8J92wZp0kQjeDjbHIevaJOlw6LbWh
         HqM30SI+tlV6R/jQCmCK+cGTQB5migxUHUq8/IqhTdR4vlmxXo/8iylvca/R86KlbWYn
         1u50bnGl4zwtJmfTnRu7c4G7dVe8yFq1DuTMJFyqwi24OrJV2OXYrWOLSMyAaSscMcA3
         bopXPQhVj+SqLbp7ftaBFtBWoTL3Z7tWEgt/1h0uNGc6hfhnOkhM1X/dtT5uN2xXmjFx
         VPicqcxvQhN/R1/L03kDZp/LI2jtN48IIpqX0Jav43As194P0zy+4lQzPyZiHxbcqkRM
         +hBw==
X-Forwarded-Encrypted: i=1; AJvYcCXdcvAtmYOY01T1lt/8RFVzTJtKiksK5P4idOmdzijFBB2RmcX1xwNuVM9focougdS23QzqotHA9wEUseG7rxGN@lists.infradead.org
X-Gm-Message-State: AOJu0YzHyw3vE9eRW49nQrsWEz8Y5Dvd7/fNYP9BOq5ztA/X9F9d588K
	/sxpp1AqR42NHzezFj1wnBuCuUUIYHv7+8pz2sZl597dVi0E4lpbZoXc
X-Gm-Gg: ASbGncvuvdZSGYj2gPyumqI4vLGkGPXQ4t+sfRhDuEUzd3zUIgWxI6fygl1cVbb/7LI
	Y2xM5Ho3+8XosF8p/lTGGVtcJ8JZaA0sRaw9rx3LeljjfABEoGQFrklC3k6C1EJt/flDlkm+WnP
	J8TJmEkfaz8lFnlS2ijl5VvM0ZrPh2vjSrL+byHU36eRbshUAbRLk8Iv8pKklEvLc+9UTw1+uK1
	U/pq6IuRoXxvBUWNR8DapQlDGHQdImcOsLyCFrejg4zAmRuhfVuBPV81fCJojqZVfdvFXZdMbqQ
	I5i+FDiuihapo9iggLQw44256QZO5iOhlo9rWpsXW1D4d4Pqd5iloSvPK+s019AZVB4ay9y0X/w
	RNA0sPTm39l/WjuIy13cr3rBOV5W+ZV+1aLrUP12YQCOMkfOCUtbDy6VGd6Ol6myB5wiGFqa1sX
	qMso8StQ2+
X-Google-Smtp-Source: AGHT+IGB7E/KWo1lahJL8+e6wOJZtjYp6Eo98mRm//4pnQJwgE/Oh/eOMu0MhO/JU/RJV88qtg23AA==
X-Received: by 2002:aa7:88d1:0:b0:7a2:8111:780a with SMTP id d2e1a72fcca58-7a281117a18mr7274917b3a.2.1761378232258;
        Sat, 25 Oct 2025 00:43:52 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404d760sm1395083b3a.39.2025.10.25.00.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 00:43:51 -0700 (PDT)
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
Subject: [PATCH v2 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
Date: Sat, 25 Oct 2025 13:13:31 +0530
Message-ID: <20251025074336.26743-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251025074336.26743-1-linux.amoon@gmail.com>
References: <20251025074336.26743-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_004353_144591_5EC91533 
X-CRM114-Status: GOOD (  17.28  )
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
v2: Rephase the commit message and use proper error pointer
    PTR_ERR(pcie->refclk) to return error.
v1: Drop explicit clk_disable_unprepare as it handled by
    devm_clk_get_optional_enabled, Since devm_clk_get_optional_enabled
    internally manages clk_prepare_enable and clk_disable_unprepare
    as part of its lifecycle, the explicit call to clk_disable_unprepare
    is redundant and can be safely removed.
---
 drivers/pci/controller/cadence/pci-j721e.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..b678f7d48206 100644
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
@@ -692,7 +682,6 @@ static int j721e_pcie_suspend_noirq(struct device *dev)
 
 	if (pcie->mode == PCI_MODE_RC) {
 		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
-		clk_disable_unprepare(pcie->refclk);
 	}
 
 	cdns_pcie_disable_phy(pcie->cdns_pcie);
-- 
2.50.1


