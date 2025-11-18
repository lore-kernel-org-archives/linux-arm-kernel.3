Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEC4CED27B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdD3HvYe/LmQgWb1ELzMtTfkz5l2xc5jclOfmsq7xGc=; b=TEiAuDRqfjCQUbEUaXFiXxV7AQ
	SugKs0Rf/OtbCxo0YicyilF54990ygnFRqJYHIXl0qtaKEeF/uU4GtW6YxputnNZue2gjEYxehMiy
	66iDlbAv16fkKWmeyihJ7dEnkqvPOlKxJ8RJHgbNiBtxic5/ZC/ieLPCohjdwaMaxmgaKKXRChV+A
	uevnKQxj29hk71iyyRbngiTxNwvJM6ou8L7KMgtmusBSHDm2oIf8OYTlJgs7F+hnIQC5A/+4qxdj/
	IoHoWzQFpBS0eOyX4ftsQOL9dDyLQRKReuhJYp8pKBzF6DqsECVz0SpmGfpIjYsiMiho6oNXvxrh0
	1qGs/1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6M-00000000Fnr-1Hoo;
	Tue, 18 Nov 2025 10:38:22 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6I-00000000Fjo-2PSX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:19 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-641613171cfso7347806a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462296; x=1764067096; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdD3HvYe/LmQgWb1ELzMtTfkz5l2xc5jclOfmsq7xGc=;
        b=csLdHdaXr2O7tlwV5Og2n/ehlbxgEccfbW0JT2spcVfGPX84y6hAEZyH5VJsbKhXCZ
         sz2kefeOsJ3yz5w9b51FaXqpkurrgXrJdiRCgcDbR3Ojzh/m2nGgF09xXPG/QXBMRX1j
         4O6PsvQ0mFU870ld3hSgztFEeZSdY+O6BJPbVPJqJf6oML66hiiQ0I+vMFnP7Y50lx3s
         yJZcsgtaFgGppSGs48fBn+oBDLJ3Js42w18oaSSz6ZEnWKzs5N9bseKWC2yn9cPCWXhY
         FHRUKjw2PpUpn6UcwH5aJFSnlNw6Zpi3OXPiCEAxDOlvg/x3UfAYNCtuBn8MB1SNzQy1
         Sdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462296; x=1764067096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdD3HvYe/LmQgWb1ELzMtTfkz5l2xc5jclOfmsq7xGc=;
        b=qKqKKxSWCBiG4Dp2NdFbnhJ4MHwSHsP+jMiR5LTDjZLPHsOXMb+s/iTCC0YTuCS7Ys
         iafEmtuZoEAZC5TVRBGViPVs4pJtePdsddfFJonOLD2gXVDdzeexFEPyogsKcK0ehz7G
         eHsdZOYyegMhy9jYPLv88BASZcaQ8OZH3864cR2EqX/7eOU0QDIk5c7a5BnVwd6K6LNi
         ApUa+6K9apYlVlrg0y7iqcU1Vk1+yxHSBqB40EGKWcWF+OXks97YWftHd60NxlRyyeJO
         mwEHF7jCOE5tnFEnHyyqwjR/syYMmsYXHCtbBsqqNgt/BKysYJFzlUzAVcVyy3g/5Cvv
         S3EA==
X-Forwarded-Encrypted: i=1; AJvYcCX7VE+2bsKQiEfY/gCAoPNYzVFkvDr3UkC+xNM+6YwUPrSsm066lP1lMJNZN/eDEKRQ/2VmB0rPhKL8JtMj16FE@lists.infradead.org
X-Gm-Message-State: AOJu0YwxpavF0GjAXOCvxtNc1z8YnAHhazqVNmzzg1gHpXmH2ZFgOhOt
	fOd0h+ZaEULvCU+WIOkU7V7fJRFdsyw9Dw9tzs3JyjUu6qGc4wKp/7SpVMdkpSFW4qKbKE+0j02
	r0g==
X-Google-Smtp-Source: AGHT+IEJA/93zlApirgJ20FxZ4HFh69ol4ZkNO3y+csZUeciJUQyIEUxS2YM11xAwc6simPGysMnBpLtPg==
X-Received: from eda13.prod.google.com ([2002:a05:6402:a00d:b0:643:38d8:ea2a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:51cf:b0:640:9bb0:a059
 with SMTP id 4fb4d7f45d1cf-644fe9b27demr2655048a12.10.1763462296292; Tue, 18
 Nov 2025 02:38:16 -0800 (PST)
Date: Tue, 18 Nov 2025 10:38:06 +0000
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
Mime-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-10-tabba@google.com>
Subject: [PATCH v5 9/9] KVM: arm64: Prevent host from managing timer offsets
 for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023818_627778_953AD1DB 
X-CRM114-Status: GOOD (  13.54  )
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
2.52.0.rc1.455.g30608eb744-goog


