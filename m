Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4495FC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCWZk6dZ1ueJ1e40gID5CgJryX+YizT3Gr0eJprDoaA=; b=mrmPK03At4XyCnM0CWsv2lLyAz
	D0k0wy4jhaCLFxVXlFqeOOA3vlYfizutHI/S/0FHl2cEbMrq9uVR/7oADrG1TkPrFZyNU6S/7GsrL
	GXCZgZzLrlNs3PeqDWgfMwvDy+PFyjNpZKrka6+oJE1THXS5KL2IHBpXjcZids4BXdCQpVUtEAv8A
	F8mDTC47dnu8rjvK2LmxbVDS3CwBUohhwYp4Rbj6tQDaHBATJ4sut93WkM0aHNbOWBbqLur2fP/es
	NeIVnX45ZfbZi8zVw0dQV0imnhbd9Y664tC5rEbZYfR1E7L53JHBbTqTf9fpb25l7JX7F/Cxyb6AH
	ZZCGblMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Jf-00000009Uxv-0lOz;
	Mon, 31 Aug 2026 13:44:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Jd-00000009Uwx-22ef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:44:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3E516025F;
	Mon, 31 Aug 2026 13:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930961F00ACA;
	Mon, 31 Aug 2026 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183888;
	bh=NCWZk6dZ1ueJ1e40gID5CgJryX+YizT3Gr0eJprDoaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jy9v83Tz0MW54PhWC7rnE0qNW0UKPhBt/jxKV/t51bu/oRuHb3ldAfzhCgFwwjZKP
	 JqOFh4RyvM/PnoUQ6LiAvCjsTCapoUhu3fdCO13x3T3kRwZKQwa+EtfzFwcQgD18Jc
	 fQ22EpietQOjpOKJRZJN82JOOcN+0/O4R/7CPVg8c5dLcM0VfmspidWRU3xbi2bTf3
	 Km81RTob0+xsK+ICDM8nwdnJ/2hJccEdpKEfcgWnG7wd4pYUyfgZp4YYOX7ZZ96Bn7
	 3+OxgE+mccCrw5DJGxK8gj0Fm9CPkhl9+nKX6cL+b+pi4pEd0DXMruO5/IlYCe537i
	 QHlZhLr5Om/ww==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lpieralisi@kernel.org,
	tglx@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] irqchip/gic-v5: Immediately exec priority drop following activate
Date: Mon, 31 Aug 2026 09:26:31 -0400
Message-ID: <20260831133314.4125787-363-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Transfer-Encoding: 8bit
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

[ Upstream commit abf60331ebe9a9a7937a72aac7699c2907ab9307 ]

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
Link: https://lore.kernel.org/r/20260520091949.542365-18-maz@kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The follow-up git searches finished and match the earlier analysis:

- No commit on `stable/linux-6.18.y` or `HEAD` backports this GICv5
  priority-drop fix.
- `git log --grep="priority drop"` only turned up unrelated older GICv3
  commits, not `abf60331ebe9a`.
- `git log --grep="stable" -- drivers/irqchip/irq-gic-v5.c` shows no
  stable nomination for this change.

So the fix is still missing from `v6.18.44`, and the backport
recommendation stays **YES**.

 drivers/irqchip/irq-gic-v5.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index fa86dd03e307c..f5341522658ba 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -207,17 +207,13 @@ static void gicv5_hwirq_eoi(u32 hwirq_id, u8 hwirq_type)
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
@@ -914,6 +910,13 @@ static void __exception_irq_entry gicv5_handle_irq(struct pt_regs *regs)
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
2.53.0


