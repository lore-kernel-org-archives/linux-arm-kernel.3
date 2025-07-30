Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C650C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFdnbtu+5ffmH0ymjKbAsV0OUvv3P6iv8w3j93Vz8+o=; b=F1KZDN8vt3jqrivbDkLtjyUYpa
	Zcdl1H08uud1JzprsOiE0hN2PBVxYkR/H2usj/I0+22Y3dowFNl9uw/oYjDZSQOSGzPlpok4P48Gy
	E9JLnwyRk5hJKff6XZV0xj0QY4q4mRlhml7bHg0sqHIEfAz4tJnFGnxPx/H2sihe6Iefx1cMcKNNx
	pWPCD4OAcSF7uiSKI9pS5daDXITbSrXaI5AttvLZBThloZ6VvR15ddrLFPw1Xt7U9HXbAGDLssAxn
	kXQ1WhpX2yk65htUV7metsrV4Tof+5OjTsXmtR8AbByp9/Ij4XWJdsDJFwthdiJOi86swhbf6RY3m
	p/ABI5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5jZ-00000001QZN-1Glf;
	Wed, 30 Jul 2025 12:16:37 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4bv-00000001ISQ-1B3h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 11:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753873479; x=1785409479;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ztg7FRt5UKPNEA3tAFLtII2s8T5WXcv9COtdzco54FE=;
  b=Qm8ZZgadd/6kgwA+txDETzkV8IMSPGJq+Otrg+oPi7cDZKVJUlFw1/+z
   nDOH3W0Nnk1TuURHqjmMDuUdr/YvsIF/xN5F5K6iLXuSR8+UdU6UfMj5q
   naI/SJ3/nWwFir2RWdGZp+wgm+mUGPpQKaBNe7MIY38BdE3cNIETiHhpP
   kNuQ/gNi4dPmp/XrnYQhNq/pY2kzVMRpwz3lm/cNAjtpoEa3p4F/Fbjqq
   YA6OpIIH09dpV50qZVdHQmgxGykbQYxlrLYC40fMqjEgP1KlcABApOU93
   pRVi6Hxo8LfP/Uhbfs4PKeu1WYRPlGHVgbvW4TOjhufyxNuXMMBM6dq5o
   g==;
X-CSE-ConnectionGUID: WbqblKagTWONPbAOP+wz0A==
X-CSE-MsgGUID: 5VbiP0UzTJW4/1sDL1Qe7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56055967"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56055967"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 04:04:38 -0700
X-CSE-ConnectionGUID: fC9Y47YQSmqENkR33+2+jw==
X-CSE-MsgGUID: KMR8BEEmSC+9bp4GEfwV/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193801210"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 04:04:32 -0700
Message-ID: <f0378019-01d7-48df-bebf-d2a59e9d8582@intel.com>
Date: Wed, 30 Jul 2025 19:04:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 22/24] KVM: selftests: Do not use hardcoded page sizes
 in guest_memfd test
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>,
 Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>,
 David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>,
 James Houghton <jthoughton@google.com>
References: <20250729225455.670324-1-seanjc@google.com>
 <20250729225455.670324-23-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250729225455.670324-23-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_040439_392412_BB23CAD2 
X-CRM114-Status: GOOD (  14.42  )
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

On 7/30/2025 6:54 AM, Sean Christopherson wrote:
> From: Fuad Tabba <tabba@google.com>
> 
> Update the guest_memfd_test selftest to use getpagesize() instead of
> hardcoded 4KB page size values.
> 
> Using hardcoded page sizes can cause test failures on architectures or
> systems configured with larger page sizes, such as arm64 with 64KB
> pages. By dynamically querying the system's page size, the test becomes
> more portable and robust across different environments.
> 
> Additionally, build the guest_memfd_test selftest for arm64.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Shivank Garg <shivankg@amd.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Suggested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   tools/testing/selftests/kvm/Makefile.kvm       |  1 +
>   tools/testing/selftests/kvm/guest_memfd_test.c | 11 ++++++-----
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 40920445bfbe..963687892bcb 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -174,6 +174,7 @@ TEST_GEN_PROGS_arm64 += arch_timer
>   TEST_GEN_PROGS_arm64 += coalesced_io_test
>   TEST_GEN_PROGS_arm64 += dirty_log_perf_test
>   TEST_GEN_PROGS_arm64 += get-reg-list
> +TEST_GEN_PROGS_arm64 += guest_memfd_test
>   TEST_GEN_PROGS_arm64 += memslot_modification_stress_test
>   TEST_GEN_PROGS_arm64 += memslot_perf_test
>   TEST_GEN_PROGS_arm64 += mmu_stress_test
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index ce687f8d248f..341ba616cf55 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -146,24 +146,25 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
>   {
>   	int fd1, fd2, ret;
>   	struct stat st1, st2;
> +	size_t page_size = getpagesize();
>   
> -	fd1 = __vm_create_guest_memfd(vm, 4096, 0);
> +	fd1 = __vm_create_guest_memfd(vm, page_size, 0);
>   	TEST_ASSERT(fd1 != -1, "memfd creation should succeed");
>   
>   	ret = fstat(fd1, &st1);
>   	TEST_ASSERT(ret != -1, "memfd fstat should succeed");
> -	TEST_ASSERT(st1.st_size == 4096, "memfd st_size should match requested size");
> +	TEST_ASSERT(st1.st_size == page_size, "memfd st_size should match requested size");
>   
> -	fd2 = __vm_create_guest_memfd(vm, 8192, 0);
> +	fd2 = __vm_create_guest_memfd(vm, page_size * 2, 0);
>   	TEST_ASSERT(fd2 != -1, "memfd creation should succeed");
>   
>   	ret = fstat(fd2, &st2);
>   	TEST_ASSERT(ret != -1, "memfd fstat should succeed");
> -	TEST_ASSERT(st2.st_size == 8192, "second memfd st_size should match requested size");
> +	TEST_ASSERT(st2.st_size == page_size * 2, "second memfd st_size should match requested size");
>   
>   	ret = fstat(fd1, &st1);
>   	TEST_ASSERT(ret != -1, "memfd fstat should succeed");
> -	TEST_ASSERT(st1.st_size == 4096, "first memfd st_size should still match requested size");
> +	TEST_ASSERT(st1.st_size == page_size, "first memfd st_size should still match requested size");
>   	TEST_ASSERT(st1.st_ino != st2.st_ino, "different memfd should have different inode numbers");
>   
>   	close(fd2);


