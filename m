Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD81DCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=724RgwNGECYZAQrR7huttJyeJ2iqdlEoMMuWqlZB/zc=; b=hbcKH7p5woNWtCOyQWqHOMBxqA
	+EsnQlgLZUPyx0nDrXaEu7GwWWptQH+mvLGtGk9ntP1uCX+Ak5cJW7VfR0s4deE1itFHSyIg+USby
	/I+8c6jndlLz6i4snu39AShugoJtNwChSWyTaTZw7RoAQx8LePOzMHdGkToI1VtjCCUSK61kraT51
	12sKp7UZK97GgoHkTnwPeTsLFPGaQgW55U+wWf/UgcjBRD7RLNWIlfEOvp5ByZURn8hdz2VGrEUWL
	fRjTvT8W3DMGuFutxquezcC04J2SUP8h0mEQ0sfyPL/9tfDyaNg5Uvx1jh7sDHhfIjDQLb1EvOyh0
	/5JQGtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Ch-00000006ZYG-3EDS;
	Wed, 10 Jun 2026 00:53:59 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7CZ-00000006ZRD-0ZnT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:53:53 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-84235f9b91fso4533129b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052830; x=1781657630; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=724RgwNGECYZAQrR7huttJyeJ2iqdlEoMMuWqlZB/zc=;
        b=rdug/jCPy7DZ+sg7F2UVlN4+Z1NZh6x9r+rbcgDNya+IG+X0uCWFIsAeDFASyyDeeu
         cMRHTSjAk3+cZSRw/++xmUOci0mYWKO7irf94/YYnJTIyvRGr+EriqkMH/WXd6by+2Hs
         +THZYHaWgc0jhUohqKrAdLETYUV2Y/w5CpDjdWtPfjCMdZtR/wRV1g5xVWgf1BPheJUr
         1QOQP5dPRLuH5GhLBL66Ip5rplLH8h3+0b7Hv0fJC/h1hnp/Pe7EBKNzx5uX0UE5GFWK
         BczWHkL/LhW30rv495WxF6zGPIo3qTqbqt2nnP3YBB9IwweqCmW/IJUvTjta6CRZQFRj
         C5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052830; x=1781657630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=724RgwNGECYZAQrR7huttJyeJ2iqdlEoMMuWqlZB/zc=;
        b=doqQVqFyDeA7VrI6NNFoAuiFmKwp8KVQMpDNN0vSnnNi5nVb7AiqWr5bQSm/uVYMlz
         eNqU6HNi+Gnc5ql4VE8q3TUZqIEDrIWsHzIx6O10KlLNBILCHAgVe0GVOmXaW9nc74lK
         jS+meHgD8q1DtkFuO+zHAEgAMFN9wvPqN1Ts/b+3x7CwCBmknu816Cs6OyGWNfkiWNTi
         /JqOtecJug6hT0pg9B+sFyrQYumQdsbdAH842MQOFGh3eLIdt/e/lH5hnMYtYBBIueUE
         eyochi7F+pcW0HP3PP1KBJ5s6bLhJE2RTAZBW+X+GSHNYJ5RHrNruC73tsRa1XeBFd1H
         FdMA==
X-Forwarded-Encrypted: i=1; AFNElJ/IVZcFjh8qw6c6FZP2eT7XIEzeI5+xeX1qkoXbfqCq5q4jRcFmRFNkrcglJHWa1sk+upHvftlGlL21zvoGiRTN@lists.infradead.org
X-Gm-Message-State: AOJu0YzfHI5pPztEOiQiEZGzvnDagWvN0wNulL0VmqVmWEl9RPt51eKW
	+2Vk+aCQI00qC5Il8kjze0QoTp7O8Hkjjfv9WOFn5tcG9V2QokGz6jT/HIQQwPHi7ZaSiouk6sI
	Tbqq3BQ==
X-Received: from pfw3.prod.google.com ([2002:a05:6a00:a263:b0:82f:4d28:b8c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4390:b0:82c:d7c4:4c57
 with SMTP id d2e1a72fcca58-842b0e73596mr23804989b3a.19.1781052829531; Tue, 09
 Jun 2026 17:53:49 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:26 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-7-seanjc@google.com>
Subject: [PATCH v6 06/18] KVM: selftests: Add helper to get host IRQ from
 device MSI-X for IRQ bypass test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_175351_183348_E24878B0 
X-CRM114-Status: GOOD (  16.25  )
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

From: David Matlack <dmatlack@google.com>

Introduce proc_util.c and proc_util.h to house utility functions for
interacting with the proc filesystem.

Add vfio_msix_to_host_irq(), which parses /proc/interrupts, to get the host
Linux IRQ for a given VFIO device BDF and MSI-X vector.

This helper will be used by the eventfd IRQ test to print the host IRQ
number when triggering IRQs via VFIO device, e.g. to aid in debugging if
the test fails.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../testing/selftests/kvm/include/proc_util.h |  9 +++++
 tools/testing/selftests/kvm/lib/proc_util.c   | 40 +++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/include/proc_util.h
 create mode 100644 tools/testing/selftests/kvm/lib/proc_util.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 1339228cbf53..90a370ed99f2 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -11,6 +11,7 @@ LIBKVM += lib/kvm_util.c
 LIBKVM += lib/lru_gen_util.c
 LIBKVM += lib/memstress.c
 LIBKVM += lib/guest_sprintf.c
+LIBKVM += lib/proc_util.c
 LIBKVM += lib/rbtree.c
 LIBKVM += lib/sparsebit.c
 LIBKVM += lib/test_util.c
diff --git a/tools/testing/selftests/kvm/include/proc_util.h b/tools/testing/selftests/kvm/include/proc_util.h
new file mode 100644
index 000000000000..704839b6d7af
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/proc_util.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_PROC_UTIL_H
+#define SELFTEST_KVM_PROC_UTIL_H
+
+#include <stdint.h>
+
+unsigned int vfio_msix_to_host_irq(const char *vfio_device_bdf, int msix);
+
+#endif /* SELFTEST_KVM_PROC_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/proc_util.c b/tools/testing/selftests/kvm/lib/proc_util.c
new file mode 100644
index 000000000000..84d30f055a0a
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/proc_util.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "kvm_util.h"
+#include "test_util.h"
+#include "proc_util.h"
+
+static FILE *open_proc_interrupts(void)
+{
+	FILE *fp;
+
+	fp = fopen("/proc/interrupts", "r");
+	TEST_ASSERT(fp, "fopen(/proc/interrupts) failed");
+
+	return fp;
+}
+
+unsigned int vfio_msix_to_host_irq(const char *device_bdf, int msix)
+{
+	char search_string[64];
+	char line[4096];
+	int irq = -1;
+	FILE *fp;
+
+	fp = open_proc_interrupts();
+
+	snprintf(search_string, sizeof(search_string), "vfio-msix[%d]", msix);
+
+	while (fgets(line, sizeof(line), fp)) {
+		if (strstr(line, device_bdf) && strstr(line, search_string)) {
+			TEST_ASSERT_EQ(1, sscanf(line, "%d:", &irq));
+			break;
+		}
+	}
+
+	fclose(fp);
+
+	TEST_ASSERT(irq != -1, "Failed to locate IRQ for %s %s", device_bdf,
+		    search_string);
+	return (unsigned int)irq;
+}
+
-- 
2.54.0.1099.g489fc7bff1-goog


