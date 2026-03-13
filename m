Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB5105F789
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Zi9Teres6TyTinVCJu3uRJepi8Sum75aWEQVAXIcW0=; b=sp8oaFlDJUyO1rD0zTZiCRv9kT
	Tg6/3iHBhK6ItAmml6LFaVBxh2GWSy87U5OyhwGwYK6jde5iPuJYRtA4m82FizakPqZ+vyVXcvr8j
	JtUdOk5DUAuAwu81cSLNxNrq2pE/lBduruVMSmeo07/26EE7cVrQwZwy9fvDrKxKKb9AHs5I+HgQ8
	zG+21a4seFlLMmXSFkwLhlGcrHs4tJQxBK0kXsxSb11INkaSeVUtnSahi1YGdO1L9ZF+08USkGpgi
	rYZFlhpWwdjM0tw62FL1d9yGVD9wduckeWlV3Jn3PGZyLKbh2+KifPFlHcC9njvreSSljSnUTBeJJ
	uvIsCMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zI5-0000000HSnM-00Rq;
	Fri, 13 Mar 2026 09:58:45 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zI2-0000000HSmh-2Juv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:58:43 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-50906a98ffeso463021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773395921; cv=none;
        d=google.com; s=arc-20240605;
        b=AKxJQVqxX2iVLOXqgyMqv2bstRwYTPGjbt3pDhjVnHFdqEQhOBRTmpGYO5sYHOhILB
         noD2Yfez+5b8y0u5o+VueoQ7U1+Ha4FdBxuGXd+hxFHCBSXWR9K4UGA3v/6787srUn8A
         dj8AMGxB5N/iNjf3LTrQ4eNVRDTzH+cxApz8utzNLJeY+LSpP2OH4S42ou/k105OiWBN
         9PBOEK38i28gzl98InZXucBhv/5Qv4QvuUcIGpG+GpeVC1LIW31eL2lcB2yxcpTv887u
         vKvpqf7APAP2iQBl3JIeeJMd+SgVwYVhjEiRNyiHUyLhiZgm4w1hI9Svg+tJ2BMx6aD1
         yB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5Zi9Teres6TyTinVCJu3uRJepi8Sum75aWEQVAXIcW0=;
        fh=CskD7wxEcXcjTyXE+ePEfTSWii7FppSgdQ/0J2U9Vk0=;
        b=NNVCgRUKRT5J5DtWiaVtwDZ6hGRCndTUka3Qcb4mtwZXzr/7X3S0qk8DYoWR0Ft3LR
         u1TjXtT6i+YbtJfnA4uH+yHulPb9E99uV6BvlIvLONWDs0ErQ8L1OVSdVPwZbHTWoJoN
         iLyjyZPlSq3i+WHXEDrRnP77f5t10CN65bLdnCmviitGzSAO5+dnK82uEyxDzsNJ85tR
         1PMC2ik0xOubq1aaYIVbbkfMzGCYwB3in4+QTjZselrUJosYLSLyko91hE/hbDIUZqIf
         CE+URbfp4/dDd4ybxHf1XWARBnMkK+3AH2OAih38R+KoIz+847sEiARKSrbNq0KLd55n
         gpFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773395921; x=1774000721; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zi9Teres6TyTinVCJu3uRJepi8Sum75aWEQVAXIcW0=;
        b=uiqQIGyo560J58wW1J4FiZgG6llo9Quthw9NmkpW9Wjedrgc2oAJtqlWeHREP4BjyS
         nOjCwmA3/qa+kB8Y1UKFzo5QYOym/gDiIC+lLZhHaM5ukJdQWY9AeA6NWuvKvuYwvrhI
         E02pkNtOyR18hF8I454yVED61znkZcYwmRao6+sQanZijRZxhwJwPhhRFN0FEAgZwJXF
         e1RcREq11rCuGopISeTw5tZdkMzW1yNTKqBLn6deW41iLognd9gXRObP9d9dmQGgQtYn
         Zz7WcvcHwcO+lKh7YZW9UCQkkg3tLDzwPdDkyBxDMX/E5AupAKCP9RDltwcfmaR06rVA
         iKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395921; x=1774000721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Zi9Teres6TyTinVCJu3uRJepi8Sum75aWEQVAXIcW0=;
        b=RmRV6+9l39O7+yinaWFUiu/8xt7hJDOtx5L/If8Ur81T43FBy1VrQPwtuTliogM691
         nZQma78XA4bje1rkn5IObihG4NQdhpA5xgv05f/KlYPC+WFsgMXDQvHGXsU+vvdhlRia
         +upsB1tQHERsWcXMtv50qb1FrkLPOAnYVuaObYsjOGAeMGxNq+G1LNJF5uVUYOoXR+pA
         u7Wd/fKMTnVSYHKvqTri35PZqMFuEaWKr/5HdxCe9HHtBtAJBFp2hL5IUobnTx0co24/
         XwB6Uf+PpYGJvjLHH4u6ZHG4a8aioHl/O57M1LN8cX56piTeEfcSqfmjU7KFCyOu3KEi
         VHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMElhaOefdpIktM/+kGujQiVUeWXc2nl0QWC3wzh5NXd+QVmyU5jszluphHz3H0LSVpjeMUpCaakfn+aOwP0JU@lists.infradead.org
X-Gm-Message-State: AOJu0YxD65EXLEMcfA2H1j/acFkHvXj+SMhNqOuYGci/zVMBqPG6Vy8k
	sR7w0xv20QStyL+292x/5ZMsq0MsJKjUWMROtno/vsDDunr00kWd1XDzr8FCkRrkJ4SsH1zAbKZ
	OFT3XPDs8bMtOdrm5SjVqhJGJOUpBg7ANM1PvaoBAH09EyfSbSRstuW28vlE=
X-Gm-Gg: ATEYQzzTa9xi5ylUtwfhT1FbmcpwsJ0hrLQk+gQaTdbI0KRYzwj4NwelWNHX0Ohmyl1
	YW0T4LEgmdmVcJwV10CnVgCs9IwYyjMSQKlDVmrljFWFsDqqo56kHpwKmgbyaDGYwqezYw7ck3n
	t4XmgGIB2GY5hDpBajPuELjmCNC3nDbg0zHULy13m+j3gFmQJSjM/7sR2VD5/HuhI1ZKCvoDmVb
	ExexAVTnQlqGVZnB09n5OIIzH9+u65qlY8dzwJjktF8/vpLMbfBOrxnfdGuolLfNLBDInBcRHi6
	5rhevuDT
X-Received: by 2002:ac8:5ac8:0:b0:509:371:f2ab with SMTP id
 d75a77b69052e-5095851ed70mr5086341cf.16.1773395920808; Fri, 13 Mar 2026
 02:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com> <20260310124933.830025-5-sebastianene@google.com>
In-Reply-To: <20260310124933.830025-5-sebastianene@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 13 Mar 2026 09:58:04 +0000
X-Gm-Features: AaiRm51S-lJNKL8bzKDy45ZPYAUg9APbPHuSXLIrmBlxQacQriUWkT4k6Q18few
Message-ID: <CA+EHjTy9uG4OOw10OoX45A6Bxnb1PssB9mDdSa=H42Ho0AtQRw@mail.gmail.com>
Subject: Re: [PATCH 04/14] KVM: arm64: Mediate host access to GIC/ITS MMIO via unmapping
To: Sebastian Ene <sebastianene@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, catalin.marinas@arm.com, dbrazdil@google.com, 
	joey.gouly@arm.com, kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, 
	oupton@kernel.org, perlarsen@google.com, qperret@google.com, 
	rananta@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_025842_610649_C4CA2CCF 
X-CRM114-Status: GOOD (  32.74  )
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

Hi Sebastian,

On Tue, 10 Mar 2026 at 12:49, Sebastian Ene <sebastianene@google.com> wrote:
>
> Unmap the ITS MMIO region from the host address space to enforce
> hypervisor mediation.
> Identify the ITS base address from the device tree and store it in a
> protected region. A callback is registered to handle host accesses to
> this region; currently, the handler simply forwards all MMIO requests
> to the physical hardware. This provides the infrastructure for future
> hardware state validation without changing current behavior.
>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/include/asm/kvm_pkvm.h     |  2 ++
>  arch/arm64/kvm/hyp/nvhe/Makefile      |  3 ++-
>  arch/arm64/kvm/hyp/nvhe/its_emulate.c | 23 ++++++++++++++++
>  arch/arm64/kvm/pkvm.c                 | 38 +++++++++++++++++++++++++++
>  4 files changed, 65 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/kvm/hyp/nvhe/its_emulate.c
>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 5321ced2f50a..ef00c1bf7d00 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -32,6 +32,8 @@ struct pkvm_protected_reg {
>
>  extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
>  extern unsigned int kvm_nvhe_sym(num_protected_reg);
> +extern void kvm_nvhe_sym(pkvm_handle_forward_req)(struct pkvm_protected_reg *region, u64 offset,
> +                                                 bool write, u64 *reg, u8 reg_size);
>
>  int pkvm_init_host_vm(struct kvm *kvm);
>  int pkvm_create_hyp_vm(struct kvm *kvm);
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index a244ec25f8c5..eb43269fbac2 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
>
>  hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
>          hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
> -        cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
> +        cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
> +        its_emulate.o
>  hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
>          ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
>  hyp-obj-y += ../../../kernel/smccc-call.o
> diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> new file mode 100644
> index 000000000000..0eecbb011898
> --- /dev/null
> +++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/kvm_pkvm.h>
> +#include <nvhe/mem_protect.h>
> +
> +
> +void pkvm_handle_forward_req(struct pkvm_protected_reg *region, u64 offset, bool write,
> +                            u64 *reg, u8 reg_size)
> +{
> +       void __iomem *addr = __hyp_va((region->start_pfn << PAGE_SHIFT) + offset);

Better use the macros to do this:
+       void __iomem *addr = __hyp_va(PFN_PHYS(region->start_pfn) + offset);

Also, considering all the potential issues with hyp_va, it might be
better to store the virtual address in pkvm_protected_regs (void
__iomem *base_va) assigned to the MMIO region at the time it was
successfully mapped into EL2, rather than recalculating it on the fly.

> +
> +       if (reg_size == sizeof(u32)) {
> +               if (!write)
> +                       *reg = readl_relaxed(addr);
> +               else
> +                       writel_relaxed(*reg, addr);
> +       } else if (reg_size == sizeof(u64)) {
> +               if (!write)
> +                       *reg = readq_relaxed(addr);
> +               else
> +                       writeq_relaxed(*reg, addr);
> +       }

The spec permits 8-bit, 16-bit, 32-bit, and 64-bit accesses depending
on the specific register. This only checks for sizeof(u32) and
sizeof(u64). You should either handle them, or you intentionally
wanted to block 8-bit/16-bit accesses, then you must explicitly inject
a synchronous abort back to the host.

Also, I think that using `readl_relaxed` and `writel_relaxed` is
technically correct for pure passthrough, as it assumes the host
driver issued the necessary barriers before triggering the trap.
However, with memory barriers I am always a bit wary, and I'd rather
we check with someone to confirm whether this is ok, i.e., Will
Deacon.

> +}
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index d7a0f69a9982..a766be6de735 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -11,6 +11,9 @@
>  #include <asm/kvm_mmu.h>
>  #include <linux/memblock.h>
>  #include <linux/mutex.h>
> +#include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
>
>  #include <asm/kvm_pkvm.h>
>
> @@ -18,6 +21,7 @@
>
>  DEFINE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
>
> +static struct pkvm_protected_reg *pkvm_protected_regs = kvm_nvhe_sym(pkvm_protected_regs);
>  static struct memblock_region *hyp_memory = kvm_nvhe_sym(hyp_memory);
>  static unsigned int *hyp_memblock_nr_ptr = &kvm_nvhe_sym(hyp_memblock_nr);
>
> @@ -39,6 +43,34 @@ static int __init register_memblock_regions(void)
>         return 0;
>  }
>
> +static int __init register_protected_regions(void)
> +{
> +       int i = 0, ret;
> +       struct device_node *np;
> +       struct resource res;

Prefer reverse Christmas tree declaration order.

> +
> +       for_each_compatible_node(np, NULL, "arm,gic-v3-its") {
> +               ret = of_address_to_resource(np, i, &res);
> +               if (ret)
> +                       return ret;
> +
> +               if (i >= PKVM_PROTECTED_REGS_NUM)
> +                       return -ENOMEM;
> +
> +               if (!PAGE_ALIGNED(res.start) || !PAGE_ALIGNED(resource_size(&res)))
> +                       return -EINVAL;
> +
> +               pkvm_protected_regs[i].start_pfn = res.start >> PAGE_SHIFT;

and this:
... PHYS_PFN(res.start);


> +               pkvm_protected_regs[i].num_pages = resource_size(&res) >> PAGE_SHIFT;

and this:
... PFN_DOWN(resource_size(&res));

Cheers,
/fuad

> +               pkvm_protected_regs[i].cb = lm_alias(&kvm_nvhe_sym(pkvm_handle_forward_req));
> +               i++;
> +       }
> +
> +       kvm_nvhe_sym(num_protected_reg) = i;
> +
> +       return 0;
> +}
> +
>  void __init kvm_hyp_reserve(void)
>  {
>         u64 hyp_mem_pages = 0;
> @@ -57,6 +89,12 @@ void __init kvm_hyp_reserve(void)
>                 return;
>         }
>
> +       ret = register_protected_regions();
> +       if (ret) {
> +               kvm_err("Failed to register protected reg: %d\n", ret);
> +               return;
> +       }
> +
>         hyp_mem_pages += hyp_s1_pgtable_pages();
>         hyp_mem_pages += host_s2_pgtable_pages();
>         hyp_mem_pages += hyp_vm_table_pages();
> --
> 2.53.0.473.g4a7958ca14-goog
>

