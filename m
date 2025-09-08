Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CCBCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8uQ4S6Q+WFo3iTdRanEZRSK4B9tTYYThrntoKwpDIc=; b=KrOfwnaErTp+pOmhov2huBaMjg
	HE23ZZvGv2/qX2c7rlNuj0hmPw9O6jOj6Mu0iEW1EJbz3YvWeijhX27eD1shUoH53wvUAAcSgwOTS
	d11r/GDGjAQO1qgBHof/27IpMV9IpVP2Tvn1Rv8jJe0cVaHTeHubhsqkIZjgDU0I+TAfpfNm9aiyS
	fvck6cnpCIUHvzo9zW3CsVHIcYYhw3KLSD8PVoRIF7Gza/uovgDvpmdZZUcjOACT2a5SOdXNyAuYN
	94aXxBobWK+1sxTkI5c7WyC65TtPKRvx+lv4HSXh+s6RCiqyak8kyLQyIo803I6FIWw2D2Nsr5Yaw
	E5ypLFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvheM-00000001vYB-3EWr;
	Mon, 08 Sep 2025 19:35:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemV-00000000lPv-1wky
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F318244A3A;
	Mon,  8 Sep 2025 16:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1812C4CEF7;
	Mon,  8 Sep 2025 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349110;
	bh=sEOwaQI0DOMRXSsbHn/28FN+LFNb2hLejQ1sYBs7F+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3IlUqh5gqBgjMMhwQO1HFVXgv5q+agMYWsMDTP1qDxoi7uS4qf/u8o8/gSIXoIUT
	 gbyiux5rvF+in9bPiLm10sJV+UoDjn8b2fe/qBInJnyRinzM2bbSpG6H+1D3qyPtc3
	 ZGYC7AtYqDZaRBCU5UMFs6XviTSps2vw8JWRR/onXdnxcmp3UXT8vKMxTFxSNbPFOJ
	 ZVOzbyXhZZz8L0KO/1xVtoA7K+SNV3CvQGCM+CiR3+VPT4mtTovZC6bP6MdTWp053H
	 r6Tu0ObaNfZc4V6AHuTe2Uks8ndTGKFehAT2ZYM2zsfqeYtLvA2tEpzBdZbpOKG0Q4
	 LqxFNjXXi9/iA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemT-00000004NTm-05uU;
	Mon, 08 Sep 2025 16:31:49 +0000
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
	James Clark <james.clark@linaro.org>
Subject: [PATCH 13/25] genirq: Add affinity to percpu_devid interrupt requests
Date: Mon,  8 Sep 2025 17:31:15 +0100
Message-Id: <20250908163127.2462948-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093151_582098_AE12BA01 
X-CRM114-Status: GOOD (  18.60  )
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
 kernel/irq/manage.c       | 13 ++++++++++---
 2 files changed, 13 insertions(+), 5 deletions(-)

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
index 980725bd93e95..ac394f0b422b8 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2446,10 +2446,14 @@ static
 struct irqaction *create_percpu_irqaction(irq_handler_t handler,
 					  unsigned long flags,
 					  const char *devname,
+					  const cpumask_t *affinity,
 					  void __percpu *dev_id)
 {
 	struct irqaction *action;
 
+	if (!affinity)
+		affinity = cpu_possible_mask;
+
 	action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
 	if (!action)
 		return NULL;
@@ -2458,6 +2462,7 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler,
 	action->flags = flags | IRQF_PERCPU | IRQF_NO_SUSPEND;
 	action->name = devname;
 	action->percpu_dev_id = dev_id;
+	action->affinity = affinity;
 
 	return action;
 }
@@ -2468,6 +2473,7 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler,
  * @handler:	Function to be called when the IRQ occurs.
  * @flags:	Interrupt type flags (IRQF_TIMER only)
  * @devname:	An ascii name for the claiming device
+ * @affinity:	A cpumask describing the target CPUs for this interrupt
  * @dev_id:	A percpu cookie passed back to the handler function
  *
  * This call allocates interrupt resources, but doesn't enable the interrupt
@@ -2480,7 +2486,7 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler,
  */
 int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
 			 unsigned long flags, const char *devname,
-			 void __percpu *dev_id)
+			 const cpumask_t *affinity, void __percpu *dev_id)
 {
 	struct irqaction *action;
 	struct irq_desc *desc;
@@ -2497,7 +2503,8 @@ int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
 	if (flags && flags != IRQF_TIMER)
 		return -EINVAL;
 
-	action = create_percpu_irqaction(handler, flags, devname, dev_id);
+	action = create_percpu_irqaction(handler, flags, devname,
+					 affinity, dev_id);
 	if (!action)
 		return -ENOMEM;
 
@@ -2563,7 +2570,7 @@ int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
 
 	action = create_percpu_irqaction(handler,
 					 IRQF_NO_THREAD | IRQF_NOBALANCING,
-					 name, dev_id);
+					 name, NULL, dev_id);
 	if (!action)
 		return -ENOMEM;
 
-- 
2.39.2


