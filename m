Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE81CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ooTVQbdvfgrWU0UI0NVqvCZr2tv2onIqVoEV7pKPJs=; b=fOL00xxODzXhRaGAInMnwK0gF/
	7VtrAZbtUrvX0LB0P4GS4bbFtk7ae2YyHKLtSF7vfsrX9pD3DuhGHN7ypNmKq5iHgKl4QVFPnRbA5
	/1K7mDB1xiTxwaxDvK914or4I0u8Mn4WuqpHrFBj3tAoPnL1DP/a96tYwvsELzA7RElQiDzbZOeCR
	pT1NPTWi3LWENQ54pt8CpWeWFzRn8AJ87mMQht/c7EY20JIpFmHgo3PIsQflNH42+iUY35RNJPtUA
	TTWwmNO09boPRYffr0nvGjXPXx2z9PuJBIJNRd8KxkVJh9itDD0ihh8edco//IBd52LCYcB1L2249
	WflLVrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp3G-0000000DT93-2uEc;
	Mon, 20 Oct 2025 12:31:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp21-0000000DRHd-0mNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37C2548AF4;
	Mon, 20 Oct 2025 12:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151A6C116D0;
	Mon, 20 Oct 2025 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963413;
	bh=MkMz4J0zz9h+l83iN4rN2xM+aHAO0Wv89SlEoxIRnuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ayl/YwCwDKcnkcJr9jvXn+m46l0TwdOn3o0AKSBiPglQvaAyi8squdVUZn/9efg2U
	 sd6tgb8WapVUif04BicpO9US+UfOglKdATdf3TNXz6uklRCUn33U7GMccEayUoDtF/
	 /9oOUPfKTOQc64Jw/x/bGDzGvBWGiboXX5nPj4ibqyq0ZCgg0N3j+FATdmIvxutQbn
	 lSNUtV2XO+ssrgNTW3xF+eOcFwTLqVu0NGoddVImzu5WePH6KxAzchElcynluau2ct
	 wKXZQUGZ5FOL5gcvlmgFyNbFc6lscApEZl5Bk+Gui2fWbBUrikCEU6n4E7r+Rcec99
	 hVsR21XXqRAEQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1f-0000000FUu2-0pYQ;
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
Subject: [PATCH v4 13/26] genirq: Factor-in percpu irqaction creation
Date: Mon, 20 Oct 2025 13:29:30 +0100
Message-ID: <20251020122944.3074811-14-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251020_053033_657893_1214C49A 
X-CRM114-Status: GOOD (  18.99  )
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
Tested-by: Will Deacon <will@kernel.org>
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


