Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F37ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Xik15WmAoHNbrZxUtrbj+k4Ee3EdsKPCteYm+EiLok=; b=X0Mpx6voLqLnesIEWHzXjeYoLZ
	KZH/Q8W7BvqHQiEH+3dKkO0d/03YaAP7OBg9R6oAoWGk5c7tk1cdv1v/Jm85I/rDN850wPUnGlHvO
	M/biegnpXs1q32IBKDVUsMeCUI9b4jJIZXy2gEmvVa7fC0V6WXtXXS8Zxf89thAiZi0PBGprxIYWY
	BECPK344ALoSdBdSWEXr680gix+S7hVdFNvU9q8oynL8OGlTLLry7Q2rpZA39iZFeDbjtbLBqGLnc
	4GbzMbe2h9vQ/pYzWdXaf1SZrt48ADngCPavYcCMsN3mj+xKmMxyX688XdJP+FJyJZ1r1TBQpUUSW
	aXXve3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGd5-0000000BpB4-3LsB;
	Tue, 04 Nov 2025 12:59:19 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGd2-0000000Bp5P-1Cfy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:59:17 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477563e531cso6227625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762261154; x=1762865954; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Xik15WmAoHNbrZxUtrbj+k4Ee3EdsKPCteYm+EiLok=;
        b=xR902OnWHVIFUWUwA8t0jBCVxirfFPzQLxC8E6MhPNjYscjn2ENod0eX3dsg0tq7j9
         pYOn9qGH9V+VIQwOoLreWduTPRoGxOuCWMKLH1thIPwo9wNNGSOR889VMqDc2B4V/aKd
         veXG5m3LcppNfYgW1VhwcChxkqHV04UyeLsbmGwOG8KZE5vYaO629nnggAGGyFuQ2KNM
         l3GYw4SSPqMaNrmy03KC+i5KOs8VgzLNQY0TknWK0IjJDz/3N45TjWeq9ecwObHC0dB7
         yWQJLvom/912p7sGbCh5r2oVZXJ8uRgP7SLNBZhIBr9Xcf6XWzpMWF8QJSHvrloC9o56
         opjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261154; x=1762865954;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Xik15WmAoHNbrZxUtrbj+k4Ee3EdsKPCteYm+EiLok=;
        b=lVCqzz3yQOTFZ2KU/3AQaEKVE/3oBqc1Rxa0YDio9XJfmxuxdkaJI3k3Bi+J7uRPct
         r7oqW1X/Ug0EyR7f1xYPiJMJ4thJUkYR/MLfD3NmBFvZP4e7hz7xxaPLbSKPLCRQi3Ua
         zP8/B25f1mh8kLLUyFdCB3ppuWPvX40A6SS6O3Amgsl+w1ScWwEJRoEIYiW9wqiZKIZL
         USsXRh6dKnJhcrVghwmb+jAvUHULfFoRAjo4ed3Drl1bN1cWyuVgafwK4IS9QZaGRmtq
         2lJ1jQsEiREypKVmqkeD2Wr1dQ/7ZUqxoAxS/wDS+zVMu4WovehLJvrvCJ9bNX7cVhQw
         AEuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrgaBhkD4fKbPiuRzhh92dPEYnZdcVQJmi70WMRdfq6pOrY1O5tx3uGmE/fjZeZdkiA/66yloiCkzBaoejR1p8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl3Ra/qLP6Cr850Sg5pTCv53MC3znRBb1loZWu47Nbzch+mvHG
	uD3KOyJgS99qdH0NyKu/eqHsakH/ly54h6Rj36xcr2jSRnCn5w90QL34gyoJQc37CmnaEnWMs0k
	nbQ==
X-Google-Smtp-Source: AGHT+IHlL/KyIyvJlAW6DKZbZabOz+McTPMSW0dgQJQD446yDCbFkkDQ67a8de15zsGEFor4k3yG3Qs0NA==
X-Received: from wmco10.prod.google.com ([2002:a05:600c:a30a:b0:477:cf9:f4a3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b67:b0:45d:f81d:eae7
 with SMTP id 5b1f17b1804b1-4773089c98cmr166646825e9.28.1762261153921; Tue, 04
 Nov 2025 04:59:13 -0800 (PST)
Date: Tue,  4 Nov 2025 12:59:05 +0000
In-Reply-To: <20251104125906.1919426-1-tabba@google.com>
Mime-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Message-ID: <20251104125906.1919426-8-tabba@google.com>
Subject: [PATCH v1 7/8] KVM: arm64: Prevent host from managing timer offsets
 for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_045916_392208_011CA923 
X-CRM114-Status: GOOD (  14.78  )
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
2.51.2.997.g839fc31de9-goog


