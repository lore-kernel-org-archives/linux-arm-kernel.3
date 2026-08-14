Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF43C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WQJMGbWRZOZBiV4wbORCXaxh+L+ZkfgBfsK0yvrgZEY=; b=rUjFncBKinUdeDvEYr/i5Zb2tZ
	JSIfyNsFTVGYFXdcaa3i2YotBn9R28OOdZ8EIfGZXyMNSJmraqaU/t+dI3C00DqFiKReT/VyuarLk
	0TyXSXFWtmpMZ4aDW56/seK6alBxFhFtSNIX2ud0fBCXWms6pTjiTh7Y7TVjv+jKhsowZLXse9xKu
	aYfvMzDXZ3WkFtbrztXJIo2FVwKMfjdHuRMMo8pobEdHYVhLdLavQzDRrPRkHA254AChyreTtSr73
	wWD+1sQ7bANc3HZz9vvCZp2rS2sTuWn+YEXbeCOID0Vboahw2j3CTEAsMbf90SJulF7zN1SNZndNs
	5e90ks3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusA4-00000002jq4-2ioi;
	Fri, 14 Aug 2026 13:41:28 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusA2-00000002jon-0qeW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 13:41:27 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3811f512167so1353850a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714885; x=1787319685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQJMGbWRZOZBiV4wbORCXaxh+L+ZkfgBfsK0yvrgZEY=;
        b=OQPe46f6QiWFI2RmD98V5jtIp9rBpzRq6w9+jUzmoeK23HYt5v8NhvsU+eTJ0N437R
         7s2225p/LmZ5/VzCUzE1pCl8nM97W/9V3Mbb8odP/1Zt1DeYLaI1GYYOhRSy0RhWpCAd
         hmoiiqXAUbRaoK3jFCcArnHCcJpRVEfQFZXWL8QzSbAwZ4Mrg2xRX4a9Yn8ncpFMWMHy
         kUILSDKpcIE1q88nvLWinf4QvDB73wCmPy5QMxyal3DFjZNXqai6AWlQCz4SorxC/tmO
         vJBCw7Gqu3CIwOvEUa4WobOvHhsCBR2x1ZiiJnsP6aLSIb4FvNCbHVSc/gAVlQHpM3c9
         mkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714885; x=1787319685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQJMGbWRZOZBiV4wbORCXaxh+L+ZkfgBfsK0yvrgZEY=;
        b=jl4dHhDw2rCGD5Zw34S/23GrYffIMENEEX4v83K4TmVcKs+3gmS2yGHc/Q1u8AWYZZ
         6O7ywBr5sMcObfFQoRHUVaeeFv/f/XxwXFky99FfLGbwrC15/dLrtq+s5QYSJ+619F8A
         XX/GIpr5rrvBZTTJRCGV1sswfmM3WAQTLVdx34xvOibCGEHvCu5qHhcqaxDbV1LUcCcV
         c8LxQuTgpQdy4s6btw2gb53Tpbx+4Qdacr86JYhV7vTJtOgoGr/J7K7Myz6uwx+yWz0p
         NCEEUbs0UA6AXx9jomQlnqvK7s7bbbb8+Vmkfw3wlR5rBmnfIkB5ZXepdD+fxjO9NFu4
         NVXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpT8o2828R7i+bs6iirPavncbNhVH8JipllgR02l2Agp4s+Gc0xwZnH69FcaA9tB8MUCDivU+4aaahB7XpYv7NZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwtnauhKVzHPA1q7YqW5E1FYACtF8EpTPIPIsxBUeGB+uEgrWG2
	b0wJmlAsnU89ASBHjF8/hYUL6DG62nkOze0tgu96HAJkC2AWhMw7VCFT
X-Gm-Gg: AR+sD11/a7fOVExPSrz/YhZo4zwwhmJo9Cznh1Du+U6Pa3yKZLkP5t2WgXPQB5/Yc/9
	nKqvQT63GoF3TifETSGNGzTWI10ijDfwZ55QQgQ+pSwOeno4cEhGIqTFFTmyjrtH3nHqPlQwREU
	cSfz0p+aDlaBIgi+eq+qoYitobRs8O+H6DCaxI9n4T6oSbP/g2ScG/suoAaVCTtoITV49gBQFlo
	/mhHR8k1hkxTuQbgQgnLBtQ8jHSDqp7eDupKKOZaitkSixFz+ikRWvWC4lfvpKcMxqyDkd4mFpd
	5fVQVaeGbTyJ2LlN21Fb+8kyWxLU7LzxB3gsQbi/XUYerNvqsKAo68+Hwr1pqkOezwkPnQ3WNE0
	3PTx2xZWeVoShj+DvxD35ATHVjEzTQdYr32CcSgZHtZC28Z90G0KKur/bUKzBLgbAwE5kUD3yQX
	J3HyE3q4Mmdq7OWJJDnaSigT1g7G8ZWLSiccoTEnsNoSY4nUzTxRVc55FhtQHs2JC0pBDgu8bCk
	GdsvR+F
X-Received: by 2002:a05:6a21:d86:b0:3bf:a7d5:df38 with SMTP id adf61e73a8af0-3cc71b41dcbmr7176522637.9.1786714885326;
        Fri, 14 Aug 2026 06:41:25 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc095a33f34sm642128a12.22.2026.08.14.06.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:41:25 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Liviu Dudau <Liviu.Dudau@arm.com>,
	Tanmay Inamdar <tinamdar@apm.com>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] PCI: xgene: Fix device node reference leak in xgene_pcie_probe()
Date: Fri, 14 Aug 2026 21:41:18 +0800
Message-ID: <20260814134118.1387742-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_064126_241585_A0D09A26 
X-CRM114-Status: GOOD (  13.66  )
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

xgene_pcie_probe() takes an extra reference to the platform device's OF
node and stores it in port->node. The driver never drops the reference,
so every probe attempt that reaches this point leaks it, including when
CSR mapping or a later initialization step fails.

The platform device already holds the node reference, and port->node is
only dereferenced synchronously by xgene_pcie_setup() before probe
returns. Store the borrowed pointer instead of taking another reference.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 5f6b6ccdbe1c ("PCI: xgene: Add APM X-Gene PCIe driver")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/pci/controller/pci-xgene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index b95afa35201d0..cf9760f3a008e 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -627,7 +627,7 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 
 	port = pci_host_bridge_priv(bridge);
 
-	port->node = of_node_get(dn);
+	port->node = dn;
 	port->dev = dev;
 	port->version = XGENE_PCIE_IP_VER_1;
 
-- 
2.51.0


