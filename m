Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBD5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJ7+KQbuHqWRSfbyGJAvgvQY/mr7Mv4w5E1Ef9PUYYI=; b=wH0Zft7uXGv6+8HBYpcux+k/TS
	aGVBQfB8tSlFWFt2EOQ00tuljHnBwsS08nValKydqlF1vCNsZu36VZvOyEB9vZlIOKzPBSE7Xq8/Y
	x5OgzpZ2j6Vb3j9lbCmMdcp0S6+BRcw+/d4xE0yYQs5q0TRDThk40tupl0TlgE37vH+JJztsxq0ir
	q+xZc4HFOTKPC11RG1toxm8MwaO8JQUo+bsmzBdYHQF7YP5Tt8JSGvY+qeoqnyjaDThhWNKgPFffx
	88j95MYYtwEGBprvmTWmO9YQs6IoMS6al6xeCN3Dn0b8PcPzUOh+EeNGjrSH/yEnrUvKuedyrXN39
	8AYzXaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPZo-00000005Yzi-1PZt;
	Wed, 26 Feb 2025 22:08:24 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPNN-00000005X9K-0eQu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:55:34 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-38f628ff78eso148992f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740606931; x=1741211731; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tJ7+KQbuHqWRSfbyGJAvgvQY/mr7Mv4w5E1Ef9PUYYI=;
        b=LAJzFPaYuR2VyNEyDucTEZ+KvxqowVQAdLe8V6gtjNnt01023LcU5tRtsz1F5BoUv+
         vKxXki53dsk4A1mP75VdolGCVgpasg+xX7GKy7m06Mq9gX2B/0bw0Zv9w/DzF/OAlvph
         4f0A4yBJRXRoysYbxdAmADq7aAzpJnXVPPCmm8cPRa0wBKlEuTANFv0F0vkxSpGi7EUL
         S20obluhKMVajxoGwh9M5FxfDDbzKINBZKilIi8GXFIzyd+nP3kCIE6HmAPX5u8w0nNg
         5rA/lPDRBzjCd4Ch21Ff0WN+nMkd8oHvHBMqW0W08p5vf8Bs3fUSzxdXLVs+8DVeCMHL
         IxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606931; x=1741211731;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJ7+KQbuHqWRSfbyGJAvgvQY/mr7Mv4w5E1Ef9PUYYI=;
        b=WIdnqUxbkeU+dlI8EqTdLSOy1umtbm+AupMh/TYH5OdJ1oGhLufEBH5p/TeVTLZ7B0
         ehVVVVQM51n/lAPGwPUEZz9zq0GhjAusQyV8sn4ViQeIbknuTP2t99WVnwU+4D8WmHFi
         eizO/ZgfT5Yst+2ZkRH9qM7pDFAwTra/qW4dsjWgw2CViktkptp+o4QX/+m/TqvQ42SL
         z60FXyTFFVkPsLrAcmoguqK6uAxZKZpSwr6y7NAlLvBhcGoRWefe20KBwIHwHmBKUzNQ
         lWz9GfK7gZXzLi4up4Q8Vl3Rz7hBbaSjYmj1DU4ZQVEjRXdSoSaGvQNmBZRyaEqn+I3T
         MY+g==
X-Forwarded-Encrypted: i=1; AJvYcCXGK5CQ/hDqixpREonDcE4Mj7+4V/seo0AEm2+JweuXzEM4GWwUdizK9+gVB/AK+Aa/xriXlhR8aFVu52/qr4FV@lists.infradead.org
X-Gm-Message-State: AOJu0YwK+5UyUOJTIhJRMGZIxAygMP2jqwsC6rYEMrOr8r80FtMUqitU
	ESlMwodJxqf+GxV1DpMKbtzmuNDZxqpl3NZnBeZd/n04R2pB0/HS6tkeu4oyBlgcDF/WQ61uRA=
	=
X-Google-Smtp-Source: AGHT+IHDhAsp1nno//nPl2At9qgA+VgSPYHGXDoZbiK+SFBzzHnFyl/e7ZT+ADtfrG0th/kkfg/+o6ZYfA==
X-Received: from wrzd5.prod.google.com ([2002:a5d:6dc5:0:b0:38f:3ee0:73f5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2ac:b0:38d:ae4e:2267
 with SMTP id ffacd0b85a97d-390e166dcd7mr846883f8f.11.1740606931386; Wed, 26
 Feb 2025 13:55:31 -0800 (PST)
Date: Wed, 26 Feb 2025 21:55:20 +0000
In-Reply-To: <20250226215520.1759218-1-tabba@google.com>
Mime-Version: 1.0
References: <20250226215520.1759218-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250226215520.1759218-5-tabba@google.com>
Subject: [PATCH v2 4/4] KVM: arm64: Create each pKVM hyp vcpu after its
 corresponding host vcpu
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_135533_196775_E157187D 
X-CRM114-Status: GOOD (  23.62  )
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
values) is not initialized until the first time the host vcpu is
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
index 3a7ec98ef123..4a0e522f6001 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -869,6 +869,8 @@ struct kvm_vcpu_arch {
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
index b8e55a441282..cd7a808eeb64 100644
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
index 6efb9bf56180..4ef3748dc660 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -245,10 +245,12 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 
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
@@ -367,8 +369,14 @@ static void unpin_host_vcpus(struct pkvm_hyp_vcpu *hyp_vcpus[],
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
@@ -392,24 +400,18 @@ static void pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *
 
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
@@ -647,27 +649,28 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
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
@@ -713,12 +716,17 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
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
2.48.1.711.g2feabab25a-goog


