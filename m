Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D18C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+9CTldHkmPcTJwS5mSWfk0XaYsDahSdFAriIqs5uQo=; b=dZuC18qiCWcOJ74qFtVWLA9W7+
	dknU/KwWB59DaN5coNxeJwpDoZbyvqopCiA8QSYTfouCpvYJOtHEFqGNVug2gm+hpABKwUsRm2wzr
	V8xBpqH7VICkXxmiXWhAJAYdk7C2PMp4zUwjcvz0r3zngUIgbMumsHMWrCHxAY4ciyVEFcyuKmkWD
	g09duh1pWqkEIagtlN4lF91QancsoDc/uKzkflFjMPHPCNut1cUPQw47dqqYx82MbZR/AW4FEyP7w
	b9xsI+1HZBHU3F7i+F2NxepW9IEwfzrmu1f+ipGCiY61AcRMpiLDxZiQrebE8uaQwDXWWgHdVkd+v
	Z1wezznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptMC-0000000DVVG-2fTx;
	Fri, 31 Jul 2026 19:57:24 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLJ-0000000DUtj-49HC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:31 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so25383465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527788; x=1786132588; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t+9CTldHkmPcTJwS5mSWfk0XaYsDahSdFAriIqs5uQo=;
        b=g+Jb/EzNrurvhmIDaep18qM5G6XzBZaJQtVVxFMsZBdcZZEFv5ap+sRP+1VA+pm847
         yPL2ciDz6Mprw0cE/v8UpDxtwOJkmuhIQt1w3CPbcJ7dqGySL88pCUGjsLayAZc6j+8n
         00RCnKk6fd4ovCkCwAi9RGbyJuei80CrC75GpZNSCsydAT5QjhEG2aFXf9VR9bTdx49v
         ZRzhuydxpGG8+mm9byRmHyaCDCdQI/Z+zEbER9hiWcw2tAMkfn+paNuOxudzPqAznNrQ
         h2Z11X99uE09XpBS4Tqg2icwChH0V+dzs5XCP2D0njc3Pal3cWdBjfTTv+aJ7xPrWO8O
         TMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527788; x=1786132588;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+9CTldHkmPcTJwS5mSWfk0XaYsDahSdFAriIqs5uQo=;
        b=q7j2pDivK+3OqZwHw4QGtWsw1Z7Q/WKdTEbpYng8MdW428GlzX50+H4/0J65X1QvVF
         fwl3cAy1Jkr8fPon5+A8qjFM8w4tofzPTmauo5wPyaTf1/IId5HSCG9dYdGDQIYBLjtV
         AQQbGmWjWsaJREmWmy8ZklVCFivFTudQB1iYD1JeeuVg90mgBxd0F3ixY9AwNqtqDuI9
         Wo1PrDyQ65dZlF+gd9hUj1iQKrKRDNL8Yh4hfNnO6lPRXQ8hnDEWA5pk4AeA1gbieimY
         InyV+4abz53CHyzsvpx8S9AsLI+hi2TJ8+2NyHESHr7nlHZKRaY5ZtWgfbxfFf1bNQ3+
         +PNA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4iRFw0143Ye+8gaasSpwAlH4yxabGkKmGnBZhXeZH+IKRzaQ5cPI9yo0IshBvg+9Pvfgbn/1GCgF7acyc4ikH@lists.infradead.org
X-Gm-Message-State: AOJu0YzKaVewIzGmTE3b0HZEckqRnSD1itKaSAErfAXjPbJT+jJd1wAe
	jbEF8xkME6dSQufv9IK8ydiLrxE1trwr2Y+pRwqo0WlcH63HL1lH092EH8ceTvlYMK2QcvjI3E4
	h4I/Bow==
X-Received: from plbj20.prod.google.com ([2002:a17:903:4654:b0:2c6:be9a:d6c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:26cd:b0:2cf:82e6:a5
 with SMTP id d9443c01a7336-2d0521bbfddmr11886345ad.13.1785527787901; Fri, 31
 Jul 2026 12:56:27 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:10 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-11-seanjc@google.com>
Subject: [PATCH v3 10/12] KVM: selftests: Add helper APIs to cancel+join pthreads
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
X-CRM114-CacheID: sfid-20260731_125630_073122_9853568B 
X-CRM114-Status: GOOD (  13.87  )
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
index d6c18e13b9c8..c0657e54aee5 100644
--- a/tools/testing/selftests/kvm/include/kvm_syscalls.h
+++ b/tools/testing/selftests/kvm/include/kvm_syscalls.h
@@ -104,6 +104,30 @@ __KVM_SYSCALL_DEFINE(pthread_create, 4, pthread_t *, thread,
 __KVM_SYSCALL_DEFINE(pthread_join, 2, pthread_t, thread, void **, thread_return);
 __KVM_SYSCALL_DEFINE(pthread_cancel, 1, pthread_t, thread);
 
+static inline void __kvm_pthread_cancel_join(pthread_t thread, void **r)
+{
+	kvm_pthread_cancel(thread);
+	kvm_pthread_join(thread, r);
+}
+
+static inline void kvm_pthread_cancel_join(pthread_t thread)
+{
+	__kvm_pthread_cancel_join(thread, NULL);
+}
+
+/*
+ * Cancel+Join a pthread that was configured with PTHREAD_CANCEL_ASYNCHRONOUS
+ * and is expected to exit only in response to cancellation.
+ */
+static inline void kvm_pthread_cancel_join_async(pthread_t thread)
+{
+	void *r;
+
+	__kvm_pthread_cancel_join(thread, &r);
+	TEST_ASSERT(r == PTHREAD_CANCELED,
+		    "expected retval=%p, got %p", PTHREAD_CANCELED, r);
+}
+
 #define kvm_free_fd(fd)		\
 do {				\
 	kvm_close(fd);		\
diff --git a/tools/testing/selftests/kvm/x86/hyperv_ipi.c b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
index d2efb1043534..a2fc0bca8011 100644
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
+	kvm_pthread_cancel_join_async(threads[0]);
+	kvm_pthread_cancel_join_async(threads[1]);
 	kvm_vm_free(vm);
 
 	return 0;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index e4fc9bb6f329..dc9d40830a7f 100644
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
+	kvm_pthread_cancel_join_async(threads[0]);
+	kvm_pthread_cancel_join_async(threads[1]);
 	kvm_vm_free(vm);
 
 	return 0;
diff --git a/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c b/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c
index e3e397f32bff..6252a96320ee 100644
--- a/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c
+++ b/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c
@@ -65,8 +65,7 @@ int main(void)
 		vcpu_set_msr(vcpuN, MSR_IA32_APICBASE, LAPIC_DISABLED);
 	}
 
-	kvm_pthread_cancel(thread);
-	kvm_pthread_join(thread, NULL);
+	kvm_pthread_cancel_join(thread);
 
 	kvm_vm_free(vm);
 
diff --git a/tools/testing/selftests/kvm/x86/sync_regs_test.c b/tools/testing/selftests/kvm/x86/sync_regs_test.c
index 99a5bbeffc5d..ed0c21b427c9 100644
--- a/tools/testing/selftests/kvm/x86/sync_regs_test.c
+++ b/tools/testing/selftests/kvm/x86/sync_regs_test.c
@@ -199,8 +199,7 @@ static void race_sync_regs(struct kvm_vcpu *vcpu, void *racer)
 		}
 	}
 
-	kvm_pthread_cancel(thread);
-	kvm_pthread_join(thread, NULL);
+	kvm_pthread_cancel_join(thread);
 
 	kvm_x86_state_cleanup(state);
 }
diff --git a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
index 33e78b284c67..469e3ab16460 100644
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
+	kvm_pthread_cancel_join_async(threads[0]);
+	kvm_pthread_cancel_join_async(threads[1]);
 
 	/*
 	 * If the host support Idle HLT, i.e. KVM *might* be using Idle HLT,
diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 3ec5e67b21ef..aaa414c677ad 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -947,8 +947,7 @@ int main(int argc, char *argv[])
 				TEST_ASSERT(!evtchn_irq_expected,
 					    "Expected event channel IRQ but it didn't happen");
 
-				kvm_pthread_cancel(thread);
-				kvm_pthread_join(thread, 0);
+				kvm_pthread_cancel_join(thread);
 				goto done;
 
 			case TEST_GUEST_SAW_IRQ:
-- 
2.55.0.508.g3f0d502094-goog


