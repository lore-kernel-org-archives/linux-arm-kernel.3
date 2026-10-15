Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD48DCC6B3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmnveEK/Au4BHKu6rYCY9uow2IlDD6JSmyT+v9bH2+4=; b=U5RhQB1bqOaaJ7sv7oBRk8aIIM
	GPg4R43xjsuvZZ67bMMzU0mX+Ehjaar+S/aRQLcEdgzXl5o4x3qSuAB+eFUksLTIkdsGbU2pnz10o
	4oGJR3nuJJPlcROe4GxO5lVGELKxo64LkNPpZ6Mcc08zaaaLOFco7x9bli6nb4mOVl/5ciX0DOdSE
	csLqL/ETgsXcJRrDzOsx5+Ez5wN/kUf7Kgb386j8JiJFLKcsuua4Aqm0y4NMcz8FM1JLXmY2GUx+k
	GMB9TUhowkK7lD462HHEhp3ZSku/sfKIsDt1+yvhnXpHXD2P+VmvJ4qoKS+wrkB3+GnkMOY83kIPu
	FywDQ+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHILO-0000000HNsU-2IaG;
	Thu, 15 Oct 2026 10:05:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHILJ-0000000HNqF-3m0Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:05:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33D2660120;
	Thu, 15 Oct 2026 10:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF60A1F000C4;
	Thu, 15 Oct 2026 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058744;
	bh=BmnveEK/Au4BHKu6rYCY9uow2IlDD6JSmyT+v9bH2+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PMvC8hbTwx35EDF1mfYnZMdo12CxUa7ruvuP3Y82mmlRf6nW6YymuR6Tcy/Mb+npJ
	 CHumy45pKLe7eTkZD4qaRuk/a2rhffK7JFuUmnfV8gv1xl4VZ4lXPKg2XxCXeTmAyw
	 qtMzXlKyEOYuBJNBCxoLSZJZez86ilTsB+I2oVqH9ZbF9f9yhMSLgRcvr+xFSv387k
	 VlmBWreq16FdrJWJUr1jcoJcJl7AXEbfPAR5Jxxp5VSPndhPOgWssiqOs/2LPbFMIY
	 btqLsBM9oHjv2rBGf6IV4QQNKic5jGO+bJhgBxwt4ZQcyVt/jBPUiyvzCPP7QI5PAy
	 i/ZzSYYuUFaKw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xHILG-00000003EfK-40ru;
	Thu, 15 Oct 2026 10:05:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH 2/7] KVM: arm64: Move OUTSIDE_GUEST_MODE publication past context being saved
Date: Thu, 15 Oct 2026 11:05:34 +0100
Message-ID: <20261015100539.1011760-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015100539.1011760-1-maz@kernel.org>
References: <20261015100539.1011760-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, stable@vger.kernel.org
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

OUTSIDE_GUEST_MODE indicates to the rest of KVM that the vcpu has
exited. So far, this is set as soon as we return from the notional
hypervisor (which with VHE is just a function call away).

However, code that uses OUTSIDE_GUEST_MODE as a synchronisation point
relies on the vcpu state to have been written back to the in-memory
structures. Clearly, this is not what is happening

Move the publication of OUTSIDE_GUEST_MODE to the point where the state
is actually written, and give this write release semantics to ensure the
correct ordering.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/arm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 73706464d2653..8b46fafdd3494 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1334,13 +1334,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		smp_store_mb(vcpu->mode, IN_GUEST_MODE);
 
 		if (ret <= 0 || kvm_vcpu_exit_request(vcpu, &ret)) {
-			vcpu->mode = OUTSIDE_GUEST_MODE;
 			isb(); /* Ensure work in x_flush_hwstate is committed */
 			if (kvm_vcpu_has_pmu(vcpu))
 				kvm_pmu_sync_hwstate(vcpu);
 			if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
 				kvm_timer_sync_user(vcpu);
 			kvm_vgic_sync_hwstate(vcpu);
+			smp_store_release(&vcpu->mode, OUTSIDE_GUEST_MODE);
 			local_irq_enable();
 			preempt_enable();
 			continue;
@@ -1356,7 +1356,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		ret = kvm_arm_vcpu_enter_exit(vcpu);
 
-		vcpu->mode = OUTSIDE_GUEST_MODE;
 		vcpu->stat.exits++;
 		/*
 		 * Back from guest
@@ -1390,6 +1389,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		kvm_arch_vcpu_ctxsync_fp(vcpu);
 
+		/*
+		 * All the state has been synchronised, let advertise
+		 * we're outside of the guest.
+		 */
+		smp_store_release(&vcpu->mode, OUTSIDE_GUEST_MODE);
+
 		/*
 		 * We must ensure that any pending interrupts are taken before
 		 * we exit guest timing so that timer ticks are accounted as
-- 
2.47.3


