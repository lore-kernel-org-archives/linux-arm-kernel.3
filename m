Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035BCF53D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OL7t7B6X78PqYAbrBfjg/doY6RGS0yWRoav+K4LS08=; b=LSn3ixcbuotVr2384qD5QIELLH
	rSP5Q/6voxtizcgHruIzH9rcy99tzOPtejKZLO48zRKnJyMU2C+tsnCjyVmZOR62VhCXNcTUX1hAS
	0B7oYiRDgkFAMNG4k7QTc/1E8Iv1Dmp2mec45/wPmVxp6iMxnvgfUfxIveUJMrJss6i9cOD49WoeV
	hH9wmodHtlyOlzi9B6ISNP54QCf8HeMjXDOQ/oMUkVS4zAyJJLLd6gdEUTM8jCQwzWHk1aoUKMOff
	exEAlzxPFRDrn8DAtmOect6cz+ALi4/C0GyMTvh3Mev8L7nsQY/ocU8flP3mfINH8pBm1SnceeC0+
	u3Uml4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Br5-00000004Zwe-3yMU;
	Mon, 16 Mar 2026 17:35:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqs-00000004Zo4-2XCD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8OL7t7B6X78PqYAbrBfjg/doY6RGS0yWRoav+K4LS08=; b=VG1HKB1o5qJiGr6ZDnMFyDY04M
	M0KDsGK9PDFpvUkf6DxfFzGq2iMEs9Zo7qJyV8ctb4wCb2F4n34vGqbdcGGRgFGxMp/bJ2ZCIdiub
	ESRMVUGxVChiQif6R7BLax2MWm/MqLfgWNwQZveUajOpx99hQU14MQL172seTsWXcihtUfeWKz+b0
	GXDfPIlRTpdLmHiBsu4yiFiiR5PHoisqLQB8lzE3kpsq8Rlh+SGNzA9k4FDF2fR2ftCAOaKQ+s3fe
	+v5pHhiP/F3vMyTIqAJPeVdS+hqnEmzUOiiMvPeaEMf1pwJ0XY+/zXZBUD/2AJT3Sg/D9sU5irVl5
	QzKEwC9A==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqp-00000007LsJ-2Naz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48541cac34dso45635135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682534; x=1774287334; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8OL7t7B6X78PqYAbrBfjg/doY6RGS0yWRoav+K4LS08=;
        b=H670okB0bYw0t8y+1HNgMrC+SC/MttvS/dxNZjqUgtWnCCSYn9xrBaBQ+Cp56ve2fv
         +EJXhZFrH1zJmuxVS8CqkpLhbXevYMnVja1VW7eZUF+h1lXIi8ormkjU1OnH/pKOOevk
         o/r/y+5j3V1oGt39QDF8EF5fg5wsvQVDYhYhSRS2L7u0eUf2PSfJxbjHxQP7K1QWGvF/
         fSmo3efjdVCVQoXy6Oq9uBV6dR1f8jOISc3LIj16SgCD5yEzV/f3SbwV7jPrIIEPBgN0
         Qs77OmbOgd3EwrRM16M/3WNIAKGibJt0HkDVWyuyQuUQ4bGMQPrJ1aa5cl0EJmdvc2Kq
         qj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682534; x=1774287334;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OL7t7B6X78PqYAbrBfjg/doY6RGS0yWRoav+K4LS08=;
        b=ApJ66y3Ntix52z3kuuh3hGJSdN5JkvvviN6cr2Nd/gLcby+FsYFRpdffXx3tcFNBSX
         T13kWjTE/qu3MusaSdL5LFRbkF1ZPtlrPeY3nXfaduusAGeAAtVYRijdYRBJWTrVuQwb
         Hs27g7quMktaZ+MH3vtCpGefDLnzEmhSc1wcVNXoPC5Wx90RBQ00oC+IZ51Ve7m4n5ZX
         yjMv2P84j6lRmqQMdqKpwFhajbn9NUCtE/fNZF5qk4kwUX62ElU7BH3e2TPGGOCaeF1V
         gg7ulxm4z+BugnO9dGOeNOKZTT/HUJ3dhZRDSs0AF1vF2HzMWZVwqnKXzbqf4IcRPhX0
         CmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvk5S2sAOFjaLHITudfdDAqSB01Nam4Zzf2g8EJ8vay+IfATPCFMxoX8aajwyBt4qECb956YwzAueXjLMpCrOz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ZYW5NjSsQ+mIqiVX+dNO+WZxrhiM9il9aYQPX2BfONayHmNj
	6ULt8GaLkxKFp5m/EMiS3yhnKysgPM/QqMoVBeGe7NitssymbYP+w8ViNCEX8Gn/8Kl5BO5X86Z
	YJQ==
X-Received: from wmbf24.prod.google.com ([2002:a05:600c:5958:b0:47e:e922:b080])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45d3:b0:480:1e40:3d2
 with SMTP id 5b1f17b1804b1-48556705301mr238355675e9.29.1773682533729; Mon, 16
 Mar 2026 10:35:33 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:26 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-5-456875a2c6db@google.com>
Subject: [PATCH 05/10] KVM: arm64: Use guard(hyp_spinlock) in pkvm.c
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173535_690904_9544AD69 
X-CRM114-Status: GOOD (  16.96  )
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

Migrate manual hyp_spin_lock() and hyp_spin_unlock() calls managing
the global vm_table_lock to use the guard(hyp_spinlock) macro.

This significantly cleans up validation and error paths during VM
creation and manipulation by eliminating the need for goto labels
and manual unlock procedures on early returns.

Change-Id: I894df69b3cfe053a77dd660dfb70c95640c6d70c
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 122 +++++++++++++++++------------------------
 1 file changed, 51 insertions(+), 71 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 2f029bfe4755..8f901fdead89 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -253,28 +253,23 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 	if (__this_cpu_read(loaded_hyp_vcpu))
 		return NULL;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
 	if (!hyp_vm || hyp_vm->kvm.created_vcpus <= vcpu_idx)
-		goto unlock;
+		return NULL;
 
 	hyp_vcpu = hyp_vm->vcpus[vcpu_idx];
 	if (!hyp_vcpu)
-		goto unlock;
+		return NULL;
 
 	/* Ensure vcpu isn't loaded on more than one cpu simultaneously. */
-	if (unlikely(hyp_vcpu->loaded_hyp_vcpu)) {
-		hyp_vcpu = NULL;
-		goto unlock;
-	}
+	if (unlikely(hyp_vcpu->loaded_hyp_vcpu))
+		return NULL;
 
 	hyp_vcpu->loaded_hyp_vcpu = this_cpu_ptr(&loaded_hyp_vcpu);
 	hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
-unlock:
-	hyp_spin_unlock(&vm_table_lock);
 
-	if (hyp_vcpu)
-		__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
+	__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
 	return hyp_vcpu;
 }
 
@@ -282,11 +277,10 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct pkvm_hyp_vm *hyp_vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	hyp_vcpu->loaded_hyp_vcpu = NULL;
 	__this_cpu_write(loaded_hyp_vcpu, NULL);
 	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
-	hyp_spin_unlock(&vm_table_lock);
 }
 
 struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void)
@@ -299,20 +293,18 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
 {
 	struct pkvm_hyp_vm *hyp_vm;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
 	if (hyp_vm)
 		hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
-	hyp_spin_unlock(&vm_table_lock);
 
 	return hyp_vm;
 }
 
 void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
 {
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
-	hyp_spin_unlock(&vm_table_lock);
 }
 
 struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle)
@@ -613,9 +605,8 @@ static int insert_vm_table_entry(pkvm_handle_t handle,
 {
 	int ret;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	ret = __insert_vm_table_entry(handle, hyp_vm);
-	hyp_spin_unlock(&vm_table_lock);
 
 	return ret;
 }
@@ -692,9 +683,8 @@ int __pkvm_reserve_vm(void)
 {
 	int ret;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	ret = allocate_vm_table_entry();
-	hyp_spin_unlock(&vm_table_lock);
 
 	if (ret < 0)
 		return ret;
@@ -713,10 +703,9 @@ void __pkvm_unreserve_vm(pkvm_handle_t handle)
 	if (unlikely(!vm_table))
 		return;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	if (likely(idx < KVM_MAX_PVMS && vm_table[idx] == RESERVED_ENTRY))
 		remove_vm_table_entry(handle);
-	hyp_spin_unlock(&vm_table_lock);
 }
 
 /*
@@ -815,35 +804,35 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
 	if (!hyp_vcpu)
 		return -ENOMEM;
 
-	hyp_spin_lock(&vm_table_lock);
+	scoped_guard(hyp_spinlock, &vm_table_lock) {
+		hyp_vm = get_vm_by_handle(handle);
+		if (!hyp_vm) {
+			ret = -ENOENT;
+			goto err_unmap;
+		}
 
-	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm) {
-		ret = -ENOENT;
-		goto unlock;
+		ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu);
+		if (ret)
+			goto err_unmap;
+
+		idx = hyp_vcpu->vcpu.vcpu_idx;
+		if (idx >= hyp_vm->kvm.created_vcpus) {
+			ret = -EINVAL;
+			goto err_unmap;
+		}
+
+		if (hyp_vm->vcpus[idx]) {
+			ret = -EINVAL;
+			goto err_unmap;
+		}
+
+		hyp_vm->vcpus[idx] = hyp_vcpu;
+
+		return 0;
 	}
 
-	ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu);
-	if (ret)
-		goto unlock;
-
-	idx = hyp_vcpu->vcpu.vcpu_idx;
-	if (idx >= hyp_vm->kvm.created_vcpus) {
-		ret = -EINVAL;
-		goto unlock;
-	}
-
-	if (hyp_vm->vcpus[idx]) {
-		ret = -EINVAL;
-		goto unlock;
-	}
-
-	hyp_vm->vcpus[idx] = hyp_vcpu;
-unlock:
-	hyp_spin_unlock(&vm_table_lock);
-
-	if (ret)
-		unmap_donated_memory(hyp_vcpu, sizeof(*hyp_vcpu));
+err_unmap:
+	unmap_donated_memory(hyp_vcpu, sizeof(*hyp_vcpu));
 	return ret;
 }
 
@@ -866,27 +855,22 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 	struct kvm *host_kvm;
 	unsigned int idx;
 	size_t vm_size;
-	int err;
 
-	hyp_spin_lock(&vm_table_lock);
-	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm) {
-		err = -ENOENT;
-		goto err_unlock;
+	scoped_guard(hyp_spinlock, &vm_table_lock) {
+		hyp_vm = get_vm_by_handle(handle);
+		if (!hyp_vm)
+			return -ENOENT;
+
+		if (WARN_ON(hyp_page_count(hyp_vm)))
+			return -EBUSY;
+
+		host_kvm = hyp_vm->host_kvm;
+
+		/* Ensure the VMID is clean before it can be reallocated */
+		__kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
+		remove_vm_table_entry(handle);
 	}
 
-	if (WARN_ON(hyp_page_count(hyp_vm))) {
-		err = -EBUSY;
-		goto err_unlock;
-	}
-
-	host_kvm = hyp_vm->host_kvm;
-
-	/* Ensure the VMID is clean before it can be reallocated */
-	__kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
-	remove_vm_table_entry(handle);
-	hyp_spin_unlock(&vm_table_lock);
-
 	/* Reclaim guest pages (including page-table pages) */
 	mc = &host_kvm->arch.pkvm.teardown_mc;
 	stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
@@ -917,8 +901,4 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 	teardown_donated_memory(mc, hyp_vm, vm_size);
 	hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
 	return 0;
-
-err_unlock:
-	hyp_spin_unlock(&vm_table_lock);
-	return err;
 }

-- 
2.53.0.851.ga537e3e6e9-goog


