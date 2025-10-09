Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F189CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 23:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDpIaffmoR6Qy88AeMwNPxO5iOtC8dDi++B0iTvo01A=; b=0Ta/mwbw5LvRuh/bvAdbZ0uIjj
	pWIiIlcIs+ThINe5nQJY9ydr1Vl2GXzGdWs935Zzn6CbYfxA4G/4cY7wRRndX2JprlAS061p7mhop
	W+MvvTbW3qVj9W6CcI9AAz04iu65XEPYOCEFZYvcYxPJTUElHWq/w5UDYfYEJaZtvj0j9w4Quv/Wz
	K2G3lkpU5eSndbQV4YeIf+JuXURUYG1Y2m7Ros+11LiIM7obd33wPjM/ZtQ/gmWn2R+qohESRWZVt
	CECj4+1SBlBf0vH+AUWrAyt4bkmzWdIWGPMggiZUg9D8JIItgj5r3YhueJRg7xQzf6+ho59B2ERAQ
	vjA9yToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zkf-00000007ILD-21pa;
	Thu, 09 Oct 2025 23:08:49 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zkd-00000007IKq-2z6z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 23:08:48 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befc5bso3581142a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 16:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760051326; x=1760656126; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDpIaffmoR6Qy88AeMwNPxO5iOtC8dDi++B0iTvo01A=;
        b=PDxTTJ/OPJbmzKpT58LNOgI/bqJkJmFbeh0fqye3CQZTIVN9dtJ+XdWoFcZZdRqYO2
         65LZYB9pLDIEqe4tOoK7GADv8MgCaKWtJN/6bBhFcK0VpTTKs30jvvx0KTY2EZbs19ne
         /b5xnv3YJRBZ8gOW9GWjAtfF0ZlUz2D16qzqwQWCh2pTlzsNL/smptkBqJJskNRhQKbw
         oPmalc93y+l6r9e88akVib++PAIS9VfGNpricQaq9/D5uKayNxa1cmoB6hwOU0fwoFU3
         AAbm2yUgSZvR15XqCPlQ8PtyDFpfTMjZe/iJvke9szeU/vAWTjh4XUB5OGKoU4boEBWy
         qTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760051326; x=1760656126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDpIaffmoR6Qy88AeMwNPxO5iOtC8dDi++B0iTvo01A=;
        b=gBFUaJRrH0XL0x/GqA4ewR8CjsKN7LEFAhAvJwYR1Vuxy6PxCbHouoMXrA22+h7Kdl
         UOEFQNpxeWyICM1aF0U6hqlay+BTo+wvlIGNVJ34B80mTT4RqkQK3FrfvnIJCT8/ebFq
         D0rbGQ0+pndCUIic5/Z9o5srSdFD2piszVe8L/YbIALk/7/Wz8clxsPAieCgAnnieDiO
         +x8OilQ4P7fmGoN4bIC+1k9Hm1bTtkezcSz3+1GvEDYyUmY3orx4AgTRUGsGxepMFqSB
         tVfgr8kF54Bkv8xiBSBjvpXxNEn221AIHyGdiWaSTABXK74O2M19zcIIrBeN2jivldSA
         IlgA==
X-Gm-Message-State: AOJu0YykWZGkULWSeNGMAXpvssJiCW/KLYjTNKsjUy0YmrfOqS9JLYib
	4YZbupIUUuCXEMtly5s2TE3JAq6H/KDRmrPGavzR24eLe2jG8ZS/Zz/QJprxOVXRZB28YB1JQEr
	7JZUvx9anuNZpAHAjGSvqQiCuZQ==
X-Google-Smtp-Source: AGHT+IEKbmOpgQyGpF8iZG/gJeSzfxpKObXTtqbwqaHzaJgPnDoFIt/+KkqyzPgCgGNzWKTNkqyAjVnIwO8aJ2WY7Q==
X-Received: from pjca12.prod.google.com ([2002:a17:90b:5b8c:b0:32b:35fb:187f])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4d8b:b0:329:e703:d00b with SMTP id 98e67ed59e1d1-33b51386449mr12422922a91.19.1760051326203;
 Thu, 09 Oct 2025 16:08:46 -0700 (PDT)
Date: Thu, 09 Oct 2025 16:08:44 -0700
In-Reply-To: <20251007221420.344669-12-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-12-seanjc@google.com>
Message-ID: <diqzcy6vhdvn.fsf@google.com>
Subject: Re: [PATCH v12 11/12] KVM: selftests: Add guest_memfd tests for mmap
 and NUMA policy support
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_160847_756664_3411A419 
X-CRM114-Status: GOOD (  26.35  )
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

> From: Shivank Garg <shivankg@amd.com>
>
> Add tests for NUMA memory policy binding and NUMA aware allocation in
> guest_memfd. This extends the existing selftests by adding proper
> validation for:
>   - KVM GMEM set_policy and get_policy() vm_ops functionality using
>     mbind() and get_mempolicy()
>   - NUMA policy application before and after memory allocation
>
> Run the NUMA mbind() test with and without INIT_SHARED, as KVM should allow
> doing mbind(), madvise(), etc. on guest-private memory, e.g. so that
> userspace can set NUMA policy for CoCo VMs.
>
> Run the NUMA allocation test only for INIT_SHARED, i.e. if the host can't
> fault-in memory (via direct access, madvise(), etc.) as move_pages()
> returns -ENOENT if the page hasn't been faulted in (walks the host page
> tables to find the associated folio)
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> Tested-by: Ashish Kalra <ashish.kalra@amd.com>
> [sean: don't skip entire test when running on non-NUMA system, test mbind()
>        with private memory, provide more info in assert messages]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../testing/selftests/kvm/guest_memfd_test.c  | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>
> 
> [...snip...]
> 
> +static void test_numa_allocation(int fd, size_t total_size)
> +{
> +	unsigned long node0_mask = 1;  /* Node 0 */
> +	unsigned long node1_mask = 2;  /* Node 1 */
> +	unsigned long maxnode = 8;
> +	void *pages[4];
> +	int status[4];
> +	char *mem;
> +	int i;
> +
> +	if (!is_multi_numa_node_system())
> +		return;
> +
> +	mem = kvm_mmap(total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd);
> +
> +	for (i = 0; i < 4; i++)
> +		pages[i] = (char *)mem + page_size * i;
> +
> +	/* Set NUMA policy after allocation */
> +	memset(mem, 0xaa, page_size);
> +	kvm_mbind(pages[0], page_size, MPOL_BIND, &node0_mask, maxnode, 0);
> +	kvm_fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, page_size);
> +
> +	/* Set NUMA policy before allocation */
> +	kvm_mbind(pages[0], page_size * 2, MPOL_BIND, &node1_mask, maxnode, 0);
> +	kvm_mbind(pages[2], page_size * 2, MPOL_BIND, &node0_mask, maxnode, 0);
> +	memset(mem, 0xaa, total_size);
> +
> +	/* Validate if pages are allocated on specified NUMA nodes */
> +	kvm_move_pages(0, 4, pages, NULL, status, 0);
> +	TEST_ASSERT(status[0] == 1, "Expected page 0 on node 1, got it on node %d", status[0]);
> +	TEST_ASSERT(status[1] == 1, "Expected page 1 on node 1, got it on node %d", status[1]);
> +	TEST_ASSERT(status[2] == 0, "Expected page 2 on node 0, got it on node %d", status[2]);
> +	TEST_ASSERT(status[3] == 0, "Expected page 3 on node 0, got it on node %d", status[3]);
> +
> +	/* Punch hole for all pages */
> +	kvm_fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, total_size);
> +
> +	/* Change NUMA policy nodes and reallocate */
> +	kvm_mbind(pages[0], page_size * 2, MPOL_BIND, &node0_mask, maxnode, 0);
> +	kvm_mbind(pages[2], page_size * 2, MPOL_BIND, &node1_mask, maxnode, 0);
> +	memset(mem, 0xaa, total_size);
> +
> +	kvm_move_pages(0, 4, pages, NULL, status, 0);
> +	TEST_ASSERT(status[0] == 0, "Expected page 0 on node 0, got it on node %d", status[0]);
> +	TEST_ASSERT(status[1] == 0, "Expected page 1 on node 0, got it on node %d", status[1]);
> +	TEST_ASSERT(status[2] == 1, "Expected page 2 on node 1, got it on node %d", status[2]);
> +	TEST_ASSERT(status[3] == 1, "Expected page 3 on node 1, got it on node %d", status[3]);
> +

Related to my comment on patch 5: might a test for guest_memfd with
regard to the memory spread page cache feature provided by the cpuset
subsystem be missing?

Perhaps we need tests for

1. Test that the allocation matches current's mempolicy, with no
   mempolicy defined for specific indices.
2. Test that during allocation, current's mempolicy can be overridden with
   a mempolicy defined for specific indices.
3. Test that during allocation, current's mempolicy and the effect of
   cpuset config can be overridden with a mempolicy defined for specific
   indices.
4. Test that during allocation, without defining a mempolicy for given
   index, current's mempolicy is overridden by the effect of cpuset
   config

I believe test 4, before patch 5, will show that guest_memfd respects
cpuset config, but after patch 5, will show that guest_memfd no longer
allows cpuset config to override current's mempolicy.

> +	kvm_munmap(mem, total_size);
> +}
> +
>  static void test_fault_sigbus(int fd, size_t accessible_size, size_t map_size)
>  {
>  	const char val = 0xaa;
> @@ -273,11 +369,13 @@ static void __test_guest_memfd(struct kvm_vm *vm, uint64_t flags)
>  		if (flags & GUEST_MEMFD_FLAG_INIT_SHARED) {
>  			gmem_test(mmap_supported, vm, flags);
>  			gmem_test(fault_overflow, vm, flags);
> +			gmem_test(numa_allocation, vm, flags);
>  		} else {
>  			gmem_test(fault_private, vm, flags);
>  		}
>  
>  		gmem_test(mmap_cow, vm, flags);
> +		gmem_test(mbind, vm, flags);
>  	} else {
>  		gmem_test(mmap_not_supported, vm, flags);
>  	}
> -- 
> 2.51.0.710.ga91ca5db03-goog

