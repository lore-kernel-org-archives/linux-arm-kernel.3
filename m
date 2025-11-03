Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D567CCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wt/YaIdP5H2iqjN5ZcW+LJhKxJ7W2AmyJFnbxNjqU/M=; b=P9rBTOKHv2dhXdoK2lDGF34uKN
	ocEl/B0ygEtLDY/er8B4qZKJN/TUpsDF9Cr5dvRZ7nDgyv01W+KtgdxboE2MF5QqyJoY2dtCqZSuJ
	YoZ5kDhXoePxwq7jA72EXqu2y3GwgG2aQ0koDds9qOYMG3+BqoAaGF4b3MZbA7Hzsu1tSLkrddjt4
	v2haphqh5dyVEXqqppKO7qiifhOKVLQBqUbkrGO5rDmsdJVQoss+uYhqPHi13NTd+w86b3MgotA/0
	mBI4HuabVo4exD5FBTOrJOz3Vwy7Xnm7m8gJBIOqg2d1Aricu4eRnau6j/3Bdm1JeBJbvOv5TGztL
	X1dcW9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq7-0000000AK15-1Otk;
	Mon, 03 Nov 2025 16:55:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq4-0000000AJwy-10hn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82BA64388C;
	Mon,  3 Nov 2025 16:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6692EC4CEE7;
	Mon,  3 Nov 2025 16:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188927;
	bh=OMxD2PYcmSUFGf3eaSzIGAaXKeRPy9/qh6982gD/Xp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VYA9XzlO/t8NiQpLYfMq7BC7TxV6sKrJOkNnRH18fve5zMjUDh4T5Vpk5cil4fLSo
	 TRo5kVG1oMr+kNqt28OaRZFvl12aTExFw3uA6U7VqxYS0N3sm3WGnNfZDodHVrJn2d
	 DYFaWxf3kCbQqu0uHR9GRQRED+DRBvTsDr6k4FhOjsxj7bvejwy82PD2qUtmTgZIrY
	 /wNW/I8gXTCvJbco9Hc/3TYuglHY2K3Hb8RJlk9G6ocxvp1ue9GiknXw1yQ8ylsIRz
	 h61VTUisVuUXAZQnLYY3IzXrGK9FyOxEqUiom6VAqxTArl0WKjrP8LD1YD14wcbRCM
	 achBZm5+F7mgw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq1-000000021VN-1bHg;
	Mon, 03 Nov 2025 16:55:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 03/33] irqchip/apple-aic: Spit out ICH_MIDR_EL2 value on spurious vGIC MI
Date: Mon,  3 Nov 2025 16:54:47 +0000
Message-ID: <20251103165517.2960148-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085528_300983_6D131655 
X-CRM114-Status: GOOD (  10.92  )
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


