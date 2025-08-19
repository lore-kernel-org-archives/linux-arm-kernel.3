Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB2CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVk9a2k32/h6AWhwvz8AjLIHmDt75XL0D5Be34oDUlo=; b=raIaDCv3r0+oUcRd2GCRZE3N/g
	nfHWqhMhvhJutbf1wKWa98zHtUEwfypCtTD2lEMz8H4NE6zx8bsu6O46zhCLzjjfPq6Hk6168HeHz
	O0Unt2o8c0nzbB+u1Dsj6zcEHt0cbAvIrtg5CyKZ5RifySGtsL8l1XkXPupL5Vgpwt2Tv4Od/op6/
	cKn5pXX6tuNw4kj+2TM2dy9Dgwvtyf0ldSGOyIKW2t/aejFSQq1VZ49HNH5QSerUg+2wtH8yQlZZw
	YDLb7zXwKgT0CDMnusWEZphMMKE6QmL22fmvd63uiWcJh44vMrWR3LgaSfLh8KLY67sTO3/7ho4LP
	h1N/go6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIz5-0000000A1lb-0PzT;
	Tue, 19 Aug 2025 09:50:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIL0-00000009tlt-3tm6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:09:04 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b10418aso29558205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 02:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755594541; x=1756199341; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YVk9a2k32/h6AWhwvz8AjLIHmDt75XL0D5Be34oDUlo=;
        b=0cvqNzoOB1k/DkKVSle/WzMtefR8V8eJ+VIDyGRbePSZ6lfp0Rjgd/KNZLwufCnDAU
         WygeBvEuCI18lO2PZO9yJJ/mHXxiH/83REG6CPS3ehk2LaRXT+3UHjKMnIFQSOHxCtcB
         fdip6s/SVsQK9y0H1Ht2C7SMt7zoQX/yDdECwyCxj9i4BW8B3+jgzMUzpKM8Izuu2kGS
         b5BRzOCr28sIcUF5BpmjFHpbQ3BPuteLx0XjuQYzxOqTGCit2kd63ylSZzUrkecZ9mH7
         RYlv9SEHYBudCrIMZ+TFt9bKThrFxP2jnPZF0WKiC84gIruTMDUZ1SC98Tg2x8jD3UPA
         UcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594541; x=1756199341;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVk9a2k32/h6AWhwvz8AjLIHmDt75XL0D5Be34oDUlo=;
        b=Pstkwo+y/WvGzgR3f9pSBbHHttCHMZS7G2a6TdGiEFBzXpXAkIET+2UNSgdZeHb/XG
         LwnGZTtWgxYLK4dqt34B53BpYvu4atU3q3l7BfqdkoQwyNkTVq1lzjf7bymhReEnucRd
         fa8sNYcmKkQ5sDK6ClArKlXu9sd1Kd3pPIQLMJgTl9EnEa00mM1JM4hCWvChV9hF1T8o
         w0EpH9zt64j+7VEIke1etkqQ24T/CTQIitolzJcUO5OaytdNlHacmZFZtlSILx+EDk0Y
         ikYDasWDcM7aWKo2VbGnSdNGJtd88Ittf461d9oqO2qlY7NUUGclCoOM2PP1XAN19fWr
         o7PQ==
X-Gm-Message-State: AOJu0YxnCqfH2x+/cHtOj5FQzCj+pAlU+M2WxDcyJQy48Nxs9CKO3+gz
	R9OgrmAdOUHf9A9ly2M3Cx3QX7KZ19dfTBbhOzJXI5nAZOCtyCVoJpAfWWmK5I4rfy9okNpdG1U
	4+MghA+w6dw1ZTx7QbFLyFzSuKJguSVDSxBGrxtEceWf7+5kQeHPIg2mA6O0kina5HmCUHKU/eH
	qSbGx6jiyO4OsJXiHCVgZrhCkb1mzgJI1eI8/NAq/GNXXjdrwnrA==
X-Google-Smtp-Source: AGHT+IGTjX+cyo/FUylA2G0KujL7y3t2s4M6bbVMk0SnbkXB4aY/ErPaSd+f/dDH9fy1iC89j9dagd09LA==
X-Received: from wmbel5.prod.google.com ([2002:a05:600c:3e05:b0:459:e01c:3d6d])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e91:b0:456:19be:5cc
 with SMTP id 5b1f17b1804b1-45b43dd3118mr11414045e9.14.1755594540927; Tue, 19
 Aug 2025 02:09:00 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:08:52 +0000
In-Reply-To: <20250819090853.3988626-1-keirf@google.com>
Mime-Version: 1.0
References: <20250819090853.3988626-1-keirf@google.com>
X-Mailer: git-send-email 2.51.0.rc1.193.gad69d77794-goog
Message-ID: <20250819090853.3988626-4-keirf@google.com>
Subject: [PATCH v3 3/4] KVM: Implement barriers before accessing kvm->buses[]
 on SRCU read paths
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_020902_968303_DFC40B72 
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
 virt/kvm/kvm_main.c      | 33 +++++++++++++++++++++++++++------
 3 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index aa157fe5b7b3..2d3c8cb4f860 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5785,6 +5785,13 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
 		if (kvm_test_request(KVM_REQ_EVENT, vcpu))
 			return 1;
 
+		/*
+		 * Ensure that any updates to kvm->buses[] observed by the
+		 * previous instruction (emulated or otherwise) are also
+		 * visible to the instruction we are about to emulate.
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
index 6c07dd423458..4f35ae23ee5a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1103,6 +1103,15 @@ void __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
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
+
 static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 {
 	struct kvm *kvm = kvm_arch_alloc_vm();
@@ -1228,7 +1237,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 out_err_no_arch_destroy_vm:
 	WARN_ON_ONCE(!refcount_dec_and_test(&kvm->users_count));
 	for (i = 0; i < KVM_NR_BUSES; i++)
-		kfree(kvm_get_bus(kvm, i));
+		kfree(kvm_get_bus_for_destruction(kvm, i));
 	kvm_free_irq_routing(kvm);
 out_err_no_irq_routing:
 	cleanup_srcu_struct(&kvm->irq_srcu);
@@ -1276,7 +1285,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 
 	kvm_free_irq_routing(kvm);
 	for (i = 0; i < KVM_NR_BUSES; i++) {
-		struct kvm_io_bus *bus = kvm_get_bus(kvm, i);
+		struct kvm_io_bus *bus = kvm_get_bus_for_destruction(kvm, i);
 
 		if (bus)
 			kvm_io_bus_destroy(bus);
@@ -5843,6 +5852,18 @@ static int __kvm_io_bus_write(struct kvm_vcpu *vcpu, struct kvm_io_bus *bus,
 	return -EOPNOTSUPP;
 }
 
+static struct kvm_io_bus *kvm_get_bus_srcu(struct kvm *kvm, enum kvm_bus idx)
+{
+	/*
+	 * Ensure that any updates to kvm_buses[] observed by the previous VCPU
+	 * machine instruction are also visible to the VCPU machine instruction
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
@@ -5855,7 +5876,7 @@ int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
 		.len = len,
 	};
 
-	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
+	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
 	if (!bus)
 		return -ENOMEM;
 	r = __kvm_io_bus_write(vcpu, bus, &range, val);
@@ -5874,7 +5895,7 @@ int kvm_io_bus_write_cookie(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx,
 		.len = len,
 	};
 
-	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
+	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
 	if (!bus)
 		return -ENOMEM;
 
@@ -5924,7 +5945,7 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
 		.len = len,
 	};
 
-	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
+	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
 	if (!bus)
 		return -ENOMEM;
 	r = __kvm_io_bus_read(vcpu, bus, &range, val);
@@ -6033,7 +6054,7 @@ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm *kvm, enum kvm_bus bus_idx,
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 
-	bus = srcu_dereference(kvm->buses[bus_idx], &kvm->srcu);
+	bus = kvm_get_bus_srcu(kvm, bus_idx);
 	if (!bus)
 		goto out_unlock;
 
-- 
2.51.0.rc1.193.gad69d77794-goog


