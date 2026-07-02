Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA20CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Zl4ubBq30LvbYhrRuVBIbmJletCpXzI7+r+V3EzIpg=; b=FpPUjzPsyDeK00Q/yQw3AXfH++
	lpBx0RS9Y9iUrXDNA9Cm7YrxNDzkteab1gkRTlKcXT6hl2NUQ/BnPS5Bz4y9K0qAtNi4VODBtmJoz
	0ka4pPEcsekijmXZSKEq+mMGK1UEbv2y4gw4Um3HtRf/aLdFK5BHYHWmjjNvo7DbZftjHDIruYqpj
	aZkHlB8jiFpHU5U2O7VjuFN412VyR4wtJinSXVX6s8WqbOibYY2QcOVRRk3YFwW0ITzepXQYjxZOf
	5VODbWGRgRFpx9hbcAL4/4iS6JMzEm/rstympsrQwR+74kqB8v5F2h/riJG7EaJowPPspw65oKp1C
	AZyX48NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHnb-00000004YnS-2Cwl;
	Thu, 02 Jul 2026 13:49:51 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHnX-00000004Ym9-2beL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783000188; x=1814536188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xnklOfOMgd3lTWP7dbDjW/8W/dMixSDLsT9X9yUD6WE=;
  b=XQueaELMbwvxVm6QyqINVgaewdfkWwuROoajSTY+O70/J4X6BMX69wtC
   GRdKmjaY4cuBe3mrVkKUd20EP1HvPYPdOWhmpQIV055fvAsvopUZFSL5L
   a/q2zfh/sM3dfk07qtKgdqaO5qdfLhb99rXz/fW0DwltAkKh2c+3398JP
   E5yWSrrTOCZ8/YtlzfMI39pTwNtNhJGgT8vCczqKrFYtCQtckNb7bUr1S
   SXuaDnFs5ZwRuNFJRw0xYdmoH3i3WTuY77e5yaYldryXHEqTg8Ls8N/jL
   HBokbjm5jKLLsVmIMjDk0hVTmCDxq26T9eSGdhT9QwuRt4KyeOxoHXJDE
   Q==;
X-CSE-ConnectionGUID: qjg6AmzyTniuSkqZDV6rwQ==
X-CSE-MsgGUID: tQPfhJxzQviZt3oAmPbS3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="246101278"
X-IronPort-AV: E=Sophos;i="6.25,143,1779116400"; 
   d="scan'208";a="246101278"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 22:49:45 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 41A811C0169C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 13:49:44 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id EDB7E149CEDE
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 13:49:43 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.40.135])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with SMTP id BDCF5402885;
	Thu,  2 Jul 2026 13:49:35 +0000 (UTC)
Date: Thu, 2 Jul 2026 22:49:27 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 00/44] arm64: Support for Arm CCA in KVM
Message-ID: <akZnzMt145i7s-dY@FCCLS0092175.localdomain>
References: <20260513131757.116630-1-steven.price@arm.com>
 <akR0eX0nCumIgnlh@FCCLS0092175.localdomain>
 <8c0e6a32-2de2-4b94-9fe2-e32f5e9bcc4a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8c0e6a32-2de2-4b94-9fe2-e32f5e9bcc4a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_064948_164649_8C2BCEE5 
X-CRM114-Status: GOOD (  50.85  )
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

On 07/01 11:53, Steven Price wrote:
> On 01/07/2026 03:15, Kohei Enju wrote:
> > On 05/13 14:17, Steven Price wrote:
> >> This series adds support for running protected VMs using KVM under the
> >> Arm Confidential Compute Architecture (CCA).
> >>
> >> This is rebased on v7.1-rc1, but still targets RMM v2.0-bet1[1].
> >>
> >> The major updates from v13 remain but have been more fully implemented:
> >> the RMM uses the host's page size, range based RMI APIs mean we don't
> >> have to break everything down to base page sizes, the GIC state is
> >> passed via system registers, and the uAPI has been simplified.
> >>
> >> The main changes since v13 are:
> >>
> >>  * The RMI definitions and wrappers have been fully updated for RMM
> >>    v2.0-bet1. In particular the temporary RMM v1.0 SMC compatibility
> >>    patch has been dropped.
> >>
> >>  * The PSCI completion ioctl has been removed. RMM v2.0-bet1 still
> >>    requires the host to provide the target REC for PSCI calls which
> >>    name another vCPU, but KVM now performs the RMI PSCI completion
> >>    automatically before entering the REC again. Userspace no longer
> >>    needs to issue KVM_ARM_VCPU_RMI_PSCI_COMPLETE. A future spec should
> >>    remove the need for the host to provide the MPIDR mapping.
> >>
> >>  * The generic RMI init, RMM configuration, GPT setup,
> >>    delegate/undelegate helpers and SRO infrastructure have moved out of
> >>    KVM into arch/arm64/kernel/rmi.c. RMI is expected to be used by
> >>    features outside KVM, so this code should be available even when KVM
> >>    is not built.
> >>
> >>  * RMI_GRANULE_TRACKING_GET has been updated to work on a range, this
> >>    allows it to work when the region is not aligned to the tracking
> >>    size. Solves the problem reported by Mathieu[2].
> >>
> >>  * SRO support has been moved earlier in the series and improved. It
> >>    provides a cleaner way for the host to provide the RMM with the extra
> >>    memory it requires. However support is still incomplete where the
> >>    TF-RMM code does not yet implement it. This is noted by FIXMEs in the
> >>    code.
> >>
> >>  * The ARM VM type encoding has been reworked to coexist with the
> >>    upstream pKVM KVM_VM_TYPE_ARM_PROTECTED bit.
> >>
> >>  * The private-memory documentation now notes that arm64 uses
> >>    KVM_CAP_MEMORY_ATTRIBUTES.
> >>
> >>  * PMU support is dropped for now. It will be added later in a separate
> >>    series. Similarly for selecting the hash algorithm and RPV.
> > 
> > Hi Steven,
> 
> Hi,
> 
> > Is there any plan to add support for selecting the MEC policy (shared or
> > private)? We have been working on adding support for this on top of your
> > series. If this is not already in the works, we may upstream our
> > implementation later.
> 
> I've been trying to focus on getting the minimum useful series
> upstreamed before looking at additional features (such as hash
> algorithm, MEC policy etc). If you've already got support then yes
> please do upstream it later when we've got this series landed.

Thank you for the clarification. That makes sense.

I agree that the non-RFC patch should wait until your series has landed.
Before that, however, I'd like to send an RFC patch to gather feedback
on the design from the community while your series is still under
review. I don't expect the RFC to interfere with the upstreaming of your
series.

Thanks,
Kohei.

> 
> Thanks,
> Steve
> 
> > Thanks,
> > Kohei
> > 
> >>
> >> There are also the usual rebase updates and smaller fixes, including
> >> changes to the RMM v2.0-bet1 range APIs, removal of REC auxiliary
> >> granule handling, fixes to the address range descriptor encoding, and
> >> cleanups around realm stage-2 teardown.
> >>
> >> Stateful RMI Operations
> >> -----------------------
> >>
> >> The RMM v2.0 spec introduces Stateful RMI Operations (SROs), which allow
> >> the RMM to complete an operation over several SMC calls while requesting
> >> or returning memory to the host. This allows interrupts to be handled in
> >> the middle of an operation and lets the RMM dynamically allocate memory
> >> for internal tracking purposes. For example, RMI_REC_CREATE no longer
> >> needs auxiliary granules to be provided up front, and can instead
> >> request memory during the operation.
> >>
> >> This series includes the generic SRO infrastructure in
> >> arch/arm64/kernel/rmi.c and uses it for REC create/destroy. The other
> >> cases are not yet used by TF-RMM and a future revision will be needed to
> >> finish those paths in Linux.
> >>
> >> This series is based on v7.1-rc1. It is also available as a git
> >> repository:
> >>
> >> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v14
> >>
> >> Work in progress changes for kvmtool are available from the git
> >> repository below:
> >>
> >> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v12
> >>
> >> The TF-RMM has not yet merged the RMM v2.0 support, so you will need to
> >> use a branch with RMM v2.0-bet1 support. At the time of writing the
> >> following branch is being used:
> >>
> >> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc_2
> >> (tested on commit 3340667a291a)
> >>
> >> There is a kvm-unit-test branch which has been updated to support the
> >> attestation used in RMMv2.0 available here:
> >>
> >> https://gitlab.arm.com/linux-arm/kvm-unit-tests-cca cca/v4
> >>
> >> [1] https://developer.arm.com/documentation/den0137/2-0bet1/
> >> [2] https://lore.kernel.org/all/acrj-cKphy4hJsEG@p14s/
> 
> 

