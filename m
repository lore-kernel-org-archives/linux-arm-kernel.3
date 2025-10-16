Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF2BCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qioThwKzTdEOA2iQtf0mEQ8EB9wa3wHPmXpieC/maY=; b=HAD3T0FVSibhsZ+FdyzI2aNtLR
	iRZ+voXf6kDM7w+zUuK0LmKvvug29ekz74LUMImfsuwiHZjDQmDiY98t8+fm/ewPHlgrb7BNtnVSA
	dh+W8UhTs5r6DMWEX4gvXbdmDDroTDJLMCcw2Safh75oH/oZZUD8uAkCSZbB5xHqamd3MA+9LjJhB
	hz7LVeo8WzxFeQcJ61hPi4QOGhKEoj+bY55cM8UOEYH46xvN4LRPW43cEllWmpTiv6tBaTw74OWFh
	21abZ6VcD6HPH60pBTmZyaUPLEhNOktPTqFyDxEG0CgqbBi6J6MjS+lE7O1m6FqxN7dsje1/o0wjq
	h3o6WR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RoH-00000005ZtD-22vz;
	Thu, 16 Oct 2025 17:30:41 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ro0-00000005ZeZ-0QhL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:30 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33bb4d11f5eso807597a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635823; x=1761240623; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5qioThwKzTdEOA2iQtf0mEQ8EB9wa3wHPmXpieC/maY=;
        b=oLweb3sdpXptYtn9Dgn24cvP2J8cPvv6c5q1UiWwPcw/vf0CFLjMXojDx0jHnFazH8
         ahrJA0skQd1tfBlMdfq5IJ2OTi/aVcio5u3Uqul8qPYQZcNXDSZJ0wZUncX7vO/WWs0u
         H5j2uqTwdfrmTkedEYEfvmZyUsRi5HUk++r1JYsW0VDDj9TnkTxwk53g9k0Wx6BmQcKs
         s7PtivPp9az9em7fhtEhAlCbS6a/6Eiy3GunoOJRfACmKw3VbTUmKIOCWUgSuBLkLEhE
         yEJ0i+yQZ5nEmu9R/9ciMOdCiz1TtMHS9wxByRHcLByIQNKIhuXv5EBXuchE1/18ip5r
         YKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635823; x=1761240623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qioThwKzTdEOA2iQtf0mEQ8EB9wa3wHPmXpieC/maY=;
        b=UzOdKrXOb5BdAjOZNeloOc07ICBFbAHPmlzCz0c8yxJJd4jTSGdqd1LnSZ+r13GoA9
         wNGhjUGQbdzcpubO9qCai89rapVfkI9muU/Wbbi0hjuMRm0TfuHmLUo4gVqFKoZ74ljf
         iVgChYAIh+5p1jzYhfF3iRU0AkClDI4hAMxwvZ5GXtFhrrSMPghMpY3WlqsFm98A/f9k
         PoBAl71nRKL7ByagiuEVJAG21AGQB3Y7QUKB+/AjlEXMlM3LgEXX/H9TKHycvjI221IL
         UwPOLFFf5cv2pO34Gyl/ha0ZJuam+ESSQUG76XEudKmsgLp0uKX554k9YnGmdx02C4zM
         P3dg==
X-Gm-Message-State: AOJu0YxSd/bn7zZsrvFELzuVk2/WQ8vBn6EhR0Ha+qELTTGT5KnV+/ND
	mpIQ6YNuCfewxbMQzo0pYEK8ZBYHpKkXOooud8nTe6TYxZRtlm+Wn5A10DY0ll7R7OJpegIZRkX
	4K/9KHg==
X-Google-Smtp-Source: AGHT+IGu6Gv62gHarqlsw6wLj2w/nvBHJ7QIrylwkT9SXX+HODiDsrpt8+G++14FgxRfd28ER/ycNwYRJBE=
X-Received: from pjbgj21.prod.google.com ([2002:a17:90b:1095:b0:33b:b662:ae3a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e43:b0:32e:a4d:41cb
 with SMTP id 98e67ed59e1d1-33bcf85ada9mr634774a91.1.1760635822818; Thu, 16
 Oct 2025 10:30:22 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:49 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-9-seanjc@google.com>
Subject: [PATCH v13 08/12] KVM: selftests: Add additional equivalents to
 libnuma APIs in KVM's numaif.h
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_103029_306249_7E206E74 
X-CRM114-Status: GOOD (  11.52  )
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
boilerplate, and to fix a flaw where the two existing wrappers would
generate multiple symbols if numaif.h were to be included multiple times.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>
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
2.51.0.858.gf9c4a03a3a-goog


