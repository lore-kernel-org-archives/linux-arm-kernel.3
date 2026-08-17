Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B9EC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsP6Tc38zfRk1ICic3b/g7i6fexiTP8WcwXduocKHhI=; b=uhh6grs8A8LkPBsNvuEcR30/xd
	kpEdZTcFq2A3+CpF+51/o85XUF7XOveUpOzdnwMihbEdASP43UcAUdxlYGZ9JzI5qN04RhJoyQZiv
	DhfxWvwVuexN/BDt0BztTPiCDTHiBd+9Y5j+qrAI0FAKTQgS4Q3l5hrWhIjF+sgsRHza79sdgjrlX
	p55BjCyNesvqTLtLJGVPAfKiHgBhWElWqIPEovx9KxsVYLyNaLtrZIpf8Pn/noD9X66PIqxX/y8bs
	iDnyCk2azD04XSuffL7BT38Dxk5nM2FiM6Vk8pYQxFwoe+ahKgIbu6gVCn8Ak21/o4VS9m2/c81IG
	6/TiSHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvy8P-00000006HVq-12nR;
	Mon, 17 Aug 2026 14:16:17 +0000
Received: from out-91.mta0.migadu.com ([2001:41d0:1004:224b::5b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvy8M-00000006HU1-001q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 14:16:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=T8iyjbuVYAvqUViUhRvKQj8eKQSB1E/dq1wYQtEhFKo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786976171; v=1; x=1787580971;
 b=H64DYZL+VtDNMmcEzRbntV/LAawULPIsRQCDV8uLxs6jQmlpLx1Ram226usPE9MiHYe8fr72
 pLAVMQVmQsqRT7WRWyibxHpep4PhMiVWyepYtWDtgoTZII1RViC+zJlNaNJ97DwVMLjYVevfC7D
 WiO0pw2YPLtoWJNEvp3dPtXk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f54.google.com (209.85.167.54)
	by smtp.migadu.com with ESMTPS id 5b54f67ad1af9138;
	Mon, 17 Aug 2026 14:16:11 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so3569e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 07:16:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpv4Epceigs+6LI8XYyOa5LK7H2k5uYl9lu8ZJhb+xfUv6SrydUoDax+birSkjJ6ctpMjag35oEpjRaxlTFs7i7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0IYJ0M1lCrjR+MNUlDKUANEnRV2bmkGhcIOx2rPy8Zvn5khfm
	l4u+BdwPtRM747ptgVRcz08Gg+9D2+qg+AZPH4XrRaFCCZwauNCiH8hUnnyJtU2KHxnCo6VILM8
	fKed/TmFKLeaOC38WGunhafIBM2yHhq4M+gtuYLJS
X-Received: by 2002:a05:6512:3d1c:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b47084ad85mr12150e87.9.1786976170444; Mon, 17 Aug 2026
 07:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com> <20260731143541.956291-18-vdonnefort@google.com>
In-Reply-To: <20260731143541.956291-18-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 17 Aug 2026 15:16:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzGbZnz_SdcMvVwwDTTyHbyjAwukK-A90z2oVJtaBGz3g@mail.gmail.com>
X-Gm-Features: AcwNN1XTayorjSSf4W1Pr0n-dJNWHXveErqutMBS45AHvtcEguOem3CyW-EXrec
Message-ID: <CA+EHjTzGbZnz_SdcMvVwwDTTyHbyjAwukK-A90z2oVJtaBGz3g@mail.gmail.com>
Subject: Re: [PATCH v4 17/17] KVM: arm64: Alloc simple_buffer_page using pKVM
 hyp allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_071614_880741_07C4EF4C 
X-CRM114-Status: GOOD (  23.50  )
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

On Fri, 31 Jul 2026 at 15:36, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> In protected mode, transition the allocation of the simple_ring_buffer
> structures from the host to the hypervisor using the new pKVM heap
> allocator.
>
> Previously, the host allocated and donated a contiguous backing memory
> for these structures. In pKVM the hypervisor can now allocate them
> dynamically.
>
> Use the pkvm_call_hyp_req() wrapper in the host to invoke
> __tracing_load, which automatically handles any top-up requests if the
> hypervisor runs out of heap memory during allocation.
>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>


Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 9bab1e802281..ec5bb8541ceb 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -750,7 +750,7 @@ static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
>         DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
>         DECLARE_REG(size_t, desc_size, host_ctxt, 2);
>
> -       cpu_reg(host_ctxt, 1) = __tracing_load(desc_hva, desc_size);
> +       errno_to_smccc(__tracing_load(desc_hva, desc_size), host_ctxt);
>  }
>
>  static void handle___tracing_unload(struct kvm_cpu_context *host_ctxt)
> diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> index 96afa3d6de2f..5ff19d210508 100644
> --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> @@ -4,6 +4,7 @@
>   * Author: Vincent Donnefort <vdonnefort@google.com>
>   */
>
> +#include <nvhe/alloc.h>
>  #include <nvhe/clock.h>
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/mm.h>
> @@ -62,18 +63,34 @@ static void __release_host_mem(void *start, u64 size)
>         WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(start), size >> PAGE_SHIFT));
>  }
>
> -static int hyp_trace_buffer_load_bpage_backing(struct hyp_trace_buffer *trace_buffer,
> -                                              struct hyp_trace_desc *desc)
> +static int hyp_trace_buffer_alloc_bpages(struct hyp_trace_buffer *trace_buffer,
> +                                        struct hyp_trace_desc *desc)
>  {
> -       void *start = (void *)kern_hyp_va(desc->bpages_backing_start);
> -       size_t size = desc->bpages_backing_size;
> +       void *start;
> +       size_t size;
>         int ret;
>
> -       ret = __admit_host_mem(start, size);
> -       if (ret)
> -               return ret;
> +       if (is_protected_kvm_enabled()) {
> +               struct ring_buffer_desc *rb_desc;
> +               int cpu;
>
> -       memset(start, 0, size);
> +               size = 0;
> +               for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc)
> +                       size += rb_desc->nr_page_va * sizeof(struct simple_buffer_page);
> +
> +               start = hyp_alloc(size);
> +               if (!start)
> +                       return hyp_alloc_errno();
> +       } else {
> +               start = (void *)kern_hyp_va(desc->bpages_backing_start);
> +               size = desc->bpages_backing_size;
> +
> +               ret = __admit_host_mem(start, size);
> +               if (ret)
> +                       return ret;
> +
> +               memset(start, 0, size);
> +       }
>
>         trace_buffer->bpages_backing_start = start;
>         trace_buffer->bpages_backing_size = size;
> @@ -81,7 +98,7 @@ static int hyp_trace_buffer_load_bpage_backing(struct hyp_trace_buffer *trace_bu
>         return 0;
>  }
>
> -static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace_buffer)
> +static void hyp_trace_buffer_free_bpages(struct hyp_trace_buffer *trace_buffer)
>  {
>         void *start = trace_buffer->bpages_backing_start;
>         size_t size = trace_buffer->bpages_backing_size;
> @@ -89,9 +106,12 @@ static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace
>         if (!size)
>                 return;
>
> -       memset(start, 0, size);
> -
> -       __release_host_mem(start, size);
> +       if (is_protected_kvm_enabled()) {
> +               hyp_free(start);
> +       } else {
> +               memset(start, 0, size);
> +               __release_host_mem(start, size);
> +       }
>
>         trace_buffer->bpages_backing_start = 0;
>         trace_buffer->bpages_backing_size = 0;
> @@ -128,7 +148,7 @@ static void hyp_trace_buffer_unload(struct hyp_trace_buffer *trace_buffer)
>                 simple_ring_buffer_unload_mm(per_cpu_ptr(trace_buffer->simple_rbs, cpu),
>                                              __unpin_shared_page);
>
> -       hyp_trace_buffer_unload_bpage_backing(trace_buffer);
> +       hyp_trace_buffer_free_bpages(trace_buffer);
>  }
>
>  static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
> @@ -143,7 +163,7 @@ static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
>         if (hyp_trace_buffer_loaded(trace_buffer))
>                 return -EINVAL;
>
> -       ret = hyp_trace_buffer_load_bpage_backing(trace_buffer, desc);
> +       ret = hyp_trace_buffer_alloc_bpages(trace_buffer, desc);
>         if (ret)
>                 return ret;
>
> @@ -168,18 +188,16 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
>  {
>         struct ring_buffer_desc *rb_desc;
>         unsigned int cpu;
> -       size_t nr_bpages;
>         void *desc_end;
>
>         if (!is_protected_kvm_enabled())
>                 return true;
>
>         /*
> -        * Both desc_size and bpages_backing_size are untrusted host-provided
> -        * values. We rely on __pkvm_host_donate_hyp() to enforce their validity.
> +        * desc_size is an untrusted host-provided value. We rely on
> +        * __pkvm_host_donate_hyp() to enforce its validity.
>          */
>         desc_end = (void *)desc + desc_size;
> -       nr_bpages = desc->bpages_backing_size / sizeof(struct simple_buffer_page);
>
>         if (desc->trace_buffer_desc.nr_cpus != hyp_nr_cpus)
>                 return false;
> @@ -197,17 +215,8 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
>                 if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
>                         return false;
>
> -               /* Overflow bpages backing memory? */
> -               if (nr_bpages < rb_desc->nr_page_va)
> -                       return false;
> -
> -               if (cpu >= hyp_nr_cpus)
> -                       return false;
> -
>                 if (cpu != rb_desc->cpu)
>                         return false;
> -
> -               nr_bpages -= rb_desc->nr_page_va;
>         }
>
>         return true;
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> index 2411b4c32932..859a926c815f 100644
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -13,6 +13,7 @@
>  #include <asm/kvm_host.h>
>  #include <asm/kvm_hyptrace.h>
>  #include <asm/kvm_mmu.h>
> +#include <asm/kvm_pkvm.h>
>
>  #include "hyp_trace.h"
>
> @@ -157,10 +158,17 @@ static void __unshare_page(unsigned long va)
>
>  static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_buffer, size_t size)
>  {
> -       int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
>         size_t backing_size;
> +       int nr_bpages;
>         void *start;
>
> +       if (is_protected_kvm_enabled()) {
> +               trace_buffer->desc->bpages_backing_start = 0;
> +               trace_buffer->desc->bpages_backing_size = 0;
> +               return 0;
> +       }
> +
> +       nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
>         backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
>                                   num_possible_cpus());
>
> @@ -176,6 +184,9 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
>
>  static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
>  {
> +       if (!trace_buffer->desc->bpages_backing_start)
> +               return;
> +
>         free_pages_exact((void *)trace_buffer->desc->bpages_backing_start,
>                          trace_buffer->desc->bpages_backing_size);
>  }
> @@ -264,7 +275,7 @@ static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
>         if (ret)
>                 goto err_free_buffer;
>
> -       ret = kvm_call_hyp_nvhe(__tracing_load, (unsigned long)desc, desc_size);
> +       ret = pkvm_call_hyp_req(__tracing_load, (unsigned long)desc, desc_size);
>         if (ret)
>                 goto err_unload_pages;
>
> --
> 2.55.0.508.g3f0d502094-goog
>

