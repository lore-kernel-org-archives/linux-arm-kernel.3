Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7988FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mXUR6fwEd+l0SmGEm+HWa6PfAmUsYcC1//bGnZmKVY=; b=3HGli35q6HdPrShqVh+XdFOuEL
	u6fylF9t/aI32UTYVUZUQB5XpwM0xRUeO8GqCj4TeT3VSliVD8pW6+WyVnU7F0+xSwqdgdt8EW7d9
	Vl2kEF+gI1p28EnLXB//kOjUctVU7pGS561f6MrI5shM0QNfPlEdx8HGLmath0xXrhbNIDZqpP4lv
	lVWXJFGgbHLjrhGL29iTKeWpwHFnUwKZCPqww1xSMdpYOxapZh4/Owib356z1ezP4HMzS7mGmt2Vw
	le6NJIoF48wvZ5RdCZ9c7+zoTkjzVVfAmlURsKbbsWh1jb5VEHJvkITIWtuVnyoC3kTFuTg7nFjPT
	7rYMG2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd7P-000000048o2-1jpj;
	Wed, 20 May 2026 09:21:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6Y-000000047iU-2l8u
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0mXUR6fwEd+l0SmGEm+HWa6PfAmUsYcC1//bGnZmKVY=; b=kj6Mqwvlvfbjd22ssYCnC6IDjA
	jdme4A+5Q2J3ievq+lUr6rwk6g4ZJ1f8CIxHcsJ0SiBZrrWhRhJu/PV7p6RMrWEJxUmvEcaOELbfl
	UOS2dxQg8uNjoirfPp1l0bFRtIi613SiqA5TYISFNfrsdmztRoZ+qZAC6liPn3TfSO4Yq3I/Wevg2
	mAEsVFVsaWbXMIH9tjGpdKOBClhKa/N28/Zpnp9+QzwShhBxPfveKwQtLyaibtBETQzm2zIT9/MvC
	z8KTZIjoCV64gOBfmOYNIFdX/XNp8MfANo8qgaf/DHspF6FWAC4BKNXamGXL0a864nGXVcw6eKn4G
	nm7M0zYg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6J-0000000GKYD-2fML
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EE0D4445C;
	Wed, 20 May 2026 09:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D5C1F008A1;
	Wed, 20 May 2026 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268815;
	bh=0mXUR6fwEd+l0SmGEm+HWa6PfAmUsYcC1//bGnZmKVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QIDqcAswcpESA1hmA6kPG7ccYMskjvulaWm+lF8WUGo6JVbJcC+LJB4oOUv5/jG+v
	 oeGI70RchhQnUk3yGdblNB3FVftzTx6+ish3Kf0Qr1I0CbulkmU6gvamzmYXSg6fQH
	 9MMmA32G5rqn23oGc6nid+vRWv3jKDBuA7w/rEf5aEv8TYtOoACZnnUxPyICF3MBD0
	 VfcAoZlIlTRkWhI5hdul0fxNSP0EJGwJxrWQLe97GNZvCqJ5e75b4X28oOxdNVSBYC
	 nN3LfUemfvKEKM5y0a04JuFRd/00K086MiTJ4RvpzlmAFepVJZUL00Kem93CgSe9pZ
	 tAFytX/GcSekA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd65-00000004IaV-3DvB;
	Wed, 20 May 2026 09:20:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 17/18] irqchip/gic-v5: Immediately exec priority drop following activate
Date: Wed, 20 May 2026 10:19:48 +0100
Message-ID: <20260520091949.542365-18-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102034_183846_610C4649 
X-CRM114-Status: GOOD (  20.51  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

With GICv5 an interrupt of equal or lower priority cannot be signalled
until there has been a priority drop. This is done via the GIC CDEOI
system instruction. Once this has been executed, the hardware is able
to signal the next interrupt if there is one.

As all interrupts are programmed to have the same priority, no new
interrupts can be signalled until the priority drop has happened. This
can cause issues when, for example, an interrupt remains active while
a long running process takes place, such as when injecting a physical
interrupt into a guest VM in software.

The GICv5 driver has so far done the priority drop as part of
irq_eoi(), i.e., at the same time as deactivating the interrupt. This
means that any long running process (or VM) could block incoming
interrupts, effectively causing a denial of service for all other
interrupts.

Rather than doing the EOI as part of irq_eoi() (which the name would
suggest would be a good place for it), move it to happen immediately
after acknowledging an interrupt in the main GICv5 interrupt
handler. The deactivation of interrupts (GIC CDDI) remains implemented
as part of irq_eoi(), which means that the same interrupt cannot be
signalled a second time until deactivated by software.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 6b0903be8ebfd..58e457d4c1476 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -218,17 +218,13 @@ static void gicv5_hwirq_eoi(u32 hwirq_id, u8 hwirq_type)
 	       FIELD_PREP(GICV5_GIC_CDDI_TYPE_MASK, hwirq_type);
 
 	gic_insn(cddi, CDDI);
-
-	gic_insn(0, CDEOI);
 }
 
 static void gicv5_ppi_irq_eoi(struct irq_data *d)
 {
 	/* Skip deactivate for forwarded PPI interrupts */
-	if (irqd_is_forwarded_to_vcpu(d)) {
-		gic_insn(0, CDEOI);
+	if (irqd_is_forwarded_to_vcpu(d))
 		return;
-	}
 
 	gicv5_hwirq_eoi(d->hwirq, GICV5_HWIRQ_TYPE_PPI);
 }
@@ -963,6 +959,13 @@ static void __exception_irq_entry gicv5_handle_irq(struct pt_regs *regs)
 	 */
 	isb();
 
+	/*
+	 * Ensure that we can receive the next interrupts in the event that we
+	 * have a long running handler or directly enter a guest by doing the
+	 * priority drop immediately.
+	 */
+	gic_insn(0, CDEOI);
+
 	hwirq = FIELD_GET(GICV5_HWIRQ_INTID, ia);
 
 	handle_irq_per_domain(hwirq);
-- 
2.47.3


