Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7152E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTMHZPsDjixID3LZgZypNI5zerTGwhJ3oNH3JU/CG6w=; b=FD+EeQYdEztp4gBidLJtGRxJVu
	qnTyYSEtPqizRrmVP1rzJ3xfo9dwJVTDvnKtN95uMfUNK9QI7LDwhHVMuX1Jiy5QmLjM9wNLx3dmS
	gPQ/WPT927EPlAvZeeV97Pvy3ULdU+XtVcf1uyF2FkEQzm7qstciemd16U6rrPriCsFEa7QakQmtU
	OkvdZpuRBpz4fIiEH4ltmk9+UtLvEiEpUhwPRp4qYnh7X/+CFZ5TyRksryDijkVHrPTyjWtJWfJDU
	x1RUZGcFXvG4RHjtRqAthhHTPZneg7q678KxETY2hX9wGfHzn31BvQBRP1TtB5wWqZ1WVldDOvhe7
	nqlD4ADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVzS-00000006hcR-23oY;
	Sat, 14 Dec 2024 17:31:42 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVuT-00000006gOy-3QfN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:35 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so3084854a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197193; x=1734801993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTMHZPsDjixID3LZgZypNI5zerTGwhJ3oNH3JU/CG6w=;
        b=ifEGV2kRHgQy6wgz7xKYiqbu+x+0vjWoisFz0ruUpriS5LsgyiH+Y8/cn3e0rlaAeU
         6FEw6WPLgUVV2q28o3+kPF2hzVzA3cGP3HzmBHsv9EHV9ynGi0X01NaumeCN5442DJ0F
         p2+N9D6iR1jpTzkxsdDz7jm03TTJVOkuHBbEJjDxgf1f1VgTOAun3DUVXKDGSit6jhOa
         8KuD+PxBEl9FkAroRwzHv6sQ423prjqlmt0DoGfUU0t4jxv/r+4gHbEdI0usk4FyMrdJ
         bg23AYd1wqz45iJns4mEihQ9O4vQajDpn1rrTtFhikT4Uxl2J2RzU1PzSZtDqjnPE+WM
         F/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197193; x=1734801993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTMHZPsDjixID3LZgZypNI5zerTGwhJ3oNH3JU/CG6w=;
        b=VlZwWcSiyFZmSeCrKFnJNpXHkukX9Xz64rnd57lwBIQKpdyGqhPQo6MAf50Nq/N6E7
         MeoazzdvZ4HZBLlmi0qQCVx0UraV0B8Wu0m+o9wh5t9MgcGti58VUHCK5le7dmpxuxfK
         laNkPIdlByBm+RMmq57c58lMaF0hX/tpIm8qUk6tuta+46bLhHxlq8WnJ4IEIrbwqF6+
         rBbHkseNUaGVQ3hSAs4GuX+W3MMLIaqSnzERmlH+p4YNVtXjVoe61cGR4nAoLP8IsQA5
         kbifPEJHC713gZHtivqtgsm49iy3xbJLjHDzzFQjdDJriKV8dvWU6PCSwTlhZFveXRKD
         HFzw==
X-Forwarded-Encrypted: i=1; AJvYcCWEObNFPOZo2xaqzU+mO7h0I/MxxZkRTT04vKCcasn+SefNPOevS9x3mR83mUEV1gtxHukHTcdUBadFYno55yu5@lists.infradead.org
X-Gm-Message-State: AOJu0YxLLpng+1fZVDJ8XI4QIvboPO6BXiAzXEiio4o64g4PMxwdFGVS
	tEs8wzz9qr8mNocaAjfCXlyVWxaeNoUuMC+kU4uM71f9p/XPUEWE/VobX9/RSEs=
X-Gm-Gg: ASbGncujVUW9mSu6TGQHTQw/yHNMSvTL5cE06wvIojKuG62EViaKkmooqStbnD1BEvQ
	D1DtX06hg2dDOwgRNANFtXXHZNGpsvYSgd4eY3U53Y+qtNK9bB4/nXjep8OZk5Jaq3gNiwjJF8E
	Uho8gkRlrIkGP4uerzH13JIMEH9v9jENT7h3QNl5VC867a9N6arlgl3KoTG5yA0NKKu/cfJXqqB
	11mK+vgqBuUh8w2AVjHeI44zfwGGaj+brM+3nshocRaLWCb2VY9/iV4GGAQwg5gGW37whszqJOP
	wrkCR/bGYhJcRz0=
X-Google-Smtp-Source: AGHT+IH7cEjTQcM+udD/U5XRPprvWKA6NBoe1GlzDD6yjgsEVTNKRYALRcnCyPJucGTbfWHoFFxtSg==
X-Received: by 2002:a17:90b:4d05:b0:2ef:ad27:7c1a with SMTP id 98e67ed59e1d1-2f13ab74905mr16256697a91.2.1734197192577;
        Sat, 14 Dec 2024 09:26:32 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:32 -0800 (PST)
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
Subject: [PATCH v2 04/11] irqchip/riscv-imsic: Move to common MSI lib
Date: Sat, 14 Dec 2024 22:55:42 +0530
Message-ID: <20241214172549.8842-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092633_858242_77B1908D 
X-CRM114-Status: GOOD (  17.94  )
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
index 55d7122121e2..6b767b8c974f 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -587,13 +587,7 @@ config RISCV_IMSIC
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
index dc6f63f657e4..2fab20d2ce3e 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 
+#include "irq-msi-lib.h"
 #include "irq-riscv-imsic-state.h"
 
 static bool imsic_cpu_page_phys(unsigned int cpu, unsigned int guest_index,
@@ -201,22 +202,6 @@ static void imsic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
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
@@ -233,110 +218,21 @@ static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
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


