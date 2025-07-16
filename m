Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44909C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkXH9+Ju9qLefqDmLXr88CY0f/QuBhkcRpVqVhxrcMo=; b=h7aSN/jh9m3Nzt+U/lYq/Pw7A+
	GiUrvVhSAY/g0wfXModLgCwByFXXtwyVlQZhYeIDP/PgAJhtj6XTb0urzPbqwMk58zd+GUpEd8Ig6
	r2cmKLoz1vpbBjg6ZtCsXKYKWtsI7GASqlBXyB5/LOCHSPNFKwIB65IDTuf3broZ0d2atTzZZHz+Q
	VHLi5dac6rVMua7u/e4D227sFeaa0yQLzvZQ46rj1Zsl2bDteGkBlsw1lyepul1oK5AKSRvUjXxj6
	GbaQiCIR4iRdN/0nXvIpZN5lfCscA7tnmfKR41/Af7bwjO48tCP7BPpdnP2IGAwCfRMpXUPdH9xcY
	ARfd9Jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0Dh-00000007Y13-0MzX;
	Wed, 16 Jul 2025 11:22:41 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzzJ-00000007VGM-0TZW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 11:07:50 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45597cc95d5so26994395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752664067; x=1753268867; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DkXH9+Ju9qLefqDmLXr88CY0f/QuBhkcRpVqVhxrcMo=;
        b=btEa2nMHXb3Qu41JCxWvxJIKfkkNl81zhqJGAxXPhM/Xdkt1u7nU8OXDgn+0feU+TU
         wdpNYzokJPkuVcyoawzd8EMgDJqHLoR8gNdoVCtK5PJN+qxDxzvzciNadk7lZllu3UZS
         KuHd30rFWaxRvV5e6fXiEdkWvR44XHhW9OE+3kUxcAO+H3JwG/1q+I0hJTMGld7/uh/K
         5Ylgn6dsm/SBsYS8iMUR/TiyLJu6ucdZP3DaKnyrWEPTpdpNYtGcl8MtjW35ya8/C+ci
         IICPa/Lp+VTmGrJBlaoen5TlxHY1HgXfbGiSHnU3EbtUd6+ULcZgd65bNwYz2QuK0eZN
         ssiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752664067; x=1753268867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkXH9+Ju9qLefqDmLXr88CY0f/QuBhkcRpVqVhxrcMo=;
        b=rDp0x7Y8+8wkt9D85SCnxOiLb/Rr5KFxXgYQBn7Lix1pppSUOR0M4hltXzjEKWtsvz
         mcJMF8FGUFgf2OxolUHEPSW7NUkkqHPVAetq7+SdR/yQn2fyiZHfUrAFjAlVjy1x8vKp
         3lQDihYtkqDpx/kAH/sglsEpcRMB0ihEdiYnh3QUxgfhmJKe8YBYV7jlIamJjUFMxnme
         beHxyZUVF4CJ19IoHHs5Q0sP0ZApf+GPAxNgXsRcXeU9zdMowV7iWbukJ0y4fHWYaBH0
         IIoxEuOzQyDV7TCFsvgVkC0fCxNa7bycjIVUuxvxKR28RcdftaYO0W3Ub2IU2wxF74jr
         dU6Q==
X-Gm-Message-State: AOJu0YyAqtTDZS/LsyzBwNLHQisiwh30gq5QwnRVHROpwcuWPbqV5UBD
	j5fQPN4dIuibQ1Y1lAqOHMskpTnYJPWzmzPCHnc4ILH62P01sEc+8bQhFARqWI5B5lC1y0tVyAD
	uJcDN3tUX3l7QmskmBMRuskhqq8uWmGZnPLntoN4rAU8w3rl2ni+/1iWOU1jXfkgl3Jo5254h18
	LJgyXOjdLTRyWqAGUkniMK/mP0qmvZg12HLTXmqPM6DAK09ZgiBQ==
X-Google-Smtp-Source: AGHT+IFpoWhoafJFWbwsE4WRdqTI2xCnHqs5MSPVmR8sRs6DH+HGmbw1n5hUPgrnRCYka3njSht1T7VPaw==
X-Received: from wmby19.prod.google.com ([2002:a05:600c:c053:b0:456:1b6f:c878])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3e15:b0:439:86fb:7340
 with SMTP id 5b1f17b1804b1-4562e39865dmr26121765e9.30.1752664067193; Wed, 16
 Jul 2025 04:07:47 -0700 (PDT)
Date: Wed, 16 Jul 2025 11:07:36 +0000
In-Reply-To: <20250716110737.2513665-1-keirf@google.com>
Mime-Version: 1.0
References: <20250716110737.2513665-1-keirf@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250716110737.2513665-4-keirf@google.com>
Subject: [PATCH v2 3/4] KVM: Implement barriers before accessing kvm->buses[]
 on SRCU read paths
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_040749_156378_D73F0B84 
X-CRM114-Status: GOOD (  17.99  )
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
index 191a9ed0da22..425e3d8074ab 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5861,6 +5861,13 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
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
index 3bde4fb5c6aa..9132148fb467 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -965,11 +965,15 @@ static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
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
index 222f0e894a0c..9ec3b96b9666 100644
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
@@ -5838,6 +5847,18 @@ static int __kvm_io_bus_write(struct kvm_vcpu *vcpu, struct kvm_io_bus *bus,
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
@@ -5850,7 +5871,7 @@ int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
 		.len = len,
 	};
 
-	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
+	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
 	if (!bus)
 		return -ENOMEM;
 	r = __kvm_io_bus_write(vcpu, bus, &range, val);
@@ -5869,7 +5890,7 @@ int kvm_io_bus_write_cookie(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx,
 		.len = len,
 	};
 
-	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
+	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
 	if (!bus)
 		return -ENOMEM;
 
@@ -5919,7 +5940,7 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
 		.len = len,
 	};
 
-	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
+	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
 	if (!bus)
 		return -ENOMEM;
 	r = __kvm_io_bus_read(vcpu, bus, &range, val);
@@ -6028,7 +6049,7 @@ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm *kvm, enum kvm_bus bus_idx,
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 
-	bus = srcu_dereference(kvm->buses[bus_idx], &kvm->srcu);
+	bus = kvm_get_bus_srcu(kvm, bus_idx);
 	if (!bus)
 		goto out_unlock;
 
-- 
2.50.0.727.gbf7dc18ff4-goog


