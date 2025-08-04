Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E3C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=spxjp0CtIOutsrGXZN+Mo+ajlpcX6Z4rdcY5NYgqbfU=; b=ZdP/vOyUvMki+rEEjh95/z9WXY
	zY/3c0OU27mhzFYVQYYeo6O8PNxMpWFUvVAqdHFEi4TbDvPGyNt4D1SPQyCU+ZCPyqkOa7cVgorOc
	EF59fY8sF0GDbkcs0hHhe8evBHFORndoiUdqV4sZK1dUyeaDHO/mJEN6JTX8RAZcYqyWS6fpC1bgn
	5US5mNIKgjveT6EqBlPe54RXu0ngGKjOlY4IjbVQaFKpjUsmX8Ph6QNGD7oIC8yuxICmFjpYTcP0N
	NccNZYcGqcS1SLu+f2YAFso+MNCH9eq89SB5T+n39adB25K3SQO9+QVLd4BdkgCUCzUBETJ78fykm
	c+4w8Q8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixF0-0000000AqOt-1Cjd;
	Mon, 04 Aug 2025 15:36:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwbd-0000000AioM-3Gqq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 14:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32A6945E00;
	Mon,  4 Aug 2025 14:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16BCAC4CEF0;
	Mon,  4 Aug 2025 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754319364;
	bh=AsFEDSuwiU6dwZcqz43qfo52c8csif1QTc3tvddFOGs=;
	h=From:To:Cc:Subject:Date:From;
	b=aR5El4H7hWOwyfvGwcp+I+/mD7ivYfdc0H39VN4pQoPcm+DNi4Cps7R13tAhyZKb/
	 715ZJU9cj2P7jgsxnijz5qSUWW6DF0cfBZd6PnMky9KxrMBz9hLffM3vKep4mQ7eIj
	 GVnKvFtq5AT5NO4vJbu5ZUVhN1uu1lmE8GHgfWrcYSUEFmzsXjnHyrFNThydJCRofZ
	 smJx/rbFHjJmbBo6JFEnnHn4leW1tx9aKOUBezjEH96X/57OzjNS6enm7WpDnQiGp/
	 itQOCwISO7d5B7vpvunMS0Zrnqtg5FiAMgPeuE5TCNKrth0rC4cJeGctLUR79Zr8Xl
	 T3AZtRraC845Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] irqchip/msi-lib: Fix fwnode refcount in msi_lib_irq_domain_select()
Date: Mon,  4 Aug 2025 16:55:53 +0200
Message-ID: <20250804145553.795065-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_075605_836573_E0C8489F 
X-CRM114-Status: GOOD (  18.94  )
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

Commit 8b65db1e93a2 ("irqchip/msi-lib: Add IRQ_DOMAIN_FLAG_FWNODE_PARENT
handling") added logic in msi_lib_irq_domain_select() to match the
domain fwnode against the fwnode parent of the fwspec.fwnode.

The fwnode_get_parent() caller must call fwnode_handle_put() on the
returned pointer value, lest fwnode refcounting for the parent ends
up being out of kilter.

Fix this by relying on the fwnode_handle clean-up handlers and by
incrementing the fwnode refcount regardless of whether we use
parent matching or not (the domain selection code already holds a
reference before calling msi_lib_irq_domain_select() but to make
the exit path more uniform if IRQ_DOMAIN_FLAG_FWNODE_PARENT is not
set fwnode_handle_get() is called again on fwspec.fwnode so that
the clean-up code is the same for the two matching patterns).

Fixes: 8b65db1e93a2 ("irqchip/msi-lib: Add IRQ_DOMAIN_FLAG_FWNODE_PARENT handling")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
Hi Thomas, Marc,

Noticed while adding GICv5 ACPI support - I tested this patch on arm64 with
DT (GICv5 and v3) and ACPI (GICv3).

msi_lib_irq_domain_select() is used in other arches, I could not
test on those (don't know if they have non-[DT/irqchip/acpi] specific
fwnodes) - from a fwnode interface perspective I think that this patch
does the right thing, it should not add any issue to existing code
to the best of my knowledge but it has to be verified.

Thanks,
Lorenzo

 drivers/irqchip/irq-msi-lib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 454c7f16dd4d..908944009c21 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -133,13 +133,13 @@ int msi_lib_irq_domain_select(struct irq_domain *d, struct irq_fwspec *fwspec,
 {
 	const struct msi_parent_ops *ops = d->msi_parent_ops;
 	u32 busmask = BIT(bus_token);
-	struct fwnode_handle *fwh;
 
 	if (!ops)
 		return 0;
 
-	fwh = d->flags & IRQ_DOMAIN_FLAG_FWNODE_PARENT ? fwnode_get_parent(fwspec->fwnode)
-						       : fwspec->fwnode;
+	struct fwnode_handle *fwh __free(fwnode_handle) =
+		d->flags & IRQ_DOMAIN_FLAG_FWNODE_PARENT ? fwnode_get_parent(fwspec->fwnode)
+							 : fwnode_handle_get(fwspec->fwnode);
 	if (fwh != d->fwnode || fwspec->param_count != 0)
 		return 0;
 
-- 
2.48.0


