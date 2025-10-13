Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F503CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19kHdtY5ZhpAxDQMVT/2nG/beuKDqoa8OjmMddMbQbE=; b=DDcFd5t4d7Hp5c4UPX1rCZ1t8V
	7LOmXJqzwSCeNYsNJMMy9QSJiZV8SkpuLhvT+OtLyZUxXoFFn+HAe1HMtTTQkK5Bzn8CExnjPFeHf
	HtMT8S0wiIJJL+ZDmgtPe7koGRBGhUjKibgIO4Nu1V2gVZruDjEXQD0mpQ6wjQO+jeUrNBl04KTlM
	xXfDmZgGeazDLN5/2qLBR2EkKlmc2WUedcFDGoKyPRB65MfaC1P3p5PkstxcoBnurBxTOKKvyRQGI
	LPgzCerMSYQ8KnKMgoAgt7vC18zKvyEM2o479yqSDYopLPXN9TnKUEygABcHt5VVC9ruttGLpQhcW
	RF6uYF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Fco-0000000Cswc-1BnW;
	Mon, 13 Oct 2025 10:17:54 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Fcm-0000000Csvg-1UpS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 10:17:53 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33067909400so2999337a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 03:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760350671; x=1760955471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19kHdtY5ZhpAxDQMVT/2nG/beuKDqoa8OjmMddMbQbE=;
        b=O+l77pytvIeN2dMxCXsR/c+pKbuwXFh2za13FgKTlCzLgtV+mf6+npzOISSGHJl64X
         M5eQaT/b6vRvIqp5pIXpPsj12N3Gi+R0H673ppwGGmEfB+tbqLtsiRfB/2J98sWPvKYr
         3skcvMPMpisVu/H46AQzQMXyvvTNpySAK8S+ZCqiUeK22j5XXuRxAwS1eSivc2q63mX2
         HT0iZ/dZdcA2R4a9dAnYt1LsqnKZAT/z51MWyddps+tLkmymcFlT/stjJuKa+4w35bHt
         G8Pm594M5uJDKy9FZam0ehMsdGM5zdG/Y/9dca5VoPqonA7TjeWC3NKr0uW64By/GDXS
         CDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350671; x=1760955471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19kHdtY5ZhpAxDQMVT/2nG/beuKDqoa8OjmMddMbQbE=;
        b=l5mHszcHttKEk8CXgiD9wQFEFwvFoUyz48fRfdhQVTI4JYEMn4HMSS/jkNR1YfFc8K
         HM4vZ7TXvHv+5Lc1+Kg4kdujqDAj90giwhdfYQZPLKGEMuGf9AjwuIPLQzkDwWawQFyU
         UTWeV397/tPTYBT9yCrB37FENaTmOvXj66FreS/coaKINFdFjKunPkvJUAH9ZBRIagMU
         fMSRkyLYSB2uuGdzbp9IBocFaPeVistei2JrSBBE9G0VUTUInnTfhgEYg5cD4ajPqf/n
         bAQu34SzUr/+IestT8r5HyH9ZE0WIfl4PAI264CZKn78qeGcW2p30lOcdofziVX4DuLO
         fRug==
X-Forwarded-Encrypted: i=1; AJvYcCVOJLl3LtX1T55EThTISy9+noNU6iugCvTRNB9xpMEEgRzbh750rHTUpzisrbdRQcyXh7Qil+G5avZwTCbnmnEk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj9E60NeN8UNyvxk52tNbT4wepjhu5W4wDbSxsnC/YGv1TCf4J
	HY9BIQL8lZEiAFlwmQwcV1g2phKHBdgmTrc3esL069f5uqLctZYNnMTl
X-Gm-Gg: ASbGnct+9yR/5MGji+viFaA3eS2s3vZRZT39SMm9D6h1GwmQACZliRNr9oL9sQM1S2f
	7EiFreNMXqtMUhPIX4ysGopSI5GbOzy+N4E26rNiCZoRNcKz/DyPrX0CP+ZTd1CvWprFt0Uy6p3
	LQ5G86KD9Yc5tmlCRPkuQBWfzZS4VJbx76lhXRateTykqwBFrrbbdqXb/f3qxVupU0Y2PAVggMz
	2gG0DnlMd1dWKNKSVW/insbFofH79v9UFx3xdc3RdvE/BCAZ03dKlR34WDGmz0WdBVQWFyftSpJ
	N5DAcsznMA4bUSSNGzR5iyfVmbOi6sBloYPnhkub+bbxfqpMCrdrXEMHLRgbQlLZ+uwfmrFC5K+
	xqiKLsPr0qfrfEocTs6sjd93KSELBiOXd3uahl1nfCZncVxZBkA==
X-Google-Smtp-Source: AGHT+IEyZirSf3fnKNnVB5Ye7lidBycAPJF9I2FEB25F5npassyZdVGtvN5Z0VaAFP1R3FsWO44BJg==
X-Received: by 2002:a17:90b:4990:b0:338:3b73:39ce with SMTP id 98e67ed59e1d1-33b5138e3a7mr27708156a91.25.1760350671380;
        Mon, 13 Oct 2025 03:17:51 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52a5656dsm7422864a91.11.2025.10.13.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:17:50 -0700 (PDT)
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
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 2/2] PCI: j721e: Use inline reset GPIO assignment and drop local variable
Date: Mon, 13 Oct 2025 15:47:24 +0530
Message-ID: <20251013101727.129260-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013101727.129260-1-linux.amoon@gmail.com>
References: <20251013101727.129260-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_031752_407607_DAB2DC19 
X-CRM114-Status: GOOD (  16.07  )
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

Change removes the unnecessary local gpiod variable and assigns the result
of the devm_gpiod_get_optional() call directly to pcie->reset_gpio.
This makes the code more concise and readable without changing the
behavior.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index d6bbd04c615b..1ece4b183dfa 100644
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
@@ -615,9 +614,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
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


