Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF53C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0Fit0ozccWqcIUOha2+PzcipOyCFUk6rmWi2DZINrs=; b=NNfbgfVVtXeRBVhDAmQUIoTq1P
	Ij53FE72xW6oXTvLyT92N/3tN0CcGoTnQKudLRCk18NIYVNoP2HyWULmc9SG1Z2jbm518Zywfa9rO
	Za74Boc7Dy/KQPAAiweIgZxjM405OSoJ7MdbZ4Ohv420tPAgreV5qbhIAjDtGakvRtLP/2rnZs8ml
	LfjJispB19hSV9ODvWeSWj4FG8DnMAl/YpZ3+uMO13Q4tdDg8eL7DDzOKbta2Wh2r3CN/Q8pbrzWW
	IkwIhQIKdAuFfrCVz/SxfTbzXBmYidIOg/pXFSHr8lko1EQcazQ0OjDi54zHkYMw8pYmHPP58s/v2
	/4vaFYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQN-0000000ERNe-3pDc;
	Sat, 22 Aug 2026 09:54:03 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQJ-0000000ERM1-3UMt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 09:54:01 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso3366814a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787392438; x=1787997238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0Fit0ozccWqcIUOha2+PzcipOyCFUk6rmWi2DZINrs=;
        b=esnBcneXW4bSav52j0g5I6Vu7bA6ZDgRFnfXA/zgqV03avEY3v9sPhw6atolrtQ9Ev
         8HbCGuzbFDpZm4QurQyDZG83oNA5kINnMYfQe+LVdGNNkTnpRqormda8sqEygF2sXEd+
         pMRt/k/8S9qA7fx+CoWUl7vtDcIoUKjWKlCiOog0On0NpdLdZKHZYCMSAHtUt5S7jK2I
         +rTojHZzFevI1LYaNhwHtYjbyg99CgfUEsr2+jpnpWY9LoWBnBVwhWBJgaz3rmU/mI36
         c4eUQeNX7alGnAd9i78Cj1dSO7MfHcKn4L5jOIyHTB3v3LruxxRF1sNjWiyzpBKifb/A
         gQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787392438; x=1787997238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0Fit0ozccWqcIUOha2+PzcipOyCFUk6rmWi2DZINrs=;
        b=outgEVbBwfrdwb9xRMTpI15yIoMsIV0Vj3oSrkb4wmIAUzEh5o8NNBLeijTLJJRZHS
         rDSnAkNdHy1E1r+gKWUxb3gtN8raCXpJjSpFTuPWJimSNR05FNnme0oMk1fllv4Li5zd
         0RBhpt19sqjT/dO57oJfj2ArNaI7cYARzp8ibdbTn69Sg3QaVGgIbQfnG6vAQ0cJsmDv
         bBQg7MdaUR0kLXWH7oSP99uIuQP1BK4NAJWeNtc/ht2VrsFngkupgOJhciH6DdwcWVME
         3KnnYoeDk+WFO9Pig5WeC8ce+rYndzN7yZc+0PLzXUJ3FHAWnKWMsFOgzdQojC/kqyL1
         peyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQ726UZOhhajt2E0joHNC3i4lPOe9BmkPD/2Y5ArRmq3fukwA4j7Iez2Jd8Sl+P9pyJJKciPmsEAdy9xRrvtMA@lists.infradead.org
X-Gm-Message-State: AFuF++klsebSfe1sSOjzbl34z5YzfKTTI1BRfCVUItz4s+yDUswvLhOS
	00eO6I4xx5xna08hZaAFHDD6i5IllBsQ4j3azpOfP1NV1eI818S1HRfB
X-Gm-Gg: AR+sD11IWbkGz0FMglBELYXIeT5xfk2mYBo1i5Zw5FcbzwKuOt3/L6EKM2CRoIdRV5z
	Vixu87AK3PwGBLSEAIyF4qxvjjGCCsuMto9HMTmqVxDJuchVBSZE3mj/yA4bn4U+Kgo0MUOlqeM
	FpCU7FTrVf56EJ+p/ojE7WpOUj8uTg2HJ2+eRwsakPbCWnhpST+7Iz6tZXHmzIEhivUSIOgl+JN
	VRi2eIoCIOLKe4bL5hjXjwJ58ZYjU/FGLmV6SNf55n5nj1EXUdDnVSfoRk5zngcn0nd/Me1gxyl
	ZobMBVsVenT2g1KOY0hXbM1W+uiyeBunnD/RMW3G5VO0LtXAuhHCcw1z95rJIi9JdX4nnIyOpgx
	601KQ5se2Pplo94HJvpcYNpJNBp3gyRwcSKZwHBgn17rLyZd4RZQowo41gtsr7cZ4qV8Bp59bd+
	sHhZ9k6cf4yjx8216CkPWChu0u0YggWAssSSS4B6Q+hfsX14vW9I8HesTf7vCD7fb72Y5aRN0aq
	MzQnyWHgmIdCCs5eXHYkj/Q5KN6eBuGOJ+kzH0ygFN6lBiVDfiw7qAly+JHw2nfuncuQMwvGEeb
	XHSVNWleHYQk3Ye/6W6HuAyoaNUqPTMdxSx1kEPd6UbOf0aK/x9zO5VGW/1JM5AY/p1jaQ==
X-Received: by 2002:a05:6402:2186:b0:6a1:2400:baea with SMTP id 4fb4d7f45d1cf-6a42f18a70cmr11760162a12.10.1787392437812;
        Sat, 22 Aug 2026 02:53:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c327asm11151586a12.8.2026.08.22.02.53.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:53:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 2/5] KVM: arm64: vgic-v3: Reset redistributors after failed region setup
Date: Sat, 22 Aug 2026 11:53:43 +0200
Message-Id: <20260822095346.53882-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822095346.53882-1-kmehltretter@gmail.com>
References: <20260822095346.53882-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_025359_913151_02D96883 
X-CRM114-Status: GOOD (  17.24  )
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

A REDIST_REGION write can fail after redistributor iodevs have been
registered. The existing rollback unregisters only vCPUs processed before
the failure, leaving their cached assignments and free_index values intact.
A retry then skips the unregistered iodevs.

Userspace has no guarantee that redistributor assignments survive a failed
region update. On failure, unregister every redistributor iodev and clear
every cached vCPU assignment. Reset all region free_index values and free
the newly inserted region. The next successful region update rebuilds all
possible assignments in region-index order.

While a vCPU is being created, its redistributor iodev may be registered
before the vCPU is visible to kvm_for_each_vcpu(). Reject REDIST and
REDIST_REGION writes while creation is in flight, so rollback can reset every
assignment.

The registration failure for the current vCPU is already undone by
vgic_register_redist_iodev().

Fixes: c011f4ea106b ("KVM: arm/arm64: Check vcpu redist base before registering an iodev")
Suggested-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 20 ++++++++++
 arch/arm64/kvm/vgic/vgic-mmio-v3.c    | 53 +++++++++++++++++++--------
 2 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index 90be99443df3..48c3b2a48c20 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -97,6 +97,9 @@ static int kvm_vgic_addr(struct kvm *kvm, struct kvm_device_attr *attr, bool wri
 	phys_addr_t *addr_ptr, alignment, size;
 	u64 undef_value = VGIC_ADDR_UNDEF;
 	u64 addr;
+	bool redist_write = write &&
+		(attr->attr == KVM_VGIC_V3_ADDR_TYPE_REDIST ||
+		 attr->attr == KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION);
 	int r;
 
 	/* Reading a redistributor region addr implies getting the index */
@@ -104,6 +107,19 @@ static int kvm_vgic_addr(struct kvm *kvm, struct kvm_device_attr *attr, bool wri
 		if (get_user(addr, uaddr))
 			return -EFAULT;
 
+	/*
+	 * A vCPU can have an RD assignment before it is visible to
+	 * kvm_for_each_vcpu(). Reject redistributor updates while vCPU creation
+	 * is in progress, so rollback can reset every assignment.
+	 */
+	if (redist_write) {
+		mutex_lock(&kvm->lock);
+		if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus)) {
+			r = -EBUSY;
+			goto out_unlock_kvm;
+		}
+	}
+
 	/*
 	 * Since we can't hold config_lock while registering the redistributor
 	 * iodevs, take the slots_lock immediately.
@@ -201,6 +217,10 @@ static int kvm_vgic_addr(struct kvm *kvm, struct kvm_device_attr *attr, bool wri
 out:
 	mutex_unlock(&kvm->slots_lock);
 
+out_unlock_kvm:
+	if (redist_write)
+		mutex_unlock(&kvm->lock);
+
 	if (!r && !write)
 		r =  put_user(addr, uaddr);
 
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 22897ce64dbf..6c009deb11d4 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -855,6 +855,40 @@ void vgic_unregister_redist_iodev(struct kvm_vcpu *vcpu)
 	kvm_io_bus_unregister_dev(vcpu->kvm, KVM_MMIO_BUS, &rd_dev->dev);
 }
 
+static void vgic_reset_redist_iodev(struct kvm_vcpu *vcpu)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+
+	lockdep_assert_held(&vcpu->kvm->arch.config_lock);
+
+	vgic_cpu->rdreg = NULL;
+	vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+}
+
+static void vgic_v3_rollback_redist_region(struct kvm *kvm, u32 index)
+{
+	struct vgic_redist_region *rdreg, *iter;
+	struct kvm_vcpu *vcpu;
+	unsigned long c;
+
+	lockdep_assert_held(&kvm->slots_lock);
+
+	rdreg = vgic_v3_rdist_region_from_index(kvm, index);
+
+	kvm_for_each_vcpu(c, vcpu, kvm)
+		vgic_unregister_redist_iodev(vcpu);
+
+	guard(mutex)(&kvm->arch.config_lock);
+
+	kvm_for_each_vcpu(c, vcpu, kvm)
+		vgic_reset_redist_iodev(vcpu);
+
+	list_for_each_entry(iter, &kvm->arch.vgic.rd_regions, list)
+		iter->free_index = 0;
+
+	vgic_v3_free_redist_region(kvm, rdreg);
+}
+
 static int vgic_register_all_redist_iodevs(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
@@ -869,16 +903,6 @@ static int vgic_register_all_redist_iodevs(struct kvm *kvm)
 			break;
 	}
 
-	if (ret) {
-		/* The current c failed, so iterate over the previous ones. */
-		int i;
-
-		for (i = 0; i < c; i++) {
-			vcpu = kvm_get_vcpu(kvm, i);
-			vgic_unregister_redist_iodev(vcpu);
-		}
-	}
-
 	return ret;
 }
 
@@ -986,6 +1010,8 @@ int vgic_v3_set_redist_base(struct kvm *kvm, u32 index, u64 addr, u32 count)
 {
 	int ret;
 
+	lockdep_assert_held(&kvm->lock);
+
 	mutex_lock(&kvm->arch.config_lock);
 	ret = vgic_v3_alloc_redist_region(kvm, index, addr, count);
 	mutex_unlock(&kvm->arch.config_lock);
@@ -998,12 +1024,7 @@ int vgic_v3_set_redist_base(struct kvm *kvm, u32 index, u64 addr, u32 count)
 	 */
 	ret = vgic_register_all_redist_iodevs(kvm);
 	if (ret) {
-		struct vgic_redist_region *rdreg;
-
-		mutex_lock(&kvm->arch.config_lock);
-		rdreg = vgic_v3_rdist_region_from_index(kvm, index);
-		vgic_v3_free_redist_region(kvm, rdreg);
-		mutex_unlock(&kvm->arch.config_lock);
+		vgic_v3_rollback_redist_region(kvm, index);
 		return ret;
 	}
 
-- 
2.39.5 (Apple Git-154)


