Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79EDE9A769
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Hm6FcIelYRzr6kqaVU6QkNylXodkfysOhFYlFmBd98=; b=co1pZjqzn866C1zQlYEKXq74ZC
	shbTfFakjzn3QtgTTI7AaMbnA3wcBiy8Sm5G3HBKtpWM1Bp4th2z++OIKrH432EQT8lbrcnYHGm1l
	pRZCITx9/LYfQZkP0l636PVK0JZodx/PncTXZi5AMotUH/X+5nLHZ0bn8AifS2AOYVzjlDrZohbr1
	OzkV71Zps0D0ukOFHtbwHqI6kUm+IsQW5U+Anolieq6p89JxWGG4DNEmkuzHkdUWTjlXggalAakli
	NJBqdpZuRdSsYw3mXumTzU+Wn+zOid+qyfwPw9WMeeODDT+JlllKmnHCsT/JZ2BnPcAYVSomawYee
	FbiV3FVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zU2-00000001FPk-0hQ8;
	Tue, 24 Mar 2026 10:59:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zTz-00000001FPN-2owc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:59:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-486ff201041so32228185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774349974; x=1774954774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Hm6FcIelYRzr6kqaVU6QkNylXodkfysOhFYlFmBd98=;
        b=J62injpfp6DCB26SEC5k2CK0eCFcg0G5XlSsBUnTI98o5VCdd9FgPaG9192Gf2pOIY
         JYs9DZ2dwr+Qz9TwW/Ndu5QduzqdE2WysYdzFqaDL2CMVSXew6054Ks82rMiz4A7hf7O
         3dflszfdNhg2/6VYJu+ZFk/feEWiDYsnrcyETq+2QIL9ZxFUXPxWGnX/4aRHLkxCm8pz
         LWNAinocdfVaTzxnPiTb7knmTgRbOxfqoAExc+IJ2MmFci+BYHWtTpxaUIyC0KcMGYy4
         qLRx6wSMylGX2touEJlquBHr59wvPqNbZ7VKQcsJwOjtZ+p+23ESqAAYjBzTwpgayJ0C
         xB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349974; x=1774954774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Hm6FcIelYRzr6kqaVU6QkNylXodkfysOhFYlFmBd98=;
        b=V0hzrlRP/a6Ss3XXBDThmREUAz8ar6PNe/Ks+tBNs//DYHvIOw0cBPxB4258DQOaxW
         sqPluuX/6FTLAnNtWpA0lWWF18aUMFkIbSRj9rcyGtONL5JN5qANeSi/j9tSGVpc7Sdn
         1v0tG7f9k6FkTcqZ0tUEFdTeRKAtk3ke0wlP6bzzaYFHERbVSOsfZQAmYv/PB1naRuNQ
         2Xbuhj44tvzoZQ+vY++KYVgV5k+A0HyQDGIMM1Zcs+pjgFI7vs2ON7ybQaM6jRlVK7v9
         O2JMiyYaERb825V8ttIooM49n7XF2HK+JYmJrD2xdv/9M4B8rO7LfJj91Dv0mcn2Rfxi
         w5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXoL6mdTDqQfOPB8j231jWnr6MBhusVf2fG0T01OrlQLHZwNdduvEFN+BRedhX5u1ZHFIDnZyP3QP1gHLvLkZbe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7X6GbLXSPQY99vbZyaXSqDKQ00d79HAepJbVXYwy6OHxiYZ/W
	ii/hDKbZtLjfccvSz9PmImMYylrqQoGTBxF+lgHIboVcgabDHS5HII5fHtw0gN/5qQ==
X-Gm-Gg: ATEYQzwjuyR0KOmRJLsSgQI3BmGJZe9haAOiC6CQnGU8hw17F6zLTpJVbXyzCYmXlxs
	b85RTAPWYpbvxzKW9NvKplKJSuFTZBcFeNuvQKxIoVt7qpIgYmk4k8vwDh2dXWS+EjQst8ho9c8
	81mYglD1AdsEqr58lQKhsKkSnWbFfxHE9HyzzrP4yms1lNsJBN7peYOOsa/WLIFs76xzWvWzk5t
	r8YasrGe6jpOD97kssbMya1cFquI4vCxVFNE65EX5HsiyWerMxU4Wc0diC7k5DV2MbxMT4Ebuvi
	aEkGkB0+HpnV5Kb1/REGHXJP58XitgfIHnhpunbd5lraLJD5XqUxdlOmEQKmbQUyMo9yxo+1hyg
	NdaowIHmAhPqwynwaufE/VM9gIVLklPORS9ryzhlQ0lcyTbSWOKfGx30INbyTkvxLBKPee/hwrV
	IqhDUzuoYpW8A8MxLWUgeEn796+PSVX/4gDiFhLTChhOLXNChGV16YAjmwj5NMbwd/Eyg=
X-Received: by 2002:a05:600c:1f86:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-486fedb551dmr229517615e9.10.1774349973232;
        Tue, 24 Mar 2026 03:59:33 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871102369fsm24686505e9.6.2026.03.24.03.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:59:32 -0700 (PDT)
Date: Tue, 24 Mar 2026 10:59:29 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com,
	dbrazdil@google.com, joey.gouly@arm.com, kees@kernel.org,
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org,
	perlarsen@google.com, qperret@google.com, rananta@google.com,
	smostafa@google.com, suzuki.poulose@arm.com, tabba@google.com,
	tglx@kernel.org, bgrzesik@google.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH 03/14] KVM: arm64: Support host MMIO trap handlers for
 unmapped devices
Message-ID: <acJukVJzZJEoPEyE@google.com>
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-4-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310124933.830025-4-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_035935_795792_81E67279 
X-CRM114-Status: GOOD (  25.74  )
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

On Tue, Mar 10, 2026 at 12:49:22PM +0000, Sebastian Ene wrote:
> Introduce a mechanism to register callbacks for MMIO accesses to regions
> unmapped from the host Stage-2 page tables.
> 
> This infrastructure allows the hypervisor to intercept host accesses to
> protected or emulated devices. When a Stage-2 fault occurs on a
> registered device region, the hypervisor will invoke the associated
> callback to emulate the access.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/include/asm/kvm_arm.h      |  3 ++
>  arch/arm64/include/asm/kvm_pkvm.h     |  6 ++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 41 +++++++++++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/setup.c       |  3 ++
>  4 files changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> index 3f9233b5a130..8fe1e80ab3f4 100644
> --- a/arch/arm64/include/asm/kvm_arm.h
> +++ b/arch/arm64/include/asm/kvm_arm.h
> @@ -304,6 +304,9 @@
>  
>  /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
>  #define HPFAR_MASK	(~UL(0xf))
> +
> +#define FAR_MASK	GENMASK_ULL(11, 0)
> +
>  /*
>   * We have
>   *	PAR	[PA_Shift - 1	: 12] = PA	[PA_Shift - 1 : 12]
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 48ec7d519399..5321ced2f50a 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -19,9 +19,15 @@
>  
>  #define PKVM_PROTECTED_REGS_NUM	8
>  
> +struct pkvm_protected_reg;
> +
> +typedef void (pkvm_emulate_handler)(struct pkvm_protected_reg *region, u64 offset, bool write,
> +				    u64 *reg, u8 reg_size);
> +
>  struct pkvm_protected_reg {
>  	u64 start_pfn;
>  	size_t num_pages;
> +	pkvm_emulate_handler *cb;
>  };
>  
>  extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 7c125836b533..f405d2fbd88f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -13,6 +13,7 @@
>  #include <asm/stage2_pgtable.h>
>  
>  #include <hyp/fault.h>
> +#include <hyp/adjust_pc.h>
>  
>  #include <nvhe/gfp.h>
>  #include <nvhe/memory.h>
> @@ -608,6 +609,41 @@ static int host_stage2_idmap(u64 addr)
>  	return ret;
>  }
>  
> +static bool handle_host_mmio_trap(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
> +{
> +	u64 offset, reg_value = 0, start, end;
> +	u8 reg_size, reg_index;
> +	bool write;
> +	int i;
> +
> +	for (i = 0; i < num_protected_reg; i++) {

This is potentially slow for a fast path. As this is an array, we could sort it
and do a binary search, just like find_mem_range?

> +		start = pkvm_protected_regs[i].start_pfn << PAGE_SHIFT;
> +		end = start + (pkvm_protected_regs[i].num_pages << PAGE_SHIFT);
> +
> +		if (start > addr || addr > end)
> +			continue;
> +
> +		reg_size = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
> +		reg_index = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
> +		write = (esr & ESR_ELx_WNR) == ESR_ELx_WNR;
> +		offset = addr - start;
> +
> +		if (write)
> +			reg_value = host_ctxt->regs.regs[reg_index];
> +
> +		pkvm_protected_regs[i].cb(&pkvm_protected_regs[i], offset, write,
> +					  &reg_value, reg_size);
> +
> +		if (!write)
> +			host_ctxt->regs.regs[reg_index] = reg_value;
> +
> +		kvm_skip_host_instr();
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
>  {
>  	struct kvm_vcpu_fault_info fault;
> @@ -630,6 +666,11 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
>  	 */
>  	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
>  	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
> +	addr |= fault.far_el2 & FAR_MASK;
> +
> +	if (ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW && !addr_is_memory(addr) &&
> +	    handle_host_mmio_trap(host_ctxt, esr, addr))
> +		return;
>  
>  	ret = host_stage2_idmap(addr);
>  	BUG_ON(ret && ret != -EAGAIN);
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index ad5b96085e1b..f91dfebe9980 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -296,6 +296,9 @@ static int unmap_protected_regions(void)
>  			if (ret)
>  				goto err_setup;
>  		}
> +
> +		if (reg->cb)
> +			reg->cb = kern_hyp_va(reg->cb);
>  	}
>  
>  	return 0;
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

