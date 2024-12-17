Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FF5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bpai75X11LMfvePNjrqzhIaWJn/QBSdWg0KnRrx/c7Y=; b=KO8s+XTYSg4HWRlbAXDpxlJEHM
	ogwKTyuZBbXzv6luQHdgLoYtoZztSHXGSLAK/XojrLCKPv19X5DoMdYDbgkzwk+rhh7snSgeu5IL/
	s7a0Q2sQMHVz/LA0FRPVQfdSv26JrG/vH4SNO5/GYceJUityaydv0Tkzf/bxAXZKLlst+7hNc6UMJ
	MRA3abFdVd8dbry0AdBIs1VvLywUXe5KvzVpO0WatsQPRxEpRdPyYfNEGXsDfkUeXVkHClE2rGClS
	hq4dAuW4l/nn7rxQJTDH2++CX1k86NdCIQViSRHRmxQIC2YN8/tTz6lHe1e61oiDBkvzI0s5CBxi7
	HCzcvmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTiD-0000000CsLF-20q8;
	Tue, 17 Dec 2024 09:17:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTST-0000000CoyF-04Pk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:01:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43621d2dd4cso39545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734426095; x=1735030895; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bpai75X11LMfvePNjrqzhIaWJn/QBSdWg0KnRrx/c7Y=;
        b=swhx1YuvzBFvIPof5n0X0bw4K8RB4YxzD9+TMHlGcM0HgKFVZdte6aNrKsetYsK3Ex
         58uPkk+CgcTPXol0FXuSupJpcdkUX1XpEHTTslO9Kvv4C0aCGLwTFksHmKngTb8NSP+6
         DgtIvagltDk6kHA9n08MHqiPlJhYJB0v71uYmLbi9dJ40sAg0MJoKr/TbKG+fcdXj+eY
         /pPVe6vZWNDnGYgt2/U7Q+AB9plFJl9nte1QM+06kKI54PKR5Fb4QqrTsmn9YQ4q6GQJ
         TmNg4L/0cITjCxWWH7SXM87/AXrlzaLaDTOwmRiGSGRxgHj3JhWaZ6opg4a84za2rTuM
         5MvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734426095; x=1735030895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bpai75X11LMfvePNjrqzhIaWJn/QBSdWg0KnRrx/c7Y=;
        b=n1E6OGkEv+mrkx2CGGAZE701Hqk7aktVkYmekEi8dh28ATrW0CCZ3eIuyAHdVqRKuN
         i+44sEjAItH6UNp5x+0GoVIFSgOaimopoTvWhNrfV5HvA20cuNwHX6ra5hZ5ZtKySm4t
         ZCh1QNvaGsjtLfxT5iXZu2Wwpes1YcutBWTrQ3Q6DP1VGvIl8jaCftQufLieVexAQYd+
         MZwwr/a1K6xq6VTbL2YVDxf4peS943OBBUECFcJtZujXVOWHrUG9bVTeEmI+7kCOvDSP
         8ScQQfSa6LYnP2N4dJxxfH8I5+8UVFrSQKQNytUB5Xf/bVIvBTT1EnyYrrx6Vi0M1e+8
         DLGw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8lneYVTb345Isf87WHcz6YWBVGnyWTPA4FLWMg3yhibtSJSrmXPNiC09/5kVXTebRKugvQtu9xTjotgens2q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/ajeBIPagUO9AEiuwIOjq3IuGz7OJK7nSJF0h32xezLJgy/Nt
	eK35nZOngZWZzRS/gdKdPix51k/qC81PXjC+9yy/e3UyhXgn1e81Uc21H5TFG0z+JbxiYzVz6pd
	a+xyBrnpZRwX8Pi3JahKNA6dA3AiBmcQrpFHZ0h4Nhiuf/EwFnWlG
X-Gm-Gg: ASbGncupIVSTJhYHI3BXmpkqj20hBvG9bhp+H/+qR+GVI5r8aVuWCdrZzrAAFThXChe
	0AZR3+UYgpXbCbrH/rCNqZu7odBy8we8/7RKuWojLV/CryhWV86YnkNTVj5XQEe2mAyQ=
X-Google-Smtp-Source: AGHT+IEQQFJCYIi7D2fpMZdC3EviO5hPxfEuwAdpwMV205YFizbZuxpptBGEW5SdOPdDWzDZGDlz+zHkfEB6EtA0CpQ=
X-Received: by 2002:a7b:c057:0:b0:436:1868:b29f with SMTP id
 5b1f17b1804b1-436492e7bd8mr1053605e9.6.1734426095446; Tue, 17 Dec 2024
 01:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-17-qperret@google.com>
In-Reply-To: <20241216175803.2716565-17-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 09:00:58 +0000
Message-ID: <CA+EHjTw7X5fOY+1yLmGdqYbUDCOVCPfmJf--q8dBj3XLzPicBQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/18] KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_010137_051193_35CD81E3 
X-CRM114-Status: GOOD (  19.43  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
>
> Introduce a new hypercall to flush the TLBs of non-protected guests. The
> host kernel will be responsible for issuing this hypercall after changing
> stage-2 permissions using the __pkvm_host_relax_guest_perms() or
> __pkvm_host_wrprotect_guest() paths. This is left under the host's
> responsibility for performance reasons.
>
> Note however that the TLB maintenance for all *unmap* operations still
> remains entirely under the hypervisor's responsibility for security
> reasons -- an unmapped page may be donated to another entity, so a stale
> TLB entry could be used to leak private data.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_asm.h   |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index a3b07db2776c..002088c6e297 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -87,6 +87,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
>         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
>         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
>  };
>
>  #define DECLARE_KVM_VHE_SYM(sym)       extern char sym[]
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 32c4627b5b5b..130f5f23bcb5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -389,6 +389,22 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
>         __kvm_tlb_flush_vmid(kern_hyp_va(mmu));
>  }
>
> +static void handle___pkvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> +       struct pkvm_hyp_vm *hyp_vm;
> +
> +       if (!is_protected_kvm_enabled())
> +               return;
> +
> +       hyp_vm = get_np_pkvm_hyp_vm(handle);
> +       if (!hyp_vm)
> +               return;
> +
> +       __kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
> +       put_pkvm_hyp_vm(hyp_vm);
> +}
> +
>  static void handle___kvm_flush_cpu_context(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
> @@ -573,6 +589,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_teardown_vm),
>         HANDLE_FUNC(__pkvm_vcpu_load),
>         HANDLE_FUNC(__pkvm_vcpu_put),
> +       HANDLE_FUNC(__pkvm_tlb_flush_vmid),
>  };
>
>  static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

