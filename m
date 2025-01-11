Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CC6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 02:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnP9l4TBgZavFgl9ingoWbV7IQlMfBLutKO12YuuQSs=; b=pjn6RZYFuaEvPscH6q8hj5ck+m
	0yNgt2HlGR+kg3z1M8/CcjuEt0kGoPNZPlD1Arlhlf86UBgA0MrSJWv31JF7GzLCvpZ7dyD+IcUaT
	+aFzaopTizQhM5KCtHQ1gjokdWhLvKWcfOkV7wAatYDSf2qO+GBeL7NgiZ7dPQeSvtjPh2ilnELrA
	GNhEh3crIUBbHJI+9fVfzgpxOQt5Oz06C4BD3FGrapKsi0LRJ6XJoHMreV0UpzBXXS7h3GuuSwGBV
	3hqf8SbYFaC9x2r9NP08SYslDir9tuSIi2Jnw5FIOm5TyR1aq3i2HvX0rM8vQ2kN53yKymRH6B1Jm
	jreQsblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWRNf-0000000Hadz-0kp3;
	Sat, 11 Jan 2025 02:37:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQFN-0000000HUTD-0k2p
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 11 Jan 2025 01:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bnP9l4TBgZavFgl9ingoWbV7IQlMfBLutKO12YuuQSs=; b=NqSg7lIOafpZ784gGjs1ksBIkC
	+WHQ9ekUmaDjt/v3BsMOd8l1wUDKcPVjAOdqUE4ryd0Ed3me9wKJ55Ujfz8y1zJak+/d8OM8FMurK
	ly7FcMlUq2V/xqK/hg5KNQawJT9tv8zhWDlN4Vuy2e7/fdnOYf8SFcqnzXHRTPUsIv+P8/BfhBqqp
	5QF0g0ZPXyMbMKnysChWyysR6yzFpKXdHTpy+HHuQs7GuiKwvP0wRwvjFX6LJ4EZGGiDBZUxIzBPC
	6nJ4KvhgXgmy5B3q6AZ6Lpjfp19wiGw7kPk+GLFt1EOJ+4eWHWZSlty3HyYe0na5Kr44HvWliXZa/
	FWi4M33A==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQFK-00000009zIj-1Xgz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 01:25:04 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2161d5b3eb5so46318605ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 17:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558700; x=1737163500; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bnP9l4TBgZavFgl9ingoWbV7IQlMfBLutKO12YuuQSs=;
        b=XNiT0lGQkId/9VTF7JBWYRtXguwgRxp1EiZlXoFtgSProOZEDo7w2XV31muuC90N1P
         2h9NvxCFJ83PhwlmS6mIPtqVVwFGkrwC278U9E3Vj+rh5NGUgUU02+PUaNg15BjFwmHC
         bJ9jOfA+xkodPvR9GwkSAKTxqwbtjhdkgruCA01oDYXD6QoMk1VP6WYveMdApDO2nw0o
         4Pc1IqJhoBKaZ6pRV/sRZFlXFfa2kOm8cmMeDk7EadPg2zKhygCLm9xhUT2QTewLSznP
         GDCExrvSCGq1T9jFV7EQ+uC8JJZKERwID/vfQCrHnlNN7oWdosCzY0MXHBfOQPj+oLdq
         bTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558700; x=1737163500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnP9l4TBgZavFgl9ingoWbV7IQlMfBLutKO12YuuQSs=;
        b=Lf+LlAsjkO1OjK45IIyEbq2k+fhpv0lsNFX9R6w+myuf1jd6b7ohlw8hVkgxzPo6YW
         BguMJ7fIgMZb5gCELYhwxthImAcOgeDQD5N4gPgfejDKH1DNmrPyKz5VT4AIr8SBN/kJ
         PYWwDmDrRirkYpu9nIGJ6A1mLf6J7o4Cz6auxekuk41e/OcOvdWLDb7BP9U3khbeKijf
         Q27NOYTgQL51TK1X4b/XE9/g5I+3ZMSg8YknWXLCw8qEHqsL1QBGRPgRzTuYzQne4i0I
         sLZKkjwlXSUklbkZTTgre9yeYR5vxekGAzgnDHacnsvKsymJ7iB5DrbHfOdUgeZTcVtH
         L/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTBYBkwBQC1unNEwyF0UVqBXxnwc6YkZYHPRQZjD46bYBpDXc6GpeUsRg76r0mUMksOeDduTp2sXkhoUaBNpkl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzaanehq6owrJ4j5JLxVNXopizABv7PH29tygJJppXo76SzNJE0
	8vfTlcmelBFGxZ7YH/Qy4H5dlmh+fRjtLqAY05desm7GnhD9MGLDkSlZ4dQaeAKkU7tnBZ+N/sn
	jbg==
X-Google-Smtp-Source: AGHT+IH1NdERQE8OQLjVGWXsUxxFzmL931Ova+zIR4kc3ay4XMIaQ3TzbpO5jT/NYBJvXHUAPCJZD+fSckk=
X-Received: from pfbfh41.prod.google.com ([2002:a05:6a00:3929:b0:72a:bc54:8507])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4393:b0:1e1:ca91:b0e3
 with SMTP id adf61e73a8af0-1e88d09e17fmr21120449637.36.1736558700525; Fri, 10
 Jan 2025 17:25:00 -0800 (PST)
Date: Fri, 10 Jan 2025 17:24:50 -0800
In-Reply-To: <20250111012450.1262638-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-6-seanjc@google.com>
Subject: [PATCH 5/5] KVM: selftests: Rely on KVM_RUN_NEEDS_COMPLETION to
 complete userspace exits
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_012502_527671_6A335354 
X-CRM114-Status: GOOD (  14.49  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add selftests coverage for KVM_RUN_NEEDS_COMPLETION by redoing KVM_RUN if
and only if KVM states that completion is required.

Opportunistically rename the helper to replace "io" with "exit", as exits
that require completion are no longer limited to I/O.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h            | 8 ++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c                | 4 ++++
 tools/testing/selftests/kvm/lib/ucall_common.c            | 2 +-
 tools/testing/selftests/kvm/lib/x86/processor.c           | 8 +-------
 tools/testing/selftests/kvm/x86/triple_fault_event_test.c | 3 +--
 5 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 78fd597c1b60..86e1850e4e49 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -29,6 +29,8 @@
 
 #define NSEC_PER_SEC 1000000000L
 
+extern bool kvm_has_needs_completion;
+
 struct userspace_mem_region {
 	struct kvm_userspace_memory_region2 region;
 	struct sparsebit *unused_phy_pages;
@@ -634,9 +636,11 @@ static inline int __vcpu_run(struct kvm_vcpu *vcpu)
 
 void vcpu_run_immediate_exit(struct kvm_vcpu *vcpu);
 
-static inline void vcpu_run_complete_io(struct kvm_vcpu *vcpu)
+static inline void vcpu_run_complete_exit(struct kvm_vcpu *vcpu)
 {
-	vcpu_run_immediate_exit(vcpu);
+	if (!kvm_has_needs_completion ||
+	    (vcpu->run->flags & KVM_RUN_NEEDS_COMPLETION))
+		vcpu_run_immediate_exit(vcpu);
 }
 
 struct kvm_reg_list *vcpu_get_reg_list(struct kvm_vcpu *vcpu);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index c9a33766f673..95ac9b981049 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -19,6 +19,8 @@
 
 #define KVM_UTIL_MIN_PFN	2
 
+bool kvm_has_needs_completion;
+
 uint32_t guest_random_seed;
 struct guest_random_state guest_rng;
 static uint32_t last_guest_seed;
@@ -2253,6 +2255,8 @@ void __attribute((constructor)) kvm_selftest_init(void)
 	/* Tell stdout not to buffer its content. */
 	setbuf(stdout, NULL);
 
+	kvm_has_needs_completion = kvm_check_cap(KVM_CAP_NEEDS_COMPLETION);
+
 	guest_random_seed = last_guest_seed = random();
 	pr_info("Random seed: 0x%x\n", guest_random_seed);
 
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 42151e571953..125584a94ba8 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -154,7 +154,7 @@ uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 			    "Guest failed to allocate ucall struct");
 
 		memcpy(uc, addr, sizeof(*uc));
-		vcpu_run_complete_io(vcpu);
+		vcpu_run_complete_exit(vcpu);
 	} else {
 		memset(uc, 0, sizeof(*uc));
 	}
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index bd5a802fa7a5..1db4764e413b 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1077,13 +1077,7 @@ struct kvm_x86_state *vcpu_save_state(struct kvm_vcpu *vcpu)
 			    nested_size, sizeof(state->nested_));
 	}
 
-	/*
-	 * When KVM exits to userspace with KVM_EXIT_IO, KVM guarantees
-	 * guest state is consistent only after userspace re-enters the
-	 * kernel with KVM_RUN.  Complete IO prior to migrating state
-	 * to a new VM.
-	 */
-	vcpu_run_complete_io(vcpu);
+	vcpu_run_complete_exit(vcpu);
 
 	state = malloc(sizeof(*state) + msr_list->nmsrs * sizeof(state->msrs.entries[0]));
 	TEST_ASSERT(state, "-ENOMEM when allocating kvm state");
diff --git a/tools/testing/selftests/kvm/x86/triple_fault_event_test.c b/tools/testing/selftests/kvm/x86/triple_fault_event_test.c
index 56306a19144a..82d732788bc1 100644
--- a/tools/testing/selftests/kvm/x86/triple_fault_event_test.c
+++ b/tools/testing/selftests/kvm/x86/triple_fault_event_test.c
@@ -97,8 +97,7 @@ int main(void)
 	events.flags |= KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
 	events.triple_fault.pending = true;
 	vcpu_events_set(vcpu, &events);
-	run->immediate_exit = true;
-	vcpu_run_complete_io(vcpu);
+	vcpu_run_complete_exit(vcpu);
 
 	vcpu_events_get(vcpu, &events);
 	TEST_ASSERT(events.flags & KVM_VCPUEVENT_VALID_TRIPLE_FAULT,
-- 
2.47.1.613.gc27f4b7a9f-goog


