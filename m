Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B29FFDEE25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xv8IR91E1iPDSRL6znc/7XWH51D69wQn+ndOG08NZbI=; b=cKAqcLdf50qsNaylc/0XVAKPeU
	AWO1yoFk6rtNI//MnlfgLm0jwBAgIQKRSl0qpQHvHDoetJAd9+/yUHQ/iHIF3AxIvrzCmBe0rl+T4
	aDNi0jk/AzCFZxmoxKVJjnGDjGBbbyv28cTAg0wHnlAXBusFX01MzTLVaaBpdMIxn4E/V/NFANts0
	wyPe1xK1QKb4O7K1siIx1FvEfcmLdAuegQSSCMpnetVQr0+DuOSRUqg5l7HYkPFH8dDBLXcqEnHC5
	iSfLSdTnBCHOV8vurFlXwi4eGr5ng/M4bF2qil2l43PZXRaZxXaO9+qhXf+uW1iW89HBx3ySIs+ZC
	lg47MUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFx2S-0000000Byj0-0bzD;
	Thu, 23 Apr 2026 16:36:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFx2Q-0000000Byih-3WZc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 16:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08A2D60139;
	Thu, 23 Apr 2026 16:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6273C2BCAF;
	Thu, 23 Apr 2026 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776962185;
	bh=+ds0NJEr0kE5UiInXg4j6EEFq+upi2AL/UPD2beEDHw=;
	h=From:To:Cc:Subject:Date:From;
	b=MFxUlvEil3p0G4/+Srcn1Lcv8ULKuz5MdQjip3z4jyrMDZoevDjCng49TzOKH9Fv3
	 dEk69l7bhwQeudKNavjKtkNShhpMJB/1SFTf3Pz2vMxn3cSNznEVSMojHW7Gik4F02
	 02YCjdt2DFw4iJJZ7A663518tvdF2eITdNnqbyHexDiw4uFQ23Sfykof2EOXoXZUAI
	 Q/x/5W1MH58mW9ZPe9bkpTVQg+Vs2cbcnGGOqgF0MGDgW4d+yqDaB75QXgCksYYFyM
	 5hBzl2IILNqzK0InB6PGcPYQxnALhyALO7CYvHYN9YblK1EmxBZBODAJQjBnrGFjJq
	 c69nqIqmrVWpQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wFx2N-0000000E7YO-0aR6;
	Thu, 23 Apr 2026 16:36:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Wake-up from WFI when iqrchip is in userspace
Date: Thu, 23 Apr 2026 17:36:07 +0100
Message-ID: <20260423163607.486345-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

It appears that there is nothing in the wake-up path that
evaluates whether the in-kernel interrupts are pending unless
we have a vgic.

This means that the userspace irqchip support has been broken for
about four years, and nobody noticed. It was also broken before
as we wouldn't wake-up on a PMU interrupt, but hey, who cares...

It is probably time to remove the feature altogether, because it
was a terrible idea 10 years ago, and it still is.

Fixes: b57de4ffd7c6d ("KVM: arm64: Simplify kvm_cpu_has_pending_timer()")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 176cbe8baad30..8bb2c7422cc8b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -824,6 +824,10 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *v)
 {
 	bool irq_lines = *vcpu_hcr(v) & (HCR_VI | HCR_VF | HCR_VSE);
 
+	irq_lines |= (!irqchip_in_kernel(v->kvm) &&
+		      (kvm_timer_should_notify_user(v) ||
+		       kvm_pmu_should_notify_user(v)));
+
 	return ((irq_lines || kvm_vgic_vcpu_pending_irq(v))
 		&& !kvm_arm_vcpu_stopped(v) && !v->arch.pause);
 }
-- 
2.47.3


