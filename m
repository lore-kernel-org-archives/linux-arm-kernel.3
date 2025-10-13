Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD7CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rL8Zvity0qBrpOIGKiLq2gATcEJ0bdlrudF1QRk85so=; b=T6vtPdOUKb7CumIltgJiALoZrE
	y/X/Xta1h8udkiJBc8CqBDm9g7De/rwwU8FCY4zbQMRkkKcKoI2WPlawRxWTtZ7aqvI5f7A1r5fzn
	r+0kkqDfcynKDOb3lHwFI2MyprsuQVy+6DWPM4h1AyRHeviEdR/1ZpmmHVGaAE6SwMPyuXRMFb2dt
	vORBGCwqc5Bw7QXJxGz3FmAXsA4JEKljcSZDxvAdQQoID2OYvhKHWpyqyaYkmikoPAwvuy9zh6+JK
	t3FKBllO6Cyw/5cjmNrZpPvbKp+c+71ibVOfBPtuHzT8nmRRj7ME94XaaiVtM/wR5QR/b8VSKxda2
	5zKAs+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Fci-0000000Cssp-1M67;
	Mon, 13 Oct 2025 10:17:48 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Fcg-0000000Csrx-0j1B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 10:17:47 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so4199874a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760350665; x=1760955465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL8Zvity0qBrpOIGKiLq2gATcEJ0bdlrudF1QRk85so=;
        b=OvqWP45qRP1Jz7T+njRoZVvBjnzF3s6Q8uXhLLLU101VMzhOz/BJ84+Dq5ckFe/Xp7
         aAl7D0Oz5oQfUMyRdfGJxvpzkjx2GBFyM9rqQUAOhcpr6S/4ForQ767QWUEJJigQt11A
         oYpkmeb9JR2rm8bf345cWylnGnbN/hVKbsNnlScS/GRfanHACfMa2zmWALcIztgenuTe
         j2JqPhQzmH+OsaMLecb4fnN85oKnIrPmdSaFbqnjTBPbtbJHHgUIMtutCe2uyz+bSEYf
         G3qoV5JAfZuSHRMKZsDnWQ3pctzSsBXLE/1sYV+B868MGMxG9dwwCKJj3cq+qNEcrnJK
         jCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350665; x=1760955465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL8Zvity0qBrpOIGKiLq2gATcEJ0bdlrudF1QRk85so=;
        b=dRB8Gi42h/AtHFZP1JIYyki3ZU4lZPBF85uW3qOm7b00LWszPvFfGvOwJoPBIIxGev
         1UdsJe9kYWe0gT6Pe1tM0LxR3Hp+tUI73CE8eC9zVtRnlMuukjJwz1+Mqv6eMlQKkeze
         cbeNM9EiwDbVLwX3MFhBvbuOexgKbdPZzbNbiQaz9gjAhNtknMSBrkJ4ZDTgNZCF1Qjt
         9wyFK2EwKjGvCz+VKFpvpewci265Ka6nrOnJlGVN8sg6gF1ss2/5XCD2pjd1hd6ZpM/V
         /Idbb9ZzWSx8M+qrKNiBnxId0OPngRfdmWWRkAeAh2ddqc4akbMjrQ3Kv+qfm08nzd9K
         CD9A==
X-Forwarded-Encrypted: i=1; AJvYcCXigGhv+QF1UHtJJMDcFeA0Q+v+BV6wM4MzexFoQS98XMb9Zw6X/Pv/Vb/JWJaIZflt3s7ty3nBfOYZ/1oztPHB@lists.infradead.org
X-Gm-Message-State: AOJu0YzP7k0A2v4czDzJwNUjRgq1uOpjrVSUw3/TfCmMKI+XE6M29EXJ
	Xe7R3jy/jtwNh2dcadV/0xFNd0qzP61vSDrUkJM5/Dzzjw6Rb0kFhGGJ
X-Gm-Gg: ASbGncteIaHzGBjPp0zePcEomCrzTua50IDCnZmDfeUMkQEtQ8EzvkVB04hNQHJZqNV
	wa7tLITLBnzccXU/r+5BEPK0q3p9+YBlLHose0Vy6vsYTpSGYAOparzVhmQT4d9jVRpsEoznw0H
	6zMtLcnUofWtr9D0SO4sUcXyWe6vJbBQBPpV4NDjm4F4KhGM23qnQgg3x7Anm1gz3BK3Au5tX0O
	9ccWojE4UOMLY1Niokjt6jm6eCqj5gvlUzwkgAGq5fTMrthoMe7sHtGyLJz1j7+8VS6YC+lNbWG
	KK0x9Pq67UDw85bmHwTPT1twD3bHxMflDXsOVNG9vMmCdcHGTqhb6ZtcEH3MgVJ0I5BqvfKVm/9
	a3VGAlO1K6Fjvm14P5GIXWV5YJUg9tZvqf4EiHKNIuliVPcu/Og==
X-Google-Smtp-Source: AGHT+IHcngJ21CdNAU4iF9jGL+GrQ8wIh2V4zG56kXYLEpN2UR66JICC8m/eBuKADrldWfXWqWJEAw==
X-Received: by 2002:a17:90b:3846:b0:339:a323:30fe with SMTP id 98e67ed59e1d1-33b51168e73mr29465661a91.14.1760350665091;
        Mon, 13 Oct 2025 03:17:45 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52a5656dsm7422864a91.11.2025.10.13.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:17:44 -0700 (PDT)
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
Subject: [RFC v1 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
Date: Mon, 13 Oct 2025 15:47:23 +0530
Message-ID: <20251013101727.129260-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013101727.129260-1-linux.amoon@gmail.com>
References: <20251013101727.129260-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_031746_235078_DB1948B8 
X-CRM114-Status: GOOD (  15.53  )
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
 drivers/pci/controller/cadence/pci-j721e.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..d6bbd04c615b 100644
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
 			dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
 			goto err_pcie_setup;
 		}
-		pcie->refclk = clk;
 
 		/*
 		 * Section 2.2 of the PCI Express Card Electromechanical
-- 
2.50.1


