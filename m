Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47545CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnJtWbWzY5YVX0zOWup8+j8rI8xQfT8dQXRdXL7/Sys=; b=noCnHafbMTW/6nM3xjQhcaZCyE
	j1RsiIjk9cBU7Sla9/axrQvbEC/8uh7Ag/FIdzcYVys6n4cn6aIK88IuoM4oC8D3+BhZLWofdexAt
	UBsobDrbUk7f0K7+RjBrDMZ11wXFQpKgFKo7y6dupYIg+0Eg0EkmKebm0lVN5k8oJjAVw5u1k3BeY
	/z/P0fgKbD66dsMDoEMSS2J4czmKbY0PblgnF/ZX500dCDYj2trbo9qAQELb5VatOVYEHUM8n0RJ9
	Cvf0lverxGONuww7oFYua4ygpi+jw99q7JScZZJkEZr1T/wf6mFiizYBS5KRL7ZXTHHAz57gXC+kk
	ujFuWO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ77-0000000DTG9-2ugO;
	Mon, 27 Oct 2025 09:02:05 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ74-0000000DTEY-1AZY;
	Mon, 27 Oct 2025 09:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761555723; x=1793091723;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=275YkRCyZVfjEDUsCr12iYfs5/SgTlKkXm5iRoBP66c=;
  b=Lk7VvlQ+lMELukesSJ4U/HNL+6uIJX3VLbFRNzRAYgQXRJJgyNThBTgx
   i6BoRT/yysVnE1CGgdGI6eASiEX0Q4nzzNhjMYhY1rqCjRmcBF1A0QJTc
   iyzCEQWM/rhtG23X9KqXJ1KTgeNvmfYtNYbuCZwZwkpKnbNyP0syxj4NM
   WNFL3LrW9w6cjblG57j0Bd4sTCytP7f97m/S2GWiTg3Zmt13dhOGfqWoa
   /yCSKXrQP69cv7CO+UQ0DugXTpwEQ7Jdb4YXX7Sib+cTVJHtVhCLBstpm
   sNaFT3pJqsHYFv0b1OcN8/PPcORCNwou/ZgMuT7IcQsxiwHoTSg3EiCS1
   w==;
X-CSE-ConnectionGUID: o2d6AN4mTaOs8ES9hH05mQ==
X-CSE-MsgGUID: a3/1e8X3QCimkZ8RhJfHJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63723631"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63723631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:01:59 -0700
X-CSE-ConnectionGUID: iCVeVDcZSguedVPvO1GnIg==
X-CSE-MsgGUID: rPVV21LWTqG3HlsE3kXlFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184892900"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:01:51 -0700
Message-ID: <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Date: Mon, 27 Oct 2025 17:01:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
 <aPuqYz3ly5a3__mf@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <aPuqYz3ly5a3__mf@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_020203_048305_C789D7E5 
X-CRM114-Status: UNSURE (   7.69  )
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



On 10/25/2025 12:33 AM, Sean Christopherson wrote:
> On Fri, Oct 24, 2025, Binbin Wu wrote:
>>
>> On 10/17/2025 8:32 AM, Sean Christopherson wrote:
>>> Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() as
>>> providing a one-off helper for effectively three lines of code is at best a
>>> wash, and splitting the code makes the comment for smp_rmb()  _extremely_
>>> confusing as the comment talks about reading kvm->arch.pre_fault_allowed
>>> before kvm_tdx->state, but the immediately visible code does the exact
>>> opposite.
>>>
>>> Opportunistically rewrite the comments to more explicitly explain who is
>>> checking what, as well as _why_ the ordering matters.
>>>
>>> No functional change intended.
>>>
>>> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>>
>> One nit below.
>>
>> [...]
>>> +	/*
>>> +	 * If the TD isn't finalized/runnable, then userspace is initializing
>>> +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
>>> +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
>>> +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
>>                                                                     ^
>>                                                  Nit: Is pre-mapped better?
> Yeah, updated (and then it gets deleted a few commits later :-) ).
Oh, right, nr_premapped will be dropped later.

Since the whole nr_premapped will be dropped, do we still need a cleanup patch
like patch 12 which will be dropped finally?

