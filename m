Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD152CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoTpyL8LPqpthgwVzy0CiG0xAa+lw5VtWyKYbKOT8QE=; b=ZG+sBEoTUgFLkRSuUfwSVXXL1r
	VCo4y5LBwzt0bsw2nfvIQ4AsgaKhd0d3Csb6VpPLXjhCcj+9/RclzR7teTNDqtMQY83sfGYGdfy94
	3JgnxZ8sXTmmzJhbONt7Ut5iOntfhU6nTYP2/Hr+G7bFHh8njg/JwImUH9VTwTmzxg5USqygrRDxv
	9g4JOi121/XxSJL+HPRCV8DfTAwswOpoPGQzS1g/F4B46v6pjbTCFAmyHsEHzcnSUpXcQnvUlvfxE
	C3wMU9tFoxCgfmJuJ6QliXl8/rRC4WfI8zzzTZqOecKJhw0OtlzFbjFmODRHX2fBN0T+B+SroUbXL
	deE4Wv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ8Z-0000000DTgl-0NoL;
	Mon, 27 Oct 2025 09:03:35 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ8W-0000000DTfC-3KTV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:03:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b6cf07258e8so3069278a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761555812; x=1762160612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoTpyL8LPqpthgwVzy0CiG0xAa+lw5VtWyKYbKOT8QE=;
        b=hm1rKl/1ZdSYuyYP4tdw+W1+uQoMaXu8/hRh5gyzwgRsaQLe9zv37S7Hl1BT1QTjLm
         1wjvCdzh/RKJCw4AUMts64mYv68POPnICkY3yO9jIsN6xlerQZHI2irVn/QdVGDOlI5c
         kgz+/Egybup1vmJvGPh3nR3dd9hVAyrkW9qXVdreN7eGOp3M2j1RRlXjhrXJby/ONs/G
         53NQwSERfi4XW5nQLoPJ4PNSVAe81IqX741TyNO8L7I6YS4h42jo8AFTvuuAxAf2djae
         lVwmadT1xgJobaSqaIXb4sTXpVVY0xfF/ftN/8u5nGbbFULDYtFJBGNZjv6OUJSbPlAM
         No+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761555812; x=1762160612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoTpyL8LPqpthgwVzy0CiG0xAa+lw5VtWyKYbKOT8QE=;
        b=c3lRos0W2Ak4NOzoHz+VXPnET9lIhz5gyiCik07zymVCxNlUe6HiIcu28EKT41xTKP
         BChwIMGiuJt6paQKg0II1Lj0LUrfkwlZor0Q6Ig1WapYpdltsYk9KsbrOLE7kQk/gtMk
         zJSTL29XhR1KiQg+1e/zCTj1lp03IihzefQqIQwyuhxLV4hn8w1U78k02Kr3OPjcVCJC
         OJP8VZaM17liVOVhSqtmB+uFjOeJgmRd7u0FyJ5FaJIfWYoV/PijLGSuxS2lBpR6vnzi
         xYCZ653mR538jDMN/G9G4DV7kTa3lxJ2/XXjEe1Hl7QAI0rOrTgdHsR2iWTBQ42YEb9M
         octQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBjf2M3pte7Bhll+m3Sh7aGe097EmdmXuR3x2vpp4ZX4f32/4ONuZd2spCXrn3SvpitvEhSfXIgxtQZ7rpaM23@lists.infradead.org
X-Gm-Message-State: AOJu0YyUXEuJUQ3mnQZtLesElzGHwBiWKZ6arNcOoavklv5dVaxNgwFR
	YbU6GjhN031LNF91MDFdiopHar7yTiyyAvif0d7fBF+E+5g2OiZXN4c5
X-Gm-Gg: ASbGncuURv4PgGE6bbSe0WkpxHB10pI4gzH+Atd9l/T4Tg7hwhxgShD4GsBPqOui5N+
	TEQGWOdLPpdZ7xkI70Pm0+LvHIH2bSWHJywlY+AtJ/eRZO9JfwuDod4IzeoXBFNl1nRw59wmjY7
	nTLYy2MVyulYXtuLVsGaHn/yzelTshJutkmlVI5mxxxAV9PRSGiE9WRN4X+y+YFF+LuUjCUjjEc
	TMAYIURKvn735MnZ8CErxiQlrlktJ3I1OZRZGGdO09scUHgYjwkPUzDYgwmjjiwLBaQ89Yljg0p
	3KMMgWEcB/Q+DObVa/HvXxmnhhXJm1UHLc4zBh/b5lJKS8V4K0eRe5LY3ljXmBJt6a99GSdL2zn
	Bp1dMjyb818U33hpnYEKnUXXbDe1Dn1V0UXyP9gDi4YeX7bGGweW1GaeIyb/SHZvDKF5RfIuG3j
	9d9XuNAx2sFBbKOTDGAKk=
X-Google-Smtp-Source: AGHT+IGXwneCAjsjJPL0hWiNqGqUVbp6EE3p4IZGCMQRdN0SZJ+QzldDOpFCpQQntrr/66rhZtbW2Q==
X-Received: by 2002:a17:902:e944:b0:290:b14c:4f36 with SMTP id d9443c01a7336-290cba4edaemr464679185ad.31.1761555812013;
        Mon, 27 Oct 2025 02:03:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3433sm73881335ad.21.2025.10.27.02.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:03:31 -0700 (PDT)
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
Subject: [PATCH v3 2/2] PCI: j721e: Use inline reset GPIO assignment and drop local variable
Date: Mon, 27 Oct 2025 14:33:06 +0530
Message-ID: <20251027090310.38999-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027090310.38999-1-linux.amoon@gmail.com>
References: <20251027090310.38999-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_020332_838544_10D948EB 
X-CRM114-Status: GOOD (  15.61  )
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
 drivers/pci/controller/cadence/pci-j721e.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index a88b2e52fd78..ecd1b0312400 100644
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


