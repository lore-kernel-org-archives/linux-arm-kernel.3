Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DFFCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZH3eKxYOB+u5OY1UKy79GqlYSKQBhEv535ojYPFvQc=; b=PTxOR8wuPrjYwNwCFiwcgI8JwL
	wL7ka2a5greMNNM39k2mRphIG5NdOziszVo5XlIrQqUfM9LCGmxnNn3kms5+aa2Bt8ncU8Mj1hh0z
	jPDFAv29BzMUIElyaEBSatYWvA6Ozhz7nsrbN7zO/wP+kN8zWGjErLXN58VGT72A+RYbsCiDPC+md
	tXd9+nwaXtqBA3qWEi0kFoEFj53AMb1H2ELPrO4UfME1Dh01KEzRbThRk0dmdD0hCLWANw7rLGHN9
	DyJY8PCnyd66wElp5zbVyRel240rcFpsFviXM+RYw5zjeH+DUKV9Zyd170MSlMO7KAJXHwY8oaIEw
	3IGnmB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJi-00000001sm5-34bV;
	Wed, 07 Oct 2026 07:43:58 +0000
Received: from out-252.mta1.migadu.com ([2001:41d0:203:375::fc] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJe-00000001skM-1vN0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:43:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=26sJxdBAYmq6lVWEeN66iV6F411lF6shyPsA+r/oRO0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791359032; v=1; x=1791963832;
 b=d6LWWCHdH4XCAe3Ti3ESKzNmApTWM0X6+XvVE/Vna7u3sNCLECCq8oIZjCxcLuG2SqvWxQGA
 JTt3HmD8LThjJv0ei2rzUzGowRx6cUToQr8wgBmUDQyPryxnKpCRzjROEYxNwiqDGkMDx5/Voo3
 TA5mFFbpwBOUM4be/WmT+lU0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 684038a9acd37d11;
	Wed, 07 Oct 2026 07:43:52 +0000
X-Mizu-Trace-ID: 684038a9acd37d11
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 1/3] KVM: arm64: timers: Compute an offset-applied CVAL from the current count
Date: Wed,  7 Oct 2026 08:43:41 +0100
Message-Id: <20261007074343.324269-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261007074343.324269-1-fuad.tabba@linux.dev>
References: <20261007074343.324269-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_004354_640753_A73873B1 
X-CRM114-Status: GOOD (  17.36  )
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

When the hardware won't apply a timer's offset, KVM programs CVAL +
offset and lets it compare that against the raw counter. The compare is
unsigned (IsTimerConditionMet, DDI0487M_c J1.4.3.29):

  condition_met = (UInt(PhysicalCountInt() - offset) -
                   UInt(compare_value)) >= 0;

so adding the offset to both sides holds only while both sums wrap or
neither does. A guest whose counter is ahead of the host's by more than
CVAL has an expired timer that never fires, and one behind it can have
a far-future timer fire at once.

On a CNTPOFF_EL2 host the first case livelocks: each entry reloads the
guest's CVAL, the timer fires, and the exit rewrites it as CVAL + offset
before the host can take the interrupt. Without CNTPOFF_EL2 the timer
hangs until the vCPU is next loaded, which is what Zenghui reported on
a Kunpeng920.

Program the value from the current count instead: CVAL + offset while
the deadline is ahead, 0 once the timer has expired for the guest, ~0
past the counter's wrap. KVM recomputes it at load, at exit and on a
trapped CVAL write, and an expired timer stays expired in between. The
value can't be inverted, so with an offset timer_save_state() keeps the
memory copy, and kvm_hyp_handle_timer() returns that copy for a guest
hypervisor's read of its physical CVAL rather than subtracting the
offset back out.

Fixes: c605ee245097 ("KVM: arm64: timers: Allow physical offset without CNTPOFF_EL2")
Fixes: 9404673293b0 ("KVM: arm64: timers: Correctly handle TGE flip with CNTPOFF_EL2")
Fixes: 0bc9a9e85fcf ("KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity")
Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Closes: https://lore.kernel.org/r/460258be-0102-e922-c342-4e87cd94b9e5@huawei.com
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arch_timer.c     | 27 ++++++++++++---------------
 arch/arm64/kvm/hyp/vhe/switch.c | 11 ++++++-----
 include/kvm/arm_arch_timer.h    | 15 +++++++++++++++
 3 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 6ac3321f4c575..9278b5383c044 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -528,17 +528,11 @@ static void timer_save_state(struct arch_timer_context *ctx)
 		goto out;
 
 	switch (index) {
-		u64 cval;
-
 	case TIMER_VTIMER:
 	case TIMER_HVTIMER:
 		timer_set_ctl(ctx, read_sysreg_el0(SYS_CNTV_CTL));
-		cval = read_sysreg_el0(SYS_CNTV_CVAL);
-
-		if (has_broken_cntvoff())
-			cval -= timer_get_offset(ctx);
-
-		timer_set_cval(ctx, cval);
+		if (!has_broken_cntvoff() || !timer_get_offset(ctx))
+			timer_set_cval(ctx, read_sysreg_el0(SYS_CNTV_CVAL));
 
 		/* Disable the timer */
 		write_sysreg_el0(0, SYS_CNTV_CTL);
@@ -564,11 +558,12 @@ static void timer_save_state(struct arch_timer_context *ctx)
 	case TIMER_PTIMER:
 	case TIMER_HPTIMER:
 		timer_set_ctl(ctx, read_sysreg_el0(SYS_CNTP_CTL));
-		cval = read_sysreg_el0(SYS_CNTP_CVAL);
-
-		cval -= timer_get_offset(ctx);
-
-		timer_set_cval(ctx, cval);
+		/*
+		 * With an offset, memory already holds the guest's CVAL (the
+		 * trap handler or __deactivate_traps() wrote it).
+		 */
+		if (!timer_get_offset(ctx))
+			timer_set_cval(ctx, read_sysreg_el0(SYS_CNTP_CVAL));
 
 		/* Disable the timer */
 		write_sysreg_el0(0, SYS_CNTP_CTL);
@@ -647,7 +642,8 @@ static void timer_restore_state(struct arch_timer_context *ctx)
 		offset = timer_get_offset(ctx);
 		if (has_broken_cntvoff()) {
 			set_cntvoff(0);
-			cval += offset;
+			if (offset)
+				cval = timer_apply_offset(cval, offset, kvm_phys_timer_read());
 		} else {
 			set_cntvoff(offset);
 		}
@@ -660,7 +656,8 @@ static void timer_restore_state(struct arch_timer_context *ctx)
 		cval = timer_get_cval(ctx);
 		offset = timer_get_offset(ctx);
 		set_cntpoff(offset);
-		cval += offset;
+		if (offset)
+			cval = timer_apply_offset(cval, offset, kvm_phys_timer_read());
 		write_sysreg_el0(cval, SYS_CNTP_CVAL);
 		isb();
 		write_sysreg_el0(timer_get_ctl(ctx), SYS_CNTP_CTL);
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 7875911c05063..14aada311bac4 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -175,7 +175,8 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 		offset = read_sysreg_s(SYS_CNTPOFF_EL2);
 
 		if (map.direct_ptimer && offset) {
-			write_sysreg_el0(val + offset, SYS_CNTP_CVAL);
+			val = timer_apply_offset(val, offset, arch_timer_read_cntpct_el0());
+			write_sysreg_el0(val, SYS_CNTP_CVAL);
 			isb();
 		}
 	}
@@ -296,10 +297,10 @@ static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
 		break;
 	case SYS_CNTP_CVAL_EL0:
 		if (vcpu_el2_e2h_is_set(vcpu)) {
-			val = read_sysreg_el0(SYS_CNTP_CVAL);
-
-			if (!has_cntpoff())
-				val -= timer_get_offset(vcpu_hptimer(vcpu));
+			if (!has_cntpoff() && timer_get_offset(vcpu_hptimer(vcpu)))
+				val = __vcpu_sys_reg(vcpu, CNTHP_CVAL_EL2);
+			else
+				val = read_sysreg_el0(SYS_CNTP_CVAL);
 		} else {
 			val = __vcpu_sys_reg(vcpu, CNTP_CVAL_EL0);
 		}
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index bc6f2fdd7ad33..80f96ea59f1ae 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -195,4 +195,19 @@ static inline void timer_set_offset(struct arch_timer_context *ctxt, u64 offset)
 	WRITE_ONCE(*ctxt->offset.vm_offset, offset);
 }
 
+/*
+ * CVAL to program when the hardware won't apply the timer's offset, so that
+ * its compare against the raw counter matches the guest's at 'now'. An
+ * expired timer stays expired; one past the wrap never fires.
+ */
+static inline u64 timer_apply_offset(u64 cval, u64 offset, u64 now)
+{
+	u64 hw = cval + offset;
+
+	if (now - offset >= cval)
+		return 0;
+
+	return hw > now ? hw : U64_MAX;
+}
+
 #endif
-- 
2.39.5


