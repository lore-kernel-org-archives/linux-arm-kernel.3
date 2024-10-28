Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A196D5B845
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 23:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=weKc7pUE07xNeQr09+d551wOOvD9evRa1kruXuN5EzI=; b=dsNxorU6KQM0atwRRfZXY6HM4u
	QJbAdk1KgxvZ4xWd8G4spobWBk4Ad5JXmI6u1olAW5qU/a4UtXadkem8/cQV1wUrUzzsosjuALZGQ
	GT9icnZBJ99gNkLbVzSXqgY+reBR+RVqu0tbiyMHBB4hP0CKzDNtK2XTvTPzI6rQsxlk8F0d5364P
	NtnrprLsT7th6DDJuxU3YRJxvwxiB6tQtPqtGf+VRRMbOCadTsaSChIHgOju1ljt3AerIZ+9QZUdB
	pv3gNF3+xN46GWxjWqqQ0ciosYLJShIPCdbd7DYkBGeNCKcnbj+ljiElj+EjX1OmhjpwmQwz25P6p
	AMO1rF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ZSF-0000000CfYS-3Ejm;
	Mon, 28 Oct 2024 23:47:23 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ZQb-0000000CfGg-2sKR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 23:45:43 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e7e0093018so80538007b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 16:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730159140; x=1730763940; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=weKc7pUE07xNeQr09+d551wOOvD9evRa1kruXuN5EzI=;
        b=PyTV4YUbQ3RlYawYHwxHuc6yzMTrwZ7KMP0pKkjHRDZy+Adc2DEGQGrZy6PM3ZtPNn
         C6+xwj3bHHkqHUjqsyu5Y97qVoL27P9D5+ME6qJJBAZMj3xCxr4k6GLKSdM4VKVdimYc
         JT18D5QEXVMs0aHj8ANXmo21g9eq5sxIb1EGDgGjiwWXiJldl5tZMMNNGUAiIXvLCri2
         0MDbfLFL322uhtckhkOa+AlfxdzRC9e+/LJ3UtiMNh8vnNC679bzYoIje4sP3UFl+Ycu
         nDR8wbBr+irTQgp9mAfoIwF0QuNuTbG7+bDF+liEKQ02p7bvJBIbAlG7gcYldFQYp2Us
         0OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730159140; x=1730763940;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weKc7pUE07xNeQr09+d551wOOvD9evRa1kruXuN5EzI=;
        b=YLcRTlBjn6HzJTwX4tLCFz9n8jm2OekwGXjPna2sS/IehliNQszoJeWITMKpbYB7Lu
         Vzcq6MiV3wUzcu4GBEZFvSt0FZmnVBG2i72cG5IwqukGzgs0CR4EaBFHzTILk3Xr6ki3
         QEiqvzWJapaIR8uwZYoNbCgI43oW1e6qwqO+awjBPAsllslhmRgIpu4lMFzbiMCx4DM4
         W07NQtEr6/N/sWctvX99y73tdY/mRjdR/viN7YL9cH5uaLvbTnM4Hm9/1h9YKhYPnQgZ
         UZUSQJZGZopGniCZBlQ8srv2bsb/CAwX4JuLQnROJFCq4rsucyCSUgRuoJuipAunu6AH
         kPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYbOYybXsBQNcH09Q3yJywmc6a5t1MUQ6Pj4JCGArX7AwxmLqtpcTOup0t39ycgj9GNn3L4cKewC/nI02pXvp2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2e3DVwNziQStgVG+ZbjVIeMUhav/jYdwanyWhZsMVAonAtbRg
	+ObMD6OAg5cVo1gQMy5gPy+BOAF5sSFaz7uLX3KRhWUy2RxOC+hHKkIC0pA9cz+sMiILomkLXd7
	ei//Kjg==
X-Google-Smtp-Source: AGHT+IF4LmiHNOFeP+dSBPOKHULSDdtDWGw1BAC4q4CWY/ss/tKZYDeGiq6b6X1zvQASXhcbrNhz5/FwP0y8
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fac1])
 (user=rananta job=sendgmr) by 2002:a25:c50a:0:b0:e2b:e955:d57f with SMTP id
 3f1490d57ef6-e3087bcecebmr5816276.7.1730159139417; Mon, 28 Oct 2024 16:45:39
 -0700 (PDT)
Date: Mon, 28 Oct 2024 23:45:33 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241028234533.942542-1-rananta@google.com>
Subject: [PATCH v2] KVM: arm64: Get rid of userspace_irqchip_in_use
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, syzbot <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_164541_753293_861F13E3 
X-CRM114-Status: GOOD (  18.96  )
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

Improper use of userspace_irqchip_in_use led to syzbot hitting the
following WARN_ON() in kvm_timer_update_irq():

WARNING: CPU: 0 PID: 3281 at arch/arm64/kvm/arch_timer.c:459
kvm_timer_update_irq+0x21c/0x394
Call trace:
  kvm_timer_update_irq+0x21c/0x394 arch/arm64/kvm/arch_timer.c:459
  kvm_timer_vcpu_reset+0x158/0x684 arch/arm64/kvm/arch_timer.c:968
  kvm_reset_vcpu+0x3b4/0x560 arch/arm64/kvm/reset.c:264
  kvm_vcpu_set_target arch/arm64/kvm/arm.c:1553 [inline]
  kvm_arch_vcpu_ioctl_vcpu_init arch/arm64/kvm/arm.c:1573 [inline]
  kvm_arch_vcpu_ioctl+0x112c/0x1b3c arch/arm64/kvm/arm.c:1695
  kvm_vcpu_ioctl+0x4ec/0xf74 virt/kvm/kvm_main.c:4658
  vfs_ioctl fs/ioctl.c:51 [inline]
  __do_sys_ioctl fs/ioctl.c:907 [inline]
  __se_sys_ioctl fs/ioctl.c:893 [inline]
  __arm64_sys_ioctl+0x108/0x184 fs/ioctl.c:893
  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
  invoke_syscall+0x78/0x1b8 arch/arm64/kernel/syscall.c:49
  el0_svc_common+0xe8/0x1b0 arch/arm64/kernel/syscall.c:132
  do_el0_svc+0x40/0x50 arch/arm64/kernel/syscall.c:151
  el0_svc+0x54/0x14c arch/arm64/kernel/entry-common.c:712
  el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
  el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

The following sequence led to the scenario:
 - Userspace creates a VM and a vCPU.
 - The vCPU is initialized with KVM_ARM_VCPU_PMU_V3 during
   KVM_ARM_VCPU_INIT.
 - Without any other setup, such as vGIC or vPMU, userspace issues
   KVM_RUN on the vCPU. Since the vPMU is requested, but not setup,
   kvm_arm_pmu_v3_enable() fails in kvm_arch_vcpu_run_pid_change().
   As a result, KVM_RUN returns after enabling the timer, but before
   incrementing 'userspace_irqchip_in_use':
   kvm_arch_vcpu_run_pid_change()
       ret = kvm_arm_pmu_v3_enable()
           if (!vcpu->arch.pmu.created)
               return -EINVAL;
       if (ret)
           return ret;
       [...]
       if (!irqchip_in_kernel(kvm))
           static_branch_inc(&userspace_irqchip_in_use);
 - Userspace ignores the error and issues KVM_ARM_VCPU_INIT again.
   Since the timer is already enabled, control moves through the
   following flow, ultimately hitting the WARN_ON():
   kvm_timer_vcpu_reset()
       if (timer->enabled)
          kvm_timer_update_irq()
              if (!userspace_irqchip())
                  ret = kvm_vgic_inject_irq()
                      ret = vgic_lazy_init()
                          if (unlikely(!vgic_initialized(kvm)))
                              if (kvm->arch.vgic.vgic_model !=
                                  KVM_DEV_TYPE_ARM_VGIC_V2)
                                      return -EBUSY;
                  WARN_ON(ret);

Theoretically, since userspace_irqchip_in_use's functionality can be
simply replaced by '!irqchip_in_kernel()', get rid of the static key
to avoid the mismanagement, which also helps with the syzbot issue.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot <syzkaller@googlegroups.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---

v2:
  - Picked the diff shared by Marc to get rid of
    'userspace_irqchip_in_use' (thanks).
  - Adjusted the commit message accordingly.
v1: https://lore.kernel.org/all/20241025221220.2985227-1-rananta@google.com/

 arch/arm64/include/asm/kvm_host.h |  2 --
 arch/arm64/kvm/arch_timer.c       |  3 +--
 arch/arm64/kvm/arm.c              | 18 +++---------------
 3 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 329619c6fa961..9f96594a0e05d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -73,8 +73,6 @@ enum kvm_mode kvm_get_mode(void);
 static inline enum kvm_mode kvm_get_mode(void) { return KVM_MODE_NONE; };
 #endif
 
-DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
-
 extern unsigned int __ro_after_init kvm_sve_max_vl;
 extern unsigned int __ro_after_init kvm_host_sve_max_vl;
 int __init kvm_arm_init_sve(void);
diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 879982b1cc739..1215df5904185 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -206,8 +206,7 @@ void get_timer_map(struct kvm_vcpu *vcpu, struct timer_map *map)
 
 static inline bool userspace_irqchip(struct kvm *kvm)
 {
-	return static_branch_unlikely(&userspace_irqchip_in_use) &&
-		unlikely(!irqchip_in_kernel(kvm));
+	return unlikely(!irqchip_in_kernel(kvm));
 }
 
 static void soft_timer_start(struct hrtimer *hrt, u64 ns)
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a0d01c46e4084..63f5c05e9dec6 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -69,7 +69,6 @@ DECLARE_KVM_NVHE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
 static bool vgic_present, kvm_arm_initialised;
 
 static DEFINE_PER_CPU(unsigned char, kvm_hyp_initialized);
-DEFINE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
 
 bool is_kvm_arm_initialised(void)
 {
@@ -503,9 +502,6 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
-	if (vcpu_has_run_once(vcpu) && unlikely(!irqchip_in_kernel(vcpu->kvm)))
-		static_branch_dec(&userspace_irqchip_in_use);
-
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
 	kvm_timer_vcpu_terminate(vcpu);
 	kvm_pmu_vcpu_destroy(vcpu);
@@ -848,14 +844,6 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
-	if (!irqchip_in_kernel(kvm)) {
-		/*
-		 * Tell the rest of the code that there are userspace irqchip
-		 * VMs in the wild.
-		 */
-		static_branch_inc(&userspace_irqchip_in_use);
-	}
-
 	/*
 	 * Initialize traps for protected VMs.
 	 * NOTE: Move to run in EL2 directly, rather than via a hypercall, once
@@ -1072,7 +1060,7 @@ static bool kvm_vcpu_exit_request(struct kvm_vcpu *vcpu, int *ret)
 	 * state gets updated in kvm_timer_update_run and
 	 * kvm_pmu_update_run below).
 	 */
-	if (static_branch_unlikely(&userspace_irqchip_in_use)) {
+	if (unlikely(!irqchip_in_kernel(vcpu->kvm))) {
 		if (kvm_timer_should_notify_user(vcpu) ||
 		    kvm_pmu_should_notify_user(vcpu)) {
 			*ret = -EINTR;
@@ -1194,7 +1182,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			vcpu->mode = OUTSIDE_GUEST_MODE;
 			isb(); /* Ensure work in x_flush_hwstate is committed */
 			kvm_pmu_sync_hwstate(vcpu);
-			if (static_branch_unlikely(&userspace_irqchip_in_use))
+			if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
 				kvm_timer_sync_user(vcpu);
 			kvm_vgic_sync_hwstate(vcpu);
 			local_irq_enable();
@@ -1240,7 +1228,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 * we don't want vtimer interrupts to race with syncing the
 		 * timer virtual interrupt state.
 		 */
-		if (static_branch_unlikely(&userspace_irqchip_in_use))
+		if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
 			kvm_timer_sync_user(vcpu);
 
 		kvm_arch_vcpu_ctxsync_fp(vcpu);

base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
-- 
2.47.0.163.g1226f6d8fa-goog


