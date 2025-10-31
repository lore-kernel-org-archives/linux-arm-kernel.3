Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C41BCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzjqWFPbYzjEfpDteBcncRVxcsQvYXXWJGNfJY3z6Qw=; b=medZP6XupUArXYrRNjwJ+YopVa
	U709G+Qq40vZsmNtY3o9h9f82fI86pyRf3jNgY9P9/fPi2abBc1rFq1n0yeJ6wBjiSJll4l5hT9ea
	9Omkx9hIy854kYFY11JDXuDevbC2/GDMfAefJADEEtjF7I40Kflsk5kTkZngNoix6Mor+mZdSozuj
	BtufmYWxa1Tmzs34Rv8+Uj4YnhXq1EXntbxQaODQAq2UxFk//9xnb5FbMZ2f18KUAdaOjx/wnOuWX
	fTNedri7fWzsAWQmJfVd/p4//dP8d2dRwZzTA7J3hhrkm/2srs9+UUGj8ITrUCNXxhwoA0POXtG/M
	rqgtZMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkMF-00000005d6k-1N7z;
	Fri, 31 Oct 2025 08:19:41 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkM9-00000005d3h-0ETg;
	Fri, 31 Oct 2025 08:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761898773; x=1793434773;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EzjqWFPbYzjEfpDteBcncRVxcsQvYXXWJGNfJY3z6Qw=;
  b=Uu01M07n5zKOlRjF7OzTzFGT5Rk4rSA/1L3VOjsCFftzEMEl+9nqIM2c
   m8V0YCCHUdhcYM+2dpKb/yJiVPS5okYFPQdWeX4lRnE25AJl4lT1Aj9Jz
   KcwLCtk8kCL2Qm5xd9YohjYMouNTX9zQ4S2WKjRfLAuF5hRVDJmz1W75p
   I/OTmTY371A0utoNQnA0c8LyLwqXKWwoOwK4gH/GAbceBAsm3anc2oV//
   Trm914ZmWlN+l3n0HJSeY7cV6iwOB9ejt9W5Qh578N9lXljPWT7fweVaE
   YF6wGX5TO/IUdfxKp6ebzHUyyDLWW1lMb24RL5n4wCWrkSZSRN5dCsOKI
   A==;
X-CSE-ConnectionGUID: 8ZlWVh3VST2hI0G+0lWdgQ==
X-CSE-MsgGUID: fpu2L7NTRxaeLwZkm/sQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66666550"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="66666550"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:19:29 -0700
X-CSE-ConnectionGUID: ln37oo4sSVGgtPADrikf7g==
X-CSE-MsgGUID: Cf3BSL1nT0KAv+tRtGKg6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186112068"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:19:22 -0700
Message-ID: <af023723-63d5-46d3-85bb-c2d2dcfe7b15@linux.intel.com>
Date: Fri, 31 Oct 2025 16:19:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full
 RWX when creating S-EPT mapping
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
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-13-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-13-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_011933_146172_09E6D88B 
X-CRM114-Status: UNSURE (   5.64  )
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



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Pass in the mirror_spte to kvm_x86_ops.set_external_spte() to provide
> symmetry with .remove_external_spte(), and assert in TDX that the mirror
> SPTE is shadow-present with full RWX permissions (the TDX-Module doesn't
> allow the hypervisor to control protections).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


