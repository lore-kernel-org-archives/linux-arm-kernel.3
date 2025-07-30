Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758F6C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noBZhdUcLA4kTkGAivmYhPJc+P6TFNJRwaErDXV64PU=; b=zlVOg4mzOW9Dpkgt2KVWNqNTsX
	aaTgPwU3g0XTyY/QRkKKkkUukl7iLQCQncNI5frKVfDJUbfcUljCIOflQM7NFWugvhRZqUHEedNc0
	b5AqqDS0/GECpwkPULut78V2g7JQsc7z8eIa+sU/iZOfHu1e0q/JlbnJmYE+k5LoHWHnuLNglymFF
	cgue8bmRhHp4pZvY+kSI1so5gelCwa710nnbefRbItDbhdbeB9hm3eIpXD41fH2PYNQhwrLPsZH0z
	w/b2gcr1tmazhd0aYxUHQwc8MTpntlzye4VkSW+rYxjApaV92h5DvDCE3UIwgEfY+FOivPCjA6XrB
	cb3fgkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1P9-00000000tmf-0WsC;
	Wed, 30 Jul 2025 07:39:15 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Ma-00000000tXF-1QCL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753860997; x=1785396997;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Lgxb6ChAZm+S1lYlYOHvTXOyDWJ1q94r2HzDlbS89X0=;
  b=M+oxTxfYjM8w1RxAuuUHT9VIK3RcWnKAJOS5JcDfBxp13ulayWxLBnaH
   uiwhvjlMwu6QiXQJxPsp8SUZ6gGOITJTudzdvpVJhZg0+ljyYrq0L5CzC
   XWB+N3/9EAvT7cr/igV59haJR/6hODm5yTNJK1UgBbBwXFoxySCVF5Gwx
   ZtObALZPQkDS/1DDz2S2OWVpPfDliSMLvoHzOzKSnhJgtQMMJ/BP2WFle
   ORwQrKYPXFbFxVwM9rU5accoRv0a9XWD7Sy86bpXX9APngeXb3pWq9xtO
   XRdSsgQ9YYl8BDIMTlkxQounGrdJZRgQYyErWTQG96mneWxRIyxLlDnvt
   Q==;
X-CSE-ConnectionGUID: fnBXWYA2QAyWxzjBV0N1Mw==
X-CSE-MsgGUID: SQchjgTgScm+EjMfEJJyLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56037640"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56037640"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 00:36:34 -0700
X-CSE-ConnectionGUID: OqQi3hkUReqqLpZr2iCwuA==
X-CSE-MsgGUID: DbgjJr6SStqDXDA73Xhbqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167395533"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 00:36:27 -0700
Message-ID: <f61594a4-5823-453c-9f1f-8bd94d3ba4a2@intel.com>
Date: Wed, 30 Jul 2025 15:36:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 15/24] KVM: x86/mmu: Extend guest_memfd's max mapping
 level to shared mappings
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
 <20250729225455.670324-16-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250729225455.670324-16-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_003636_515692_FDC5973C 
X-CRM114-Status: UNSURE (   7.54  )
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
> Rework kvm_mmu_max_mapping_level() to consult guest_memfd for all mappings,
> not just private mappings, so that hugepage support plays nice with the
> upcoming support for backing non-private memory with guest_memfd.
> 
> In addition to getting the max order from guest_memfd for gmem-only
> memslots, update TDX's hook to effectively ignore shared mappings, as TDX's
> restrictions on page size only apply to Secure EPT mappings.  Do nothing
> for SNP, as RMP restrictions apply to both private and shared memory.
> 
> Suggested-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

