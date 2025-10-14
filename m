Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECF3CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7UerwX9ObkYiq6vERvNVgcsL6sbi2km2IZoP2hNgnA=; b=BtqXnAfnaijUcfsKWNXbDDk6MK
	1xPKF269IquQVRLtUqi7KabD0gAKOo4xArMQRNLMwgGvL5pB+LMGBe3N2eMoT85Z1Bs7B8WwsY1ch
	2TzwJ7oD0krVqCiBRd5haDqYQ2BEZ7z8/9K/Vr5PoMnxS5QugZuLguMcsM1aizNQpQ9fzfR+ShxPw
	qgNlZYOxr471kZsLVpbCPPaMMdZvLtgZESHwvB2JT5V7SSOLDLCNb3tYGcQ/Vj/u8OJeaEVYB4zHY
	61OYiy6AaMghBH6QkVQ87U52GISMcYydNgTO3Wn632NKJqMyA1xhxc4Wf5EBEYyrE2PzqL709P2c9
	qRvTGX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dH1-0000000G6x2-1Cky;
	Tue, 14 Oct 2025 11:32:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dGy-0000000G6v4-21XC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:32:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-781010ff051so3706745b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441576; x=1761046376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7UerwX9ObkYiq6vERvNVgcsL6sbi2km2IZoP2hNgnA=;
        b=by4VNy4tF7FKYSpnz5sjVr0iX6MaH1sewyVyyipIZG0VNPhKly0IR4bnK6qFs5mgFY
         1kR3kjgCn8VYFBPtvcuj72UDsrM7qcmUiyvZeu+DA/5yE57Oli+Rx6SWUZiLympboomT
         pRZZN2JwhZozgxmdUOYryFHf0vVvkalSAx/tDHT7xWu6qbSIP11QW5bQwjkBcQC3Aibg
         /hDBu9+DzqZx8l7NGrjmHM2foKg56DcfrDTpdM7I/tGO1Ope3cFsXWx0iTSiudsstGi9
         L7THiowkxTc0rowqAURbCk1d5KlDLaYtDc56Yq3oVp7S5AMYyJDJGH9IjhN9q8rdEI60
         FEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441576; x=1761046376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7UerwX9ObkYiq6vERvNVgcsL6sbi2km2IZoP2hNgnA=;
        b=AMuVKDWiD1pkGUeNqtENlBy/keK15t1+yGmqmMQhVJHJ1XPgGTSPHXYoEX0RNN7QPu
         zbU8JTrMXRrf6mEJYfSXfKFgdvsDB3FYjhSdUvR7PwDz5e9NSi15FU0j+HwrJMB7+PMS
         +m4N89IlVywOGQXcDLIW28mW34pggFHPPKw6yj6uinSh+EJOKDlQjvC7qQv683gpoYoF
         NudTTqO01zdpz2uPeOwmD/Ak+QNBQO5/3R3gvsneMXrZa1LlZbHsyZM5/z5N/RT5qzQt
         kFjUlB7B/glm+066jXOo9wULryRBvybptm/JZdtDQ4p5fvRff4GiUoj7+wLzrw7KIYUb
         kA+w==
X-Forwarded-Encrypted: i=1; AJvYcCVn0oDO8kygCUcyIiq2Gyd0vmLvOZHj7Ie4LTlk6Xc5jRsexsGeb3DnFh12AVFsLSsG4IzjHY3H2aor9Rn8v0/d@lists.infradead.org
X-Gm-Message-State: AOJu0YztEdMJgdq2pneO+FMd2QnB4y0y1gzCg8j6CIatewTCzQTtSQG6
	OKv2mIQYlwSs9btCo1wz9ct1vwmK6qi/Fh9EMdnTyFZ8ds1MsZ94SzPQ
X-Gm-Gg: ASbGnctdUaQ9MLkoaorlljWZn0IiC9HQxrY2GQ9N/+G5WfL+HeTKWbVFP0ESWC0FW4t
	7E3Ah2zvlYsN4wz4cFzS60WofqBU3ScFLF/fr2KYJN5DLfSG712QsKmpgCVbjimLqRDX61ACPts
	s60Wry4fPIoIl6mcqN+v0yk7ES9XvgyQ50GWOW4qF5MVlGlkIJLc3GPSjIScH76EgprXW86qq1V
	jmrSa/BnCrDQ5fi/SI6OUKpimDhiMAhW6jEukLcLxNxghE7KSTASJA4shFidAun5KLOffS118wW
	wgd59u2Z4YW+KMjgl2diWjzjCsraHzKDQDm0CjJdWYB6jK15c5TRyGneYEtaNVCX+GIilx9yQJv
	c+C8yAySaGEDUx0mMA0IxCgXjBKrLkmXjlEsEC0Ynf7pTDycLZQ==
X-Google-Smtp-Source: AGHT+IFL/A1wjKWekovh/oihjR4JIjfCM839DB7WtztyHa+NpAIMVWIzCgumtsxtL4h7BgUTWYN4Fw==
X-Received: by 2002:a05:6a00:182a:b0:781:275a:29d9 with SMTP id d2e1a72fcca58-7938742c7aemr32083308b3a.18.1760441575343;
        Tue, 14 Oct 2025 04:32:55 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0965c3sm14871383b3a.52.2025.10.14.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:32:54 -0700 (PDT)
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
Subject: [PATCH v1 2/3] PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
Date: Tue, 14 Oct 2025 17:02:28 +0530
Message-ID: <20251014113234.44418-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014113234.44418-1-linux.amoon@gmail.com>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_043256_520388_86291007 
X-CRM114-Status: GOOD (  16.77  )
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
the error handling and makes the code more compact. This changes removes
the unnecessary clk variable and assigns the result of the
devm_clk_get_optional_enabled() call directly to pcie->refclk.
This makes the code more concise and readable without changing the
behavior.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: Drop explicit clk_disable_unprepare — handled by devm_clk_get_optional_enabled
    Since devm_clk_get_optional_enabled internally manages clk_prepare_enable and
    clk_disable_unprepare as part of its lifecycle, the explicit call to
    clk_disable_unprepare is redundant and can be safely removed.
---
 drivers/pci/controller/cadence/pci-j721e.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 9c7bfa77a66e..ed8e182f0772 100644
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
@@ -603,18 +602,11 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 			goto err_get_sync;
 		}
 
-		clk = devm_clk_get_optional(dev, "pcie_refclk");
-		if (IS_ERR(clk)) {
-			ret = dev_err_probe(dev, PTR_ERR(clk), "failed to get pcie_refclk\n");
-			goto err_pcie_setup;
-		}
-
-		ret = clk_prepare_enable(clk);
-		if (ret) {
+		pcie->refclk = devm_clk_get_optional_enabled(dev, "pcie_refclk");
+		if (IS_ERR(pcie->refclk)) {
 			ret = dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
 			goto err_pcie_setup;
 		}
-		pcie->refclk = clk;
 
 		/*
 		 * Section 2.2 of the PCI Express Card Electromechanical
@@ -630,7 +622,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 		ret = cdns_pcie_host_setup(rc);
 		if (ret < 0) {
-			clk_disable_unprepare(pcie->refclk);
 			goto err_pcie_setup;
 		}
 
@@ -679,7 +670,6 @@ static void j721e_pcie_remove(struct platform_device *pdev)
 
 	gpiod_set_value_cansleep(pcie->reset_gpio, 0);
 
-	clk_disable_unprepare(pcie->refclk);
 	cdns_pcie_disable_phy(cdns_pcie);
 	j721e_pcie_disable_link_irq(pcie);
 	pm_runtime_put(dev);
-- 
2.50.1


