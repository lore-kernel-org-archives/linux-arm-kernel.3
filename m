Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8ACF53D80
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aVMNYqgbLtglfFJK2IfbXVz92dSXKpE2nwANbOIprc=; b=pPjBJhXH5Kl3U006g6I1fqDWwY
	BlPvgOFDeB674Ki6CIXbdROGAcEa4WT//og4G03QMaAD6vtZk3GqmHDOqjLDoonJRvFTs7//aGin9
	40ZmcTfnRMny9n7L9x020faBEvAOu6G07ueO9iZAaTki1vddTkFEk+e4N0bZKGL4QtGs3VGF9kuq0
	+x/PMWfpxiTw3MY6xKwCBOBDLMchE7PynKJ8h64r2KWx5rNHVfbka7/jscW8QF5/9JcUG8etEiR7o
	e/xSbBCDUCB6a6fNgSVzYtF7ZFf2fl/ZfptAd0de47CNc5ZlnBZObDxccUS71KZtIZFbmW38Erji8
	t+Tf+ZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Br6-00000004Zxe-2GXu;
	Mon, 16 Mar 2026 17:35:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqv-00000004ZqQ-0aap
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2aVMNYqgbLtglfFJK2IfbXVz92dSXKpE2nwANbOIprc=; b=XFZWIW8YAetn50N0Ej6YS6bJ7l
	90DlBWBdGl6ZnYaTWTzct2mxvBeILaSfFhOWamlz32UZBJ5NRWlTs5YoYveggaI9Na2Frc8ZcW4xc
	fZRK+rIspUDU2pNurdpIrvd/XHQ9w9JgfL0PShDrMgN7O3tFXDuM2ps+78qQzrzLBksKtQ6qQb7uY
	FqaUj9DeoYy1vIn9QueSUe0PXu27J6zbVji0wLMJlZJR+CreBPiaD8x3Ka+7m7xxUuIOZMYR3WfYD
	UNk0q0J7+cKSQ8GFpbzq8P8rB9v+cQSPgS0133ilFkQzZiXO13W2Oagl8ZNe6yW8T5BbXrireGBdD
	uLYFUNGQ==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqs-00000007Lsx-0fVN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:39 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-439c54e0f6aso3739136f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682536; x=1774287336; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2aVMNYqgbLtglfFJK2IfbXVz92dSXKpE2nwANbOIprc=;
        b=ctbzbgj8kv4+4jy9W/PtyGCXTH+yedrbe5tVbGYaHaN3VnZmQt+Ya4w/UL2gVnHdw9
         rjg/q2v2p6fr9LU4uSj5GXL8ct72IlKut6gMaEcetl0Cr4Sa7lBwzVmX3pz/Afv2Wt9z
         HlXDhUuqUXtAhtOtuAlxwYG1FhilmYjxFen2XM1+vO7PM39TJVMnDEXUhKmy9S9NZUNP
         UxaA50ds6ekWv6aJIswCAC7IjJGRo7Mukje2I1JElXjPrSKMxZSoZjn5vdegbx2umRfW
         MOUhoxuRCcK0JNTdDzWhpPOHBWlsxflV9JPZEzfc6sYKvBj5oLbLI2zrvWwJn3yizP8B
         nqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682536; x=1774287336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2aVMNYqgbLtglfFJK2IfbXVz92dSXKpE2nwANbOIprc=;
        b=QcVe9a5ph9REH3OwezNMXKf7Z/pZvDxeQKyvJrbJp3L7OtF4icUZTI24wxrASix2+a
         azqE+ZdsRXxJv7wteZTaeKDgM5D39hPdRq6+4h2Ss73KHqRR+0fY6k3cWLkNF/+2bJPs
         Xsp6/SqZJvhkxjx6mvkRdbdEn+5e+71GPviczSBpTB54qIvYetP8Jis+2H8r9vaoMOFO
         PqJhruyrV9MTW9kP5GXg+Ib1prd40lcknFpQGkJiG8y+cNxnXat3PFbvpCE/djsvu2OG
         NxpypPSZNWOz86cyZuYNeC2IW33WBL0D/gpyMm+ek40njtD0Ozjx3eVapfuZzpkADVib
         sw+g==
X-Forwarded-Encrypted: i=1; AJvYcCW/Moxsx6AcESsi2pQJWo2oZdlKq7Z119BxuFxz8QvsXJgRFz3wvNbQUjlfeOOkcKMfsg/qBCik7KlfVP0EVuaH@lists.infradead.org
X-Gm-Message-State: AOJu0YyDs/07vXE8aDc04WNJP/4P9ULrmivmcdOYbMnAKJkmHhrlXJ0k
	4E6EuVUkdJ3ecIYBUdBwed/KZpZIXAuYys8MXVNDuSYl23ajpmYLPY5+Fy+oJV+Pnn/AZySfjh7
	iFQ==
X-Received: from wrbfu19.prod.google.com ([2002:a05:6000:25f3:b0:43b:458d:a311])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d09:0:b0:439:c153:ae3d
 with SMTP id ffacd0b85a97d-43b498127f3mr1058497f8f.6.1773682536058; Mon, 16
 Mar 2026 10:35:36 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:28 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-7-456875a2c6db@google.com>
Subject: [PATCH 07/10] KVM: arm64: Use scoped resource management in arm.c
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173538_270327_E6FB4F98 
X-CRM114-Status: GOOD (  14.25  )
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

Migrate manual spin_lock() calls managing mp_state_lock and manual
mutex_lock() calls managing kvm->arch.config_lock to use the
guard(spinlock) and guard(mutex) macros.

This eliminates manual unlock calls on early return paths and
simplifies the vCPU suspend/resume control flow.

Change-Id: Ifcd8455d08afa5d00fc200daaa3fb13f6736e6ed
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/arm.c | 53 ++++++++++++++++++++--------------------------------
 1 file changed, 20 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 410ffd41fd73..017f5bfabe19 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -274,17 +274,15 @@ static void kvm_destroy_mpidr_data(struct kvm *kvm)
 {
 	struct kvm_mpidr_data *data;
 
-	mutex_lock(&kvm->arch.config_lock);
-
-	data = rcu_dereference_protected(kvm->arch.mpidr_data,
-					 lockdep_is_held(&kvm->arch.config_lock));
-	if (data) {
-		rcu_assign_pointer(kvm->arch.mpidr_data, NULL);
-		synchronize_rcu();
-		kfree(data);
+	scoped_guard(mutex, &kvm->arch.config_lock) {
+		data = rcu_dereference_protected(kvm->arch.mpidr_data,
+						 lockdep_is_held(&kvm->arch.config_lock));
+		if (data) {
+			rcu_assign_pointer(kvm->arch.mpidr_data, NULL);
+			synchronize_rcu();
+			kfree(data);
+		}
 	}
-
-	mutex_unlock(&kvm->arch.config_lock);
 }
 
 /**
@@ -738,9 +736,8 @@ static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
 
 void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
 {
-	spin_lock(&vcpu->arch.mp_state_lock);
+	guard(spinlock)(&vcpu->arch.mp_state_lock);
 	__kvm_arm_vcpu_power_off(vcpu);
-	spin_unlock(&vcpu->arch.mp_state_lock);
 }
 
 bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu)
@@ -773,7 +770,7 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 {
 	int ret = 0;
 
-	spin_lock(&vcpu->arch.mp_state_lock);
+	guard(spinlock)(&vcpu->arch.mp_state_lock);
 
 	switch (mp_state->mp_state) {
 	case KVM_MP_STATE_RUNNABLE:
@@ -789,8 +786,6 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 		ret = -EINVAL;
 	}
 
-	spin_unlock(&vcpu->arch.mp_state_lock);
-
 	return ret;
 }
 
@@ -828,11 +823,11 @@ static void kvm_init_mpidr_data(struct kvm *kvm)
 	u64 aff_set = 0, aff_clr = ~0UL;
 	struct kvm_vcpu *vcpu;
 
-	mutex_lock(&kvm->arch.config_lock);
+	guard(mutex)(&kvm->arch.config_lock);
 
 	if (rcu_access_pointer(kvm->arch.mpidr_data) ||
 	    atomic_read(&kvm->online_vcpus) == 1)
-		goto out;
+		return;
 
 	kvm_for_each_vcpu(c, vcpu, kvm) {
 		u64 aff = kvm_vcpu_get_mpidr_aff(vcpu);
@@ -857,7 +852,7 @@ static void kvm_init_mpidr_data(struct kvm *kvm)
 				    GFP_KERNEL_ACCOUNT);
 
 	if (!data)
-		goto out;
+		return;
 
 	data->mpidr_mask = mask;
 
@@ -869,8 +864,6 @@ static void kvm_init_mpidr_data(struct kvm *kvm)
 	}
 
 	rcu_assign_pointer(kvm->arch.mpidr_data, data);
-out:
-	mutex_unlock(&kvm->arch.config_lock);
 }
 
 /*
@@ -944,9 +937,8 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
-	mutex_lock(&kvm->arch.config_lock);
+	guard(mutex)(&kvm->arch.config_lock);
 	set_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags);
-	mutex_unlock(&kvm->arch.config_lock);
 
 	return ret;
 }
@@ -1585,29 +1577,26 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 {
 	unsigned long features = init->features[0];
 	struct kvm *kvm = vcpu->kvm;
-	int ret = -EINVAL;
+	int ret;
 
-	mutex_lock(&kvm->arch.config_lock);
+	guard(mutex)(&kvm->arch.config_lock);
 
 	if (test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags) &&
 	    kvm_vcpu_init_changed(vcpu, init))
-		goto out_unlock;
+		return -EINVAL;
 
 	bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
 
 	ret = kvm_setup_vcpu(vcpu);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	/* Now we know what it is, we can reset it. */
 	kvm_reset_vcpu(vcpu);
 
 	set_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags);
 	vcpu_set_flag(vcpu, VCPU_INITIALIZED);
-	ret = 0;
-out_unlock:
-	mutex_unlock(&kvm->arch.config_lock);
-	return ret;
+	return 0;
 }
 
 static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
@@ -1674,15 +1663,13 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	/*
 	 * Handle the "start in power-off" case.
 	 */
-	spin_lock(&vcpu->arch.mp_state_lock);
+	guard(spinlock)(&vcpu->arch.mp_state_lock);
 
 	if (power_off)
 		__kvm_arm_vcpu_power_off(vcpu);
 	else
 		WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_RUNNABLE);
 
-	spin_unlock(&vcpu->arch.mp_state_lock);
-
 	return 0;
 }
 

-- 
2.53.0.851.ga537e3e6e9-goog


