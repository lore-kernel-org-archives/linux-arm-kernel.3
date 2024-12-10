Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C187E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FGmDG/56UxrJQSDRbh5h6XtcOYvVsfsQlg9xr0FPYs=; b=ViaiZDCgRvdYUsfLRu10d4iRfB
	ZRA5OlDxO1dOY+w1Ej1hTZAZAvDth+ml8YOYJNw8lVMQz9qbF87/aig58sBbWDLrFR9D+d+RMBjPV
	09sPVLmmmvmczuaVxAfOgTNRdM/Gp+Slkzhkd/31hOaPBgutWMu94X6ljiYRMJLnEYDpU5yUrvWZf
	v6vgEZiEucn0dFCyCLLjXFgxQzPUI3fc6I6Dxwv0ZQDCxJ8rha0a1yLczx204EKx5yLyBMWZeT+vo
	nr91KfXbTrClDD7IphTOcUu+S42fLSbC9RwLWD5SNjRNQeekwFZC4mTxxuiBdIdPMzXTDAIBck5FB
	t3YGNPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL26T-0000000Bw7s-1FjJ;
	Tue, 10 Dec 2024 15:24:49 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL25N-0000000Bvsp-1SwZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:23:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434fa6bf6e4so44815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733844219; x=1734449019; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0FGmDG/56UxrJQSDRbh5h6XtcOYvVsfsQlg9xr0FPYs=;
        b=ebQCEjfNS/fuuqA3f6ndcTAnfsmjgfz2sNqCXh72JGOR6E6bDqQRKxIRoCIMIRtqVT
         z8vL8xbu0LyplQa5LQREK9XqFdcQKR/bkRR+p+9JtFqhtozFzaUhVHGcJHk6Z7i/QHkU
         Mh3mSmRVON2DVmB8J51X/zYkXQT/XGfL5BdkAPenAP2NA1lSKCkUx9qFOQX0rbE2fDRO
         Q43N8q6a4cHwx0po61SSHGh0BCmHvXEpo3jRw+AbERQSerfcLjUFmcJLOEBjneVXFPAE
         hB69RR8bKx5cY3HUtEJA0x/XutgsTvwGPQc1VwS/ilYrY2yK2aEh+sIogwWRFIf+FPwg
         y99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844219; x=1734449019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FGmDG/56UxrJQSDRbh5h6XtcOYvVsfsQlg9xr0FPYs=;
        b=tzQI/gjtjfd61kaT1FCZPB2t2XKexNRa9Wv2WgZHCrPdq6+9dJHegZPTqvn1wvUbM+
         PCMO1vHp6uwOfZZ312bjS5XVrDUd8RRrWcMX+se65FLE9VBD2vE5K90BN4OWPyJWeNQm
         POrxTI8vQujrdBuaWtKPwIgZZGN2vMvripp17Sy/fyi0JiIhDKQUmhWixdShmSGLOTpc
         zTzg5a/AWQJ6133vS6ZhNruqGh9C8uod8ePeQ3wcmhO8tFPCzt1orpTdB7tRnMcZKIQf
         I4OKgfquywQ7OurGDNhSSy1FeLcSpItxDTnV23YbIwdcMAj1FcoQReekEoo6rl4ZoI0c
         vcow==
X-Forwarded-Encrypted: i=1; AJvYcCUbxRFSluofQrmzV59SGZmmKfGOqPIFJrwMbtmAsx2F+3v4Q0X0yF97kTxOnd1LMTxBpxSZyz/rXpbkhdGeboQK@lists.infradead.org
X-Gm-Message-State: AOJu0YxLdzSzKITJfRdDMgv1DwBBRO2EO4NBQnNtQfqWQooKZDq7OM2F
	3YbodzQ6FVt4v0mkvo2e7MyzAvNOJtJi/UhDYrHDqW62TyrAP3fWBczTcMEpDE8beJr+TEaZs3E
	h8xr6K4eIqDOk+vi29/tb77d2MYbTFzCMTUoI
X-Gm-Gg: ASbGncv7bSfQ9VfxwD417n3yIPSTVRgGJEOqQS4Eo80uu7peQxmrrRvwC0vY4VD2bgQ
	ANf+azttgCNn8daB3+4OAUcBngKHorQU8GRthGzStV92CGt/hy73BV8Hv844NFSfI
X-Google-Smtp-Source: AGHT+IFj7W2A21RB271zIBxfODIG5QjupA4LpBwsV5eHpgstVb386fYaxm2Qzwdq67LZ1kRn3fUqgoJOaB0IFBrg8ho=
X-Received: by 2002:a05:600c:3b15:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-435027477c0mr1476295e9.2.1733844219282; Tue, 10 Dec 2024
 07:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-17-qperret@google.com>
In-Reply-To: <20241203103735.2267589-17-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Dec 2024 15:23:02 +0000
Message-ID: <CA+EHjTw_e_q5TFkgxvVDKxwj-C5S0Hd1OfVO4_FitrB8_J2Rpw@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_072341_390219_A6CE3F7A 
X-CRM114-Status: GOOD (  21.97  )
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

Hi Quentin,

On Tue, 3 Dec 2024 at 10:38, Quentin Perret <qperret@google.com> wrote:
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
> ---
>  arch/arm64/include/asm/kvm_asm.h   |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 6178e12a0dbc..df6237d0459c 100644
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
> index de0012a75827..219d7fb850ec 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -398,6 +398,22 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
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
> +       hyp_vm = get_pkvm_hyp_vm(handle);
> +       if (!hyp_vm)
> +               return;
> +
> +       __kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
> +       put_pkvm_hyp_vm(hyp_vm);
> +}

Since this is practically the same as kvm_tlb_flush_vmid(), does it
make sense to modify that instead (handle___kvm_tlb_flush_vmid()) to
do the right thing depending on whether pkvm is enabled? Thinking as
well for the future in case we want to support the rest of the
kvm_tlb_flush_vmid_*().

Cheers,
/fuad

> +
>  static void handle___kvm_flush_cpu_context(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
> @@ -582,6 +598,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_teardown_vm),
>         HANDLE_FUNC(__pkvm_vcpu_load),
>         HANDLE_FUNC(__pkvm_vcpu_put),
> +       HANDLE_FUNC(__pkvm_tlb_flush_vmid),
>  };
>
>  static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
> --
> 2.47.0.338.g60cca15819-goog
>

