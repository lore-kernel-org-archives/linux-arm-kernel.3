Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D40DFF4946
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 06:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRGlqTUddNs22qbjK1XF9AytOTARdjde3qWaPPuWarI=; b=R1d29IfWhPV2TWOW3yU5FKRMUl
	kNBfUqqmdzax9zx7yfAc4A/Y9Ixwq9+M8WSqXzKjR3LpUJ++8Wl0lojjT7ZkTmAAEESvwVBY9xTbZ
	VEHeYIvNBT9doilqttcUlx5opzsREUmEeIgFc2EEs6KFkVfwo8XBtnUZb0C2pz+dkk2lOpXCrQbWS
	iEFEbFhBpitRmo5l0fSbVz7ziqlXz7RsgEtKmmjGJ4khhC2S14UYHNGddqo852d9LrKBthcetThIO
	iqUWfUAJGhmnJA+06QpF0zMVA7A5LYlxtBSTpxtPoKcB1L7Ia8eWZgjL3c4PFwrCTBkcBz8V/W78K
	rjMo2S0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w760x-0000000Ag7o-1KIG;
	Mon, 30 Mar 2026 06:22:19 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w760t-0000000Ag6D-1FEp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 06:22:17 +0000
Message-ID: <0064952b-048c-455d-ad89-e27e5cb82591@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774851728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRGlqTUddNs22qbjK1XF9AytOTARdjde3qWaPPuWarI=;
	b=ITBmfkdGvwuPDXnsffYC3RL1CaOmCF/2VlOTHdKT+Q7ImF10cXOMIoVaLLRIU4blXOt6tP
	duQCcmk2g36LuwcQWBgCNhYQYhVZf0XcLdzLJABnsHxs6Gkks4lvw9jpYB4A7jo5ZZy2Hs
	0Pk3+FiE2FReGdaXwbt6hKscxnFc+Cc=
Date: Mon, 30 Mar 2026 14:21:50 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v17 24/24] KVM: selftests: Add guest_memfd testcase to
 fault-in on !mmap()'d memory
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>,
 Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>,
 David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>,
 James Houghton <jthoughton@google.com>
References: <20250729225455.670324-1-seanjc@google.com>
 <20250729225455.670324-25-seanjc@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20250729225455.670324-25-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_232216_264069_D25F9FEF 
X-CRM114-Status: GOOD (  20.18  )
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

Hi,

On 7/30/25 6:54 AM, Sean Christopherson wrote:
> Add a guest_memfd testcase to verify that a vCPU can fault-in guest_memfd
> memory that supports mmap(), but that is not currently mapped into host
> userspace and/or has a userspace address (in the memslot) that points at
> something other than the target guest_memfd range.  Mapping guest_memfd
> memory into the guest is supposed to operate completely independently from
> any userspace mappings.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../testing/selftests/kvm/guest_memfd_test.c  | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index 088053d5f0f5..b86bf89a71e0 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -13,6 +13,7 @@
>  
>  #include <linux/bitmap.h>
>  #include <linux/falloc.h>
> +#include <linux/sizes.h>
>  #include <setjmp.h>
>  #include <signal.h>
>  #include <sys/mman.h>
> @@ -21,6 +22,7 @@
>  
>  #include "kvm_util.h"
>  #include "test_util.h"
> +#include "ucall_common.h"
>  
>  static void test_file_read_write(int fd)
>  {
> @@ -298,6 +300,66 @@ static void test_guest_memfd(unsigned long vm_type)
>  	kvm_vm_free(vm);
>  }
>  
> +static void guest_code(uint8_t *mem, uint64_t size)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < size; i++)
> +		__GUEST_ASSERT(mem[i] == 0xaa,
> +			       "Guest expected 0xaa at offset %lu, got 0x%x", i, mem[i]);
> +
> +	memset(mem, 0xff, size);
> +	GUEST_DONE();
> +}
> +
> +static void test_guest_memfd_guest(void)
> +{
> +	/*
> +	 * Skip the first 4gb and slot0.  slot0 maps <1gb and is used to back
> +	 * the guest's code, stack, and page tables, and low memory contains
> +	 * the PCI hole and other MMIO regions that need to be avoided.
> +	 */
> +	const uint64_t gpa = SZ_4G;
> +	const int slot = 1;
> +
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	uint8_t *mem;
> +	size_t size;
> +	int fd, i;
> +
> +	if (!kvm_has_cap(KVM_CAP_GUEST_MEMFD_MMAP))
> +		return;
> +
> +	vm = __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, &vcpu, 1, guest_code);
> +
> +	TEST_ASSERT(vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_MMAP),
> +		    "Default VM type should always support guest_memfd mmap()");
> +
> +	size = vm->page_size;
> +	fd = vm_create_guest_memfd(vm, size, GUEST_MEMFD_FLAG_MMAP);

This test fails on arm64 when vm->page_size is 4k and host's page_size
is 64k:

[root@localhost kvm]# ./guest_memfd_test
Random seed: 0x6b8b4567
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='660'
==== Test Assertion Failure ====
  include/kvm_util.h:683: fd >= 0
  pid=889 tid=889 errno=22 - Invalid argument
     1	0x000000000040262b: vm_create_guest_memfd at kvm_util.h:683
     2	 (inlined by) test_guest_memfd_guest at guest_memfd_test.c:450
     3	 (inlined by) main at guest_memfd_test.c:491
     4	0x00007fff8f56af3b: ?? ??:0
     5	0x00007fff8f56b007: ?? ??:0
     6	0x0000000000402a2f: _start at ??:?
  KVM_CREATE_GUEST_MEMFD failed, rc: -1 errno: 22 (Invalid argument)

Thanks,
Zenghui

> +	vm_set_user_memory_region2(vm, slot, KVM_MEM_GUEST_MEMFD, gpa, size, NULL, fd, 0);
> +
> +	mem = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +	TEST_ASSERT(mem != MAP_FAILED, "mmap() on guest_memfd failed");
> +	memset(mem, 0xaa, size);
> +	munmap(mem, size);
> +
> +	virt_pg_map(vm, gpa, gpa);
> +	vcpu_args_set(vcpu, 2, gpa, size);
> +	vcpu_run(vcpu);
> +
> +	TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_DONE);
> +
> +	mem = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +	TEST_ASSERT(mem != MAP_FAILED, "mmap() on guest_memfd failed");
> +	for (i = 0; i < size; i++)
> +		TEST_ASSERT_EQ(mem[i], 0xff);
> +
> +	close(fd);
> +	kvm_vm_free(vm);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	unsigned long vm_types, vm_type;
> @@ -314,4 +376,6 @@ int main(int argc, char *argv[])
>  
>  	for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
>  		test_guest_memfd(vm_type);
> +
> +	test_guest_memfd_guest();
>  }

