Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808E7E7717A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRLIt5d1/A4ZOOeQUQzKPT0zGl3jGkVoWMEsQ7npGKQ=; b=1xBDVCyNqQ8kVMfcblABI1yleC
	hJ1DwREyNhEeXq5fdxgyG3Y8pcIX1alxeu43sqtfOYD7CBWKUrpGDcWcAJ3Kwpf82+i9JXL0i12HA
	knT4gYTMVDUOkADmdfNPQ4Lxxj/HQZwrKfD+yumqHVqXZi5osss2S7/wV8qyo2vzo9dCBObwAwipM
	VqyfjxybI9o/L3EpfnU12CEoAyx5PtZUGl6SL1HhvsoZK35QZbcdSPl6W16gmzSgiel8/TUxn7O2u
	WzD+DxWrLnD8BMxDI0j8T8QeZnq9HpxihMtnIIu6y/A3XCp0Q6IX2iyWvN2IxEn8BpVqPcEQ7Zw50
	q5fz2KIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoxU-0000000Cb4H-2tQE;
	Wed, 04 Dec 2024 12:58:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIole-0000000CYTl-0ej1;
	Wed, 04 Dec 2024 12:46:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D71E9A414AB;
	Wed,  4 Dec 2024 12:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BA8C4CEE6;
	Wed,  4 Dec 2024 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733316368;
	bh=dzDLJ7+3sOK1+LLKU8zZ5pSubkCmnjrUQs+PsTqG8a8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgS00sP6aZb9lBTEEMSsEXriSrvPibb7kwIbC2uh2yLKZ+ks+/sPakVinph2cf7yg
	 ArtIt0FeWQmZnN4owZpv2/0sOv83fqNgBRU7l0dnCLxZC6XhG1FMqjUINjPo8SY4Ie
	 QR5q83jiV6vll5jFqLjiTDnBLZMdlLQErFe39jn0M7Npu9kJb5nH5z4w1wR1ktJ16K
	 3GVn/83z+VygVRn7F6AEozLe3O2QGnZ8drfhoHNquC5AXDWNPtoyTgMEArlHb0E3m/
	 dof5S7+cu6eddgOhQC/fTIrwq79kUAiOgLg4LLID7Ip8W4vOk6zsDC0Z/ifx5R+WeD
	 H2DEN6HIN+icw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIola-000RHy-HV;
	Wed, 04 Dec 2024 12:46:06 +0000
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
Subject: [PATCH 07/11] irqchip/loongson-pch-msi: Convert to msi_create_parent_irq_domain() helper
Date: Wed,  4 Dec 2024 12:45:45 +0000
Message-Id: <20241204124549.607054-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241204_044610_317864_F39DFBAF 
X-CRM114-Status: GOOD (  12.88  )
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
switch the Loongson MSI stuff over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-loongson-pch-msi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
index 3f6f4e9887c53..f15528f76a647 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -158,20 +158,15 @@ static int pch_msi_init_domains(struct pch_msi_data *priv,
 {
 	struct irq_domain *middle_domain;
 
-	middle_domain = irq_domain_create_hierarchy(parent, 0, priv->num_irqs,
-						    domain_handle,
-						    &pch_msi_middle_domain_ops,
-						    priv);
+	middle_domain = msi_create_parent_irq_domain(domain_handle,
+						     &pch_msi_parent_ops,
+						     &pch_msi_middle_domain_ops, 0,
+						     priv->num_irqs, priv, parent);
 	if (!middle_domain) {
 		pr_err("Failed to create the MSI middle domain\n");
 		return -ENOMEM;
 	}
 
-	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
-
-	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops = &pch_msi_parent_ops;
-
 	return 0;
 }
 
-- 
2.39.2


