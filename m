Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361E2CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3PiPDAEsM185e5ZyPmBex5Eq2aGfxJgPBXDqPJKqPg=; b=D4e+JkskMJP0P2tMlgwKJH9HJM
	c5s3H6Ne79kOJ67QEamPkinrPdevBM973zyEi2jBoU5kNbUT5/enqLY3nHBEIirv9iNwFpLeu9UP1
	diFpwrtjtOyxKFX1PNtoqbV3bdxyMReJRpCamBU/x1mCw0YlmJKFGhlytvfHoDdzg1pXImB1TASid
	WwX4tFOrLF5OlxnG1JKKwWnTFJ1B1eY0y1hiDkFiyxybDgxmsSCti/M4BbPqTCVyjmt4kgAuV2+wf
	3WtoaYAFXNMYXamHnDXyV8ajuDwAopcdvRzy1SSmViILULiy4zFk0F0z1ROjZnnzPz+CjWXNJbkgP
	ciclwy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Dw-0000000FiWO-1MdO;
	Thu, 06 Nov 2025 14:44:28 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Ds-0000000FiSk-0CyY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:44:25 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4710d174c31so8722335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 06:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762440262; x=1763045062; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q3PiPDAEsM185e5ZyPmBex5Eq2aGfxJgPBXDqPJKqPg=;
        b=1ll03HwTfcugg/nH+yDT7xqiMMmCn84SYeHzUGN+/RXerdasEyOKdyp7WVXyaxEKPf
         SGSNlI5dbjjI3wuvSfXk+HP14D79b6PQGq0i52uAeN/4aZkSFn9KclxiHGsd0Y9zFQUw
         3Ta80B6EcnwfAlkwVz3ArSsF+uDryGru1C1Z+r5D3iC0CZi2Ia96/NGKAVZXybEY0lki
         RjXR5Sqc/4PRTNl2IkkPhRyhLmoOp5nGofqnXzwJe6BTT8XBybwI7Bn6S17mn4M0oC1/
         uhNY5Z/IfRkNqNDMhQKWayITTA3LNfWieBX0IV8ZQ4m20YwA+odCqQWQ71HCz1tY5cMx
         EiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440262; x=1763045062;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3PiPDAEsM185e5ZyPmBex5Eq2aGfxJgPBXDqPJKqPg=;
        b=UluMF1KVz11i1xPgjpv6ajoYbNrI3bhPQbUUUvjp/OfdhJ3ZsJuDsKq5Cr2zV1IgRN
         WJArprT8KGO2pCWSMiqFdw8y6KK39Xln7vwauuiwBRgfp9/fOg0oUwBxjLBUDi6s5VH0
         0w7xfa534pz7wpXygNgxpTIl5O4Y8gLBiNxJMxsVY1VJY2KdrE38JzVvSiidzZ7YrwLn
         qagr0aOCMbgQ2CjYSVz35Ki0qkCNoY+mrnfIM26pJFRWRjdqPNBQ6BdSFa7HC7PBjPp5
         RwSUxLjBztcDnWnOaVsPOcdTnzAgxYFgIcqhdNNuMV+dTRFWccy5iq93f/khFNMGCJsT
         Q+cA==
X-Forwarded-Encrypted: i=1; AJvYcCVZgNeMTWZ7bw9USRA1sm4CkmKHY/Cbhe/DJoPGSqZ51FRBXRD71PLLe3jPHg6ADR3ELYkfdOa+4+BcaLyqpM7x@lists.infradead.org
X-Gm-Message-State: AOJu0YxtA7wdd37otcDiXTud2tUX1QHZjIHHWSn0v/EKBzbY7M+tLeo0
	+ollc0uNA1QNOPvScTIqQSxXXaAZc/O3/z3vkvgwGdq5Ryh5Rr2WxHSM0X3Z9MYzb09gDDavoyj
	HBQ==
X-Google-Smtp-Source: AGHT+IHQcO/yNTK0deG53SUFULs+OClplBrSmThrfSHa8qIXj6I07HYfFQyyo/MUKlZCP3ryzHv3F9D+4g==
X-Received: from wmbha8.prod.google.com ([2002:a05:600c:8608:b0:477:1ae3:73c7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6299:b0:477:559a:1ca7
 with SMTP id 5b1f17b1804b1-4775ce8e088mr59669125e9.39.1762440262376; Thu, 06
 Nov 2025 06:44:22 -0800 (PST)
Date: Thu,  6 Nov 2025 14:44:16 +0000
In-Reply-To: <20251106144418.2847443-1-tabba@google.com>
Mime-Version: 1.0
References: <20251106144418.2847443-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251106144418.2847443-5-tabba@google.com>
Subject: [PATCH v2 4/5] KVM: arm64: Prevent host from managing timer offsets
 for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_064424_105213_229B14BC 
X-CRM114-Status: GOOD (  14.39  )
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

For protected VMs, the guest's timer offset state is private and must
not be controlled by the host. Protected VMs must always run with a
virtual counter offset of 0.

The existing timer logic allowed the host to set and manage the timer
counter offsets (voffset and poffset) for protected VMs.

This patch disables all host-side management of timer offsets for
protected VMs by adding checks in the relevant code paths.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/arch_timer.c | 18 +++++++++++++-----
 arch/arm64/kvm/sys_regs.c   |  6 ++++--
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 3f675875abea..69f5631ebf84 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1056,10 +1056,14 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
 
 	ctxt->timer_id = timerid;
 
-	if (timerid == TIMER_VTIMER)
-		ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
-	else
-		ctxt->offset.vm_offset = &kvm->arch.timer_data.poffset;
+	if (!kvm_vm_is_protected(vcpu->kvm)) {
+		if (timerid == TIMER_VTIMER)
+			ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
+		else
+			ctxt->offset.vm_offset = &kvm->arch.timer_data.poffset;
+	} else {
+		ctxt->offset.vm_offset = NULL;
+	}
 
 	hrtimer_setup(&ctxt->hrtimer, kvm_hrtimer_expire, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
 
@@ -1083,7 +1087,8 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
 		timer_context_init(vcpu, i);
 
 	/* Synchronize offsets across timers of a VM if not already provided */
-	if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
+	if (!vcpu_is_protected(vcpu) &&
+	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
 		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
 		timer_set_offset(vcpu_ptimer(vcpu), 0);
 	}
@@ -1687,6 +1692,9 @@ int kvm_vm_ioctl_set_counter_offset(struct kvm *kvm,
 	if (offset->reserved)
 		return -EINVAL;
 
+	if (kvm_vm_is_protected(kvm))
+		return -EBUSY;
+
 	mutex_lock(&kvm->lock);
 
 	if (!kvm_trylock_all_vcpus(kvm)) {
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e67eb39ddc11..3329a8f03436 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1606,11 +1606,13 @@ static int arch_timer_set_user(struct kvm_vcpu *vcpu,
 		val &= ~ARCH_TIMER_CTRL_IT_STAT;
 		break;
 	case SYS_CNTVCT_EL0:
-		if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
+		if (!vcpu_is_protected(vcpu) &&
+		    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
 			timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read() - val);
 		return 0;
 	case SYS_CNTPCT_EL0:
-		if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
+		if (!vcpu_is_protected(vcpu) &&
+		    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
 			timer_set_offset(vcpu_ptimer(vcpu), kvm_phys_timer_read() - val);
 		return 0;
 	}
-- 
2.51.2.1041.gc1ab5b90ca-goog


