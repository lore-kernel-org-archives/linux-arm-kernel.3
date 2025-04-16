Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB06CC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n/CrHWu7/N0JbLzLhfGyYLZ28eCk9w7x/JfjK48Yd84=; b=k2iQX2SKJJxXJN87X1DJsEQRlx
	UVoURguv+OV5sTC/A0sOvIeDqPfhvaPQfA5Fls+Mv7hds24YbhK8smDRyvfvBf8RZYBDjE96LTTSN
	VaRH91wHha7QGJwe5HoIGPTZoZU4mxq7Cjbcs7Q3BeZbw4zUjyVMI19qNqSPHnawFGCSBWBoSqCqc
	hVtXR7t+NYz7DTLOjUJBRW3atvOdKdoGXYqveMpJSDq6fndB8m2ODaBsuy8HTNwI+fjMEbHwBA5Nj
	6H2wXHXSYe1WscliN1eGrDvrlXgOjsHiq805thFzU7pRqrf0TAFVi3pSFMtXlOcSjQJGiNoOG0O8F
	zVpvPG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54vy-0000000A7YA-007X;
	Wed, 16 Apr 2025 15:44:18 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Yg-0000000A3Dh-1VY4;
	Wed, 16 Apr 2025 15:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=n/CrH
	Wu7/N0JbLzLhfGyYLZ28eCk9w7x/JfjK48Yd84=; b=VNOTY+dyHQg0QwO0e8psO
	1EQh2MMGJQGnp3gE7RZOKgtSb5zfsTKfHHKKCNbUzvitXSSl3J0y5cC8cALMA47X
	7rtM7Qw4JcH2MELzQEd1xPDKl+z/3X3mmD9+ZB+q/60izYZ7rlG28v4v628nHscN
	aiAFBgX+VVteVApJxz5dW8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDHrr6Ayv9nGGzuAQ--.32225S2;
	Wed, 16 Apr 2025 23:19:29 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de
Cc: manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	thomas.richard@bootlin.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
Date: Wed, 16 Apr 2025 23:19:26 +0800
Message-Id: <20250416151926.140202-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHrr6Ayv9nGGzuAQ--.32225S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWrZFWfWFy7CrWxtryDAwb_yoW8Cr4xpa
	yDAFW5Ary5GF4agFnrC3Zxur4rt3Zayay7Jws3Kw1I9Fy2yryDtFy3urnxta1fJF40kFy5
	Cr45ta40kr43Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pELvKUUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhAxo2f-yS0qIAAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_082015_170888_665BCC02 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

The RK3588's PCIe controller defaults to a 128-byte max payload size,
but its hardware capability actually supports 256 bytes. This results
in suboptimal performance with devices that support larger payloads.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index c624b7ebd118..5bbb536a2576 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -477,6 +477,22 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void rockchip_pcie_set_max_payload(struct rockchip_pcie *rockchip)
+{
+	struct dw_pcie *pci = &rockchip->pci;
+	u32 dev_cap, dev_ctrl;
+	u16 offset;
+
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	dev_cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCAP);
+	dev_cap &= PCI_EXP_DEVCAP_PAYLOAD;
+
+	dev_ctrl = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
+	dev_ctrl &= ~PCI_EXP_DEVCTL_PAYLOAD;
+	dev_ctrl |= dev_cap << 5;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, dev_ctrl);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -511,6 +527,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 	pp->ops = &rockchip_pcie_host_ops;
 	pp->use_linkup_irq = true;
 
+	rockchip_pcie_set_max_payload(rockchip);
+
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
 		dev_err(dev, "failed to initialize host\n");

base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
-- 
2.25.1


