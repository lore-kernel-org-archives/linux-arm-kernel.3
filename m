Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B0BD78337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixVrcmrz13JyQxWkb3uo72U5kwbef298fw8KkbPfTCc=; b=bzldazNCbHnFX8/b4nnsy+ogp5
	DdLZoZXZra9lZo9mKMryXKLpBfC9ABtrMxyxLAeNPsAoK3TP0VYZ6xToxNXHclW6Fba+eur8B0z88
	gEanN+VuG0bUN32mSJLhMSLPMGEn19Sx8fSR3d4FJwN69E9Xcjk3iXbXwo8w0okL2AI3BUYN40NsD
	2Z0uQV9XKI8bHIXbCiBZgqltjiQrNvTXjKyWop5Y5hiHcWiEz7WyaTVpisAk0ivBCDmSYtBquU1Ub
	u2sUha6IOx7MdQSYNgawsYLBOwTHHvua4xTmQu1TFpdIG9hgTtWmz+7PYvf4ZNrqt6cfs3JHtKF6W
	rZCwcTvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAAh-000000070NZ-07Nv;
	Mon, 02 Dec 2024 17:25:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7s-00000006zyx-2g8u
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ixVrcmrz13JyQxWkb3uo72U5kwbef298fw8KkbPfTCc=; b=I73Y54h5taGuB8HdKHgsu7eGfj
	TIGrkBrfih2pyCtjzsATbOX22to8eoJ9PFbtqiQmcINzM+Hd7hKOLoprBYQ9RijzVxC80JuM2hXGW
	2UU8KVI+a+T6uXViiilkHJi6+XvEToyNqbMsIAXkre4eClbAXwVQVDAEFTJB6Pb4D4VcU3VFUIXKl
	ajPUbzBne4sVijlamd/GEumiQVH7YkTapKZT4P0Tq2fcriD02orkEQhFj3s8Qlkzy9PkaLOyzzQaJ
	HHDlF50HqZXGw/stD8GOtdWKeWZHZlq/omIF6CQ4xito5YXF4PUUstCwuHa8XJgQARZ5NwxMz9Pi7
	rtyGRDtg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7p-00000002D6q-2wjF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:22:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25971A41039;
	Mon,  2 Dec 2024 17:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288CBC4CED9;
	Mon,  2 Dec 2024 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160138;
	bh=3Ito29at05iywdTT9/dJyK5XayrxgpuuC1UnrIxUqY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pmTMPJewgE+ucZSqtvnR8SyEHiqNXS57YFMHnSKOjKuY3mpsdXlwafYdUDW3tdxsH
	 RpmCsVRKfEpdnELPJt9Iov4c6RDWcsDYkhMdrLvrTtNZMBHcpY0dXruk0TnPsn6sXj
	 4xaBDEQMHvnvGP4ymgnK85yZ/cPAbjtPPsycbhhqpkw+53n4wL5wPNI4a3ihGibyjz
	 G4ZnUX+FdkrRuduQ4mgjalxj9PoORRWbzxXm65ZoKsj6CU5/agW3wa9bBT5nC2EItu
	 cHqEG7cIIOOncwMUuuEYt6kpzNWdrTf4+egLtqi6/RXQeOLNZukH4Pfqc+v0AAvEoe
	 AsI1pCd2V9g1g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIA7k-00HQcf-4P;
	Mon, 02 Dec 2024 17:22:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH 02/11] KVM: arm64: nv: Sync nested timer state with FEAT_NV2
Date: Mon,  2 Dec 2024 17:21:25 +0000
Message-Id: <20241202172134.384923-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172222_067151_713F4790 
X-CRM114-Status: GOOD (  17.87  )
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
index 1215df5904185..81afafd62059f 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -905,6 +905,50 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
 		kvm_timer_blocking(vcpu);
 }
 
+void kvm_timer_sync_nested(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * When NV2 is on, guest hypervisors have their EL0 timer register
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
+		 * stored in the host EL0 timers, while the emulated EL0
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


