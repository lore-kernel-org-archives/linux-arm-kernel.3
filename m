Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0608CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 21:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKY7V5FfRET17/kEDTnFckQsQH4e38JTxTched89wOw=; b=gFxZ89hgX4TgNbNEcwPkjszpGo
	AeeCHYUOpRfYK7gQ7GRkuqhKqabvfRNfNpsW1TDUNQ8eQWPOoreZxlWkNm7WRIx6wxU+btW3cnSm3
	JjyowIwizJnah3Je6jyx4QD2/8Zs/C81iNCTtXb0WBReokyn18ei5jQeXepKQGQtfeb+qGGUWrfEn
	seWc3nF/FgMGCJVA/sPtHD563+vY7rvcES34Xl6H/Mwq+YHBssP30oNSqopLk1y8kJ5CtHAldLsKF
	RsyV0O7xKDtku7Cp0Or0opOlOItUkmErsb2pP9f77+kcHPM+SUOxxffHZXbg2kGN4qmibaUFSSOYB
	JexuwTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPS1y-00000002qhr-2RD1;
	Tue, 19 May 2026 21:31:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPS1v-00000002qgl-2lHC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 21:31:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AA4740976;
	Tue, 19 May 2026 21:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40361F000E9;
	Tue, 19 May 2026 21:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779226271;
	bh=OKY7V5FfRET17/kEDTnFckQsQH4e38JTxTched89wOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BTSu6W0V0CE+Pk6MwecLeB32KlRvGGqEk3KDHMPev64BOWUPU1oD+HV4AOjVmQ5f3
	 vwjwshgRZnNAPkzjE7PHPCYK+IbmM5aICH21f9HqoBX3RUHplMC6nLDHBEhucbKJkH
	 0IBqIpXnMnuDf8M+vbZMcKdt1Vc9MOY0T7Pt5cdhcmpf333SrVjnxC5Alh3tCSihSc
	 Jf7aYXOiEgT4i3LgITMQiXaj+m1d37WMEw/BeLMyYL2pHp5eK53vERKh480lo3Yo0w
	 gVIcrzALlRdSJPBmZH29j/2oGpzhSxSTB269+IcHBlViScKdSuuTV0wg/wwU38Ts7Z
	 g6zbPZzlnHZ5g==
Date: Tue, 19 May 2026 14:31:09 -0700
From: Oliver Upton <oupton@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>
Subject: Re: [PATCH v3 0/9] KVM: arm64: selftests: Basic nested guest support
Message-ID: <agzWnS2gzzhEHEG6@kernel.org>
References: <20260516183003.799058-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516183003.799058-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_143111_737066_74124678 
X-CRM114-Status: GOOD (  20.45  )
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

Hi Wei-Lin,

Thank you very much for the series.

I haven't had time to read through much of this yet, but I noticed
Itaru's comment about leaving stage-1 translation disabled for the L2.

Since selftests expects things like atomics to work we will definitely
need the stage-1 MMU to be enabled w/ Normal mappings (this was broken
in the past [*]). I wonder if we can (ab)use the pre-existing stage-1
tables that the selftests library creates on behalf of the L1. After all,
L1 and L2 are both effectively in the same virtual address space.

[*] https://lore.kernel.org/kvmarm/20250405001042.1470552-1-rananta@google.com/

Thanks,
Oliver

On Sat, May 16, 2026 at 07:29:54PM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v3 of adding basic support for running nested guests (L2) in
> kselftest. This time a framework for enabling stage-2 in the guest is
> added, including the s2_mmu struct, s2 translation control setup, and
> a stage-2 page table generator. Similar to L2 vCPU management, all
> stage-2 work is done in the guest instead of userspace.
> 
> An additional shadow_stage2 test is added which leverages the framework
> to run L2 with stage-2 enabled.
> 
> * Changes from v2 [1]:
> 
>   - Update vm_paddr_t to gpa_t, vm_vaddr_t to gva_t.
> 
>   - Added framework for enabling stage-2 in the guest.
> 
>   - Added shadow_stage2 test.
> 
> Thanks!
> 
> [1]: https://lore.kernel.org/kvmarm/20260412142216.3806482-1-weilin.chang@arm.com/
> 
> Wei-Lin Chang (9):
>   KVM: arm64: selftests: Add GPR save/restore functions for NV
>   KVM: arm64: selftests: Add helpers for guest hypervisors
>   KVM: arm64: selftests: Add hello_nested basic NV selftest
>   KVM: arm64: selftests: Enhance hello_nested test
>   KVM: arm64: selftests: Add shadow_stage2 test
>   KVM: arm64: selftests: shadow_stage2: Allocate L2 stack from dedicated
>     pool
>   KVM: arm64: selftests: shadow_stage2: Check supported stage-2 granule
>     size
>   KVM: arm64: selftests: Add infrastructure for using stage-2 in guest
>   KVM: arm64: selftests: shadow_stage2: Turn on stage-2 translation for
>     the nested guest
> 
>  tools/testing/selftests/kvm/Makefile.kvm      |   5 +
>  .../selftests/kvm/arm64/hello_nested.c        | 134 +++++++++
>  .../selftests/kvm/arm64/shadow_stage2.c       | 165 +++++++++++
>  .../selftests/kvm/include/arm64/nested.h      |  85 ++++++
>  tools/testing/selftests/kvm/lib/arm64/entry.S | 137 +++++++++
>  .../selftests/kvm/lib/arm64/hyp-entry.S       |  77 +++++
>  .../testing/selftests/kvm/lib/arm64/nested.c  | 264 ++++++++++++++++++
>  7 files changed, 867 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/arm64/hello_nested.c
>  create mode 100644 tools/testing/selftests/kvm/arm64/shadow_stage2.c
>  create mode 100644 tools/testing/selftests/kvm/include/arm64/nested.h
>  create mode 100644 tools/testing/selftests/kvm/lib/arm64/entry.S
>  create mode 100644 tools/testing/selftests/kvm/lib/arm64/hyp-entry.S
>  create mode 100644 tools/testing/selftests/kvm/lib/arm64/nested.c
> 
> -- 
> 2.43.0
> 
> 

