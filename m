Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnTbJ0qzupqs+OdQTBbFmTptoXz92YWWt6sTMLKlVlM=; b=GzHnu9kiRtM+pi7TQwJ+9cc31X
	9Mn9s7qsGEBPQrAGjmY5Bnzsmakogwxw4KVtWLJCABZJVKdfDBmHQj6v834A0BWJLLkbAtGb0l8zO
	YCAkmwuscQ5FlkpdUk1B2AdKzgOv/3lL0mKa2xhCOQN03HXygixM/4gC9sW1yuuZh0jDq8dX8dyuL
	u7NtqkKuw+oLiOaZg+SZ/nwkr4kQDRNUYp3HLSgJeieTwTjkysPklUYenUFoJlwnqtlgjMRmtp+VI
	gFJSk/6inD0kH4fHNYpf3X4whq3PIZ+ff+9Ng0Yt8FMf4utujtIGTIp1WjmcE0xJaYWsv315vqO/8
	Jp05fTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDX-0000000BuWz-1RR3;
	Fri, 26 Jun 2026 21:36:07 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDD-0000000BuJB-3tfN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:51 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-84540d59430so1003597b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509746; x=1783114546; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pnTbJ0qzupqs+OdQTBbFmTptoXz92YWWt6sTMLKlVlM=;
        b=gZ5uqw16nz23KLjHr8aLcVRe6TKaZ+t6NI8akdBZ5p+H9iNJ372qZYZnMfhTah9jkY
         OpH5Sdm8QNphwqq7axKcOTz8h5s9uSsLauaPW2K0UTjMFi5ZUXKR0Mbq/23Ut7R8l9YG
         Ti9yoXcunZ4WyJmzPV9ujluAt5spfzX/QmAzB0swKL5x6A4svPOAXehEx4PxznPhuWMU
         0IHH+z84FspbKUmaupKboqunqX1TyN7WMc/8KDKkAHQo67LoYeHCgobCTjE3aiMtb4/9
         0x75j6PPK0L/FMvp/yFzhBw6H47kWfDtlLWlK7O095Y89LiSFAGB6rZ3iuhLJrQBvsoZ
         Gavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509746; x=1783114546;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnTbJ0qzupqs+OdQTBbFmTptoXz92YWWt6sTMLKlVlM=;
        b=Ioqfe3/2wPqNG4h7gOaKok+FHBkKJO9QxFzrOC2w1FWub3TCzSCNCkJlO/jXiqVS/v
         Je+cbpiv7GKErSrogwRqZ93Q5QIz4ELLPZoJGXQFDazgFvvYAgc2+yOdSLu3MGhXCLP9
         NMjQ0ZV7XxLNWf+R2o6ee1OumzHqj7fGUjTr99kFoS7MobuYSLGt3BluD4d6oMA+vtTI
         80ljCTykqoM8pwKzmdW5iIo+WUd2Z8QJQXvIvHpZ+q4L+X2wKy1jv72pI9i9izBoxagz
         LKxnXyIHEHsMaUw64zCbaNrUjSG9ZX8NxipznhYx+EsS+bKgRAxWHI54ShCsHWgsypZo
         AuTA==
X-Forwarded-Encrypted: i=1; AHgh+RpahtoVZiENqsRQumnqeduhOvx6N/u/ZUKZT0Y1g8FxOrWC0rwQ/rwhnu9lXwRcDnjS5GuznCLRKct5lREMdLRV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3r73PRF0nfATwGYaYtM/Ctkgys8tFCm0lawq4onyd45yrwADl
	AAPZfAYPPAngBK/8yxM2Hydha8p+YwhMJWCGvPgyhZ4TTN6l9+XFbVMAHyi1XBknvdCk8o18121
	18oMPLg==
X-Received: from pfbhx20.prod.google.com ([2002:a05:6a00:8994:b0:842:7548:51e8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:66c6:b0:845:ba0d:3e5c
 with SMTP id d2e1a72fcca58-845ba0d45cfmr6880920b3a.42.1782509746265; Fri, 26
 Jun 2026 14:35:46 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:21 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-9-seanjc@google.com>
Subject: [PATCH v8 08/20] KVM: selftests: Add helper to get host IRQ from
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
X-CRM114-CacheID: sfid-20260626_143547_972093_4B2E57E6 
X-CRM114-Status: GOOD (  15.77  )
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
index a24875fada03..88c6c8046dde 100644
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
2.55.0.rc0.799.gd6f94ed593-goog


