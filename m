Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F56C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIcOFle/zwz16Xg1hcnb8SPakGcZDbwDo5/3Sec2GL4=; b=Bwc3c0kEFw7G7RtvTzeeStwiDz
	ECsDjYIcEbLFb1/v/hcLIEJdAg4b4JEaGTyQxYtQrKXueUx8Lqd042ctClB2EXGH/0CS8/3e2iL2G
	phJZwPM8K9J+RNhhbIF8RI9gR8tbDaXpUe5gG0GncYwtDQo04vnjWiv9xaC/ilhJlX3JK3p1AIU2V
	Vvg5qmPG1xpJqjulyccsnSKanQwKcBpuVhqpm59INp970D+/cSEaPiOC/5xgPzaW82xUQYcv3ihdo
	ImG+AcoNbAC/6ivbncfl2agIuQjGPbGbZlBowhcGgJQte7PsaQS0LgvOxRva7Ke4CP3j2Q8aBdk3S
	wtPvr6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG4u-000000024fW-1lRx;
	Tue, 04 Aug 2026 14:25:12 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG4r-000000024eS-2ZbO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:25:11 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpCK8izqTzhRZWIew/KhOcPifpm9bzLF5vLHUVkpbRfzEGmpPlcgTcn9Ww+Ax3XZSD5oRYBthc6F0vvebLqXUw2@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785853505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HIcOFle/zwz16Xg1hcnb8SPakGcZDbwDo5/3Sec2GL4=;
	b=Nnxy4KTfQX6Vc+svmhtHKnywppXcO7/ZfdQRdROGDPXsH9PVRUxmIPo7wO5/lIS88I6tMv
	cUlwLH9ae+1vJZwxmxIcRqljJWTtOITPfRYWK1AIN7yJIA0NaM/QDxpdOFdFwQSJUVfx3a
	4Xfc8jKAtdbErusMq+qgf0SR6+PD0aw=
X-Gm-Message-State: AOJu0YyEOipxD7Fhz/2c8Pvhgz9/41kUhYXjPb7wPf6iYNPWVHAF+B57
	J1qok29XCCXnV9rXA3jfdAA451h+aTJM7faChd4vVBEwgN+0fQw7/tjMm/Y8WsGW8uzwxcyaL/w
	lnFuxWIc7eKWWK+bHqhuAMgD7S0ZUg0ZW6sY4h44j
X-Received: by 2002:a05:622a:550c:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52ce3f651e3mr1750781cf.1.1785853486200; Tue, 04 Aug 2026
 07:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260803134403.80630-1-steven.price@arm.com>
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 4 Aug 2026 15:24:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy4tpv+d7Q0H1Coe4PXAFrvHc8_fiOyv8GXdo7y7CNMdA@mail.gmail.com>
X-Gm-Features: AUfX_mxdVEoiKGsOFqc7silG1XiAgRiraJnJQa_4blZVDkZkFRMAqMHa_QhDxGw
Message-ID: <CA+EHjTy4tpv+d7Q0H1Coe4PXAFrvHc8_fiOyv8GXdo7y7CNMdA@mail.gmail.com>
Subject: Re: [PATCH v16 00/45] arm64: Support for Arm CCA in KVM
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_072509_936735_B5168065 
X-CRM114-Status: GOOD (  27.99  )
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

Hi Steven,

On Mon, 3 Aug 2026 at 14:44, Steven Price <steven.price@arm.com> wrote:
...
>  * Rewrite Realm entry and exit handling to fit into the generic KVM
>    run loop. Work which cannot be performed in the entry path is now
>    completed through KVM requests, and MMIO, PSCI, RIPAS changes and
>    host calls are adapted to the new flow.

Reading v16 with pKVM in mind: this rework helps, but the series still
adds a few kvm_is_realm()/vcpu_is_rec() checks to the core arm64 code,
and several sit next to, or inside the same condition as, the existing
pKVM checks (the nommu path in kvm_arch_vcpu_load(), the timer
offsets, the NISV abort injection). Both checks answer the same
question: is the guest's state owned by something other than KVM. It
might be worth a common predicate covering both.

Cheers,
/fuad



>
>  * Rewrite Realm timer support to use KVM's IRQ-ops infrastructure and
>    software resampling.
>
>  * Improve SRO cancellation and error handling. Ensure a cancelled
>    operation isn't treated as successful, wrapper return values can carry
>    negative Linux errors as well as RMI return values, and those errors
>    are propagated through the KVM users.
>
>  * Check that the RMM supports the host page size before configuring it,
>    and exclude firmware-reserved NOMAP memory when creating GPT entries.
>
>  * Expand the KVM_ARM_RMI_POPULATE documentation to make clear that Arm
>    CCA cannot preserve memory contents during an in-place
>    shared-to-private conversion.
>
>  * Allocate Realm parameters only while creating the Realm descriptor.
>
>  * Document the encoding of the arm64 VM types and require
>    ICH_HCR_EL2.TDIR before advertising or creating Realm VMs.
>
> This series is based on the guest_memfd in-place conversion v9 tree[1],
> which is itself based on kvm-x86/next. It is also available as a git
> repository:
>
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v16
>
> Work in progress changes for kvmtool are available from the git
> repository below:
>
> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v13
>
> The TF-RMM branch used for testing this series is available here:
>
> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc_3
>
> There is a kvm-unit-test branch updated to support the attestation used
> in RMM v2.0 available here:
>
> https://gitlab.arm.com/linux-arm/kvm-unit-tests-cca cca/v4
>
> [0] https://developer.arm.com/documentation/den0137/2-0bet2/
> One bet2 change, which moves metadata out of the individual address
> range descriptors, has intentionally not been implemented because that
> part of the specification is expected to be reverted.
>
> [1] https://github.com/googleprodkernel/linux-cc/commits/guest_memfd-inplace-conversion-v9
>
> Jean-Philippe Brucker (6):
>   KVM: arm64: CCA: Propagate breakpoint and watchpoint counts to
>     userspace
>   KVM: arm64: CCA: Set breakpoint parameters through SET_ONE_REG
>   KVM: arm64: CCA: Propagate max SVE vector length from the RMM
>   KVM: arm64: CCA: Configure max SVE vector length for a Realm
>   KVM: arm64: CCA: Provide register list for unfinalized RECs
>   KVM: arm64: CCA: Provide an accurate register list
>
> Joey Gouly (2):
>   KVM: arm64: CCA: Allow userspace to inject aborts
>   KVM: arm64: CCA: Support RSI_HOST_CALL
>
> Steven Price (34):
>   firmware: arm_rmm: Add SMC definitions for calling the RMM
>   firmware: arm_rmm: Add wrappers for direct RMI calls
>   firmware: arm_rmm: Check for RMI support at init
>   firmware: arm_rmm: Configure the RMM with the host's page size
>   firmware: arm_rmm: Add support for SRO
>   firmware: arm_rmm: Ensure the RMM has GPT entries for memory
>   arm64: mm: Handle Granule Protection Faults (GPFs)
>   KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
>   KVM: arm64: CCA: Add wrappers for realm related RMIs
>   KVM: arm64: CCA: Check for RMI support at KVM init
>   KVM: arm64: CCA: Check for LPA2 support
>   KVM: arm64: CCA: Define the user ABI
>   KVM: arm64: CCA: Add basic infrastructure for creating a realm
>   KVM: arm64: CCA: Allow passing the machine type in KVM creation
>   KVM: arm64: CCA: Tear down RTTs
>   KVM: arm64: CCA: Allocate and free RECs to match vCPUs
>   KVM: arm64: CCA: Support the VGIC in realms
>   KVM: arm64: CCA: Support timers in realm RECs
>   KVM: arm64: CCA: Handle realm enter/exit
>   KVM: arm64: CCA: Handle RMI_EXIT_RIPAS_CHANGE
>   KVM: arm64: CCA: Handle realm MMIO emulation
>   KVM: arm64: Expose support for private memory
>   KVM: arm64: CCA: Create the realm descriptor
>   KVM: arm64: CCA: Activate realms on first vCPU run
>   KVM: arm64: CCA: Allow populating initial contents
>   KVM: arm64: CCA: Set RIPAS of initial memslots
>   KVM: arm64: CCA: Support runtime faulting of memory
>   KVM: arm64: CCA: Handle realm vCPU load
>   KVM: arm64: CCA: Validate register access for Realm VMs
>   KVM: arm64: CCA: Handle Realm PSCI requests
>   KVM: arm64: WARN on injected undef exceptions
>   KVM: arm64: CCA: Prevent Device mappings for realms
>   KVM: arm64: CCA: Require ICH_HCR_EL2.TDIR for realms
>   KVM: arm64: CCA: Enable realms to be created
>
> Suzuki K Poulose (3):
>   KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
>   KVM: arm64: CCA: Don't expose unsupported capabilities for realm
>     guests
>   KVM: arm64: CCA: Allow checking SVE on VM instance
>
>  Documentation/virt/kvm/api.rst       |   70 +-
>  arch/arm64/Kconfig                   |    1 +
>  arch/arm64/include/asm/kvm_asm.h     |    2 +
>  arch/arm64/include/asm/kvm_emulate.h |   37 +
>  arch/arm64/include/asm/kvm_host.h    |   12 +-
>  arch/arm64/include/asm/kvm_pgtable.h |    6 +-
>  arch/arm64/include/asm/kvm_pkvm.h    |    2 +-
>  arch/arm64/include/asm/kvm_rmi.h     |  139 +++
>  arch/arm64/include/asm/rmi_cmds.h    |  465 ++++++++
>  arch/arm64/include/asm/virt.h        |    1 +
>  arch/arm64/kernel/cpufeature.c       |    1 +
>  arch/arm64/kvm/Kconfig               |    2 +
>  arch/arm64/kvm/Makefile              |    2 +-
>  arch/arm64/kvm/arch_timer.c          |   34 +-
>  arch/arm64/kvm/arm.c                 |  139 ++-
>  arch/arm64/kvm/guest.c               |   93 +-
>  arch/arm64/kvm/handle_exit.c         |   14 +
>  arch/arm64/kvm/hyp/pgtable.c         |    1 +
>  arch/arm64/kvm/hypercalls.c          |    4 +-
>  arch/arm64/kvm/inject_fault.c        |    5 +-
>  arch/arm64/kvm/mmio.c                |   16 +-
>  arch/arm64/kvm/mmu.c                 |  144 ++-
>  arch/arm64/kvm/reset.c               |   13 +-
>  arch/arm64/kvm/rmi-exit.c            |  178 +++
>  arch/arm64/kvm/rmi.c                 | 1561 ++++++++++++++++++++++++++
>  arch/arm64/kvm/sys_regs.c            |   47 +-
>  arch/arm64/kvm/vgic/vgic-init.c      |    2 +-
>  arch/arm64/mm/fault.c                |   28 +-
>  drivers/firmware/Kconfig             |    1 +
>  drivers/firmware/Makefile            |    1 +
>  drivers/firmware/arm_rmm/Kconfig     |   26 +
>  drivers/firmware/arm_rmm/Makefile    |    2 +
>  drivers/firmware/arm_rmm/rmi.c       |  776 +++++++++++++
>  include/kvm/arm_psci.h               |    2 +
>  include/linux/arm-rmi-cmds.h         |  201 ++++
>  include/linux/arm-smccc-rmi.h        |  493 ++++++++
>  include/uapi/linux/kvm.h             |   20 +-
>  37 files changed, 4446 insertions(+), 95 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kvm_rmi.h
>  create mode 100644 arch/arm64/include/asm/rmi_cmds.h
>  create mode 100644 arch/arm64/kvm/rmi-exit.c
>  create mode 100644 arch/arm64/kvm/rmi.c
>  create mode 100644 drivers/firmware/arm_rmm/Kconfig
>  create mode 100644 drivers/firmware/arm_rmm/Makefile
>  create mode 100644 drivers/firmware/arm_rmm/rmi.c
>  create mode 100644 include/linux/arm-rmi-cmds.h
>  create mode 100644 include/linux/arm-smccc-rmi.h
>
> --
> 2.43.0
>

