Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF18CCD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qRbqYxE/FHHRGIPHLP62KGhWo8UkYosmytEIIXQZ9U=; b=e91tXmPzqPAF6vlyjoLCfCqbVs
	2ilBZpOQvw14N6lSCYGauovnfw3IWpiz7HRw1sN2TpRwSTwGFTLlkHq/1yYtqLMWti7aGyHteOTBH
	Kiegq44AemQH4ekKJ02zjl2N/e4StY8W3VCDwNab0IqxtTW+ol7NIt8tOd4K6l0ABkJ4GaAcWBr8A
	MOo/mCp2lQQZ6GbNwyIOytB1utjzx+SAlsXsvdm4plZmqaZlVpHdFOGKcjLRziZkBzvAVhHXDSCXb
	7qRmKAABrIT1mVLBLqd0T7zFzgG64j2lWszTHfNMCYYq8ZvjsT0+H7IFNK3ZXq71xPMehtzxYDFj1
	0fhk7i0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7G-0000000BngH-36cI;
	Sat, 13 Jun 2026 00:20:50 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7B-0000000BnbX-3MkU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:46 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso14962355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310044; x=1781914844; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3qRbqYxE/FHHRGIPHLP62KGhWo8UkYosmytEIIXQZ9U=;
        b=qU9dm3ZKCBZx/8BAmvKUXydY5CGRCV/tGFLbsmOKFGg17+0MbASZf42Ys7/N6oDIAb
         0000AUQL/HB2Ck4LT2eqTPPwM0N2amvhWdo8+VD+JYGnhSVLiIvffwnc1CBS1aHO1kzU
         Z+WaMNIZeOKyl4OvzUkqI7By0+vQs9rMd0c3g53fwRIT59mwNfjGGTZnKsrtOD92aNpa
         gl/FkXC7kje+ZCWAGNmrhcjqm22cd2HXF1E/wTdmSW7nMyBYOtK81Y09WZdxm5ZN34u+
         cin5xZukQ4nPEs0QQokrczUMl2PrEXCUssb/hk4eK8OHlqj+BNNFCMGAnSX7dqxD+l+g
         tJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310044; x=1781914844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qRbqYxE/FHHRGIPHLP62KGhWo8UkYosmytEIIXQZ9U=;
        b=YLNNEucoi1oMDbkCtn7DFgM2ufchow+HM56BF+mF3HP6Hck7t8c/H5GrOmgrPkYyey
         fiZg7BMsZr/AxOvwu+9CnyZRcxGIbuXbcP2ksKe3qjgjiRUrKpB+gBxGxUhjiHoHJSnj
         t5GcBOazov/tDI+5BVAKY6Dn4zpEMMAsIzfvdTzRXRt0+liYV2tU1SVlpIScPHwXsx8Z
         ABulleZjVDaCoDCv5s388CuhsfMrtrbekGfGU2koFLBJTVBXzvbwRK8oqZ3wh07kd1mI
         MNgm9y3ih/42NzXIExBbYlVqNPJWx/OeFyyqS2FX6wlDpWzQ57i8yhfs8ni1yDruGtvz
         isuQ==
X-Forwarded-Encrypted: i=1; AFNElJ84HJGCEhM/rON/IDFLlo5bAFuSoFhHmH8NsrpQ+YnzAlJZpli+GwE3ZkI2h1L6cHovsltCHI880xBm8MFtmWP8@lists.infradead.org
X-Gm-Message-State: AOJu0YwUsHHqaJ1YxZiYjAdFx4AxmmeMZ22kNBANPi3IjPI1Iyu+honv
	5DDawqME6MMZvHe77PWGTpv/5GQPcFw1PAcV7WN9g1qdB91BRo4TOee//0+REeicIdmdchocJFl
	LPig7Rw==
X-Received: from plrx19.prod.google.com ([2002:a17:902:b413:b0:2bd:3dba:a4c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:acb:b0:2c0:a746:7b16
 with SMTP id d9443c01a7336-2c6641e3058mr18450205ad.22.1781310044254; Fri, 12
 Jun 2026 17:20:44 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:19 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-9-seanjc@google.com>
Subject: [PATCH v7 08/20] KVM: selftests: Add helper to get host IRQ from
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
X-CRM114-CacheID: sfid-20260612_172045_844116_2C30BB88 
X-CRM114-Status: GOOD (  15.78  )
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
index de5f6e91203b..c112cedd3a2a 100644
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
2.54.0.1136.gdb2ca164c4-goog


