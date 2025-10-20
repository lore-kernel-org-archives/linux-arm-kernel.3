Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59903CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDhLtJ2jHgGwDL8fNdc9whkaJbqx2qy82kfEq1Kcwpw=; b=Kv57PmaVOBTaDWVdD20iC7Bcuo
	6kGn3pGis2k6ZfzL2w7XR2wwpbADXaN6INh1yudH49k3gZ4/KCETetfrX+JgdGrBSyDaJ9GlISLnF
	tRB8CICvMpKY8xoA5LH0hxcAuwJbedjybLwOW2/02fE6cE1v0SwD7qw2lCuI50BpB4940Tdd3zbtI
	cWlpaj8mksMTsUneEvpGWp7yE3ryQ49nBYHTgt5R+endRdwLgBOywr6XrKfk7LkofPswKfhsdgdnB
	bv/CjfWwYUWWxU9efiJjRKi2nJ59/zKo08Lv6lASteJ+MVgzTdzZ4oKhiVB7/Z3Pg840DFW7cY3Gv
	H+0VRA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1y-0000000DRNf-44db;
	Mon, 20 Oct 2025 12:30:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1l-0000000DR27-2fYE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D604161EDB;
	Mon, 20 Oct 2025 12:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC49C116B1;
	Mon, 20 Oct 2025 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963416;
	bh=LhqnyHO9xQXE51uOqEQco9cZyrEAt+/uNHhbdX8NSGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VIA2SwllRV140v5T0/nmR9nAfstHE8fXvWbLVt8DK74CBICzGRaFKRCl1bJrnDDib
	 5H5sUpf8RqyBe/a1kbfDDXX3yp0fntHJCP/q+miXgpJ7LYwM83GKxQNvTe8bLLO+7v
	 OW82n1vBVjZf0pmu/uyTXasVDdK17PmYdXuLV3PgVetxTf0T7thDSntLVtLI83F1VL
	 bTxN1YSQ0S6x8aQlxDmSPbjYcgajkE4ClKJb5BzG0iKMdfCoStDuldZKxlJ9jKh9+C
	 8Ike8xyEx1drtnsjIn688K4Fuiy8ybafALZtyaa7rp0aklpux234I/vOFvckP5XeDu
	 thB1uKcyWaXHA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1i-0000000FUu2-2vI8;
	Mon, 20 Oct 2025 12:30:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 24/26] genirq: Kill irq_{g,s}et_percpu_devid_partition()
Date: Mon, 20 Oct 2025 13:29:41 +0100
Message-ID: <20251020122944.3074811-25-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

These two helpers do not have any user anymore, and can be removed,
together with the affinity field kept in the irqdesc structure.

Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irq.h     |  4 ----
 include/linux/irqdesc.h |  1 -
 kernel/irq/irqdesc.c    | 24 +-----------------------
 3 files changed, 1 insertion(+), 28 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index b728c18f6ded7..4a9f1d7b08c39 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -718,10 +718,6 @@ static inline void irq_set_chip_and_handler(unsigned int irq,
 }
 
 extern int irq_set_percpu_devid(unsigned int irq);
-extern int irq_set_percpu_devid_partition(unsigned int irq,
-					  const struct cpumask *affinity);
-extern int irq_get_percpu_devid_partition(unsigned int irq,
-					  struct cpumask *affinity);
 
 extern void
 __irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int is_chained,
diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index fd091c35d5721..37e0b5b5600a4 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -82,7 +82,6 @@ struct irq_desc {
 	int			threads_handled_last;
 	raw_spinlock_t		lock;
 	struct cpumask		*percpu_enabled;
-	const struct cpumask	*percpu_affinity;
 #ifdef CONFIG_SMP
 	const struct cpumask	*affinity_hint;
 	struct irq_affinity_notify *affinity_notify;
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index db714d3014b5f..6acf268f005bc 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -879,8 +879,7 @@ void __irq_put_desc_unlock(struct irq_desc *desc, unsigned long flags, bool bus)
 		chip_bus_sync_unlock(desc);
 }
 
-int irq_set_percpu_devid_partition(unsigned int irq,
-				   const struct cpumask *affinity)
+int irq_set_percpu_devid(unsigned int irq)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 
@@ -892,31 +891,10 @@ int irq_set_percpu_devid_partition(unsigned int irq,
 	if (!desc->percpu_enabled)
 		return -ENOMEM;
 
-	desc->percpu_affinity = affinity ? : cpu_possible_mask;
-
 	irq_set_percpu_devid_flags(irq);
 	return 0;
 }
 
-int irq_set_percpu_devid(unsigned int irq)
-{
-	return irq_set_percpu_devid_partition(irq, NULL);
-}
-
-int irq_get_percpu_devid_partition(unsigned int irq, struct cpumask *affinity)
-{
-	struct irq_desc *desc = irq_to_desc(irq);
-
-	if (!desc || !desc->percpu_enabled)
-		return -EINVAL;
-
-	if (affinity)
-		cpumask_copy(affinity, desc->percpu_affinity);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(irq_get_percpu_devid_partition);
-
 void kstat_incr_irq_this_cpu(unsigned int irq)
 {
 	kstat_incr_irqs_this_cpu(irq_to_desc(irq));
-- 
2.47.3


