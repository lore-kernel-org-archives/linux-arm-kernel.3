Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2079BC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNuUWcLjakGfkNNM+8DkBjBlwJhpM767OVzB+eUiNIQ=; b=g8dVNmAoUSXoL5Wyy/XT152KPr
	KVdFz/4nLHOIpk0gcOU3P/orL+CfbLcDyti10DpW1YwUaAhS+c7sgsZcaBiKf5yLN2+Fv/mz0BTml
	yDK+kTDpVzliAMBGCeZidtf5XwPSBeV8NXc6zoKR1/n5avhE9BlqS1Xi2tMJKJQ9v3N1wQwqoBJGe
	JeBlJMasAnjraSzvOoctpPTYHeK8CojIHpvF9jiF5+9QGNUHDrOZhAUWgMxQKS5hanF2yFg6/17N0
	/8FbsvFpffmkr7nI2GaHFb33bKmpwurxNo3LZYjR6FOgUBWYLU9mu0Za2mx7kiZeVIPRFk3c4Oy9k
	JLeLPI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIGAp-00000002ZwW-0DTH;
	Fri, 23 May 2025 00:22:07 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFia-00000002Vui-3Qob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:57 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-310e7c24158so415766a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957976; x=1748562776; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=iNuUWcLjakGfkNNM+8DkBjBlwJhpM767OVzB+eUiNIQ=;
        b=SoQP+QbilEY/qgKwrBv1YyYnmx1udT81QQzKxg6K1qm89emTO/eJ+mF2u9vwJQypKA
         1JQEYzXuyuLvQ7u4zhKaIkA9QeBrxZc2KNQjNr1qq4AUHlhvx97gUI2vIS8Emkt9mki2
         KDerFAJiBc3VYXE1JgKuVdLc7ZHBF9fBCULz8JnubYTM66afThOOVNMxRA4ilDQJ4hok
         Ri3YAm5ihYdb2wA2kDSRJ+JVd/CfowocBSaDmZnmZ5P2BVx/W3+T0SJrARZntAdBMQZ3
         jd5SmYQtZO6Pl3Bam/XJ/1QknW+bpzic+eOg3O0TU7EMbBfc8fiUrl59J0nXc9bYMA6l
         n+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957976; x=1748562776;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNuUWcLjakGfkNNM+8DkBjBlwJhpM767OVzB+eUiNIQ=;
        b=OvK5ne7o0i6ZLPZLJqN/zfNwWm+kPjEYc88g4Y8b/WH6Masaa+7srxrLAY4Qpp7x26
         LRUjRraOUxHnHP20ptU/CeZ9BhH0Ruje1qgcQlgVjpYKZ1UC0RKN/fx5Ond6s5pVPLUG
         bpXza0qn0JvfWpyfe6jCXLIrN4gpz+oPA0uULgSdSY02h51kkq2N47vhGHlSlKhAm8uj
         snudI4uLV7d1C+a2t99livZWHOA2DJGc/xYcp8XGAEMalr9vyCZ4Tqh8wa44kQAFW7FV
         XwE30y3y28i2EUx7RMEYUG93FedM0gSnvu5/8YTbNWZoCY293FTH3h7KRwEAy1YLPaCI
         RqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBmdEkgrkU/aALYGaRuTFTyE4GATgN5nHroAD5U174uK+/8v2ywJsfcK8HtS+Rk8JJ5spHDO8odxoAxgY33fbM@lists.infradead.org
X-Gm-Message-State: AOJu0YwkZIaNVm0zpgQEFTNbcvZ8pLlcZRLt3orpfhT+ycpSB83VNfi+
	OmXNaymDzh/yKn8OyoMxnisMCMXRrqnuA6oLMDe3BsMMJ0lqu8hYWDVKTmmZ0HAlK7wPjVcDPX9
	LJNZA1g==
X-Google-Smtp-Source: AGHT+IEoOvxAnrgVMqS3TC3RLkVh5nLtBQqPosDJG4xPj/XHWemBkiBPXcS2x1YfUhLo+1j7jd9m06w7XHM=
X-Received: from pjbpm5.prod.google.com ([2002:a17:90b:3c45:b0:30a:9720:ea33])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc7:b0:30c:5479:c92e
 with SMTP id 98e67ed59e1d1-30e830c7988mr39961520a91.4.1747957975748; Thu, 22
 May 2025 16:52:55 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:23 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-14-seanjc@google.com>
Subject: [PATCH v3 13/13] KVM: selftests: Add a KVM_IRQFD test to verify
 uniqueness requirements
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_165256_855255_9E6D4D50 
X-CRM114-Status: GOOD (  19.82  )
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
 tools/testing/selftests/kvm/Makefile.kvm |   1 +
 tools/testing/selftests/kvm/irqfd_test.c | 130 +++++++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/irqfd_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f62b0a5aba35..318adf3ef6b6 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -54,6 +54,7 @@ TEST_PROGS_x86 += x86/nx_huge_pages_test.sh
 TEST_GEN_PROGS_COMMON = demand_paging_test
 TEST_GEN_PROGS_COMMON += dirty_log_test
 TEST_GEN_PROGS_COMMON += guest_print_test
+TEST_GEN_PROGS_COMMON += irqfd_test
 TEST_GEN_PROGS_COMMON += kvm_binary_stats_test
 TEST_GEN_PROGS_COMMON += kvm_create_max_vcpus
 TEST_GEN_PROGS_COMMON += kvm_page_table_test
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
2.49.0.1151.ga128411c76-goog


