Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FB1C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpo1KyKMKhYFTRlb2RJOsA+e3kYhuJvTU2iJ2xMLWY4=; b=0iwFozB/M5r083dmOa+a4g9a8+
	CBpLthIp1CKlxYQEm+ar/iAPg2J0WyXP58tROKNSNu4SMKXpp8OcDyirzQB7DtgnlMlDAzbkqzhvM
	PRiYM+cXBEfLr6su5PCh6+nZ/Sdc/fLHG3jfb/wSarf0pQaRumOx8l0+xQ2ZXOtu/wuv5KDJdp9tP
	Ks1Qlsucpq/2rFk51k5KUr14+4K7hqUMDoUXyxdbPykfTgsAZnl4tsbOVF913cEJCocZ7gt1YXlAq
	3IvzmlOvoYPSPDw5FEqesiA4mtAd/k/bV93dMc55d4XVATx01RZ1y08neizyVT2cALXYOX08UXle6
	RlIHt1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjip2-0000000D6wo-2XNQ;
	Tue, 14 Jul 2026 19:29:40 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiot-0000000D6ve-3nxs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:29:34 +0000
X-Forwarded-Encrypted: i=1; AHgh+RohPzMO5s8w5Lw5OMAIIRcUQfc3EIg7Cjmek4D5Gc2FZ/vkvs8+ZtE0cywCILIyFUk6PAPPi7oDs/07pbF1vh8P@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784057368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpo1KyKMKhYFTRlb2RJOsA+e3kYhuJvTU2iJ2xMLWY4=;
	b=rwKjmpaQTsDhpaiJ/yYZ6lgDpabtN+SYuLxzlIoqNSWM+xcxUyzY0fY2cIJt/WtBSzbhCc
	m2zIwqfs2JKjp0pjf/rZjDQ5TmluLe87q/7aqyhdY9MMelkFP3WihcMpT5wX01qm4GmlIP
	5GQlrvc6MGKiy40cOBmSruaEDqBmbEU=
X-Gm-Message-State: AOJu0YwGsoi+xfeevu29/FzWn0CpRnaG+QUyvWik+OR5+qcyLzMwhT5/
	o2jgmehkWo5KXiElJh8sW6j1ZKz0FAcmwY/UQ9w/qyFk2933frrDKTQvNZQn5RdPEE3bsZKtsl9
	qLA0xIGfJQHG3R5nJkXbtK0C7sw3+U+5KEzoa+O5L
X-Received: by 2002:a05:622a:aa05:20b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-51d7bd1f5b6mr14380171cf.12.1784057359790; Tue, 14 Jul 2026
 12:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-7-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-7-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 20:28:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx8V-O0Wtx6dG-CD_-HwNeECPCm23oYVPYoUqEUsTZbhw@mail.gmail.com>
X-Gm-Features: AUfX_myZ-YiTTw-qVayx9SV-DJZQwLurb-jwih9cVUkLEzNDshARHSP1AE-9t7E
Message-ID: <CA+EHjTx8V-O0Wtx6dG-CD_-HwNeECPCm23oYVPYoUqEUsTZbhw@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] KVM: arm64: Add topup interface for the pKVM
 heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122932_371041_E6118B8F 
X-CRM114-Status: GOOD (  17.08  )
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Introduce a host HVC interface and a host side helper to allow refilling
> the pKVM heap allocator.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 043495f7fc78..681b7bf8ac08 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -114,6 +114,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
>         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
>         __KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
>
>         MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
>  };
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 74fedd9c5ff0..870f7870bb62 100644
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
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index d3c69de698f4..e270a974fa37 100644
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

Sashiko caught this. Suggest moving just this helper to patch 8
alongside its caller.

Cheers,
/fuad

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
> @@ -762,6 +787,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_vcpu_load),
>         HANDLE_FUNC(__pkvm_vcpu_put),
>         HANDLE_FUNC(__pkvm_tlb_flush_vmid),
> +       HANDLE_FUNC(__pkvm_hyp_topup),
>  };
>
>  static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 8324a6a1bc48..e2c8714e8ccc 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -85,6 +85,33 @@ void __init kvm_hyp_reserve(void)
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
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

