Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7186C43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXFt4r4hF0CDqmnY5VMLGnN8mXFOQ8bAerYnb+O0pOw=; b=q6KfrgXSa/r2sUJVFEYmtDcR83
	rFFafEWkKVJy2fOiTrNjRnF3q3hF+mNZ11VUKVl9bQks0g8WTcjgEcNC/EFUtHN5Q5cONVTSq6SOD
	PMtpOtp6BU2VVuN2h8BIA5cta8mSCqJDv1CNpy4CduCzix0Qh7lrF2RQB3O5F5btqVVzWWc8sqoDX
	KoGJSoJ8CjfCyZGOEc3Cfyi8XI0JqTbMNVCYP/bWOItqYeK0MjaEpSBWHcWrzlzq+HQ1qCG2zx1qA
	T3Wj56jzTTYDMx6WaEjVGsnWpPL0I9iZEOrEHaCYqA1SpPjsvk9W6HH6vxSOlE+Um3cDQFlUNPG/h
	8HQd1org==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDX-0000000BuY5-2nIJ;
	Fri, 26 Jun 2026 21:36:07 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDH-0000000BuJw-2RAr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:52 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c88da04b71dso695462a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509749; x=1783114549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SXFt4r4hF0CDqmnY5VMLGnN8mXFOQ8bAerYnb+O0pOw=;
        b=DSE6LssG20D2YD3v335LghcTetxIILf4UAf+gR58+V+lLgIKRwO/acdwUXYu+NoOB6
         AGoj3DebBxqnmXjCDavuCCcSQGoLczQSMrZWQuy2G6QBDQ9Dr3bagUAJQqT7gILJ7Z7Q
         rgEWX3Jy2agiSfFDyoabD6J5/X2KcuOYiApAQAv5yZk1F5PPiqoEZtIV2BwpbhvmxFs1
         YM3gC8sSPgx8Guyy61cv+Mye8yy1FnhnBT5IV7X/3YrQbc5B5IvNTHoLw8Zd6uMtGVZN
         KocDOLmNzesy0Piv1OK/k0paUZb8K6THRIjHjPw96MZuL+vklCBm91L+P5RcN5GnVx8T
         Dygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509749; x=1783114549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXFt4r4hF0CDqmnY5VMLGnN8mXFOQ8bAerYnb+O0pOw=;
        b=oHudkdJAwTnzspa0VaXa2zww/aI2eN1mzn7ZLXG3HwnXV14gzQQoAuINWKPRJ0tvWg
         THo8x/2YSRQNjHoO2IMOoeHpwWKNDW9vVv1HY2aWsqFFyKzScVdtkKeXsYw++wWcKUI/
         ARXJovY8lN5vVWCaOXsKNWfdtRo9e8t97qJZtjKBTdFAHL/Brmu/BSZokqGeQOkKts+M
         yYr2QOVkkxpuzmQEwYCwREdrUpkpzzy0ZnbiOnGNgpMQ7mXH+q3mN7noo9AH/Br57sy8
         28PKypjy9oxJ+lbahJz7Izm8DITEXmhz2Z4zDCxKCF5VZAXrva39VWhBpkyYam55omci
         HpjA==
X-Forwarded-Encrypted: i=1; AFNElJ+S3QznWMTig6xRUktS6HtX2oK7+irdGkd+WH8pWGUTfVbs9V6aUnd/I/hHtNeMJbk9j7sdSXwd1Etw96h//Zyi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyybappe9AGw6Q5/AM5S8OmQGEdCESiZwuNnHl/mQyA/SnSVgQ/
	VtlLmnNipHwpZmKxyaErI+s3Co9vsbYwtYL5J1K+hVe0cSj4s0yfzLu56Ype6RqQnzNMck+Loga
	T6tjp8A==
X-Received: from pgge9.prod.google.com ([2002:a63:db09:0:b0:c85:62f4:f188])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8811:b0:3a0:bc61:62e6
 with SMTP id adf61e73a8af0-3bf69b3edc5mr2231510637.8.1782509748445; Fri, 26
 Jun 2026 14:35:48 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:23 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-11-seanjc@google.com>
Subject: [PATCH v8 10/20] KVM: selftests: Add a helper to set proc IRQ
 affinity for IRQ test
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
X-CRM114-CacheID: sfid-20260626_143551_622203_F2D41844 
X-CRM114-Status: GOOD (  10.67  )
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

From: Josh Hilke <jrhilke@google.com>

Add a utility, proc_irq_set_smp_affinity(), to set the CPU affinity of a
Linux host IRQ via the proc filesystem.  Use smp_affinity_list instead of
smp_affinity to avoid having to convert the single CPU to a bitmask.

The helper will be used by the eventfd IRQ test to verify delivery of IRQs
when the affinity is randomized/modified.

Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: make the utility self-contained, drop "list", massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/proc_util.h |  2 ++
 tools/testing/selftests/kvm/lib/proc_util.c     | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/proc_util.h b/tools/testing/selftests/kvm/include/proc_util.h
index 704839b6d7af..d1ddc967d11d 100644
--- a/tools/testing/selftests/kvm/include/proc_util.h
+++ b/tools/testing/selftests/kvm/include/proc_util.h
@@ -6,4 +6,6 @@
 
 unsigned int vfio_msix_to_host_irq(const char *vfio_device_bdf, int msix);
 
+void proc_irq_set_smp_affinity(unsigned int irq, int cpu);
+
 #endif /* SELFTEST_KVM_PROC_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/proc_util.c b/tools/testing/selftests/kvm/lib/proc_util.c
index 84d30f055a0a..3960b3841d63 100644
--- a/tools/testing/selftests/kvm/lib/proc_util.c
+++ b/tools/testing/selftests/kvm/lib/proc_util.c
@@ -38,3 +38,17 @@ unsigned int vfio_msix_to_host_irq(const char *device_bdf, int msix)
 	return (unsigned int)irq;
 }
 
+void proc_irq_set_smp_affinity(unsigned int irq, int cpu)
+{
+	char path[PATH_MAX];
+	int r, fd;
+
+	snprintf(path, sizeof(path), "/proc/irq/%u/smp_affinity_list", irq);
+	fd = open(path, O_RDWR);
+	TEST_ASSERT(fd >= 0, "Failed to open %s", path);
+
+	r = dprintf(fd, "%d\n", cpu);
+	TEST_ASSERT(r > 0, "Failed to affinitize IRQ-%u to CPU %d", irq, cpu);
+
+	kvm_close(fd);
+}
-- 
2.55.0.rc0.799.gd6f94ed593-goog


