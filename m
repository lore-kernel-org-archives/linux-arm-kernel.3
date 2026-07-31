Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BD3C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT44MxQUWgN2yFdZkSrr/Ua/CnkjLi1Rcv3VTroVkdU=; b=nDGfAjm8iqWq9wNzHjMEMbFzTd
	cD8SOFQqHVq1oev/tcaTQYkmEQ521GLebdEB0ssgtuj/VqEj81qT3Ri79dtr/aDdrhQN+PiiEuaD/
	Kh2L5mvpSTkERqf+dIrCoQY9BU/kQxO8dclH7cFbqzU7MthRMQG80BhFQm6NOtE9mcjVPCVa3CRvQ
	ZlCTIBGe0XKsN3UDPJj5yy2+mnJuVXrBPbmYfNBTNprI4iKqS5Fy7kQIuKggGQpX2LzDNCzGzu+vk
	qhr7XYfxQTxHzRnqCi+jlno4yFXHBSFd17keLHyrx/Zhcj/5nBF0XYFVbbwMbCJhhClC8BTA6sqAL
	8Yz1OLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptMC-0000000DVUz-25bC;
	Fri, 31 Jul 2026 19:57:24 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLI-0000000DUsd-2jZ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:30 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso1929079b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527787; x=1786132587; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WT44MxQUWgN2yFdZkSrr/Ua/CnkjLi1Rcv3VTroVkdU=;
        b=D5Y3mr1BOqCdbdsVAl3Jb/fDa/XwvEnNaOS2aMeL86rnEK5gDIY9Qkou0LP6ABYM2k
         Av2bACpADxPAbKkzmN4x9dj+gG3JII6lcwMkc1GgWUZifFVPmUTw+CWdEoYUbcP3Q93Y
         vH66YOHRdnAwtLHUOzjUiu0MirzbYL9foUBokDXlt32YqcXqx3zpOwS5Wum9UfXw6/uW
         Oe7pWX80wAZbR4tumkPir4Xc+rT7vDugQ2ANmoV+PwWpFm+MQTie0jywKim2hySUo1zh
         TYeHQLohZeoWiHyLh7gcw0aaa8h/FL0gU2b1Zc5x/AdmAbhVwcRB7we8Wp3tFj5tysCA
         ZYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527787; x=1786132587;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WT44MxQUWgN2yFdZkSrr/Ua/CnkjLi1Rcv3VTroVkdU=;
        b=X7wDd2x89FjI819dztihS8g6Ma2EbMZuKJwGEdGJtKeZ4FqTyFDNTmMRWXOPQbgPOg
         s+NUs2Qn7Oz0k12utsDpBOb5SaFxbMOXNd8taEsmVT48Xp6tvOZMy9JdM9LffrhtFjZ8
         y6b6eg+4cQRo25NkrW2ljj7t7cw7hp5xTY4u3LMdEwq72+6KkGUL14ioQ+gn+1ZKohYc
         h4kCrhveuKfwDV57gztF71OL6JHs0gWCnsqLw15reueiX/GuYS99qta71h+vvQWLHQ0W
         QLhmuAYJxB50NXrVRf1FNcNlGtlt7wb38lZg54eZzYlXaMcJY8UhjOG4G9hRHHuU8uVl
         fYLA==
X-Forwarded-Encrypted: i=1; AHgh+RofIHMy9dYGqKgaU23VB9EH2co6b0bqitMtmyO1CncFT2wQ0Qh/wuG/XZWZRjC3TJEYhgMxgSMZ00BSRdiYYZFX@lists.infradead.org
X-Gm-Message-State: AOJu0YyQe9AnTf95YMOOBD5Q1SwIX+EMALqsmqXsnS5zLy1Y7bQXSd3P
	ZrIFT4BeCIjpQbs0uuuVrWfMqNoz5Sd+4LWzUj0PqRmuEH1J7sNn7h6DA1W/wVzCFuILLX6GBWK
	fKk3cLQ==
X-Received: from pfw13.prod.google.com ([2002:a05:6a00:a26d:b0:84a:1bf6:cb4a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:92a6:b0:848:76c4:fba9
 with SMTP id d2e1a72fcca58-84ee478e97fmr774656b3a.7.1785527786711; Fri, 31
 Jul 2026 12:56:26 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:09 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-10-seanjc@google.com>
Subject: [PATCH v3 09/12] KVM: selftests: Add KVM syscall wrappers for pthread_{cancel,join}()
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
X-CRM114-CacheID: sfid-20260731_125628_812436_D7A5ACAA 
X-CRM114-Status: GOOD (  15.13  )
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

Add and use KVM wrappers for pthread_{cancel,join}() so that selftests
don't need to manually assert that the syscalls succeeded.

Note, the vast majority tests don't actually assert success, but they all
obviously rely on the syscall to succeed.

Other than explicitly failing if a syscall fails, no functional change
intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arch_timer.c             |  4 ++--
 tools/testing/selftests/kvm/arm64/vgic_irq.c         |  4 ++--
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c  |  4 ++--
 tools/testing/selftests/kvm/dirty_log_test.c         |  2 +-
 tools/testing/selftests/kvm/include/kvm_syscalls.h   |  2 ++
 tools/testing/selftests/kvm/irq_test.c               |  2 +-
 tools/testing/selftests/kvm/irqfd_test.c             |  2 +-
 tools/testing/selftests/kvm/kvm_page_table_test.c    |  2 +-
 tools/testing/selftests/kvm/lib/memstress.c          |  2 +-
 tools/testing/selftests/kvm/lib/userfaultfd_util.c   |  3 +--
 tools/testing/selftests/kvm/memslot_perf_test.c      |  2 +-
 tools/testing/selftests/kvm/mmu_stress_test.c        |  2 +-
 tools/testing/selftests/kvm/pre_fault_memory_test.c  |  2 +-
 tools/testing/selftests/kvm/rseq_test.c              |  2 +-
 tools/testing/selftests/kvm/s390/memop.c             |  2 +-
 tools/testing/selftests/kvm/set_memory_region_test.c |  4 ++--
 tools/testing/selftests/kvm/steal_time.c             |  2 +-
 tools/testing/selftests/kvm/x86/hyperv_ipi.c         | 10 ++--------
 tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c   | 10 ++--------
 .../selftests/kvm/x86/private_mem_conversions_test.c |  2 +-
 .../selftests/kvm/x86/private_mem_kvm_exits_test.c   |  2 +-
 .../testing/selftests/kvm/x86/recalc_apic_map_test.c |  4 ++--
 tools/testing/selftests/kvm/x86/sev_migrate_tests.c  |  2 +-
 tools/testing/selftests/kvm/x86/sync_regs_test.c     |  4 ++--
 tools/testing/selftests/kvm/x86/tsc_scaling_sync.c   |  2 +-
 tools/testing/selftests/kvm/x86/xapic_ipi_test.c     | 12 ++----------
 tools/testing/selftests/kvm/x86/xen_shinfo_test.c    |  8 ++------
 27 files changed, 38 insertions(+), 61 deletions(-)

diff --git a/tools/testing/selftests/kvm/arch_timer.c b/tools/testing/selftests/kvm/arch_timer.c
index a6a66b5b7ea9..03160ad666f5 100644
--- a/tools/testing/selftests/kvm/arch_timer.c
+++ b/tools/testing/selftests/kvm/arch_timer.c
@@ -158,10 +158,10 @@ static void test_run(struct kvm_vm *vm)
 	}
 
 	for (i = 0; i < test_args.nr_vcpus; i++)
-		pthread_join(pt_vcpu_run[i], NULL);
+		kvm_pthread_join(pt_vcpu_run[i], NULL);
 
 	if (test_args.migration_freq_ms)
-		pthread_join(pt_vcpu_migration, NULL);
+		kvm_pthread_join(pt_vcpu_migration, NULL);
 
 	bitmap_free(vcpu_done_map);
 }
diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 2d6f20d5c117..3cb85932ee85 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -1007,8 +1007,8 @@ static void test_vgic_two_cpus(void *gcode)
 	kvm_pthread_create(&thr[0], NULL, test_vcpu_run, vcpus[0]);
 	kvm_pthread_create(&thr[1], NULL, test_vcpu_run, vcpus[1]);
 
-	pthread_join(thr[0], NULL);
-	pthread_join(thr[1], NULL);
+	kvm_pthread_join(thr[0], NULL);
+	kvm_pthread_join(thr[1], NULL);
 
 	close(gic_fd);
 	kvm_vm_free(vm);
diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 549e0547d905..9a69c439a0f8 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -321,13 +321,13 @@ static void run_test(void)
 	clock_gettime(CLOCK_MONOTONIC, &start);
 
 	for (i = 0; i < nr_devices; i++)
-		pthread_join(lpi_threads[i], NULL);
+		kvm_pthread_join(lpi_threads[i], NULL);
 
 	delta = timespec_elapsed(start);
 	write_guest_global(vm, test_data.request_vcpus_stop, true);
 
 	for (i = 0; i < nr_vcpus; i++)
-		pthread_join(vcpu_threads[i], NULL);
+		kvm_pthread_join(vcpu_threads[i], NULL);
 
 	report_stats(delta);
 }
diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index ca22e5f09ac2..af5eb0334a74 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -805,7 +805,7 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	WRITE_ONCE(host_quit, true);
 	sem_post(&sem_vcpu_cont);
 
-	pthread_join(vcpu_thread, NULL);
+	kvm_pthread_join(vcpu_thread, NULL);
 
 	pr_info("Total bits checked: dirty (%lu), clear (%lu)\n",
 		host_dirty_count, host_clear_count);
diff --git a/tools/testing/selftests/kvm/include/kvm_syscalls.h b/tools/testing/selftests/kvm/include/kvm_syscalls.h
index e75be8378779..d6c18e13b9c8 100644
--- a/tools/testing/selftests/kvm/include/kvm_syscalls.h
+++ b/tools/testing/selftests/kvm/include/kvm_syscalls.h
@@ -101,6 +101,8 @@ __KVM_SYSCALL_DEFINE(sched_setaffinity, 3, pid_t, pid, size_t, cpusetsize, cpu_s
 typedef void *(*pthread_fn_t)(void *);
 __KVM_SYSCALL_DEFINE(pthread_create, 4, pthread_t *, thread,
 		     const pthread_attr_t *, attr, pthread_fn_t, fn, void *, arg);
+__KVM_SYSCALL_DEFINE(pthread_join, 2, pthread_t, thread, void **, thread_return);
+__KVM_SYSCALL_DEFINE(pthread_cancel, 1, pthread_t, thread);
 
 #define kvm_free_fd(fd)		\
 do {				\
diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 7da5f8d75e85..168c52734fef 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -356,7 +356,7 @@ int main(int argc, char **argv)
 	WRITE_AND_SYNC_TO_GUEST(vm, done, true);
 
 	for (i = 0; i < nr_vcpus; i++)
-		pthread_join(vcpu_threads[i], NULL);
+		kvm_pthread_join(vcpu_threads[i], NULL);
 
 	return 0;
 }
diff --git a/tools/testing/selftests/kvm/irqfd_test.c b/tools/testing/selftests/kvm/irqfd_test.c
index 8b39144a2834..ebb2478878de 100644
--- a/tools/testing/selftests/kvm/irqfd_test.c
+++ b/tools/testing/selftests/kvm/irqfd_test.c
@@ -139,5 +139,5 @@ int main(int argc, char *argv[])
 	}
 
 	WRITE_ONCE(done, true);
-	pthread_join(racing_thread, NULL);
+	kvm_pthread_join(racing_thread, NULL);
 }
diff --git a/tools/testing/selftests/kvm/kvm_page_table_test.c b/tools/testing/selftests/kvm/kvm_page_table_test.c
index 8222bdb63e49..974813ea8953 100644
--- a/tools/testing/selftests/kvm/kvm_page_table_test.c
+++ b/tools/testing/selftests/kvm/kvm_page_table_test.c
@@ -413,7 +413,7 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	}
 
 	for (i = 0; i < nr_vcpus; i++)
-		pthread_join(vcpu_threads[i], NULL);
+		kvm_pthread_join(vcpu_threads[i], NULL);
 
 	ret = sem_destroy(&test_stage_updated);
 	TEST_ASSERT(ret == 0, "Error in sem_destroy");
diff --git a/tools/testing/selftests/kvm/lib/memstress.c b/tools/testing/selftests/kvm/lib/memstress.c
index 0bfa623ce9b5..2864562f57b4 100644
--- a/tools/testing/selftests/kvm/lib/memstress.c
+++ b/tools/testing/selftests/kvm/lib/memstress.c
@@ -312,7 +312,7 @@ void memstress_join_vcpu_threads(int nr_vcpus)
 	WRITE_ONCE(memstress_args.stop_vcpus, true);
 
 	for (i = 0; i < nr_vcpus; i++)
-		pthread_join(vcpu_threads[i].thread, NULL);
+		kvm_pthread_join(vcpu_threads[i].thread, NULL);
 }
 
 static void toggle_dirty_logging(struct kvm_vm *vm, int slots, bool enable)
diff --git a/tools/testing/selftests/kvm/lib/userfaultfd_util.c b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
index 4b3e3158ed87..f7ce5a6ddcc2 100644
--- a/tools/testing/selftests/kvm/lib/userfaultfd_util.c
+++ b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
@@ -187,8 +187,7 @@ void uffd_stop_demand_paging(struct uffd_desc *uffd)
 			    "Unable to write to pipefd %i for uffd_desc %p", i, uffd);
 
 	for (i = 0; i < uffd->num_readers; ++i)
-		TEST_ASSERT(!pthread_join(uffd->readers[i], NULL),
-			    "Pthread_join failed on reader %i for uffd_desc %p", i, uffd);
+		kvm_pthread_join(uffd->readers[i], NULL);
 
 	close(uffd->uffd);
 
diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index eb49305db404..e1299611be32 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -381,7 +381,7 @@ static void free_vm(struct vm_data *data)
 
 static void wait_guest_exit(struct vm_data *data)
 {
-	pthread_join(data->vcpu_thread, NULL);
+	kvm_pthread_join(data->vcpu_thread, NULL);
 }
 
 static void let_guest_run(struct sync_area *sync)
diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 9448498849ff..741e343962ed 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -409,7 +409,7 @@ int main(int argc, char *argv[])
 
 	/* Sanity check that the vCPUs actually ran. */
 	for (i = 0; i < nr_vcpus; i++)
-		pthread_join(threads[i], NULL);
+		kvm_pthread_join(threads[i], NULL);
 
 	/*
 	 * Deliberately exit without deleting the remaining memslots or closing
diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index 88287ccb9093..c57631aab3d3 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -116,7 +116,7 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
 		 */
 		if (!slot_recreated) {
 			WRITE_ONCE(data.recreate_slot, true);
-			pthread_join(slot_worker, NULL);
+			kvm_pthread_join(slot_worker, NULL);
 			slot_recreated = true;
 
 			/*
diff --git a/tools/testing/selftests/kvm/rseq_test.c b/tools/testing/selftests/kvm/rseq_test.c
index 0921b8d90d4a..b386aece68fd 100644
--- a/tools/testing/selftests/kvm/rseq_test.c
+++ b/tools/testing/selftests/kvm/rseq_test.c
@@ -312,7 +312,7 @@ int main(int argc, char *argv[])
 		    "  e.g. via cpuidle.off=1 or via -l <latency>, or run with -u to\n"
 		    "  disable this sanity check.", i);
 
-	pthread_join(migration_thread, NULL);
+	kvm_pthread_join(migration_thread, NULL);
 
 	kvm_vm_free(vm);
 
diff --git a/tools/testing/selftests/kvm/s390/memop.c b/tools/testing/selftests/kvm/s390/memop.c
index 96b32bd74009..ce8db96ccf7e 100644
--- a/tools/testing/selftests/kvm/s390/memop.c
+++ b/tools/testing/selftests/kvm/s390/memop.c
@@ -701,7 +701,7 @@ static void test_cmpxchg_key_concurrent(void)
 		}
 	}
 
-	pthread_join(thread, NULL);
+	kvm_pthread_join(thread, NULL);
 
 	MOP(t.vcpu, LOGICAL, READ, mem2, max_block, GADDR_V(mem2));
 	TEST_ASSERT(popcount_eq(*(__uint128_t *)mem1, *(__uint128_t *)mem2),
diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 12f5022bb164..dffe9654f45b 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -216,7 +216,7 @@ static void test_move_memory_region(bool disable_slot_zap_quirk)
 	/* Defered sync from when the memslot was misaligned (above). */
 	wait_for_vcpu();
 
-	pthread_join(vcpu_thread, NULL);
+	kvm_pthread_join(vcpu_thread, NULL);
 
 	kvm_vm_free(vm);
 }
@@ -302,7 +302,7 @@ static void test_delete_memory_region(bool disable_slot_zap_quirk)
 	 */
 	vm_mem_region_delete(vm, 0);
 
-	pthread_join(vcpu_thread, NULL);
+	kvm_pthread_join(vcpu_thread, NULL);
 
 	run = vcpu->run;
 
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index f5f708be5aa0..6cb1eb4c40c9 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -556,7 +556,7 @@ int main(int ac, char **av)
 		do
 			sched_yield();
 		while (get_run_delay() - run_delay < MIN_RUN_DELAY_NS);
-		pthread_join(thread, NULL);
+		kvm_pthread_join(thread, NULL);
 		run_delay = get_run_delay() - run_delay;
 		TEST_ASSERT(run_delay >= MIN_RUN_DELAY_NS,
 			    "Expected run_delay >= %ld, got %ld",
diff --git a/tools/testing/selftests/kvm/x86/hyperv_ipi.c b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
index 3cf451f3153e..d2efb1043534 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_ipi.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
@@ -225,15 +225,9 @@ static void *vcpu_thread(void *arg)
 static void cancel_join_vcpu_thread(pthread_t thread, struct kvm_vcpu *vcpu)
 {
 	void *retval;
-	int r;
 
-	r = pthread_cancel(thread);
-	TEST_ASSERT(!r, "pthread_cancel on vcpu_id=%d failed with errno=%d",
-		    vcpu->id, r);
-
-	r = pthread_join(thread, &retval);
-	TEST_ASSERT(!r, "pthread_join on vcpu_id=%d failed with errno=%d",
-		    vcpu->id, r);
+	kvm_pthread_cancel(thread);
+	kvm_pthread_join(thread, &retval);
 	TEST_ASSERT(retval == PTHREAD_CANCELED,
 		    "expected retval=%p, got %p", PTHREAD_CANCELED,
 		    retval);
diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index 87fac1968a47..e4fc9bb6f329 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -551,15 +551,9 @@ static void *vcpu_thread(void *arg)
 static void cancel_join_vcpu_thread(pthread_t thread, struct kvm_vcpu *vcpu)
 {
 	void *retval;
-	int r;
 
-	r = pthread_cancel(thread);
-	TEST_ASSERT(!r, "pthread_cancel on vcpu_id=%d failed with errno=%d",
-		    vcpu->id, r);
-
-	r = pthread_join(thread, &retval);
-	TEST_ASSERT(!r, "pthread_join on vcpu_id=%d failed with errno=%d",
-		    vcpu->id, r);
+	kvm_pthread_cancel(thread);
+	kvm_pthread_join(thread, &retval);
 	TEST_ASSERT(retval == PTHREAD_CANCELED,
 		    "expected retval=%p, got %p", PTHREAD_CANCELED,
 		    retval);
diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
index e419b08f1fa6..3aa0673f79f3 100644
--- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
@@ -418,7 +418,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, u32 nr_v
 	WRITE_ONCE(run_vcpus, true);
 
 	for (i = 0; i < nr_vcpus; i++)
-		pthread_join(threads[i], NULL);
+		kvm_pthread_join(threads[i], NULL);
 
 	kvm_vm_free(vm);
 
diff --git a/tools/testing/selftests/kvm/x86/private_mem_kvm_exits_test.c b/tools/testing/selftests/kvm/x86/private_mem_kvm_exits_test.c
index e26524fb4b50..e6d16e9d6120 100644
--- a/tools/testing/selftests/kvm/x86/private_mem_kvm_exits_test.c
+++ b/tools/testing/selftests/kvm/x86/private_mem_kvm_exits_test.c
@@ -70,7 +70,7 @@ static void test_private_access_memslot_deleted(void)
 
 	vm_mem_region_delete(vm, EXITS_TEST_SLOT);
 
-	pthread_join(vm_thread, &thread_return);
+	kvm_pthread_join(vm_thread, &thread_return);
 	exit_reason = (u32)(u64)thread_return;
 
 	TEST_ASSERT_EQ(exit_reason, KVM_EXIT_MEMORY_FAULT);
diff --git a/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c b/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c
index 13abb65620d5..e3e397f32bff 100644
--- a/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c
+++ b/tools/testing/selftests/kvm/x86/recalc_apic_map_test.c
@@ -65,8 +65,8 @@ int main(void)
 		vcpu_set_msr(vcpuN, MSR_IA32_APICBASE, LAPIC_DISABLED);
 	}
 
-	TEST_ASSERT_EQ(pthread_cancel(thread), 0);
-	TEST_ASSERT_EQ(pthread_join(thread, NULL), 0);
+	kvm_pthread_cancel(thread);
+	kvm_pthread_join(thread, NULL);
 
 	kvm_vm_free(vm);
 
diff --git a/tools/testing/selftests/kvm/x86/sev_migrate_tests.c b/tools/testing/selftests/kvm/x86/sev_migrate_tests.c
index 66c7ce49620a..de006e1c861c 100644
--- a/tools/testing/selftests/kvm/x86/sev_migrate_tests.c
+++ b/tools/testing/selftests/kvm/x86/sev_migrate_tests.c
@@ -131,7 +131,7 @@ static void test_sev_migrate_locking(void)
 		kvm_pthread_create(&pt[i], NULL, locking_test_thread, &input[i]);
 
 	for (i = 0; i < NR_LOCK_TESTING_THREADS; ++i)
-		pthread_join(pt[i], NULL);
+		kvm_pthread_join(pt[i], NULL);
 	for (i = 0; i < NR_LOCK_TESTING_THREADS; ++i)
 		kvm_vm_free(input[i].vm);
 }
diff --git a/tools/testing/selftests/kvm/x86/sync_regs_test.c b/tools/testing/selftests/kvm/x86/sync_regs_test.c
index f7228af7d594..99a5bbeffc5d 100644
--- a/tools/testing/selftests/kvm/x86/sync_regs_test.c
+++ b/tools/testing/selftests/kvm/x86/sync_regs_test.c
@@ -199,8 +199,8 @@ static void race_sync_regs(struct kvm_vcpu *vcpu, void *racer)
 		}
 	}
 
-	TEST_ASSERT_EQ(pthread_cancel(thread), 0);
-	TEST_ASSERT_EQ(pthread_join(thread, NULL), 0);
+	kvm_pthread_cancel(thread);
+	kvm_pthread_join(thread, NULL);
 
 	kvm_x86_state_cleanup(state);
 }
diff --git a/tools/testing/selftests/kvm/x86/tsc_scaling_sync.c b/tools/testing/selftests/kvm/x86/tsc_scaling_sync.c
index 54b4b8d06d3b..2a3a9bd8b338 100644
--- a/tools/testing/selftests/kvm/x86/tsc_scaling_sync.c
+++ b/tools/testing/selftests/kvm/x86/tsc_scaling_sync.c
@@ -99,7 +99,7 @@ int main(int argc, char *argv[])
 	unsigned long failures = 0;
 	for (cpu = 0; cpu < NR_TEST_VCPUS; cpu++) {
 		void *this_cpu_failures;
-		pthread_join(cpu_threads[cpu], &this_cpu_failures);
+		kvm_pthread_join(cpu_threads[cpu], &this_cpu_failures);
 		failures += (unsigned long)this_cpu_failures;
 	}
 
diff --git a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
index 271ec09c629e..33e78b284c67 100644
--- a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
+++ b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
@@ -231,17 +231,9 @@ static void *vcpu_thread(void *arg)
 static void cancel_join_vcpu_thread(pthread_t thread, struct kvm_vcpu *vcpu)
 {
 	void *retval;
-	int r;
 
-	r = pthread_cancel(thread);
-	TEST_ASSERT(r == 0,
-		    "pthread_cancel on vcpu_id=%d failed with errno=%d",
-		    vcpu->id, r);
-
-	r = pthread_join(thread, &retval);
-	TEST_ASSERT(r == 0,
-		    "pthread_join on vcpu_id=%d failed with errno=%d",
-		    vcpu->id, r);
+	kvm_pthread_cancel(thread);
+	kvm_pthread_join(thread, &retval);
 	TEST_ASSERT(retval == PTHREAD_CANCELED,
 		    "expected retval=%p, got %p", PTHREAD_CANCELED,
 		    retval);
diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 20f518fe2450..3ec5e67b21ef 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -437,7 +437,6 @@ int main(int argc, char *argv[])
 	struct kvm_vm *vm;
 	pthread_t thread;
 	bool verbose;
-	int ret;
 
 	verbose = argc > 1 && (!strncmp(argv[1], "-v", 3) ||
 			       !strncmp(argv[1], "--verbose", 10));
@@ -948,11 +947,8 @@ int main(int argc, char *argv[])
 				TEST_ASSERT(!evtchn_irq_expected,
 					    "Expected event channel IRQ but it didn't happen");
 
-				ret = pthread_cancel(thread);
-				TEST_ASSERT(ret == 0, "pthread_cancel() failed: %s", strerror(ret));
-
-				ret = pthread_join(thread, 0);
-				TEST_ASSERT(ret == 0, "pthread_join() failed: %s", strerror(ret));
+				kvm_pthread_cancel(thread);
+				kvm_pthread_join(thread, 0);
 				goto done;
 
 			case TEST_GUEST_SAW_IRQ:
-- 
2.55.0.508.g3f0d502094-goog


