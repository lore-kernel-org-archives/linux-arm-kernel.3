Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C567D104BEC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1+J3NqZXQBkyhheWX7UG+xf0a4O/Xa45DXcaC0RyAk=; b=o8OzJh760+1NWbVWx6sWB821pN
	z7RttUSumK24YsdPm2kaiIWffOK4lOUf7Xitzddxe2Bt+/F8NLza0hLhAmfzIbgmXhEE8ev605POS
	biEhCUX2YilAbv1O+Y3BuQuMiARFK4gDy/okRVyLceKH8mA7X5tcd2FKw1o43d8Jvg0J3rSnDSSeI
	6V21bp2LINmvWZ5z+sn6Jo+wc6UfovRXv0ygBkuSVgXokFFe5rOI4I27ZQhYXOG6rVD/DQpLyi9dQ
	3hyCUd5ODLpxOJKI8mF4F2fCndk9Qvocy2INhSB7Um0kO65HcrR2bXvSGW5G7gWe4iLnzPcmFo9IS
	PuCdZ8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GUZ-0000000BN8o-19QC;
	Wed, 11 Mar 2026 10:08:39 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GUW-0000000BN8G-0tEk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:08:37 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-509069a7a7fso504431cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773223714; cv=none;
        d=google.com; s=arc-20240605;
        b=Afm6NooSOWVM5c3wW8W2Fk7pDsWpep3ksNg9/MPiXliPjyV8YwFDwr6m16/zRvYIPO
         ALwIAYG7shrMiVh3BBtZqg76Ct/3xogP6jJWGDWwe9P1bZp37NYVepi29IKyxiXSrMHD
         sfsUAAoX/mGYxVE6x8+WY+gGUHxUdKjbLd4pU4+4bn/YNNiURSaIL4mKc/2JFQmi6nku
         YE43NL23vhvto+IYnAEzgesr2CHNdqp8pkRUcUC65ocFlmx89i6qE65/8DiHuqxHNjNt
         uDKPy03lTGOROhLTGkJMOIxSwDSlRqcWFrPEzJIYmbvFKrY+5UKxEde78i33m4gfdypi
         q2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g1+J3NqZXQBkyhheWX7UG+xf0a4O/Xa45DXcaC0RyAk=;
        fh=EfGqaP5BTu3VSigm4RuawrVz0soTagp0IOe9P2hkDn4=;
        b=LIfFLqKLVetkQ2WHvys6UW4/njkCS7fGKA+PsYdXVB/mwAIxgysT19YYvXlLvr4eXw
         9x0kRM6TJDu3d9KPDKEzUWiKg/w3+HM0oiAnL90KgelPJGdRMrC92VFpZiNQt9mSnAa+
         qqZJNObPQ9xpnP6984w3LdU0/T4vmWk9izje7jUwSLuCRawC2MPvC1yel5aSE6Qr/LKN
         VIW6bV4DsBftZP+i3hpv6w6Vp4rYkVU/qQxUJx1RLDHVys8EeuQh1Jl5Dhxgdx4o0Nz9
         cN4yLfj4JH8AtHS5p8u7phRRQbgBs/M7NKNrLdSZ6LMNy+X7hTQmAfj5GvgBgNtwonUS
         Ow8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773223714; x=1773828514; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g1+J3NqZXQBkyhheWX7UG+xf0a4O/Xa45DXcaC0RyAk=;
        b=XhxTkuoTbQ+qdTUl5onI+YRcwST4WtV3bpJnFjRLUBQyt9T/QWdi/X14WiDlhKFys5
         MRnIwF89gkpsPpcLSD5m/scgtb8QLOMVLE372YOXrG4lXc7ZEvZmO3eOIdrfUu5tC20V
         OGahUoVseVCMBeIkPbvOuSh+shRf8Ka3Nf/jMKAPR5J5A/C4luS1nndnvlVIV2Y0JLvM
         heQYpVrrlJfCCbzJ+16LvlYCqbUrMBJI+wXFAxITSSd6UPF1CKjxLdd5zP8oNo9yTslc
         npl39ZLLAgPPbrJHtwr0zdrT5MINjTMaHOUbznPa0A6yGmrDuuzo/57p9ukDGjZFgzJT
         B/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223714; x=1773828514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1+J3NqZXQBkyhheWX7UG+xf0a4O/Xa45DXcaC0RyAk=;
        b=YkQ3WKHjJmRAN934Y49mCa8XsNYYQ82IHHWW1LOxty6KlQKIGEnnBldOUX9IgCX46r
         LxSReGDua7cOQb4I5HtlHmmSWTOdRpdZMAK0kPdD44PVPsnB09ObqelkERGcEC0JHnhb
         LazxWAIevBZ+azwKTK4jgG74P/P6jeHEv02BjtC5w80yUOraVw7bLQF07Gpj1jQd79ke
         SfrtsQpOUoZt0JHhHa6/fxTVz6vq5MFy2uTulgqK/2A3OmMy0BPcYx5sIGBc457Dpvl+
         gwtSX3lCaYhwKzgX9185w9f1G4i+FMOE1EAiNf4XVQzFZSAYQDRTgnzYUzXSdbh1S//k
         iTrw==
X-Forwarded-Encrypted: i=1; AJvYcCWyKlHWX80iNANiegopXwELMvYQeyAVGL7WM3NJvE4J7rHKV50o9NJvU1JKXuw63cLDnseSJs+xTSuZ1SI5ZO7h@lists.infradead.org
X-Gm-Message-State: AOJu0YzubGpn3tG6XV9n3v5bd3Ks6q3NtXq0fldIbwz+UH53c7Cn3yPr
	av+ECKsEAXfcZScEPR89ajbGOrDjIihhTEjXSyRAwP1LbkPuRZtPuTtr7qnnHe5cJurjbJPg/f5
	ybTK/QH5uCXGIw96mxKgnNK4uD7BtzJ101ypBKdtB
X-Gm-Gg: ATEYQzxncEdi1DjGEoHTLKLZCt3FyryyvbaeKIIsZ1tO/o7iOd7U20sRI5K6hVJf4Zh
	kodKYK6BJ9KH7U+Wm7B/qV8ENhitd+hnzQOc1fW7XBkI0wgtputkTQFXcQTJn8/QMzb//NBiSmC
	/hgRBqVcUu7K79wX5MrgOwwgwlGHvUFvcNH1Fi5qQLyj6pRDuBkoLQvT1qYoxhRFjgikIqUnTb1
	FALtWqe8NLxTB0E8TrVpMo9avIbCesbjyfdk27sTJKiyQOgDWdctycpRCRp5IXYbWwuM5fQ7tEg
	KsMC/kZ2elAi7toW+lX0OqFeN1CT1WtsS3XxdA==
X-Received: by 2002:a05:622a:649:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-5093801c297mr11736091cf.0.1773223713491; Wed, 11 Mar 2026
 03:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org>
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:07:56 +0000
X-Gm-Features: AaiRm52TzX3ZonIXvaz3nCHskmbhiqVjVB_l366ofCqzpHAmP4-UKzbQ1mMmDh4
Message-ID: <CA+EHjTxfufq6kD1JZCryHeWM=eHODJck9KzRLWcZ37SbhH5rKA@mail.gmail.com>
Subject: Re: [PATCH v3 00/36] KVM: arm64: Add support for protected guest
 memory with pKVM
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_030836_272575_D6895A03 
X-CRM114-Status: GOOD (  21.95  )
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

Hi Will,

On Thu, 5 Mar 2026 at 14:44, Will Deacon <will@kernel.org> wrote:
>
> Hi everyone,
>
> Here's v3 of the patches previously posted here:
>
>   v1: https://lore.kernel.org/kvmarm/20260105154939.11041-1-will@kernel.org/
>   v2: https://lore.kernel.org/kvmarm/20260119124629.2563-1-will@kernel.org/
>
> Changes since v2 include:
>
>   * Rebased onto v7.0-rc2
>   * Rework of the way that exceptions are injected into the host,
>     building on top of Fuad's work that landed in the recent merge
>     window.
>   * Some renaming and comment additions.
>
> As before, I've pushed an updated branch with this series:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=kvm/protected-memory
>
> and the kvmtool patches are available at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/log/?h=pkvm

For both the kvmtool patches and this series:

Tested-by: Fuad Tabba <tabba@google.com>

Thanks!
/fuad

> Cheers,
>
> Will
>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Zenghui Yu <yuzenghui@huawei.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Quentin Perret <qperret@google.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Vincent Donnefort <vdonnefort@google.com>
> Cc: Mostafa Saleh <smostafa@google.com>
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
>
> --->8
>
> Fuad Tabba (1):
>   KVM: arm64: Expose self-hosted debug regs as RAZ/WI for protected
>     guests
>
> Quentin Perret (1):
>   KVM: arm64: Inject SIGSEGV on illegal accesses
>
> Will Deacon (34):
>   KVM: arm64: Don't leak stage-2 page-table if VM fails to init under
>     pKVM
>   KVM: arm64: Move handle check into pkvm_pgtable_stage2_destroy_range()
>   KVM: arm64: Rename __pkvm_pgtable_stage2_unmap()
>   KVM: arm64: Don't advertise unsupported features for protected guests
>   KVM: arm64: Remove is_protected_kvm_enabled() checks from hypercalls
>   KVM: arm64: Ignore MMU notifier callbacks for protected VMs
>   KVM: arm64: Prevent unsupported memslot operations on protected VMs
>   KVM: arm64: Ignore -EAGAIN when mapping in pages for the pKVM host
>   KVM: arm64: Split teardown hypercall into two phases
>   KVM: arm64: Introduce __pkvm_host_donate_guest()
>   KVM: arm64: Hook up donation hypercall to pkvm_pgtable_stage2_map()
>   KVM: arm64: Handle aborts from protected VMs
>   KVM: arm64: Introduce __pkvm_reclaim_dying_guest_page()
>   KVM: arm64: Hook up reclaim hypercall to pkvm_pgtable_stage2_destroy()
>   KVM: arm64: Factor out pKVM host exception injection logic
>   KVM: arm64: Support translation faults in inject_host_exception()
>   KVM: arm64: Avoid pointless annotation when mapping host-owned pages
>   KVM: arm64: Generalise kvm_pgtable_stage2_set_owner()
>   KVM: arm64: Introduce host_stage2_set_owner_metadata_locked()
>   KVM: arm64: Change 'pkvm_handle_t' to u16
>   KVM: arm64: Annotate guest donations with handle and gfn in host
>     stage-2
>   KVM: arm64: Introduce hypercall to force reclaim of a protected page
>   KVM: arm64: Reclaim faulting page from pKVM in spurious fault handler
>   KVM: arm64: Return -EFAULT from VCPU_RUN on access to a poisoned pte
>   KVM: arm64: Add hvc handler at EL2 for hypercalls from protected VMs
>   KVM: arm64: Implement the MEM_SHARE hypercall for protected VMs
>   KVM: arm64: Implement the MEM_UNSHARE hypercall for protected VMs
>   KVM: arm64: Allow userspace to create protected VMs when pKVM is
>     enabled
>   KVM: arm64: Add some initial documentation for pKVM
>   KVM: arm64: Extend pKVM page ownership selftests to cover guest
>     donation
>   KVM: arm64: Register 'selftest_vm' in the VM table
>   KVM: arm64: Extend pKVM page ownership selftests to cover forced
>     reclaim
>   KVM: arm64: Extend pKVM page ownership selftests to cover guest hvcs
>   KVM: arm64: Rename PKVM_PAGE_STATE_MASK
>
>  .../admin-guide/kernel-parameters.txt         |   4 +-
>  Documentation/virt/kvm/arm/index.rst          |   1 +
>  Documentation/virt/kvm/arm/pkvm.rst           | 103 +++
>  arch/arm64/include/asm/kvm_asm.h              |  31 +-
>  arch/arm64/include/asm/kvm_host.h             |   9 +-
>  arch/arm64/include/asm/kvm_pgtable.h          |  45 +-
>  arch/arm64/include/asm/kvm_pkvm.h             |   4 +-
>  arch/arm64/include/asm/virt.h                 |   9 +
>  arch/arm64/kvm/Kconfig                        |  10 +
>  arch/arm64/kvm/arm.c                          |  12 +-
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   9 +
>  arch/arm64/kvm/hyp/include/nvhe/memory.h      |  12 +-
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   7 +-
>  .../arm64/kvm/hyp/include/nvhe/trap_handler.h |   2 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 184 +++---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 585 ++++++++++++++++--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                | 224 ++++++-
>  arch/arm64/kvm/hyp/nvhe/switch.c              |   1 +
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c            |   8 +
>  arch/arm64/kvm/hyp/pgtable.c                  |  33 +-
>  arch/arm64/kvm/mmu.c                          | 114 +++-
>  arch/arm64/kvm/pkvm.c                         | 154 ++++-
>  arch/arm64/mm/fault.c                         |  33 +-
>  include/uapi/linux/kvm.h                      |   5 +
>  24 files changed, 1374 insertions(+), 225 deletions(-)
>  create mode 100644 Documentation/virt/kvm/arm/pkvm.rst
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

