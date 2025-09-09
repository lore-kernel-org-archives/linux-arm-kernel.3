Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC086CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naUvPBgX3c5Rxz+GLdwV0lKRhpqfT3UVnsLZMdoq3bI=; b=MV7tvXzDKWnV9BusPEjdYwNMz8
	m1pOX8phGbVWodCN+wHW6SOXfV6T+SO9yPAPsCA4yn6nsDr0zSpNEnk7KvHwmSck71xcUug29Ohnj
	25ysjwbL3zx+CyrZGmUt2DXgXWIvsz7FyDzLzlMn9enP8Z+qP6r3huE8FNEFO71nSrUFsYVzkurLO
	NVVXKFQywkPdIuZ6lrMhd/V5r3zAAcwdfnQZkhn0nw3lfqr9wjhEoeIn8Hn0vxN8eSfILx0gxOXR0
	eXwNZfFKNlBOfdIjp2Ur7AUNEjTwmfSpR3q54y1ucQuOQtb5rNH9FDNykdAtOBrZ+TWYLoYqKuBnN
	rtzjvLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0TM-00000008BnC-0u2z;
	Tue, 09 Sep 2025 15:41:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv9B-00000006Cow-1o9l
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 10:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=naUvPBgX3c5Rxz+GLdwV0lKRhpqfT3UVnsLZMdoq3bI=; b=UdXqWEsA4W2WMVDy2RSOC4TQe1
	sYILtzN9xiFS1ZwjQTrLBvF9TV/KFaSU2JN7mK7TA90s71EBwwrrFrr23MYwj9yljlk20RSeuStLp
	Hjj0OZOPY+AGIr50e8hzFMLbyEPlmxn3EZC9Lwwl/94wlRnkHYLPzMDVtKm04uBP+N2CF/ibY9qd9
	N80AsghlZNzzCUK/Xl/C5vUSZkr96XIRYGO/02ZexUfBc2An8fzdLPvRWjK480vWF/KrLg8LdKEeY
	DdWN7+BoCCRBj3uFmNinkud8+pHY0zQKEcLBL00SDGgGNsJq7qgApa4oU1lYu7lgbwQ8xubBxiAZt
	U6waI8SA==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv98-00000005HGU-2GlD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:00:20 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3e403b84456so2714311f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757412017; x=1758016817; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=naUvPBgX3c5Rxz+GLdwV0lKRhpqfT3UVnsLZMdoq3bI=;
        b=2uajN9RJMil5mfj5PAp2Ux7fE43Q6GvNyzZNXo/htFqLd6tqAR5Cj5Mz4UzoHjmWel
         ipoQYbz6EeHLRg4QZRWbxwzEIt9nonUBglpoiuRW36uhcj5Nfb0qHTV4Q1/R9ZVnRjhi
         4q3e0AxNuiblNuhM+IZzJ+qZLT9Ly0i616OGLlujm0IflKle7LChNURAnVTuSzF++vQ6
         vCnyiLudHZiavPF73vWKtHDXoFJeBoXuARP/SKEbab7lHA6+2P8FRBe+ZoU4NdalUuJX
         oRtuf38aVgPL+LhmYEWiuZT4XphjET1gFUMlSS1G6Iz+zCCcsYG4/G6VwpkTARvoi/ok
         lgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412017; x=1758016817;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naUvPBgX3c5Rxz+GLdwV0lKRhpqfT3UVnsLZMdoq3bI=;
        b=tFn4v3Oy0AGHoUQFnioTZSd5RnsFuVEiQVTmbSpCwC7eVRo2rgsdWR8xq3BTJIBGbR
         NwEKA7wGbgMuBKQzPwYVNopq6A5cv4F7wxFwdcXVk9IUsMPy9nTZSKtEBCju5lsSAwYs
         DupQzw3Ux3X6wyWpcb/wDKFj3DVU3QvGDnRvwpFC9wnC0i37C6VRpA5dD7np/2oGxoEQ
         le7ia+Uw8gLFzxsvyhlGJr+sZKhSul20Joar9mjMACtd5L1Hg8+nCAKs6R0GXmNl2C7O
         XLH/We3pHOpaoOo1kD90i+uE8F0Y67sbag7d0YjgD4Pc6Swu4WWHqdIhnTHbAWxX2A7r
         K70g==
X-Gm-Message-State: AOJu0YyXF6fLl0dr7oMIiprabgKOReoRNQcWRWYKyBF42M/Wnq7TkpDp
	HPiGqfiPA9YQfnCt47N6OeQPNRUbxyQfXJ6bCOTwh1Ddv7KInmaab6Om49kPJyqJzeySFqkQfXa
	YYQPgU+WyozK+hwVFX2cQE+D+GrkE5C3jjA11UVIOyHN/XYcCqHVBhW3d1egWXk2KcqJgCUJcaZ
	cesCvEGzXJTv4hSq0sRcMnWlu6Q0GnhRVFxCZXfao9NrWfFKSp5w==
X-Google-Smtp-Source: AGHT+IHmRvR3R+1MwJeFj/j7L7E831lkKiWcOJ9Jdj1nDD8J0dRSwBSxqm629IKVNfBpTcEIAykfMOGmsA==
X-Received: from wrbei3.prod.google.com ([2002:a05:6000:4183:b0:3e6:f3df:9b4d])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2883:b0:3e3:f332:73f0
 with SMTP id ffacd0b85a97d-3e64c693923mr8140093f8f.49.1757412016697; Tue, 09
 Sep 2025 03:00:16 -0700 (PDT)
Date: Tue,  9 Sep 2025 10:00:06 +0000
In-Reply-To: <20250909100007.3136249-1-keirf@google.com>
Mime-Version: 1.0
References: <20250909100007.3136249-1-keirf@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909100007.3136249-4-keirf@google.com>
Subject: [PATCH v4 3/4] KVM: Implement barriers before accessing kvm->buses[]
 on SRCU read paths
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_110018_757174_1858C5AB 
X-CRM114-Status: GOOD (  18.50  )
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

This ensures that, if a VCPU has "observed" that an IO registration has
occurred, the instruction currently being trapped or emulated will also
observe the IO registration.

At the same time, enforce that kvm_get_bus() is used only on the
update side, ensuring that a long-term reference cannot be obtained by
an SRCU reader.

Signed-off-by: Keir Fraser <keirf@google.com>
---
 arch/x86/kvm/vmx/vmx.c   |  7 +++++++
 include/linux/kvm_host.h | 10 +++++++---
 virt/kvm/kvm_main.c      | 32 ++++++++++++++++++++++++++------
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index aa157fe5b7b3..0bdf9405969a 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5785,6 +5785,13 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
 		if (kvm_test_request(KVM_REQ_EVENT, vcpu))
 			return 1;
 
+		/*
+		 * Ensure that any updates to kvm->buses[] observed by the
+		 * previous instruction (emulated or otherwise) are also
+		 * visible to the instruction KVM is about to emulate.
+		 */
+		smp_rmb();
+
 		if (!kvm_emulate_instruction(vcpu, 0))
 			return 0;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..e7d6111cf254 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -966,11 +966,15 @@ static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
 	return !!(kvm->manual_dirty_log_protect & KVM_DIRTY_LOG_INITIALLY_SET);
 }
 
+/*
+ * Get a bus reference under the update-side lock. No long-term SRCU reader
+ * references are permitted, to avoid stale reads vs concurrent IO
+ * registrations.
+ */
 static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
 {
-	return srcu_dereference_check(kvm->buses[idx], &kvm->srcu,
-				      lockdep_is_held(&kvm->slots_lock) ||
-				      !refcount_read(&kvm->users_count));
+	return rcu_dereference_protected(kvm->buses[idx],
+					 lockdep_is_held(&kvm->slots_lock));
 }
 
 static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6c07dd423458..870ad8ea93a7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1103,6 +1103,14 @@ void __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
 {
 }
 
+/* Called only on cleanup and destruction paths when there are no users. */
+static inline struct kvm_io_bus *kvm_get_bus_for_destruction(struct kvm *kvm,
+							     enum kvm_bus idx)
+{
+	return rcu_dereference_protected(kvm->buses[idx],
+					 !refcount_read(&kvm->users_count));
+}
+
 static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 {
 	struct kvm *kvm = kvm_arch_alloc_vm();
@@ -1228,7 +1236,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 out_err_no_arch_destroy_vm:
 	WARN_ON_ONCE(!refcount_dec_and_test(&kvm->users_count));
 	for (i = 0; i < KVM_NR_BUSES; i++)
-		kfree(kvm_get_bus(kvm, i));
+		kfree(kvm_get_bus_for_destruction(kvm, i));
 	kvm_free_irq_routing(kvm);
 out_err_no_irq_routing:
 	cleanup_srcu_struct(&kvm->irq_srcu);
@@ -1276,7 +1284,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 
 	kvm_free_irq_routing(kvm);
 	for (i = 0; i < KVM_NR_BUSES; i++) {
-		struct kvm_io_bus *bus = kvm_get_bus(kvm, i);
+		struct kvm_io_bus *bus = kvm_get_bus_for_destruction(kvm, i);
 
 		if (bus)
 			kvm_io_bus_destroy(bus);
@@ -5843,6 +5851,18 @@ static int __kvm_io_bus_write(struct kvm_vcpu *vcpu, struct kvm_io_bus *bus,
 	return -EOPNOTSUPP;
 }
 
+static struct kvm_io_bus *kvm_get_bus_srcu(struct kvm *kvm, enum kvm_bus idx)
+{
+	/*
+	 * Ensure that any updates to kvm_buses[] observed by the previous vCPU
+	 * machine instruction are also visible to the vCPU machine instruction
+	 * that triggered this call.
+	 */
+	smp_mb__after_srcu_read_lock();
+
+	return srcu_dereference(kvm->buses[idx], &kvm->srcu);
+}
+
 int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
 		     int len, const void *val)
 {
@@ -5855,7 +5875,7 @@ int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
 		.len = len,
 	};
 
-	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
+	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
 	if (!bus)
 		return -ENOMEM;
 	r = __kvm_io_bus_write(vcpu, bus, &range, val);
@@ -5874,7 +5894,7 @@ int kvm_io_bus_write_cookie(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx,
 		.len = len,
 	};
 
-	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
+	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
 	if (!bus)
 		return -ENOMEM;
 
@@ -5924,7 +5944,7 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
 		.len = len,
 	};
 
-	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
+	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
 	if (!bus)
 		return -ENOMEM;
 	r = __kvm_io_bus_read(vcpu, bus, &range, val);
@@ -6033,7 +6053,7 @@ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm *kvm, enum kvm_bus bus_idx,
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 
-	bus = srcu_dereference(kvm->buses[bus_idx], &kvm->srcu);
+	bus = kvm_get_bus_srcu(kvm, bus_idx);
 	if (!bus)
 		goto out_unlock;
 
-- 
2.51.0.384.g4c02a37b29-goog


