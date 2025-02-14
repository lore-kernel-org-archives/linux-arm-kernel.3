Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF67FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYCZEVwMXOsZCRPZrz0ygCxLWWB5K6kJuwIf0LtgrsU=; b=VxRkRnoNLifc1Exjwo9kkkCKF+
	oLJbxmJw74bzM7ObU9DbtRNa3RJCmCKREA7Mi8RBuQLxzWTOdS/KB8PHQuUfuzhZXNalyPkeekJYl
	72zMEIyq/WE0PXdc0ziEo4p+2sAxVSSvMBvznbFYke5AIMfSj6I0OR92OOU8AQvaBTNMetaTzlCC6
	XalmO0Om/+IEeWNnhEgI+dgGdP8VRK5NvckkUorIzLUVsy9x9xGomzN/Vvijmjm8Q9oCkXPxXqlME
	uR38c+9tiX4TbLVJESa9gb6GAxbNzxQ4DczCLRH7WK7g6WwZgv+7JFWvHlC+RWbf9dYTmXKvaoQ62
	51LUU2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixJH-0000000FFQS-2uJ4;
	Fri, 14 Feb 2025 15:08:55 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixDg-0000000FEq8-0V6L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:03:09 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so14783425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739545386; x=1740150186; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYCZEVwMXOsZCRPZrz0ygCxLWWB5K6kJuwIf0LtgrsU=;
        b=Yo3F3DjzbtMkOXirppKCOSQZA+jWie7cnmwxKegzPhhIIG02fLamFY+vRNOfJ6tch6
         y3h0v/iW+A2+bGh5o1yTlAd0HBWJLzh7fKvX8p/CeNiCbNNVMPD7EzHMTGHVcxt0r19S
         nNG8WfTnYwcRVYqVSVDwya7SCH2VF+fiT3TPDnCdW+SmmTXLqxu0Jx6noiMUY7hlJWvZ
         AEwTLay17NCxkiAjWS5znN5ROb2Mm6LOhOzEB1PKSxKf8fMRyAvqfJoMiBlgn0O6RvdC
         6n4O7O3FXMb+W0cxK08aF1/oPkCrLCSwi8avvV0LTaakcA5k3cPWTrpGkH0UWP8vbQKN
         8wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545386; x=1740150186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYCZEVwMXOsZCRPZrz0ygCxLWWB5K6kJuwIf0LtgrsU=;
        b=GwZmynWKqGD+ubPaAbUvk//SeX7XVYUp3Xu22lg+gsv1npZjwBuxN4ZFrvWVfrFXpu
         d0mJUET808tZnMhlTG3ghLQaOB6dbqrQ8dvPPQddZI3bY/W1+n3pZzPZWXFcCwn69Qqj
         M31FI51afibJS9aKw6onrByCdYqWQQIf4bFetLXSvkqpnitUH3WUvo0xcEdstYTOMV/9
         nF3CvOvnGsD7nCM8QOgIkw8ZjNKr/u9i/+vOaQMny5jC95Z4/aG92tX3fTwyolFGuLpb
         fAKd7RjDvds1YVB8f5NzL7BCghxEDdcrRdL88VHzoa+qQ7s2T0gJ8tHw9KghMTVFrCUT
         sMZw==
X-Forwarded-Encrypted: i=1; AJvYcCVZJqy5qe64Xx/SBlGMu4rXsul+a9EAAD7oHebyoF+vYpplYrzF1yDX1kF3H7NBZoCwPsU55uBluhQbRQ+je1EY@lists.infradead.org
X-Gm-Message-State: AOJu0YzpHHjT5g+3MMi/1wn5D1rtmTGy/gGaP8t4TW0RPqOl9XN2f+G6
	H7zaHyX7TY2VoHQe3XSD0F6GEEKlR/n3fndWMXJEKYhayoL7v5GGzDKEJSeBBFWtvWHlLpiPMg=
	=
X-Google-Smtp-Source: AGHT+IEgvClSjiRCqZsobCfBVb8m5U5tEqqh7iL7ZM50v8X3mOoLF2QNmTRy6mSwXPzUsO0zThlWwt7fqg==
X-Received: from wmkg21.prod.google.com ([2002:a7b:c4d5:0:b0:439:4c5f:a295])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6019:b0:439:608f:a37f
 with SMTP id 5b1f17b1804b1-439608fa43bmr108055715e9.5.1739545386440; Fri, 14
 Feb 2025 07:03:06 -0800 (PST)
Date: Fri, 14 Feb 2025 15:02:58 +0000
In-Reply-To: <20250214150258.464798-1-tabba@google.com>
Mime-Version: 1.0
References: <20250214150258.464798-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250214150258.464798-4-tabba@google.com>
Subject: [PATCH v1 3/3] KVM: arm64: Create each pKVM hyp vcpu after its
 corresponding host vcpu
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_070308_161132_4FABB1B3 
X-CRM114-Status: GOOD (  24.23  )
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

Instead of creating and initializing _all_ hyp vcpus in pKVM when
the first host vcpu runs for the first time, initialize _each_
hyp vcpu in conjunction with its corresponding host vcpu.

Some of the host vcpu state (e.g., system registers and traps
values) are not initialized until the first time the host vcpu is
run. Therefore, initializing a hyp vcpu before its corresponding
host vcpu has run for the first time might not view the complete
host state of these vcpus.

Additionally, this behavior is inline with non-protected modes.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h      |  2 +
 arch/arm64/include/asm/kvm_pkvm.h      |  1 +
 arch/arm64/kvm/arm.c                   |  4 ++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  6 ---
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 54 +++++++++++++++-----------
 arch/arm64/kvm/pkvm.c                  | 28 ++++++-------
 6 files changed, 53 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..d35ce3c860fc 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -881,6 +881,8 @@ struct kvm_vcpu_arch {
 #define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(0))
 /* SVE config completed */
 #define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
+/* pKVM VCPU setup completed */
+#define VCPU_PKVM_FINALIZED	__vcpu_single_flag(cflags, BIT(2))
 
 /* Exception pending */
 #define PENDING_EXCEPTION	__vcpu_single_flag(iflags, BIT(0))
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index eb65f12e81d9..abd693ce5b93 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -19,6 +19,7 @@
 int pkvm_init_host_vm(struct kvm *kvm);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
+int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
 
 /*
  * This functions as an allow-list of protected VM capabilities.
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 071a7d75be68..e4661c2f0423 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -833,6 +833,10 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 		ret = pkvm_create_hyp_vm(kvm);
 		if (ret)
 			return ret;
+
+		ret = pkvm_create_hyp_vcpu(vcpu);
+		if (ret)
+			return ret;
 	}
 
 	mutex_lock(&kvm->arch.config_lock);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index e42bf68c8848..ce31d3b73603 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -43,12 +43,6 @@ struct pkvm_hyp_vm {
 	struct hyp_pool pool;
 	hyp_spinlock_t lock;
 
-	/*
-	 * The number of vcpus initialized and ready to run.
-	 * Modifying this is protected by 'vm_table_lock'.
-	 */
-	unsigned int nr_vcpus;
-
 	/* Array of the hyp vCPU structures for this VM. */
 	struct pkvm_hyp_vcpu *vcpus[];
 };
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 668ebec27f1b..20abd46e03b8 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -285,10 +285,12 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 
 	hyp_spin_lock(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm || hyp_vm->nr_vcpus <= vcpu_idx)
+	if (!hyp_vm || hyp_vm->kvm.created_vcpus <= vcpu_idx)
 		goto unlock;
 
 	hyp_vcpu = hyp_vm->vcpus[vcpu_idx];
+	if (!hyp_vcpu)
+		goto unlock;
 
 	/* Ensure vcpu isn't loaded on more than one cpu simultaneously. */
 	if (unlikely(hyp_vcpu->loaded_hyp_vcpu)) {
@@ -407,8 +409,14 @@ static void unpin_host_vcpus(struct pkvm_hyp_vcpu *hyp_vcpus[],
 {
 	int i;
 
-	for (i = 0; i < nr_vcpus; i++)
-		unpin_host_vcpu(hyp_vcpus[i]->host_vcpu);
+	for (i = 0; i < nr_vcpus; i++) {
+		struct pkvm_hyp_vcpu *hyp_vcpu = hyp_vcpus[i];
+
+		if (!hyp_vcpu)
+			continue;
+
+		unpin_host_vcpu(hyp_vcpu->host_vcpu);
+	}
 }
 
 static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
@@ -432,24 +440,18 @@ static void pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *
 
 static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 			      struct pkvm_hyp_vm *hyp_vm,
-			      struct kvm_vcpu *host_vcpu,
-			      unsigned int vcpu_idx)
+			      struct kvm_vcpu *host_vcpu)
 {
 	int ret = 0;
 
 	if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
 		return -EBUSY;
 
-	if (host_vcpu->vcpu_idx != vcpu_idx) {
-		ret = -EINVAL;
-		goto done;
-	}
-
 	hyp_vcpu->host_vcpu = host_vcpu;
 
 	hyp_vcpu->vcpu.kvm = &hyp_vm->kvm;
 	hyp_vcpu->vcpu.vcpu_id = READ_ONCE(host_vcpu->vcpu_id);
-	hyp_vcpu->vcpu.vcpu_idx = vcpu_idx;
+	hyp_vcpu->vcpu.vcpu_idx = READ_ONCE(host_vcpu->vcpu_idx);
 
 	hyp_vcpu->vcpu.arch.hw_mmu = &hyp_vm->kvm.arch.mmu;
 	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
@@ -687,27 +689,28 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
 		goto unlock;
 	}
 
-	idx = hyp_vm->nr_vcpus;
+	ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu);
+	if (ret)
+		goto unlock;
+
+	idx = hyp_vcpu->vcpu.vcpu_idx;
 	if (idx >= hyp_vm->kvm.created_vcpus) {
 		ret = -EINVAL;
 		goto unlock;
 	}
 
-	ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu, idx);
-	if (ret)
+	if (hyp_vm->vcpus[idx]) {
+		ret = -EINVAL;
 		goto unlock;
+	}
 
 	hyp_vm->vcpus[idx] = hyp_vcpu;
-	hyp_vm->nr_vcpus++;
 unlock:
 	hyp_spin_unlock(&vm_table_lock);
 
-	if (ret) {
+	if (ret)
 		unmap_donated_memory(hyp_vcpu, sizeof(*hyp_vcpu));
-		return ret;
-	}
-
-	return 0;
+	return ret;
 }
 
 static void
@@ -753,12 +756,17 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 	/* Reclaim guest pages (including page-table pages) */
 	mc = &host_kvm->arch.pkvm.teardown_mc;
 	reclaim_guest_pages(hyp_vm, mc);
-	unpin_host_vcpus(hyp_vm->vcpus, hyp_vm->nr_vcpus);
+	unpin_host_vcpus(hyp_vm->vcpus, hyp_vm->kvm.created_vcpus);
 
 	/* Push the metadata pages to the teardown memcache */
-	for (idx = 0; idx < hyp_vm->nr_vcpus; ++idx) {
+	for (idx = 0; idx < hyp_vm->kvm.created_vcpus; ++idx) {
 		struct pkvm_hyp_vcpu *hyp_vcpu = hyp_vm->vcpus[idx];
-		struct kvm_hyp_memcache *vcpu_mc = &hyp_vcpu->vcpu.arch.pkvm_memcache;
+		struct kvm_hyp_memcache *vcpu_mc;
+
+		if (!hyp_vcpu)
+			continue;
+
+		vcpu_mc = &hyp_vcpu->vcpu.arch.pkvm_memcache;
 
 		while (vcpu_mc->nr_pages) {
 			void *addr = pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 06665cf221bf..f2a09dc50676 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -125,7 +125,9 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 		return -ENOMEM;
 
 	ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, vcpu, hyp_vcpu);
-	if (ret)
+	if (!ret)
+		vcpu_set_flag(vcpu, VCPU_PKVM_FINALIZED);
+	else
 		free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
 
 	return ret;
@@ -144,9 +146,7 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 {
 	size_t pgd_sz, hyp_vm_sz;
-	struct kvm_vcpu *host_vcpu;
 	void *pgd, *hyp_vm;
-	unsigned long idx;
 	int ret;
 
 	if (host_kvm->created_vcpus < 1)
@@ -180,17 +180,7 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 
 	WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);
 
-	kvm_for_each_vcpu(idx, host_vcpu, host_kvm) {
-		ret = __pkvm_create_hyp_vcpu(host_vcpu);
-		if (ret)
-			goto destroy_vm;
-	}
-
 	return 0;
-
-destroy_vm:
-	__pkvm_destroy_hyp_vm(host_kvm);
-	return ret;
 free_vm:
 	free_pages_exact(hyp_vm, hyp_vm_sz);
 free_pgd:
@@ -210,6 +200,18 @@ int pkvm_create_hyp_vm(struct kvm *host_kvm)
 	return ret;
 }
 
+int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
+{
+	int ret = 0;
+
+	mutex_lock(&vcpu->kvm->arch.config_lock);
+	if (!vcpu_get_flag(vcpu, VCPU_PKVM_FINALIZED))
+		ret = __pkvm_create_hyp_vcpu(vcpu);
+	mutex_unlock(&vcpu->kvm->arch.config_lock);
+
+	return ret;
+}
+
 void pkvm_destroy_hyp_vm(struct kvm *host_kvm)
 {
 	mutex_lock(&host_kvm->arch.config_lock);
-- 
2.48.1.601.g30ceb7b040-goog


