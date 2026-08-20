Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12634C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zd8vpElBmMOJ6sntGJLRVcXNHFDrKfdh0UTTNmML8Dg=; b=svWJad/JRw8zXdpSo7QaPhgNny
	I+i1BquwYtVpuZmyV/gjM6Dl4ekWjTkDKNZ9Cn4GkUurI+7CeA2zYlRAQN1axGqwf7v2sZsAq9d3l
	o1tLHYiUylGT9ijIG8mR/G4CagIEXn6j1A6Y18YLq01L4QVVWoGSMK+wVVHJcUF76+7DSdKvK0G3d
	znUuGtC7GwToFf8wj7D9oX8NCkHuWBRZMyX7yF8/11ZqN9K9tWWLer6JBcw1HTI3Fgm/pVa2UDQmw
	w3mRnUV5wG7oJjngKDX4uxcWXdyKowMgJ0qmw7YfzEYCB6KCf4HVam+tQYvm84Z9CChMUUvP/ho6c
	W0wJTEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Ec-0000000BZjA-2Eac;
	Thu, 20 Aug 2026 12:51:06 +0000
Received: from out-24.mta1.migadu.com ([2001:41d0:203:375::18] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2EX-0000000BZgd-1dU9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:51:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=tLmq2HrjLCESAVz5nI7NICH8bUrsH/OHxKa8Tyxl6MQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787230258; v=1; x=1787835058;
 b=izz7ATC+WN/k4xaVA5ScrcFYWmZkeeW6+U8AKugYk1SaPxiq3PKdaRDNr7h+CpkZXGQg4Cpp
 wYwEr2+p3hd6Z6RhSzjWk1Isc98ke9lqc0t6UARODgvjWU7036ILYOYBx1i86NbJkxLawvrY62w
 8QQJ4esOKPRTZQY0c2YGsafk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id a3afca9ef7e413da;
	Thu, 20 Aug 2026 12:50:58 +0000
X-Mizu-Trace-ID: a3afca9ef7e413da
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
Subject: [PATCH 1/3] irqchip/gic-v4: Clear the domain and fwnode pointers after freeing them
Date: Thu, 20 Aug 2026 13:50:51 +0100
Message-Id: <20260820125053.2951078-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260820125053.2951078-1-fuad.tabba@linux.dev>
References: <20260820125053.2951078-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_055101_569636_32B756FB 
X-CRM114-Status: GOOD (  12.38  )
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

The GICv4 allocation and teardown paths free their irq domains and
fwnodes but leave the pointers set, and the allocation error paths test
those pointers before removing them. struct its_vm and struct its_vpe
are embedded in KVM's per-VM and per-vCPU state, so nothing re-zeroes
them between two attempts, and an error path taken after an earlier one
already freed the domain calls irq_domain_remove() on freed memory.

Reaching this takes two allocation failures, one to leave the stale
pointer behind and one to send the next attempt down the error path.

Fixes: 7de5c0af9c7c ("irqchip/gic-v4: Add per-VM VPE domain creation")
Fixes: 6d31b6ff985d ("irqchip/gic-v4.1: Add VSGI allocation/teardown")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v4.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 8455b4a5fbb0d..754839e409f88 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -147,10 +147,14 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
 	return 0;
 
 err:
-	if (vpe->sgi_domain)
+	if (vpe->sgi_domain) {
 		irq_domain_remove(vpe->sgi_domain);
-	if (vpe->fwnode)
+		vpe->sgi_domain = NULL;
+	}
+	if (vpe->fwnode) {
 		irq_domain_free_fwnode(vpe->fwnode);
+		vpe->fwnode = NULL;
+	}
 	kfree(name);
 	return -ENOMEM;
 }
@@ -191,10 +195,14 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
 	return 0;
 
 err:
-	if (vm->domain)
+	if (vm->domain) {
 		irq_domain_remove(vm->domain);
-	if (vm->fwnode)
+		vm->domain = NULL;
+	}
+	if (vm->fwnode) {
 		irq_domain_free_fwnode(vm->fwnode);
+		vm->fwnode = NULL;
+	}
 
 	return -ENOMEM;
 }
@@ -215,6 +223,8 @@ static void its_free_sgi_irqs(struct its_vm *vm)
 		irq_domain_free_irqs(irq, 16);
 		irq_domain_remove(vm->vpes[i]->sgi_domain);
 		irq_domain_free_fwnode(vm->vpes[i]->fwnode);
+		vm->vpes[i]->sgi_domain = NULL;
+		vm->vpes[i]->fwnode = NULL;
 	}
 }
 
@@ -224,6 +234,8 @@ void its_free_vcpu_irqs(struct its_vm *vm)
 	irq_domain_free_irqs(vm->vpes[0]->irq, vm->nr_vpes);
 	irq_domain_remove(vm->domain);
 	irq_domain_free_fwnode(vm->fwnode);
+	vm->domain = NULL;
+	vm->fwnode = NULL;
 }
 
 static int its_send_vpe_cmd(struct its_vpe *vpe, struct its_cmd_info *info)
-- 
2.39.5


