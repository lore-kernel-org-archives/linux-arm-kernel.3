Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC10E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdd8u5wjfE9hm8ngWpX4H/X2z68nPKRah5OeOMFt95M=; b=tb3JbxZiUj11ZdHYwAi6B6SHiu
	qvbPFoaa03H5USFYZDLszefEbSX9+mofdV+ZUtJNUUmZdk/oOYEtubmN6Pg9i+aTDfm0L0oOqAQVT
	xs6MjrGkOz4ROjVktgqHO82GveU0PJZLQGjsP+xeukzUIbgE5TKLlRNiCdiqoNzOC8YlZl6SSzwvl
	GOzsErL2pbKt/agENEWytpbiOVOFtl8njxTMlwKKPSe9QVlh6mDjtIM3M2yYO1lhGGsij3SjQhuB3
	LuVdRC2e8hubZrYKe697Kl3dHZbsexHKAAWcTNB18GDOM2PbKs0gu7vezkbKhXLA/7E5OvqcNsox0
	kYt+iHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoxY-0000000CbB2-1K0u;
	Wed, 04 Dec 2024 12:58:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIolk-0000000CYaX-1xPk;
	Wed, 04 Dec 2024 12:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kdd8u5wjfE9hm8ngWpX4H/X2z68nPKRah5OeOMFt95M=; b=F4M4FVmUywmsurrd4DRzffGPD2
	YN3HAtmtVjDckHTwNUI95M9KR6C2qAZ8g4eBdM78RbLbfHhDzgUCg5qyH64it6QPXDZPwFss+ifqu
	JjulpdV1SPDh0xYQSn09WF33EszDA7q2gobSNj8p83pQ/D0nMVoQnwdXRvuz92u3LYb73ke78HcEB
	jJ7CyMRPxRGjJWUPX4JLs8OIZY/AEFqBl4PNwybqidm3YCtasjEc9JaQCqAlQtV3GWulydhvi7/CW
	DIoHPP3fTnqAlhOJIQxDrHpFncYAHIro0ixeE0zse+IlreEDOwOLn2F9jLA4857+Qgx6ARsvCRi48
	ajArsHuA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIolh-00000002b0x-1QyL;
	Wed, 04 Dec 2024 12:46:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1AB83A4156E;
	Wed,  4 Dec 2024 12:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D11C4CEF0;
	Wed,  4 Dec 2024 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733316369;
	bh=fe7lcwYFLHBQlBhA2vl7mVVQ+yJKY96ww+J3jQMWUMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aZ8F6XZ1jy1YAPBfD0GJUsQfKs6WAGdDjBmy3WMPnZtsAOCQ09o2+zJ5+/IDfupxX
	 1CvoqQzxawCkVsfT7HcPKGBI1tnwRDx85aq0+g+9EbLcAUUoWyCQ+bsZ0Z7sEmv5sk
	 yJamHY22kaLLJUh3a2rWo8wAvoyHW9PIECOuzBN1R1evqkNSpfceaZvmBRQ6qUI7aG
	 GBL7GPwGgWnPaSvBmW5idoJAlN7ZRIXpR+K05xjuskL4r4TORFFgtNrQu/80ZaS/y5
	 izlQSB47BVmpM2FhAtgm3J+7AX4EBTSqy8jlbkWiN9p00N1bHtROHf/8UKFDWnY8tB
	 lPjqOGdodVZFg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIola-000RHy-VH;
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
Subject: [PATCH 08/11] iommu/amd: Convert to msi_create_parent_irq_domain() helper
Date: Wed,  4 Dec 2024 12:45:46 +0000
Message-Id: <20241204124549.607054-9-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241204_124613_727762_B0A38DC6 
X-CRM114-Status: GOOD (  13.18  )
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
switch the AMD IOMMU remapping over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/iommu/amd/iommu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 3f691e1fd22ce..8137674aca51d 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3807,6 +3807,7 @@ static struct irq_chip amd_ir_chip = {
 
 static const struct msi_parent_ops amdvi_msi_parent_ops = {
 	.supported_flags	= X86_VECTOR_MSI_FLAGS_SUPPORTED | MSI_FLAG_MULTI_PCI_MSI,
+	.bus_token		= DOMAIN_BUS_AMDVI,
 	.prefix			= "IR-",
 	.init_dev_msi_info	= msi_parent_init_dev_msi_info,
 };
@@ -3818,18 +3819,15 @@ int amd_iommu_create_irq_domain(struct amd_iommu *iommu)
 	fn = irq_domain_alloc_named_id_fwnode("AMD-IR", iommu->index);
 	if (!fn)
 		return -ENOMEM;
-	iommu->ir_domain = irq_domain_create_hierarchy(arch_get_ir_parent_domain(), 0, 0,
-						       fn, &amd_ir_domain_ops, iommu);
+	iommu->ir_domain = msi_create_parent_irq_domain(fn, &amdvi_msi_parent_ops,
+							&amd_ir_domain_ops,
+							IRQ_DOMAIN_FLAG_ISOLATED_MSI, 0,
+							iommu, arch_get_ir_parent_domain());
 	if (!iommu->ir_domain) {
 		irq_domain_free_fwnode(fn);
 		return -ENOMEM;
 	}
 
-	irq_domain_update_bus_token(iommu->ir_domain,  DOMAIN_BUS_AMDVI);
-	iommu->ir_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT |
-				   IRQ_DOMAIN_FLAG_ISOLATED_MSI;
-	iommu->ir_domain->msi_parent_ops = &amdvi_msi_parent_ops;
-
 	return 0;
 }
 
-- 
2.39.2


