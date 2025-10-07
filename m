Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6021DCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rE2tP6gNwSGYC+ytU0WdagFGaT6zZ0FH31dgxqOixoc=; b=MDIiMcKHe6Hr2Rg1uy9iFdEnw2
	4vsrzb8mAeoTnEYzrYJvoSV/4ijqXcbMdPk7QNt+PYMjEM5tva/qjG2zMwslJtZ7u/PIRrFrzGDlz
	9+VEg6V3xxXRr53EsJkOnr+pyxDP9yzRzewMKy3Q09qmCZRMrZ+IDp8rRQd/Y82y0kl5dzC5X8/7x
	dNpatY9zIt2tsORnRcEywo+Tcdy9iHuB++g519HcVFM8AYBHifApIxu1hODynErQbKpkuoJVUFvcG
	EAM5QJMJpaKSzlT2XqejNTFLPkmM3dOcQGRCWBaKMLLwIqOKNYY+NWKcuPufT8iXVzV0cNbC6oEEE
	x7+VUwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxP-00000002qdx-2Xgy;
	Tue, 07 Oct 2025 22:14:55 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxM-00000002qZI-2Xtv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:14:53 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b59682541d5so10566154a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875291; x=1760480091; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rE2tP6gNwSGYC+ytU0WdagFGaT6zZ0FH31dgxqOixoc=;
        b=Ab49s+LutfKh4iD2wMRIjJle+Yed8o+QMPSNO8AUAigT9puWr3ETvzf/aAmciauFH2
         msVBG6i9M77hejROKZ0noP3WS7gTkdeajIFI33qCwQTs91YR/EtPXnjwVCoDuP3jggqh
         FrpVgmKmHwsNYTBrC6zR25BTuRMA3J2UDMMISwVeMMagTueDJB10GrRjntfKUDl+JlAO
         1lOiBp1ymgXHjjmujmWI5Cmc4Sjq2UmALtrMvR8R7lK9Wfc0TqmqQ+dfKgTUfRDl+J/b
         4nYw6NEfQN0sFoSp9ifGL8a6TR2r3M7BjhAAqDMOi/LKDowEh4p4wsDNlQt9qm84wTRL
         ugMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875291; x=1760480091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rE2tP6gNwSGYC+ytU0WdagFGaT6zZ0FH31dgxqOixoc=;
        b=b6oLUDgEAaQAANI5sV9jzCaMZzGhnbmRJMtSx7cRRRtHMdCTBOOneQ+z3CWIs1c+ru
         S+qP5SVrMchYTIuwM3TADOb3MV2mdFZSliBm9oH1Rqt8rT93Z8F0zE0gyIlzfRba0Qjv
         cKAHUNu2W9MISQAvCGyQfYsXKn0OO3QKJdw6/Z0yNiL3QeSZyNTKq6cSAwfM7eEi2wDM
         fnt9YhY/IoqD9RBX5U1Y2U10PUWsd2rezgCJ8T+bRFTCx7Wmv94i8487PvVFxfG54M9m
         5KEidMMIC5+k/8t48uCe12pJYAjoQEAZ3gvnaRgYop+oIF63X0z2AAfrFQkpg9Qo6iHr
         ZQRQ==
X-Gm-Message-State: AOJu0Yzl8wqd9o4USxLkI8O30DgUCGQFXSEWUUYwItn6usDN3TWRaze5
	l3xC/5d0yEx/C2F23qs1/zVYlGq5M3o89JFxCPIWV2nK+TR7YSaloL+DSZWn8vyi2Frfuq7FvZg
	kr9EPmw==
X-Google-Smtp-Source: AGHT+IHT/CfaeIxGRmxefyc3Lic0lFv3xjNb/u7y6hJFRFl3s3gaiIHFCNdvEBNOqVG5LYVtjeYwLccHX/o=
X-Received: from pgkh14.prod.google.com ([2002:a63:e14e:0:b0:b4e:4eb5:3895])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:914c:b0:32b:7220:8536
 with SMTP id adf61e73a8af0-32da8138b18mr1530904637.16.1759875291520; Tue, 07
 Oct 2025 15:14:51 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:16 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-9-seanjc@google.com>
Subject: [PATCH v12 08/12] KVM: selftests: Add additional equivalents to
 libnuma APIs in KVM's numaif.h
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_151452_653295_71093C30 
X-CRM114-Status: GOOD (  12.17  )
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

Add APIs for all syscalls defined in the kernel's mm/mempolicy.c to match
those that would be provided by linking to libnuma.  Opportunistically use
the recently inroduced KVM_SYSCALL_DEFINE() builders to take care of the
boilderplate, and to fix a flaw where the two existing wrappers would
generate multiple symbols if numaif.h were to be included multiple times.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/numaif.h  | 36 +++++++++++--------
 .../selftests/kvm/x86/xapic_ipi_test.c        |  5 ++-
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/numaif.h b/tools/testing/selftests/kvm/include/numaif.h
index b020547403fd..aaa4ac174890 100644
--- a/tools/testing/selftests/kvm/include/numaif.h
+++ b/tools/testing/selftests/kvm/include/numaif.h
@@ -13,23 +13,29 @@
 #ifndef SELFTEST_KVM_NUMAIF_H
 #define SELFTEST_KVM_NUMAIF_H
 
-#define __NR_get_mempolicy 239
-#define __NR_migrate_pages 256
+#include <linux/mempolicy.h>
 
-/* System calls */
-long get_mempolicy(int *policy, const unsigned long *nmask,
-		   unsigned long maxnode, void *addr, int flags)
-{
-	return syscall(__NR_get_mempolicy, policy, nmask,
-		       maxnode, addr, flags);
-}
+#include "kvm_syscalls.h"
 
-long migrate_pages(int pid, unsigned long maxnode,
-		   const unsigned long *frommask,
-		   const unsigned long *tomask)
-{
-	return syscall(__NR_migrate_pages, pid, maxnode, frommask, tomask);
-}
+KVM_SYSCALL_DEFINE(get_mempolicy, 5, int *, policy, const unsigned long *, nmask,
+		   unsigned long, maxnode, void *, addr, int, flags);
+
+KVM_SYSCALL_DEFINE(set_mempolicy, 3, int, mode, const unsigned long *, nmask,
+		   unsigned long, maxnode);
+
+KVM_SYSCALL_DEFINE(set_mempolicy_home_node, 4, unsigned long, start,
+		   unsigned long, len, unsigned long, home_node,
+		   unsigned long, flags);
+
+KVM_SYSCALL_DEFINE(migrate_pages, 4, int, pid, unsigned long, maxnode,
+		   const unsigned long *, frommask, const unsigned long *, tomask);
+
+KVM_SYSCALL_DEFINE(move_pages, 6, int, pid, unsigned long, count, void *, pages,
+		   const int *, nodes, int *, status, int, flags);
+
+KVM_SYSCALL_DEFINE(mbind, 6, void *, addr, unsigned long, size, int, mode,
+		   const unsigned long *, nodemask, unsigned long, maxnode,
+		   unsigned int, flags);
 
 /* Policies */
 #define MPOL_DEFAULT	 0
diff --git a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
index 35cb9de54a82..ae4a4b6c05ca 100644
--- a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
+++ b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
@@ -256,7 +256,7 @@ void do_migrations(struct test_data_page *data, int run_secs, int delay_usecs,
 	int nodes = 0;
 	time_t start_time, last_update, now;
 	time_t interval_secs = 1;
-	int i, r;
+	int i;
 	int from, to;
 	unsigned long bit;
 	uint64_t hlt_count;
@@ -267,9 +267,8 @@ void do_migrations(struct test_data_page *data, int run_secs, int delay_usecs,
 		delay_usecs);
 
 	/* Get set of first 64 numa nodes available */
-	r = get_mempolicy(NULL, &nodemask, sizeof(nodemask) * 8,
+	kvm_get_mempolicy(NULL, &nodemask, sizeof(nodemask) * 8,
 			  0, MPOL_F_MEMS_ALLOWED);
-	TEST_ASSERT(r == 0, "get_mempolicy failed errno=%d", errno);
 
 	fprintf(stderr, "Numa nodes found amongst first %lu possible nodes "
 		"(each 1-bit indicates node is present): %#lx\n",
-- 
2.51.0.710.ga91ca5db03-goog


