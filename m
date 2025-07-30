Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9AFC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9AapuAKiCNZbEMmYARPlEQivoLvl/OTHJdBcc566Vo=; b=veolPEsCuz7O6gZG8W2X8FCYOB
	8UgCE2w3AxZMKvPF4dn32ftEBAxISlHH/bWztOxBs9nbZcJBhm6h3Q+dBIRRwJyBcnt5lox0aOAYt
	JWy0PmgYUdoJOTvDQ4xyxXYFOwSnuSF13VC662wf28xcyYM4nrSlaXfC/qV0TlGOGihboBxR03iyK
	a31PSx+y4VVuG5DkRs6FMz5fC4p0Az2BRctIERH0Ff8/f49jgsPgQcfVYgq5mJCrZWhqfcsXQklI5
	t3uumvZ652Gis/Ft0s1y2gUFpTuquQfB37w5XtJHngPbx6a70PhItYVB7DfXeUmgQ3AzrTN5zw2SM
	B6LJuv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh25v-00000000yXM-1Nk8;
	Wed, 30 Jul 2025 08:23:27 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh23R-00000000yFv-0vPe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 08:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753863653; x=1785399653;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sMpVGob/1Mg4p+/qdsiXIOdlRZ53nvSriy4F/sWaKfA=;
  b=TptkLNIXH7jpBg1/dx2GQLg3DGSHWhis2zaJfrasjo/ISah+Tc+WRGjq
   ZJ13PgYF6zOjLfqFEhdFwE7KosxojDOHPBSTlDPVOWFtXua259+VqySEX
   GEN1PSuhMHNV1NBzJGS98ud8ckeuJ8kaGACXIEn18oxVxEyvqQeS1Ykc8
   5s9j7iBvfBIKP78uk1JVThPgqjm0zFKEb6yp5mLMtIgCsMZvXGOvYlKeA
   hIKxR+KIL7KjIFbaAuNQ6mx/g+UT+qjZFkaSpu0H1YXLiVqTBQBN7lnfk
   UPW/hSqWsFwMCaEel8ViFCv4MlVRV4rrWHCt7A3NZkgO+lN8FX/VqNth9
   g==;
X-CSE-ConnectionGUID: 9fjIe2XKRkmd+SPuFgUAFA==
X-CSE-MsgGUID: Cg04d/UUSDeBV/2sPhWYnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="43760836"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="43760836"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 01:20:53 -0700
X-CSE-ConnectionGUID: Ek445IxjTgK8rLEtsHGYDg==
X-CSE-MsgGUID: m2qrEWuSTVaeqSuq+gdBEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="168338717"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 01:20:48 -0700
Message-ID: <42d840e5-d063-4a84-9028-e17a69fc7c91@intel.com>
Date: Wed, 30 Jul 2025 16:20:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 24/24] KVM: selftests: Add guest_memfd testcase to
 fault-in on !mmap()'d memory
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
 <20250729225455.670324-25-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250729225455.670324-25-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_012053_301620_0FBAECEF 
X-CRM114-Status: GOOD (  21.02  )
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
> Add a guest_memfd testcase to verify that a vCPU can fault-in guest_memfd
> memory that supports mmap(), but that is not currently mapped into host
> userspace and/or has a userspace address (in the memslot) that points at
> something other than the target guest_memfd range.  Mapping guest_memfd
> memory into the guest is supposed to operate completely independently from
> any userspace mappings.

Based on above, I suppose the userspace_address is not NULL but some 
other separate userspace mapped memory.

> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   .../testing/selftests/kvm/guest_memfd_test.c  | 64 +++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index 088053d5f0f5..b86bf89a71e0 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -13,6 +13,7 @@
>   
>   #include <linux/bitmap.h>
>   #include <linux/falloc.h>
> +#include <linux/sizes.h>
>   #include <setjmp.h>
>   #include <signal.h>
>   #include <sys/mman.h>
> @@ -21,6 +22,7 @@
>   
>   #include "kvm_util.h"
>   #include "test_util.h"
> +#include "ucall_common.h"
>   
>   static void test_file_read_write(int fd)
>   {
> @@ -298,6 +300,66 @@ static void test_guest_memfd(unsigned long vm_type)
>   	kvm_vm_free(vm);
>   }
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
>   int main(int argc, char *argv[])
>   {
>   	unsigned long vm_types, vm_type;
> @@ -314,4 +376,6 @@ int main(int argc, char *argv[])
>   
>   	for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
>   		test_guest_memfd(vm_type);
> +
> +	test_guest_memfd_guest();

First glance at the name, it leads me to think about something of nested.

>   }


