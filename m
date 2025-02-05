Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08299C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=; b=r4eY7+ZOwOVm6CoDk62lU+SOGy
	+zcWO1ZD7//KmfzjwLWTrxujTlhWpsedA7ZT7tcU6jmEL3OWJcQOQaIj2PgNdkZN8ZHVW9CzhovfP
	w4/lI0Sghyt67eUUj5U1MeQIkOFhmGsokf8sVx8FppEOWE46T126pplY7TYMtQlRrmd3R76WZY/ng
	/B72uKzBmhYHXl17kykzNejCTUnXL7hZn2NkSE3C13a+Q8IjiXErHDiujAXmZyStog2MUfheN5UIo
	Amn0LVCWcVW119lBzoMOoJcKL1geT0P/MlWQ9OFe5QWefqZ3FML1F/tEQXjC7ZE6j8fG0tr243X5V
	D5J+AcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhvE-00000003uFc-1iiy;
	Wed, 05 Feb 2025 16:06:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpA-00000003str-3pfS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=; b=YJX1f/P0wAykWmRvqmGiRoTyWH
	CI0Cq7Ny903Tpm+l1NuhN9Rr6ENuJA7YjpDIyUSy6aWYE2c4AtK3UbDOK2b6QHm+uW//GOS1bdNag
	fpnOELK2t6z2ASo4FB3OtQM9wPNkAN2hZuQDyanxmTWEI5tJj8iElNfGr+n2bkj3iSEuS0/F/Xzu4
	YNL0wJArLVN8uHSY79Ph3PakHOvxGtcV4PXJ8yHlcVtADrZgKmI99gBcGXQUCvaJftDa2Yj5gkkln
	3FIaCEQXHshC2NkrHXXOBIc5iqXkWfv/O6WqYX12zquIR6dbzjQ1qw3HfDDUFR6jLSw6GCy3/Acp8
	eZDbdkwQ==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhp8-0000000GgMM-0dAN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21f20666e72so11158895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771221; x=1739376021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=;
        b=nl/PUlBCLxVNC7tgb0QnnyslUK/An1ZWyTl30Y5iPsBEXzNiQcD5hWUPAbyCxD8wU9
         y/+tWSZ/wuePd7Q5WYHfvGx0iNss+n2jnTn1ecV3Jppzp+B+ownT0bz8v3rIPKCeNrDD
         WBSzRcSGNfYGXbwPVfoU7H/Z+NKFU/Mz1Pk+Dhxpg4U327CxY35GCUNPHxVdDE90S0vC
         zE098/qI0GoW3OOtuTGqWEqMGoHVknMhgFAg3zJcA4+IFqyjE37KoABMvAfQNBodUwHa
         lkVTIQDx65HCJ/PdXkIFnbk9aLdJLiE77OtqDHxQcxCLqFDqudmTunlGr94WHmLDZSgk
         FD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771221; x=1739376021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=;
        b=wZ4E7ifKgju3CB1eYKGqMsZw1lQE1ODu1Y4lkVKsB/mu38GT67zHopRyKBEiEFAtYZ
         gw+B42d3jNOpKtwqub/z2EamxVZCXG2vW+pjy4/bOErvi4P28JTx72Tl58G5YNCSbX0Z
         tL8EP7dBz5y/Fk0aOVToOPUr5cFDRrYj2Ab2DL7n/kXC8jIMLTsrdEtsb2Rc5qcDE3qZ
         7FGSkvomlCS3UPzEY1t9PNeW3LV2kfmf4fJ4572Q9P2TQsw5J3jqtqinr6JqAhxDw+DP
         emU6P/5Ju7OyJv5ATrabXvyYHDKXbrmTgtmR/SwHbAuENUNbTZNYNZuF96IDByG95bpR
         NUnw==
X-Forwarded-Encrypted: i=1; AJvYcCXddPV7mx4zzPsDqlnGnYUgUJqccf5Fr+TD4SckApVsDU0yK7uEOwCJ5aD0amRAXHv9Sy/peF7alai6adN0sHAY@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ//UNM0LwvdBcUn090UYOE+CuiLUlXSyCuQ+drj7Q9b2ndTyQ
	+LmF5DoWT2HkCi6UKNNOTvroMkolTZWpUgewphl1zcnQdTLEJUQu16Ex7LBKrQw=
X-Gm-Gg: ASbGncuSpabqSZkyL/QukGMJHqt/R+uxKwxy70SxlT5rO8n7F/WLNCX2z+6xtxffrpz
	J+ycywD1MlBddjzqAu0fq80Dkk0VoTXB5BQIEEDC+zjsnJJeraB8LqPbeUxnosfjBNXDVq9yl0S
	X014p5LQAB1EFjSn0zRDhmajowzsdRr4N38qL33nGhzCiKm+QbGu0TKyc4/zyH5SGX3VmUCUIVj
	APHCMT9VR0fiBzZ83LIsdgxsBVJjYSBBONASc3xrGy5n6jJpbrrDb/yzJ2/UOh2Y4tu/uZgm70y
	5P8DEha9jUs6pwKrAvST8CsCZovLIx4GfyQ8M2YeDX3WSo+AcY3fPfg=
X-Google-Smtp-Source: AGHT+IE61901PT4EUuxStQafEIq8FwJCGiiY6kWb9NQ321aRytwKILvXZvBacg0xie4XwDelkjOESA==
X-Received: by 2002:a17:902:f68c:b0:21b:d105:26b9 with SMTP id d9443c01a7336-21f17e45b7emr53598095ad.16.1738771219978;
        Wed, 05 Feb 2025 08:00:19 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:19 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 03/11] irqchip/riscv-imsic: Move to common MSI lib
Date: Wed,  5 Feb 2025 21:29:39 +0530
Message-ID: <20250205155948.81385-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160022_382979_D148B98B 
X-CRM114-Status: GOOD (  17.85  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Simplify the leaf MSI domain handling in the RISC-V IMSIC driver by
using msi_lib_init_dev_msi_info() and msi_lib_irq_domain_select()
provided by common MSI lib.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 114 +--------------------
 2 files changed, 6 insertions(+), 116 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index be063bfb50c4..bc3f12af2dc7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -589,13 +589,7 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
-
-config RISCV_IMSIC_PCI
-	bool
-	depends on RISCV_IMSIC
-	depends on PCI
-	depends on PCI_MSI
-	default RISCV_IMSIC
+	select IRQ_MSI_LIB
 
 config SIFIVE_PLIC
 	bool
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 5d7c30ad8855..9a5e7b4541f6 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 
+#include "irq-msi-lib.h"
 #include "irq-riscv-imsic-state.h"
 
 static bool imsic_cpu_page_phys(unsigned int cpu, unsigned int guest_index,
@@ -174,22 +175,6 @@ static void imsic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
 
-static int imsic_irq_domain_select(struct irq_domain *domain, struct irq_fwspec *fwspec,
-				   enum irq_domain_bus_token bus_token)
-{
-	const struct msi_parent_ops *ops = domain->msi_parent_ops;
-	u32 busmask = BIT(bus_token);
-
-	if (fwspec->fwnode != domain->fwnode || fwspec->param_count != 0)
-		return 0;
-
-	/* Handle pure domain searches */
-	if (bus_token == ops->bus_select_token)
-		return 1;
-
-	return !!(ops->bus_select_mask & busmask);
-}
-
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
 				 struct irq_data *irqd, int ind)
@@ -206,110 +191,21 @@ static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
 static const struct irq_domain_ops imsic_base_domain_ops = {
 	.alloc		= imsic_irq_domain_alloc,
 	.free		= imsic_irq_domain_free,
-	.select		= imsic_irq_domain_select,
+	.select		= msi_lib_irq_domain_select,
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 	.debug_show	= imsic_irq_debug_show,
 #endif
 };
 
-#ifdef CONFIG_RISCV_IMSIC_PCI
-
-static void imsic_pci_mask_irq(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void imsic_pci_unmask_irq(struct irq_data *d)
-{
-	irq_chip_unmask_parent(d);
-	pci_msi_unmask_irq(d);
-}
-
-#define MATCH_PCI_MSI		BIT(DOMAIN_BUS_PCI_MSI)
-
-#else
-
-#define MATCH_PCI_MSI		0
-
-#endif
-
-static bool imsic_init_dev_msi_info(struct device *dev,
-				    struct irq_domain *domain,
-				    struct irq_domain *real_parent,
-				    struct msi_domain_info *info)
-{
-	const struct msi_parent_ops *pops = real_parent->msi_parent_ops;
-
-	/* MSI parent domain specific settings */
-	switch (real_parent->bus_token) {
-	case DOMAIN_BUS_NEXUS:
-		if (WARN_ON_ONCE(domain != real_parent))
-			return false;
-#ifdef CONFIG_SMP
-		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
-#endif
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return false;
-	}
-
-	/* Is the target supported? */
-	switch (info->bus_token) {
-#ifdef CONFIG_RISCV_IMSIC_PCI
-	case DOMAIN_BUS_PCI_DEVICE_MSI:
-	case DOMAIN_BUS_PCI_DEVICE_MSIX:
-		info->chip->irq_mask = imsic_pci_mask_irq;
-		info->chip->irq_unmask = imsic_pci_unmask_irq;
-		break;
-#endif
-	case DOMAIN_BUS_DEVICE_MSI:
-		/*
-		 * Per-device MSI should never have any MSI feature bits
-		 * set. It's sole purpose is to create a dumb interrupt
-		 * chip which has a device specific irq_write_msi_msg()
-		 * callback.
-		 */
-		if (WARN_ON_ONCE(info->flags))
-			return false;
-
-		/* Core managed MSI descriptors */
-		info->flags |= MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS |
-			       MSI_FLAG_FREE_MSI_DESCS;
-		break;
-	case DOMAIN_BUS_WIRED_TO_MSI:
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return false;
-	}
-
-	/* Use hierarchial chip operations re-trigger */
-	info->chip->irq_retrigger = irq_chip_retrigger_hierarchy;
-
-	/*
-	 * Mask out the domain specific MSI feature flags which are not
-	 * supported by the real parent.
-	 */
-	info->flags &= pops->supported_flags;
-
-	/* Enforce the required flags */
-	info->flags |= pops->required_flags;
-
-	return true;
-}
-
-#define MATCH_PLATFORM_MSI		BIT(DOMAIN_BUS_PLATFORM_MSI)
-
 static const struct msi_parent_ops imsic_msi_parent_ops = {
 	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
 				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
-				  MSI_FLAG_USE_DEF_CHIP_OPS,
+				  MSI_FLAG_USE_DEF_CHIP_OPS |
+				  MSI_FLAG_PCI_MSI_MASK_PARENT,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
-	.init_dev_msi_info	= imsic_init_dev_msi_info,
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
 int imsic_irqdomain_init(void)
-- 
2.43.0


