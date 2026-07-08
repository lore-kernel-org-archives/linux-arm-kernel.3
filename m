Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B317C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RWwnnS6GeaolTc9bMDjJoioBxiXpdchd+xEqkloj854=; b=K8ePoKE2PsHFEYDGb+JSrTPVHT
	BQ/qCaQIGwWGs5OgZXeC6Ye8Zb5iRFmcDKXfOiMe1e6YLeWr5aDfYnk5V2Teo8i248mNYgrNznOkG
	VmgQ3qkJCjNeQ5Serb57Um0po7q+OUZVO7rHFy2hzFYJ0k6VraH39N2yGs1D58QG+UgU9zmAj1IXY
	cUpxohGwiUpHhkGpuV0o4ZS7iletkhV+QPCR3V6ePZCUd+DGssVsNyRg2BSBbFMxZQYJoReyS3KVm
	qc47YkjDh9sh3rgjV4fA/sbUigCd9O3NiP7iGukNAgvC7BJSE88C2/T4utS/Y7O6zuh64Hlkyck5I
	aAiiYw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP2p-0000000GnQH-3HAW;
	Wed, 08 Jul 2026 09:58:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP2o-0000000GnQ0-49Dd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:58:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9529D40935;
	Wed,  8 Jul 2026 09:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904611F000E9;
	Wed,  8 Jul 2026 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783504698;
	bh=RWwnnS6GeaolTc9bMDjJoioBxiXpdchd+xEqkloj854=;
	h=From:To:Cc:Subject:Date;
	b=h9aDP3qaagnR2LQYiES34wpJhH6BpLm1rDyCK1/kU+o2iPw9xoXYUyWD1pDFq+hFF
	 DtP3VWpsBT5QZ0eKeqQrZaLFSNVu8NLdBH/mBGbTtQY7w1JpzsntHQgqvWdvq1Nkah
	 HrmXFkyXFKhOq5l4NDjtwnJY4GZ16QVa/V6ZIdGuhwvBWTYUWAryOxWNTjXn9CHuhm
	 glJA1Fxh0YtkK/2CIRZ1OAkMgCDiU55aIZAYwg+ybMF6i6nL+LFEf2TyHhp6+jUOqp
	 SqBOae0AQ3tbOuSP8XiPXSQNum4YRitjWC0Ssp2EBpKRxKVzZ2IFmm/86Y3wNNqQ5k
	 VWXQ3kjKC9n2A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: bhelgaas@google.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jacky Chou <jacky_chou@aspeedtech.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] PCI: aspeed: Switch to irq_domain_create_linear()
Date: Wed,  8 Jul 2026 11:58:14 +0200
Message-ID: <20260708095814.385480-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

irq_domain_add_linear() is going away as being obsolete now. Switch to
the preferred irq_domain_create_linear(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>
---
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/pcie-aspeed.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-aspeed.c b/drivers/pci/controller/pcie-aspeed.c
index 9aa9e14c6148..74b03a55643f 100644
--- a/drivers/pci/controller/pcie-aspeed.c
+++ b/drivers/pci/controller/pcie-aspeed.c
@@ -725,10 +725,10 @@ static int aspeed_pcie_init_irq_domain(struct aspeed_pcie *pcie)
 {
 	int ret;
 
-	pcie->intx_domain = irq_domain_add_linear(pcie->dev->of_node,
-						  PCI_NUM_INTX,
-						  &aspeed_intx_domain_ops,
-						  pcie);
+	pcie->intx_domain = irq_domain_create_linear(dev_fwnode(pcie->dev),
+						     PCI_NUM_INTX,
+						     &aspeed_intx_domain_ops,
+						     pcie);
 	if (!pcie->intx_domain) {
 		ret = dev_err_probe(pcie->dev, -ENOMEM,
 				    "failed to get INTx IRQ domain\n");
-- 
2.55.0


