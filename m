Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5889C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgf9TKVShsbgf58T+DVRs7PUBhUxrsl3Z29fBsYWAlg=; b=zLBkXwz+KwZwT3p3Hd6BKOONRQ
	+rko4SKqXFEchS2TcXEns7kS7t1csSkh3lBPUwY0kyN2yCvnjx4CUsEsE2uma2H2ZRx0M2+QZWbM0
	pyDpJaTPM6rkItF99B+nVAiRYkq7hRb+fumhJsV7NEvkm/xUIFIsSqnR+m9aBTKMFGXkSqfg9W/ca
	cmg6pxmDF8PIU9pRH35stP+UVrQrJ0HFnuBnLcTkaf7I4aVhZracGDnzZv+oA8he40gAWoIgZC+JZ
	pJl1UKBoofxG099Ikx0Y0CX6Jrxl6C9hfdKABBn5BkqzWNuDsSYzI9Ut/nYaTNMx/xThoTkFG1ZIM
	dm8HIl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhMn-0000000FqVJ-1ABh;
	Fri, 07 Mar 2025 23:44:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhGR-0000000FpUF-0Ypw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 23:38:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95D655C624E;
	Fri,  7 Mar 2025 23:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84F2C4CED1;
	Fri,  7 Mar 2025 23:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741390678;
	bh=/Vd5KWvSiGu6/wCPX+6AfloWDVGSa9tpnOhgexIbXEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Acw2g1gVGlLFYF0SltDeaIZQ9KwE6vcOMVM6luvqFnf40847eeFswIpbIcKP7nYmK
	 kLfy9MxLzQTzSH6s3Z89HAKeYyAkRWntv/8ABqAaA448ttme/dLea5kZsaYAmqFFP6
	 ewMoOpEu5OkfDAbLuh5EASyV3tIAxSSUSiaBKwXNsmbTY+PqEmSmd/X16B+bxvRwXa
	 9F/AJYwbCjcu98r6x2PN4GM8JR6ll0mddTmGzUA4jduF9Jzp4gcmcMbI/9IvFdElM6
	 jH8I65HYqEKV1VKtGUdzKPSm++TdZHO7sRTdZkbXMfSAhq3YKLvpUe7U34881mIz0B
	 r8S0mvulLLNqA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2/4] PCI: dwc: Delay cfg0 setup until after discovering bridge windows
Date: Fri,  7 Mar 2025 17:37:42 -0600
Message-Id: <20250307233744.440476-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307233744.440476-1-helgaas@kernel.org>
References: <20250307233744.440476-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_153759_222346_2165631E 
X-CRM114-Status: GOOD (  10.22  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

devm_pci_alloc_host_bridge() reads host bridge windows and any translation
offsets.  Some .cpu_addr_fixup() implementations depend on the window
offset, e.g., imx_pcie_cpu_addr_fixup() uses the offset of the first bridge
window.
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index de2f2dcf5c40..b9eaba157dae 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -456,14 +456,14 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
-	ret = dw_pcie_cfg0_setup(pp);
-	if (ret)
-		return ret;
-
 	bridge = devm_pci_alloc_host_bridge(dev, 0);
 	if (!bridge)
 		return -ENOMEM;
 
+	ret = dw_pcie_cfg0_setup(pp);
+	if (ret)
+		return ret;
+
 	pp->bridge = bridge;
 
 	/* Get the I/O range from DT */
-- 
2.34.1


