Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26FCC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kW936wFYM0Ary5B3+n4kBp/4+0suFDEkHTdVVXpkj4=; b=z/vZ0mrAhuJRNXyGVqTh0OMNd1
	42VABjgcHgNSmLs9GGZoOIBUCDUQwpNW4dUoaTSQq2VASgyB1yuQvT0vPd3QCcMJ+jy9kyV/VexfS
	8jbbUj4b+fsXoVam+Or7f+HTtmQPYpWy/lLIGRE7xY5+N3hdMwoQYbuSkzAKj47fiKcU7GVfwM1uf
	w0u9XqFZQbO2y0HFfDcKNXmEPt5fZyF7TV8FiPT+bAWc4YuQnA0Dr4N5Ymzh0ZH6dU+wHBVr0uRWU
	njzsWzu4fFHSzadQ0L/hk4zC+CW1aeypAWLJWP0Po8jmJqhnJiIzODH5Dx+o7sCGbUA0FlJtsd+Ft
	ApWTUTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqJa-000000000Fe-1dq2;
	Tue, 29 Jul 2025 19:48:46 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugq5C-0000000HYwr-3Xr1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 19:33:55 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b0e0c573531so4354153a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 12:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753817634; x=1754422434; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7kW936wFYM0Ary5B3+n4kBp/4+0suFDEkHTdVVXpkj4=;
        b=yOhRBgPcGINRdVo+7dmT87WBjrPNtu7XfOGhVMsjkhpOLRzsiZePLAc1EbJFwxPd/r
         wGDn0+mGCGF4pYptbgMcDkwDI00P/mbvklX5Ebu6UGhhlWLAqgHAtUeGENgzfwS1iY4f
         bl5MrmIpgV4tO2giDFRctxfHLi9CNlwDLX2YP4WzpGeYkhIQA2BY/Qe5Iu5yeK883n/8
         6JvdHCmNi+V04P/Pv0oOxpSR7llpISsomuqcB4cK5yJP12QQx8FvP/UwMHWYdhF2QDtO
         9Ar2wvKIO15lrIMAgvVBpHZ3HMmTUuipIfaQXi97+5tYORaAWuM6VR5gMfJ8fUTPKnSW
         K0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753817634; x=1754422434;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kW936wFYM0Ary5B3+n4kBp/4+0suFDEkHTdVVXpkj4=;
        b=GPd9WZUU4FmVH6xtuW+vShKnPusNMz1ankU4DyPvM5r/vzLcbbrlaOXZNWa746c1bf
         5LBgRJeBzZViJoa+uW1HZlUjzR3IENmOqsKL8rIW/xISwtKmnIl3cWHPyDK3l8EN7fbM
         7U7Zz0eL79cOj2mtbGU2vOYXph6PFOCcxuQQPTLNljlU/2Y6O3ZQEJNuqgu3vTCqJkV9
         N7Vh6oo/8dHsbl0W/XDFnrF10vs5zf0g8CPlq+udmSJ6ejiMAbKqRbBr0a4DdjAZVxAR
         Tx7fu1rQQNF0OMfPqTMUsN6kNp1JvxRPtkE3nXJ1Mp6K/jLnnyeTQyle1lsi/LkY+EZh
         PXAQ==
X-Gm-Message-State: AOJu0YzbGGPtOkasM4bxTQ+DvgbgSP/MT39FyNu8YpbjJ21bDS2vY2Z5
	cnwXaZn87zwoqvrlfvuEkP7bouLXoSJbagFsilmJ+PDm30ahcIIhEzmVrF9pr+S/fmhVtkPGIan
	/Yk4ZcQ==
X-Google-Smtp-Source: AGHT+IELFOFWc8vYkYZRQRf3VfKYyLdceEz1T/Y/HkOfoDthT5RfeT3LHFZMzx5elvj9USSUE7rYmRIpqRk=
X-Received: from pjsc3.prod.google.com ([2002:a17:90a:bf03:b0:31f:a0:fad4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2684:b0:313:20d2:c99b
 with SMTP id 98e67ed59e1d1-31f5dd9de5emr917579a91.9.1753817633690; Tue, 29
 Jul 2025 12:33:53 -0700 (PDT)
Date: Tue, 29 Jul 2025 12:33:39 -0700
In-Reply-To: <20250729193341.621487-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729193341.621487-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193341.621487-5-seanjc@google.com>
Subject: [PATCH 4/5] KVM: selftests: Use for-loop to handle all successful SEV migrations
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_123354_885536_CA7D6FD0 
X-CRM114-Status: GOOD (  14.41  )
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

Use the main for-loop in the "SEV migrate from" testcase to handle all
successful migrations, as there is nothing inherently unique about the
original source VM beyond it needing to be created as an SEV VM.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/sev_migrate_tests.c     | 31 +++++++++----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/sev_migrate_tests.c b/tools/testing/selftests/kvm/x86/sev_migrate_tests.c
index 0580bee5888e..b501c916edf5 100644
--- a/tools/testing/selftests/kvm/x86/sev_migrate_tests.c
+++ b/tools/testing/selftests/kvm/x86/sev_migrate_tests.c
@@ -14,7 +14,7 @@
 #include "kselftest.h"
 
 #define NR_MIGRATE_TEST_VCPUS 4
-#define NR_MIGRATE_TEST_VMS 3
+#define NR_MIGRATE_TEST_VMS 4
 #define NR_LOCK_TESTING_THREADS 3
 #define NR_LOCK_TESTING_ITERATIONS 10000
 
@@ -72,26 +72,23 @@ static void sev_migrate_from(struct kvm_vm *dst, struct kvm_vm *src)
 
 static void test_sev_migrate_from(bool es)
 {
-	struct kvm_vm *src_vm;
-	struct kvm_vm *dst_vms[NR_MIGRATE_TEST_VMS];
-	int i, ret;
+	struct kvm_vm *vms[NR_MIGRATE_TEST_VMS];
+	int i;
 
-	src_vm = sev_vm_create(es);
-	for (i = 0; i < NR_MIGRATE_TEST_VMS; ++i)
-		dst_vms[i] = aux_vm_create(true);
-
-	/* Initial migration from the src to the first dst. */
-	sev_migrate_from(dst_vms[0], src_vm);
-
-	for (i = 1; i < NR_MIGRATE_TEST_VMS; i++)
-		sev_migrate_from(dst_vms[i], dst_vms[i - 1]);
+	vms[0] = sev_vm_create(es);
+	for (i = 1; i < NR_MIGRATE_TEST_VMS; ++i)
+		vms[i] = aux_vm_create(true);
 
-	/* Migrate the guest back to the original VM. */
-	sev_migrate_from(src_vm, dst_vms[NR_MIGRATE_TEST_VMS - 1]);
+	/*
+	 * Migrate in N times, in a chain from the initial SEV VM to each "aux"
+	 * VM, and finally back to the original SEV VM.  KVM disallows KVM_RUN
+	 * on the source after migration, but all other ioctls should succeed.
+	 */
+	for (i = 0; i < NR_MIGRATE_TEST_VMS; i++)
+		sev_migrate_from(vms[(i + 1) % NR_MIGRATE_TEST_VMS], vms[i]);
 
-	kvm_vm_free(src_vm);
 	for (i = 0; i < NR_MIGRATE_TEST_VMS; ++i)
-		kvm_vm_free(dst_vms[i]);
+		kvm_vm_free(vms[i]);
 }
 
 struct locking_thread_input {
-- 
2.50.1.552.g942d659e1b-goog


