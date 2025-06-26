Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA04C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMe6v2MmHCxElXB7UoTQc/hosJHI7znB2dI8Iz+sWr4=; b=2fErQmQrkOi/DIw1Oapu2Je6oM
	SqkIk2joxtxC8xFOPqAUfouTBB4RLShykpssI0+WfbxVexQjYUQ9KSqc3C50uDsYsWUbXvMGHMR1J
	8MlGCNTw34yoh88pfxdX3r/I7gB2sU6O9F7LkaisIE1o/S0MjX+yeT+M3X/bGWyIT/pp+8zk777ET
	uW+32iTYb9mGvdzn2yPS2Ozz1EroZbxJdLS6fIfcxvM02Rd/c388mTPWIPZldzVUjinx6A54LvCmp
	mdisEKCVVOmLaWlmRFlZ+RZpzGK4FvgCw9oZ/ftBtbSsVg9w9UBFO8TR2sPxzwXBTf8Mwyt0LH/D4
	jm9/B7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUl3s-0000000BSAZ-2jdr;
	Thu, 26 Jun 2025 11:46:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjqc-0000000BHSz-0Jn9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C384644938;
	Thu, 26 Jun 2025 10:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7416C4CEEF;
	Thu, 26 Jun 2025 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750933729;
	bh=qQUoYRDsuGgB8vCzbvbRUy/RkIeih4RsG46sVkq+6kI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nhksvSFzXRN+TKFDSpqakiEQuYMf0nrMn8e/Crho+x+7CpfIf1L6RuonQzTqh+9UJ
	 DMu9gmVnKPAsrwyVbELQfoIjc/GWunHPi6mVg2gLQt+u9M5b1YGwhrAjWTHijsKNzN
	 zUopEj7hSAVaH5oiMiqIMutAgFQEN+yrz6O5jm7RPf5/+c1tqoPC8upmJkLqnHZjif
	 dsp67vEKjfrQszIUjFtGAuD/VJ4Wzn5zoru3tYcf0vVEkirl3cQiXWRLvmcxarzoaW
	 AVEjkvQk8SzILg0BZYrJEazVXLDZrGg5Zo6qfv+cFVZAE+WQOAu/fTJ/Mr7HSAo2Gp
	 N4Il5UWwOixZQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 26 Jun 2025 12:26:18 +0200
Subject: [PATCH v6 27/31] irqchip/msi-lib: Add
 IRQ_DOMAIN_FLAG_FWNODE_PARENT handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-gicv5-host-v6-27-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
In-Reply-To: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_032850_161095_D2C95114 
X-CRM114-Status: GOOD (  15.30  )
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


