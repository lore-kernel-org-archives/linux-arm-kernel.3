Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8BAD149F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 22:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kAitD5UlZ526DH4CXulhVwZM1+TjXuj2ZSzY1GKH9CI=; b=EIIHozV4P8um6MIb5Ei/71CTy2
	1vG7Q/1hN8BXAI/+JQpFAwyi+pHEwATTiQgQWRNq9hBIttAoe6JmCOI5zJ9MgvTdHavC8MEc/aZ+W
	0/sorua92w+APOXUChDO875I+rkkxeW37VBvQtv8Bg2gAr93MroSr00J/9SeKOcWPoU5915GHoRNw
	w6bxwi1Sd0LXCoqaAOK10HuLy5phsWS1GB878q7cPNWihBda4DMOopn+NpsplyQzBFD6G++370nqI
	R83rXf0jcUnV2MgewkUbb59CSb4Gu5VansWE2hieY/uWUkehAdVybvPyQ0FvJqo/BfvK7dgHSl4Ig
	KZlllZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SbK-00000005Plx-1vXT;
	Fri, 25 Oct 2024 22:16:10 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SXh-00000005PJq-0CPC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 22:12:26 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e29142c79d6so3627839276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 15:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729894343; x=1730499143; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kAitD5UlZ526DH4CXulhVwZM1+TjXuj2ZSzY1GKH9CI=;
        b=1qvm2ruVFir6nd/pfVeVwuS4KYZMiSIf1PicW/6NcIA0MDACh+TtgdfK5k/OgQWyne
         GymZ28KiF0OMlGN7yUcjfWs9dwQaYJS1zxKGSU0XrUwr7++wPIfKy6jG5lfYPl9VyDDk
         BVklxRvIyEbOC5+H1hqew3C3sq85NYlM7unnLioknhEhmXJ3Zz5S/jleDPCVfZ6RgTem
         uc/FuLx64eCSv2gfEYVCoY4tDi7zvSGGOdksdDkMpUDMMNyGbDYP94t1e8r097SVrh5a
         z0nOJssGFnLAd+Fbv11ZSHbg5+SwxOH0YSWBd5p6zstyOqhcqWEXorzNfpnROMVoLh2Z
         obbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729894343; x=1730499143;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAitD5UlZ526DH4CXulhVwZM1+TjXuj2ZSzY1GKH9CI=;
        b=U6TXmAmkxOjnIsAREUMFC1dRiivop+BIh9WbYbmsR5xbnfWXduPBtAiirSRGxCiWBW
         +ZaHbyZCK12dDCfIXKo86hvWbt/4in+66APFCV769aMdwSXSm5es9UcDemCjelRcOtAq
         DnHRZBIT0/cyVE7cNixAEjCgXJNrf3VYKTX9tWNQ51PBdi8WbzB36Sg8LduANiAJ9MI9
         6W9TBq8syyZj2Vh3OvXCBYDrtMb2FlB0YNLD/zBpFc3e2LrI/nCA6t2tlCL/OQ/XHSmM
         EeWxL3hNOSetsfYOZ3KFQwd+LMt/4cue4GXgyTZFjCEyoCpwos2NpmFEYb7zQpafII8G
         hg1A==
X-Forwarded-Encrypted: i=1; AJvYcCUkCooIkInwolQM9dwyLtxg2rKfhRcb042OukdKlX9fwvk5iJ8FJ6fAdDnoRbSqWu8kUrU18ZFANsdAarwoCFK+@lists.infradead.org
X-Gm-Message-State: AOJu0YzfCnZoXXQhmCUuV4fUyemvPWgVHOzhrAReqzPUp6Z0Xx2aO+ki
	1F1zVYBZ0QkRLAiFIfQr3Zdx53fc9UfP6oLT2TmHg6ol2nklvgquVhMWO/2KsP1MdBkssC6cp3c
	5IlPVLw==
X-Google-Smtp-Source: AGHT+IG+6UAmoj1XD96N3OA7Nf/oOruad1eDYvy56vmbEa612keZSXmPriH5DCYyGrnCxORY2rVIPeM7z/tx
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fac1])
 (user=rananta job=sendgmr) by 2002:a25:ec0c:0:b0:e2b:d389:b35c with SMTP id
 3f1490d57ef6-e3087bfc151mr497276.8.1729894343080; Fri, 25 Oct 2024 15:12:23
 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:12:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241025221220.2985227-1-rananta@google.com>
Subject: [PATCH] KVM: arm64: Mark the VM as dead for failed initializations
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, syzbot <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_151225_130971_D4C25B54 
X-CRM114-Status: GOOD (  12.51  )
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

Syzbot hit the following WARN_ON() in kvm_timer_update_irq():

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

The sequence that led to the report is when KVM_ARM_VCPU_INIT ioctl is
invoked after a failed first KVM_RUN. In a general sense though, since
kvm_arch_vcpu_run_pid_change() doesn't tear down any of the past
initiatializations, it's possible that the VM's state could be left
half-baked. Any upcoming ioctls could behave erroneously because of
this.

Since these late vCPU initializations is past the point of attributing
the failures to any ioctl, instead of tearing down each of the previous
setups, simply mark the VM as dead, gving an opportunity for the
userspace to close and try again.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot <syzkaller@googlegroups.com>
Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/kvm/arm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a0d01c46e4084..ae3551bc98aeb 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -821,12 +821,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 		 */
 		ret = kvm_vgic_map_resources(kvm);
 		if (ret)
-			return ret;
+			goto out_err;
 	}
 
 	ret = kvm_finalize_sys_regs(vcpu);
 	if (ret)
-		return ret;
+		goto out_err;
 
 	/*
 	 * This needs to happen after any restriction has been applied
@@ -836,16 +836,16 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 
 	ret = kvm_timer_enable(vcpu);
 	if (ret)
-		return ret;
+		goto out_err;
 
 	ret = kvm_arm_pmu_v3_enable(vcpu);
 	if (ret)
-		return ret;
+		goto out_err;
 
 	if (is_protected_kvm_enabled()) {
 		ret = pkvm_create_hyp_vm(kvm);
 		if (ret)
-			return ret;
+			goto out_err;
 	}
 
 	if (!irqchip_in_kernel(kvm)) {
@@ -869,6 +869,10 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 	mutex_unlock(&kvm->arch.config_lock);
 
 	return ret;
+
+out_err:
+	kvm_vm_dead(kvm);
+	return ret;
 }
 
 bool kvm_arch_intc_initialized(struct kvm *kvm)
-- 
2.47.0.163.g1226f6d8fa-goog


