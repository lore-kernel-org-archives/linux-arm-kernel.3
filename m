Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638CAC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 20:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YkicxomHbCJpRgQf830JSQitBFyDcDau5PyT3QSlyao=; b=ZpFhgbQ9poOFWbonP1UT+vEJe9
	EeQFq/EnyCTwe7aDPYJsg0JJQXp5N5MB6/upY/EBZWcQAKexA1rijBJQpDnclR0ICoJJzrVUqHh5b
	yrJwuAmwTSLL44h7YQ+YIh4n77RMbCjvvZKX0yKaLym7fZcfbsBkpvNWEVMRyFM64i4sKdTgoILHh
	d+wrEJthjoUJaItFRL/sgHIAS2/+09NMWDCpKA5mC5ptp+mEVQ3mdd4Oa9dOjHpWh1ojND4uC1WPj
	OjzsUoKllvBkR+xWgj37nlpvmFHxYOfy1mcuJczIPTPuEEPgmJs7eNkX4iSzmsXnRluV5plCKZIko
	7e2fAfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkT9u-00000000Xce-2Yz3;
	Thu, 16 Jul 2026 20:58:18 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkT9r-00000000Xc8-2juU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 20:58:16 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so5213494a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784235494; x=1784840294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkicxomHbCJpRgQf830JSQitBFyDcDau5PyT3QSlyao=;
        b=aG954+qelimX6mcIjZP54JFRbomq2oua6ZKwxQxSIGLYN5etQFQu2dCFJIbXN10Sq6
         +5rWv3jsBg/G/yFYoO8Ytui4xSr4d0Q9BKSW+cT3X1sMo90VhF/B2k6B1Xx84TgAOF5I
         bkwlhF5vrJ2ATKy1/ol4Qwt7MvbE36HDU1opNR+5/9UNVA5tBUbKhFce3J9LXeBsA6JS
         Bf6P+lnlVgaX+DQfsBz42asOt07xR6FVzr2I3C8E1OZH18za+DOiDMZPiozTwEAaL6Ej
         jyN+0hJh8yt73STEMCszBWi+t+cKD7+V3okOp+nfSffHiumyJpJo3KupoKrFBSx9dyKE
         pdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784235494; x=1784840294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkicxomHbCJpRgQf830JSQitBFyDcDau5PyT3QSlyao=;
        b=GL8JYBDqkvNp3aR9sn9JQ3ZQBb85x/yuHwUv43Ih/Sx9giHE4jwBUHBSh9VGfzh4jA
         IvALDhQouG0hw1gUoWj4AYvJPqWJGsLjlGok78lr1LR9Yw5KAQaTeJlc8TzCGyBFq6IV
         n0o2xeTPCwIp3lEScSjq/jDLEXjonWZctDnwfbEfveP3hfowhsQiSX1GMHiSninWRO4V
         SBsy/oBjz42ZkBCo29NUUmwJ1sHuLgdU+G8Ew0/OmzP6oL5d4ZU9iD1cpU1C/oSRdY4e
         toVQMZd0Da1Sqb0UsAgil0oa4+7nIJp3ohA5levhKQUI4Fbog+vaqxt0fzRCe9l3p6YB
         Hy7w==
X-Forwarded-Encrypted: i=1; AHgh+RrOAQycsqdZtDPqtKV+YSnVZr2XJ8EhDpJIlWzIKjT+srRQtJ7x+t8Na/J9g71NsxXTOGtiLipc1RbpfQlRIRcL@lists.infradead.org
X-Gm-Message-State: AOJu0YwL3UT23UeiLfT1svUEcPHnzOmja8kqD0olDzYSzU8wP+Cj+r9+
	jzPt2Q25Wo+6z/diRkfnbmevkQZnq137vqXuhOqT5mjDIMXBI83xZUZgiHg6kg==
X-Gm-Gg: AfdE7ckJfOfsYvPMG4/Bzn6+HoRTs0qejRsmF7f9a4yAGhtzhCU/iqmThisO6dlDVnI
	xXSaqaqdRsZSG+Q9gNYP7pYf+m8ohjWlSHq5aSoTVShNiYXTXCQbJHlAKC4z9e+3nzA0F/qdVgV
	zbqRE/HSudJpOkZ2rad6erxbg6rXVBIk+vlbcm12Yo/VweFG2vqiYTyRaS/B39P3poEjpulslMe
	srpy0+gYmgkK4OSe1cH+nYJ27K0Tp62k37YEhBwiogAV/fJd4KqJX1t32MF/sxdACr3+h51nLP+
	9v+Eeu+tJ+SkkUjpB929/gwYsbxNnGCKNxeiXbKqyr9floXQpj4R9wodG+Z/C+2eOXfV/eie1zr
	MA3ezdg9wUXjmGc2hNve72bMaGdGk1NuIftThIDo03VJoIomieW2VKEgrz3WIX+aytGigNTJ/ho
	SPJL/Yw2agYbzGnlVsApGA6NSsKSk7HjP6aIjTI2c+z8IPsa6G+ikqMyj1EK+J4SGH/CGSJGjLN
	jjq5d3PHkAjB14ZvfTWd/LCMWfqqyCrxfbbbsRaWwH5Rq8+MrM3MoA=
X-Received: by 2002:a17:90b:510a:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38e2a10a4b0mr7707701a91.38.1784235493976;
        Thu, 16 Jul 2026 13:58:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39dee6a9sm1849749a91.2.2026.07.16.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:58:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] PCI: xilinx: use fwnode_irq_get() for INTx IRQ lookup
Date: Thu, 16 Jul 2026 13:58:11 -0700
Message-ID: <20260716205811.800920-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_135815_697084_4D1A185F 
X-CRM114-Status: GOOD (  15.13  )
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

Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev), 0)
in xilinx_pcie_parse_dt(). For an OF-backed device this is equivalent to
the previous call, but uses the generic firmware-node API.

Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ or
a negative errno and never 0 (it rewrites 0 to -EINVAL). Store the result
in an int and check for irq < 0, returning the error (including
-EPROBE_DEFER). This also adds the error handling the previous code
lacked, where irq_of_parse_and_map() failures were passed straight into
devm_request_irq().

Built for ARM (multi_v7_defconfig + CONFIG_PCIE_XILINX) with LLVM=1;
drivers/pci/controller/pcie-xilinx.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use dev_err_probe to handle EPROBE_DEFER.
 drivers/pci/controller/pcie-xilinx.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 4aa139abac16..58532296182f 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -20,10 +20,10 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
-#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include "../pci.h"
 
@@ -535,7 +535,7 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct device_node *node = dev->of_node;
 	struct resource regs;
-	unsigned int irq;
+	int irq;
 	int err;
 
 	err = of_address_to_resource(node, 0, &regs);
@@ -548,7 +548,10 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie *pcie)
 	if (IS_ERR(pcie->reg_base))
 		return PTR_ERR(pcie->reg_base);
 
-	irq = irq_of_parse_and_map(node, 0);
+	irq = fwnode_irq_get(dev_fwnode(dev), 0);
+	if (irq < 0)
+		return irq;
+
 	err = devm_request_irq(dev, irq, xilinx_pcie_intr_handler,
 			       IRQF_SHARED | IRQF_NO_THREAD,
 			       "xilinx-pcie", pcie);
@@ -585,10 +588,8 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 	pcie->dev = dev;
 
 	err = xilinx_pcie_parse_dt(pcie);
-	if (err) {
-		dev_err(dev, "Parsing DT failed\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Parsing DT failed\n");
 
 	xilinx_pcie_init_port(pcie);
 
-- 
2.55.0


