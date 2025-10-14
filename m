Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAFFCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBUWIXVuX9TSH7iwZbReBbw9Y6KDyRcjsjDA5QvkLIc=; b=td+w1JP80Qik23PLVvrCqMXE2S
	uTiKixrvWdpGOhGHFhKhbgt81ixT9qOjUxwz2zPn63MKa1WonyZE6owgPAPy7/+j1pxZ6hWMHtnu6
	aEaqCKJotf1vlF0mpFCxGED66xUUgkh+VwY6vxIyppAKJSNXyf+w9CzPUXJzbXVMsroiBBpI+FOvZ
	GZqwwHDqPeFIUmj6vYDdXUtaFC5U7W6n55Cu0MUFWqkcYQxBNBq9XMeOVG+jgcxAoW6jKSiliGGFM
	+Y1q8dtGkXZCwG3MHiNbDqC/aICLviwVzfmlCvwF7hgIY8lTNYCDqJ5KT5w59pBWMOfC+Z8cTsZsk
	zY54IsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dGu-0000000G6tI-4A0A;
	Tue, 14 Oct 2025 11:32:52 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dGs-0000000G6rr-39Bf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:32:51 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-782bfd0a977so4396087b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441570; x=1761046370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBUWIXVuX9TSH7iwZbReBbw9Y6KDyRcjsjDA5QvkLIc=;
        b=eNjaguGqgg0M0pxI8MGdPjEes8gyB9Ziold4gNrwJevMUYCO7O4XbZpSK9IqX4lXiS
         Zp6r9q6KrTmEqk25XcXSlTSO5rEzGumq1FQu9LnVlhS1/2DsxCFBh6fFaECXE1NAHDzL
         vyDx1wK9FhGwx6o5sAEpDFIN+0FqnF8G5llHoeqi+pq7R3WOmXYcDKMnLXNUcXMU1aQt
         Jc3D4RTbEbwbL82PbShiyeEPnRYGcBK0p4WobFh4u995yjyIm0soJr74TeMKjgqk5jdH
         gcZJ790C1ju4wvNsn865RsFXMyeRhqmt6aFKXPiHamJA4prifENjZd/ebiIR5HYZEU83
         TJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441570; x=1761046370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBUWIXVuX9TSH7iwZbReBbw9Y6KDyRcjsjDA5QvkLIc=;
        b=rYfMVBn8/sgU7bz8fOifV9VLuR1wyXKJ9OizS+ckrZeP4GQ915pEF4L3bJNW7iUF/I
         70MhnnzRjwzkaNJGRkTOTuontrK/26CNssBLiieJKc01g1WUFFOmHtro8by29Dt5y8Yb
         FOPZYlugym6DsMNvmJssBr23yW5JqDX5bwbRnbh4I1qmrN/XJF00nlyLMpzWtH+umlof
         q40PYavoPsm4QK56O9afpSIu1tVUqjn3fGTZRcyoNf1Rmi/YRT6a+tIhRogMXvhtNGDl
         S4ct7vYcgQbtxwmhhzbc1pmgjxu9aJe9srjwA/BNf0gbuOwPYikVqdz0dH6YpDVLEbPa
         tY4g==
X-Forwarded-Encrypted: i=1; AJvYcCXt/c+BIN5L+1iGzMNOu+bqt3WmVnj44qkFNhaHRdvEwnyD4+oFwxLd9MDPTDehNgBKTQG7Ygs+sLkeub6L7MDx@lists.infradead.org
X-Gm-Message-State: AOJu0YwXZwf3s8OrLJ1KbjQjF20nUAGOlLGKu/CTQHbs++kvo/M0jAZu
	TFMEFQJ4evLWXvgeV4WtiotlUAPdegTTSK6ivkhJDcbfJUgZBpDohgo6
X-Gm-Gg: ASbGnctlfC5//Yo99UaMPeF2YUb5XC+RNBKcoQFPK03pMJEubkBa344P0kZ2JdaLtum
	4cjCIq6mZv9ftg1VUh7kswcYjkmivPtgVgC+UVBpjwq2OCO0PQoTnBk3jq8aJE+u49WFMJrSYAE
	mrGRc9RXkA1a+rcimGJaplWIkE1rcZQVmpScGMopwFq0+igwhJ9Zk1GwxsyalUTm+ENrknAQkut
	mHLEpqRj9LG/bn6bbBXzhqWk00heYkeDBjDxVeELQF0gYdcHghcjCiqZ6ywPslylmBqMzv7LinZ
	rsS9zzfNzurX3D+rdu6fqMdncsCFMGeYRDHYRrHdvxvkM3dec4LTW/4MMBc7z05qmUN9oBVBnOt
	/bsyQddD6R1f5zuGUN2rUO1aBuCc+u1vcYlzZfGo=
X-Google-Smtp-Source: AGHT+IHUZvlwK/tHfChIoy9WwwPnZcMKeQjitVT4QrngVrm6V72sz77ULhr0gyxke52yNoTSgqWuAA==
X-Received: by 2002:a05:6a00:c8c:b0:77f:6971:c590 with SMTP id d2e1a72fcca58-79387d0f36amr26600669b3a.22.1760441569783;
        Tue, 14 Oct 2025 04:32:49 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0965c3sm14871383b3a.52.2025.10.14.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:32:49 -0700 (PDT)
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
Subject: [PATCH v1 1/3] PCI: j721e: Propagate dev_err_probe return value
Date: Tue, 14 Oct 2025 17:02:27 +0530
Message-ID: <20251014113234.44418-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014113234.44418-1-linux.amoon@gmail.com>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_043250_791563_8D927FDC 
X-CRM114-Status: GOOD (  14.82  )
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

Ensure that the return value from dev_err_probe() is consistently assigned
back to ret in all error paths within j721e_pcie_probe(). This ensures
the original error code are propagation for debugging.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: new patch in this series
---
 drivers/pci/controller/cadence/pci-j721e.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..9c7bfa77a66e 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -569,20 +569,20 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
+		ret = dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
 		goto err_get_sync;
 	}
 
 	ret = j721e_pcie_ctrl_init(pcie);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "j721e_pcie_ctrl_init failed\n");
+		ret = dev_err_probe(dev, ret, "j721e_pcie_ctrl_init failed\n");
 		goto err_get_sync;
 	}
 
 	ret = devm_request_irq(dev, irq, j721e_pcie_link_irq_handler, 0,
 			       "j721e-pcie-link-down-irq", pcie);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to request link state IRQ %d\n", irq);
+		ret = dev_err_probe(dev, ret, "failed to request link state IRQ %d\n", irq);
 		goto err_get_sync;
 	}
 
@@ -599,7 +599,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
-			dev_err_probe(dev, ret, "Failed to init phy\n");
+			ret = dev_err_probe(dev, ret, "Failed to init phy\n");
 			goto err_get_sync;
 		}
 
@@ -611,7 +611,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 		ret = clk_prepare_enable(clk);
 		if (ret) {
-			dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
+			ret = dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
 			goto err_pcie_setup;
 		}
 		pcie->refclk = clk;
@@ -638,7 +638,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	case PCI_MODE_EP:
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
-			dev_err_probe(dev, ret, "Failed to init phy\n");
+			ret = dev_err_probe(dev, ret, "Failed to init phy\n");
 			goto err_get_sync;
 		}
 
-- 
2.50.1


