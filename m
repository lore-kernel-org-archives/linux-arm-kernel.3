Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D254C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MwQ1tnz1WwDjn4BVuB6xqOqxvQVSpCNTAYqq3NjidQ=; b=etdOzvDTmH4E9tL5g2mIUFs58D
	ooeP4rCkkv9w1i3KFdsmmuxrWiiTrWjnLFog1OUv+pEqFPRX6BvyU8dkxDnipHu8X8MbtJDVVjUsZ
	XM1KbzzNklL/7dqAkrBNTcrnmN9swfEXjSV4wC+sedKOCMqubYSc0BJ/Ys19WdepezKB48CI81/3c
	Q/IpiaxAeipRSnW/tJjmhBhEdrsWweoyL5shNKTFtBUDLCw2Mi82SyvcEihPbdWY2OpU3LTGsO/t4
	HNFFISrfmzsJ6Gr8RQPodDvFVT3BBP/hYeqUT8Oj7KIn5uXObMqC2RzdTWVDUgaK68LGFSTu12ls5
	+kiZf4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwL4t-00000008CKI-1YiI;
	Tue, 18 Aug 2026 14:46:11 +0000
Received: from out-162.mta0.migadu.com ([2001:41d0:1004:224b::a2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwL4p-00000008CJl-1eUx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:46:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CieHboMpuXfbRWDkCH9YDuDG33RKKvNl4sdtiHansdU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787064364; v=1; x=1787669164;
 b=XGFGpqN4G3TiDODIz+BESdlJGpBAuoKz5uy94Dkvg4RbU05kwZqL5/dAJs340oL7CquH/zxj
 WWb09DiWtsfHDDQ2oyIOP50dKmOsTIcr7u/rwEELmm8JKK+3flMp3+0PutNSATXNJaUPXNh1iOb
 SwcHL3YOHKSJnicPgVrieaXg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f45.google.com (209.85.167.45)
	by smtp.migadu.com with ESMTPS id 8db407aa6879fc9c;
	Tue, 18 Aug 2026 14:46:04 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so9830e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 07:46:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RokUr+VEAO+W064oHEG6CePGPS+4pxpU1Q4X1T+g1NUVx+9K9rNBS0Pf6mgbU5yX4A68IZZS6+pGfpCzGyDLzDa@lists.infradead.org
X-Gm-Message-State: AOJu0YxYsfjSejgchsnHnL6U2mJi14Gkhe88LVFK4me3fZQTABLwIHjv
	ag6/PzWxV3mZcu19QyXYD5vP4q6pOrWNwZ3owZ7s1bEaEcaFKRG7gXpfUhIPPyaN2KRCXUIc4Ya
	CBJNDWLuHZFW3jRuhSVqsmhXf8Srmrz3hZEA08nEL
X-Received: by 2002:a05:6512:1292:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b471ecc7bcmr238410e87.4.1787064359769; Tue, 18 Aug 2026
 07:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com> <20260731143541.956291-12-vdonnefort@google.com>
In-Reply-To: <20260731143541.956291-12-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 18 Aug 2026 15:45:23 +0100
X-Gmail-Original-Message-ID: <CA+EHjTycM7b4d1foNQr33e7dN7WHyeg-Ww8nPkSKu78DGDs9_w@mail.gmail.com>
X-Gm-Features: AcwNN1WxghC3g5qogm93X3-BDXmvBeGlnHJjBQyn_ThrrYLqy3XthGmODUrBhcE
Message-ID: <CA+EHjTycM7b4d1foNQr33e7dN7WHyeg-Ww8nPkSKu78DGDs9_w@mail.gmail.com>
Subject: Re: [PATCH v4 11/17] KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_074607_657438_3A11B287 
X-CRM114-Status: GOOD (  19.42  )
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

Hi Vincent,


On Fri, 31 Jul 2026 at 15:36, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> kern_hyp_va() is idempotent for the hypervisor linear space. This is
> handy for nVHE hypervisor callers handling kvm_vcpu or kvm_arch
> pointers. Those pointers can originate from the hypervisor space (when
> protected mode is enabled, we don't trust the kernel and the hypervisor
> uses its own copy) or from the kernel space (we do trust the kernel in
> "non-protected" nVHE).
>
> This idempotence does not hold for addresses within the hypervisor
> private range, like the ones you get from the pKVM heap allocator
> (hyp_alloc()). To resolve this, filter out non-kernel addresses based on
> PAGE_OFFSET.
>
> Leave the assembly version untouched as it has no current users.
>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index 6eae7e7e2a68..d60e5f2de10c 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -126,6 +126,9 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
>   * replace the instructions with `nop`s.
>   */
>  #ifndef __KVM_VHE_HYPERVISOR__
> +       if (!is_ttbr1_addr(v))
> +               return v;
> +

I gave this a tag earlier and only came back to the cost side now, sorry.

The check is unconditional, so plain nVHE pays it on every
kern_hyp_va(), including the one in __kvm_vcpu_run(), and it has no
private range to protect.

Could it be gated on is_protected_kvm_enabled(), the same way patch 17
gates hyp_trace_buffer_alloc_bpages()?

Cheers,
/fuad


>         asm volatile(ALTERNATIVE_CB("and %0, %0, #1\n"         /* mask with va_mask */
>                                     "ror %0, %0, #1\n"         /* rotate to the first tag bit */
>                                     "add %0, %0, #0\n"         /* insert the low 12 bits of the tag */
> --
> 2.55.0.508.g3f0d502094-goog
>

