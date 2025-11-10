Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD9CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qzpqv5ajxbqxabD1jydfXotwMWgcKwPTq7CgnH0DZ4Q=; b=1H+jhEddUB45nH2QUC9rZXQaBB
	O5AWJQWK+10pQILj8XMxAvY2ILTCuzIjoCGlgExZURyb3qtJZ9hBu0s9zSHrGWtBdlZmBLqTtJ1pd
	TbD+lTc3h5l5rodzXb0XX7y2NXXDXB7zz4tQYGk1GZrIoRTRu0b4MJIdI9EkB6noIDEqvfuIpLdU1
	I/cmReVTh6HiPrLZ0LS5vpVCtUOAN8PRp7CWm+ckkMuSDVzKknbxlFCLlP0AqRxe8LUqlJnW9V/0O
	U7KzZVU4Szco3s6vHqVPim0nOc9KL2S+kmtr/9wiq8dIy/J72G3/h8xo/0kIxA0d6vJTLTCbWy8ws
	xHy9aGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISDF-00000005VxX-1oJT;
	Mon, 10 Nov 2025 13:45:41 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD9-00000005Vre-2AFU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:45:36 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-429cd1d0d98so1844558f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782334; x=1763387134; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qzpqv5ajxbqxabD1jydfXotwMWgcKwPTq7CgnH0DZ4Q=;
        b=enKmBnvbjnjEVm/HfI2FP+pJnNwmLxOIzeIGWItXz56zUpyoekOmi5mhzJEd6Yf3/n
         GCRl6O235spGNhidMMVI/6mNxzAWStUtv0O3upMQXfB2tJidSkbtUuhln0pOc6Fxi7+B
         2G2+6miAlFLMS9BGijzQ2ZR3ew0zg7hUIi7ZpNF+t4DsGtuSCmygu4rY+jwWGgmouWmh
         uHXfQ16U4SEEp52KP0viHsxFI2gnk7DxopQXfel3voapS2gDOn3NF+ArVpa73Nea+3K/
         A4xF+zzMxnRmifrUY6GtK47fWckxyvlpEWAaaLz7FTLMhR94skejaww7fK/Lse96wGKC
         UJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782334; x=1763387134;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qzpqv5ajxbqxabD1jydfXotwMWgcKwPTq7CgnH0DZ4Q=;
        b=i234k5DxjG9tk0qxJq7fhRu3Qh7l9uICyPoLwacK5esxHebpf4aC+0W5di8szoAfES
         xM7zgUqQeOu4JMNZvyKkxmAKCWOVACGxnphYjhGjpWkYlEwyqwItAdsn1LVerbQe8H1Z
         jiuPaM/tDoWyCbneIZ6pFzmq8jGoJyxZmwd1l2R+gWWduryN5Ss13CUrozE+UFwhm0ru
         0Bj9o04Mnej9EMdQ2KcIZfMmLlKp1Unz+axaRzPPSMNBSFjk00UlIxAmxJMrC6NMar7X
         FHNApZl6FPCJNmkV0zIWIfo2KPTtQOzAXHrfarKynz/aR9uW4WiXhE4wI1KgFs9GVxsO
         I2mA==
X-Forwarded-Encrypted: i=1; AJvYcCVA2HY6YBVyRJG7b6UWhKlR49zoUJ6aTZ1PX9DoMPZdAQWFnfX1yRw6S25wlyI/9C+xs2im8u2jiszJ6K5yQwcv@lists.infradead.org
X-Gm-Message-State: AOJu0YytHxyhau2XzdVwdIMg61DRuLz7ISi1y9iExi1INRvBOMKQj+00
	LtIQJaOxD3OH07Xe8wZ7nvdBO5vU7YjcbokHaybDwDflT+Lihg4A3t+f+wpDV/gqaYIEHBBx+57
	d8g==
X-Google-Smtp-Source: AGHT+IFXypgY1V9bfoxm4HDW9/b5rxBK9APolSwH/TBkmLsNgB/D1VFW8wsaUqSkXIyZxf2Xvb+MQ1m1cg==
X-Received: from wrnu4.prod.google.com ([2002:adf:eb44:0:b0:429:cab7:2300])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2910:b0:429:dde3:6576
 with SMTP id ffacd0b85a97d-42b2dc2fca4mr6437305f8f.16.1762782333846; Mon, 10
 Nov 2025 05:45:33 -0800 (PST)
Date: Mon, 10 Nov 2025 13:45:25 +0000
In-Reply-To: <20251110134525.3768197-1-tabba@google.com>
Mime-Version: 1.0
References: <20251110134525.3768197-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251110134525.3768197-9-tabba@google.com>
Subject: [PATCH v3 8/8] KVM: arm64: Prevent host from managing timer offsets
 for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054535_639704_9C17369F 
X-CRM114-Status: GOOD (  13.82  )
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

For protected VMs, the guest's timer offset state must not be controlled
by the host and must always run with a virtual counter offset of 0. The
existing timer logic allowed the host to set and manage the timer
counter offsets for protected VMs in certain cases.

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
2.51.2.1041.gc1ab5b90ca-goog


