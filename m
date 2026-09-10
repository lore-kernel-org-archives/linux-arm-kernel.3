Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB062C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mxXlzJuLSIxRk+E9jigAcfOHrY2xXO1oOwkSi2OYVs=; b=WFw7Ld4n5dNkl22l8j6YTvfj1r
	zQhUf2D8X6KdaPZbUxyNoNDxTR2pSOa0/F41c9/+4i9h4zVjzQD76wNgugi+d20zNQaySu85yWldE
	evf+rhP5ArMiTm+7PX2paJDKiF+1Wr8LoWEA+21QSNn5uonblf2+D7tnoWAyiEHRjdNU6ZTYVA/ue
	RtWGZNCqoh1tKqdraKPzPonaNLJiQOayeEbTWjxPfjPcML6n0XWxmwAry/GDnXcL2TP8GjdOqneUs
	ISGGqcEvRGRG6Zxefok3uTIIVP02x5Jas1YhhS5nk0k/AczmJGEYd+iTMhKa5UlNhkqT+xSSSegBo
	W2cppEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jlm-0000000FAwe-49vh;
	Thu, 10 Sep 2026 18:45:10 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jli-0000000FAvH-1uun
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:45:07 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b78e073980so10063e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789065903; cv=none;
        d=google.com; s=arc-20260327;
        b=oFFCXznMyVxOgbTKqKiqNCqrbp+7fI3giERssPKO7lgyoFqxUh9IkjnqPmjwCkgQ3K
         WI/FmKf25hJ+xr6P0ZaPN4jEFDdMyCgTCHjLdn7h6cXxxeomPxtev5ufQSBX4HBKb+ft
         DdURcJrCTp4DXZmLU3fZc9wl0b/phwjx7zArp6F/TN/vGfjD7MwnKT/VNxqYFTZiUVYq
         5JQKgL7InWGFnON/Pjk6Cs67p6dVC/oIKEGokjWwBm/UHPr+eSt6mijSAbezL2Rcr4fo
         Qx4sW4XjZCu+J7rww3Pj+lwrbZ+t7g3yJ2YAtUUaZWjQfJP9QR0Rv9G7xKrP5pfRPucR
         UGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6mxXlzJuLSIxRk+E9jigAcfOHrY2xXO1oOwkSi2OYVs=;
        fh=ne0sAcyW/547jB6uCjoW2EoKV2UpNvJVh/zkbYcHQf4=;
        b=oEHje95VZFbt+S6ystJ3djcTQYJgQFoXM/A50DElNcjV29vTmKQMYA4at3Q7qTvr1m
         94RIg+MRU/KuTQ8Iw+Rd2eSbbGwwf5H9Fh7TyvRK9Wh3WrnA2RNJbM4LERx5amXTFL1+
         hLu6V2LAdJDfbhlQEOZ33M1VsSgwKoHus69qTeXpWUzl7cF70R8jbag0vUEcRMiTiKuD
         VrfxJA+idbvPb22ep7WVlquKhYWDbNTpX2kNUrmA6f2+CHvYm3qgKr+ohswyq1FnQbsW
         xJJX3viTL4rLUdP1myIJyUCPSCdSweMAvles6zn8bq4elNS1y06bciMLMO3QBNK1CVjI
         J+Vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789065903; x=1789670703; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mxXlzJuLSIxRk+E9jigAcfOHrY2xXO1oOwkSi2OYVs=;
        b=VV379EccaQ+GrzroZ5CDaAyCNEUV17jLCGDlIUT2MNefc4ZhsHne1gGGsI/t7s2B8B
         6/ut8KLSSedXC8+gLHdK4pf65dM6n45T+IWK0j85jO1e6nzCWhU4kff3CVSSu9QUbCdx
         m2xeENIjZYfgUHUkevZcg9X8kCmfniZpp3y2X1KiQMDqOUHGPIiKUzFMmPmhy75q+7bB
         WC5fcymmY9DfI/3uQrblme3HWm8RunyQEb+EImp1ntr4EDsFsumpOm3zMeLZXAj4a0Ny
         ZetgxfE0F0dXMytePf1a4aFVggybFya1vbXfdPB5SxZh6+LcFLr6khQ6nc3j5N3WVFAQ
         jaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065903; x=1789670703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6mxXlzJuLSIxRk+E9jigAcfOHrY2xXO1oOwkSi2OYVs=;
        b=B6e1zeRqiJ1/boNsdYy8iMWnyF+X41vIGygCQECexAVdsjjgHHjgYx3wb43zQjyIyL
         pLz+31p0oNu7c4UhVaGh7SUfqSw8qPbjCwopWlGQmM5mnD1WprFGvYnNWVYi8bVD6k+U
         8BNxFSZdwdoubEHQpxphMywYOTlDTjLixzRlm8JD4G4APIBNJj1XN5Gl6f5OeSQwL+8M
         hsnMlB4gIYECUxmBmRrjvPKStDR8ZN28Tsrrg8/M5bx04pblOTKUbY/YfWmJdwzFikWC
         HmoQlhaS/AERyqCzQxxX2MS3Dke2j9RJ4cBb2Zt7MO25YTY3ehQyXGDmxMg6l3r6mLsY
         NC1A==
X-Forwarded-Encrypted: i=1; AKwUvBwG6uaSesUfwrpK6W8dQ1E2R48mWAxIUspRyVz1E9NFL40aKu4zCSJngX0PwovdML1ZXpKbDuHvU6/saH7BJ5zp@lists.infradead.org
X-Gm-Message-State: AFuF++kFAq3ymL+wS/MIEHo1oyET4YOJzlGgcZbMcZuVwh7+yU6XBIBw
	ztQ5moX1VFiepSOv1DdDfJUq8j+CJwGBzVUhDUwrOKJuVYielSUVNSEAuCJZESGCxTJvW0TZRTQ
	AQMyFprAEvix0LhS1P/6VefG3xnQ1iV3eV/Qf93p7
X-Gm-Gg: AYBFou1Juq6iG4pR+l8TTITHRjE/F0hFG/hWiipzG614VI79c73hlpo9zOnxPKl/kyG
	7edpRbWkkAuXrOZe5n6vPjyhoE6PP0WhgFk+5WR3p52xF7mZwDnHmtUG3yT7CndD01qXIxO0ph2
	zhCBPYuL3k48PRuvcZlvOhBlMhcoxiK45sqab8fx0GYEBx76LaQ4wg4HUUNPbEGBB46y9AFO/BB
	vnbdHkpzhhZs/v72kyB4b6YjYnie553Tynb/Z0KpCLdt0bCeYmzAREqvM3VRB4JMTZdeGiNgCp1
	waXroEk2g0ngdvB5KsUMmPbqCxaujmTb+oAmG/20bFQvvvpABqKAbz4T3IU53Q7xtUVeKNlo+6u
	LdQmnQI7DZlPRDA==
X-Received: by 2002:a05:6512:2346:b0:5ae:b0ee:f737 with SMTP id
 2adb3069b0e04-5b8a07b13f4mr18218e87.9.1789065902145; Thu, 10 Sep 2026
 11:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Sep 2026 19:44:25 +0100
X-Gm-Features: AcwNN1Xstr2nKNQ0qtLcezmwbWTpmOb8zSO-m5akVdu8AVpy9ds-Ainfdlx4-oc
Message-ID: <CA+EHjTw=7M+ac5UCfM5yPmuX8RuqZN08TLfXAmTLbQgmuhNWtw@mail.gmail.com>
Subject: Re: [PATCH 0/8] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_114506_579691_BEDEF093 
X-CRM114-Status: GOOD (  35.62  )
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

Hi Lorenzo,

On Tue, 25 Aug 2026 at 17:01, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> This series implements the KVM stage 2 page table pre-faulting feature for
> arm64.

I know there's likely going to be a V2, but FWIW, I tested this series
as follows (finally managed to get protected mode running on my Mac):

QEMU (arm64, -cpu max,pauth=off):
- Protected-mode host, boots non-protected and protected guests
- pre_fault_memory_test on a non-protected host, VHE and nVHE, all 13
guest modes
- nv_pre_fault_memory_test with kvm-arm.mode=nested

FVP (AEM, FEAT_NV2):
- nv_pre_fault_memory_test with kvm-arm.mode=nested

Apple M4 hardware, running as a KVM host at EL2 under Apple's nested
virtualization (nVHE only):
- pre_fault_memory_test, anonymous and anonymous_thp backing, over the five
  guest modes available there (the IPA is capped at 40 bits and the 64K
  granule isn't implemented)
- with kvm-arm.mode=protected, pre_fault_memory_test skips on
  KVM_CAP_PRE_FAULT_MEMORY, so the pKVM exclusion holds on a live pKVM host

Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
(happy to retest again when you respin)

Cheers,
/fuad


>
> == Foundations ==
>
> The series begins by establishing required foundations:
>
> 1. Updating kvm_s2_fault_desc to independently store the exception syndrome
>    register (ESR) value, and updating all code paths to use this value
>    exclusively.
>
> This is needed so we can later generate a synthetic fault to perform the
> pre-faulting - we need to be sure the code doesn't grab an incorrect ESR
> from elsewhere.
>
> 2. Updating kvm_s2_fault_desc to independently store the kvm_s2_mmu and
>    updating all code paths to use this value exclusively.
>
> Similarly this is needed so we can generate a synthetic fault against the
> canonical stage 2 MMU (it would make no sense for it to touch nested shadow
> page tables) - we need to be sure that the code doesn't grab an incorrect
> MMU from elsewhere.
>
> 3. Updating the abort paths which consume kvm_s2_fault_desc to also return
>    a kvm_s2_fault_result data structure.
>
> To perform pre-faulting the code must know the granule size of what was
> just walked. So the abort paths have to tell us what that was.
>
> 4. Pass walk flags to kvm_pgtable_get_leaf() to permit walking page tables
>    under the MMU read lock.
>
> This is Jack's patch, verbatim, which allows the use of the
> KVM_PGTABLE_WALK_SHARED flag to walk page tables under the MMU read lock.
>
> Pre-faulting requires it to be able to work in parallel as specified by the
> API. The read lock precludes page tables being torn down behind our back.
>
> == Implementation ==
>
> Pre-faulting is implemented in kvm_arch_vcpu_pre_fault_memory() whose job
> is to pre-fault the stage 2 page tables which map a specific GPA (which,
> for arm64, is the guest's IPA).
>
> This function is called by kvm_vcpu_pre_fault_memory() for each GPA in the
> range, which itself is ultimately invoked by userland via the
> KVM_PRE_FAULT_MEMORY ioctl.
>
> The implementation is simple - try to walk to the stage 2 page table
> mapping the GPA - if unmapped, fault it in through a synthetic page fault.
>
> pKVM is not supported regardless of whether the VM is protected or
> not.
>
> This is because pKVM instantiates vCPUs upon run, but pre-faulting is
> typically performed before a vCPU is run. It would be confusing and
> inconsistent to error out on non-running vCPUs but to pre-fault running
> ones.
>
> Jack's original test suite is also included in the series.
>
> == Credits ==
>
> This series is based, with gratitude, on Jack Thomson's series and their
> respins (links provided below) as well as the feedback he received.
>
> The series includes Jack's v5 "KVM: arm64: Pass walk flags to
> kvm_pgtable_get_leaf()" patch verbatim, and all three of his test patches,
> two of which required minor fixups.
>
> Link: https://patch.msgid.link/20260612162354.73378-1-jackabt.amazon@gmail.com/
> Link: https://patch.msgid.link/20260113152643.18858-1-jackabt.amazon@gmail.com/
> Link: https://patch.msgid.link/20251119154910.97716-1-jackabt.amazon@gmail.com/
> Link: https://patch.msgid.link/20251013151502.6679-1-jackabt.amazon@gmail.com/
> Link: https://patch.msgid.link/20250911134648.58945-1-jackabt.amazon@gmail.com/
>
> == Reviewer Notes ==
>
> I synced with maintainers on this who asked me to take a look, as there hadn't
> been progress on the series for some time.
>
> Am happy to rebase again after -rc1.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> Jack Thomson (4):
>       KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
>       KVM: selftests: Enable pre_fault_memory_test for arm64
>       KVM: selftests: Add option for different backing in pre-fault tests
>       KVM: selftests: Add nested pre-fault test for arm64
>
> Lorenzo Stoakes (ARM) (4):
>       KVM: arm64: Propagate and use esr in s2fd when handling guest aborts
>       KVM: arm64: Propagate and use mmu in s2fd when handling guest aborts
>       KVM: arm64: Propagate and use kvm_s2_fault_result on S2 fault
>       KVM: arm64: Implement KVM_PRE_FAULT_MEMORY
>
>  Documentation/virt/kvm/api.rst                     |  17 +-
>  arch/arm64/include/asm/esr.h                       | 129 +++++---
>  arch/arm64/include/asm/kvm_emulate.h               |  52 +---
>  arch/arm64/include/asm/kvm_pgtable.h               |   5 +-
>  arch/arm64/include/asm/kvm_pkvm.h                  |   2 +-
>  arch/arm64/kvm/Kconfig                             |   1 +
>  arch/arm64/kvm/arm.c                               |   1 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c              |  10 +-
>  arch/arm64/kvm/hyp/pgtable.c                       |   5 +-
>  arch/arm64/kvm/mmu.c                               | 324 +++++++++++++++++----
>  arch/arm64/kvm/nested.c                            |   2 +-
>  tools/testing/selftests/kvm/Makefile.kvm           |   2 +
>  .../selftests/kvm/arm64/nv_pre_fault_memory_test.c | 206 +++++++++++++
>  .../testing/selftests/kvm/pre_fault_memory_test.c  | 152 ++++++++--
>  14 files changed, 736 insertions(+), 172 deletions(-)
> ---
> base-commit: aa8e5dc6a7a2a1141ab40706a51010adcd0e57d2
> change-id: 20260815-kvm-arm-prefault-9bb411b6897d
>
> Best regards,
> --
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
>

