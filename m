Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888B5D41C21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPJFeWIsG1i6FowmtIAisiP3QqBxSUvcrKvafvSq4e8=; b=JZr2oeHKuxeE50hVg+mEuPioRm
	ZgPzNPKRQhxAsUGnMKii4dR4FNypAqrckUYLNEg2zEVNfzEqIZgWFE+p0Pstonl+mu6R+aTmO2Gjb
	yhQRxv/UaDQhZibiEDfn9wWWeZ7q/YnpsT9Rg4VwFOjy8lf0jTvNe9eDqA8CrMa1B/hPonHaNIHIU
	6uWG/qq907WqKC1rYMbpLgLxl5hI3Aqm1wbKirVB0wx0bt01+4HaT265/bJOzxWjhxbleSmJr3D5Y
	KpU+j4HpyPwJKT3tN5jFsRT5ekL5M0DC3RKNMAIC2vH5qn+GHICxIN4Z3JpuOpCpW+vcNs4hIoH9s
	aGMzZkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCk-0000000GUzj-3Q3Y;
	Thu, 11 Dec 2025 10:47:26 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCf-0000000GUqx-2oC4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:22 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso6215275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450038; x=1766054838; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPJFeWIsG1i6FowmtIAisiP3QqBxSUvcrKvafvSq4e8=;
        b=SlMLP7Sw16RN7XT07PtKlQQJ0taS1QvIye2S3o1OL1NPZZQks1ONd5NGvWRYSYI1mI
         89vu70Zk+E388X4kSC0CA1lHZtR8AR51msC/Ecfac87J+7vilM8g8xB2K50MlZsdHBkb
         o5KUZVLGs8TfMzpb41Uyr1WJ9GJPELfL911sv48MR8WIWDd9lad8wJkQfSE3sERkKGSw
         cEIbkTIwLw2Q484nIfpsWRy/azKpj/L1vjdZ6KL1iXzxJARA7gHK7lHbsuRK3MsOImXI
         gPG30EZ6eL3pYvTN1g9aBAbLhRNKVM1tVICREyKyoDwTIzGF/3RZQWH2m7XZUrx/8gNu
         mG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450038; x=1766054838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPJFeWIsG1i6FowmtIAisiP3QqBxSUvcrKvafvSq4e8=;
        b=Br/wqHwugrqEbthGW18Rt9MbKvZToSJrhgMjOeU7hk8wcpzVU4/zkRn4IkXG51zYAp
         Z/bAiqyNsMSrtg4B3/X3ZrMupIUJUcf2z09XdsFkz28EUSZ1A7OdqmxpTF43jWBnqEpD
         6BHDdwqEPuDIfaj29Oq5qQrMDBM/xOFLHAw7xexMkxRbajDJoInGx+dCmgc5d7jshQ+G
         jKn+zWG/bzYvlxFSZYJ4sX8eMxb7ZlM9YCTMdUR+vSMZ8lCqGzgBlvO2n0PZPtOvnJBO
         R8JvNHit6HSrertUy/LDrX8NxCmzwKfNtRjhFAEbaJ1Ckhb+wDYRXb2jUHrDljmaS1ZJ
         Zdow==
X-Forwarded-Encrypted: i=1; AJvYcCUyRDN/TFbbYKmOx2a2vu9jlAS/sSEvhu020RQvn6dpa2X4UkxaD8U8++T65XD+/6rOcseGAfPwuOlnOuObNC9X@lists.infradead.org
X-Gm-Message-State: AOJu0YwVZdJ+wZqaiUWIEJWF/e3HbgtvcLYSlzqZ4psEdL+xrrDIJEmx
	KqzIy1FBNbPr/qWqw/U3G/y6PYuJkqQP4fXjQIiD6WH6ppIy8wm5gKorqkF26zy8rhAoZeatkIP
	vHg==
X-Google-Smtp-Source: AGHT+IFxe3la08OatSiShthELwpIsMGdrPJNlN/I9MD19vMV+FsiKC4eR8k6s85XeMgwNaC6DyldV+5Jog==
X-Received: from wmpg4.prod.google.com ([2002:a05:600c:4c84:b0:477:55d3:90d1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4693:b0:471:989:9d7b
 with SMTP id 5b1f17b1804b1-47a8378cd86mr56456405e9.21.1765450038441; Thu, 11
 Dec 2025 02:47:18 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:09 +0000
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-10-tabba@google.com>
Subject: [PATCH v6 9/9] KVM: arm64: Prevent host from managing timer offsets
 for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024721_732307_D43BD89F 
X-CRM114-Status: GOOD (  13.33  )
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

For protected VMs, the guest's timer offset state should not be
controlled by the host and must always run with a virtual counter offset
of 0. The existing timer logic allowed the host to set and manage the
timer counter offsets for protected VMs in certain cases.

Disable all host-side management of timer offsets for protected VMs by
adding checks in the relevant code paths.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/arch_timer.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 3f675875abea..f5407301c8f9 100644
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
+		return -EINVAL;
+
 	mutex_lock(&kvm->lock);
 
 	if (!kvm_trylock_all_vcpus(kvm)) {
-- 
2.52.0.223.gf5cc29aaa4-goog


