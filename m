Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C273C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZoCrmESLbLCViBEraaeQvy8SUfzt9/XLBDROzjvgL4=; b=se0Yub3EaM9DSLnDvNFr2Jo3rp
	7fHSVz0ebhqB6UWubfSS0GhDKTZXHlQ9KsiLJByyn3JWctX0lIzavbshr+bL6eqgLyPu9kLzh40Ph
	8VHxZXsJnYfNpNZF7wRfI/Ev4UZ/S+27+E2QgLXFpWRVQKHVRqZc9HIYN8hq74cZkF4NxkDP7beMT
	aonHXDJboqSlMW4GRvGa0heiGq2DfI5j/L2E5KWwW1yiJlxdDlJcnx4zXiH3DDpbD+A4O521hKkuT
	gvD0LSU7xG5/TSaBxzDChbc8rVZRcmoZm/un3J6K1M4iteG7rwHwIFqnCUjI7IbiOlNlPEXyye/ee
	FoNOC4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEfk-00000002Vyy-3eLv;
	Wed, 30 Jul 2025 21:49:16 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhERi-00000002UYz-2hYY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:34:47 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b321087b1cdso287282a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 14:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753911285; x=1754516085; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZoCrmESLbLCViBEraaeQvy8SUfzt9/XLBDROzjvgL4=;
        b=D6fr6c2E+YlGbuTTtZZsY9v6d/uXmahZQJ3L4vZMRr7YamnbGyq/I+5HOujAK02gyy
         5NJ+Rsi3b/qxkCe150ox9+M6nBQl904kxhaLDDd+gfBD6jUEH4SiDAyppNu1A5Ry745V
         A5qNRDDjcz0Fs4l+P1/nto+LLwWbEyWCuI8xXlcnHXdVISiUHALf92SJxPYTr1Xo2UPM
         y1Z7KVVJoy1/wsCSp2NSk9GLkj0nCOjuxs5arnBpOMnmNXhjms7LTs9qmIuvE/le6rcl
         WMeUrqyXpazj0V6jTSySpV1/ffBNvZLifhb7c1EcCK06E3Im1Dn9DWLkX40WPzlW51ID
         gwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753911285; x=1754516085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZoCrmESLbLCViBEraaeQvy8SUfzt9/XLBDROzjvgL4=;
        b=sRMRmrAMIYWU8oJkLeiR3+NVFRPICY9HLbeNRcKtlDVtCsQ0TfvKsvxr0KslH+Y1MK
         DL6pReu6F2DfYsOPRYLS3LHeHcDXG7DTcdkvoJiVBRELMMmjUh6YxUABXnPIpAAc/Vw4
         +HF/gKjL/fHaYC4il2TQIPM1wvFqglU+DiHEbouP87WTN3KdpdZ3xRvY2EwIyqftz9I/
         KSV+NFXhJYds7hH0IUJ1A4V2SN1qxWwqpBVVuyO0+KBlW/yFIJp78ZXebJf+9fnq1jxw
         uDFGlozc0/kuWQDsczJguXgDmuEnqjGk4Mb/cbipn3ejqzu6uiVwg3Si03rNbbgmSdM1
         vesQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpFQh+B7GRhcxaUalTHe7LDCCWixti2XFHG6F6bTYihSPwsNlBSpviiiwVIP5m65vRaWifMj3SyvDaeZu3M2Il@lists.infradead.org
X-Gm-Message-State: AOJu0YxQiqRwtTpw1iIZhu8pXCj5g8UioIyA9Ii8MjpppjWtrN74qoJs
	YQZD5UP0MFpoZSdvgsbxxA+ixQeDvMYNOV+KHUJWSgmHBgIKOnxzssS/iscCjzD8AZrBGR/usa3
	JJZpueRaLb/fTlxaqTSjMN9GJbg==
X-Google-Smtp-Source: AGHT+IE166c54Arspc6vUihH1B2IIMOPFqYhg0hEsHJt45VP/+caD/xvYgvBnOUC4GXLoFyR6oHwfyE2Q105ihyuUQ==
X-Received: from pgar7.prod.google.com ([2002:a05:6a02:2e87:b0:b2c:4548:13d0])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7283:b0:23d:bdb7:d9f9 with SMTP id adf61e73a8af0-23dc0ec1d54mr8719397637.31.1753911285429;
 Wed, 30 Jul 2025 14:34:45 -0700 (PDT)
Date: Wed, 30 Jul 2025 14:34:44 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
Message-ID: <diqzwm7pjrbf.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v17 00/24] KVM: Enable mmap() for guest_memfd
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>, Jiaqi Yan <jiaqiyan@google.com>, vannapurve@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_143446_683778_FDC43D43 
X-CRM114-Status: GOOD (  22.04  )
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

> Paolo,
>
> The arm64 patches have been Reviewed-by Marc, and AFAICT the x86 side of
> things is a go.  Barring a screwup on my end, this just needs your approval.
>
> Assuming everything looks good, it'd be helpful to get this into kvm/next
> shortly after rc1.  The x86 Kconfig changes in particular create semantic
> conflicts with in-flight series.
>
>
> Add support for host userspace mapping of guest_memfd-backed memory for VM
> types that do NOT use support KVM_MEMORY_ATTRIBUTE_PRIVATE (which isn't
> precisely the same thing as CoCo VMs, since x86's SEV-MEM and SEV-ES have
> no way to detect private vs. shared).
>
> mmap() support paves the way for several evolving KVM use cases:
>
>  * Allows VMMs like Firecracker to run guests entirely backed by
>    guest_memfd [1]. This provides a unified memory management model for
>    both confidential and non-confidential guests, simplifying VMM design.
>
>  * Enhanced Security via direct map removal: When combined with Patrick's
>    series for direct map removal [2], this provides additional hardening
>    against Spectre-like transient execution attacks by eliminating the
>    need for host kernel direct maps of guest memory.
>
>  * Lays the groundwork for *restricted* mmap() support for guest_memfd-backed
>    memory on CoCo platforms [3] that permit in-place
>    sharing of guest memory with the host.
>
> Based on kvm/queue.
>
> [1] https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding
> [2] https://lore.kernel.org/all/20250221160728.1584559-1-roypat@amazon.co.uk
> [3] https://lore.kernel.org/all/20250328153133.3504118-1-tabba@google.com
>
> [...snip...]

With this version, when guest_memfd memory is mmap-ed() and faulted to
userspace, when there's a memory failure, the process does not get a
SIGBUS. Specifically, this selftest fails with "MADV_HWPOISON should
have triggered SIGBUS."

diff --git i/tools/testing/selftests/kvm/guest_memfd_test.c w/tools/testing/selftests/kvm/guest_memfd_test.c
index b86bf89a71e04..70ef75a23bb60 100644
--- i/tools/testing/selftests/kvm/guest_memfd_test.c
+++ w/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -70,6 +70,10 @@ static void test_mmap_supported(int fd, size_t page_size, size_t total_size)
 
 	ret = munmap(mem, total_size);
 	TEST_ASSERT(!ret, "munmap() should succeed.");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0,
+			total_size);
+	TEST_ASSERT(!ret, "Truncate the entire file (cleanup) should succeed.");
 }
 
 static sigjmp_buf jmpbuf;
@@ -104,6 +108,47 @@ static void test_fault_overflow(int fd, size_t page_size, size_t total_size)
 
 	ret = munmap(mem, map_size);
 	TEST_ASSERT(!ret, "munmap() should succeed.");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0,
+			total_size);
+	TEST_ASSERT(!ret, "Truncate the entire file (cleanup) should succeed.");
+}
+
+static void test_memory_failure(int fd, size_t page_size, size_t total_size)
+{
+	struct sigaction sa_old, sa_new = {
+		.sa_handler = fault_sigbus_handler,
+	};
+	void *memory_failure_addr;
+	char *mem;
+	int ret;
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmap() for guest_memfd should succeed.");
+
+	memset(mem, 0xaa, page_size);
+
+	memory_failure_addr = mem + page_size;
+	sigaction(SIGBUS, &sa_new, &sa_old);
+	if (sigsetjmp(jmpbuf, 1) == 0) {
+		madvise(memory_failure_addr, page_size, MADV_HWPOISON);
+		TEST_ASSERT(false, "MADV_HWPOISON should have triggered SIGBUS.");
+	}
+	sigaction(SIGBUS, &sa_old, NULL);
+
+	ret = munmap(mem, total_size);
+	TEST_ASSERT(!ret, "munmap() should succeed.");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0,
+			total_size);
+	TEST_ASSERT(!ret, "Truncate the entire file (cleanup) should succeed.");
 }
 
 static void test_mmap_not_supported(int fd, size_t page_size, size_t total_size)
@@ -286,6 +331,7 @@ static void test_guest_memfd(unsigned long vm_type)
 	if (flags & GUEST_MEMFD_FLAG_MMAP) {
 		test_mmap_supported(fd, page_size, total_size);
 		test_fault_overflow(fd, page_size, total_size);
+		test_memory_failure(fd, page_size, total_size);
 	} else {
 		test_mmap_not_supported(fd, page_size, total_size);
 	}

Is this by design or should some new memory_failure handling be added?

