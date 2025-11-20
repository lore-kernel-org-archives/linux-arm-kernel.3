Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD847CF9C7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VTXSZ2swpCnWLyiUHhID6hPFWkFeBfqtOF7DUE1KK0=; b=FAZe+LihooVNPIO7z2To/dZL6x
	29fQYM5gUhUk0Au8Ml6xwnGYZIFsCGTgg/tHYzNCLoPVNY7674lAZN0TwBQhmzlz28aUMAckgqLNz
	2aDl6/ZyWLlPZ6wU6hxjsZlF6/ktPB9vPYNrYzAONIk7/lfeq5M8Inps/zGEsvv5ugEFBGhKi+fPH
	cTYkYNtji3l0zG69P/YNmCaN77RoITeh6NJCUy726KBej34XsKUHn/QZG6zTaGzCwwD4HdkMSiyEI
	EPChaVg0nMwMvpU2o+P0LMeBSl49t2z4H3Los0J6JSy76nlPz6aHe2NDrSKa6ZjgAih/bdqzcBeQU
	QLlF9N2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q6-000000075kG-3u01;
	Thu, 20 Nov 2025 17:26:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Ps-000000075YL-47GI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFB54443A8;
	Thu, 20 Nov 2025 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0C0C116C6;
	Thu, 20 Nov 2025 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659556;
	bh=37Xd3+8ZfcOqWQuQNM+hELSmr/Jv6uq4o8vA91D2Anc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mz9J7lWA5gy2GR5AA+RU6MpWech/czmilitXTmkXKuEgvTan/PJwrtip+KyVTYBYZ
	 A3nUS5PktEKMffTgP+ElfnSHai/mr5RrxLsPawWWwZxyTnR011UwJXmTd55ePmCzYm
	 WE6MRQyTSK4G7pEh1m8/0pc0Xp+t4QLPtqpHUyelPQRziNkmrsY8IZALEweoux21Vy
	 6KddcRN/U/Rj1B4Ko/3aaWWU8PNY5O7zq1MJ55gPr6fovs6BMgi30zrOF7Ih31BVyD
	 LNt1O6Dbiqnkmmah3nxlZNtKCB0bTLpScfzBGYAWOptELoOk3GxFfLfy/DSI3Pe1ch
	 qyiE4BF1S42eg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pq-00000006y6g-1wrY;
	Thu, 20 Nov 2025 17:25:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 03/49] irqchip/apple-aic: Spit out ICH_MISR_EL2 value on spurious vGIC MI
Date: Thu, 20 Nov 2025 17:24:53 +0000
Message-ID: <20251120172540.2267180-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092557_040781_FDDC0647 
X-CRM114-Status: GOOD (  11.03  )
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

It is all good and well to scream about spurious vGIC maintenance
interrupts. It would be even better to output the reason why, which
is already checked, but not printed out.

The unsuspecting kernel tinkerer thanks you.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-apple-aic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 032d66dceb8ec..4607f4943b19a 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -411,12 +411,15 @@ static void __exception_irq_entry aic_handle_irq(struct pt_regs *regs)
 	if (is_kernel_in_hyp_mode() &&
 	    (read_sysreg_s(SYS_ICH_HCR_EL2) & ICH_HCR_EL2_En) &&
 	    read_sysreg_s(SYS_ICH_MISR_EL2) != 0) {
+		u64 val;
+
 		generic_handle_domain_irq(aic_irqc->hw_domain,
 					  AIC_FIQ_HWIRQ(AIC_VGIC_MI));
 
 		if (unlikely((read_sysreg_s(SYS_ICH_HCR_EL2) & ICH_HCR_EL2_En) &&
-			     read_sysreg_s(SYS_ICH_MISR_EL2))) {
-			pr_err_ratelimited("vGIC IRQ fired and not handled by KVM, disabling.\n");
+			     (val = read_sysreg_s(SYS_ICH_MISR_EL2)))) {
+			pr_err_ratelimited("vGIC IRQ fired and not handled by KVM (MISR=%llx), disabling.\n",
+					   val);
 			sysreg_clear_set_s(SYS_ICH_HCR_EL2, ICH_HCR_EL2_En, 0);
 		}
 	}
-- 
2.47.3


