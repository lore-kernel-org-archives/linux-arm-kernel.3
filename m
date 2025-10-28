Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17422CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ATRw3tFFmEK1zPWNKP140zh9kBKwr+zrf40M6SOBpU=; b=1wjnEfYxM4ZUGVc7YUyVO2phX/
	sVqNRrhqw93MAQrn98IwIjidwgOrFQjFnVTxyNC50xzm66EWX414evozba2hoDpMt0JqaDVA79nDw
	USsEIDMNgFoFkcZPFKpU1Uuii8q4FHmEx3dpXts6NAv5wLPBpTUc1JCRGwzyDnH47L9pe1lEFXim7
	f4p3D1zEXcBhb2v3lkY/sUGNKD1ZzIl8Ee7f6k6rFwc0HWOEhq/TX3L/ycJiu61xBQejuXnIBoKES
	8zaUyak342L3Im1CO9BKYxr+owwbAQXrhQofi2D85zs+OG1wAS5uTrw/sdipFLIYp+lr/C90fAtvt
	x1lC/F8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlqU-0000000GCxD-3m75;
	Tue, 28 Oct 2025 15:42:50 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlqP-0000000GCuq-4C8w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:42:47 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b6cf1a95274so4241826a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666165; x=1762270965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ATRw3tFFmEK1zPWNKP140zh9kBKwr+zrf40M6SOBpU=;
        b=Ffx5ZvEEoR7uCZ600MK1CJnJgU9ugy+MnDmgUXfC1d1NOwKPOcTRw/5fED3fL6aT3R
         jpXph/LvhC/Mjph5gHNzTgIZmRUFFnj6BdXOePADlzR3IJK+GRJMuQTc2Gx22tIOZjl1
         bcMJfzYh8mEehBufF0E4x3oU/1bQQnim4/uO8WeOLbpQd5MtQB+KpvtMUxyA2PAv5T6a
         46ONRLKC4j6OBcxxlsarzAktR2BSaupuFZtwMAhO9xDcbt8KeE+EjF+9fwAqXTELy2EN
         FKXybmW1nzRH5A5rCAuL2j6IlTuV+zwSTgc65Q91rQ6xKP/Kft+4zwum0Esl5jC8AiNr
         Oxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666165; x=1762270965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ATRw3tFFmEK1zPWNKP140zh9kBKwr+zrf40M6SOBpU=;
        b=NXgdr7I0xFS5w1Vo2wlkDjZrNSMYbYFLnkxFvLawyqBvXHGP6L+hmCEuhXGMwS1MaY
         cUnXZY+WWITOM/aVYoffNmDmCxf06pZX8tH8akbFeDrZWf9TnOmQW5s66w1G9PSd5zEy
         2wZrMPicy+Ufe0CdHPrS/8uw9PHQhwe+ZuKC7iuSWjbbGoVNwez6DxaK7sMBmtCdCYws
         78wIopzYkfFREYy/eFwgGGKFYS2BV8cuHx9kE09g+cwWMjipBbStGKfCgpG34lET9pTw
         e/LxwuU6is16hJpTJr4d3FdeRGGn01zRWtCTHr08K7cm4TKqgO7zqNiBciN9j1XxOJ3O
         Ga4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqMtBNWol9d4pHMxHSY7Bg8CC0cjO/6nE2ikcooEsPiMs4KYT7na/ca5E89aYix2rpzsIgEEU6xSBpMAjqlXKP@lists.infradead.org
X-Gm-Message-State: AOJu0YxQo6QMmb84R8r1S0Z13dpwGLdNMoPza86+bI7IFH+haZwsUl97
	n5a26DSUIzL/JixPrmFtfPIfPjCOyD7aVITRH7ogeSnWC7B8bdwe2iJCJwGmBg==
X-Gm-Gg: ASbGncuH6kUEwSisGsFkMSuZFSv0ilez1IKyta1ggUP//2Fe9q+ELO5NlDlBnogE9jy
	2vp2E6d/JCDFwpSRm2saX/AOIpP2TiUP4Ln5mkwkdorCuJNNreU//XRM6rdO6pwIZbrVKd4V25J
	GrzH2qK1Bius6vy1J1oc4cLHqF0x2+ha+tgZo6IN5N0vEePtjzW6Kiz9v2YbLNJ8y1x6t3qxoU8
	Bi4Nr4XNl8hDG4o1fGOBfO0oup3DJZ44CC/wPLJkNQFKYa1otJAt20TpZLIrEE82ihJAeLNvAkF
	zDtriAD73jDmf7SHkJf56fll++DlGCuo3mhsSqWI+T5zkAB+TqE7xj0O9o2Hu5Ii6zkaJ3me5zG
	cni2LN5PK7gnpuM7J/+zxwewCVWusHQe2DtBrMiwyBT0c1odI1Y5RY8mB+ikHeVaTBj/uwSGp8w
	==
X-Google-Smtp-Source: AGHT+IFX1XKPhnz3Nfvrc+6BGz+aJT/D7E5JuxSlko5PpiJVk9W0Dbe0cl4ODkgGZEnXaVBp1Weykg==
X-Received: by 2002:a17:903:2348:b0:24c:cca1:7cfc with SMTP id d9443c01a7336-294cb6756bdmr53895455ad.59.1761666164805;
        Tue, 28 Oct 2025 08:42:44 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0a4d9sm119815145ad.37.2025.10.28.08.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:42:44 -0700 (PDT)
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
Date: Tue, 28 Oct 2025 21:12:23 +0530
Message-ID: <20251028154229.6774-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251028154229.6774-1-linux.amoon@gmail.com>
References: <20251028154229.6774-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084246_075489_B82A353C 
X-CRM114-Status: GOOD (  16.41  )
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
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: Add Rb Siddharth
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


