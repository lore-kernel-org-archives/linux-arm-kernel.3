Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F730C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 06:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2RK1i7+eBOT39Iv0WjoNburedSnmTk8yWXXCGmNFM4=; b=pNr1AiyKFp/bSc9beNE/0bO/CR
	Ng4I7TP3498GGMAeu9Dgfe7G9iWWp3yPxOgrZC+PyLWfmeI9eTaTXxmPbWuH93q9kwiRZaljD5SCt
	54MBTgrd7Kt2uE/8FVExo9ZE12bl3uWPuEuGLNR1YZmS2vRqthVtYpEWw+Qa/j2cGQX+1+IXIL7Zg
	Rt5rgFwnM7129jqjfRJzsfLU0gCGTrCW0VLbg3X8P40UfL8HqtZNXVeqdFweihiLIvdX07XhB+vu4
	fbQZNMLwUBpOFL98/xkQktGTPNZnpCnjNDhrEhsvnEza6xC763+LaKF5BCjXXkoh0mGC+utsqLSGp
	cAf/Otiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZa4-00000004GSr-071x;
	Tue, 15 Jul 2025 06:56:00 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZXZ-00000004Fx5-3pyh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 06:53:28 +0000
Date: Mon, 14 Jul 2025 23:51:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752562280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m2RK1i7+eBOT39Iv0WjoNburedSnmTk8yWXXCGmNFM4=;
	b=o0KlhbvB7Rx6sbzPcsB0t7Br4dB5Nl/s1EXH8SzNQJbh2P6ADQSHaoveeud4N/4q4osw/w
	Jn85v2eNN/1nHRO3b3NtwpAKyyNE/FnNdag1U9hkdpGCItiuhfs3I9aDZdlJTt+VYr7iji
	LEuZ7j50hjD1AIHW1+GZxT2tF/11w+A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com
Subject: Re: [PATCH] KVM: arm64: Clear pending exception state before
 injecting a new one
Message-ID: <aHX6XXhSSnHL_T1d@linux.dev>
References: <20250714144636.3569479-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714144636.3569479-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_235326_197076_50B2CE33 
X-CRM114-Status: GOOD (  29.35  )
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

Hey,

On Mon, Jul 14, 2025 at 03:46:36PM +0100, Marc Zyngier wrote:
> Repeatedly injecting an exception from userspace without running
> the vcpu between calls results in a nasty warning, as we're not
> really keen on losing already pending exceptions.
> 
> But this precaution doesn't really apply to userspace, who can
> do whatever it wants (within reason). So let's simply clear any
> previous exception state before injecting a new one.
> 
> Note that this is done unconditionally, even if the injection
> ultimately fails.
> 
> Reported-by: syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Thanks for taking a look at this. I think the correct fix is a bit more
involved, as:

 - ABI prior to my patches allowed dumb things like injecting both an
   SEA and SError from the same ioctl. With your patch I think you could
   still get the warning to fire with serror_pending && ext_dabt_pending

 - KVM_GET_VCPU_EVENTS is broken for 'pending' SEAs, as we assume
   they're committed in the vCPU state immediately when they're actually
   deferred to the next KVM_RUN.

I thoroughly hate the fix I have but it should address both of these
issues. Although the pending PC adjustment flags seem more like a
liability than anything else if ioctls need to flush them before
returning to userspace. Might look at a larger cleanup down the road.

Thanks,
Oliver

From 149262689dfe881542f5c5b60f9ee308a00f0596 Mon Sep 17 00:00:00 2001
From: Oliver Upton <oliver.upton@linux.dev>
Date: Mon, 14 Jul 2025 23:25:07 -0700
Subject: [PATCH] KVM: arm64: Commit exceptions from KVM_SET_VCPU_EVENTS
 immediately

syzkaller has found that it can trip a warning in KVM's exception
emulation infrastructure by repeatedly injecting exceptions into the
guest.

While it's unlikely that a reasonable VMM will do this, further
investigation of the issue reveals that KVM can potentially discard the
"pending" SEA state. While the handling of KVM_GET_VCPU_EVENTS presumes
that userspace-injected SEAs are realized immediately, in reality the
emulated exception entry is deferred until the next call to KVM_RUN.

Hack-a-fix the immediate issues by committing the pending exceptions to
the vCPU's architectural state immediately in KVM_SET_VCPU_EVENTS. This
is no different to the way KVM-injected exceptions are handled in
KVM_RUN where we potentially call __kvm_adjust_pc() before returning to
userspace.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/guest.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index e2702718d56d..16ba5e9ac86c 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -834,6 +834,19 @@ int __kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static void commit_pending_events(struct kvm_vcpu *vcpu)
+{
+	if (!vcpu_get_flag(vcpu, PENDING_EXCEPTION))
+		return;
+
+	/*
+	 * Reset the MMIO emulation state to avoid stepping PC after emulating
+	 * the exception entry.
+	 */
+	vcpu->mmio_needed = false;
+	kvm_call_hyp(__kvm_adjust_pc, vcpu);
+}
+
 int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 			      struct kvm_vcpu_events *events)
 {
@@ -843,8 +856,15 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	u64 esr = events->exception.serror_esr;
 	int ret = 0;
 
-	if (ext_dabt_pending)
+	/*
+	 * Immediately commit the pending SEA to the vCPU's architectural
+	 * state which is necessary since we do not return a pending SEA
+	 * to userspace via KVM_GET_VCPU_EVENTS.
+	 */
+	if (ext_dabt_pending) {
 		ret = kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
+		commit_pending_events(vcpu);
+	}
 
 	if (ret < 0)
 		return ret;
@@ -863,6 +883,12 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	else
 		ret = kvm_inject_serror(vcpu);
 
+	/*
+	 * We could've decided that the SError is due for immediate software
+	 * injection; commit the exception in case userspace decides it wants
+	 * to inject more exceptions for some strange reason.
+	 */
+	commit_pending_events(vcpu);
 	return (ret < 0) ? ret : 0;
 }
 
-- 
2.39.5

