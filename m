Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AADAC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45oTmQP1SXYA+aGwK18rImau8rHNkkL/xftpEJkoGYs=; b=ZmzB1ZsV7IvFaAbFeRhEkRizI+
	zsMoqlvAcW1AwGwCXb2x1QHooEusLXsaYfBnh2ruHR/AzhDq0BF2l3T8xfCOOqdADKLVJKLKgxS3u
	1S2cyTbB7zUHvFvKEXpoSx86oL1XvzCN2T8RcDS3h6L/Ew5RPeAXAizEJ6W5eiZSFAzydgnh+9WYS
	A70ctqsv6B1Y6F5EIHUYRzziBKOZsBlKwBFPnk+pkAP67H5ChY6kX+lARJPvMwJoinT9zX+TnkRT0
	19qYDQbVnJzgqEpNr+x7Gv7xe80b2/MqLM7HOmjFVt7CEY9X592MSuLaQXEcePvXFY/yGNKQmwvtz
	M1Y+sI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zN-0000000FhVl-31p3;
	Wed, 12 Aug 2026 09:11:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zM-0000000FhUd-1D0I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:11:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B920860A85;
	Wed, 12 Aug 2026 09:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359961F00A3A;
	Wed, 12 Aug 2026 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786525867;
	bh=45oTmQP1SXYA+aGwK18rImau8rHNkkL/xftpEJkoGYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dyUIywoeERVqJLkAEmKO9UCxXJTHMtXsYjvPcCLllEEb8Ax0jdPzEMfgfFvRanYSl
	 /AstqOMriUWtD38LIeqne12q8CGYFUO95ktGUjWIRcbho/PzHD8OqM8s/Zdw6pQMiF
	 1/gT+/7U3AbQUkxzeR9zLgbuMO7VHbXxQgY4jts2uRlFpvsEb2g1fr13YsOM7gDK2E
	 DKIaQMk88Xo7j6XsNGkHZ0pqhn8nTkj2a9rWnR4IErwVEVjvqZ1tygtIgAyqwGKnVU
	 6cVK0QVJxvvUGBxqvEj7l2teFEpuhR/VWFeZIOhKcZKDuqfPaACTVHGzFkoZZ/3fw8
	 AG41qgvbie1Fw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 12 Aug 2026 11:10:32 +0200
Subject: [PATCH 4/7] irqchip/gic-v5: Fix gicv5_init_common() error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-gicv5-7-2-fixes-v1-4-3743e82c69a4@kernel.org>
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

Current code fails to disable interrupts on gicv5_starting_cpu() failure
and to set the handle_arch_irq pointer to NULL if gicv5_irs_enable() fails.

Update the respective error paths to fix them.

Fixes: 7ec80fb3f025 ("irqchip/gic-v5: Add GICv5 PPI support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index a7fae93e993e..4f5d1eebb4fa 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1174,7 +1174,7 @@ static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
 
 	ret = gicv5_starting_cpu(smp_processor_id());
 	if (ret)
-		goto out_dom;
+		goto out_int;
 
 	ret = set_handle_irq(gicv5_handle_irq);
 	if (ret)
@@ -1182,16 +1182,17 @@ static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
 
 	ret = gicv5_irs_enable();
 	if (ret)
-		goto out_int;
+		goto out_handle;
 
 	gicv5_smp_init();
 
 	gicv5_irs_its_probe();
 	return 0;
 
+out_handle:
+	set_handle_irq(NULL);
 out_int:
 	gicv5_cpu_disable_interrupts();
-out_dom:
 	gicv5_free_domains();
 	return ret;
 }

-- 
2.53.0


