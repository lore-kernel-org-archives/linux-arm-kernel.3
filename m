Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB602C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGUzNoTlced3kJpSWbCqS1844JxyRpE5REsVBSmrlIc=; b=o2wZmz5npJ7be/LCBqdAoe1puX
	XtoFhEAmUAZdi84lJlN8iG9kraB+75yhbZIfxPRtNROq5DsrkOTnLi7lyvor7JI4OIXSfV461RBqR
	khn2x9tuI/ibAdHpqE7JdKqL6etYum5nJoLwdhy5eXG2ZC8tEwLSvp2b4PFCqDieVQIRFR6NrMtY9
	HHdy0RlH53lfk+/bxxLl+/UZ3ZuOIfs6MS+q7n6QRBoWBW07APE/9ALuCTBCzwdfg9RsJC8IV+OnR
	WTjJr0ayU8FkPyGd7pnonflfLd5uHgj5f3NbHVBqVwSJTyICwD3Zv+mLvBYBTxl7tIXWoLUKCEAro
	dWfZBeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTkl-000000041Cb-0m1L;
	Mon, 27 Jul 2026 22:24:55 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTki-000000041C1-0Mce
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785191095; x=1816727095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3EuTfDhU7UqVMvj85eqJNeuNbQJACnt857e5rAiZhGQ=;
  b=MKSIDpcHLnbB1jq0ctoNI8KZreAt0xExW5KQWNjedcFbNIk/exCkD3jk
   CIaKgoIB/dqD8yYnj6ufkwNNR4hO/kPi55emOR1vfe7zWhgYMHE88U67x
   1zmxh5N0/1UYCpQMUbfqMEgSh6y5/f5YENaSIuNlPvjuhNAgtICzAstd3
   Ko+xw33TVEBtQDQIaR3mU2ZXLyHy2LHsuZ+aLuydLwAmLuRPQnPKZT4K+
   cvaA3w6dmIa8lqcxB05b6nbxjrvw+o6Sy56kK72YpvQJqgSqIvX3cs2mV
   Ib2NidSsuqxchfBgu60PhAyznS3+34csaBpCIjesR5iSX7v+Bt/GAJJ00
   Q==;
X-CSE-ConnectionGUID: jiRt+Dy0S36MjjKCCAwdzw==
X-CSE-MsgGUID: AQ6SrObATG2Dt1Ohe9hdTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="236205721"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="236205721"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:24:50 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 17F4D1000349
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 22:24:47 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BD8ED1000846
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 22:24:46 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 1CE69405E2F;
	Mon, 27 Jul 2026 22:24:41 +0000 (UTC)
Date: Tue, 28 Jul 2026 07:24:39 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v4 0/6] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <amfap0e5dhQgo4eW@sm-arm-grace07>
References: <20260714115926.2044757-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714115926.2044757-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_152452_711757_52858E30 
X-CRM114-Status: GOOD (  28.21  )
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

On Tue, Jul 14, 2026 at 12:59:19PM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v4 of optimizing the shadow s2 mmu unmapping during MMU
> notifiers. The general theme stays the same, but various
> improvements/fixes are added. Thanks for all the feedback. Please see
> below for the changes.
> 
> * Changes from v3 [1]:
> 
>   - Rebased on to the latest kvmarm/fixes.
> 
>   - Removed commit "KVM: arm64: Move shadow_pt_debugfs_dentry to reduce
>     holes in kvm_s2_mmu" because the current shadow ptdump code is found
>     to be buggy and the proposed fix removes shadow_pt_debugfs_dentry [2].
> 
>   - Rename some variables to improve readability e.g. ipa ->
>     canonical_ipa, fault_ipa -> nested_ipa.
> 
>   - Skip reverse map optimization when !mmu->nested_stage2_enabled,
>     and just unmap the canonical IPA range during MMU notifiers.
> 
>   - Change comment above the code that checks whether an identical
>     reverse map already exists in kvm_record_nested_revmap() from saying
>     it could be a permission update to saying another parallel stage-2
>     fault could have inserted an identical reverse map. This is because
>     permission update won't trigger kvm_record_nested_revmap().
> 
>   - Add helpers for checking maple tree entry flags VALID_ENTRY and
>     UNKNOWN_IPA, also warn if both are set at the same time.
> 
>   - Test canonical IPA alignment with the mapping size during reverse
>     map insertion.
> 
>   - Move clean up of kvm_unmap_gfn_range() to its own patch.
> 
>   - Avoid naming variables with "*dir*", as it can be misunderstood to
>     be related to directories.
> 
>   - Use mas_find() instead of mas_find_range() as mas_find_range()
>     returns every range including empty/NULL ranges, for our use case
>     we only want to iterate over non-NULL ranges.
> 
>   - Added a trace point to track when the reverse map maple tree becomes
>     "broken" i.e. maple tree insertion failure.
> 
> Thanks!
> 
> [1]: https://lore.kernel.org/kvmarm/20260510145338.322962-1-weilin.chang@arm.com/
> [2]: https://lore.kernel.org/kvmarm/20260630121005.1130996-1-weilin.chang@arm.com/

Thanks for the update. I know this series is sitll being discussed, but I
went ahead testing the kernel with your proposed hello_nested seltest on a Grace
CPU. 

Before this series applied:
real    0m2.869s
user    0m0.003s
sys     0m2.862s

After this series applied:
real    0m0.027s
user    0m0.001s
sys     0m0.005s

It reduces the time needed for the VM tear-down paths. I will test this series again 
when v5 comes out, since I've git this a try;

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.

> 
> Wei-Lin Chang (6):
>   KVM: arm64: Use a variable for the canonical GPA in kvm_s2_fault_map()
>   KVM: arm64: nv: Avoid full shadow s2 unmap
>   KVM: arm64: nv: Add nested revmap broken tracepoint
>   KVM: arm64: Refactor kvm_unmap_gfn_range() with common variables
>   KVM: arm64: nv: Remove reverse map entries during TLBI handling
>   KVM: arm64: nv: Create nested IPA direct map to speed up reverse map
>     removal
> 
>  arch/arm64/include/asm/kvm_host.h   |   9 +
>  arch/arm64/include/asm/kvm_nested.h |   6 +
>  arch/arm64/kvm/mmu.c                |  42 +++--
>  arch/arm64/kvm/nested.c             | 280 +++++++++++++++++++++++++++-
>  arch/arm64/kvm/sys_regs.c           |   3 +
>  arch/arm64/kvm/trace_arm.h          |  27 +++
>  6 files changed, 349 insertions(+), 18 deletions(-)
> 
> -- 
> 2.43.0
> 

