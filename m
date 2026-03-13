Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12DB105F782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOSC1f3aHBzCl3KK3hWG1+INGM76umo/dTgcpAX5870=; b=Lej0H8Ygzrg8WMReM+cENc+bYl
	fIRoH1A4w25erNFzTRZGQ+Trvu2uKVauGxbap7WVcV3SwebSdgMIGwCGvp3UxsGBq1CxfA4UMXkKV
	P95vUy68J0KgDLKKsDnPe6iuSTffxyG9rxzqQYCjYm+L9pTQp9YpTYabuaj7NqylVYDOuXsJUbxm7
	6FZo4vRGCKu9honaXzVbOOCxxrhBEhDtBexlnKXD16vzSFZF8xit+ZjuEk29YkYPmZE2KXXFznWt2
	whNf1901O0fQttbuKqV7NSaVdyMItAzRD6IRXSjvkND0hl3p/ffL8+bbEmpbX6EfovuPlB1sg01kS
	wBYo0ADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ysK-0000000HORv-0YJ5;
	Fri, 13 Mar 2026 09:32:08 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ysH-0000000HORT-42Aj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:32:07 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-509062d829dso355611cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773394325; cv=none;
        d=google.com; s=arc-20240605;
        b=kFfwXt18Yc8RhGXPB5UOSqlDCA4uETa3DEV1Ao55dPdq8utv10jsR5GAOK844W+BnX
         C2sf+MQVEuuOm292SfAenw9qXBI0nthPYYI6dVmegu4Nl82PwlYO9LOvKzQoh/v1/PsX
         Dakb763gi0n6XqFcTX7rqyiHCMP5qdJioW23XEExdRb+xNhg33xlh/cHS42xIK16ry+o
         ThnmCI6XZ1+anzmBFZJsoPzLfHH9KDSBYvG0CeZOKlyqzOwtg7fX5eXbNIwz05jaGEFA
         lSbQT8cUtdIvQKuNziULV5+aPweGvQchVroQUdSWeFOGdtPiX0Gz1m+SkKdCjPoL6vMa
         /FIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UOSC1f3aHBzCl3KK3hWG1+INGM76umo/dTgcpAX5870=;
        fh=YfUHHLUbbHQUuk3IsMbNQ7QYTGPdf/VUnhAPwvXnxHk=;
        b=d+F2HInN0pyUw/t5AL6ukYMZu05NhtNMB1ZjssGraoufjFwI4EQy3w6cPNrUery0+r
         OR6DkbuEpx2Jc/ZdGsX3ugnGmoyrff3m142bG0ie88iww8TFiKwSc7zOTJBExT8i4GKE
         nUMCIe6oQR5/PVFBxhzlUackaavBCPr7VUkjsow2ELs7XErtuZlyl0qWLCd1KFLk6Qwf
         FNZEWrRbqtxGJvToiDFJC1qkreUhdTe3UO9iVxBXzAc/sg0oGikKHRgKg6lgKcqP+nM3
         0pgCD27e8kiiY8MdpbO28qzfFTfh0XGKsOf7vo/jd+ukCfhEaHlZOy6hSLR+rJIg5okL
         nEXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773394325; x=1773999125; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOSC1f3aHBzCl3KK3hWG1+INGM76umo/dTgcpAX5870=;
        b=GqaEAOa7/oXPS8My7FuLD8N4nMjDSuy7JVtzSK/M+q5tgQtShx9TEOgrrG/w8+73vh
         VRJ+G1A+hUCUPzjsnEHOR8cgz3QG+SLnH0VHpkmYE24XZcah3UI1W7AvjOvbDtGZssX1
         x1k1xyDfM6PsiLeFu5kNVrp9YVnpffIhLjogmlCoYzpd5FoTuwNzfYeONVq43FBCGjoF
         TZnsVM3SSYlaX/I3iCTVGdhJjmSKhgyqcmTDNLjpgQxq/2wjiROroPRwLsgQvEgdYWI7
         Ah302Np8llyejueUR5mLZ507rkL6enaC4tt6T3SGleoE1wLOoYQ2AobVK/QqL7D2rEvz
         MK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394325; x=1773999125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOSC1f3aHBzCl3KK3hWG1+INGM76umo/dTgcpAX5870=;
        b=VkNq6PmjzjAxgah4AdxAxiD/5SPPM5JbeCmlfWu3kBd2cowHzqEz4SPs+EDo1uuT37
         CjtH95Es1tr1WlbDHhtX/uYAqIIXaiad9YV95nSBxbnYMLDakWa8aHQ6ZkR8QcVg1ErH
         BeW0oOj97gwjJwfYGRmFJEhXiB3C/VaDTLcfrnDCYQ3/E5hLoZ2K+nBnO74XIBd3y7RF
         JfsvheD96AVcZNYZzsWInfEIw1H8RuR6A9dngah9xPMMIdahTHPhJ2RC4rLeihHs6XGz
         3t6Ov50OekOY3KdBqrys+ukg5w7F1cD4LeyN559lsS3x8/YLjoM0WdEEUOiBN23uZYOz
         aNfg==
X-Forwarded-Encrypted: i=1; AJvYcCU7JXzuxylg98w/VwCU5zoJWycWieTbPVpROsvzQjfpr6dqZo5O975kxys87YrRm1GhdZmjrkaTnln0NMdwAC0G@lists.infradead.org
X-Gm-Message-State: AOJu0YxEoQEOHEiE/jujvp8TSzB/1h7wbT5h50QGY/A1WfvTqSXUC16Z
	ASB/1QHxEGPzEEV9LQiKZYl/3C25nsY8YmIagFlJyOVWpVh2i/eRIFDiIZOodnDI6TW5OtFVYcS
	f7ebpfbIOY2ANatXBvMKrDTtk6jfKL2bNVOGL+Dpd
X-Gm-Gg: ATEYQzzgWP/SbWaTabn79prllHWeALmJ8N3xfHsOK2HPkvhZedKZDoonUdnu1wxPoAy
	OGqBY0uRlhqgZeUHxhkysFZ0lmTp1QaqXm8tyPXe7JBTDnE1/LWFYIHQkaVwpTOyq3iOMgAZQVU
	ApX8l6nR82A0CJttQYZ1h0m/oH9wpuYrphfUJTxB0g6FF6vH76u6jiu7DM+C/6lxOncYuSisB/9
	x6KdPbYEu+Nl5/IGjxIXLO3wwkKdVHS7Ko94ipNsvdAT/y/GvF7K2dxmKCkQmhnpgB2N1aA9wka
	UjqLbHlc
X-Received: by 2002:a05:622a:58c:b0:506:9852:75ec with SMTP id
 d75a77b69052e-50959e1d20cmr8802451cf.9.1773394323400; Fri, 13 Mar 2026
 02:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com> <20260310124933.830025-4-sebastianene@google.com>
In-Reply-To: <20260310124933.830025-4-sebastianene@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 13 Mar 2026 09:31:26 +0000
X-Gm-Features: AaiRm52JQRQHUrF8B2xDdFYmIZIopGCFBBCbq9bfvHcEIXMaU79zPtGVGBpWS1U
Message-ID: <CA+EHjTysM_02QHLOwKAnAA-uOFwC2GKezaMxyHyt365j8FR_ig@mail.gmail.com>
Subject: Re: [PATCH 03/14] KVM: arm64: Support host MMIO trap handlers for
 unmapped devices
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
X-CRM114-CacheID: sfid-20260313_023206_027338_CD557D53 
X-CRM114-Status: GOOD (  30.98  )
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
>  #define HPFAR_MASK     (~UL(0xf))
> +
> +#define FAR_MASK       GENMASK_ULL(11, 0)
> +
>  /*
>   * We have
>   *     PAR     [PA_Shift - 1   : 12] = PA      [PA_Shift - 1 : 12]
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 48ec7d519399..5321ced2f50a 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -19,9 +19,15 @@
>
>  #define PKVM_PROTECTED_REGS_NUM        8
>
> +struct pkvm_protected_reg;
> +
> +typedef void (pkvm_emulate_handler)(struct pkvm_protected_reg *region, u64 offset, bool write,
> +                                   u64 *reg, u8 reg_size);
> +
>  struct pkvm_protected_reg {
>         u64 start_pfn;
>         size_t num_pages;
> +       pkvm_emulate_handler *cb;
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

Please sort includes alphabetically.

>
>  #include <nvhe/gfp.h>
>  #include <nvhe/memory.h>
> @@ -608,6 +609,41 @@ static int host_stage2_idmap(u64 addr)
>         return ret;
>  }
>
> +static bool handle_host_mmio_trap(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
> +{
> +       u64 offset, reg_value = 0, start, end;
> +       u8 reg_size, reg_index;
> +       bool write;
> +       int i;

What do you plan to do if there is no valid syndrome, i.e.,
ESR_EL2.ISV == 0? I am still reviewing, so maybe this is solved in a
future patch, or maybe you know that, in practice, all instructions
would have a valid syndrome. Regardless of which it is, you should
definitely add the following check to _this_ patch (or reconsider the
approach if it is possible to get legit accesses with ESR_EL2.ISV ==
0):

+      if (!(esr & ESR_ELx_ISV))
+              return false;

> +
> +       for (i = 0; i < num_protected_reg; i++) {
> +               start = pkvm_protected_regs[i].start_pfn << PAGE_SHIFT;
> +               end = start + (pkvm_protected_regs[i].num_pages << PAGE_SHIFT);
> +
> +               if (start > addr || addr > end)

Because end is calculated by adding the size, it represents the first
byte after the region, so this should be:
+               if (start > addr || addr >= end)
> +                       continue;

You also need to make sure that the entire access fits within the
protected region, to avoid a malicious or misaligned cross-boundary
access, i.e.:

+                if (addr + reg_size > end)
+                        return false;


> +               reg_size = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
> +               reg_index = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
> +               write = (esr & ESR_ELx_WNR) == ESR_ELx_WNR;
> +               offset = addr - start;
> +
> +               if (write)
> +                       reg_value = host_ctxt->regs.regs[reg_index];

You need to handle the zero register (index 31) for writes, e.g.:
+                       reg_value = (reg_index == 31) ? 0 :
host_ctxt->regs.regs[reg_index];

> +
> +               pkvm_protected_regs[i].cb(&pkvm_protected_regs[i], offset, write,
> +                                         &reg_value, reg_size);
> +
> +               if (!write)
> +                       host_ctxt->regs.regs[reg_index] = reg_value;

and for reads:
+               if (!write & reg_index != 31)

Cheers,
/fuad

> +
> +               kvm_skip_host_instr();
> +               return true;
> +       }
> +
> +       return false;
> +}
> +
>  void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
>  {
>         struct kvm_vcpu_fault_info fault;
> @@ -630,6 +666,11 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
>          */
>         BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
>         addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
> +       addr |= fault.far_el2 & FAR_MASK;
> +
> +       if (ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW && !addr_is_memory(addr) &&
> +           handle_host_mmio_trap(host_ctxt, esr, addr))
> +               return;
>
>         ret = host_stage2_idmap(addr);
>         BUG_ON(ret && ret != -EAGAIN);
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index ad5b96085e1b..f91dfebe9980 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -296,6 +296,9 @@ static int unmap_protected_regions(void)
>                         if (ret)
>                                 goto err_setup;
>                 }
> +
> +               if (reg->cb)
> +                       reg->cb = kern_hyp_va(reg->cb);
>         }
>
>         return 0;
> --
> 2.53.0.473.g4a7958ca14-goog
>

