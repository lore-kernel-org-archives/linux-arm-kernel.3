Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A040CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmy5epLvf30ywOJkthaZN8sVqiQwJ+CogCJFsfNGO5c=; b=voa02tbU+vOufrdTm+it+t3Enc
	mkhuZlPiTCuBV63bMQ3ELYnQZABh8QkqXaGeiz9Kahc7QXgRtpyK2Rtt0psTdJsqK306L2HDVpmkC
	sc0Qbk8c1SpRDLC2XUGdAkn+Y98G6oNOwRCKv6Qaef4rlgl2THzImpiymRCnqTub1PuuxAOt5Eqc6
	Hz/eLSFzk0BG02xpLos6nZWdn8T82AcWgDxeesMgI/UXmj2CIx3B8pSTjjYsC5evEfx4i68jjEf1p
	0krHsdaBL8s/cNgRxD6yArqCzEonKUeYp+0NbsRMRvvSf+yUiS1qhz5QsoPSW6LMWIVke63fqI9eO
	xQMe17vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bur-00000009hw3-26Ze;
	Mon, 22 Sep 2025 08:28:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buh-00000009hgf-43vr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB05644EEC;
	Mon, 22 Sep 2025 08:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F109C2BCB2;
	Mon, 22 Sep 2025 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529727;
	bh=5oCc+dLTBF6I6+VTyZ2PgmQ5+u/2TekQHk9FmxUKaWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dICzztiADFw7mPwKkNslW5gqghRlurC9O0SRGucY2k87PX1vZWmEIG9owrjl1U45+
	 2pukEh1dSEgng0KEuBu9yT2r4wFEvqiPThfaLZ7NzbK/Jr/CQ6eZpFc7UIT2hyZ9Yc
	 QQFH2R1wVOxQiz7wUDqXaNupnOttj9pw8zbOQQZNIHypmXMfTu6epxA0GS1u5H85JC
	 KGtne6OkwvU8zlTwDuX9CNfbZo04rrxo3IIz7yhAEQ/X69jIcFC7Soj7upLry/KSon
	 uge2SJZCzOkU225tDn/257o0PlyQR7yymiNu1Net8fLz96/SmBvbSZcq1f8B6EF+18
	 6Bgt0p4pD3iyQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0buf-00000008Kds-2s5s;
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
Subject: [PATCH v3 14/26] genirq: Add affinity to percpu_devid interrupt requests
Date: Mon, 22 Sep 2025 09:28:21 +0100
Message-ID: <20250922082833.2038905-15-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250922_012848_070211_353CC5A2 
X-CRM114-Status: GOOD (  18.33  )
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

Add an affinity field to both the irqaction structure and the interrupt
request primitives. Nothing is making use of it yet, and the only value
used it NULL, which is used as a shorthand for cpu_possible_mask.

This will shortly get used with actual affinities.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/interrupt.h |  5 +++--
 kernel/irq/manage.c       | 14 ++++++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 0ec1a71ab4e84..52147d5f432b3 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -125,6 +125,7 @@ struct irqaction {
 		void		*dev_id;
 		void __percpu	*percpu_dev_id;
 	};
+	const struct cpumask	*affinity;
 	struct irqaction	*next;
 	irq_handler_t		thread_fn;
 	struct task_struct	*thread;
@@ -181,7 +182,7 @@ request_any_context_irq(unsigned int irq, irq_handler_t handler,
 extern int __must_check
 __request_percpu_irq(unsigned int irq, irq_handler_t handler,
 		     unsigned long flags, const char *devname,
-		     void __percpu *percpu_dev_id);
+		     const cpumask_t *affinity, void __percpu *percpu_dev_id);
 
 extern int __must_check
 request_nmi(unsigned int irq, irq_handler_t handler, unsigned long flags,
@@ -192,7 +193,7 @@ request_percpu_irq(unsigned int irq, irq_handler_t handler,
 		   const char *devname, void __percpu *percpu_dev_id)
 {
 	return __request_percpu_irq(irq, handler, 0,
-				    devname, percpu_dev_id);
+				    devname, NULL, percpu_dev_id);
 }
 
 extern int __must_check
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index d9ddc30678b5d..5f4c651677436 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2444,10 +2444,14 @@ int setup_percpu_irq(unsigned int irq, struct irqaction *act)
 
 static
 struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long flags,
-					  const char *devname, void __percpu *dev_id)
+					  const char *devname, const cpumask_t *affinity,
+					  void __percpu *dev_id)
 {
 	struct irqaction *action;
 
+	if (!affinity)
+		affinity = cpu_possible_mask;
+
 	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
 	if (!action)
 		return NULL;
@@ -2456,6 +2460,7 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long f
 	action->flags = flags | IRQF_PERCPU | IRQF_NO_SUSPEND;
 	action->name = devname;
 	action->percpu_dev_id = dev_id;
+	action->affinity = affinity;
 
 	return action;
 }
@@ -2466,6 +2471,7 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long f
  * @handler:	Function to be called when the IRQ occurs.
  * @flags:	Interrupt type flags (IRQF_TIMER only)
  * @devname:	An ascii name for the claiming device
+ * @affinity:	A cpumask describing the target CPUs for this interrupt
  * @dev_id:	A percpu cookie passed back to the handler function
  *
  * This call allocates interrupt resources, but doesn't enable the interrupt
@@ -2478,7 +2484,7 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long f
  */
 int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
 			 unsigned long flags, const char *devname,
-			 void __percpu *dev_id)
+			 const cpumask_t *affinity, void __percpu *dev_id)
 {
 	struct irqaction *action;
 	struct irq_desc *desc;
@@ -2495,7 +2501,7 @@ int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
 	if (flags && flags != IRQF_TIMER)
 		return -EINVAL;
 
-	action = create_percpu_irqaction(handler, flags, devname, dev_id);
+	action = create_percpu_irqaction(handler, flags, devname, affinity, dev_id);
 	if (!action)
 		return -ENOMEM;
 
@@ -2560,7 +2566,7 @@ int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
 		return -EINVAL;
 
 	action = create_percpu_irqaction(handler, IRQF_NO_THREAD | IRQF_NOBALANCING,
-					 name, dev_id);
+					 name, NULL, dev_id);
 	if (!action)
 		return -ENOMEM;
 
-- 
2.47.3


