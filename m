Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6124FCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wt/YaIdP5H2iqjN5ZcW+LJhKxJ7W2AmyJFnbxNjqU/M=; b=pY8AZEvJrccrpaoKWKI9Zgx3fi
	xY0n2zVywJCvsCQ9k4WbRydnGU+16D55GbSQI8nFlnpPr6EazEGuTZ3vDrWdp9FgX8PXMKOAm9VjD
	PKWmpiTkMCntFwlXFf85kvqnV2n3pBD6MBPz0alRjEddGd6bO3NDv10QXV9Z+cqGmmroApyzScuDE
	ZaiATXb1NwzpraFiwu+X8EcOo4N8rx6Sww6ZqMBHKjCWg2rdjoUbd08gK57RmdS9VcCcDewB/MnVt
	AOTWeRrPl1Mg0F5lVrsa4YFIXJ/8cQq8FefhP787yvXpxViQ7X0TiRx3HVtaJJtk9ZZFTl6kVxkRP
	dURPCQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91m-00000004CCd-2iY7;
	Sun, 09 Nov 2025 17:16:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91j-00000004C93-2rWX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5F4F443E8;
	Sun,  9 Nov 2025 17:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D37C16AAE;
	Sun,  9 Nov 2025 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708590;
	bh=OMxD2PYcmSUFGf3eaSzIGAaXKeRPy9/qh6982gD/Xp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qd0BhEfegc1iMWoMO05wAYc3i7EJNt+c3LH7xwg8XxeO1ARZh0Oga1o0Ig5NofqUd
	 kl37R4UBMiwYcQ+RszbHR2WjfTUc79faKIx3+HzgZm8+rxsPsAJ5So/KJ+GYwN1v4o
	 jaKTxYuaQ6NFbtka7HEG/FCd5vMIvU74/DgzrFRrn1W8Ds10eHb3lU+Tk2wkztw674
	 rfhC/+VlaE9+TaxCZXYXn/O/Ep9Xa/XQWjTecuKrHCBSJyt4qfm22Q/q0GxlVEcnTZ
	 +YzFirwzm040D3zVr1O/RBYHxbJGFJ++djixiFe7bGGaEGxtVmidrGSwhz7Rm2A7ue
	 oYjidzl6WGz9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91g-00000003exw-29H9;
	Sun, 09 Nov 2025 17:16:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 03/45] irqchip/apple-aic: Spit out ICH_MISR_EL2 value on spurious vGIC MI
Date: Sun,  9 Nov 2025 17:15:37 +0000
Message-ID: <20251109171619.1507205-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091631_742221_46DB1189 
X-CRM114-Status: GOOD (  11.39  )
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


