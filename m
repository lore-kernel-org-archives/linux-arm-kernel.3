Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D769C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5x/8gSGAOdG58RjeR3zh9VAfNqCLNOUs74brKRK1OOI=; b=R++Aeta8j/vafpfhPOc2/15Af4
	0DwxLtQkj7a/eHsc6KzxKp1Vgk9KX3XgDc8Z/J2SOtxfufKlds26JAZV/glUIZT1LUXZ5vPei3eYW
	xlsO5Qwrgu+vY6sc4nP1fAz9N5PE4S4nmkVKS3fmtCVlT/jWF6hqBGQwa4OeopFthvoc53FI+Tj70
	6eVkKiiXhiGTsYjPpHKPd34bRreA8fXZV1srXvnA05l5RQur1EKQ/Ktg3n7NhXNR92D1lDD3lkUqm
	Sf076sbY/IytRuZjS0urNGHkdIshXZyUc+LDqAoB+lWqZk0ynZC5eRyFAd5SzQCwUP00YTN0QT4H8
	YRsMDCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWI1-0000000BDo3-1Wh2;
	Thu, 30 Jul 2026 19:19:33 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHp-0000000BDfo-3izG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:19:23 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84885a4fcabso234992b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439160; x=1786043960; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5x/8gSGAOdG58RjeR3zh9VAfNqCLNOUs74brKRK1OOI=;
        b=ZjOenQg71P8zjI1ysVBHfoQidG99q3muw+8dP8Zx/Asa7U80WSUF6LzzkbTz529aRw
         93sgObOpfGFF7oZJsXQXUzwnx/YTauLQVJeLtoWFJ5wRfwYnpL3CgjIuAyX3BLNZfMJK
         VTH/3SA9DkbXKxMkpqCHA+fcZDeUnLkg9uGYv8tMPJRQTE99tTBnM80LfOzNVKr5X9/W
         6Z3SfW+VLv82ObUfGrL5mMYdrBu6p5eY4founbA4/VJPdePsMa+Y8Cco0mmupW+WWiav
         qz/l3drLzV8zL/qmHHma+s8ko2CdB1YZsIVJn2c4iV3fBnVd4WrNLItDZ9NSo8PNOLX8
         xv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439160; x=1786043960;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5x/8gSGAOdG58RjeR3zh9VAfNqCLNOUs74brKRK1OOI=;
        b=stgWy0d9QEtZIVh12uPya9r58TMpBqfBkxEJ2b7UsmUv+nQBiPZopW8chFIneK3FG+
         KJ2aj3tYNkF4ncXDHGDAQQEvL96stMdOBvT0ZtdVsUwiBFP65yE2ka8bnNxVrwgYO5Gb
         9gVb+u54NKiuGFrl6EFpo5zjekONPGUiNVxSDvfJUWyM2URUR+Q2ubxtPiyUN/mXDYh7
         qvQG3LQyTjdSbAcp47jQSrRTTKSoSM8FaCQ4VHYZDXAFZQc+xht5wdShqGK4uBpKGzVE
         FPNsKjg2ES6sNCHJxA6cxIuBnxjaaWi+WuKSEO8ZirletcTRi9w5GSxGOahEvSfIlsFN
         m6Ew==
X-Forwarded-Encrypted: i=1; AHgh+RqXIsVV3HBOt4RNL0t6+eVBkNYN8ZK/IiCpSnyhPKcfevlVD4P1Ioxvb26tovsVW0NmzZ+KN5Y44ieTunNohfmk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6o1EYwQJEki3NCpCD+k51ZFkDL8lMzEFXwBh0r+Ub9Nb+jCt6
	MmKmfG6J26/TDozFbTS0G2Et2YAwKbh7JC3PwtnV1OU/RbHkmxjiTWJIT6mmtI0TZQYESoI49d/
	0h5jhmw==
X-Received: from pflr18.prod.google.com ([2002:aa7:9892:0:b0:84e:3a87:b559])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88c9:0:b0:84e:4598:7da3
 with SMTP id d2e1a72fcca58-84ebc44263fmr3505224b3a.74.1785439159723; Thu, 30
 Jul 2026 12:19:19 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:19:06 -0700
In-Reply-To: <20260730191908.2084803-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260730191908.2084803-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730191908.2084803-8-seanjc@google.com>
Subject: [PATCH 7/9] KVM: selftests: Add helper APIs to cancel+join pthreads
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_121921_982820_E7709FE5 
X-CRM114-Status: GOOD (  13.80  )
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

Deduplicate test code that does cancel()+join() on pthreads by adding a
collection of syscall wrappers.  The tests that asynchronously cancel
pthreads, i.e. use PTHREAD_CANCEL_ASYNCHRONOUS, are particularly ugly,
especially since it's not immediately obvious why those tests assert on
the thread being CANCELED, whereas others do not.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_syscalls.h      | 24 +++++++++++++++++++
 tools/testing/selftests/kvm/x86/hyperv_ipi.c  | 15 ++----------
 .../selftests/kvm/x86/hyperv_tlb_flush.c      | 15 ++----------
 .../selftests/kvm/x86/recalc_apic_map_test.c  |  3 +--
 .../selftests/kvm/x86/sync_regs_test.c        |  3 +--
 .../selftests/kvm/x86/xapic_ipi_test.c        | 15 ++----------
 .../selftests/kvm/x86/xen_shinfo_test.c       |  3 +--
 7 files changed, 33 insertions(+), 45 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_syscalls.h b/tools/testing/selftests/kvm/include/kvm_syscalls.h
index abfd89372f19..002b5a4e59eb 100644
--- a/tools/testing/selftests/kvm/include/kvm_syscalls.h
+++ b/tools/testing/selftests/kvm/include/kvm_syscalls.h
@@ -103,6 +103,30 @@ __KVM_SYSCALL_DEFINE(pthread_create, 4, pthread_t *, thread,
 __KVM_SYSCALL_DEFINE(pthread_join, 2, pthread_t, thread, void **, thread_return);
 __KVM_SYSCALL_DEFINE(pthread_cancel, 1, pthread_t, thread);
 
+static inline void __kvm_cancel_join_pthread(pthread_t thread, void **r)
+{
+	kvm_pthread_cancel(thread);
+	kvm_pthread_join(thread, r);
+}
+
+static inline void kvm_cancel_join_pthread(pthread_t thread)
+{
+	__kvm_cancel_join_pthread(thread, NULL);
+}
+
+/*
+ * Cancel+Join a pthread that was configured with PTHREAD_CANCEL_ASYNCHRONOUS
+ * and is expected to exit only in response to cancellation.
+ */
+static inline void kvm_cancel_join_pthread_async(pthread_t thread)
+{
+	void *r;
+
+	__kvm_cancel_join_pthread(thread, &r);
+	TEST_ASSERT(r == PTHREAD_CANCELED,
+		    "expected retval=%p, got %p", PTHREAD_CANCELED, r);
+}
+
 #define kvm_free_fd(fd)		\
 do {				\
 	kvm_close(fd);		\
diff --git a/tools/testing/selftests/kvm/x86/hyperv_ipi.c b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
index d2efb1043534..fe38cc4cba05 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_ipi.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
@@ -222,17 +222,6 @@ static void *vcpu_thread(void *arg)
 	return NULL;
 }
 
-static void cancel_join_vcpu_thread(pthread_t thread, struct kvm_vcpu *vcpu)
-{
-	void *retval;
-
-	kvm_pthread_cancel(thread);
-	kvm_pthread_join(thread, &retval);
-	TEST_ASSERT(retval == PTHREAD_CANCELED,
-		    "expected retval=%p, got %p", PTHREAD_CANCELED,
-		    retval);
-}
-
 int main(int argc, char *argv[])
 {
 	struct kvm_vm *vm;
@@ -293,8 +282,8 @@ int main(int argc, char *argv[])
 	}
 
 done:
-	cancel_join_vcpu_thread(threads[0], vcpu[1]);
-	cancel_join_vcpu_thread(threads[1], vcpu[2]);
+	kvm_cancel_join_pthread_async(threads[0]);
+	kvm_cancel_join_pthread_async(threads[1]);
 	kvm_vm_free(vm);
 
 	return 0;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index e4fc9bb6f329..84f22f39c8f2 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -548,17 +548,6 @@ static void *vcpu_thread(void *arg)
 	return NULL;
 }
 
-static void cancel_join_vcpu_thread(pthread_t thread, struct kvm_vcpu *vcpu)
-{
-	void *retval;
-
-	kvm_pthread_cancel(thread);
-	kvm_pthread_join(thread, &retval);
-	TEST_ASSERT(retval == PTHREAD_CANCELED,
-		    "expected retval=%p, got %p", PTHREAD_CANCELED,
-		    retval);
-}
-
 int main(int argc, char *argv[])
 {
 	struct kvm_vm *vm;
@@ -652,8 +641,8 @@ int main(int argc, char *argv[])
 	}
 
 done:
-	cancel_join_vcpu_thread(threads[0], vcpu[1]);
-	cancel_join_vcpu_thread(threads[1], vcpu[2]);
+	kvm_cancel_join_pthread_async(threads[0]);
+	kvm_cancel_join_pthread_async(threads[1]);
 	kvm_vm_free(vm);
 
 	return 0;
diff --git a/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c b/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c
index e3e397f32bff..7a0bd9f7ba6c 100644
--- a/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c
+++ b/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c
@@ -65,8 +65,7 @@ int main(void)
 		vcpu_set_msr(vcpuN, MSR_IA32_APICBASE, LAPIC_DISABLED);
 	}
 
-	kvm_pthread_cancel(thread);
-	kvm_pthread_join(thread, NULL);
+	kvm_cancel_join_pthread(thread);
 
 	kvm_vm_free(vm);
 
diff --git a/tools/testing/selftests/kvm/x86/sync_regs_test.c b/tools/testing/selftests/kvm/x86/sync_regs_test.c
index 99a5bbeffc5d..9d76c2ed784b 100644
--- a/tools/testing/selftests/kvm/x86/sync_regs_test.c
+++ b/tools/testing/selftests/kvm/x86/sync_regs_test.c
@@ -199,8 +199,7 @@ static void race_sync_regs(struct kvm_vcpu *vcpu, void *racer)
 		}
 	}
 
-	kvm_pthread_cancel(thread);
-	kvm_pthread_join(thread, NULL);
+	kvm_cancel_join_pthread(thread);
 
 	kvm_x86_state_cleanup(state);
 }
diff --git a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
index 33e78b284c67..78e7aae8fab8 100644
--- a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
+++ b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
@@ -228,17 +228,6 @@ static void *vcpu_thread(void *arg)
 	return NULL;
 }
 
-static void cancel_join_vcpu_thread(pthread_t thread, struct kvm_vcpu *vcpu)
-{
-	void *retval;
-
-	kvm_pthread_cancel(thread);
-	kvm_pthread_join(thread, &retval);
-	TEST_ASSERT(retval == PTHREAD_CANCELED,
-		    "expected retval=%p, got %p", PTHREAD_CANCELED,
-		    retval);
-}
-
 void do_migrations(struct test_data_page *data, int run_secs, int delay_usecs,
 		   u64 *pipis_rcvd)
 {
@@ -450,8 +439,8 @@ int main(int argc, char *argv[])
 	/*
 	 * Cancel threads and wait for them to stop.
 	 */
-	cancel_join_vcpu_thread(threads[0], params[0].vcpu);
-	cancel_join_vcpu_thread(threads[1], params[1].vcpu);
+	kvm_cancel_join_pthread_async(threads[0]);
+	kvm_cancel_join_pthread_async(threads[1]);
 
 	/*
 	 * If the host support Idle HLT, i.e. KVM *might* be using Idle HLT,
diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 3ec5e67b21ef..a226a2fd61d9 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -947,8 +947,7 @@ int main(int argc, char *argv[])
 				TEST_ASSERT(!evtchn_irq_expected,
 					    "Expected event channel IRQ but it didn't happen");
 
-				kvm_pthread_cancel(thread);
-				kvm_pthread_join(thread, 0);
+				kvm_cancel_join_pthread(thread);
 				goto done;
 
 			case TEST_GUEST_SAW_IRQ:
-- 
2.55.0.508.g3f0d502094-goog


