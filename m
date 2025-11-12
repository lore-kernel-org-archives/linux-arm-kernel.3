Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1AECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha/YRLGp8HBWidSTkYnv9ioTPj5VutIpABv4fgu7GPY=; b=uTb2ot/smLu8uSWpl559TkS7V0
	IUtCf0sHwW3ln6Q5jOIcx7eT5/VZY/wURhmbLzxxbJM8WYIqrNYmxu8tzDvKsSZ/yddlRV7SdZi/q
	CyyA/46NwC1mAylHdFOllGt2FeDJh4gyntNFwK35b/8B47YUN6/YLDqZauB6tPAMSTPmQQ4yF1JLI
	WaGUlnq4WHJjl5sT8bXix1QrvwGOHEYfh9+yhsGl+nYiRk5lRQC3hwhu6YPlGuqZ1UOdXMhVoTVpu
	Lk1CBaeNlMNRZlk397OoUyzQMVlmBz73xn3a3TfYVkrDtGIhNgO8yyS+vVe98ShiotvO2a0g7m1cF
	BUX5N41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72N-00000008Ry0-0nxo;
	Wed, 12 Nov 2025 09:21:11 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72D-00000008RqE-1qLI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:21:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47775585257so5140885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939259; x=1763544059; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha/YRLGp8HBWidSTkYnv9ioTPj5VutIpABv4fgu7GPY=;
        b=xEXshzJqT6rvzTutDcTzOa4BRklm3L1LcAIgjROikwyEl3oNJIOLWtuYNkkW+Kd3QT
         ZAcVOrxW6EUEMEOfVqZ9diZvKBBHAc7awBDYh2eUgFrhRNitOkzqcAKm5MnkK25DbJ3u
         Ib0RbB2Z+evBa3tWV1BDTEqCZYy91tIuFYfZwGRimpfPr9Bc7wOUrCFRZoNEZnoBh7fd
         JcgmNH0W1h73tN4WDScAwlcdkXJyeCCYSAxYsiceu/pzzGBO5L7Bf+jw3Fdb7PGx8+lr
         ee9vm0h16yF3IoLACaRolaHu0TMDtWcyKX09MWT0C5YMAfqBdiZYYBbOgg8jyGO7E7JO
         QcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939259; x=1763544059;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha/YRLGp8HBWidSTkYnv9ioTPj5VutIpABv4fgu7GPY=;
        b=v86mPVc7S665psCjEwBqiVX/meE5i2mbifa73dQgnalmRQvDpnTwPhnNJn8G0L4e6K
         Ir0UGLC0We22A1dAy4MHVmn9H+ZQU7gnXhUwLoq1Cmu6yjvND8A/RfhKVHutWxd69tWl
         mlTQJ2XtXmyBjdyt7eHGtZx0ehjM8170CzxrK+6G4/SWqBBWFKd3ltZWKYjRjLHCO8j2
         xgrI6WeygK4rp40JXPEnMop2pmDjoQY2lppQLEAg+hio8ZJiSmXzr/pTfYKcujdJujpE
         QJ9+cQCqUOL2jgDgDk3C09zIpvJ4UGINJrI6KGka2WaWltNd8NeY0QstFwQa3ZgrYJTh
         AMNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5I3Zm4THFuZhk1PkMvdnaTGY/M+sywngw4ETYK6lackqCnVmwsJtYVhodLTqmz3AubImi/9+gLQJskLqm8b4o@lists.infradead.org
X-Gm-Message-State: AOJu0YynrXd/2DjO4uwbBGsAT1TNredFP9wNzmshGx/lCDYP5jouEtH8
	FPRNa3ZiWOHACJ/6SiTk+gev644YXk/6CdBTQ6MgpdLKYBx+GE4HPhQAwoH7ov3qhq37112Ybra
	WKg==
X-Google-Smtp-Source: AGHT+IHPoUFaCLXOjMyWSCfx4qzg7cUE3fpxwRgUakYBHYLPzOGYHPaTvZj/fIrra8Jk61aAvHQwv7ghSA==
X-Received: from wmjq19.prod.google.com ([2002:a7b:ce93:0:b0:477:3fdf:4c24])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3586:b0:477:7768:8da4
 with SMTP id 5b1f17b1804b1-477870438bamr20235595e9.7.1762939259550; Wed, 12
 Nov 2025 01:20:59 -0800 (PST)
Date: Wed, 12 Nov 2025 09:20:51 +0000
In-Reply-To: <20251112092051.1376245-1-tabba@google.com>
Mime-Version: 1.0
References: <20251112092051.1376245-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112092051.1376245-9-tabba@google.com>
Subject: [PATCH v4 8/8] KVM: arm64: Prevent host from managing timer offsets
 for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012101_593219_5C90CF8C 
X-CRM114-Status: GOOD (  13.90  )
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
2.51.2.1041.gc1ab5b90ca-goog


