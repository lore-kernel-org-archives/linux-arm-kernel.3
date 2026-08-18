Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A53C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XLTL6BMjWLV1TgX2/NYZao1NdlRRTnrIJyxj87QpAA=; b=0lq+M8GTfuBaYmUE4C9wKlgFrL
	+87WFUQ3NjEx/ykQrnMUxrccZ49tp87MJ0oVmXF9DNP0qoqYSLXu5TtwnY5wIJXGnZl6wk3m76u3h
	NJxMAyZblpRsj9EI1G1Za0T7R0PvpNTLWUXFcsSzAEmXEXKCyeby4OCb6jiXUkwbGtZF6qR0a02I6
	DmlRI/iAKUc9ta24pBEQP1s6j8Cz9p7lFSluWDmuerEvdhFJzJb8VQ0EVcrBvHMt19RiS/eooJ/KR
	k1fM7oNRvrktITktRL+hDRwwGFBLGzHJEdeCIiO3jZ59JCa5vIly/7TKoKhy298DB1tRQSbB/FKa/
	HdM/+vqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLUj-00000008Ep8-1EHE;
	Tue, 18 Aug 2026 15:12:53 +0000
Received: from out-24.mta0.migadu.com ([2001:41d0:1004:224b::18] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLUg-00000008EoQ-2JgA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:12:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zcXaVWatLpL7/RdbQQ2WrrsyzHLPRXP+4I2Sczy5kXw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787065968; v=1; x=1787670768;
 b=ciETGmFu7bF3VQ2k9Nm3a6R5SzgHP6We0W+rxItrHIxQbRDreSjYy9Pycd9i8/VM9FxbUG+Y
 HIfULnmC9aVnfIMrs8xifiXwnqd22pw9oaSnCsDPbnMzs8y7oxMzi3y4yr19JJs/nnLaioJEapc
 Eil+h6yBEzze+Yf66OMVIgOA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f44.google.com (209.85.167.44)
	by smtp.migadu.com with ESMTPS id bed8d26a59550324;
	Tue, 18 Aug 2026 15:12:48 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so10133e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 08:12:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpqpdxk94ewH3ZT3/IoK74GlFsSQ4Ma9THoH5ehFhl+iftVXUOlrgvsbRd/+FLxjzesBVG9QTEmaeYxRKBbmrj/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0tut2hgoOoexXKDIR9/bv4ZUKsSz7CdefafNpokhrzEXL7vzv
	tNHfeDyUMg1l1E3HjoA06qpDBfemCyR9Jj3qOPDBhYJamg6ktm4qvOfTyXB1krF2q8z9iEzwqQ/
	3XSRdqOLZX0ze+Ti+biVKtOgKULFXhLXXYCWZD3zx
X-Received: by 2002:a05:6512:3043:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b471fe2eaamr248656e87.8.1787065963317; Tue, 18 Aug 2026
 08:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com> <20260731143541.956291-8-vdonnefort@google.com>
In-Reply-To: <20260731143541.956291-8-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 18 Aug 2026 16:12:07 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxaAkaRCUZde1V-Yung=nyijNiAFwMn8dhybX8bBNkWbw@mail.gmail.com>
X-Gm-Features: AcwNN1XBJdfsPYtMpm85e5PM2ifMZS2wEEeUZmdNnCoOL7mNy6DaxFfHeMlCzd8
Message-ID: <CA+EHjTxaAkaRCUZde1V-Yung=nyijNiAFwMn8dhybX8bBNkWbw@mail.gmail.com>
Subject: Re: [PATCH v4 07/17] KVM: arm64: Add PKVM_HYP_REQ_HYP_ALLOC request
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_081250_734303_B226D72B 
X-CRM114-Status: GOOD (  21.42  )
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

On Fri, 31 Jul 2026 at 15:36, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:
>
> Introduce a new pkvm_hyp_request type asking the host to top up the pKVM
> heap allocator.
>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 043495f7fc78..b77acfd7d1c8 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -89,6 +89,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
>         __KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
>
>         MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 6c2497047f8d..99daa985856f 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -17,6 +17,10 @@
>
>  #define HYP_MEMBLOCK_REGIONS 128
>
> +enum pkvm_topup_id {
> +       PKVM_TOPUP_HYP_ALLOC,
> +};
> +
>  int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
>  int pkvm_create_hyp_vm(struct kvm *kvm);
>  bool pkvm_hyp_vm_is_created(struct kvm *kvm);
> @@ -201,6 +205,7 @@ struct pkvm_mapping {
>
>  enum pkvm_hyp_req_type {
>         PKVM_HYP_NO_REQ = 0,
> +       PKVM_HYP_REQ_HYP_ALLOC,
>         __PKVM_HYP_REQ_TYPE_MAX,
>  };
>
> @@ -222,9 +227,13 @@ struct pkvm_hyp_req {
>
>  static inline size_t pkvm_hyp_req_arg_size(u8 type)
>  {
> +       struct pkvm_hyp_req *req;
> +
>         switch (type) {
>         case PKVM_HYP_NO_REQ:
>                 return 0;
> +       case PKVM_HYP_REQ_HYP_ALLOC:
> +               return sizeof(req->mem);
>         default:
>                 WARN_ON(1);
>         }
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index d3c69de698f4..439b91fc8aec 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -15,6 +15,7 @@
>  #include <asm/kvm_hypevents.h>
>  #include <asm/kvm_mmu.h>
>
> +#include <nvhe/alloc.h>
>  #include <nvhe/ffa.h>
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/mm.h>
> @@ -632,6 +633,30 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
>         cpu_reg(host_ctxt, 1) = __pkvm_finalize_teardown_vm(handle);
>  }
>
> +static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
> +       DECLARE_REG(phys_addr_t, head, host_ctxt, 2);
> +       DECLARE_REG(unsigned long, nr_pages, host_ctxt, 3);
> +       struct kvm_hyp_memcache host_mc = {
> +               .head = head,
> +               .nr_pages = nr_pages,
> +       };
> +       int ret;
> +
> +       switch (id) {
> +       case PKVM_TOPUP_HYP_ALLOC:
> +               ret = hyp_alloc_topup(&host_mc);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +       }
> +
> +       cpu_reg(host_ctxt, 1) = ret;
> +       cpu_reg(host_ctxt, 2) = host_mc.head;
> +       cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
> +}
> +
>  static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
> @@ -740,6 +765,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
>         HANDLE_FUNC(__vgic_v5_save_apr),
>         HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
> +       HANDLE_FUNC(__pkvm_hyp_topup),
>
>         HANDLE_FUNC(__pkvm_host_share_hyp),
>         HANDLE_FUNC(__pkvm_host_unshare_hyp),
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index a626978dc91f..d26e7435d34d 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -88,6 +88,33 @@ void __init kvm_hyp_reserve(void)
>                  hyp_mem_base);
>  }
>
> +static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
> +{
> +       struct kvm_hyp_memcache mc;
> +       struct arm_smccc_res res;
> +       int ret;
> +
> +       init_hyp_memcache(&mc);
> +       ret = topup_hyp_memcache(&mc, nr_pages);
> +       if (ret)
> +               goto err;
> +
> +       arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__pkvm_hyp_topup), id, mc.head,
> +                         mc.nr_pages, &res);
> +       if (WARN_ON_ONCE(res.a0 != SMCCC_RET_SUCCESS)) {
> +               ret = -EINVAL;
> +               goto err;
> +       }
> +
> +       ret = res.a1;
> +       mc.head = res.a2;
> +       mc.nr_pages = res.a3;
> +
> +err:
> +       free_hyp_memcache(&mc);
> +       return ret;
> +}
> +
>  static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
>  {
>         if (pkvm_hyp_vm_is_created(kvm)) {
> @@ -599,6 +626,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
>         int ret = -EINVAL;
>
>         switch (req->type) {
> +       case PKVM_HYP_REQ_HYP_ALLOC:
> +               ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC, req->mem.nr_pages);
> +               break;
>         }
>
>         trace_kvm_handle_pkvm_hyp_req(req, ret);
> diff --git a/arch/arm64/kvm/trace_pkvm.h b/arch/arm64/kvm/trace_pkvm.h
> index 3966c111e3ad..493225e3282d 100644
> --- a/arch/arm64/kvm/trace_pkvm.h
> +++ b/arch/arm64/kvm/trace_pkvm.h
> @@ -9,9 +9,11 @@
>  #define TRACE_SYSTEM kvm
>
>  TRACE_DEFINE_ENUM(PKVM_HYP_NO_REQ);
> +TRACE_DEFINE_ENUM(PKVM_HYP_REQ_HYP_ALLOC);
>
> -#define PKVM_HYP_REQ_TYPES \
> -       { PKVM_HYP_NO_REQ, "NO_REQ" }
> +#define PKVM_HYP_REQ_TYPES                             \
> +       { PKVM_HYP_NO_REQ, "NO_REQ" },                  \
> +       { PKVM_HYP_REQ_HYP_ALLOC, "HYP_ALLOC" }
>
>  TRACE_EVENT(kvm_handle_pkvm_hyp_req,
>         TP_PROTO(struct pkvm_hyp_req *req, int ret),
> --
> 2.55.0.508.g3f0d502094-goog
>
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

