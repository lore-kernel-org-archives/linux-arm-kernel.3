Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFD0E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GtNJo0QiZibz4F5AJzlr0Gn0CnNz2HNSdOIlXuZpqw4=; b=yzVB+umAX22O8zaYTMoJebDwWa
	wfGrzfPe7fwb7SMz9fUqYexgObeSyTx7Ql36q6GHhzuq79E8nAgSRFNAYAV4DEDfUZkixWsK5YJYz
	3kpq7gap4I8T9cC17ksskaoG6oQvEsAU5y70hOROQzUC1dOSQXcGPWmOzuB2e37QTVSmQzcHexNqK
	q9131QzSiUEXmshR8Y2XwsqPKAoY7iXH3mLvvFGMFps72h5LftlcE23nTWlYRgzrJk8hr5H/3KpXX
	UeUF3ivKV3KT728Fuu+/IBCqGZ9Mb1m2uc7AAMcL2wsFDhM0K1cKIa0RwIzYy9LphF6s4xsVVcH3P
	YtSCH6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIurH-0000000DeKh-2TXN;
	Wed, 04 Dec 2024 19:16:23 +0000
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupF-0000000Ddff-1LZB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:19 +0000
Received: by mail-vs1-xe49.google.com with SMTP id ada2fe7eead31-4afb0276095so10742137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339655; x=1733944455; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GtNJo0QiZibz4F5AJzlr0Gn0CnNz2HNSdOIlXuZpqw4=;
        b=KIMlkje596m24cQskaCirsI/WBT9vWINOJUF/wslHjBxoXSYL5ikWD0qtW/bdB1Y7z
         m8LYpdCg1tVnP1oxXmfo6zWMjw4rmRXWssHcyWu+71SvZF/vOfF7Wmn0HRbYNHRhkm8J
         8TX/sKDHza6qE79+JJ6vW8eRhYbJkqPHZPw4h8YSfRM74BT7OU/PUVrlPaK4VtErVSEg
         XEvrbt8ZQ2Vj+MRmRHUX35xHZjcTqdKdgx5CNVr++rxbjEKKbNFh2k3uR37HF8nOdv9f
         6CiRJuoRMzDwLy5XQzVaDPtLJPtr4aYxNCFlutNbRp4pmduVHI2ApUVryi9k8JgXLCnH
         cj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339655; x=1733944455;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtNJo0QiZibz4F5AJzlr0Gn0CnNz2HNSdOIlXuZpqw4=;
        b=mYh4UNMxysHx0mywt7yC3zydF+S/abeE2yFYYEF+vJyCsCz9I+3Rgau7E7hNVV7EWk
         3hksKevKtOqvOx4NbFq/daIoK1l9L6fe5Z+BoXeuBAp4Uxloo6RKaGWBZkN/p1oobSvU
         mSkqytpL2rTp0RVXRPtVi0qz25mfhPR2OQ9CKkRnnXw58ak47VxDxR+BRWiHZfFQgDj0
         hXamw2e/U2ou4VdihPMfxycvPEuRkhTkqUw7Qq4MxXpATVOG3sTYE7sKdAQKTE8XYryG
         ihHyVNijrrsmaA4Y6KkebY3EHTnA8COkPmJIrMngVh9d8rfcw4JW5ppXiB1cpPG5EsTF
         4WPA==
X-Forwarded-Encrypted: i=1; AJvYcCWRl0KLPvCc8xKgAGkRmtSVUrLwF/Cg7YpYtcdjh3DMQG2lq+mUKeeVZGhA3MvTqy/r67IgtSzSdjq3SDC9U12z@lists.infradead.org
X-Gm-Message-State: AOJu0YxKfxCbu3Ozl81ah7Ldg+Aq0xXTYmPfJEtbhXbFH5hFh/5xJ+/A
	s73kc/U/RfROWff5WNYkvtE+fqIckbq1/M7KOQRZt2poE8vsPGcFOIFugELBXliTEyZT4VyMeSg
	9xQfD3T8eM301119juQ==
X-Google-Smtp-Source: AGHT+IF1BXeXjzm2ynkFwLfcOwwZSEy3kJcGkjF9TH4hluS8IOC1jCo7DbvQ0TVKaPL1457lCJsGhUwjD3KkdK7U
X-Received: from vsbhy8.prod.google.com ([2002:a67:e7c8:0:b0:4af:497d:2ec1])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3ed2:b0:4af:58f7:15ec with SMTP id ada2fe7eead31-4af971fcbddmr10423490137.4.1733339655146;
 Wed, 04 Dec 2024 11:14:15 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-1-jthoughton@google.com>
Subject: [PATCH v1 00/13] KVM: Introduce KVM Userfault
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111417_363390_DBC44E78 
X-CRM114-Status: GOOD (  19.60  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This is a continuation of the original KVM Userfault RFC[1] from July.
It contains the simplifications we talked about at LPC[2].

Please see the RFC[1] for the problem description. In summary,
guest_memfd VMs have no mechanism for doing post-copy live migration.
KVM Userfault provides such a mechanism. Today there is no upstream
mechanism for installing memory into a guest_memfd, but there will
be one soon (e.g. [3]).

There is a second problem that KVM Userfault solves: userfaultfd-based
post-copy doesn't scale very well. KVM Userfault when used with
userfaultfd can scale much better in the common case that most post-copy
demand fetches are a result of vCPU access violations. This is a
continuation of the solution Anish was working on[4]. This aspect of
KVM Userfault is important for userfaultfd-based live migration when
scaling up to hundreds of vCPUs with ~30us network latency for a
PAGE_SIZE demand-fetch.

The implementation in this series is version than the RFC[1]. It adds...
 1. a new memslot flag is added: KVM_MEM_USERFAULT,
 2. a new parameter, userfault_bitmap, into struct kvm_memory_slot,
 3. a new KVM_RUN exit reason: KVM_MEMORY_EXIT_FLAG_USERFAULT,
 4. a new KVM capability KVM_CAP_USERFAULT.

KVM Userfault does not attempt to catch KVM's own accesses to guest
memory. That is left up to userfaultfd.

When enabling KVM_MEM_USERFAULT for a memslot, the second-stage mappings
are zapped, and new faults will check `userfault_bitmap` to see if the
fault should exit to userspace.

When KVM_MEM_USERFAULT is enabled, only PAGE_SIZE mappings are
permitted.

When disabling KVM_MEM_USERFAULT, huge mappings will be reconstructed
(either eagerly or on-demand; the architecture can decide).

KVM Userfault is not compatible with async page faults. Nikita has
proposed a new implementation of async page faults that is more
userspace-driven that *is* compatible with KVM Userfault[5].

Performance
===========

The takeaways I have are:

1. For cases where lock contention is not a concern, there is a
   discernable win because KVM Userfault saves the trip through the
   userfaultfd poll/read/WAKE cycle.

2. Using a single userfaultfd without KVM Userfault gets very slow as
   the number of vCPUs increases, and it gets even slower when you add
   more reader threads. This is due to contention on the userfaultfd
   wait_queue locks. This is the contention that KVM Userfault avoids.
   Compare this to the multiple-userfaultfd runs; they are much faster
   because the wait_queue locks are sharded perfectly (1 per vCPU).
   Perfect sharding is only possible because the vCPUs are configured to
   touch only their own chunk of memory.

Config:
 - 64M per vcpu
 - vcpus only touch their 64M (`-b 64M -a`)
 - THPs disabled
 - MGLRU disabled

Each run used the following command:

./demand_paging_test -b 64M -a -v <#vcpus>  \
	-s shmem		     \ # if using shmem
	-r <#readers> -u <uffd_mode> \ # if using userfaultfd
	-k \			     \ # if using KVM Userfault
	-m 3			       # when on arm64

note: I patched demand_paging_test so that, when using shmem, the page
      cache will always be preallocated, not only in the `-u MINOR`
      case. Otherwise the comparison would be unfair. I left this patch
      out in the selftest commits, but I am happy to add it if it would
      be useful.

== x86 (96 LPUs, 48 cores, TDP MMU enabled) ==

-- Anonymous memory, single userfaultfd

	userfault mode
vcpus				2	8	64
	no userfault		306845	220402	47720
	MISSING (single reader)	90724	26059	3029
	MISSING			86840	37912	1664
	MISSING + KVM UF	143021	104385	34910
	KVM UF			160326	128247	39913

-- shmem (preallocated), single userfaultfd

vcpus				2	8	64
	no userfault		375130	214635	54420
	MINOR (single reader)	102336	31704	3244
	MINOR 			97981	36982	1673
	MINOR + KVM UF		161835	113716	33577
	KVM UF			181972	131204	42914

-- shmem (preallocated), multiple userfaultfds

vcpus				2	8	64
	no userfault		374060	216108	54433
	MINOR			102661	56978	11300
	MINOR + KVM UF		167080	123461	48382
	KVM UF			180439	122310	42539

== arm64 (96 PEs, AmpereOne) ==

-- shmem (preallocated), single userfaultfd

vcpus:				2	8	64
	no userfault		419069	363081	34348
	MINOR (single reader)	87421	36147	3764
	MINOR			84953	43444	1323
	MINOR + KVM UF		164509	139986	12373
	KVM UF			185706	122153	12153

-- shmem (preallocated), multiple userfaultfds

vcpus:				2	8	64
	no userfault		401931	334142	36117
	MINOR			83696	75617	15996
	MINOR + KVM UF		176327	115784	12198
	KVM UF			190074	126966	12084

This series is based on the latest kvm/next.

[1]: https://lore.kernel.org/kvm/20240710234222.2333120-1-jthoughton@google.com/
[2]: https://lpc.events/event/18/contributions/1757/
[3]: https://lore.kernel.org/kvm/20241112073837.22284-1-yan.y.zhao@intel.com/
[4]: https://lore.kernel.org/all/20240215235405.368539-1-amoorthy@google.com/
[5]: https://lore.kernel.org/kvm/20241118123948.4796-1-kalyazin@amazon.com/#t

James Houghton (13):
  KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
  KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
  KVM: Allow late setting of KVM_MEM_USERFAULT on guest_memfd memslot
  KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
  KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
  KVM: arm64: Add support for KVM_MEM_USERFAULT
  KVM: selftests: Fix vm_mem_region_set_flags docstring
  KVM: selftests: Fix prefault_mem logic
  KVM: selftests: Add va_start/end into uffd_desc
  KVM: selftests: Add KVM Userfault mode to demand_paging_test
  KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
  KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd toggle tests
  KVM: Documentation: Add KVM_CAP_USERFAULT and KVM_MEM_USERFAULT
    details

 Documentation/virt/kvm/api.rst                |  33 +++-
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          |  23 ++-
 arch/x86/kvm/Kconfig                          |   1 +
 arch/x86/kvm/mmu/mmu.c                        |  27 +++-
 arch/x86/kvm/mmu/mmu_internal.h               |  20 ++-
 arch/x86/kvm/x86.c                            |  36 +++--
 include/linux/kvm_host.h                      |  19 ++-
 include/uapi/linux/kvm.h                      |   6 +-
 .../selftests/kvm/demand_paging_test.c        | 145 ++++++++++++++++--
 .../testing/selftests/kvm/include/kvm_util.h  |   5 +
 .../selftests/kvm/include/userfaultfd_util.h  |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  42 ++++-
 .../selftests/kvm/lib/userfaultfd_util.c      |   2 +
 .../selftests/kvm/set_memory_region_test.c    |  33 ++++
 virt/kvm/Kconfig                              |   3 +
 virt/kvm/kvm_main.c                           |  47 +++++-
 17 files changed, 409 insertions(+), 36 deletions(-)


base-commit: 4d911c7abee56771b0219a9fbf0120d06bdc9c14
-- 
2.47.0.338.g60cca15819-goog


