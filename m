Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D315CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RviFSJTeDXrAnxp03nizg0uEL1EB4BJAqQICQBGlk4U=; b=MBeJX4u/Ubga2B3odE4p4uGbO0
	1iWU4PTdLB958B/+DH5ZAyXHuylcWZ9NZ7Ma4ip+0U7+iG7ZRyzztSVP4xuD3Y/hsCGoEpkbFWszj
	DLMjufCrqbTgsdTEeNaWlVeIuQKeC/AIXgU4xsWuevS+ylNVyVmVKi1rrmJ2XpVANILkF18x1fmEu
	SmGxgvyMdddDAROboAU1lUh6HImmOrToBx0wuA6a4Xam8oLWtLaPKMh5bUeJZNIYiA2I0AfbHf7jy
	B0kxXFm75zjjZ+GWvJhZaINdy3ZEdhVUUmC3W314gjbOK5xKRTbUfCE+naxcwrkdplU7a/jBJteCo
	QlM0fiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RoI-00000005Zur-3e3K;
	Thu, 16 Oct 2025 17:30:42 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ro5-00000005Zgm-2tGB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:33 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-290bd7c835dso6032215ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635828; x=1761240628; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RviFSJTeDXrAnxp03nizg0uEL1EB4BJAqQICQBGlk4U=;
        b=gREqbz9XF2RVSmJOFG1V3CkgS+wUy/UlmOdoeEZUph9QUntXyTo6ak7cCvijQXQotf
         e89lH0MzxGYWr83nbO9y8r5oPsJmGijdCdpTITp9pluTh2n3Ah6n1GHG09V2B/TJwDzL
         eoGLQqIMpj57iuR/rEiSfklghWk1soR6UZF3njpziDdBHDyVLjg+9KmPZgABe+scuFxw
         7eO86G2sm+ILrTuxFG3+kUjMk8iLsAQTfv8MMlndRh2ALXXvxZ5LDxJyx0H69VNu2lVd
         wZNA+5Om3QiQmmeoLm5XZViuR2HfFU0Txubh/yzFtQpVCYkDlCMjGCxFGxOg1oCeDPFY
         Hseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635828; x=1761240628;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RviFSJTeDXrAnxp03nizg0uEL1EB4BJAqQICQBGlk4U=;
        b=t95fkN/5ibMEGuD6Aw6RT7o7sIaM9NGMptE3MuJsdyrLsog0FXzIeWr3/n4jpgyc0T
         UTHVw5Apns7LgZeDcvjGVoP2AIv1omn1HBTPQ/+ofwZTFdxfVd54ypGDAyoSC+nlvYle
         YbH5CSdySOgAyy5jCJTRKngoIWVExT4szh/QMtOZCv1KcYpTuwAGZKIyNEFbvIkGFiOw
         1DRX/AMrxXvr9uwVr4iSJ54Ln2diH17XIlRRvqSHDHL3s3/rc0wSjqTvkUz6wZ8ggBJw
         UE4lVVLnxPx7TnYOKXsrkLg8+KOlEfo2b53LSDrXYwb1fUcIaS2QAkn/ePG14uHSfZCn
         QDrA==
X-Gm-Message-State: AOJu0YxRlDWFl9mqfsdxSyGvV0FHa3fon3X11OHtOKbN1NVlx0WPScOC
	kb7Kdipi60Ko6jJWKhtcTgtVQRfaAXJANZji9i8agicG2qHQ7dPA+BCRmkT1AmyU62NSo7J4G9Z
	u2HC0Tw==
X-Google-Smtp-Source: AGHT+IF/2wryDBFn3Vm/ZItHrOO8Cutyh10iJkyo92xaEeL3XVP9OxJeQvoekCLXXPfR84HIRIYnmu6+FJY=
X-Received: from plsq3.prod.google.com ([2002:a17:902:bd83:b0:27e:ec80:30c6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:b8b:b0:24c:ed95:2725
 with SMTP id d9443c01a7336-290c9c89badmr7138805ad.4.1760635828021; Thu, 16
 Oct 2025 10:30:28 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:52 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-12-seanjc@google.com>
Subject: [PATCH v13 11/12] KVM: selftests: Add guest_memfd tests for mmap and
 NUMA policy support
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
X-CRM114-CacheID: sfid-20251016_103029_809286_27265A7F 
X-CRM114-Status: GOOD (  18.28  )
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

From: Shivank Garg <shivankg@amd.com>

Add tests for NUMA memory policy binding and NUMA aware allocation in
guest_memfd. This extends the existing selftests by adding proper
validation for:
  - KVM GMEM set_policy and get_policy() vm_ops functionality using
    mbind() and get_mempolicy()
  - NUMA policy application before and after memory allocation

Run the NUMA mbind() test with and without INIT_SHARED, as KVM should allow
doing mbind(), madvise(), etc. on guest-private memory, e.g. so that
userspace can set NUMA policy for CoCo VMs.

Run the NUMA allocation test only for INIT_SHARED, i.e. if the host can't
fault-in memory (via direct access, madvise(), etc.) as move_pages()
returns -ENOENT if the page hasn't been faulted in (walks the host page
tables to find the associated folio)

[sean: don't skip entire test when running on non-NUMA system, test mbind()
       with private memory, provide more info in assert messages]

Signed-off-by: Shivank Garg <shivankg@amd.com>
Tested-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index e7d9aeb418d3..618c937f3c90 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -19,6 +19,7 @@
 #include <sys/stat.h>
 
 #include "kvm_util.h"
+#include "numaif.h"
 #include "test_util.h"
 #include "ucall_common.h"
 
@@ -75,6 +76,101 @@ static void test_mmap_supported(int fd, size_t total_size)
 	kvm_munmap(mem, total_size);
 }
 
+static void test_mbind(int fd, size_t total_size)
+{
+	const unsigned long nodemask_0 = 1; /* nid: 0 */
+	unsigned long nodemask = 0;
+	unsigned long maxnode = 8;
+	int policy;
+	char *mem;
+	int ret;
+
+	if (!is_multi_numa_node_system())
+		return;
+
+	mem = kvm_mmap(total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd);
+
+	/* Test MPOL_INTERLEAVE policy */
+	kvm_mbind(mem, page_size * 2, MPOL_INTERLEAVE, &nodemask_0, maxnode, 0);
+	kvm_get_mempolicy(&policy, &nodemask, maxnode, mem, MPOL_F_ADDR);
+	TEST_ASSERT(policy == MPOL_INTERLEAVE && nodemask == nodemask_0,
+		    "Wanted MPOL_INTERLEAVE (%u) and nodemask 0x%lx, got %u and 0x%lx",
+		    MPOL_INTERLEAVE, nodemask_0, policy, nodemask);
+
+	/* Test basic MPOL_BIND policy */
+	kvm_mbind(mem + page_size * 2, page_size * 2, MPOL_BIND, &nodemask_0, maxnode, 0);
+	kvm_get_mempolicy(&policy, &nodemask, maxnode, mem + page_size * 2, MPOL_F_ADDR);
+	TEST_ASSERT(policy == MPOL_BIND && nodemask == nodemask_0,
+		    "Wanted MPOL_BIND (%u) and nodemask 0x%lx, got %u and 0x%lx",
+		    MPOL_BIND, nodemask_0, policy, nodemask);
+
+	/* Test MPOL_DEFAULT policy */
+	kvm_mbind(mem, total_size, MPOL_DEFAULT, NULL, 0, 0);
+	kvm_get_mempolicy(&policy, &nodemask, maxnode, mem, MPOL_F_ADDR);
+	TEST_ASSERT(policy == MPOL_DEFAULT && !nodemask,
+		    "Wanted MPOL_DEFAULT (%u) and nodemask 0x0, got %u and 0x%lx",
+		    MPOL_DEFAULT, policy, nodemask);
+
+	/* Test with invalid policy */
+	ret = mbind(mem, page_size, 999, &nodemask_0, maxnode, 0);
+	TEST_ASSERT(ret == -1 && errno == EINVAL,
+		    "mbind with invalid policy should fail with EINVAL");
+
+	kvm_munmap(mem, total_size);
+}
+
+static void test_numa_allocation(int fd, size_t total_size)
+{
+	unsigned long node0_mask = 1;  /* Node 0 */
+	unsigned long node1_mask = 2;  /* Node 1 */
+	unsigned long maxnode = 8;
+	void *pages[4];
+	int status[4];
+	char *mem;
+	int i;
+
+	if (!is_multi_numa_node_system())
+		return;
+
+	mem = kvm_mmap(total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd);
+
+	for (i = 0; i < 4; i++)
+		pages[i] = (char *)mem + page_size * i;
+
+	/* Set NUMA policy after allocation */
+	memset(mem, 0xaa, page_size);
+	kvm_mbind(pages[0], page_size, MPOL_BIND, &node0_mask, maxnode, 0);
+	kvm_fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, page_size);
+
+	/* Set NUMA policy before allocation */
+	kvm_mbind(pages[0], page_size * 2, MPOL_BIND, &node1_mask, maxnode, 0);
+	kvm_mbind(pages[2], page_size * 2, MPOL_BIND, &node0_mask, maxnode, 0);
+	memset(mem, 0xaa, total_size);
+
+	/* Validate if pages are allocated on specified NUMA nodes */
+	kvm_move_pages(0, 4, pages, NULL, status, 0);
+	TEST_ASSERT(status[0] == 1, "Expected page 0 on node 1, got it on node %d", status[0]);
+	TEST_ASSERT(status[1] == 1, "Expected page 1 on node 1, got it on node %d", status[1]);
+	TEST_ASSERT(status[2] == 0, "Expected page 2 on node 0, got it on node %d", status[2]);
+	TEST_ASSERT(status[3] == 0, "Expected page 3 on node 0, got it on node %d", status[3]);
+
+	/* Punch hole for all pages */
+	kvm_fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, total_size);
+
+	/* Change NUMA policy nodes and reallocate */
+	kvm_mbind(pages[0], page_size * 2, MPOL_BIND, &node0_mask, maxnode, 0);
+	kvm_mbind(pages[2], page_size * 2, MPOL_BIND, &node1_mask, maxnode, 0);
+	memset(mem, 0xaa, total_size);
+
+	kvm_move_pages(0, 4, pages, NULL, status, 0);
+	TEST_ASSERT(status[0] == 0, "Expected page 0 on node 0, got it on node %d", status[0]);
+	TEST_ASSERT(status[1] == 0, "Expected page 1 on node 0, got it on node %d", status[1]);
+	TEST_ASSERT(status[2] == 1, "Expected page 2 on node 1, got it on node %d", status[2]);
+	TEST_ASSERT(status[3] == 1, "Expected page 3 on node 1, got it on node %d", status[3]);
+
+	kvm_munmap(mem, total_size);
+}
+
 static void test_fault_sigbus(int fd, size_t accessible_size, size_t map_size)
 {
 	const char val = 0xaa;
@@ -273,11 +369,13 @@ static void __test_guest_memfd(struct kvm_vm *vm, uint64_t flags)
 		if (flags & GUEST_MEMFD_FLAG_INIT_SHARED) {
 			gmem_test(mmap_supported, vm, flags);
 			gmem_test(fault_overflow, vm, flags);
+			gmem_test(numa_allocation, vm, flags);
 		} else {
 			gmem_test(fault_private, vm, flags);
 		}
 
 		gmem_test(mmap_cow, vm, flags);
+		gmem_test(mbind, vm, flags);
 	} else {
 		gmem_test(mmap_not_supported, vm, flags);
 	}
-- 
2.51.0.858.gf9c4a03a3a-goog


