Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DF6CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZFjUecKeoM0wM6NVOccMenUolXv2il+hW7at1O2jY0=; b=mCtI0uTCzT1rRuSbAyG/wkLMNN
	FItHozah5LVSuF3t2/oUy+4YomHH7jIzVmVkiGjtFY87cyTKrm4ciU1WAR8iKOMee1qsY9L7PGwqT
	J5EgWuq139b3LE53ojaCnouMLsSTpKxF3yNrIiVJhcw8xV6y809WRHMHWW39SfmIBexkY25YniyLB
	MCSrNxoUZ6MNhW2/RM9DqiaxmrxW/2PJRHj0BnMAhZRjLPkIw91bl3Y1Sru/eoApd4fw2piLhU3E1
	eFD/1ap7Df8PJoaDIehgq++S3gs0B01Aa4mnXq5Y+VE6iiVtHoyut/myv1MoIJElYShlJu/PM+Kfw
	qL8IoJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCO3-00000008XCY-1kst;
	Fri, 24 Oct 2025 07:38:59 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCO0-00000008XBE-0rK1;
	Fri, 24 Oct 2025 07:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761291537; x=1792827537;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mqrmnotooRW9zCLkNbwsBqACdnSVp7ozY0nJzWJwIdI=;
  b=VDZnkcOiK5jMO2ANywbp1hhvrsp5/LL+/HJkLKpH+rGvx/WbmJfgktB2
   8JVC1seEsBZPltlYvCeaaHMwTFUmjX+pG15rxOASdK0WWdn/lFotrGo/Y
   Es1lxCz8gBsVhoqAZZ4sFhC11PPEieJe3STILpG/CTasr1Cl4UIUfh9AU
   J5PkIl0tYKFOlVyyfW9nzYeNzzlFOoNlNwHk7gegnIWEYq7FS2m1P8K9l
   xj0P2aCU4igJKAX6spZU2U9fuQC4F+t4L0TPqHYJth1lf9vLPpJfTItj2
   guodjgaL3EwcQTKxAHHHeLjC57djzpZmi8diDXqkz63yiGBBF0bODFNHQ
   g==;
X-CSE-ConnectionGUID: TdVH6mYpSSqLW2OtJimUKA==
X-CSE-MsgGUID: RuFjE/tgT12ZkUc7P5D22A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86100988"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="86100988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:38:56 -0700
X-CSE-ConnectionGUID: UxV1qHb2TCSYa+TzbX0Eow==
X-CSE-MsgGUID: EwmjUoGZTCaYHb6B07GYSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="188424583"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.235.70]) ([10.124.235.70])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:38:46 -0700
Message-ID: <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Date: Fri, 24 Oct 2025 15:38:43 +0800
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
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251017003244.186495-14-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_003856_295000_5940251E 
X-CRM114-Status: GOOD (  13.38  )
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



On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() as
> providing a one-off helper for effectively three lines of code is at best a
> wash, and splitting the code makes the comment for smp_rmb()  _extremely_
> confusing as the comment talks about reading kvm->arch.pre_fault_allowed
> before kvm_tdx->state, but the immediately visible code does the exact
> opposite.
>
> Opportunistically rewrite the comments to more explicitly explain who is
> checking what, as well as _why_ the ordering matters.
>
> No functional change intended.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

One nit below.

[...]
> +	/*
> +	 * If the TD isn't finalized/runnable, then userspace is initializing
> +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
> +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
> +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
                                                                    ^
                                                 Nit: Is pre-mapped better?
> +	 * have been added to the image, to prevent running the TD with a
> +	 * valid mapping in the mirror EPT, but not in the S-EPT.
> +	 */
> +	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE)) {
> +		if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
> +			return -EIO;
> +
> +		atomic64_inc(&kvm_tdx->nr_premapped);
> +		return 0;
> +	}
> +
> +	return tdx_mem_page_aug(kvm, gfn, level, pfn);
>   }
>   
>   static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,


