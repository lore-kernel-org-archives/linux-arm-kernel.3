Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5E8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWDQI4Tbi5JmEExx2FNvY0+ludG6f4zG98KflS4blsU=; b=fQ+e6fsVV8CUi452FzHYprdGWZ
	pPjqZpILiAt9Cq19E1nI5oHZKvKOg34L38fFJXf1mG2VR/pgHIrBaMbzhL/jLAl8GHt3Xtz8WuZR8
	1g/UQMS2UUa2WEy4e8MYuT/yrTqqB1KWgOshb1NChErFNg4DukT2EXpmfXSzsHtSRDUJ3RH/ESwNM
	YiUXpuBIUipAlaBljZXnHoZLwgztQ++EbZjdA+MoLxMSR41eYL9AOsOkuOcq4etlTOohQBgvZlTzV
	/5NGmAUk1r5XsWGpAZ6cud6GcYXLOzu+gJWLuBNaPsGNaymK/4Yb8D5TLTPaNbLgv9glvdqxmqeJN
	/u7h2n3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYX7-0000000DkP3-3kKR;
	Tue, 17 Dec 2024 14:26:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYTv-0000000DjXD-3wuj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60693A418CB;
	Tue, 17 Dec 2024 14:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA74CC4CEDF;
	Tue, 17 Dec 2024 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445406;
	bh=vlsfcXymn4b9NeLxHEDUu84AmG2cgjXdssBzlNCdyJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WoyXhyV7O8IPecw1swP6vLUef/+mwO1bmWrduoHkDdAkyngaDD1J8wArleD+3a/aM
	 RI4zHFICUJrBEcEU06rqTnNi1AArwH3fUdsJFJCm7ekLKKbZi7bVM3FbUatAoC/ZIK
	 1p+Fqv1gNd75dun8UzVWb5b55OP1c6TkKJrUrLRINp5Dm3L14AFQleb7cIye3ICDZQ
	 GykvpB0QHd9ApHtvXsJ9ujfH0ushkf4nM5f5dYRsMqxH2p7Iue/fekhbL3uBGj19k3
	 yi6atdjD5KicMJmJ7NORt5/UNlswAt2+VvI27YcFi7YwKdkHktEUttEbS6zBCVOzVU
	 KZJae0hlzqGwQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNYTs-004aJx-NW;
	Tue, 17 Dec 2024 14:23:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: [PATCH v2 02/12] KVM: arm64: nv: Sync nested timer state with FEAT_NV2
Date: Tue, 17 Dec 2024 14:23:10 +0000
Message-Id: <20241217142321.763801-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217142321.763801-1-maz@kernel.org>
References: <20241217142321.763801-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com, gankulkarni@os.amperecomputing.com, chase.conklin@arm.com, eauger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_062328_106409_A3FBEC2E 
X-CRM114-Status: GOOD (  17.69  )
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

Emulating the timers with FEAT_NV2 is a bit odd, as the timers
can be reconfigured behind our back without the hypervisor even
noticing. In the VHE case, that's an actual regression in the
architecture...

Co-developed-by: Christoffer Dall <christoffer.dall@arm.com>
Signed-off-by: Christoffer Dall <christoffer.dall@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c  | 44 ++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/arm.c         |  3 +++
 include/kvm/arm_arch_timer.h |  1 +
 3 files changed, 48 insertions(+)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 1215df5904185..ee5f732fbbece 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -905,6 +905,50 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
 		kvm_timer_blocking(vcpu);
 }
 
+void kvm_timer_sync_nested(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * When NV2 is on, guest hypervisors have their EL1 timer register
+	 * accesses redirected to the VNCR page. Any guest action taken on
+	 * the timer is postponed until the next exit, leading to a very
+	 * poor quality of emulation.
+	 */
+	if (!is_hyp_ctxt(vcpu))
+		return;
+
+	if (!vcpu_el2_e2h_is_set(vcpu)) {
+		/*
+		 * A non-VHE guest hypervisor doesn't have any direct access
+		 * to its timers: the EL2 registers trap (and the HW is
+		 * fully emulated), while the EL0 registers access memory
+		 * despite the access being notionally direct. Boo.
+		 *
+		 * We update the hardware timer registers with the
+		 * latest value written by the guest to the VNCR page
+		 * and let the hardware take care of the rest.
+		 */
+		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTV_CTL_EL0),  SYS_CNTV_CTL);
+		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTV_CVAL_EL0), SYS_CNTV_CVAL);
+		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTP_CTL_EL0),  SYS_CNTP_CTL);
+		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTP_CVAL_EL0), SYS_CNTP_CVAL);
+	} else {
+		/*
+		 * For a VHE guest hypervisor, the EL2 state is directly
+		 * stored in the host EL1 timers, while the emulated EL0
+		 * state is stored in the VNCR page. The latter could have
+		 * been updated behind our back, and we must reset the
+		 * emulation of the timers.
+		 */
+		struct timer_map map;
+		get_timer_map(vcpu, &map);
+
+		soft_timer_cancel(&map.emul_vtimer->hrtimer);
+		soft_timer_cancel(&map.emul_ptimer->hrtimer);
+		timer_emulate(map.emul_vtimer);
+		timer_emulate(map.emul_ptimer);
+	}
+}
+
 /*
  * With a userspace irqchip we have to check if the guest de-asserted the
  * timer and if so, unmask the timer irq signal on the host interrupt
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc4..fa3089822f9f3 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1228,6 +1228,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
 			kvm_timer_sync_user(vcpu);
 
+		if (vcpu_has_nv(vcpu))
+			kvm_timer_sync_nested(vcpu);
+
 		kvm_arch_vcpu_ctxsync_fp(vcpu);
 
 		/*
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index fd650a8789b91..6e3f6b7ff2b22 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -98,6 +98,7 @@ int __init kvm_timer_hyp_init(bool has_gic);
 int kvm_timer_enable(struct kvm_vcpu *vcpu);
 void kvm_timer_vcpu_reset(struct kvm_vcpu *vcpu);
 void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu);
+void kvm_timer_sync_nested(struct kvm_vcpu *vcpu);
 void kvm_timer_sync_user(struct kvm_vcpu *vcpu);
 bool kvm_timer_should_notify_user(struct kvm_vcpu *vcpu);
 void kvm_timer_update_run(struct kvm_vcpu *vcpu);
-- 
2.39.2


