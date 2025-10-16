Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82704CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fw6xiHjKYy4zBKVTH7gEKmT2HMgfZtlJ6SEn7/JK9n0=; b=qsirsSA6JHVM732ci6AoVh3ZYm
	o+sbYwjZtdyB3KADN4WKjRX18NI9re0PZ1srRDAXvNmCmHhGgzmhgeEdGT/N7GlglY0Wv0HAQ0iXF
	90m4EQnY5WSy8xsRbv8boKEesJJn6G8VzK7SE43GVltmXLNKOu5DKXISDcuF6x0OYwdbF/vHNWAq9
	zdVN81zFGB1JweaBLgoNoXlfUUtd10Z1sCcBrAfhEDguqLeWmhXLFgp7CMO1jtNkl6c89cPy8KgHx
	wr88NxftaJ8JlEKL/Xh9cWSTEhapCFwBmMHcS0hciyIJTYihHv+YbI0mXjh+rTZa4xUyU5jG9PV53
	MWB9ym2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rno-00000005ZYw-1TtS;
	Thu, 16 Oct 2025 17:30:12 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rnl-00000005ZYE-296Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:11 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33ba9047881so1480102a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635808; x=1761240608; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw6xiHjKYy4zBKVTH7gEKmT2HMgfZtlJ6SEn7/JK9n0=;
        b=2I6x0sae5jq+DANJ87Ix7vvEzswLdf7mpoxgMVFsrYIvRn6N/pqWf98PIE45ckSIx/
         PCtnsIeZ1ApDjXwFaCCGj4DQ9msGRHuJVpqUrE3h/xCxGJIJXHJOZkEpC5wNmJxwquxH
         /A7Gv/Lb8MgHFZHziFn2aJq2sXQYUfg1tEBNMUmgMHi7walEzsoyiZF7DWsQk7WFqaPz
         575pU/WT6Ckm1EkJWQrKDNuUFH1+DvODJwNaBFkdPzdLxBa2U9uhfPybiTI/ljzr2btA
         ZQKU7qUIoIEkXdgg58TEtkWrbqTv8LvX8gUpXgy/ktH3oFpyCVp0z24+vwymLsCfpsxi
         gG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635808; x=1761240608;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fw6xiHjKYy4zBKVTH7gEKmT2HMgfZtlJ6SEn7/JK9n0=;
        b=d7G8R+dAQkuCML4wFmvDDG+WwiODWwqRUAKR0O93NiiqxDQ7WiorHYMGJAkTCylrGp
         bakmnIeUjkNQ9nW73FFAITBzm82M6K86/ewQf+2j7QJpP6eJNS0ewaWFe2MXoJsGkLEU
         Y5x7C41TG8he9mEVZpEsKvNVRb1X4CodEMHZyJ0k+VAWSAc1y2Y9F+CZ9GBAVE0T4Jw3
         RE2GAskicG1Y13MLedkrsIrqkZ1guaDa5yidFNiVa+KW/a+wi4/4sosh4fSDykL+enFq
         tInkLycQljBN5zVUskZx/Itfe6wCFPf8hPZvNJlWTp7kMtpJn+B8cht1BsxzYgf4R2MF
         78Lw==
X-Gm-Message-State: AOJu0Yz0Duw+bUevd9zpRsvBiP2RAfPeE1t7vzPwjU50493XLjTCKB5z
	T+e0ZhMNckzLE5hsQxJnzJUN4Iu4MnefswmjTas8nR/UeFhs++6uuvVW7/SoWEPi3CXrqaQT/XZ
	VnePpqg==
X-Google-Smtp-Source: AGHT+IEE+9lWsoGbrE1FsDpaiwGYQEz8y5mwph7bonrhgYb3kvgC58w2qMMIJ/4cUT39VkATDSw/u6xjb6I=
X-Received: from pjbpa17.prod.google.com ([2002:a17:90b:2651:b0:33b:51fe:1a8c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f4c:b0:32e:11cc:d17a
 with SMTP id 98e67ed59e1d1-33b9e08ff85mr5705111a91.4.1760635808296; Thu, 16
 Oct 2025 10:30:08 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:41 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-1-seanjc@google.com>
Subject: [PATCH v13 00/12] KVM: guest_memfd: Add NUMA mempolicy support
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
X-CRM114-CacheID: sfid-20251016_103010_414374_F6C24761 
X-CRM114-Status: GOOD (  17.19  )
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

Miguel, you got pulled in due to a one-line change to add a new iterator
macros in .clang-format.

Shivank's series to add support for NUMA-aware memory placement in
guest_memfd.  Based on kvm-x86/next.

Note, Ackerley pointed out that we should probably have testing for the
cpuset_do_page_mem_spread() behavior.  I 100% agree, but I'm also a-ok
merging without those tests.

v13:
 - Collect reviews.
 - Add kvm_gmem_for_each_file to .clang-format. [Ackerley]
 - Fix typos. [Ackerley]
 - Don't use get_task_policy() if the guest_memfd doesn't have its own
   policy, so that cpuset_do_page_mem_spread() works. [Ackerley]
 - Fix goofs in the changelogs related to numaif.h. [Ackerley]

v12:
 - https://lore.kernel.org/all/20251007221420.344669-1-seanjc@google.com
 - Add missing functionality to KVM selftests' existing numaif.h instead of
   linking to libnuma (which appears to have caveats with -static).
 - Add KVM_SYSCALL_DEFINE() infrastructure to reduce the boilerplate needed
   to wrap syscalls and/or to assert that a syscall succeeds.
 - Rename kvm_gmem to gmem_file, and use gmem_inode for the inode structure.
 - Track flags in a gmem_inode field instead of using i_private.
 - Add comments to call out subtleties in the mempolicy code (e.g. that
   returning NULL for vm_operations_struct.get_policy() is important for ABI
   reasons).
 - Improve debugability of guest_memfd_test (I kept generating SIGBUS when
   tweaking the tests).
 - Test mbind() with private memory (sadly, verifying placement with
   move_pages() doesn't work due to the dependency on valid page tables).

- V11: Rebase on kvm-next, remove RFC tag, use Ackerley's latest patch
       and fix a rcu race bug during kvm module unload.
- V10: Rebase on top of Fuad's V17. Use latest guest_memfd inode patch
       from Ackerley (with David's review comments). Use newer kmem_cache_create()
       API variant with arg parameter (Vlastimil)
- v9: Rebase on top of Fuad's V13 and incorporate review comments
- v8: Rebase on top of Fuad's V12: Host mmaping for guest_memfd memory.
- v7: Use inodes to store NUMA policy instead of file [0].
- v4-v6: Current approach using shared_policy support and vm_ops (based on
         suggestions from David [1] and guest_memfd bi-weekly upstream
         call discussion [2]).
- v3: Introduced fbind() syscall for VMM memory-placement configuration.
- v1,v2: Extended the KVM_CREATE_GUEST_MEMFD IOCTL to pass mempolicy.

[0] https://lore.kernel.org/all/diqzbjumm167.fsf@ackerleytng-ctop.c.googlers.com
[1] https://lore.kernel.org/all/6fbef654-36e2-4be5-906e-2a648a845278@redhat.com
[2] https://lore.kernel.org/all/2b77e055-98ac-43a1-a7ad-9f9065d7f38f@amd.com

Ackerley Tng (1):
  KVM: guest_memfd: Use guest mem inodes instead of anonymous inodes

Sean Christopherson (7):
  KVM: guest_memfd: Rename "struct kvm_gmem" to "struct gmem_file"
  KVM: guest_memfd: Add macro to iterate over gmem_files for a
    mapping/inode
  KVM: selftests: Define wrappers for common syscalls to assert success
  KVM: selftests: Report stacktraces SIGBUS, SIGSEGV, SIGILL, and SIGFPE
    by default
  KVM: selftests: Add additional equivalents to libnuma APIs in KVM's
    numaif.h
  KVM: selftests: Use proper uAPI headers to pick up mempolicy.h
    definitions
  KVM: guest_memfd: Add gmem_inode.flags field instead of using
    i_private

Shivank Garg (4):
  KVM: guest_memfd: Add slab-allocated inode cache
  KVM: guest_memfd: Enforce NUMA mempolicy using shared policy
  KVM: selftests: Add helpers to probe for NUMA support, and multi-node
    systems
  KVM: selftests: Add guest_memfd tests for mmap and NUMA policy support

 .clang-format                                 |   1 +
 include/uapi/linux/magic.h                    |   1 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c  |   2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |  98 ++++++
 .../selftests/kvm/include/kvm_syscalls.h      |  81 +++++
 .../testing/selftests/kvm/include/kvm_util.h  |  29 +-
 tools/testing/selftests/kvm/include/numaif.h  | 110 +++---
 .../selftests/kvm/kvm_binary_stats_test.c     |   4 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  55 +--
 .../kvm/x86/private_mem_conversions_test.c    |   9 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |   5 +-
 virt/kvm/guest_memfd.c                        | 331 ++++++++++++++----
 virt/kvm/kvm_main.c                           |   7 +-
 virt/kvm/kvm_mm.h                             |   9 +-
 14 files changed, 565 insertions(+), 177 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/kvm_syscalls.h


base-commit: f222788458c8a7753d43befef2769cd282dc008e
-- 
2.51.0.858.gf9c4a03a3a-goog


