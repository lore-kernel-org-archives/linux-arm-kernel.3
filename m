Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B35C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjfTzTYmBTSq1RM4X60bH58UcxDwXEae6az/Z5K6Fv4=; b=QkTucowfJi+hhh+g4ZH/XqSMrj
	XcgY+n3HfCC9EUD4C9qlV0sNSrrjfpqGrrCjokligBME73l6f4XETu8ZpwSu5zZyxpPvTzNRtQ83S
	Wf5Ysr/GzP/Ur9gMF/tR6hBgSbxjCpNoALnyUsLAL6FUokFPCVhG6YuPt6tA3wNqpYV1THbkGvvsq
	Jkjf7LFMpPZUfP5TL3x6T94ORowpaL28nGdpK42wJlST7bxShPy8K4x3pKUDfHyeoMoS1NvErUGAe
	e9tCKgG3oIy8rHu8N+66/AQAgEre8x5SGGaT7xIwdOnNGi25u7/nPVHp0rRUJum9j1efjuSamJTV3
	HR6cIHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhO5G-000000035Rg-1V4h;
	Thu, 31 Jul 2025 07:52:14 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhO2l-000000035Dh-2fSc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 07:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753948179; x=1785484179;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Gs1MIGdx+aL/FvTa33b5/hEqyQZgikPYWC/APuQ9dlg=;
  b=PoQK0FbEerbXXwNNYfyTFMODKM6xp45z0aaSvKiNyC3ByFO0uKwq4Ldq
   F2ICdrCOyid7BAwoPi9BnexqFyl3UiH/bq7u8rdzpxSaI1mdP94xv6Y+Z
   lVF6eBUskLoIqcEtw+C/TvYOwtA0HojomYYOZCscs+uBZEitrm78uoiPQ
   +L3v+ihgjnjd4XD58FvzOM9MEf08KV0dazkkXEir8yieqxiPNc5f398CB
   kv0CfRWVy10IxvCpdhDTBa8O92+OaxPwWOTFtoC9WgIsuHVt7Wd6a5UEm
   qSzPG6a7wezlHaaegcECPsa6zkZdwLtPmk4uyDixyeUnzDpUaFsyp65q6
   w==;
X-CSE-ConnectionGUID: e4N+qoOiTciAFDlfqOy1/Q==
X-CSE-MsgGUID: jEZj55/xT62jkfMDZN+wUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56340253"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56340253"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 00:49:37 -0700
X-CSE-ConnectionGUID: 73cEAW53RymL+KeNij9jPQ==
X-CSE-MsgGUID: my5o4r9WSBaok3whtlcfJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="163541810"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 00:49:33 -0700
Message-ID: <44f17b93-cf3c-43e9-b921-5f904c13db69@intel.com>
Date: Thu, 31 Jul 2025 15:49:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 23/24] KVM: selftests: guest_memfd mmap() test when
 mmap is supported
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>,
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Fuad Tabba <tabba@google.com>, Ackerley Tng <ackerleytng@google.com>,
 Tao Chan <chentao@kylinos.cn>, James Houghton <jthoughton@google.com>
References: <20250729225455.670324-1-seanjc@google.com>
 <20250729225455.670324-24-seanjc@google.com>
 <856487d0-8e1a-4e64-a8e6-13977fd31fed@intel.com>
 <aIoWosN3UiPe2qQK@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <aIoWosN3UiPe2qQK@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_004939_695152_04880E90 
X-CRM114-Status: GOOD (  12.74  )
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

On 7/30/2025 8:57 PM, Sean Christopherson wrote:
> On Wed, Jul 30, 2025, Xiaoyao Li wrote:
>> On 7/30/2025 6:54 AM, Sean Christopherson wrote:
>>
>> ...
>>
>>> +int main(int argc, char *argv[])
>>> +{
>>> +	unsigned long vm_types, vm_type;
>>> +
>>> +	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
>>> +
>>> +	/*
>>> +	 * Not all architectures support KVM_CAP_VM_TYPES. However, those that
>>> +	 * support guest_memfd have that support for the default VM type.
>>> +	 */
>>> +	vm_types = kvm_check_cap(KVM_CAP_VM_TYPES);
>>> +	if (!vm_types)
>>> +		vm_types = VM_TYPE_DEFAULT;
>>> +
>>> +	for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
>>> +		test_guest_memfd(vm_type);
>>
>> For ARCHes that don't support KVM_CAP_VM_TYPES, e.g., ARM, vm_types is 0
>> (VM_TYPE_DEFAULT). the for_each_set_bit() loop will not execute any
>> iteration at all.
> 
> Doh, indeed.
> 
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index b86bf89a71e0..b3ca6737f304 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -372,7 +372,7 @@ int main(int argc, char *argv[])
>           */
>          vm_types = kvm_check_cap(KVM_CAP_VM_TYPES);
>          if (!vm_types)
> -               vm_types = VM_TYPE_DEFAULT;
> +               vm_types = BIT(VM_TYPE_DEFAULT);
>   
>          for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
>                  test_guest_memfd(vm_type);

With the above fix,

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

