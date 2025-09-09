Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE202CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpuaZWpwHD1IZjAGpdSGgFXSAYCuUUsJNgHSlQWyn4Y=; b=yIbHsdlHIByAm5T4Kjihh2nd7Q
	lw2S5LJlXUGXmYDJueeF5apE6t3QoGg32nHcKCUy+lmZNuesO5HalqCS40PhTQOS377Cdgb5eHg1B
	7YTdCi3Gha8qs9g8WhvpOtsqHd4oMzMhosFU6Gu48uKXrNU3y4uTM9T8DlJE4G/rQZ/OQJbmWtHn3
	My3jOVvZK7Y1npfy1mU+GrWkb3y/8pcx46xaPqebfP853dZlHg8Te8k9llmWMC6oGaFPkmcY/PX7e
	qwtRqy1/igP/ZQrIf6MvLZL8Et08YAf5xJwNrZyvO4nP7ygggGMFwPgy/pM6myzgp7F+Cc/pq5BkO
	EUq8Nn4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuMz-00000005pr5-3re8;
	Tue, 09 Sep 2025 09:10:33 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsiY-000000058uK-3x0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:24:44 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3dacc10dd30so3821349f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402681; x=1758007481; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fpuaZWpwHD1IZjAGpdSGgFXSAYCuUUsJNgHSlQWyn4Y=;
        b=arSXZ7jATeU2fzVPlJQj0tlhz7JqmfPCokvCltGWlEvMfKgQYf0naE9i4JFM6AohnH
         1qS2d1lc/ZEbVGsjhQtOm6IhedKCfG6PhrmYvfN/bowAgREljHS/s7TPjJ5yxSq7VLcg
         Ui5PhLfwUURlE0b5r1cXVHk+3jEBeh1RDsl7yJfO0vizdeZD7zziV+0/EmOJOI74DDJY
         p0xcwEsTmdWbICgjwL5AhMw9b2/mPnOqDixcMp9ubySDkjAX+AoILpawGA0cv18X8YtG
         1uuwlBxuFU6Kmr1A7hDqiDs829+92gMtnoi5Za8en2CvB1edaGOBd3Ki+vEctyDxEdRe
         5Nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402681; x=1758007481;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpuaZWpwHD1IZjAGpdSGgFXSAYCuUUsJNgHSlQWyn4Y=;
        b=kewavHrGUhiCa5HxReJAhZHvIvhzVbS2OPKJ6z9geXsuNpVLItAcohyBPcmSwHuc+Q
         s7toYv3baqigLKjHykieTzy9LR87gCh1YxtZeVkG8Kt/49JhEl7SSqzOqkdhNrtxhtE3
         tWcrOxAshJQn9Q4Kwd/sD6dU1+5Hfyea+7+OPiWkh2EDuy8HL1xRbzD1V/m9dJvCKVNj
         hIaO6OvOsLhFKXR6vdd3PXJH0Dk0erZ3YzmQwTinT/dMiZdPMljqKkXnbB8mSxgLremK
         h3eleAp9WR9yZFkg6Vs6H4ga84Sl/pvANQOQNFo+be/uCeKCQUlR1TMXuFB2blPSigdr
         QYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8pvjSkQrmGUhUZF41fPTt1YVaQ3xVuUlLA3/tnpwcELKQJYD3htzGMjZK4EUe++etLYzcN8i0iaxkbgTrMh9e@lists.infradead.org
X-Gm-Message-State: AOJu0YxXl89OtanP3Pd7tiT1NonEmyL0BfTAg7kKkltbUUylyUnNuJuy
	9rwPwAYamduUc/0qJ9CAqroCOH4M6GeuqUxSzpUBzbszaLb90dXZxKzQ3fajuWEaaQ4kxZCVmP7
	kbg==
X-Google-Smtp-Source: AGHT+IFpr4GL3PRIkEBqOVne0CX2qomut3PLzgU4knSILRFgs6WxJvoBwuEb6uQ71mFuNqingc6ATaNeaQ==
X-Received: from wrtr3.prod.google.com ([2002:a5d:4e43:0:b0:3d4:dcf3:824d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2203:b0:3dc:3b91:6231
 with SMTP id ffacd0b85a97d-3e636d8f8demr8014805f8f.12.1757402681337; Tue, 09
 Sep 2025 00:24:41 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:24:31 +0100
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
Mime-Version: 1.0
References: <20250909072437.4110547-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072437.4110547-5-tabba@google.com>
Subject: [PATCH v4 4/9] KVM: arm64: Clarify comments to distinguish pKVM mode
 from protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002442_978927_0A8DDD33 
X-CRM114-Status: GOOD (  21.57  )
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

The hypervisor code for protected KVM contains comments that are
imprecise and at times flat-out wrong. They often refer to a "protected
VM" in contexts where the code or data structure applies to _any_ VM
managed by the hypervisor when pKVM is enabled.

For instance, the 'vm_table' holds handles for all VMs known to the
hypervisor, not exclusively for those that are configured as protected.
This inaccurate terminology can make the code scope harder to understand
for future (and current) developers.

Clarify the comments throughout the pKVM hypervisor code to make a clear
distinction between the pKVM feature itself (i.e., "protected mode") and
the VMs that are specifically configured to be protected. This involves
replacing ambiguous uses of "protected VM" with more accurate phrasing.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 25 +++++++++++--------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index ce31d3b73603..4540324b5657 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -29,7 +29,7 @@ struct pkvm_hyp_vcpu {
 };
 
 /*
- * Holds the relevant data for running a protected vm.
+ * Holds the relevant data for running a vm in protected mode.
  */
 struct pkvm_hyp_vm {
 	struct kvm kvm;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 6198c1d27b5b..abe173406c88 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -23,8 +23,8 @@ unsigned int kvm_arm_vmid_bits;
 unsigned int kvm_host_sve_max_vl;
 
 /*
- * The currently loaded hyp vCPU for each physical CPU. Used only when
- * protected KVM is enabled, but for both protected and non-protected VMs.
+ * The currently loaded hyp vCPU for each physical CPU. Used in protected mode
+ * for both protected and non-protected VMs.
  */
 static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
 
@@ -135,7 +135,7 @@ static int pkvm_check_pvm_cpu_features(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
 
-	/* Protected KVM does not support AArch32 guests. */
+	/* No AArch32 support for protected guests. */
 	if (kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL0, AARCH32) ||
 	    kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL1, AARCH32))
 		return -EINVAL;
@@ -210,8 +210,8 @@ static pkvm_handle_t idx_to_vm_handle(unsigned int idx)
 DEFINE_HYP_SPINLOCK(vm_table_lock);
 
 /*
- * The table of VM entries for protected VMs in hyp.
- * Allocated at hyp initialization and setup.
+ * A table that tracks all VMs in protected mode.
+ * Allocated during hyp initialization and setup.
  */
 static struct pkvm_hyp_vm **vm_table;
 
@@ -495,7 +495,7 @@ static int find_free_vm_table_entry(struct kvm *host_kvm)
 /*
  * Allocate a VM table entry and insert a pointer to the new vm.
  *
- * Return a unique handle to the protected VM on success,
+ * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
 static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
@@ -594,10 +594,8 @@ static void unmap_donated_memory_noclear(void *va, size_t size)
 }
 
 /*
- * Initialize the hypervisor copy of the protected VM state using the
- * memory donated by the host.
- *
- * Unmaps the donated memory from the host at stage 2.
+ * Initialize the hypervisor copy of the VM state using host-donated memory.
+ * Unmap the donated memory from the host at stage 2.
  *
  * host_kvm: A pointer to the host's struct kvm.
  * vm_hva: The host va of the area being donated for the VM state.
@@ -606,7 +604,7 @@ static void unmap_donated_memory_noclear(void *va, size_t size)
  *	    the VM. Must be page aligned. Its size is implied by the VM's
  *	    VTCR.
  *
- * Return a unique handle to the protected VM on success,
+ * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
 int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
@@ -668,10 +666,9 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 }
 
 /*
- * Initialize the hypervisor copy of the protected vCPU state using the
- * memory donated by the host.
+ * Initialize the hypervisor copy of the vCPU state using host-donated memory.
  *
- * handle: The handle for the protected vm.
+ * handle: The hypervisor handle for the vm.
  * host_vcpu: A pointer to the corresponding host vcpu.
  * vcpu_hva: The host va of the area being donated for the vcpu state.
  *	     Must be page aligned. The size of the area must be equal to
-- 
2.51.0.384.g4c02a37b29-goog


