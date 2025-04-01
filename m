Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDB2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 21:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2Nlc70kYoEVZE2tPVykbAae+uvb1zAI7sPIwdhW1oA=; b=yRLOX3B8L47Sqret8TuMQXBWB2
	OWCRhlZFi7H383BgJAAjnSCcwO4R4d95204X5qABdAydeGHK4X1G9XEPZflgPLa/LWUMGvqSFdTqI
	dApeisXW2HYbZIRG4RsRXS4so6vhCuXj+oJOfYI+3/P/URhfh0bz7aF/+lwzDQ5MmbnDLyT5xHbRU
	DhhZm3/SqlgD1J33Rc9VKG4PwWuEo9x4hMRu2veE1HOh2Y+DAPMjblCj9oFxQbfbqwAzkYqVo3e30
	xzlRy0KKctpxOJD4oZ4rIkdEPxae1uDyKb0+HaINPdmE/p5IC0x6alxhHs18+q8LjMYkIMp89GLZd
	V7O0zy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzisa-00000004PeB-0GRZ;
	Tue, 01 Apr 2025 21:10:40 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVp-00000004LLh-1yVi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:10 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so9862731a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540428; x=1744145228; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=m2Nlc70kYoEVZE2tPVykbAae+uvb1zAI7sPIwdhW1oA=;
        b=pajm58H3z+Zzcee+E8+x0nCz5MIUd+X/485sj5goT8p0Bcv5YNnG6ABFba9Rl4YJ5N
         DzhGldUyGcO5N4zyi/KFeawEGVSV+vJ+tN33hPdHvxq6wOWD/tP4QKLm2wBBvauJND5f
         Y8tjTvZOzLH+pJtRlj6YlSL37EEXZbhZoT5LwYgDd2aa98nmOUGdbwrcxgHCLx4VSg3W
         yWvFkrGrpv/fcYzSqlhmE5CAT7ODAIfuMfEOznX8Bi86vTek2mMSACgzGYi7dsUqbaZf
         ngTutjekBebPK551Jq7ZgomsUiFkuITj0HQbWCMcijSLrpAlPjQ5mgWDdsrx5yH38yvJ
         1MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540428; x=1744145228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2Nlc70kYoEVZE2tPVykbAae+uvb1zAI7sPIwdhW1oA=;
        b=qKqkfL7lea1LitmyOW+MX11La4nt7Ztq3tPBvmSi2Z4InICD6Xtx676zlWvyCM47vy
         185XGCQTLnQ0KwMx4oO8PEabXY3zsWpuvO8DUgY7qQ7D4FvNis/xoLJg8p5N9txl4IMD
         BLQb0BJxz8rfk0HCSderItK9nXbwF3/pcW5r5NIfNA/ADZqH6ynmMMHk6/ggRoG7llo0
         IITPCYDK9ux3xtTRJaQQW4SAOdDllWWm2UkRM3LAlfbVuzSfX/2pHNo/ejugqi2o3h3F
         XNn85RqJTNACKBFLHkwqwAoQiVINC3fU6XRBcnixfYM7ho3cQSg9H6NMJbeLgfvqvJzZ
         PqSg==
X-Forwarded-Encrypted: i=1; AJvYcCUhOmsOweTLXWXC+MsmRw0pB0A/hmK29XMLZjjkKhYaC6iNp8tIhPej2/qtQvnbp+Fm6tWv3gRxH7sBgBbMepTD@lists.infradead.org
X-Gm-Message-State: AOJu0YxJxcF2oa1t3jdAbYewgsWUxAcNWXWCxo6ccXhSrnotGeFZPThi
	cWYjojHe7RkpleGq1HVz+zTKLBf3XmQ9ZF7+ecl0y/QfU6ZWNVePHtXWu4R839p9f6YTujWVvb3
	19A==
X-Google-Smtp-Source: AGHT+IGsvgxu0cKjG5RuKP235RGuqLz8GTYqfRRM08+3tGkeZ2vVqfJM8i9w8mVMsttD6aUmHocD7/45nSY=
X-Received: from pfbdh1.prod.google.com ([2002:a05:6a00:4781:b0:730:8e17:ed13])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1410:b0:725:96f2:9e63
 with SMTP id d2e1a72fcca58-73980477740mr24146728b3a.24.1743540428601; Tue, 01
 Apr 2025 13:47:08 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:24 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-13-seanjc@google.com>
Subject: [PATCH 12/12] KVM: selftests: Add a KVM_IRQFD test to verify
 uniqueness requirements
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_134709_514773_BDD42E7A 
X-CRM114-Status: GOOD (  20.61  )
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

Add a selftest to verify that eventfd+irqfd bindings are globally unique,
i.e. that KVM doesn't allow multiple irqfds to bind to a single eventfd,
even across VMs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm |   4 +
 tools/testing/selftests/kvm/irqfd_test.c | 130 +++++++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/irqfd_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f773f8f99249..9e5128d9f22c 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -125,6 +125,7 @@ TEST_GEN_PROGS_x86 += dirty_log_perf_test
 TEST_GEN_PROGS_x86 += guest_memfd_test
 TEST_GEN_PROGS_x86 += guest_print_test
 TEST_GEN_PROGS_x86 += hardware_disable_test
+TEST_GEN_PROGS_x86 += irqfd_test
 TEST_GEN_PROGS_x86 += kvm_create_max_vcpus
 TEST_GEN_PROGS_x86 += kvm_page_table_test
 TEST_GEN_PROGS_x86 += memslot_modification_stress_test
@@ -163,6 +164,7 @@ TEST_GEN_PROGS_arm64 += dirty_log_test
 TEST_GEN_PROGS_arm64 += dirty_log_perf_test
 TEST_GEN_PROGS_arm64 += guest_print_test
 TEST_GEN_PROGS_arm64 += get-reg-list
+TEST_GEN_PROGS_arm64 += irqfd_test
 TEST_GEN_PROGS_arm64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_arm64 += kvm_page_table_test
 TEST_GEN_PROGS_arm64 += memslot_modification_stress_test
@@ -185,6 +187,7 @@ TEST_GEN_PROGS_s390 += s390/ucontrol_test
 TEST_GEN_PROGS_s390 += demand_paging_test
 TEST_GEN_PROGS_s390 += dirty_log_test
 TEST_GEN_PROGS_s390 += guest_print_test
+TEST_GEN_PROGS_s390 += irqfd_test
 TEST_GEN_PROGS_s390 += kvm_create_max_vcpus
 TEST_GEN_PROGS_s390 += kvm_page_table_test
 TEST_GEN_PROGS_s390 += rseq_test
@@ -199,6 +202,7 @@ TEST_GEN_PROGS_riscv += demand_paging_test
 TEST_GEN_PROGS_riscv += dirty_log_test
 TEST_GEN_PROGS_riscv += get-reg-list
 TEST_GEN_PROGS_riscv += guest_print_test
+TEST_GEN_PROGS_riscv += irqfd_test
 TEST_GEN_PROGS_riscv += kvm_binary_stats_test
 TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
 TEST_GEN_PROGS_riscv += kvm_page_table_test
diff --git a/tools/testing/selftests/kvm/irqfd_test.c b/tools/testing/selftests/kvm/irqfd_test.c
new file mode 100644
index 000000000000..286f2b15fde6
--- /dev/null
+++ b/tools/testing/selftests/kvm/irqfd_test.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <signal.h>
+#include <stdint.h>
+#include <sys/sysinfo.h>
+
+#include "kvm_util.h"
+
+static struct kvm_vm *vm1;
+static struct kvm_vm *vm2;
+static int __eventfd;
+static bool done;
+
+/*
+ * KVM de-assigns based on eventfd *and* GSI, but requires unique eventfds when
+ * assigning (the API isn't symmetrical).  Abuse the oddity and use a per-task
+ * GSI base to avoid false failures due to cross-task de-assign, i.e. so that
+ * the secondary doesn't de-assign the primary's eventfd and cause assign to
+ * unexpectedly succeed on the primary.
+ */
+#define GSI_BASE_PRIMARY	0x20
+#define GSI_BASE_SECONDARY	0x30
+
+static void juggle_eventfd_secondary(struct kvm_vm *vm, int eventfd)
+{
+	int r, i;
+
+	/*
+	 * The secondary task can encounter EBADF since the primary can close
+	 * the eventfd at any time.  And because the primary can recreate the
+	 * eventfd, at the safe fd in the file table, the secondary can also
+	 * encounter "unexpected" success, e.g. if the close+recreate happens
+	 * between the first and second assignments.  The secondary's role is
+	 * mostly to antagonize KVM, not to detect bugs.
+	 */
+	for (i = 0; i < 2; i++) {
+		r = __kvm_irqfd(vm, GSI_BASE_SECONDARY, eventfd, 0);
+		TEST_ASSERT(!r || errno == EBUSY || errno == EBADF,
+			    "Wanted success, EBUSY, or EBADF, r = %d, errno = %d",
+			    r, errno);
+
+		/* De-assign should succeed unless the eventfd was closed. */
+		r = __kvm_irqfd(vm, GSI_BASE_SECONDARY + i, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+		TEST_ASSERT(!r || errno == EBADF,
+			    "De-assign should succeed unless the fd was closed");
+	}
+}
+
+static void *secondary_irqfd_juggler(void *ign)
+{
+	while (!READ_ONCE(done)) {
+		juggle_eventfd_secondary(vm1, READ_ONCE(__eventfd));
+		juggle_eventfd_secondary(vm2, READ_ONCE(__eventfd));
+	}
+
+	return NULL;
+}
+
+static void juggle_eventfd_primary(struct kvm_vm *vm, int eventfd)
+{
+	int r1, r2;
+
+	/*
+	 * At least one of the assigns should fail.  KVM disallows assigning a
+	 * single eventfd to multiple GSIs (or VMs), so it's possible that both
+	 * assignments can fail, too.
+	 */
+	r1 = __kvm_irqfd(vm, GSI_BASE_PRIMARY, eventfd, 0);
+	TEST_ASSERT(!r1 || errno == EBUSY,
+		    "Wanted success or EBUSY, r = %d, errno = %d", r1, errno);
+
+	r2 = __kvm_irqfd(vm, GSI_BASE_PRIMARY + 1, eventfd, 0);
+	TEST_ASSERT(r1 || (r2 && errno == EBUSY),
+		    "Wanted failure (EBUSY), r1 = %d, r2 = %d, errno = %d",
+		    r1, r2, errno);
+
+	/*
+	 * De-assign should always succeed, even if the corresponding assign
+	 * failed.
+	 */
+	kvm_irqfd(vm, GSI_BASE_PRIMARY, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm, GSI_BASE_PRIMARY + 1, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+}
+
+int main(int argc, char *argv[])
+{
+	pthread_t racing_thread;
+	int r, i;
+
+	/* Create "full" VMs, as KVM_IRQFD requires an in-kernel IRQ chip. */
+	vm1 = vm_create(1);
+	vm2 = vm_create(1);
+
+	WRITE_ONCE(__eventfd, kvm_new_eventfd());
+
+	kvm_irqfd(vm1, 10, __eventfd, 0);
+
+	r = __kvm_irqfd(vm1, 11, __eventfd, 0);
+	TEST_ASSERT(r && errno == EBUSY,
+		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
+
+	r = __kvm_irqfd(vm2, 12, __eventfd, 0);
+	TEST_ASSERT(r && errno == EBUSY,
+		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
+
+	kvm_irqfd(vm1, 11, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 12, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 13, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 14, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 10, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+
+	close(__eventfd);
+
+	pthread_create(&racing_thread, NULL, secondary_irqfd_juggler, vm2);
+
+	for (i = 0; i < 10000; i++) {
+		WRITE_ONCE(__eventfd, kvm_new_eventfd());
+
+		juggle_eventfd_primary(vm1, __eventfd);
+		juggle_eventfd_primary(vm2, __eventfd);
+		close(__eventfd);
+	}
+
+	WRITE_ONCE(done, true);
+	pthread_join(racing_thread, NULL);
+}
-- 
2.49.0.504.g3bcea36a83-goog


