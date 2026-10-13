Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907D5CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 22:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI33XHytP9UeW0jMN4hGWfxaoI7IkHXeeChdjxsUSUw=; b=1iGmrJp68kKP0v4ho8lBVgzG2R
	UzyIl5CX8GLVnQn3Ewmw3CH3V8vfc7tdAgFGw1Nrr/J7RP3h8qdk/0P/hyEL0wGJpaNDWn+SPF7Iy
	FAxJZNcyGh9luAUWEslY0mYdRVYXXtoDKTmPkqLtL+Iu9RjmdUB7reKbdw3QdJQmSMxnjN5a9+Jag
	QQiQB2TTydotnuKysn8DWuqvdJBLTpROH8Qm1k5T+q2aRrsk1SE4LUNTNTfvB837nS+UttEfPMzAz
	tdVb3K9EjUZ5bbD2oqQjpVX3RvbhvVmYCy5z/1vszMumIxmuExZM91baX34zppsW8i2QF6uzjuM9c
	De29v6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkXw-0000000E6sv-3Z9H;
	Tue, 13 Oct 2026 22:00:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkXu-0000000E6sK-0KA5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 22:00:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso1783314a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 15:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791928828; x=1792533628; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UI33XHytP9UeW0jMN4hGWfxaoI7IkHXeeChdjxsUSUw=;
        b=whx+2sSXunhOtyfX1+mbKK1vatwHBY2Q3bQQQfeWpZxA0W7sPB1sytDW1EPxNJyPAK
         jj0ZslzOFKpwmaMsCyzF1LbMvrNfiqV0kh8JA5w8I00C/6XW6gpmQrKNd1/nKwTf/h9i
         Emtg20p9khuvbiLalh56i+AiL9ebIn4d6Yu+2h6Q05jbxM+FT9ljtZXcN7rK3qmJMvsC
         7VWjvUmi+51RuEcx8Bm16Jjmsb7eK17+EE1ur7ovUCHwjiFUAhfGEFN/JQLVNxtvaQ89
         MA6lGPMIPlSRoBZR8Njp+976c1C1z+3XPaspbibgUyZjJTwCdGqN7/Sat0zcRYTmZLyQ
         BQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791928828; x=1792533628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UI33XHytP9UeW0jMN4hGWfxaoI7IkHXeeChdjxsUSUw=;
        b=SUANP6ixU3fumdWum5X4eBPt2hZELJtoBPnOuRMg2VNtD+UJM0V6vjnkxS3FOU6VC1
         Jxe8LBffyyskdDBBjwTZkzzER+oVtFGFXmJhQc9pLhqEIahCw3bOQgXKt2U81uJG4NUC
         gUFdAgOJDqFqQY5bqZ19cYpE981exdKHkGT4TGvC20/eejppUOJsNFcklr3e04+FDLRa
         12TQCVxq/5ko4ix06z/yzQmQst2llH/AwXHOTECWPloyMDMiu0vaIZ2ovIpdscOTsllU
         HySy+hagxJ1DIQqkOCAylvvXhVZ1cy/P4q3oGDAVnIrOSt0BgwKVhfsNchP70rGMNI/g
         rqsw==
X-Forwarded-Encrypted: i=1; AKwUvBzQSXSq7BtZ34kK7MCO6YdkH1+00II3S7mHsqblNs951clRyOCiBZ1QjNOCmPEVnIW7SZkt/lCiVaToZfLQ5BgU@lists.infradead.org
X-Gm-Message-State: AFq9FYI5iJTb0r9JflY6laWSeuQSULf3lDkGMm18mEH8s9lA/TEjWh8r
	mi+eFH6yr6ZLqs2hnihAJSvpRlptgoVNhM9mS+OgsUleNSKgivgnKeT9zUfeRjKaBuE=
X-Gm-Gg: AYBFou3svZsMNN3tZ109pJFjyW1fjMmTsGIQ9eK38aDCXu5c1g/j6Gc0NQZERFmoyKn
	FullZhTXPKh44LziywcHxdZ9Zdt32RwanaWNJpS3MTblk5uu4hdHqsOABXBq74fHr8T4fvR8hBa
	aTCECG1Y61GH97qwTRmkr8zXz2BuYvc55MbYxc5ICMHX6cnS5D0DM4pcR9RuXICmKVjsTjKzt58
	HY3c/Mdc76PoNt/nla1rrrbHsJUHG82vpqYQGxwazUEshLooQ2nBtY4RsVdJceTOmT0h0T8mP3V
	ESos/9yXBHriDYjicXyD0KrGixvFmdYezKwA442Ba4yAvFeR5mS9CXyM6/NMIU13QdO+usCPjxj
	vgli6CSrWKtXarlVnfbzy6OeeHcdrBWX4x2gz4LtQ5OZ778d557bWWKc6gx0eHNG0TU5PF2aQgx
	DCm9a6dCT5xKMmJlyG9do43Vi4GpZ50Se1r2eJ8Ra7863SsvvulBgHFrU3hptCdMkMib3K4AXij
	w==
X-Received: by 2002:a17:90b:3d82:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ab3ab3771fmr9650115a91.50.1791928828071;
        Tue, 13 Oct 2026 15:00:28 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:adc4:c3cd:7c5f:3991])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac678d2229sm309218a91.3.2026.10.13.15.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 15:00:26 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:00:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
	yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v23 00/14] KVM: arm64: CCA: Add basic plumbing for Realms
Message-ID: <as6p9q051NgTKHum@p14s>
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007073537.2454351-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_150030_133862_D5D231D2 
X-CRM114-Status: GOOD (  24.69  )
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

On Wed, Oct 07, 2026 at 08:35:23AM +0100, Suzuki K Poulose wrote:
> This is a trimmed down and updated version of the v22 of Arm CCA basic
> plumbing series [0]. I have dropped the CCA specific bits for the sake keeping
> them separate. This series now only contains the framework for handling
> different VM types and lay down the path for adding Realm as one of the
> protected VMs. The full support for running Realms under KVM is available as
> an integration branch at [1].
> 
> The integration branch has been tested with the following components:
> 
>   tf-RMM:   main branch (commit 5e6e2acd) compliant to RMM-v2.0-beta3
>   kvmtool: git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git tag:cca-kvm-v20
> 
> [0] Arm CCA KVM basic plumbing v22
>     https://lore.kernel.org/all/20261005090754.2140522-1-suzuki.poulose@arm.com
> [1] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v23/integration
> 
> Changes since v22:
>  https://lore.kernel.org/all/20261005090754.2140522-1-suzuki.poulose@arm.com
>   - Drop the CCA specific patches for now, they are on the integration branch
>   - system_supported_vcpu_features() - Start off with a base set of features for
>     the type of VM
>   - Add () around 'flavor' in KVM_VM_S2_OPS() macro
>   - Drop BUILD_BUG_ON and redefine {kvm_vm,vcpu}_is_protected() for nVHE
>   - Drop {kvm_vm,vcpu}_is_protected_pkvm() macros
> 
> Changes since v21:
>  https://lore.kernel.org/all/20261001210703.1597150-1-suzuki.poulose@arm.com
>  - Keep the kvm_arch struct packed, by moving psci_version, closer to vm_flavor and also moving the vm_s2_ops, closer to vm_flavor.
>  - Drop the kern_hyp_va() for vcpu_is_protected() in nVHE, instead ban nVHE
>    code from using vcpu_is_protected() (by using BUILD_BUG_ON()) and convert
>    all users to vcpu_is_protected_pkvm()
>  - Drop kvm_vm_is_unprotected_pkvm() in favor of open coded check against VM_PKVM
>  - Drop WARN_ON_ONCE() in the kvm_vm_ioctl_allowed() to match Fuad's fix merged in v7.3-rc5
>  - Move '&' to the KVM_*_OPS macros
>  - Nuke __unmap_stage2_range() and define per-VM callback for stage2_unmap_range, removing the KVM_PGT_FN() hack for the call, and also for the others
>  - Drop NULL check for vm_s2_ops callbacks and always define everything.
>  - Add no_age_gfn() which plugs in for pVMs and Realms for the vm_age_*gfn callbacks
> 
> Steven Price (1):
>   KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
> 
> Suzuki K Poulose (13):
>   KVM: arm64: protected VM: Handle user writes to CNTVCT_EL0/CNTPCT_EL0
>   KVM: arm64: Disable Steal time accounting for protected guests
>   KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
>   KVM: arm64: Track the type of VM in kvm_arch
>   KVM: arm64: Don't call vcpu_set_pauth_traps for pKVM host
>   KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
>   KVM: arm64: Add vcpu load/put call backs for flavors
>   KVM: arm64: Consolidate stage2 unmap range into kvm_stage2_unmap_range
>   KVM: arm64: Add VM specific callback for S2 MMU operations
>   KVM: arm64: Use a local kvm pointer in kvm_handle_guest_abort()
>   KVM: arm64: Abstract out memory abort handling
>   KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
>   KVM: arm64: Prevent unsupported vcpu features for VM types
> 
>  arch/arm64/include/asm/kvm_host.h    |  73 ++++++-
>  arch/arm64/include/asm/kvm_pgtable.h |  10 +-
>  arch/arm64/include/asm/kvm_pkvm.h    |   6 +-
>  arch/arm64/kvm/arch_timer.c          |  12 +-
>  arch/arm64/kvm/arm.c                 | 275 ++++++++++++++++++++-------
>  arch/arm64/kvm/hyp/nvhe/pkvm.c       |   6 +-
>  arch/arm64/kvm/hyp/pgtable.c         |   1 +
>  arch/arm64/kvm/mmio.c                |   1 +
>  arch/arm64/kvm/mmu.c                 | 247 +++++++++++++++++-------
>  arch/arm64/kvm/pkvm.c                |   6 +-
>  arch/arm64/kvm/pvtime.c              |  14 +-
>  arch/arm64/kvm/vgic/vgic-init.c      |   2 +
>  include/kvm/arm_psci.h               |   2 +
>  13 files changed, 493 insertions(+), 162 deletions(-)

Version 5 of my QEMU-VMM patchset [1] has been tested on this kernel and things
work as expected.  Instructions to build and test on the QEMU SBSA architecture
are located here [2].

[1]. https://lore.kernel.org/kvm/20261002202026.1204110-1-mathieu.poirier@linaro.org/
[2]. https://gitlab.com/Linaro/cca-public/build-instructions/-/tree/upstream-v5-kvmv23?ref_type=heads 

> 
> -- 
> 2.43.0
> 
> 

