Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42321FA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 16:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VquIGlMG22FiqzSomuVxO3pJuNTPu1MzbM7EM1lJb+o=; b=m7IcT791MsUkUCUeR4E0gb/TrF
	jVd+KlSn95Ml50SmXbXWVgpbDtZM3c3bxqx+JCe0yfV7HD47mb1rxSvgm9FDffWefcvj7AQvZUD1d
	gyVRR9RJcaBbHyqShN6i994PsjCl/Prjj6hNRc6BnKAIWtVDZzKqUhKV2hCKRhj/X9t9zzQD5KKJo
	lofrZiQOvc02IafkaWYqqpu8TaJQK+mGWDO947yitKw39PCV/nc1SS+uNhTkLQrdr+roHFI89THQi
	r6iLnGNuvPd8F7KI5K9gA4Qv/27KDAmiAIsRryaDFePWEDHCvxXDYqJ0EFvdTRCJTnollJTXRJ+j/
	2yN6GTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiPc-00000008W2C-34eK;
	Fri, 02 Jan 2026 16:54:04 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiPa-00000008W11-0WJy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 16:54:03 +0000
Date: Fri, 2 Jan 2026 16:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767372839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VquIGlMG22FiqzSomuVxO3pJuNTPu1MzbM7EM1lJb+o=;
	b=l8nGBsb6lcyGITzO1rS8L7sOEvvbDsF0q1xzPBnA1VBVgO2qsGxHHVFzHuTMKoxJA8/fIc
	ZPY6yVO7dLnhsu3KIQ46bH0iqlkuMomJ7RJeWsJOcx0dqFyiBfmubRB78b7n2QyK+kWXGV
	aJ8HKdAX2Zlj2vRx+JXzi/VwQhF1NO0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/21] KVM: selftests: Add a "struct kvm_mmu_arch
 arch" member to kvm_mmu
Message-ID: <zeiyns2xhtw76xtmn3so2jiyvcakszb5p2p6fak3dm62szzxon@rxkwn7peicen>
References: <20251230230150.4150236-1-seanjc@google.com>
 <20251230230150.4150236-9-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230230150.4150236-9-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_085402_529679_2A647CBB 
X-CRM114-Status: GOOD (  14.41  )
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

On Tue, Dec 30, 2025 at 03:01:37PM -0800, Sean Christopherson wrote:
> Add an arch structure+field in "struct kvm_mmu" so that architectures can
> track arch-specific information for a given MMU.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>

> ---
>  tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h     | 2 ++
>  tools/testing/selftests/kvm/include/kvm_util.h                | 2 ++
>  tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h | 1 +
>  tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h     | 1 +
>  tools/testing/selftests/kvm/include/s390/kvm_util_arch.h      | 1 +
>  tools/testing/selftests/kvm/include/x86/kvm_util_arch.h       | 2 ++
>  6 files changed, 9 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
> index b973bb2c64a6..4a2033708227 100644
> --- a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
> +++ b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
> @@ -2,6 +2,8 @@
>  #ifndef SELFTEST_KVM_UTIL_ARCH_H
>  #define SELFTEST_KVM_UTIL_ARCH_H
>  
> +struct kvm_mmu_arch {};
> +
>  struct kvm_vm_arch {
>  	bool	has_gic;
>  	int	gic_fd;
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 39558c05c0bf..c1497515fa6a 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -92,6 +92,8 @@ struct kvm_mmu {
>  	bool pgd_created;
>  	uint64_t pgd;
>  	int pgtable_levels;
> +
> +	struct kvm_mmu_arch arch;
>  };
>  
>  struct kvm_vm {
> diff --git a/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h b/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
> index e43a57d99b56..d5095900e442 100644
> --- a/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
> +++ b/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
> @@ -2,6 +2,7 @@
>  #ifndef SELFTEST_KVM_UTIL_ARCH_H
>  #define SELFTEST_KVM_UTIL_ARCH_H
>  
> +struct kvm_mmu_arch {};
>  struct kvm_vm_arch {};
>  
>  #endif  // SELFTEST_KVM_UTIL_ARCH_H
> diff --git a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
> index e43a57d99b56..d5095900e442 100644
> --- a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
> +++ b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
> @@ -2,6 +2,7 @@
>  #ifndef SELFTEST_KVM_UTIL_ARCH_H
>  #define SELFTEST_KVM_UTIL_ARCH_H
>  
> +struct kvm_mmu_arch {};
>  struct kvm_vm_arch {};
>  
>  #endif  // SELFTEST_KVM_UTIL_ARCH_H
> diff --git a/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h b/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
> index e43a57d99b56..d5095900e442 100644
> --- a/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
> +++ b/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
> @@ -2,6 +2,7 @@
>  #ifndef SELFTEST_KVM_UTIL_ARCH_H
>  #define SELFTEST_KVM_UTIL_ARCH_H
>  
> +struct kvm_mmu_arch {};
>  struct kvm_vm_arch {};
>  
>  #endif  // SELFTEST_KVM_UTIL_ARCH_H
> diff --git a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
> index 972bb1c4ab4c..456e5ca170df 100644
> --- a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
> +++ b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
> @@ -10,6 +10,8 @@
>  
>  extern bool is_forced_emulation_enabled;
>  
> +struct kvm_mmu_arch {};
> +
>  struct kvm_vm_arch {
>  	vm_vaddr_t gdt;
>  	vm_vaddr_t tss;
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

