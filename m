Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230B7CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TmMr+35oqSfmP0HZIXQIA/YFMO4f30/qn0vmxY19vhg=; b=TCdtgg3mj29kcvwkPXS4VnspGv
	hEuhRgaGSkyL7uPCzOgpRcX2jTRWBT+yfDdZ4QfF0g0ick+rpwZ8ph1weqnIK2thdBG0VdUfYk/Gn
	HFnjyyKrfzT7USmWnl26rAfxO9JSJ3EB4+vQa5Td7mxYlnL4/oIVmmRy0iianljIn+Z9jKK6qrhQn
	xVR74UcVu1Wz6T6Qt4n6Z4xKinBVCXgwrtUZmy9WIvS8Yl8WhbS4O0r4Pgy7TtGh8ewCOjNUdp0V7
	7Pyuk8qRzIq2l2mevn7O5SGNhoLUPqy7Lwvm4ykMAWkzELesA9akDxar1fA8/UOKRwznZNanp/4N+
	w5mum/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxB-00000002qRi-0Nlc;
	Tue, 07 Oct 2025 22:14:41 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Fx8-00000002qR8-2Zar
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:14:39 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-26985173d8eso117880935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875277; x=1760480077; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmMr+35oqSfmP0HZIXQIA/YFMO4f30/qn0vmxY19vhg=;
        b=fyu4wppmPQvr46RTA3ohkQA8Q4Yyqgg7Jc5GivVr7WLoqfbbdwAUtsbnTLEofxKGUa
         WN7SMx5piKcimYCJdGeW9Sj4B36nU3SqaUxx8A0c/eAwjp87eiOmOGeKKWIQ4ZXjJfUb
         db3FYzHd5suLbflj2ybahqE0H/vRFXtOqATh5I51ykLb2/7Es/hJjYXjHAYOX+oBWu5a
         porFHlGYkYN6hEq5KZ/n29ViQe3oAu6msYUo1UDLop9MbwuUovLI3WSLWjFaL8n854ls
         eU3AK9yhYmLVrOT4SKS1CDcPLVJOgX2VebNF6ZQ07+caIh+8FcrGKufuHOzQPdq2Tg0+
         g8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875277; x=1760480077;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmMr+35oqSfmP0HZIXQIA/YFMO4f30/qn0vmxY19vhg=;
        b=WVMp3B22GgS4ayqxYoyqHZk174fs3SmahUdHhqL1bMS0oklKlc6ktHh4KbVUpFvDP4
         YLZ1qPNTxVSnxDbXsi74bmJLW4qCSLKhYkZu1zJT0Dpa7mPfCt4eSkdxjitkE5nKW16o
         +LdOn+NhacZqBQBE4ihqXmBxkf7mNBFUE7zMDOugnlkrCHAeH9RlMrxmA3+gutlzzPor
         R4Clu1ntG6NRGc4duLS2+0MIE0J7CsYFdzaP57bKk+oiKkbx9PW8K8oxbNaIQ6+gzOCH
         +dBwn664rr9xTAzpI0ax2AOKfJZ8PwYA8SUU4NQKNMsyvcDwV2DktjH44kjCAr/P9INQ
         t6mw==
X-Gm-Message-State: AOJu0YzmI96rQFXu3DBIsRXUXPbNKL3I4yNYb2BM5i5JOk5YMbERZTc1
	ONhaZxZBSC+E4Tvbc87C0y7dNbglGjImkLcVMs2zjrQOebCgmE8N4LbhPdGqN8eyHUFSJQzBa5o
	kjo8kwA==
X-Google-Smtp-Source: AGHT+IH40/3oJtT6BLYIY8yrwnu2Bd+0rWeu7YkPyebNcu0Zon9xu4JQyWq3gycTlYxIm/ZLLZj531D/TW0=
X-Received: from pldb2.prod.google.com ([2002:a17:902:ed02:b0:24c:cd65:485c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2350:b0:274:aab9:4ed4
 with SMTP id d9443c01a7336-29027312ffamr15750085ad.57.1759875277026; Tue, 07
 Oct 2025 15:14:37 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:08 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-1-seanjc@google.com>
Subject: [PATCH v12 00/12] KVM: guest_memfd: Add NUMA mempolicy support
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
X-CRM114-CacheID: sfid-20251007_151438_659726_D3CBD552 
X-CRM114-Status: GOOD (  16.81  )
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

Shivank's series to add support for NUMA-aware memory placement in
guest_memfd.  This is based on:

  https://github.com/kvm-x86/linux.git gmem

which is an unstable topic branch that contains the guest_memfd MMAP fixes
destined for 6.18 (to avoid conflicts), and three non-KVM changes related to
mempolicy that were in previous versions of this series (I want to keep this
version KVM focused, and AFAICT there is nothing left to discuss in the prep
paches).

Once 6.18-rc1 is cut I'll turn "gmem" into a proper topic branch, rebase it,
and freeze the hashes.

v12:
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

 include/uapi/linux/magic.h                    |   1 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c  |   2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |  98 +++++
 .../selftests/kvm/include/kvm_syscalls.h      |  81 +++++
 .../testing/selftests/kvm/include/kvm_util.h  |  29 +-
 tools/testing/selftests/kvm/include/numaif.h  | 110 +++---
 .../selftests/kvm/kvm_binary_stats_test.c     |   4 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  55 +--
 .../kvm/x86/private_mem_conversions_test.c    |   9 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |   5 +-
 virt/kvm/guest_memfd.c                        | 344 ++++++++++++++----
 virt/kvm/kvm_main.c                           |   7 +-
 virt/kvm/kvm_mm.h                             |   9 +-
 13 files changed, 576 insertions(+), 178 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/kvm_syscalls.h


base-commit: 67033eaa5ea2cb67b6cdaa91d7f5c42bfafb36f7
-- 
2.51.0.710.ga91ca5db03-goog


