Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3304E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGbg30tXac06ntau2vO84XHpNJ7dVxTwyx/ajo/s5pA=; b=wzIVUccvimpow/7YVTEhsrhyQz
	9if7bUGu/5ReYa7kjuyOjv6ierPXgBnu4QlQhOIizsZaUK6V9mf7XYf+57NkNVeL2+ag+3P6N2TRb
	L3P/eePv29ajB3J98RBbqmCiES+g6CSyx1DntPzQCDMEfB4E5jyzNWIN8DCpS1fVVJnAE07IjEJX6
	aOzcCAj3BpbCnkODQ/P1w0N/3RY7A7pRLKwDoQJfnpg+CGJjz17nktaG30OujDT9YXx+Hy9jjqxMv
	U/B934KMXORIc6nmWJlGD3SSWCN9Cuu2IiXohOWACdS34JqnJm3DJexaie0OeAyjIKnIzgT7JUzry
	c0Z2CvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoxT-0000000Cb18-021a;
	Wed, 04 Dec 2024 12:58:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIole-0000000CYVq-48fp;
	Wed, 04 Dec 2024 12:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49C4BA4155E;
	Wed,  4 Dec 2024 12:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A20C4CED1;
	Wed,  4 Dec 2024 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733316369;
	bh=jTOd4yz8gsuLBweIwiSBdwKwzbJR5VQQ29Mpm+esKEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CULY6W2hnlcApn+/5dZASAOALgPuZhsI6jjUFBPT/KJ4ZfGZ8cg2cY0v2WPWXw6nj
	 UEqSb8sUxBAWecBR7EgPWt8x6JmNdKSKaJ482+PLQOIbe6e6zESQlFhbfh7CNVGVvK
	 sEgJAGLobF58pVXznkLg/CSHhKgTYqLHVRs297eOuTbEbhnl5rRYTHyTwLA7bCo8W2
	 08KIz3JsqETuv5CRfMHuLcVVYQujMbTCjqTnxFqwH7Aza2uyvJFK3v3LpYL7d5jPq8
	 kjrDyCmIO55v8pnz+xj/oPioY43885lOvqe/shfmGGL7/wUwpDCB/tsrnxjic4aflv
	 Ll+SNoL+RA3wQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIolb-000RHy-BS;
	Wed, 04 Dec 2024 12:46:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 09/11] iommu/intel: Convert to msi_create_parent_irq_domain() helper
Date: Wed,  4 Dec 2024 12:45:47 +0000
Message-Id: <20241204124549.607054-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241204124549.607054-1-maz@kernel.org>
References: <20241204124549.607054-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, joro@8bytes.org, suravee.suthikulpanit@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name, jiaxun.yang@flygoat.com, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_044611_174266_53A924C3 
X-CRM114-Status: GOOD (  13.09  )
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

Now that we have a concise helper to create an MSI parent domain,
switch the Intel IOMMU remapping over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/iommu/intel/irq_remapping.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 466c1412dd456..7ca3ee4c985c9 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -557,21 +557,16 @@ static int intel_setup_irq_remapping(struct intel_iommu *iommu)
 	if (!fn)
 		goto out_free_bitmap;
 
-	iommu->ir_domain =
-		irq_domain_create_hierarchy(arch_get_ir_parent_domain(),
-					    0, INTR_REMAP_TABLE_ENTRIES,
-					    fn, &intel_ir_domain_ops,
-					    iommu);
+	iommu->ir_domain = msi_create_parent_irq_domain(fn, &dmar_msi_parent_ops,
+							&intel_ir_domain_ops,
+							IRQ_DOMAIN_FLAG_ISOLATED_MSI,
+							INTR_REMAP_TABLE_ENTRIES,
+							iommu, arch_get_ir_parent_domain());
 	if (!iommu->ir_domain) {
 		pr_err("IR%d: failed to allocate irqdomain\n", iommu->seq_id);
 		goto out_free_fwnode;
 	}
 
-	irq_domain_update_bus_token(iommu->ir_domain,  DOMAIN_BUS_DMAR);
-	iommu->ir_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT |
-				   IRQ_DOMAIN_FLAG_ISOLATED_MSI;
-	iommu->ir_domain->msi_parent_ops = &dmar_msi_parent_ops;
-
 	ir_table->base = ir_table_base;
 	ir_table->bitmap = bitmap;
 	iommu->ir_table = ir_table;
@@ -1522,6 +1517,7 @@ static const struct irq_domain_ops intel_ir_domain_ops = {
 
 static const struct msi_parent_ops dmar_msi_parent_ops = {
 	.supported_flags	= X86_VECTOR_MSI_FLAGS_SUPPORTED | MSI_FLAG_MULTI_PCI_MSI,
+	.bus_token		= DOMAIN_BUS_DMAR,
 	.prefix			= "IR-",
 	.init_dev_msi_info	= msi_parent_init_dev_msi_info,
 };
-- 
2.39.2


