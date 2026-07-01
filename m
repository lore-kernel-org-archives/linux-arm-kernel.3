Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F286C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 02:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOC4a4hB83XJuIh9Jdf10Z71bUUVibpbqo4gSEZbfDY=; b=lstkFhyPyb7Adt8orKgPD18BkS
	3IjEVO6y2avS8x+tjqEZgAZQpL7ZSQr2XX18/WaHIwkDImS+JefQRTqqN1j12Q/fPhT+GUJhwBZJ5
	9eU0MYATJa7xL22t76y4ZqN9eJA5qSy0zKE5v70KpE8a+gD/r8Adpr/hliAdbceBS79tRufeb44dw
	nj2K2kF58LbfXEPblCISs0aO1IQXfmlOl8co3f3xm+qy0udej/CpgcG0SbEieCMHSDHTITKxQpOSC
	Io5z4e6vzt5hboIqDb2J+xOvRqD4U7MOFx3D2LAsoJyayzUNXb84wMTF926KTMdAZWmfPmF751QSG
	FMGeW3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekU9-00000000W9Y-2ZCC;
	Wed, 01 Jul 2026 02:15:33 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekU5-00000000W96-2R1o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 02:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782872131; x=1814408131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pw/JDUXvjVK+3QrfI9yFi2jVw+bIU28wBw3FXCmitUA=;
  b=PYmXlZhuhs/OeLLl+OZOdGUmlpKqEl0rgvQq9vAGVEDG2Vfewr8Aocm2
   OjUyXfVaMes60FTwKz4SEKpyrVCKKeypmqkd6C02DzBwQmPfMRzgaEr3S
   PPwMIlFe/gR7nEFKNFGeXgGXMqHq/xsIsKUYhSBZUB5+C9f6OarBk+S5e
   nY0KALCpLD8/x1ReFW5XqYksAV0exUB+N4cyKo3GsYJaCGRGzvmlI5DsB
   q3tragZPtFN/y5PeGEYWNnxEj4/Ox4CWi3p58mzhX9EG5VoB+bI02i5Ow
   gyJfojYe+VSRqe3IAOB/HLt1V5Xt1wl/3lBLzDPkXxlEAuMmFFIa1rTIx
   A==;
X-CSE-ConnectionGUID: LDJl6E3sTumH1+ooTH+EsA==
X-CSE-MsgGUID: BKexsoSPTLuwS8eRu1R8jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="233846967"
X-IronPort-AV: E=Sophos;i="6.24,235,1774278000"; 
   d="scan'208";a="233846967"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 11:15:27 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 94948CA4D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 02:15:25 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4D80F103C302
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 02:15:25 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.91.60])
	by az2nlsmom3.fujitsu.com (Postfix) with SMTP id BF254100A6C3;
	Wed,  1 Jul 2026 02:15:16 +0000 (UTC)
Date: Wed, 1 Jul 2026 11:15:15 +0900
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
Message-ID: <akR0eX0nCumIgnlh@FCCLS0092175.localdomain>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_191530_207263_13CD01D3 
X-CRM114-Status: GOOD (  40.44  )
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

On 05/13 14:17, Steven Price wrote:
> This series adds support for running protected VMs using KVM under the
> Arm Confidential Compute Architecture (CCA).
> 
> This is rebased on v7.1-rc1, but still targets RMM v2.0-bet1[1].
> 
> The major updates from v13 remain but have been more fully implemented:
> the RMM uses the host's page size, range based RMI APIs mean we don't
> have to break everything down to base page sizes, the GIC state is
> passed via system registers, and the uAPI has been simplified.
> 
> The main changes since v13 are:
> 
>  * The RMI definitions and wrappers have been fully updated for RMM
>    v2.0-bet1. In particular the temporary RMM v1.0 SMC compatibility
>    patch has been dropped.
> 
>  * The PSCI completion ioctl has been removed. RMM v2.0-bet1 still
>    requires the host to provide the target REC for PSCI calls which
>    name another vCPU, but KVM now performs the RMI PSCI completion
>    automatically before entering the REC again. Userspace no longer
>    needs to issue KVM_ARM_VCPU_RMI_PSCI_COMPLETE. A future spec should
>    remove the need for the host to provide the MPIDR mapping.
> 
>  * The generic RMI init, RMM configuration, GPT setup,
>    delegate/undelegate helpers and SRO infrastructure have moved out of
>    KVM into arch/arm64/kernel/rmi.c. RMI is expected to be used by
>    features outside KVM, so this code should be available even when KVM
>    is not built.
> 
>  * RMI_GRANULE_TRACKING_GET has been updated to work on a range, this
>    allows it to work when the region is not aligned to the tracking
>    size. Solves the problem reported by Mathieu[2].
> 
>  * SRO support has been moved earlier in the series and improved. It
>    provides a cleaner way for the host to provide the RMM with the extra
>    memory it requires. However support is still incomplete where the
>    TF-RMM code does not yet implement it. This is noted by FIXMEs in the
>    code.
> 
>  * The ARM VM type encoding has been reworked to coexist with the
>    upstream pKVM KVM_VM_TYPE_ARM_PROTECTED bit.
> 
>  * The private-memory documentation now notes that arm64 uses
>    KVM_CAP_MEMORY_ATTRIBUTES.
> 
>  * PMU support is dropped for now. It will be added later in a separate
>    series. Similarly for selecting the hash algorithm and RPV.

Hi Steven,

Is there any plan to add support for selecting the MEC policy (shared or
private)? We have been working on adding support for this on top of your
series. If this is not already in the works, we may upstream our
implementation later.

Thanks,
Kohei

> 
> There are also the usual rebase updates and smaller fixes, including
> changes to the RMM v2.0-bet1 range APIs, removal of REC auxiliary
> granule handling, fixes to the address range descriptor encoding, and
> cleanups around realm stage-2 teardown.
> 
> Stateful RMI Operations
> -----------------------
> 
> The RMM v2.0 spec introduces Stateful RMI Operations (SROs), which allow
> the RMM to complete an operation over several SMC calls while requesting
> or returning memory to the host. This allows interrupts to be handled in
> the middle of an operation and lets the RMM dynamically allocate memory
> for internal tracking purposes. For example, RMI_REC_CREATE no longer
> needs auxiliary granules to be provided up front, and can instead
> request memory during the operation.
> 
> This series includes the generic SRO infrastructure in
> arch/arm64/kernel/rmi.c and uses it for REC create/destroy. The other
> cases are not yet used by TF-RMM and a future revision will be needed to
> finish those paths in Linux.
> 
> This series is based on v7.1-rc1. It is also available as a git
> repository:
> 
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v14
> 
> Work in progress changes for kvmtool are available from the git
> repository below:
> 
> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v12
> 
> The TF-RMM has not yet merged the RMM v2.0 support, so you will need to
> use a branch with RMM v2.0-bet1 support. At the time of writing the
> following branch is being used:
> 
> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc_2
> (tested on commit 3340667a291a)
> 
> There is a kvm-unit-test branch which has been updated to support the
> attestation used in RMMv2.0 available here:
> 
> https://gitlab.arm.com/linux-arm/kvm-unit-tests-cca cca/v4
> 
> [1] https://developer.arm.com/documentation/den0137/2-0bet1/
> [2] https://lore.kernel.org/all/acrj-cKphy4hJsEG@p14s/

