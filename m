Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62632CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 11:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ZOnoiE2DKIvu7pAJeB0Kwm8MPrikadt38XLviEq6Q4=; b=ESQR+6QBoT5atVOgUpeIcpBQjL
	qLqlqe0gQtDjH7ZWnj78nNwn1IZazXAxZ1CGcg1vYBdGpX6dPd345lcoTdCiDUWW0LbuLeKeW9pEl
	2eRCJ45R7uH3egiwFwQIU6+V5BEeIXu5ZtXEtOF3MRfq0TbxP3I910Vb3tf1Bcxhs03OHMDWVXj9v
	krJcQA6SRNvjGuJ4aBqUJZoioxrtr3LNpYObQQpf91Uk97SAvYuC2M60vgoWuugFGstVuiVQYLvVz
	qMU64O9wVUsTxFl1TYCTBNuEXAohX1mCNz1cW9j91xsyTlDHadKVg6+RKQGGdtghv4gAdRH8VA7To
	NRr6DYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXLz-00000002L0e-3l7r;
	Fri, 19 Jun 2026 11:25:43 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXLx-00000002L01-1JWE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 11:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=8ZOnoiE2DKIvu7pAJeB0Kwm8MPrikadt38XLviEq6Q4=; b=XIJuC/58ZEGzSSK7x0P1r0wQeO
	+XoGzihO/pxpDbg5Sle1IN5o74ISE/mCrL6/3CnJkSbqnKzYISZIW2e35injmZvVZD5RtymsS1kqa
	3Ngamxcb3VdbJPEREmqdMjjJGBd+ZRdzXg+RgDs0Cu31yHxz+mTpFitaThf+pjufUkMsrVZ3VknoW
	zuANJYsRzh6PUHUG5jOxd/q66t+UpgrTBwZFEczWcBKqlVkbrI0CaQLayN+O7RNZrqL7H54rh3ydP
	giql9zlH69efjHBUreTCbq35st+YQi4kH7QgxxRhsfH9GRUBpE8ClTOxxTnAS2tQ80F5iElRfHspp
	Gts+i4ew==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1waXLv-000Ow1-0x;
	Fri, 19 Jun 2026 13:25:39 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1waXLu-0003Nc-0c;
	Fri, 19 Jun 2026 13:25:38 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] PCI: imx6: Use dev_err_probe
Date: Fri, 19 Jun 2026 13:25:33 +0200
Message-ID: <20260619112535.1127850-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28036/Fri Jun 19 08:25:16 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_042541_348326_4C118894 
X-CRM114-Status: UNSURE (   9.62  )
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

pci_pwrctrl_power_on_devices() might return -EPROBE_DEFER resulting in
an error message. Use dev_err_probe to silence this non-error message.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 98e1db751132a..b7a502e9a1c59 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1381,7 +1381,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 
 	ret = pci_pwrctrl_power_on_devices(dev);
 	if (ret) {
-		dev_err(dev, "failed to power on pwrctrl devices\n");
+		dev_err_probe(dev, ret, "failed to power on pwrctrl devices\n");
 		goto err_pwrctrl_destroy;
 	}
 
-- 
2.54.0


