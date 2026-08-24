Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BC8C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 23:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WGnZD8PU2ZM2OuEJ0fefI9bGemjyRjfKxbkU0KSOSbI=; b=x2LO1YD0mRqa6HscdAEKVjRGTj
	crb1Dc//W1g0EYZ7AiTqidXunQVj0mOAHXPG+WFlfwLAgzi27AQy0PESXbXRVi6Op5xr4ja+ma8/T
	KFEEGw2Srl1YlhvOcJnFqFW/uJtvmz3Ywqh9ZFsAu2+H1BNSOOYds+i+LR5aR4FOSjJRcG7/RRXVX
	KrJDK9rDGpdNkXTDpeIcV6yAXWIteM4rhaoLHuqW8DOiSvV4IiznJTOykLzuWTF/MsVpQ/pnYC6bb
	4lJjy0FRQNJ0eqd1ejwVqv16rdGH0TeL3utMAQJ+/VZOAhye6XJQrM+gwiAWcHwKEn49k+vCVrvMR
	zBqJRpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydil-0000000HTkr-0lz6;
	Mon, 24 Aug 2026 23:04:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydii-0000000HTkU-00I3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 23:04:49 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cbedda4c154so2517542a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 16:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787612687; x=1788217487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGnZD8PU2ZM2OuEJ0fefI9bGemjyRjfKxbkU0KSOSbI=;
        b=sLb8dymSa/dBygxihwCD5YwcDKZlqP8oTaf0hM+Iuh8kRSnJTZdgqfHnhmKmf2icgo
         5PgxTYzvsNzb3WY89GPLnVIApt5UZ3u023QK/XXNLd0Qw2lR3aE27h+RpTnMtfXQOaWF
         614vY9NJBzkZSu1th/cJEeokyI5y5ysgbzL4WR8huPwprQbUZIeTm59Rn8EHT/aKh2Qh
         Z+RjvjEnCqfVyxd7AJcu4C+ej9CXVdU9JjRB03MO6Lk3c4GS/5xUmEspFm9xH+6SPch0
         xarYvcodDdpegyyxiQnhc3XF3fBa5oqUinNKXEdeG1qubn3i3TPKsD6Mrp2YdSIi+UWC
         27MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787612687; x=1788217487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGnZD8PU2ZM2OuEJ0fefI9bGemjyRjfKxbkU0KSOSbI=;
        b=YpYYODYNf/t1tKZfI58vLNxOEWmPpfMAYzoMfJjyvmnHR+IHLPMgjhJIEyldsneAsy
         V01U24jBpAp9aCQpjOO+vZ5Jra5+VGEtKCvX27PW1vsS4rEsKKHBo0L/UeXxF0iXFoc8
         4UnF3uUpCGv7rqV+99lVObhoUiNrQhQsxnZT5K8WY1jrU6UAZ6K0hEjadCIx1UWVn1OA
         scSHRnGoBWYaHU9++pkghK+RpaLM2rAwfNz0NTczMUGMWMWy4CCdGGswWF8g97d5FicC
         TuL85XaznGeVKkZ83ImmK/BflXMMRGpomBuRVFIqBLgxuHuKP/4FlMfBrzge5RsMCpb2
         DCVw==
X-Forwarded-Encrypted: i=1; AHgh+RpsYXOv75UUXNpICyJeoPZc683A6NrcWq2E6IyyQIusjpSsmE9IlnxveoFszQVGJtPFv7kpCd+R9Or9EM/uDW/u@lists.infradead.org
X-Gm-Message-State: AFuF++lOOPo3Fj7e3pnf6yxV8puG0Eijyt6KMhnojvB688e68v2dxkTy
	R8Z+QSbkcNnAj+RSDPGNQjIG4kvQtUN78SgWuXw+uZ7/k3TJ+EXbRNOF
X-Gm-Gg: AR+sD12S6v6zCqKRbGK00moIDRMqfiJ83DwDZQjDPZDlzUP63TUXtzpRcTEVIGc6hQz
	ZbFLkHsfG/bLuemBrD/3NUGfgZxvIsNj7YOSEHxdXqn+Q6v5SYv9gTlNp2QTrAsLJqzeurtm/SX
	Qty/dNJl7V7LMLaBJVWdpuef7upJAfMVga23vaTqRN9oQLcZvKtgLTHGju7LCItdf1Z69CYMM4F
	/0C7g/HiuzubsO5IXDtvLG7tktwlXL0GOxwf6TxxtP3dkK7La4q35kIEjtTTxWydYWbA/jK7KZS
	IthuGkxXQtRLuBRpRi10w2bDfzw67hEIiS15g3WHdCJx54IBFg7719cT73dbtW2ar+T1zqu25P0
	8geYPtsBg4jIMNlIy2qyweO+UcRRMN7R06Z/cWMMifv0SVBPa976waUZo+2RyXe+T/CavATFIjl
	B9n+NmYwjLKj/rJ2lP5xCqz9Tzm47Kp7W5TtMURQICqUuZyGGQZrmVhENq1G0t5+T+LTGqnsvVc
	b2CPgQ2eE4/MpMf9+yQGDSvX50sJKTuxvpvRWSM125zdPdfMxTl
X-Received: by 2002:a17:90b:5745:b0:380:f389:447b with SMTP id 98e67ed59e1d1-396464ce7bcmr4294356a91.11.1787612686607;
        Mon, 24 Aug 2026 16:04:46 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b39efdsm1214065a91.5.2026.08.24.16.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 16:04:46 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH] PCI: imx6: fix endpoint init error handling
Date: Tue, 25 Aug 2026 07:04:27 +0800
Message-ID: <20260824230427.3649829-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_160448_045341_79BCF789 
X-CRM114-Status: GOOD (  13.02  )
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

imx_add_pcie_ep() ignores the return value of imx_pcie_host_init(), so
a failure to enable the clocks, regulators, or PHY during endpoint
initialization goes unnoticed and the driver proceeds to initialize the
endpoint against unpowered hardware.

It also returns directly without calling imx_pcie_host_exit() when
dw_pcie_ep_init() or dw_pcie_ep_init_registers() fails, leaking the
clocks, regulators, and PHY that imx_pcie_host_init() acquired.

Check the return value of imx_pcie_host_init() and jump to a new
err_host_exit label that calls imx_pcie_host_exit() from the endpoint
initialization error paths, mirroring the root port path which releases
these resources through the dw_pcie_host_init() framework.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260824152857.DB9771F00A3D@smtp.kernel.org/
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..1dad93e9d 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1634,7 +1634,10 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = pci->dev;
 
-	imx_pcie_host_init(pp);
+	ret = imx_pcie_host_init(pp);
+	if (ret)
+		return ret;
+
 	ep = &pci->ep;
 	ep->ops = &pcie_ep_ops;
 
@@ -1646,7 +1649,7 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 	ret = dw_pcie_ep_init(ep);
 	if (ret) {
 		dev_err(dev, "failed to initialize endpoint\n");
-		return ret;
+		goto err_host_exit;
 	}
 	imx_pcie_host_post_init(pp);
 
@@ -1654,12 +1657,16 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 	if (ret) {
 		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
 		dw_pcie_ep_deinit(ep);
-		return ret;
+		goto err_host_exit;
 	}
 
 	pci_epc_init_notify(ep->epc);
 
 	return 0;
+
+err_host_exit:
+	imx_pcie_host_exit(pp);
+	return ret;
 }
 
 static void imx_pcie_msi_save_restore(struct imx_pcie *imx_pcie, bool save)
-- 
2.43.0


