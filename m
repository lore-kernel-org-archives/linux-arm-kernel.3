Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43BAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 02:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7d2yvMM2I9d/oyc1V0faCkOl8VeyuNqArkVlFzxUCDE=; b=RKkLxrtqz9yWa+SK+lwAyfjkLN
	OnvpxNJD2+wdSnp7a4+hwcqq3zkei1ONZjJpGxh1ndVSUt8hoZrWH3SYs5fnev4gBheGU9JV4vQBZ
	ynrxu143ZxfPqqlDPB+2I8KDKltgCjr4XfYVhXTtPFHlfoz2v8jM+1SmbMt5luHuKRer2I6Ek/U5P
	vyLHBR80SNMkghcBT7Xu63H+BzinHNEmtviyJBsN6jtyEJ/Hq/J4giCT9NW4EMr4CKA4YvZKvXHYz
	PvcdkrIu58/TTvzLM6wsmT7qxF+A6JnoT1GoTmVpwPgLM49L68Z1O/R54EIME1itPGNMvQxrDC5jE
	PSfg7Yag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgCi-00000002IR6-2DWj;
	Tue, 11 Feb 2025 02:40:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrn-00000001wKm-2Rng
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 00:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7d2yvMM2I9d/oyc1V0faCkOl8VeyuNqArkVlFzxUCDE=; b=htWxsMSxOZkUYkKiim7uZJ+aji
	ySL47pS8m3x/C+Sb7Q2pgoXjNKbKT+vCpUjMLLtTBY+fK7lzsd6X597z2MWyYXYi3OpMXkAK9zgPg
	nXDLHh42vnRxWNUbK7MR93WnaMm6BSvlcafQveB7G+EQwrU2ofFMzc10OYGwucVLbGc+8s017k/2N
	JSa8nFqwvyB99Cnh2n3cJJKukh/t1JBBUsCjSsUtXv5BgjGRlRBxmuFdmoJ4LVVj+B0457dzhN0Ek
	pp9wdxIZzH8W7f4p0mbrfd31L7On6V/J8M909QySVW3uOs6XYezrqEJ3rqSL6Rg8cYq4/VJQEoo0S
	zlpZq5rA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrj-00000000O1U-2Dz0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 00:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739232662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7d2yvMM2I9d/oyc1V0faCkOl8VeyuNqArkVlFzxUCDE=;
	b=WCDI2WUIaTPS58PQ8m4SvGpxPMhcBJAnz0kFe0hRnLkrFlBmVCRkt0dbTPVLhXRT2WfSAA
	/nrRp//m6Z+AkPLQUPyCFv73n/IwFOlzlxjZlP2H+8MTZA31bawTduHhR0Rv8ZoGK5rSsb
	L6u0sJCORG6lIe6CchW7Ez6gf2bU4qU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739232662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7d2yvMM2I9d/oyc1V0faCkOl8VeyuNqArkVlFzxUCDE=;
	b=WCDI2WUIaTPS58PQ8m4SvGpxPMhcBJAnz0kFe0hRnLkrFlBmVCRkt0dbTPVLhXRT2WfSAA
	/nrRp//m6Z+AkPLQUPyCFv73n/IwFOlzlxjZlP2H+8MTZA31bawTduHhR0Rv8ZoGK5rSsb
	L6u0sJCORG6lIe6CchW7Ez6gf2bU4qU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-9uH7qvCwOL6Q2OM-ph_X4g-1; Mon,
 10 Feb 2025 19:09:42 -0500
X-MC-Unique: 9uH7qvCwOL6Q2OM-ph_X4g-1
X-Mimecast-MFC-AGG-ID: 9uH7qvCwOL6Q2OM-ph_X4g
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3B081800874;
	Tue, 11 Feb 2025 00:09:38 +0000 (UTC)
Received: from starship.lan (unknown [10.22.65.174])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C1BF519560B0;
	Tue, 11 Feb 2025 00:09:32 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Jing Zhang <jingzhangos@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvm-riscv@lists.infradead.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-riscv@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvmarm@lists.linux.dev,
	Alexander Potapenko <glider@google.com>,
	x86@kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Atish Patra <atishp@atishpatra.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 2/3] KVM: arm64: switch to using kvm_lock/unlock_all_vcpus
Date: Mon, 10 Feb 2025 19:09:16 -0500
Message-Id: <20250211000917.166856-3-mlevitsk@redhat.com>
In-Reply-To: <20250211000917.166856-1-mlevitsk@redhat.com>
References: <20250211000917.166856-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_001104_449042_85C7CF97 
X-CRM114-Status: GOOD (  19.04  )
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

Switch to kvm_lock/unlock_all_vcpus instead of arm's own
version.

This fixes lockdep warning about reaching maximum lock depth:

[  328.171264] BUG: MAX_LOCK_DEPTH too low!
[  328.175227] turning off the locking correctness validator.
[  328.180726] Please attach the output of /proc/lock_stat to the bug report
[  328.187531] depth: 48  max: 48!
[  328.190678] 48 locks held by qemu-kvm/11664:
[  328.194957]  #0: ffff800086de5ba0 (&kvm->lock){+.+.}-{3:3}, at: kvm_ioctl_create_device+0x174/0x5b0
[  328.204048]  #1: ffff0800e78800b8 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.212521]  #2: ffff07ffeee51e98 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.220991]  #3: ffff0800dc7d80b8 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.229463]  #4: ffff07ffe0c980b8 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.237934]  #5: ffff0800a3883c78 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.246405]  #6: ffff07fffbe480b8 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0

No functional change intended.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h     |  3 ---
 arch/arm64/kvm/arch_timer.c           |  8 +++----
 arch/arm64/kvm/arm.c                  | 32 ---------------------------
 arch/arm64/kvm/vgic/vgic-init.c       | 11 +++++----
 arch/arm64/kvm/vgic/vgic-its.c        | 18 ++++++++-------
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 21 ++++++++++--------
 6 files changed, 33 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..bba97ea700ca 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1234,9 +1234,6 @@ int __init populate_sysreg_config(const struct sys_reg_desc *sr,
 				  unsigned int idx);
 int __init populate_nv_trap_config(void);
 
-bool lock_all_vcpus(struct kvm *kvm);
-void unlock_all_vcpus(struct kvm *kvm);
-
 void kvm_calculate_traps(struct kvm_vcpu *vcpu);
 
 /* MMIO helpers */
diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 231c0cd9c7b4..3af1da807f9c 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1769,7 +1769,9 @@ int kvm_vm_ioctl_set_counter_offset(struct kvm *kvm,
 
 	mutex_lock(&kvm->lock);
 
-	if (lock_all_vcpus(kvm)) {
+	ret = kvm_lock_all_vcpus(kvm);
+
+	if (!ret) {
 		set_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &kvm->arch.flags);
 
 		/*
@@ -1781,9 +1783,7 @@ int kvm_vm_ioctl_set_counter_offset(struct kvm *kvm,
 		kvm->arch.timer_data.voffset = offset->counter_offset;
 		kvm->arch.timer_data.poffset = offset->counter_offset;
 
-		unlock_all_vcpus(kvm);
-	} else {
-		ret = -EBUSY;
+		kvm_unlock_all_vcpus(kvm);
 	}
 
 	mutex_unlock(&kvm->lock);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 071a7d75be68..f58849c5b4f0 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1895,38 +1895,6 @@ static void unlock_vcpus(struct kvm *kvm, int vcpu_lock_idx)
 	}
 }
 
-void unlock_all_vcpus(struct kvm *kvm)
-{
-	lockdep_assert_held(&kvm->lock);
-
-	unlock_vcpus(kvm, atomic_read(&kvm->online_vcpus) - 1);
-}
-
-/* Returns true if all vcpus were locked, false otherwise */
-bool lock_all_vcpus(struct kvm *kvm)
-{
-	struct kvm_vcpu *tmp_vcpu;
-	unsigned long c;
-
-	lockdep_assert_held(&kvm->lock);
-
-	/*
-	 * Any time a vcpu is in an ioctl (including running), the
-	 * core KVM code tries to grab the vcpu->mutex.
-	 *
-	 * By grabbing the vcpu->mutex of all VCPUs we ensure that no
-	 * other VCPUs can fiddle with the state while we access it.
-	 */
-	kvm_for_each_vcpu(c, tmp_vcpu, kvm) {
-		if (!mutex_trylock(&tmp_vcpu->mutex)) {
-			unlock_vcpus(kvm, c - 1);
-			return false;
-		}
-	}
-
-	return true;
-}
-
 static unsigned long nvhe_percpu_size(void)
 {
 	return (unsigned long)CHOOSE_NVHE_SYM(__per_cpu_end) -
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index bc7e22ab5d81..8fbce4db5c2e 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -85,8 +85,8 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 	/* Must be held to avoid race with vCPU creation */
 	lockdep_assert_held(&kvm->lock);
 
-	ret = -EBUSY;
-	if (!lock_all_vcpus(kvm))
+	ret = kvm_lock_all_vcpus(kvm);
+	if (ret)
 		return ret;
 
 	mutex_lock(&kvm->arch.config_lock);
@@ -97,9 +97,12 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 	}
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (vcpu_has_run_once(vcpu))
+		if (vcpu_has_run_once(vcpu)) {
+			ret = -EBUSY;
 			goto out_unlock;
+		}
 	}
+
 	ret = 0;
 
 	if (type == KVM_DEV_TYPE_ARM_VGIC_V2)
@@ -124,7 +127,7 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 
 out_unlock:
 	mutex_unlock(&kvm->arch.config_lock);
-	unlock_all_vcpus(kvm);
+	kvm_unlock_all_vcpus(kvm);
 	return ret;
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index fb96802799c6..02b02b4fff5d 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1977,7 +1977,7 @@ static int vgic_its_attr_regs_access(struct kvm_device *dev,
 	struct vgic_its *its;
 	gpa_t addr, offset;
 	unsigned int len;
-	int align, ret = 0;
+	int align, ret;
 
 	its = dev->private;
 	offset = attr->attr;
@@ -1999,9 +1999,10 @@ static int vgic_its_attr_regs_access(struct kvm_device *dev,
 
 	mutex_lock(&dev->kvm->lock);
 
-	if (!lock_all_vcpus(dev->kvm)) {
+	ret = kvm_lock_all_vcpus(sdev->kvm);
+	if (ret) {
 		mutex_unlock(&dev->kvm->lock);
-		return -EBUSY;
+		return ret;
 	}
 
 	mutex_lock(&dev->kvm->arch.config_lock);
@@ -2034,7 +2035,7 @@ static int vgic_its_attr_regs_access(struct kvm_device *dev,
 	}
 out:
 	mutex_unlock(&dev->kvm->arch.config_lock);
-	unlock_all_vcpus(dev->kvm);
+	kvm_unlock_all_vcpus(dev->kvm);
 	mutex_unlock(&dev->kvm->lock);
 	return ret;
 }
@@ -2697,16 +2698,17 @@ static int vgic_its_has_attr(struct kvm_device *dev,
 static int vgic_its_ctrl(struct kvm *kvm, struct vgic_its *its, u64 attr)
 {
 	const struct vgic_its_abi *abi = vgic_its_get_abi(its);
-	int ret = 0;
+	int ret;
 
 	if (attr == KVM_DEV_ARM_VGIC_CTRL_INIT) /* Nothing to do */
 		return 0;
 
 	mutex_lock(&kvm->lock);
 
-	if (!lock_all_vcpus(kvm)) {
+	ret = kvm_lock_all_vcpus(kvm);
+	if (ret) {
 		mutex_unlock(&kvm->lock);
-		return -EBUSY;
+		return ret;
 	}
 
 	mutex_lock(&kvm->arch.config_lock);
@@ -2726,7 +2728,7 @@ static int vgic_its_ctrl(struct kvm *kvm, struct vgic_its *its, u64 attr)
 
 	mutex_unlock(&its->its_lock);
 	mutex_unlock(&kvm->arch.config_lock);
-	unlock_all_vcpus(kvm);
+	kvm_unlock_all_vcpus(kvm);
 	mutex_unlock(&kvm->lock);
 	return ret;
 }
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index 5f4f57aaa23e..ee70a9d642ed 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -268,15 +268,16 @@ static int vgic_set_common_attr(struct kvm_device *dev,
 				return -ENXIO;
 			mutex_lock(&dev->kvm->lock);
 
-			if (!lock_all_vcpus(dev->kvm)) {
+			r = kvm_lock_all_vcpus(dev->kvm);
+			if (r) {
 				mutex_unlock(&dev->kvm->lock);
-				return -EBUSY;
+				return r;
 			}
 
 			mutex_lock(&dev->kvm->arch.config_lock);
 			r = vgic_v3_save_pending_tables(dev->kvm);
 			mutex_unlock(&dev->kvm->arch.config_lock);
-			unlock_all_vcpus(dev->kvm);
+			kvm_unlock_all_vcpus(dev->kvm);
 			mutex_unlock(&dev->kvm->lock);
 			return r;
 		}
@@ -384,9 +385,10 @@ static int vgic_v2_attr_regs_access(struct kvm_device *dev,
 
 	mutex_lock(&dev->kvm->lock);
 
-	if (!lock_all_vcpus(dev->kvm)) {
+	ret = kvm_lock_all_vcpus(dev->kvm);
+	if (ret) {
 		mutex_unlock(&dev->kvm->lock);
-		return -EBUSY;
+		return ret;
 	}
 
 	mutex_lock(&dev->kvm->arch.config_lock);
@@ -409,7 +411,7 @@ static int vgic_v2_attr_regs_access(struct kvm_device *dev,
 
 out:
 	mutex_unlock(&dev->kvm->arch.config_lock);
-	unlock_all_vcpus(dev->kvm);
+	kvm_unlock_all_vcpus(dev->kvm);
 	mutex_unlock(&dev->kvm->lock);
 
 	if (!ret && !is_write)
@@ -545,9 +547,10 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 
 	mutex_lock(&dev->kvm->lock);
 
-	if (!lock_all_vcpus(dev->kvm)) {
+	ret = kvm_lock_all_vcpus(dev->kvm);
+	if (ret) {
 		mutex_unlock(&dev->kvm->lock);
-		return -EBUSY;
+		return ret;
 	}
 
 	mutex_lock(&dev->kvm->arch.config_lock);
@@ -589,7 +592,7 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 
 out:
 	mutex_unlock(&dev->kvm->arch.config_lock);
-	unlock_all_vcpus(dev->kvm);
+	kvm_unlock_all_vcpus(dev->kvm);
 	mutex_unlock(&dev->kvm->lock);
 
 	if (!ret && uaccess && !is_write) {
-- 
2.26.3


