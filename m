Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3F4CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 01:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9rLXq+5NYuHF5j+PqcJxTC4xDIIkyDtUExjWacEIvs=; b=kNbm0tw9gUhTuzIXyJLxf6lqzM
	kB+HTYAxmrTCQYw3HodXdh4CXT4cXODdRdGfpBh3+GPkwalDjnqf8Sp8cfq9t9piXpk2XcRJI7NaE
	GAIVny9/5pZIlbwswxHSdCm/M/J0GaC4ZQWkMOiTCOgjBG0is6q3HQSfAXem8wXrfg2xUdJZtlJy9
	/iZ6qSov33oOcWE3it+/5dAZRGi1L3qxrE0rPvt3Z/Lc5EOVexcLIlaskFAWq0QMQ6zfNgcni/GtT
	B+86oHmvRxdGfI/YZg9KTuTJl1jZpmT1CcWn4W2f6Q1/Fl1UuOtUat+QL/r2SfwJxPIpX5TsPm2Oj
	YY9nO6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Ci-00000006ZYw-021w;
	Wed, 10 Jun 2026 00:54:00 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Cb-00000006ZSY-3hob
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:53:55 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2c0c1e08848so83268375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052832; x=1781657632; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=W9rLXq+5NYuHF5j+PqcJxTC4xDIIkyDtUExjWacEIvs=;
        b=msww1nZRSHr0i5KYb1E/uesQmNI2Pb641goeuJrBMOeUqNqLF0k21KcXDQ0nmJ+DD1
         rLygBflfwWcMYqsrfLaYieMIqqQ0unboRGCQBc9ymM2SgdA87UQDIMUx3WOHmYAPySvX
         F5/mb2ZkEZCZMzTYeTMFUVB6sWzgX0dwdqs71LqJ8nBuCof1ZwzlniLr8J5b53G2tLt9
         +H+QwbXK3byrU2YMNpV6QNf3F8xzc9llv3LrYw2MlF0F+pYIWPgf+KvVvyic4IybDPQS
         vv0Af9iR2Kt+tSm8Y8FQLa3W+ji3HdJ7E33Q36+Xe9cpkdPE5oeUO+c9tkcyvy6/mCGe
         o1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052832; x=1781657632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9rLXq+5NYuHF5j+PqcJxTC4xDIIkyDtUExjWacEIvs=;
        b=G4qlC/4PMQIsIf1F7SqsFMSV4nAQ9kQ3pokDpioyT0HHgQnM7RqmuxSeB7rZDCLY4K
         hxMKerE05+Fas/GIReIHWSRaeb4lJm+4L/fg46AsFDnAMX0vL6cwV1i1qLe+btK0Aw+G
         NiqeunAA6bCQ1J8hRYzh/CCY845TukJiUFfBJbKguPzLtVQkPs+IblrH+8st12VMNht7
         2KtsEUYJACrdDPhYYaxrFArUh9lJnhdPQP94KufYhxFgE2cM2UGkUTGbeePlMCEWNcDZ
         oqYgAvM7wFVUqcThlgfTFPofLntFc9hrtnQBtOu662e3SsOQYqfiuB3UJ/TpQGMFlLtz
         rjvA==
X-Forwarded-Encrypted: i=1; AFNElJ+o8w3nCSO0+/SSGBc7+9Rhu6RBIvNefa/KZ5BIoN2zzAAzsIdCBpM2gF5CAgE+10p9YI7zilVMNy+btehmkBmY@lists.infradead.org
X-Gm-Message-State: AOJu0YzoZAygiu3eE6Chls2nkNy2Njn5NyK8SnXpB7tWKBr/VBMBSgu3
	hELxiQn/vTWd8nQTEL0SEceiYQOH//7g8ngVac/MrdSdFLyuMGAZVvywnvcbp8uXQVTYhnInq/Z
	i9mjQsQ==
X-Received: from plbbj2.prod.google.com ([2002:a17:902:8502:b0:2bf:2098:44f4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef50:b0:2bf:23c3:34ba
 with SMTP id d9443c01a7336-2c2a1c99a9bmr63318635ad.28.1781052831902; Tue, 09
 Jun 2026 17:53:51 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:28 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-9-seanjc@google.com>
Subject: [PATCH v6 08/18] KVM: selftests: Add a helper to set proc IRQ
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
X-CRM114-CacheID: sfid-20260609_175353_930042_FFCC81FE 
X-CRM114-Status: GOOD (  11.15  )
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
2.54.0.1099.g489fc7bff1-goog


