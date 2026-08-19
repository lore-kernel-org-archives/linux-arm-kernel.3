Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024C1C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 01:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GKJPQ1K7MzyYuRxbvHGWlf/wDgLHSxbc0lEn8Y0Ezdk=; b=iQYXlSfxYNcHPaZ1ns5VGZLlh8
	Bcm8yWg3+pmHdtIOB4ps8oyXHErgwBTjNSre7xRB9fG034Szlas0QUXWDvnUYZK1N/x+CUukkJhvD
	Qy/Ujna6y8Qi0v+aQDWa7DCax9na/BaDDLTeYK4xUdTJEJXOpdfMN5kGNyiqvwzv8qiKkhjK/mmSr
	J04qKCIyu7+8dgyzJZYtbHFZBfhdBhvY5ncYKoBpBQGf3mnpIqKR82qPECvSF0ACsLtRVF4wGtuUr
	JuUK2y04ZU6usCOf/ewP+neHwWRXs7MjkyCr/kUORJQxlIttaGRmRgwLoHe54YNF70yXEka1LPLen
	Snin85Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwUoI-00000008ouV-2l4A;
	Wed, 19 Aug 2026 01:09:42 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwUoF-00000008ou2-0D1P;
	Wed, 19 Aug 2026 01:09:41 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 19 Aug
 2026 09:09:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 19 Aug 2026 09:09:29 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 19 Aug 2026 09:09:19 +0800
Subject: [PATCH] irqchip/ast2700-intc: Avoid allocating in the irq_domain
 activate callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260819-fix-ast2700-intc-atomic-alloc-v1-1-d92a02e2a239@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAD4ChWoC/x2M0QrCMAwAf2Xk2UAaxa3+ivgQatwCWyttEWHs3
 w0+Hfdwt0PTatrgNuxQ9WPNSnYJpwHSInlWtKc7MPGVphDxZV+U1nkkQss9ofSymWNdS8J45ss
 kHCUkAn+8q3rw/98fx/EDtmZR2m8AAAA=
X-Change-ID: 20260819-fix-ast2700-intc-atomic-alloc-93248a29a1c0
To: Thomas Gleixner <tglx@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Paul Walmsley <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787101769; l=3189;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=ZRBbxvpAQxQ9WSWrReHJgmHc7WwhW/QkN01mfSF5T+A=;
 b=y1Ml1E/xkjDXkFmU+iV4p/nM5dpGUJaEb88IKzFFXQ5J4lWuwqKhEp/CQFMZOJ9+32v9B/0yF
 5nN0wH0Wn49BXicFlAqMoXXI50tdDMwxm2iC2qh6n8B5Wh9l0n/EUvQ
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_180939_125340_83BFF171 
X-CRM114-Status: GOOD (  12.90  )
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

The IRQ core calls the irq_domain .activate callback from __setup_irq()
with desc->lock held and interrupts disabled. Both
aspeed_intc1_irq_domain_activate() and the aspeed_intc0_resolve_route()
it invokes test a compatible string with fwnode_device_is_compatible(),
which wraps fwnode_property_match_string() and allocates with GFP_KERNEL.

Besides sleeping in atomic context, that makes the irq_desc lock depend
on fs_reclaim, which lockdep reports as an inversion because
irq_desc_lock_class is also taken in hardirq context:

  WARNING: possible irq lock inversion dependency detected
  swapper/0/0 just changed the state of lock:
  (&irq_desc_lock_class){-...}-{2:2}, at: handle_level_irq+0x28/0x168
  but this lock took another, HARDIRQ-unsafe lock in the past:
   (fs_reclaim){+.+.}-{0:0}
  ...
    fs_reclaim_acquire
    __kmalloc_noprof
    fwnode_property_match_string
    aspeed_intc0_resolve_route
    aspeed_intc1_irq_domain_activate

Both call sites are only ever handed OF nodes, so use
of_device_is_compatible() instead: it walks the property in place and
does not allocate.

Fixes: 07825e41519a ("irqchip/ast2700-intc: Add AST2700-A2 support")
Reported-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Tested on an AST2700 EVB with CONFIG_PROVE_LOCKING=y: the irq lock
inversion splat quoted in the patch is gone, and the ast2700-intc0 KUnit
suite still passes 9/9.
---
 drivers/irqchip/irq-ast2700-intc0.c | 2 +-
 drivers/irqchip/irq-ast2700-intc1.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-ast2700-intc0.c b/drivers/irqchip/irq-ast2700-intc0.c
index 14b8b88f1179..c85b98a19bd4 100644
--- a/drivers/irqchip/irq-ast2700-intc0.c
+++ b/drivers/irqchip/irq-ast2700-intc0.c
@@ -312,7 +312,7 @@ int aspeed_intc0_resolve_route(const struct irq_domain *c0domain, size_t nc1outs
 		return -ENOENT;
 
 	if (!IS_ENABLED(CONFIG_ASPEED_AST2700_INTC_TEST) &&
-	    !fwnode_device_is_compatible(c0domain->fwnode, "aspeed,ast2700-intc0"))
+	    !of_device_is_compatible(to_of_node(c0domain->fwnode), "aspeed,ast2700-intc0"))
 		return -ENODEV;
 
 	intc0 = c0domain->host_data;
diff --git a/drivers/irqchip/irq-ast2700-intc1.c b/drivers/irqchip/irq-ast2700-intc1.c
index 59e8f0d5ddcd..df6acbafce2d 100644
--- a/drivers/irqchip/irq-ast2700-intc1.c
+++ b/drivers/irqchip/irq-ast2700-intc1.c
@@ -157,7 +157,8 @@ static int aspeed_intc1_irq_domain_activate(struct irq_domain *domain,
 					intc1->ranges.nranges,
 					intc1->ranges.ranges, &resolved);
 	if (rc < 0) {
-		if (!fwnode_device_is_compatible(intc1->upstream->fwnode, "riscv,aplic")) {
+		if (!of_device_is_compatible(to_of_node(intc1->upstream->fwnode),
+					     "riscv,aplic")) {
 			dev_warn(intc1->dev,
 				 "Failed to resolve interrupt route for hwirq %lu in domain %s\n",
 				 data->hwirq, domain->name);

---
base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
change-id: 20260819-fix-ast2700-intc-atomic-alloc-93248a29a1c0

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


