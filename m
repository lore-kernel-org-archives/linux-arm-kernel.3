Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03A4C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SELCyyXlkbmU/88t86mi5hRe2eZgtD7XIDKAJtxG+Qo=; b=285dGdRzAJWbftg9txd0si7AcG
	QQTX/kOrTEaDEKrk+wQBKqSQOBBfQzj1H8jvbPyeRrd1EGKBimXhd6TjvnTSOUR7Ta9ObKY1z9oEV
	n4Aka3T4e6RDk+DFLjo+kqTULVXl2r8Ew/gpuuwx+JutHpP8YPJKrn9ycHiZGyDfz5PVdv+azX0Ed
	bX4BCDxLzIhVjDjCX5wEp0lMKWkKy0QEYbsr2aKJY0KH2/yKdM/yQ6MSnKo9MHsDyaWEuavKu5X4g
	HqOBYZFKGa131zoX4JWy+71GNJGbCm7YGPR2FSVJzuil4UIuXUUYH+OCVO4hPKznFA6kevRfbpJN3
	9ZiE5m5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKq-0000000G7US-36jI;
	Mon, 24 Aug 2026 07:43:12 +0000
Received: from out-113.mta0.migadu.com ([2001:41d0:1004:224b::71] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKf-0000000G7Ci-0SyW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:43:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DMAf1c7UHhlCupwZA/0QkeFewyx6PmcAOPgc7+1CLxc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787557379; v=1; x=1788162179;
 b=Uf0DEm+XnIXlEOFOoPd2/ZOLLV6osBajla7iUPqXZHn3779pbmXxIc/LxUHjuNHK6rs/PnMU
 LPxFqzh6R+wM55dUwDjX1Q1mVPpmqicl1l8CkEiaDpGItElLZkOF1mWFNMuJzS5pbVlxPuilHdB
 qST+9hU+BHpAY25w9smieD4Y=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id 3a916f8011f966dc;
	Mon, 24 Aug 2026 07:42:59 +0000
X-Mizu-Trace-ID: 3a916f8011f966dc
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] irqchip/gic-v4: Unwind what its_alloc_vcpu_irqs() allocated on failure
Date: Mon, 24 Aug 2026 08:42:43 +0100
Message-Id: <20260824074245.710955-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260824074245.710955-1-fuad.tabba@linux.dev>
References: <20260824074245.710955-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004301_311454_EBD415C4 
X-CRM114-Status: GOOD (  13.86  )
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

A failure in the its_alloc_vcpu_sgis() loop leaves behind both the SGI
domains created for the vPEs below the failing index and the vPE irqs
allocated before the loop, since irq_domain_remove() frees neither. Each
leaked vPE takes its ITS state with it, a vpe_id and an LPI pending
table.

Free both from a second label before the existing unwind. With the
freed pointers now cleared, its_free_sgi_irqs() can skip a vPE with no
SGI domain and be reused there. The check has to precede the lookup:
irq_find_mapping(NULL, 0) falls back to irq_default_domain, and the
live irq it returns would then be freed.

Fixes: 6d31b6ff985d ("irqchip/gic-v4.1: Add VSGI allocation/teardown")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v4.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 754839e409f88..f707a3cb281aa 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -159,6 +159,8 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
 	return -ENOMEM;
 }
 
+static void its_free_sgi_irqs(struct its_vm *vm);
+
 int its_alloc_vcpu_irqs(struct its_vm *vm)
 {
 	int vpe_base_irq, i;
@@ -189,11 +191,14 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
 		vm->vpes[i]->irq = vpe_base_irq + i;
 		ret = its_alloc_vcpu_sgis(vm->vpes[i], i);
 		if (ret)
-			goto err;
+			goto err_free_irqs;
 	}
 
 	return 0;
 
+err_free_irqs:
+	its_free_sgi_irqs(vm);
+	irq_domain_free_irqs(vpe_base_irq, vm->nr_vpes);
 err:
 	if (vm->domain) {
 		irq_domain_remove(vm->domain);
@@ -215,8 +220,13 @@ static void its_free_sgi_irqs(struct its_vm *vm)
 		return;
 
 	for (i = 0; i < vm->nr_vpes; i++) {
-		unsigned int irq = irq_find_mapping(vm->vpes[i]->sgi_domain, 0);
+		unsigned int irq;
 
+		/* irq_find_mapping() falls back to the default domain on NULL. */
+		if (!vm->vpes[i]->sgi_domain)
+			continue;
+
+		irq = irq_find_mapping(vm->vpes[i]->sgi_domain, 0);
 		if (WARN_ON(!irq))
 			continue;
 
-- 
2.39.5


