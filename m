Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35F2C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgwN+sU2iP1c7ZB4Iv7vfHXubkL3bspLl67BAJiyCrA=; b=xeFf/lneuuyQT1m1Q+YAgquSrb
	Hhq2j75MtV7dqWIppoYdZbOy9EKr6ceYEh/j1tPMn8ZvbZeOmKdrls8pudftn3mtjk2S17VURaTMq
	D+RFTC78PaWDRDXboCp+YrrtojP09sPhoAI4inu90FdtM5fyOiqrb9DHGXOOEmKpEOFmqRPhFBHX/
	hDwPAB43hNKDklZSIpAxvvn1qAmJjC12kBAC+OCnqV/kdPzt9FoYKmg4XR4iU42bJDkzTWwqwc+hk
	Fms95x1PQf6vh1EsEITWAaZNDasxOpdaCQHFe7qoX24IiTvV7/tc40JGv4ws49HrjFReLS3a4osmr
	sQAFfk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qIa-00000008H7M-1CFg;
	Tue, 08 Sep 2026 07:31:20 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qIW-00000008H6p-3eJi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788852677; x=1820388677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8+quB6EjKOoEa1ZHF+bZNfsyz8/M/RI5EzR+EzA9+cI=;
  b=PUOo4HcVBLivJd19f53i4cM00IrUUll6Kyk47LPECzUYNvPMUHr+N7xq
   TBnokecS5NnxNmZyttcsFdzen0lEINWFFgMquv0C+9gnNCVEZw4FBo+z7
   cUtL11HTlaGM6OhEaYnmO3fTIqbEVLlNQAcaeIpmEbb76GWZgxVb6N80k
   ybtH6kGgjzqgg+TS37FEGiGdQRRahwi0uWfoz7rkBPUPdu6cm8IHBUuD6
   YLXOjAOWWuM9141gRgvP5gKIqXGIQMCXC5pkcM3aUqsfMfPrsWYv0orhS
   kNpTJnsguoigrpjHM2AkIlylph/yseE2Db7mYGafmirAZm6UFTDUed5hH
   w==;
X-CSE-ConnectionGUID: BhYV7ygNRkKXnbPj2/LEsQ==
X-CSE-MsgGUID: P27KrjKWQKK43a8JoR1Hcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="232035553"
X-IronPort-AV: E=Sophos;i="6.25,268,1779116400"; 
   d="scan'208";a="232035553"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 16:31:13 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F40051C1C700
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 07:31:12 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AE77214003FF
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 07:31:12 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.15.163])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with SMTP id 4C91114000F7;
	Tue,  8 Sep 2026 07:31:05 +0000 (UTC)
Date: Tue, 8 Sep 2026 16:30:57 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v17 0/7] firmware: arm_rmm: Add RMM v2.0 base RMI support
Message-ID: <ap-4lPkYzogPqs_V@FCCLS0092175.localdomain>
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <ap-C6NLnxuWWTMzi@FCCLS0092175.localdomain>
 <f65216f6-cb7b-4b76-a7cc-79b332db2bd8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f65216f6-cb7b-4b76-a7cc-79b332db2bd8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_003117_490161_0BCEEC54 
X-CRM114-Status: GOOD (  46.08  )
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

On 09/08 06:46, Suzuki K Poulose wrote:
> Hi Kohei-San
> 
> Linaro is best suited to answer this. I have Cc'ed Mathieu (and
> Lorenzo), who may be able to help you here.

Thank you for pointing me in the right direction and Ccing Mathieu and
Lorenzo. 
I'll wait for their response.

> 
> On 08/09/2026 05:09, Kohei Enju wrote:
> > Hi Suzuki,
> > 
> > On 09/07 10:59, Suzuki K Poulose wrote:
> > > This series adds the generic firmware layer for talking to the Realm
> > > Management Monitor (RMM), as specified by the RMM v2.0-bet3
> > > specification[1]. It is the first part of the Arm CCA host support that
> > > was previously posted as part of the larger KVM series.
> > > 
> > > The split allows this RMM support to be used as a base for other work,
> > > including Aneesh's PCI IDE support with Arm CCA RMM as the TSM,
> > >   without depending on the KVM Realm support that will follow as separate
> > >   series. (See more on that below)
> > > 
> > > The series adds:
> > > 
> > >   * The RMI SMC definitions and direct-call wrappers.
> > > 
> > >   * RMM discovery and version checks during firmware init.
> > > 
> > >   * RMM host configuration, including the host page size.
> > > 
> > >   * Stateful RMI Operation (SRO) infrastructure for commands which the RMM
> > >     can complete across multiple SMC calls while requesting or returning
> > >     memory to the host.
> > > 
> > >   * Verification that granule tracking is available at fine granularity.
> > >     Fine-grained tracking allows each granule in the system to be tracked
> > >     independently, which is required before individual granules can be
> > >     delegated. A future series will add support for dynamically supplying
> > >     memory to the RMM for this tracking.
> > > 
> > >   * Support for fully firmware-managed systems, where the Granule Protection
> > >     Tables for memory regions are allocated and managed by firmware. RMM v2.0
> > >     also allows dynamic GPT creation on demand; support for that will be added
> > >     in a later series.
> > > 
> > >   * Wrappers for the RMI commands that are used for managing the "Realm VM"
> > >     lifecycle. This is added in to make it easier for the on-going KVM support
> > >     to evolve in parallel pieces.
> > > 
> > > If the platform firmware cannot manage the granule tracking or the GPTs, we
> > > bail out and deactivate the RMM, reclaiming any memory that we have donated.
> > > 
> > > The RMM v2.0 spec introduces Stateful RMI Operations (SROs), which allow
> > > the RMM to complete an operation over several SMC calls while requesting
> > > or returning memory to the host. This allows interrupts to be handled in
> > > the middle of an operation and lets the RMM dynamically allocate memory
> > > for internal tracking purposes. For example, RMI_REC_CREATE no longer
> > > needs auxiliary granules to be provided up front, and can instead
> > > request memory during the operation.
> > > 
> > > This series applies on v7.3-rc1 and a branch is available at [2]. The KVM
> > > CCA support that builds on this series is available at [3] as an integration
> > > branch. The KVM support depends on guest-memfd-in-place conversion support v12
> > > from Ackerley [4], we plan to split that into parts, which apply cleanly on
> > > v7.3-rcx without any dependency and is in progress. This will be made available
> > > as soon as it is ready. Until then [3] shows how this base series enables KVM
> > > CCA support. You may find the tf-RMM [5] and kvmtool support [6] below.
> > > 
> > > [1] RMM spec : https://support.arm.com/documentation/den0137/2-0bet3/
> > > [2] This series: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/fw_rmm/v17
> > > [3] KVM CCA v17 integration branch: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/kvm-integration/v17
> > > [4] Gmem inplace conversion https://github.com/googleprodkernel/linux-cc/tree/guest_memfd-inplace-conversion-v12
> > > [5] TF-RMM https://git.trustedfirmware.org/TF-RMM/tf-rmm.git main (commit: 134266ae)
> > 
> > I understand that QEMU-virt is not intended to model a realistic
> > production platform and that QEMU-SBSA is generally preferred. However,
> > I sometimes use QEMU-virt to test functionality quickly because it runs
> > slightly faster than QEMU-SBSA.
> > 
> > I tested this series with QEMU-virt and found that RMM initialization
> > failed during boot:
> > 
> >    [...]
> >    INFO:    BL31: Initializing RMM
> >    INFO:    RMM init start.
> >    ERROR:   RMM init failed: -8
> >    WARNING: BL31: RMM initialization failed
> > 
> > The following TF-A revision was used:
> >    https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git master (38269bb)
> > 
> > After investigating, I found that the failure was caused by the lack of
> > a plat_rmmd_reserve_memory() implementation for the QEMU-virt platform
> > in TF-A. Adding an implementation equivalent to the QEMU-SBSA one
> > resolved the issue:
> >      https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/9d594743aa4d4e8160cdf025ea7538041648972c
> > 
> > Is QEMU virt still intended to be supported as an RME emulation
> > platform? In particular, is this functionality simply not implemented
> > yet, or is there a reason why RME support is not planned for QEMU virt?
> > 
> > If this is not the appropriate place to discuss this, please let me
> 
> Mathieu, Lorenzo,
> 
> Over to you folks :-)
> 
> Cheers
> Suzuki
> 
> 
> > know :)
> > 
> > Thanks,
> > Kohei
> > 
> > > [6] kvmtool https://gitlab.arm.com/linux-arm/kvmtool-cca.git cca/kvm-v17
> > > 
> > > Known issues: RMMv2.0
> > >   * RmiOpMemDonateReq:count (Uint14) is incompatible with RmiAddrRangeDesc4KB
> > >    (Uint10) and RmiAddrRangeDesc16KB (Uint12). i.e., a larger contiguous request
> > >    may not be satisfiable by the host. Arm is aware of this defect and a spec fix
> > >    is in progress.
> > > 
> > > 
> > > Steven Price (7):
> > >    firmware: arm_rmm: Add SMC definitions for calling the RMM
> > >    firmware: arm_rmm: Check for RMI support at init
> > >    firmware: arm_rmm: Configure the RMM with the host's page size
> > >    firmware: arm_rmm: Add support for SRO
> > >    firmware: arm_rmm: Activate the RMM
> > >    firmware: arm_rmm: Ensure the RMM has GPT entries for memory
> > >    firmware: arm_rmm: Add wrappers for Realm related RMI commands
> > > 
> > >   arch/arm64/Kconfig                |   1 +
> > >   arch/arm64/kernel/cpufeature.c    |   1 +
> > >   drivers/firmware/Kconfig          |   1 +
> > >   drivers/firmware/Makefile         |   1 +
> > >   drivers/firmware/arm_rmm/Kconfig  |  26 +
> > >   drivers/firmware/arm_rmm/Makefile |   2 +
> > >   drivers/firmware/arm_rmm/rmi.c    | 819 ++++++++++++++++++++++++++++++
> > >   include/linux/arm-rmi-cmds.h      | 678 +++++++++++++++++++++++++
> > >   include/linux/arm-smccc-rmi.h     | 494 ++++++++++++++++++
> > >   9 files changed, 2023 insertions(+)
> > >   create mode 100644 drivers/firmware/arm_rmm/Kconfig
> > >   create mode 100644 drivers/firmware/arm_rmm/Makefile
> > >   create mode 100644 drivers/firmware/arm_rmm/rmi.c
> > >   create mode 100644 include/linux/arm-rmi-cmds.h
> > >   create mode 100644 include/linux/arm-smccc-rmi.h
> > > 
> > > -- 
> > > 2.43.0
> > > 
> 

