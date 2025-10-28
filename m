Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55510CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLSaa6PcadKxSJGpM5AYmWJ5bCIVBLv3q1JgPY8IHz0=; b=qcWEvzk5soAkj2+YsHPCHmaE3N
	gdgsyI2SbXEeRKEZBSL/xga8P6SmIZsL0vtXWTuYge9XRZeMMyITrZkKk3N7ohhyfR28wbD3R9Acn
	NFF7gS71sicFIAC/EytVVOt7ZdIPVCuJa/Z6bN8vKLG5luO2SyD86MIIl72RzZt0Zel9UcB/fkLZx
	lT9IqJdc6fuP18duesK2p+HdcTVj2nBp2nh5WJ4iCS3uFPq7fyx3DJQcmdDcduRJo4G/QlfPnCR+O
	pxDiMGsFUOGPQsgW8HfmO8jVvB1xUZz2mDOIRkO3Qg+MwRJlaex7LBv8bS0ZF6bYVXeXUezMAmSkX
	o86BYNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlqb-0000000GD0N-16ym;
	Tue, 28 Oct 2025 15:42:57 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlqV-0000000GCxj-3236
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:42:54 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b6cf1a95273so4482442a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666171; x=1762270971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLSaa6PcadKxSJGpM5AYmWJ5bCIVBLv3q1JgPY8IHz0=;
        b=PQlh+XoqtQ7RX8iPJzPxl8X0Ceftt96bWVM2F3yy3UMvcEKVeVU9IkZU61ZBBwU32+
         RQYjzaxu5P065JQ2XatV7IzBwEXySbwwdtQr++sv85SN46VOjyUziLGxcSOT+IHlbske
         7pWl/XXAj/K7tOhD8t4BkgKGhUhcZHD4FLDT98j/LqVwO5TXPUnG4q51IBqkpe6zigvK
         j/uBmILuuakwfJu8ZHAUKdfIUprTT3H/wwqoCaUk7fg8FnwW0x3QYe9UzyWHWEy++eE/
         0yGW10SvPyFI5IrfeRFis7SYmZ+qyZM6vr1cBRFFAliS0ZZHQ1Zzf4qF3/l/STBSd5PF
         G6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666171; x=1762270971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLSaa6PcadKxSJGpM5AYmWJ5bCIVBLv3q1JgPY8IHz0=;
        b=H5xpr0vQVAkCOgkBsa3Ak0W/vIBtacZ33huBU48wbaNXd4q1fofT9N0xmr46hUJXwU
         7T4yVYQXQBLWTv4OOHW3Ffe8RmN6dwdQOG9H0xOXgc40TqNAnKkzXrqDuJa2TJkRWAdf
         P0CjjIoIR82rLqXQ/oZb7swrYyO5W7jhRc9yFxx+X2fPbK8i8eCvCMXIcCPwzpvZBDm3
         0hA3JDhcSfF+KfrUybZYESsaEfL46mZa6TPv8iQl3lJvG7LGn9naZ5/pPKVL8fTIwYXx
         JEfG3UXL6s0RBFUOIhDdS6It23ehiPjKFnVqJxfv/Rg1+pBbzuKtjLPvigNM2245fMjA
         HkPA==
X-Forwarded-Encrypted: i=1; AJvYcCUhnCdp9MRwP+fe8XOVt7D2W8uJHbiv/soqMHH01PhqpUnweF7nAW+ldZj+egCvawW4tJfvc1HDasGIhJkLinbV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8YAVczsp5pZdJD3GvU+WDU7LwLW8r8WU+pDGCqPOpg3xRMlpp
	PRkgXGhIuOhKfAiqsiN9nddfKoQm7emEGHJ8UdiV+7WkfqgzsUorP1ce
X-Gm-Gg: ASbGncu8uindK6OQySbpujh/zD6ulYXXvE4kVqf1BUu0Rw0RIYgflCXR2BM2lBdu/PP
	gF1nG4RE74SGx9XZS5DxMIAruDT6ZZyvt7kW5jYgYICl1DMyWHbXm7Ly0eL3P9cW7V8lRs+hRyp
	TFFvUI2qd2cjqP1zTRomArmT0kwHC00JSB0VIy/zhhshhS4Kn26OFcsgRFFmh4XC8WXCvINVnE1
	BX36ZtIMceq9lP5T5Bsnkm5cFKrntzkUOYpYY6dfAsfjExncCzTAx9gx1X6IR/DCK19SuUqRCBM
	UITSlNdrkgs9IM+Jsy6t62mBgK4SvQCXY2ySTBjhjLN+ZM7Wpv671JANOIL8kct+rGtVNPTKBuM
	7iMB+RWclWjtVmekSHuMnIJm/dTJF7ClE2c34U4rbxqoC1ekbbEBn2XypBSsNsM7ODM5+o/EZ1q
	A2IRI5KpIA
X-Google-Smtp-Source: AGHT+IFtaSkAiKKcd2pcmpO8llRHe3kknOAIp2k2H7U83BZTPQHu+FuTy+qLrHQP9UKuG8qf//3qLQ==
X-Received: by 2002:a17:902:da8f:b0:26d:353c:75cd with SMTP id d9443c01a7336-294cb381901mr58454085ad.21.1761666170702;
        Tue, 28 Oct 2025 08:42:50 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0a4d9sm119815145ad.37.2025.10.28.08.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:42:50 -0700 (PDT)
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
Date: Tue, 28 Oct 2025 21:12:24 +0530
Message-ID: <20251028154229.6774-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251028154229.6774-1-linux.amoon@gmail.com>
References: <20251028154229.6774-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084251_770279_1ADC0734 
X-CRM114-Status: GOOD (  16.06  )
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

Assign the result of devm_gpiod_get_optional() directly to pcie->reset_gpio.
Thus removes a superfluous local variable, which simplifies control flow
and improves code clarity without affecting functional behavior.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: Improve the commit message
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


