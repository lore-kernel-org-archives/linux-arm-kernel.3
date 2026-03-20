Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E221099B39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 19:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27oQPGee+pCce4LX4d3cffRYcMHTjkyHxhfK3SSVgnA=; b=sytpl6UxM2z+CFvmHe6i9kZAuz
	SizrQgs2I6iWv+bCVMRsGKzz/23XS1Sk4poDU195X6Mv54137Vu8bvE6RdlOXbI6bsjYyAs/LnPl1
	lnWkqmRtx/4vbnSUXJlRUMnzHvergtIGGzGLwxfFHwCkn5jANtN5dBC/n/6xseLJrc+DxLlAcesGw
	K1zHLr1UpxPa2gCxQrylsdcTtQuKyShZR9XM2IQcEjz+8X7fHfbOaAsalWqj6iJ6LYrQV7DFErEnU
	QlRgoO/oD7ZcCu9oxjP4X3sCgaixwjdcTCrmu/pZk/pG17ZcFCk2yZd7/75rmy0Wv+iXgUOLczKkZ
	B6SMq1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fK6-0000000DR7p-0Pps;
	Fri, 20 Mar 2026 19:15:54 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fK3-0000000DR70-0aea
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 19:15:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82a73593410so900220b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774034150; x=1774638950; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27oQPGee+pCce4LX4d3cffRYcMHTjkyHxhfK3SSVgnA=;
        b=Qn/b+uI3sBR/QHui/ODpToCvwyTpQwBkwUcoApKE9FGxAz+SyhdSEqDgu7KV0Ldqsq
         tab9GYZ+dgvTXxbi82aP8xFYthGx880GfGructgkLDR0oPAGtCZRJ/ujnBOiqGLNiM+A
         rJDXMW6W6odlVFSb28dTZMYcgvmVTlNewL8xbjtPGmsl2OuK5tpykqYWlSVF9X6gT6tG
         XwLmgX0AL+Yyl1DrtZ/e1BeP4lVaSoxgPLZ+qz3Vp2MxvI8IrioLaa2/CNSed+R2Q8i0
         VX+zIUTT/siNvTDkg1Wc0p2AFKFbwQVkpt6wnkAZyNJGhlVDdZVhCl3VV1aKYLZ05p/m
         yvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774034150; x=1774638950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27oQPGee+pCce4LX4d3cffRYcMHTjkyHxhfK3SSVgnA=;
        b=i2IR6F6QA9qY59ALRjB3RUcDGuYVowAq7ON4fjhs2GdydYlJYA6sYF8Tag5/PtxQ61
         BHvG8PyHAgVNm4BSMGEGMwvGAyJe0yI86J7EMlUBMdPdvUyoDnqsj3i2Pz9pgb39RVAF
         1my+7EgiPo+Tcor6LNWp4e+m7HsINQOxdbMakydu2r5szLK/MWER6tp6L4KyVhMGLheD
         7AzSbjg4Bits0NeDkf1SBPkTTH1xd1ZkHQDMuYNTVJcXE5JbhcISu2TyBxD8yvdKgJ6c
         jE0e9hw4YxdwNnYIV3q6uiIuuOGn7Z+TvIaGAKDzfg5nXxmFODSNfapdQfR9dcf6sTfg
         +0pw==
X-Forwarded-Encrypted: i=1; AJvYcCVUDiQEhbpLHrJPxfNqTeJtnQ2P+8YNnW+BJUZ8eMe5tYR7nzqh7rjxE1eJjomq9EWjo+3q8s2meFgUBqRXWQwn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw38sBDAJOXMx0Qhmc4iYBQX964y2KoQEwrz15hiikq2WB4s+nw
	4BfJqX2rkhdh4CeUTLeDaOuVeUNWHhk0S3qvfEkoUaeXmz600+TvdFDxaESHutBJjVo=
X-Gm-Gg: ATEYQzxxaB9+X2YMlywB7AtZNemAHgj6qg4WxDkjHbgScnCyUYILfFdumTchq7RH5oB
	V9P7eNKKhnNAEHaX+FGEkrh8Nb2u6vTp6PxiXOYq8glzsLMTJHqh9ZGIGc42gYxqdaVNCM9bq+K
	FAgJUt8xR5FQm3ET3SeQaqP89NkX3zOozgga1OJxI4aLtZSv4NPIGtp8iSIY6VkI5Bz+ii90bUM
	bhOpfaZ2RSpYwMQUv025W2Z/MyqMZBnkz0onlUMs1MKnZ95sktCE+lU9XtkxFCRsfg0llIKlI6o
	AtkN00Cvt8QKzGiThA58KWN6dF5GyBF091aLtzgmYmC77rvqODCE9y3niFH1aDl1JHcE7BNar9/
	plTzjgZIg/QfVPPbL+6WI49txJR+kT+5HslGSTBCBLKcgp96npKj5egNRU55ffW0WzgTdVaCNVt
	UOlJudQsaShhNWUBhH1xYkozVDNg==
X-Received: by 2002:a05:6a00:2c97:b0:827:28db:7a78 with SMTP id d2e1a72fcca58-82a8c27b377mr3130457b3a.17.1774034149798;
        Fri, 20 Mar 2026 12:15:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1bb2:23b1:6ad:c930])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aaabdesm2720095b3a.5.2026.03.20.12.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:15:49 -0700 (PDT)
Date: Fri, 20 Mar 2026 13:15:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
Message-ID: <ab2c4nLuiey7kSn5@p14s>
References: <20260318155413.793430-1-steven.price@arm.com>
 <abyAbPIkDn2bGZwd@p14s>
 <37bc1222-6fc7-48f0-94d3-6eaac420aa55@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37bc1222-6fc7-48f0-94d3-6eaac420aa55@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_121551_223181_9EF79CFD 
X-CRM114-Status: GOOD (  54.87  )
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

On Fri, Mar 20, 2026 at 04:45:49PM +0000, Steven Price wrote:
> On 19/03/2026 23:02, Mathieu Poirier wrote:
> > Good day,
> > 
> > On Wed, Mar 18, 2026 at 03:53:24PM +0000, Steven Price wrote:
> >> This series adds support for running protected VMs using KVM under the
> >> Arm Confidential Compute Architecture (CCA).
> >>
> >> New major version number! This now targets RMM v2.0-bet0[1]. And unlike
> >> for Linux this represents a significant change.
> >>
> >> RMM v2.0 brings with it the ability to configure the RMM to have the
> >> same page size as the host (so no more RMM_PAGE_SIZE and dealing with
> >> granules being different from host pages). It also introduces range
> >> based APIs for many operations which should be more efficient and
> >> simplifies the code in places.
> >>
> >> The handling of the GIC has changed, so the system registers are used to
> >> pass the GIC state rather than memory. This means fewer changes to the
> >> KVM code as it looks much like a normal VM in this respect.
> >>
> >> And of course the new uAPI introduced in the previous v12 posting is
> >> retained so that also remains simplified compared to earlier postings.
> >>
> >> The RMM support for v2.0 is still early and so this series includes a
> >> few hacks to ease the integration. Of note are that there are some RMM
> >> v1.0 SMCs added to paper over areas where the RMM implementation isn't
> >> quite ready for v2.0, and "SROs" (see below) are deferred to the final
> >> patch in the series.
> >>
> >> The PMU in RMM v2.0 requires more handling on the RMM-side (and
> >> therefore simplifies the implementation on Linux), but this isn't quite
> >> ready yet. The Linux side is implemented (but untested).
> >>
> >> PSCI still requires the VMM to provide the "target" REC for operations
> >> that affect another vCPU. This is likely to change in a future version
> >> of the specification. There's also a desire to force PSCI to be handled
> >> in the VMM for realm guests - this isn't implemented yet as I'm waiting
> >> for the dust to settle on the RMM interface first.
> >>
> >> Stateful RMI Operations
> >> -----------------------
> >>
> >> The RMM v2.0 spec brings a new concept of Stateful RMI Operations (SROs)
> >> which allow the RMM to complete an operation over several SMC calls and
> >> requesting/returning memory to the host. This has the benefit of
> >> allowing interrupts to be handled in the middle of an operation (by
> >> returning to the host to handle the interrupt without completing the
> >> operation) and enables the RMM to dynamically allocate memory for
> >> internal tracking purposes. One example of this is RMI_REC_CREATE no
> >> longer needs "auxiliary granules" provided upfront but can request the
> >> memory needed during the RMI_REC_CREATE operation.
> >>
> >> There are a fairly large number of operations that are defined as SROs
> >> in the specification, but current both Linux and RMM only have support
> >> for RMI_REC_CREATE and RMI_REC_DESTROY. There a number of TODOs/FIXMEs
> >> in the code where support is missing.
> >>
> >> Given the early stage support for this, the SRO handling is all confined
> >> to the final patch. This patch can be dropped to return to a pre-SRO
> >> state (albeit a mixture of RMM v1.0 and v2.0 APIs) for testing purposes.
> >>
> >> A future posting will reorder the series to move the generic SRO support
> >> to an early patch and will implement the proper support for this in all
> >> RMI SMCs.
> >>
> >> One aspect of SROs which is not yet well captured is that in some
> >> circumstances the Linux kernel will need to call an SRO call in a
> >> context where memory allocation is restricted (e.g. because a spinlock
> >> is held). In this case the intention is that the SRO will be cancelled,
> >> the spinlock dropped so the memory allocation can be completed, and then
> >> the SRO restarted (obviously after rechecking the state that the
> >> spinlock was protecting). For this reason the code stores the memory
> >> allocations within a struct rmi_sro_state object - see the final patch
> >> for more details.
> >>
> >> This series is based on v7.0-rc1. It is also available as a git
> >> repository:
> >>
> >> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v13
> >>
> >> Work in progress changes for kvmtool are available from the git
> >> repository below:
> >>
> >> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v11
> >>
> >> Note that the kvmtool code has been tidied up (thanks to Suzuki) and
> >> this involves a minor change in flags. The "--restricted_mem" flag is no
> >> longer recognised (or necessary).
> >>
> >> The TF-RMM has not yet merged the RMMv2.0 support, so you will need to
> >> use the following branch:
> >>
> >> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc
> > 
> > This RMM version is expecting a RMM EL3 interface version of at least 2.0.  Do
> > you have a TF-A to use with it?
> 
> You should be able to use the 'master' branch of the TF-A repository.
> For now you need to set RMM_V1_COMPAT=0 to enable 2.0 support.
>

That worked - thanks for the clarification.
 
> Thanks,
> Steve
> 
> > Thanks,
> > Mathieu
> > 
> >>
> >> [1] https://developer.arm.com/documentation/den0137/2-0bet0/
> >>
> >> Jean-Philippe Brucker (7):
> >>   arm64: RMI: Propagate number of breakpoints and watchpoints to
> >>     userspace
> >>   arm64: RMI: Set breakpoint parameters through SET_ONE_REG
> >>   arm64: RMI: Initialize PMCR.N with number counter supported by RMM
> >>   arm64: RMI: Propagate max SVE vector length from RMM
> >>   arm64: RMI: Configure max SVE vector length for a Realm
> >>   arm64: RMI: Provide register list for unfinalized RMI RECs
> >>   arm64: RMI: Provide accurate register list
> >>
> >> Joey Gouly (2):
> >>   arm64: RMI: allow userspace to inject aborts
> >>   arm64: RMI: support RSI_HOST_CALL
> >>
> >> Steven Price (36):
> >>   kvm: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
> >>   arm64: RME: Handle Granule Protection Faults (GPFs)
> >>   arm64: RMI: Add SMC definitions for calling the RMM
> >>   arm64: RMI: Temporarily add SMCs from RMM v1.0 spec
> >>   arm64: RMI: Add wrappers for RMI calls
> >>   arm64: RMI: Check for RMI support at KVM init
> >>   arm64: RMI: Configure the RMM with the host's page size
> >>   arm64: RMI: Check for LPA2 support
> >>   arm64: RMI: Ensure that the RMM has GPT entries for memory
> >>   arm64: RMI: Define the user ABI
> >>   arm64: RMI: Basic infrastructure for creating a realm.
> >>   KVM: arm64: Allow passing machine type in KVM creation
> >>   arm64: RMI: RTT tear down
> >>   arm64: RMI: Activate realm on first VCPU run
> >>   arm64: RMI: Allocate/free RECs to match vCPUs
> >>   arm64: RMI: Support for the VGIC in realms
> >>   KVM: arm64: Support timers in realm RECs
> >>   arm64: RMI: Handle realm enter/exit
> >>   arm64: RMI: Handle RMI_EXIT_RIPAS_CHANGE
> >>   KVM: arm64: Handle realm MMIO emulation
> >>   KVM: arm64: Expose support for private memory
> >>   arm64: RMI: Allow populating initial contents
> >>   arm64: RMI: Set RIPAS of initial memslots
> >>   arm64: RMI: Create the realm descriptor
> >>   arm64: RMI: Runtime faulting of memory
> >>   KVM: arm64: Handle realm VCPU load
> >>   KVM: arm64: Validate register access for a Realm VM
> >>   KVM: arm64: Handle Realm PSCI requests
> >>   KVM: arm64: WARN on injected undef exceptions
> >>   arm64: Don't expose stolen time for realm guests
> >>   arm64: RMI: Always use 4k pages for realms
> >>   arm64: RMI: Prevent Device mappings for Realms
> >>   arm64: RMI: Enable PMU support with a realm guest
> >>   KVM: arm64: Expose KVM_ARM_VCPU_REC to user space
> >>   arm64: RMI: Enable realms to be created
> >>   [WIP] arm64: RMI: Add support for SRO
> >>
> >> Suzuki K Poulose (3):
> >>   kvm: arm64: Include kvm_emulate.h in kvm/arm_psci.h
> >>   kvm: arm64: Don't expose unsupported capabilities for realm guests
> >>   arm64: RMI: Allow checking SVE on VM instance
> >>
> >>  Documentation/virt/kvm/api.rst       |   86 +-
> >>  arch/arm64/include/asm/kvm_emulate.h |   31 +
> >>  arch/arm64/include/asm/kvm_host.h    |   15 +-
> >>  arch/arm64/include/asm/kvm_pgtable.h |    5 +-
> >>  arch/arm64/include/asm/kvm_pkvm.h    |    2 +-
> >>  arch/arm64/include/asm/kvm_rmi.h     |  129 ++
> >>  arch/arm64/include/asm/rmi_cmds.h    |  692 +++++++++
> >>  arch/arm64/include/asm/rmi_smc.h     |  430 ++++++
> >>  arch/arm64/include/asm/virt.h        |    1 +
> >>  arch/arm64/kernel/cpufeature.c       |    1 +
> >>  arch/arm64/kvm/Kconfig               |    2 +
> >>  arch/arm64/kvm/Makefile              |    2 +-
> >>  arch/arm64/kvm/arch_timer.c          |   28 +-
> >>  arch/arm64/kvm/arm.c                 |  178 ++-
> >>  arch/arm64/kvm/guest.c               |   95 +-
> >>  arch/arm64/kvm/hyp/pgtable.c         |    1 +
> >>  arch/arm64/kvm/hypercalls.c          |    4 +-
> >>  arch/arm64/kvm/inject_fault.c        |    5 +-
> >>  arch/arm64/kvm/mmio.c                |   16 +-
> >>  arch/arm64/kvm/mmu.c                 |  214 ++-
> >>  arch/arm64/kvm/pmu-emul.c            |    6 +
> >>  arch/arm64/kvm/psci.c                |   30 +
> >>  arch/arm64/kvm/reset.c               |   13 +-
> >>  arch/arm64/kvm/rmi-exit.c            |  207 +++
> >>  arch/arm64/kvm/rmi.c                 | 1948 ++++++++++++++++++++++++++
> >>  arch/arm64/kvm/sys_regs.c            |   53 +-
> >>  arch/arm64/kvm/vgic/vgic-init.c      |    2 +-
> >>  arch/arm64/mm/fault.c                |   28 +-
> >>  include/kvm/arm_arch_timer.h         |    2 +
> >>  include/kvm/arm_pmu.h                |    4 +
> >>  include/kvm/arm_psci.h               |    2 +
> >>  include/uapi/linux/kvm.h             |   41 +-
> >>  32 files changed, 4176 insertions(+), 97 deletions(-)
> >>  create mode 100644 arch/arm64/include/asm/kvm_rmi.h
> >>  create mode 100644 arch/arm64/include/asm/rmi_cmds.h
> >>  create mode 100644 arch/arm64/include/asm/rmi_smc.h
> >>  create mode 100644 arch/arm64/kvm/rmi-exit.c
> >>  create mode 100644 arch/arm64/kvm/rmi.c
> >>
> >> -- 
> >> 2.43.0
> >>
> >>
> 

