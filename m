Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE87CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 20:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Svmg4fC9qEdNkkbW7Zw7TQK03ok0QyEpUIGM0MaKbU=; b=n9iN96Ui+t4Cwi4xy7nVT6wIbt
	Ey2p/plvaN9ItpWuOoSs8LtE9ydklGYtiwCI3kkQoRGLtlzTYGe+ya1ah8s9l8+qAMhu4afV3mQmx
	43opJT1tM4J5fQ/9BNYrwWvq0ZYsOPIDWUIduhDEz/MqsnHOVHbAPP2x0Il7lf3LCQg688D+B4aj8
	N0SQzgBhEWGkqWwt98lmnNBxixZr68W/417K1fCq/FTD35kH2tlrTX8HmYS46DtD0Qwbz2nRE2ExY
	pbzi7zlOfx+UFvz9esqPd/QmXNpynDkCHWTeh3QV5gezqNRNlM8HvCl6DLVVHTmQd3VQi6WCPjCRT
	0QdFVl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xil-000000077Dg-3kVB;
	Thu, 09 Oct 2025 20:58:43 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xij-000000077D3-3sdZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 20:58:43 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso2588447a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760043520; x=1760648320; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Svmg4fC9qEdNkkbW7Zw7TQK03ok0QyEpUIGM0MaKbU=;
        b=CSv20pENu4CCHy4OSv3T0sggYN+D/XhfEUbRZ2lLWLHdKVHeyzj4s1yXitqiwn88ET
         Xtl4Msmf0L8ONahvwYORE45EnhXZmBRPKDI5wkweSHmry1hJ/GgdA1H1y2UuDK5IKn+/
         feoX3PZtrug9SLpaYIWAMreoDzoOiaMELGHVERWmsJ5/ZO6iEsVo1sWmxdMOJw2cIlFY
         FhP3LhDQ5uQN+N1pBFkqM0TzPet0Xoda8g4W8Q1eixOkbg5HZ1UYN+V2xrC7acFpV2el
         i2OtdIJkHGyM1hBEh7Nr0z0K8kHgqcPe+wzK3+zScu7MA/TeGdkBSAj5t3NIRdd7Ep9X
         mH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760043520; x=1760648320;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Svmg4fC9qEdNkkbW7Zw7TQK03ok0QyEpUIGM0MaKbU=;
        b=Rkj/cMM0f8meTNxenUQxfLdkjo3G0hHotl2xN7qRodIk3IYMRRujf7IijzLbcvHzmE
         fIBbYq6sbRmolNRJDnK+GRnycVwYNSVcRafCe9+FbPwvvSoL0HM/eWLfSozwIjZGREHv
         Jct1D8EH/t6VwOtrW037vu6EzAXfywnH4RvPs9ZLShp2nvGjwKyCBgL69q7SHrcghe88
         KFqWRdwNe6anHBgWGbnyNkfyJgbL3OnZVw3rHavumPODCLFn1BFsWVILqvz+fd6e+mq/
         48MCYGqy+FDUqxhW4eenYszoqipTEsFmmfFop6Y3aU08yqenRd1Ma5RQM8zUX/2bhsDd
         6n1Q==
X-Gm-Message-State: AOJu0YxNaHOeXmZhi0gNhz2Abo8U518WWdWXRz7SIB532PjHC6yH8jva
	0fgND+xEGtQeIgHV0GjEbOlO7KG1dDBrbM2Qvbeek0ooNRuBCMyJQShrb+sEpHpy2PwGYlg9VvO
	OH4YDM/EVM7oAPfdtnOMulShjXg==
X-Google-Smtp-Source: AGHT+IF2ixNEPysZXr3u0xayZWztnMtb0Ewpjd6TyH2GT7xRzPzkdMEBQLXdOtzl9AkJxD9WHYyAbFyQ74Srl6hOyQ==
X-Received: from pjtv5.prod.google.com ([2002:a17:90a:c905:b0:332:7fae:e138])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:52cc:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-33b511185e2mr11670768a91.9.1760043520294;
 Thu, 09 Oct 2025 13:58:40 -0700 (PDT)
Date: Thu, 09 Oct 2025 13:58:24 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
Message-ID: <diqz5xcniyhb.fsf@google.com>
Subject: Re: [PATCH v12 00/12] KVM: guest_memfd: Add NUMA mempolicy support
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_135841_985585_4D645ACE 
X-CRM114-Status: GOOD (  25.91  )
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

Sean Christopherson <seanjc@google.com> writes:

> Shivank's series to add support for NUMA-aware memory placement in
> guest_memfd.  This is based on:
>
>   https://github.com/kvm-x86/linux.git gmem
>
> which is an unstable topic branch that contains the guest_memfd MMAP fixes
> destined for 6.18 (to avoid conflicts), and three non-KVM changes related to
> mempolicy that were in previous versions of this series

For future reference, these are the three specific patches:

[1] https://lore.kernel.org/all/20250827175247.83322-4-shivankg@amd.com/
[2] https://lore.kernel.org/all/20250827175247.83322-5-shivankg@amd.com/
[3] https://lore.kernel.org/all/20250827175247.83322-6-shivankg@amd.com/

Might have missed this, did we discuss how these 3 would get merged? I
noticed this patch was withdrawn, not sure what that means: [4]

[4] https://lore.kernel.org/all/20250625000155.62D08C4CEE3@smtp.kernel.org/

> (I want to keep this
> version KVM focused, and AFAICT there is nothing left to discuss in the prep
> paches).
>
> Once 6.18-rc1 is cut I'll turn "gmem" into a proper topic branch, rebase it,
> and freeze the hashes.
>
> v12:
>  - Add missing functionality to KVM selftests' existing numaif.h instead of
>    linking to libnuma (which appears to have caveats with -static).
>  - Add KVM_SYSCALL_DEFINE() infrastructure to reduce the boilerplate needed
>    to wrap syscalls and/or to assert that a syscall succeeds.
>  - Rename kvm_gmem to gmem_file, and use gmem_inode for the inode structure.
>  - Track flags in a gmem_inode field instead of using i_private.
>  - Add comments to call out subtleties in the mempolicy code (e.g. that
>    returning NULL for vm_operations_struct.get_policy() is important for ABI
>    reasons).
>  - Improve debugability of guest_memfd_test (I kept generating SIGBUS when
>    tweaking the tests).
>  - Test mbind() with private memory (sadly, verifying placement with
>    move_pages() doesn't work due to the dependency on valid page tables).
>
> - V11: Rebase on kvm-next, remove RFC tag, use Ackerley's latest patch
>        and fix a rcu race bug during kvm module unload.
> - V10: Rebase on top of Fuad's V17. Use latest guest_memfd inode patch
>        from Ackerley (with David's review comments). Use newer kmem_cache_create()
>        API variant with arg parameter (Vlastimil)
> - v9: Rebase on top of Fuad's V13 and incorporate review comments
> - v8: Rebase on top of Fuad's V12: Host mmaping for guest_memfd memory.
> - v7: Use inodes to store NUMA policy instead of file [0].
> - v4-v6: Current approach using shared_policy support and vm_ops (based on
>          suggestions from David [1] and guest_memfd bi-weekly upstream
>          call discussion [2]).
> - v3: Introduced fbind() syscall for VMM memory-placement configuration.
> - v1,v2: Extended the KVM_CREATE_GUEST_MEMFD IOCTL to pass mempolicy.
>
> [0] https://lore.kernel.org/all/diqzbjumm167.fsf@ackerleytng-ctop.c.googlers.com
> [1] https://lore.kernel.org/all/6fbef654-36e2-4be5-906e-2a648a845278@redhat.com
> [2] https://lore.kernel.org/all/2b77e055-98ac-43a1-a7ad-9f9065d7f38f@amd.com
>
> Ackerley Tng (1):
>   KVM: guest_memfd: Use guest mem inodes instead of anonymous inodes
>
> Sean Christopherson (7):
>   KVM: guest_memfd: Rename "struct kvm_gmem" to "struct gmem_file"
>   KVM: guest_memfd: Add macro to iterate over gmem_files for a
>     mapping/inode
>   KVM: selftests: Define wrappers for common syscalls to assert success
>   KVM: selftests: Report stacktraces SIGBUS, SIGSEGV, SIGILL, and SIGFPE
>     by default
>   KVM: selftests: Add additional equivalents to libnuma APIs in KVM's
>     numaif.h
>   KVM: selftests: Use proper uAPI headers to pick up mempolicy.h
>     definitions
>   KVM: guest_memfd: Add gmem_inode.flags field instead of using
>     i_private
>
> Shivank Garg (4):
>   KVM: guest_memfd: Add slab-allocated inode cache
>   KVM: guest_memfd: Enforce NUMA mempolicy using shared policy
>   KVM: selftests: Add helpers to probe for NUMA support, and multi-node
>     systems
>   KVM: selftests: Add guest_memfd tests for mmap and NUMA policy support
>
>  include/uapi/linux/magic.h                    |   1 +
>  tools/testing/selftests/kvm/arm64/vgic_irq.c  |   2 +-
>  .../testing/selftests/kvm/guest_memfd_test.c  |  98 +++++
>  .../selftests/kvm/include/kvm_syscalls.h      |  81 +++++
>  .../testing/selftests/kvm/include/kvm_util.h  |  29 +-
>  tools/testing/selftests/kvm/include/numaif.h  | 110 +++---
>  .../selftests/kvm/kvm_binary_stats_test.c     |   4 +-
>  tools/testing/selftests/kvm/lib/kvm_util.c    |  55 +--
>  .../kvm/x86/private_mem_conversions_test.c    |   9 +-
>  .../selftests/kvm/x86/xapic_ipi_test.c        |   5 +-
>  virt/kvm/guest_memfd.c                        | 344 ++++++++++++++----
>  virt/kvm/kvm_main.c                           |   7 +-
>  virt/kvm/kvm_mm.h                             |   9 +-
>  13 files changed, 576 insertions(+), 178 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/kvm_syscalls.h
>
>
> base-commit: 67033eaa5ea2cb67b6cdaa91d7f5c42bfafb36f7
> -- 
> 2.51.0.710.ga91ca5db03-goog

