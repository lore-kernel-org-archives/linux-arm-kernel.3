Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BDBC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osjoncDPwqhgPqna7f8x373PHDGI6Itk9WlFvaKI6fE=; b=lTwN8E6huKYp+vm10flZOkdrqq
	6fwJhECnuUelFKo/bjE0E2YrFjw6iRSd6IGk7SxTFTRgmzgORCfIoH9p28fbGpgQ1wXD0BESFRDI3
	/XOvq+A7FAJ1XVbZppJDBEVGRTxmKQvQjJ3pk3XS+S5SVEV9SOAjfJUkeow7oNAx3KrvuGgJU2FMp
	FyHCxXXZpLoZmncrCOVdTj4m08heZhoj5exp3daEMMo2pT9bFcrxzCo27fQsEKWNx5ElKhQPZHKPy
	pqg61PEJZnML15I+yUGxHFsyEnx8lPHB1lrWab+hYHb92Ux9mCzV823+CGvbbteeu17E1+UpCNzuW
	Jrm+R+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIAT-0000000BA6r-3KSs;
	Thu, 03 Jul 2025 11:31:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHAO-0000000AzKl-0trt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A31E461434;
	Thu,  3 Jul 2025 10:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FFDC4CEED;
	Thu,  3 Jul 2025 10:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538463;
	bh=dzBAiGg88kZkWCQEw27NLp04lJrDytYM5jJuijOSK0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uAM8WucZveyfVAU+piOtw3vbIcZg3TeIe6BCw9rV/oy+pSiBv//M0Sjkgs3j+atsr
	 mq+dGhaxv0YcfHGdUGKLDWqVuEPlNelzLDRBy8C+/lEn9sGQX+ngTuIDep4fF1LgtI
	 2HwzSOh+u5imF/+O6iXTBvAtnhhNvxgsdUerGgGtE6/EOr1D4vWjjVUsuaLsx4NI9G
	 +LCZk4sfEUisaa2XEk7/qhPn30OSer4OBuWviTpanqgnP45f2hB5XOTaLrIAYCH4HT
	 igfvstcsReqYUPx1ErPeUqk0OAeh/8jPVuYJxKf/L7pdcYn/IIzQfoK13k/Apn4W6/
	 7SAW6TWs97fVQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:17 +0200
Subject: [PATCH v7 27/31] irqchip/msi-lib: Add
 IRQ_DOMAIN_FLAG_FWNODE_PARENT handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-27-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
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

In some irqchip implementations the fwnode representing the IRQdomain
and the MSI controller fwnode do not match; in particular the IRQdomain
fwnode is the MSI controller fwnode parent.

To support selecting such IRQ domains, add a flag in core IRQ domain
code that explicitly tells the MSI lib to use the parent fwnode while
carrying out IRQ domain selection.

Update the msi-lib select callback with the resulting logic.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-msi-lib.c | 5 ++++-
 include/linux/irqdomain.h     | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 246c30205af4..454c7f16dd4d 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -133,11 +133,14 @@ int msi_lib_irq_domain_select(struct irq_domain *d, struct irq_fwspec *fwspec,
 {
 	const struct msi_parent_ops *ops = d->msi_parent_ops;
 	u32 busmask = BIT(bus_token);
+	struct fwnode_handle *fwh;
 
 	if (!ops)
 		return 0;
 
-	if (fwspec->fwnode != d->fwnode || fwspec->param_count != 0)
+	fwh = d->flags & IRQ_DOMAIN_FLAG_FWNODE_PARENT ? fwnode_get_parent(fwspec->fwnode)
+						       : fwspec->fwnode;
+	if (fwh != d->fwnode || fwspec->param_count != 0)
 		return 0;
 
 	/* Handle pure domain searches */
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 7387d183029b..25c7cbeed393 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -212,6 +212,9 @@ enum {
 	/* Address and data pair is mutable when irq_set_affinity() */
 	IRQ_DOMAIN_FLAG_MSI_IMMUTABLE	= (1 << 11),
 
+	/* IRQ domain requires parent fwnode matching */
+	IRQ_DOMAIN_FLAG_FWNODE_PARENT	= (1 << 12),
+
 	/*
 	 * Flags starting from IRQ_DOMAIN_FLAG_NONCORE are reserved
 	 * for implementation specific purposes and ignored by the

-- 
2.48.0


