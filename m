Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8D5CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrhMXXAaZNAJ6oA/gSoBLS4pvmJFJO85iDVA23KYXYk=; b=Al2zBbNHnwmF+59ylz26fYvSsr
	JK5fiSLAkP5cKI4OL3VwO12nULqVbdCvkS0HntdxSwZ1iEdSouYK+o1He3AGSqDuekTnKUhnd9HyM
	oZmPkIX1mw6FIcFj5tdd+4TzXItYM/RpPE+ilIVHlaF60l5eh8Cnderxzl4bmh0FhgobdMLJnq1Yz
	C2BOtrfDIVlDzjGcyt0/YrQRK3mF7tEHyc8Fd6iZxBA2A1XbURRpWx56yyKEOK/wCRsc2NTIQDnpF
	TmIj36YvAYkvXacLDXeDIhdfBrb9PGDTeVUG5E7GJQdsW5bRhJ0VM0OHNr+wH5os9X+b5BOQaADaC
	PQiXuhZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7V-0000000Bnzu-1MSn;
	Sat, 13 Jun 2026 00:21:05 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7F-0000000Bndq-2AmR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:51 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c85a2c0b56fso1278388a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310048; x=1781914848; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TrhMXXAaZNAJ6oA/gSoBLS4pvmJFJO85iDVA23KYXYk=;
        b=ERsGyLjB7PVNb6C9SaMhc/z4kNhkaVQcX4Jaxv1RJIQ+B2pw6c+0ky3Vppoog/w7pb
         TOcCs8bsc2Wrr3kf8WTHj5eRFj7hqIK/STbwUoU/YBYez8JAJcbQ432YvSgreRwLwzgE
         D4I4R8HPFoKAgxJ7ROXOcAFJabbPv8H1mdTaUYdKXKfNS3xPWGrERYlbmpF6WgGn3RBa
         SYVXQUPetEQ4bPbCD0Jh3T58OgQSixXC3glUgMUwS4AjcLUYZlN8Z/s6FAf/rW6K8rlz
         lIgmgvRrN2w5ePDQXaHCPYLHII0kL6TvfcgpmNIXsxkcUB4Lr9ED33qKCNfQBe+C68YC
         INsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310048; x=1781914848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrhMXXAaZNAJ6oA/gSoBLS4pvmJFJO85iDVA23KYXYk=;
        b=XaN1wB80FNy9d5/GUtysESejglqqpnJUIrRGb3BH+yMYjkViFh6dJMnVZpjJuNxiIn
         VeaCqudkzuiNCA8uOioxEFUbG3SPPOfR13MyPTqZ50acQg/uxqR2Bt1+QgpNdQpiOJRF
         bxFcCOLhbX4MWQRseIOGXYZ0TPmuoH4iuiVjtXyoedDBaNB/1lEQBKsPHMpxcuCxsqet
         pOzMInCvYOLlYk80NHbvckXGCFKBoI1Dy5+oFsCbkRz3r54llY3R+mOnRk4PrzMBTz7V
         Wk+w/ux+cRS0VFa+43glx39Fd6xCfTuKNIVMOojipM26w+qhxvOcAf8UmNQnpxiwcTVC
         rjdg==
X-Forwarded-Encrypted: i=1; AFNElJ/rIqFR7R36Lwapv0mtRPSIsoWt9pHF3PFedJKGmEZJNXTqwyLub8+j57O1nTymoSlt85F6Nev3XtQipoxrbx6r@lists.infradead.org
X-Gm-Message-State: AOJu0YzHdM0ZV7MzE734nh5OUzGl//oj2ccE0dYibAcybBcQNitFUWqA
	45Q9LN9vLm4UIplJOUheMDQbU2vThCK0TrC3taJjHbTEYB4ROS/xiNXSGvSi6z2rjDVKYF7VSlJ
	RMT2mzQ==
X-Received: from pgbda9.prod.google.com ([2002:a05:6a02:2389:b0:c85:6307:e80c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a11c:b0:398:77ae:8d8b
 with SMTP id adf61e73a8af0-3b783b7e9bbmr6211375637.10.1781310047646; Fri, 12
 Jun 2026 17:20:47 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:21 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-11-seanjc@google.com>
Subject: [PATCH v7 10/20] KVM: selftests: Add a helper to set proc IRQ
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
X-CRM114-CacheID: sfid-20260612_172049_557368_70B534A2 
X-CRM114-Status: GOOD (  10.68  )
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
2.54.0.1136.gdb2ca164c4-goog


