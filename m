Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C220C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvazE23f8HbO9Hml0EoomjcFYwH5DF1NlDQc34IZPO4=; b=3bJnzjnazwFFDxvRXjA6lc5mJd
	onveee6GkSrmxeNwPA5HP/6NOvrTXP89gzhdrHLDW/NdtQbUtCZlSe4jp42b7+AHHgsrgjVjiMZzb
	jfnR+PqIaMPI0n+4tlSH46GBUD/lsb0vWO+9xhPAP/zti5zqwI7RQwzRV4J29ny53LrCLzgRPo0/G
	GWvEnTUkZU2MMeZGWkAd5yoMI22gSvUMB7cP7ODMjMfVAtsA2/L6+rzmFP3Fm+n0EUG3WRLt4eiz6
	zWmXBJeSZl38aXVSYJk1Y9JdYwD+TAYUozN7686CPkK2/DbtW26x7gVo4Q3LaDbN1NVbSHbaQ12TB
	dAbDtIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zg-0000000FhgL-3ezl;
	Wed, 12 Aug 2026 09:11:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zR-0000000FhY2-3MUA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:11:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4098F60A85;
	Wed, 12 Aug 2026 09:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CF71F00A3F;
	Wed, 12 Aug 2026 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786525873;
	bh=MvazE23f8HbO9Hml0EoomjcFYwH5DF1NlDQc34IZPO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kA+kaDCt0+N1ZeV0yvog50Gvju6gxEOR1X100qjD0pJbFMFgqoOhlUT3d1Dw0X10v
	 /c5xFBNLJ2PgPNCY47gd9YuE1h80SzFO+uctV14GEcVMWBzyosQdE1A32e9k6AJogX
	 2opdeT2UlzadgxAFlnb+pinDOMyawTSuZHFrL14Vm/mIqGtNCERsJuQ2aavdGc0sav
	 9ifFdyhLC4JRX/3Y4GDk4gPtVKefVdKpI6svl8SwbOwbXq+sELNnahr7eolqI36mpF
	 C0G1LhUFRJ0K7l1ywSFmhntuTFwu4ibsVL2GXrkSD46RZ16/CNaY7Y3XvRsH8sPk0q
	 fLY4V8I/wy5lw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 12 Aug 2026 11:10:34 +0200
Subject: [PATCH 6/7] irqchip/gic-v5: Use logical cpu 0 irs_data for dynamic
 IST allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-gicv5-7-2-fixes-v1-6-3743e82c69a4@kernel.org>
References: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
In-Reply-To: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
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

In set-ups with a 2-level IST, L1 table entries are created dynamically
when LPIs are allocated.

The L1 allocation and mapping, implemented in gicv5_irs_iste_alloc() is
carried out in preemtible context and can be carried out on any IRS in
the system.

Current code indexes the per_cpu_irs_data per cpu array using
smp_processor_id() to retrieve the IRS that is local to the core
executing gicv5_irs_iste_alloc().

Since that's preemptible context, the core executing that function can
change on preemption. Given that every IRS in the system is equivalent
to each core, this is not really an issue in that even if the thread
is preempted and resumed on a different cpu, the table allocation and
mapping to an IRS would work seamlessly regardless.

On the other hand, smp_processor_id() spits a legitimate splat on
DEBUG_PREEMPT kernels when used in preemtible context and this should
be fixed.

Given that all IRSes are equivalent from a core perspective in terms of
IST initialization, always choose as a policy the IRS local to logical
cpu 0, preventing the smp_processor_id() splat.

Fixes: 0f0101325876 ("irqchip/gic-v5: Add GICv5 LPI/IPI support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Link: https://sashiko.dev/#/message/20260810104747.E5CE71F000E9%40smtp.kernel.org
---
 drivers/irqchip/irq-gic-v5-irs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 86da9f82a7b0..b3feb6340b59 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -199,7 +199,7 @@ int gicv5_irs_iste_alloc(const u32 lpi)
 	if (!gicv5_global_data.ist.l2)
 		return 0;
 
-	irs_data = per_cpu(per_cpu_irs_data, smp_processor_id());
+	irs_data = per_cpu(per_cpu_irs_data, 0);
 	if (!irs_data)
 		return -ENOENT;
 

-- 
2.53.0


