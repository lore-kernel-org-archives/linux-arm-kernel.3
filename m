Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378A9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGtXhxJIT9ktiOtTcLhEEgPOf4RMUnkq/LQFo5HjXVs=; b=NyoXKto1E8fEz9NGhvR2DEmkLo
	/gi+nEC9XSHfR50bLQ12zRuZlHeKqhHTvHU1PeZpGnT8sFeHWmOfQMzfkb3+jxjWASycdPoA2QzsH
	mufE/q+JFMEPxqNCu8EFVP5T4SFP5brY4omW2pWoa9UCs/nt0v7zPsq0IRGYOKWFjVCHyBvzqZIbD
	HAxmzbI7C6FpjNdUcf8tR1UQ88YEJNccVgK1e3Jt+d9LSe+KRU77gTojq2Tg40ySEF3uYT2cNXttk
	SFS7ntmg698FwsDSd4FGDKCeqXn3PYvmKvgRQyMzMggXzS2+1EiZ5wkbe9npYwor1kIGzcDie06F6
	VftUYxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5tS-00000001Squ-0rm2;
	Wed, 30 Jul 2025 12:26:50 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5A7-00000001N8u-2ux3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 11:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753875599; x=1785411599;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rb69SnQEKx+3Utl6hd4Gthucrbobnz6/4jOLOMshxJg=;
  b=JIDW3nV6KKKIvcKQgSbSRSvJzJEmlri6DMJnmvqHobdRDRGBqFLRWVHr
   5UukgWTf/O5pej/lcSPNPjGg7SESHGYIiAryPHJzLrotESlbYpeJoDbmD
   Ahxo0NvRwPRh3TwfxwBr+AcXcKOTRrvHf7ye01JmBMusIEpbWrYxekEdt
   7pNyRZHekaD8uLEnBlQVQb2O4U4yh+DAdNbSiLZ6QIOwMX4BCWjrXeXI7
   tGE7vtknFKLFesT5w3YUAmNL/x1vLCDvZcBOAt9mXaiMNPhb1KUoNWeRH
   7vTIUB7CSoXK1OryxcVdZgNlx5xFHXGArIXSTfXG3GDh3DcFNOKj2snGE
   w==;
X-CSE-ConnectionGUID: uWiKR/YSTdaoJrspXX5bJw==
X-CSE-MsgGUID: iFfaU8sNQt2o7jxolyRMXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56250731"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56250731"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 04:39:54 -0700
X-CSE-ConnectionGUID: 6ybYhdAmQWCVdMvTeVI8Ug==
X-CSE-MsgGUID: zpy9UkLBTUGtQErhH87eRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193807302"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 04:39:44 -0700
Message-ID: <856487d0-8e1a-4e64-a8e6-13977fd31fed@intel.com>
Date: Wed, 30 Jul 2025 19:39:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 23/24] KVM: selftests: guest_memfd mmap() test when
 mmap is supported
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
 <20250729225455.670324-24-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250729225455.670324-24-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_043959_792777_1812C260 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

...

> +int main(int argc, char *argv[])
> +{
> +	unsigned long vm_types, vm_type;
> +
> +	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
> +
> +	/*
> +	 * Not all architectures support KVM_CAP_VM_TYPES. However, those that
> +	 * support guest_memfd have that support for the default VM type.
> +	 */
> +	vm_types = kvm_check_cap(KVM_CAP_VM_TYPES);
> +	if (!vm_types)
> +		vm_types = VM_TYPE_DEFAULT;
> +
> +	for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
> +		test_guest_memfd(vm_type);

For ARCHes that don't support KVM_CAP_VM_TYPES, e.g., ARM, vm_types is 0 
(VM_TYPE_DEFAULT). the for_each_set_bit() loop will not execute any 
iteration at all.

