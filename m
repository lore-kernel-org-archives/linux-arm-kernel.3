Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA102CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fFzIzfl2F+Ocw1RA7wKsAoP6HFcclZy1t/PCAU0hW8=; b=iX6UEzyzgPkb0q0hyJRRONN/ae
	IU4mA9/Yq+0nt3VVTNbpYY9xaQQTfR+iwI8m+ZY85b4JYsv/2q6LECaLoTmIzlvefWc+9LjhxgnMW
	+lBtLrL39w3dQ6uIlhj5bVRgiWS3E5EaPRv8iuDSN9pkQZO07RDx23c374DhmH5QYZ5ShN6+y3hCV
	EzlIuV12DWgLe0QSlatOV22BBZeG7QsiIo5ts0VAp9BGeBfwS4RM5dtfGA1wDH6cxiLpWN2jr+qEk
	MGwvlxFBRv8HVelazvv5VDZHJtCgLNY8CjhmzzMaN2Yyv32UtSiu9Hh0h4i1G4LpvoXezY6pYb0Gx
	zlc+NTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdZZ-0000000D7Cj-2Cod;
	Tue, 13 Oct 2026 14:33:45 +0000
Received: from out-106.mta0.migadu.com ([2001:41d0:1004:224b::6a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdZW-0000000D7Bi-1DG3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 14:33:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ducuf6SS/bfdD6KwAAH5f+/c4spXeWPNSOKqOShzR0g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791902020; v=1; x=1792506820;
 b=JBpV0ZUc5Bc/h3HvAXmV2heSzEJUyvDR3RtZ4EHIXHcvyePJGNgn0wkgwO2tB13d12teKo3q
 Gf0ldKUNYMdPqac+E3HKy4E1dyQ3TPrm+OZWBiSl31qKVEJ458RGySqBUvWDJ6ClblCZOfD9fZo
 1m52/nBBcjsKVzsZNSQxugPg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7db65e9a5b41bfc7;
	Tue, 13 Oct 2026 14:33:40 +0000
X-Mizu-Trace-ID: 7db65e9a5b41bfc7
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: vgic-its: Fix LPI double mapping and DISCARD
Date: Tue, 13 Oct 2026 15:33:38 +0100
Message-Id: <20261013143338.815377-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <86tsmp20ne.wl-maz@kernel.org>
References: <86tsmp20ne.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_073342_483690_90251557 
X-CRM114-Status: GOOD (  25.22  )
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

Hi Marc,

On Tue, 13 Oct 2026 14:25:09 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > We do still need it for the window after the exit: with the delay
> > there and the same patches applied, the guest takes it in none of 20
> > runs, against 13 of 20 on v2.
>
> I don't understand what these probabilities represent. Either it works
> or it doesn't. And given that I have no idea what you are testing
> with, I can't really make head or tail of the above.

They're the number of runs, out of 20, in which the guest took the
discarded LPI. My reproducer has vCPU 0 issue DISCARD for an LPI pending
in vCPU 1's LR, at a varying time, with a debug mdelay() widening the
window, so only some runs hit it. I've since replaced the delay with
debug hooks that force the race, so now it either works or it doesn't.

[...]
> If you have a herd litmus test, how about posting it? It would really
> avoid a lot of that back and forth where the S/N ratio is pretty poor.

Sure, here are two, run with herd7 7.58 and the LKMM from v7.3-rc3. The
first models your diff and comes out Sometimes. The second adds the
request check before the flush and comes out Never.

C discard+halt

(*
 * P0 is the vCPU in kvm_arch_vcpu_ioctl_run() with your diff, with a
 * pending LPI queued on it: check_vcpu_requests(), the IN_GUEST_MODE
 * store, the flush moving pending_latch into an LR, the fold (on the
 * early exit, or after a guest run that leaves the LPI pending), and
 * the release of OUTSIDE_GUEST_MODE.
 *
 * P1 is DISCARD: kvm_arm_halt_guest() making KVM_REQ_SLEEP and reading
 * the mode in kvm_vcpu_exiting_guest_mode(), then clearing
 * pending_latch. A halt that reads IN or EXITING (1, 2) waits for the
 * IPI, which the vCPU takes after its fold, so only one that reads
 * OUTSIDE (0) clears here.
 *)

{
	pending_latch = 1;
}

P0(int *mode, int *requests, int *pending_latch, spinlock_t *irq_lock)
{
	int r0;
	int r1 = 0;

	r0 = READ_ONCE(*requests);
	if (r0 == 0) {
		smp_store_mb(*mode, 1);

		spin_lock(irq_lock);
		r1 = READ_ONCE(*pending_latch);
		if (r1 == 1)
			WRITE_ONCE(*pending_latch, 0);
		spin_unlock(irq_lock);

		spin_lock(irq_lock);
		if (r1 == 1)
			WRITE_ONCE(*pending_latch, 1);
		spin_unlock(irq_lock);

		smp_store_release(mode, 0);
	}
}

P1(int *mode, int *requests, int *pending_latch, spinlock_t *irq_lock)
{
	int r3;

	smp_wmb();
	WRITE_ONCE(*requests, 1);
	smp_mb__before_atomic();
	r3 = cmpxchg(mode, 1, 2);
	if (r3 == 0) {
		spin_lock(irq_lock);
		WRITE_ONCE(*pending_latch, 0);
		spin_unlock(irq_lock);
	}
}

exists (0:r1=1 /\ 1:r3=0 /\ pending_latch=1)

C discard+halt+check

(*
 * As discard+halt, with the request check between the IN_GUEST_MODE
 * store and the flush.
 *)

{
	pending_latch = 1;
}

P0(int *mode, int *requests, int *pending_latch, spinlock_t *irq_lock)
{
	int r0;
	int r1 = 0;
	int r2;

	r0 = READ_ONCE(*requests);
	if (r0 == 0) {
		smp_store_mb(*mode, 1);

		r2 = READ_ONCE(*requests);
		if (r2 == 0) {
			spin_lock(irq_lock);
			r1 = READ_ONCE(*pending_latch);
			if (r1 == 1)
				WRITE_ONCE(*pending_latch, 0);
			spin_unlock(irq_lock);

			spin_lock(irq_lock);
			if (r1 == 1)
				WRITE_ONCE(*pending_latch, 1);
			spin_unlock(irq_lock);
		}

		smp_store_release(mode, 0);
	}
}

P1(int *mode, int *requests, int *pending_latch, spinlock_t *irq_lock)
{
	int r3;

	smp_wmb();
	WRITE_ONCE(*requests, 1);
	smp_mb__before_atomic();
	r3 = cmpxchg(mode, 1, 2);
	if (r3 == 0) {
		spin_lock(irq_lock);
		WRITE_ONCE(*pending_latch, 0);
		spin_unlock(irq_lock);
	}
}

exists (0:r1=1 /\ 1:r3=0 /\ pending_latch=1)

[...]
> Is the hack below what you are asking for? I can't tell. If it isn't,
> please post your own version.

Almost: it's missing a request check between the IN_GUEST_MODE store and
the flush. Without it, a halt that reads OUTSIDE_GUEST_MODE just before
the store doesn't wait for the vCPU, which then loads the LPI into an
LR, takes the early exit on KVM_REQ_SLEEP and folds the LPI back after
DISCARD has cleared it. That's the outcome in the first litmus test's
exists clause. With the debug hooks forcing it on QEMU, the guest takes
the discarded LPI in every run with your diff, and in none with this on
top:

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f1449b0..896bc76 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1329,11 +1329,29 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 */
 		smp_store_mb(vcpu->mode, IN_GUEST_MODE);
 
+		/*
+		 * Don't load the LRs with a request pending:
+		 * kvm_arm_halt_guest() doesn't wait for a vCPU it reads
+		 * as OUTSIDE_GUEST_MODE.
+		 */
+		if (ret <= 0 || kvm_vcpu_exit_request(vcpu, &ret)) {
+			isb(); /* Ensure work in x_flush_hwstate is committed */
+			if (kvm_vcpu_has_pmu(vcpu))
+				kvm_pmu_sync_hwstate(vcpu);
+			if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
+				kvm_timer_sync_user(vcpu);
+			smp_store_release(&vcpu->mode, OUTSIDE_GUEST_MODE);
+			local_irq_enable();
+			preempt_enable();
+			continue;
+		}
+
 		kvm_vgic_flush_hwstate(vcpu);
 
 		kvm_pmu_update_vcpu_events(vcpu);
 
-		if (ret <= 0 || kvm_vcpu_exit_request(vcpu, &ret)) {
+		/* kvm_vgic_flush_hwstate() can make a request when nested */
+		if (kvm_vcpu_exit_request(vcpu, &ret)) {
 			isb(); /* Ensure work in x_flush_hwstate is committed */
 			if (kvm_vcpu_has_pmu(vcpu))
 				kvm_pmu_sync_hwstate(vcpu);

Cheers,
/fuad

