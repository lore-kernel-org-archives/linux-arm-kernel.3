Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33779CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1S5dS1Vw/H/5XGJnrkqwW8yHi+k6VtRpVYC1pNJUZSM=; b=amfF3cR+MZ9UW6bxi3PHt6AmTf
	k3WW7yZF/jxr06XceBI00Lch8nxNORaQDPf/gqX1+y6DOGf5ZeISrGLVg4wqn5loOVZLPYB1uMpkd
	ZvN2Lwk6hFbCl0abOQGjLBagJ/Vn/9Gn9qSZHq2IWBg7hg1Gy1q2YtF/HCc9N5Bl7g73PrE81vlU2
	ZE3n9Mwtb9x8ENeziRifhhrkLGkKU+CgMPN+TMnWzIlwCiO1RJMkThfZCDkn6FUgyNm80/GLj+AAT
	8sLzXFAT3964wdOt1zrSKTJnvdtfp6gfSsfUnZiki4ErjbDUoxbHwpq8d3KJq6ZQJXMtn97cC22ME
	R5q6AvZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp30-0000000DSpR-3weK;
	Mon, 20 Oct 2025 12:31:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp21-0000000DRHe-2j5w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D352948AE5;
	Mon, 20 Oct 2025 12:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AC5C19422;
	Mon, 20 Oct 2025 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963413;
	bh=tebAVYrA73FNlUmUcIUL7/qqv4P1gAS8CBLjSUh+tjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I0TfKweE+wRL34FK7v//roIo+pS6PvbLumsDJc7Z0sbvRGkzIY2CLyWnx2exti3qT
	 ks5oVjyqX+g1Lk0JqU0e0+xKX9zMxcXTruOSnxQSt9uNjShhDCUTV8MI8r31CxtcKE
	 2cElTuZYsmvSXpn2knMg6f4JbsaIRiQ3djqYsOAmN63AKrgFNhW2xkbQzhugnebm/K
	 VranvjQtaS+vz7uOg4r/4k/ClQiCxB5bT3RdQMy/uj8DDJqcF2i7bD/NzBaLIkcVn3
	 8Dh5dcTJzWdzuXCQ0ouimZOMqva1W9Vz6d1eZ0/aYWTEZpMVmXgWhx3hZld84aTUiu
	 v5CmzZFSgUWpw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1f-0000000FUu2-3c2y;
	Mon, 20 Oct 2025 12:30:11 +0000
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
Subject: [PATCH v4 15/26] genirq: Update request_percpu_nmi() to take an affinity
Date: Mon, 20 Oct 2025 13:29:32 +0100
Message-ID: <20251020122944.3074811-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_053033_891316_F1DDC213 
X-CRM114-Status: GOOD (  20.06  )
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

Continue spreading the notion of affinity to the percpu interrupt
request code by updating the call sites that use request_percpu_nmi()
(all two of them) to take an affinity pointer. This pointer is
firmly NULL for now.

Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/smp.c   |  2 +-
 drivers/perf/arm_pmu.c    |  2 +-
 include/linux/interrupt.h |  4 ++--
 kernel/irq/manage.c       | 12 +++++++-----
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 68cea3a4a35ca..6fb838eee2e7d 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1094,7 +1094,7 @@ static void ipi_setup_sgi(int ipi)
 	irq = ipi_irq_base + ipi;
 
 	if (ipi_should_be_nmi(ipi)) {
-		err = request_percpu_nmi(irq, ipi_handler, "IPI", &irq_stat);
+		err = request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat);
 		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
 	} else {
 		err = request_percpu_irq(irq, ipi_handler, "IPI", &irq_stat);
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 5c310e803dd78..22c601b46c858 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -659,7 +659,7 @@ int armpmu_request_irq(int irq, int cpu)
 			irq_ops = &pmunmi_ops;
 		}
 	} else if (armpmu_count_irq_users(irq) == 0) {
-		err = request_percpu_nmi(irq, handler, "arm-pmu", &cpu_armpmu);
+		err = request_percpu_nmi(irq, handler, "arm-pmu", NULL, &cpu_armpmu);
 
 		/* If cannot get an NMI, get a normal interrupt */
 		if (err) {
diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 52147d5f432b3..81506ab759b81 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -197,8 +197,8 @@ request_percpu_irq(unsigned int irq, irq_handler_t handler,
 }
 
 extern int __must_check
-request_percpu_nmi(unsigned int irq, irq_handler_t handler,
-		   const char *devname, void __percpu *dev);
+request_percpu_nmi(unsigned int irq, irq_handler_t handler, const char *name,
+		   const struct cpumask *affinity, void __percpu *dev_id);
 
 extern const void *free_irq(unsigned int, void *);
 extern void free_percpu_irq(unsigned int, void __percpu *);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 5f4c651677436..b1a3140e5f3c9 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2527,6 +2527,7 @@ EXPORT_SYMBOL_GPL(__request_percpu_irq);
  * @irq:	Interrupt line to allocate
  * @handler:	Function to be called when the IRQ occurs.
  * @name:	An ascii name for the claiming device
+ * @affinity:	A cpumask describing the target CPUs for this interrupt
  * @dev_id:	A percpu cookie passed back to the handler function
  *
  * This call allocates interrupt resources for a per CPU NMI. Per CPU NMIs
@@ -2543,8 +2544,8 @@ EXPORT_SYMBOL_GPL(__request_percpu_irq);
  * If the interrupt line cannot be used to deliver NMIs, function
  * will fail returning a negative value.
  */
-int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
-		       const char *name, void __percpu *dev_id)
+int request_percpu_nmi(unsigned int irq, irq_handler_t handler, const char *name,
+		       const struct cpumask *affinity, void __percpu *dev_id)
 {
 	struct irqaction *action;
 	struct irq_desc *desc;
@@ -2561,12 +2562,13 @@ int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
 	    !irq_supports_nmi(desc))
 		return -EINVAL;
 
-	/* The line cannot already be NMI */
-	if (irq_is_nmi(desc))
+	/* The line cannot be NMI already if the new request covers all CPUs */
+	if (irq_is_nmi(desc) &&
+	    (!affinity || cpumask_equal(affinity, cpu_possible_mask)))
 		return -EINVAL;
 
 	action = create_percpu_irqaction(handler, IRQF_NO_THREAD | IRQF_NOBALANCING,
-					 name, NULL, dev_id);
+					 name, affinity, dev_id);
 	if (!action)
 		return -ENOMEM;
 
-- 
2.47.3


