Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5965FEA82F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vt7Mb16aSdMDgOFjLAuuIeayxSikgKE6p5Q9CKHus2k=; b=29PyJKyxN+mJ82RammFtsvo4go
	76iRmBpiTKRNGvZFlqieM2r9VwMKgiw3si7kTXy0Lc7Mk8lzxP1v2elgtb+hjO30Xiu9Ha+sbjLLX
	y3c5HXfTLTToc2lItZkC7CztGQSTzX2UHLgzMQngexeJ6xSHFZ6zDTWzGI+DfdryhBWCCXLfVQVm+
	68fmSnj10A8at4rJCMMV3gZJXhiPaihFMh2sJjXgqk4kP3e4vCLtjhAgdwraVwKYyoYSf5QDtZgQT
	ADZIt+Nfre7P9CL0thgAUhgM2gYH1yj1TSFJbq2C10j+E2qSvL4kgPake4M2vquhbcDVJkTGoP8iB
	4jAPBP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JAb-00000002tjj-1UFW;
	Wed, 25 Mar 2026 08:00:53 +0000
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JAY-00000002tjL-26z8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 08:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774425650; x=1805961650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VlBxR/SzYAHrqVgrVE6UN8eEpY06CR6hnRPY1BAcTpo=;
  b=hmKKzLLyqPbEmpBjAzqVdpcOA320uTr3zTAK0foSjHdvvVpd1OicK27P
   Q/3VwuV0HxHpOmqcPKNldWy7tUC9HgYf/kJORq64Zlc4Tfst3d9TmDjgY
   3clAQUGzkopcnmZgW9z1DXJ4lSDjsbuGbytOGXlgM2gZp6FMb7UAljPqm
   dzU9tE6rfqhIc2K9kL+LvNBeXrK1deizi6UkEbFP9hkRBbRviMa+nFooL
   p8fmLKtlCSUOqoGDZ/5Oz08Klw1Om5fXV7W6QkdM2KFif74GEVw9CfR0C
   TZZXQ+2q9+MY2m0lP2tChfzdO1f8SEeh3YIf6TDZYN2Mv+l9W6td5ZiT4
   Q==;
X-CSE-ConnectionGUID: oQWojVaUTv+ziivt2bjrhg==
X-CSE-MsgGUID: 1dspShgtQTKQvmnJmdRBZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="235253127"
X-IronPort-AV: E=Sophos;i="6.23,139,1770562800"; 
   d="scan'208";a="235253127"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 17:00:47 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6CFDF1C0019F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 08:00:47 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 1BE68100D100
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 08:00:47 +0000 (UTC)
Received: from sm-arm-grace07 (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 53168101BB54;
	Wed, 25 Mar 2026 08:00:41 +0000 (UTC)
Date: Wed, 25 Mar 2026 17:00:37 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/3] KVM: arm64: selftests: Basic nested guest support
Message-ID: <acOWJT39NGrmfSbQ@sm-arm-grace07>
References: <20260325003620.2214766-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325003620.2214766-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_010051_114004_6FDAE276 
X-CRM114-Status: GOOD (  22.73  )
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

Hi Wei Lin,

On Wed, Mar 25, 2026 at 12:36:17AM +0000, Wei-Lin Chang wrote:
> Hi,
> 
> This series adds basic support for running nested guests (L2) in
> kselftest. The first patch adds library functions. While designing the
> APIs for userspace, I referenced Joey's approach for kvm-unit-tests [1].
> In summary, four preparatory functions are provided for userspace to
> set up state to run an L2 in EL1:
> 
>  - prepare_l2_stack()            <- sets up stack for L2
>  - prepare_hyp_state()           <- sets up vEL2 registers
>  - prepare_eret_destination()    <- userspace passes a function pointer
>                                     for L2 to run
>  - prepare_nested_sync_handler() <- sets up hvc handler in order to
>                                     regain control after L2's hvc
> 
> After calling those functions, userspace can vcpu_run(), and when
> run_l2() is called within the guest, the supplied function will be run
> in L2, with the control flow managed by the library code in nested.c and
> nested_asm.S. After running the L2 function, run_l2() will automatically
> return. Note that the L2 function supplied by the user does not have to
> call hvc.
> 
> Patch 2 demonstrates usage of the APIs introduced above, with a simple
> L1 -> L2 -> L1 sequence, with an empty L2 function.
> 
> Patch 3 enhances the library functions by setting up L2 -> L1 stage-2
> translation. Currently the translation is simple, with start level 0, 4
> levels, 4KB granules, normal cachable, 48-bit IA, 40-bit OA.
> 
> [1]: https://lore.kernel.org/kvmarm/20260306142656.2775185-1-joey.gouly@arm.com/

Look like this selftest assumes nested guest's MMU is disabled (L2 IPA
to L1 IPA to PA), but I couldn's find the explicit SCTLR.M bit operation in this
series, how do you make sure it is always off?

Thanks,
Itaru.

> 
> Wei-Lin Chang (3):
>   KVM: arm64: selftests: Add library functions for NV
>   KVM: arm64: sefltests: Add basic NV selftest
>   KVM: arm64: selftests: Enable stage-2 in NV preparation functions
> 
>  tools/testing/selftests/kvm/Makefile.kvm      |   3 +
>  .../selftests/kvm/arm64/hello_nested.c        |  65 ++++++++
>  .../selftests/kvm/include/arm64/nested.h      |  25 +++
>  .../selftests/kvm/include/arm64/processor.h   |   9 +
>  .../testing/selftests/kvm/lib/arm64/nested.c  | 154 ++++++++++++++++++
>  .../selftests/kvm/lib/arm64/nested_asm.S      |  35 ++++
>  6 files changed, 291 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/arm64/hello_nested.c
>  create mode 100644 tools/testing/selftests/kvm/include/arm64/nested.h
>  create mode 100644 tools/testing/selftests/kvm/lib/arm64/nested.c
>  create mode 100644 tools/testing/selftests/kvm/lib/arm64/nested_asm.S
> 
> -- 
> 2.43.0
> 

