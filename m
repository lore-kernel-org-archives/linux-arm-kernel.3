Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CE4CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHqXAZgFaTIYpj3YT+irqrhrATN20Im0CDfIlCjE0+M=; b=fMbeRKOfam4pW6NaZljPs47Hci
	g0MMts1rN25lJBvr9HOuQowsBBP1Vr90gA4Tcv1QjDiR2EINMPjSQymQgy5QrdiKRQph0ryxsdBLC
	fKSRJibvHAkSOPqF9h61S+QUd8NxzxdtUpHf4nYXaPlo8YPvbVShdX/BR79gUV/rIP22VWC2RFvdc
	VRb1xsbT7MlXmkZtStxDrDurMyKXjjpn7nnb6p+gRNaUnCE3390rMJAW/HTVUaix10KP5b3nFMA6C
	bFDvTfTmWy3z1C214Iq9atCmqn95PSkP2E9NhB505o5NSH9B4lq+k/IzB+3SnfEOSXl9AUj8aD5fK
	Cg+5aRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvpw-00000005qhw-3epb;
	Tue, 23 Jun 2026 07:46:24 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvpt-00000005qhB-3psJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782200782; x=1813736782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pb/y3OHpId8gRg21e98iHl/w2OyFbj6DK2ruwWVF5ws=;
  b=MkFLWByn47vai7XHfkg6CWzC4RClgkIuESNJ5EvugUJVQ3zn2nhbU9+x
   HE8L83gWJPHQPaitbaUHxMi5iCpv89tyaiS1EdtkAFO8V5q381JT1SQ1E
   lnvHQnOygGHm004SelNo7zNBbuRfZhvS8Du/VRkYiXiAPijRQ3tzvZRWa
   6LAHDMYvT2rMmqFEuu+PObEBMnhEe/DLukvfajZB8ORR6Hq5I7hhRixoX
   97CvKyHExffx/m41HIVRyMjyz4TbBQTd4TCIu12W8CC6ZnJLASXhT+06Y
   GJCPSBGRyrc+aUX+mQyzL67JU5jnytZPM+zHmgUBYnYHKXqnKNZA86JlP
   w==;
X-CSE-ConnectionGUID: 4X8Rj0/4SCOBhAQ9HAyxbA==
X-CSE-MsgGUID: ZBIPcDq7THCuKmm7coWNiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="223916678"
X-IronPort-AV: E=Sophos;i="6.24,220,1774278000"; 
   d="scan'208";a="223916678"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:46:17 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F33E08203E6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:46:16 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AD01C83D977
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:46:16 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 7455F20000F4;
	Tue, 23 Jun 2026 07:46:12 +0000 (UTC)
Date: Tue, 23 Jun 2026 16:46:09 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/5] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <ajo5wUzh0usQTXMk@sm-arm-grace07>
References: <20260510145338.322962-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510145338.322962-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_004622_529355_DA6E7B0B 
X-CRM114-Status: GOOD (  18.57  )
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

On Sun, May 10, 2026 at 03:53:33PM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v3 of optimizing the shadow s2 mmu unmapping during MMU
> notifiers.
> 
> Two new preparatory patches are added, one reduces a hole in kvm_s2_mmu
> and another refactors the code a bit during s2 faults. Other changes are
> listed below.
> 
> * Changes from v2 [1]:
> 
>   - Removed "polluted" teminology.
> 
>   - Use xa_{mk, to}_value() when storing and retriving values from maple
>     trees.
> 
>   - Avoid using the 63rd bit in maple tree values so that xa_{mk, to}_value()
>     does not lose us a bit.
> 
>   - Added reverse map removal during TLBI handling.
> 
>   - Other suggested refactorings.
> 
> Thanks!
> 
> [1]: https://lore.kernel.org/kvmarm/20260411125024.3735989-1-weilin.chang@arm.com/
> 
> Wei-Lin Chang (5):
>   KVM: arm64: Use a variable for the canonical GPA in kvm_s2_fault_map()
>   KVM: arm64: Move shadow_pt_debugfs_dentry to reduce holes in
>     kvm_s2_mmu
>   KVM: arm64: nv: Avoid full shadow s2 unmap
>   KVM: arm64: nv: Remove reverse map entries during TLBI handling
>   KVM: arm64: nv: Create nested IPA direct map to speed up reverse map
>     removal
> 
>  arch/arm64/include/asm/kvm_host.h   |  17 +-
>  arch/arm64/include/asm/kvm_nested.h |   6 +
>  arch/arm64/kvm/mmu.c                |  43 +++--
>  arch/arm64/kvm/nested.c             | 238 +++++++++++++++++++++++++++-
>  arch/arm64/kvm/sys_regs.c           |   3 +
>  5 files changed, 290 insertions(+), 17 deletions(-)

While investigating the long VM teardown time on QEMU in the nested shadow 
stage 2 selftest, I instrumented a few functions with bpftrace.

The same kselftest workload produced the following counts:

Without this series (today's kvmarm/fixes):

kvm_nested_s2_unmap: 12
kvm_pgtable_stage2_unmap: 8,388,623
kvm_tlb_flush_vmid_range: 8,388,623
exit_vmid_context: 8,388,639

With this series:

kvm_nested_s2_unmap: 12
kvm_pgtable_stage2_unmap: 18
kvm_tlb_flush_vmid_range: 18
exit_vmid_context: 34

The bpftrace script used was:

#!/usr/bin/env bpftrace

fentry:kvm_nested_s2_unmap
{
    @nested = count();
}

fentry:kvm_pgtable_stage2_unmap
{
    @pgunmap = count();
}

fentry:kvm_tlb_flush_vmid_range
{
    @flush = count();
}

fentry:exit_vmid_context
{
    @exit = count();
}

END
{
    print(@nested);
    print(@pgunmap);
    print(@flush);
    print(@exit);
}

Is this consistent with what you evaluated during the development?
I wonder if this is good for nested guest boot paths too.

Thanks,
Itaru.

> 
> -- 
> 2.43.0
> 

