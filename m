Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176D5CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15wov8x5kamvGdoa7WsHIDSg4G4YjukH1NyAlrejWdM=; b=CbJwoDrlZ0ZiDSxx5Q/vO/JZ15
	RgWYGSA7ZYfuCdnr2a6aIe0Gkwwf4uC6ns8sFAc+yY/9B61zQ55Ow2nUG9Achnyl1PxuxlqiyYish
	P7tHeNrfYkIBZVeO/YIAKjkLBoGWOtK5VdjaKL4Be7LbpnzBKy4TzzK4nE8SgxZujG1Br1AIIRKh0
	WXkdxyL8q8jw9WxmdiSthNRqc0SV/3I3k2XjVSjjy1DWaezo4pbj1PMhdqDnLjhyWbwL9ID8TBJOm
	3sTOpnrn0d6GW54ZQ4++E0r9BtHerlnXU3evZHxJa+11w4NwB2SzHjp5NwZXm6g3zCkZrZ0Un5SBl
	zSjq7EPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buq-00000009hvL-3Ap5;
	Mon, 22 Sep 2025 08:28:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buh-00000009hge-3ZYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B288244ED9;
	Mon, 22 Sep 2025 08:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7FEC4CEF0;
	Mon, 22 Sep 2025 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529727;
	bh=wUb93rzYZ46AvuCm0nEYQtzHfIxnso9k5I5Egiwv/gQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gPj0XVCkEY3x4shdXEnzhoTL7NxkNREGUzFf8D3rcwHTKETiXq8Ed8rAQlLxLcUam
	 NQGslrB+b/FMJ9fxRTXCbcjFNIxpuEGhsp+Ajo8+1AgmnelN8IHr5qrkbY6jneyHjD
	 3uFFC8QH8EP1A31L2HeE7+3HD+rqlv370zdTS79No4YEIG8szNkYKPgCb/F8BtvoQH
	 7uDlzDnQRTvIQFbq1/iYR8vjMBZK3bj/riaD/LIwzFX+m97Uw8v8BtvreE/HHHCxWr
	 X1IEZX5KmcflnYFfOXSQ17oGA4cKPkID5o1EOUowoU+3D3uBVubqSA/MvsrHMEBks5
	 svtC3kXC4vBNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0buf-00000008Kds-1gEz;
	Mon, 22 Sep 2025 08:28:45 +0000
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
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 13/26] genirq: Factor-in percpu irqaction creation
Date: Mon, 22 Sep 2025 09:28:20 +0100
Message-ID: <20250922082833.2038905-14-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012847_939221_81B5B590 
X-CRM114-Status: GOOD (  19.46  )
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

Move the code creating a per-cpu irqaction into its own helper, so that
future changes to this code can be kept localised.

At the same time, fix the documentation which appears to say the wrong
thing when it comes to interrupts being automatically enabled
(percpu_devid interrupts never are).

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 kernel/irq/manage.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index c94837382037e..d9ddc30678b5d 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2442,6 +2442,24 @@ int setup_percpu_irq(unsigned int irq, struct irqaction *act)
 	return retval;
 }
 
+static
+struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long flags,
+					  const char *devname, void __percpu *dev_id)
+{
+	struct irqaction *action;
+
+	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
+	if (!action)
+		return NULL;
+
+	action->handler = handler;
+	action->flags = flags | IRQF_PERCPU | IRQF_NO_SUSPEND;
+	action->name = devname;
+	action->percpu_dev_id = dev_id;
+
+	return action;
+}
+
 /**
  * __request_percpu_irq - allocate a percpu interrupt line
  * @irq:	Interrupt line to allocate
@@ -2450,9 +2468,9 @@ int setup_percpu_irq(unsigned int irq, struct irqaction *act)
  * @devname:	An ascii name for the claiming device
  * @dev_id:	A percpu cookie passed back to the handler function
  *
- * This call allocates interrupt resources and enables the interrupt on the
- * local CPU. If the interrupt is supposed to be enabled on other CPUs, it
- * has to be done on each CPU using enable_percpu_irq().
+ * This call allocates interrupt resources, but doesn't enable the interrupt
+ * on any CPU, as all percpu-devid interrupts are flagged with IRQ_NOAUTOEN.
+ * It has to be done on each CPU using enable_percpu_irq().
  *
  * @dev_id must be globally unique. It is a per-cpu variable, and
  * the handler gets called with the interrupted CPU's instance of
@@ -2477,15 +2495,10 @@ int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
 	if (flags && flags != IRQF_TIMER)
 		return -EINVAL;
 
-	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
+	action = create_percpu_irqaction(handler, flags, devname, dev_id);
 	if (!action)
 		return -ENOMEM;
 
-	action->handler = handler;
-	action->flags = flags | IRQF_PERCPU | IRQF_NO_SUSPEND;
-	action->name = devname;
-	action->percpu_dev_id = dev_id;
-
 	retval = irq_chip_pm_get(&desc->irq_data);
 	if (retval < 0) {
 		kfree(action);
@@ -2546,16 +2559,11 @@ int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
 	if (irq_is_nmi(desc))
 		return -EINVAL;
 
-	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
+	action = create_percpu_irqaction(handler, IRQF_NO_THREAD | IRQF_NOBALANCING,
+					 name, dev_id);
 	if (!action)
 		return -ENOMEM;
 
-	action->handler = handler;
-	action->flags = IRQF_PERCPU | IRQF_NO_SUSPEND | IRQF_NO_THREAD
-		| IRQF_NOBALANCING;
-	action->name = name;
-	action->percpu_dev_id = dev_id;
-
 	retval = irq_chip_pm_get(&desc->irq_data);
 	if (retval < 0)
 		goto err_out;
-- 
2.47.3


