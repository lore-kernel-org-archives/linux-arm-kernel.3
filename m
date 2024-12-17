Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A57E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn36mxEjfO11KqvkRwmiDrEX6J7ZOG8Km82941NlBuM=; b=3EnFg8MxHL/wB69gC2NAUroY9Y
	9KjjtQG76UjnxD2hv6EC0F96icIJ6HXXEra3q2Bk5j2oywTrk88DEwI/6rz0NMcMlib8FERxEU6G8
	6zs8CdkmtepmtufcJgiG3GYKht2CzSxIo8TTLUijzWy/s+vvwd3vzr1bBYyXM+RJ41OXjLXK6llCT
	rMqKtGBNhXEs67w23x6Yp0msNZ7jumUa76Op2UvLxoyFQMVV+bDG3d+z/5LTDM882vmdlVOIVdw3d
	m8xGNBTrvEeeK9+/wqFCaEx/jkSDrgZ+NZnGg28qljdxteT8j+ua50LtaYtVfgLZJvFu+QzG8ERBH
	Kv+HVmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTh9-0000000Cs2x-29Tn;
	Tue, 17 Dec 2024 09:16:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTS6-0000000CokC-0AhY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:01:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso40145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734426072; x=1735030872; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn36mxEjfO11KqvkRwmiDrEX6J7ZOG8Km82941NlBuM=;
        b=4nWpZPeFpssjn+neVgzrx2KtpZalOG+xxXUcj7005HXCmWSWeX7Dyrq7JbRQG0e/uk
         5BfJMn9QgWx7mZui76iQLR8DlqIXbObPsTB0FPF32VDzGNdzslyPrjF5lkeShe1OcFIS
         3dDKWM6Ob41VA/wxBIN8xy7PCq9sdEjZNvALcT7UpYrBnn+gZ5YUU8XZmb3s9rHNRiTh
         y1jakP9fgZW45e74xG+UjKWcmRFyLaMEiZ6mkvtMSR2/XOEcXA+6PVCbdki4P556fPq1
         mk/Nhw2k18H6oGD2Sxb46ApHSBnZKqIm1TDpEb1AX4G/ZLSj8GtIBgt9upv62GHJVJQI
         rUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734426072; x=1735030872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xn36mxEjfO11KqvkRwmiDrEX6J7ZOG8Km82941NlBuM=;
        b=c0gFwlo018iT2X37McYVtdWtukOUjNVeQW2SAOJfQFrmpG38Rbjvt7TAXSgkwc3Vi/
         HxzMqO8diFbh2k43jMUgAMV4Rq2tWpAAHmUeC6NY+P9Y1juO5gDgG0l4xo0So7z+54GB
         WxzCiDN2/9iLaJExN9+9esWEun9KPDWDl6SQIGjLPhs7TmAjpU16D23b7fgXL+lzqYXd
         1Ck/wxSQC8XcfGZdIcgF3sZLBc3v4U5x3WD6+e60C+IegtWGWjJ4TtIuBPjB2ddJw68F
         IQg/vpepfuUHTYIjAFfDd5uusxkRN/Fa9B4KJjxIAFVrn4uPv8+r8x9E9xaiKVdVdgJn
         +M4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVN828i3wJFtNp6kSyAgP1eqoPh5xlez3yYW6KCb7gtS6rQg++BDkd9mQy4G3BXT7id7PP5xHPc/xc1e2d9Qt02@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4mxXigsLdhrpBZ6r5Kkp5dnTbi/5YT4msSeDfBCXAZYG0GHlO
	Jg7zlx59ecBQKM29v2+3rwhqDidIUDWfdxrnwamJMrmKbPKmQlcEdnyLZfj99WYMXb2oZyyjyDV
	icYXkc9xjnP3ygyIL5YY7/lg05ED8U8pB7OJU
X-Gm-Gg: ASbGncv6wJ0mMUKPezYNXun3ElYcWChyFSlijN7L6HIDi34KpiGLJa9k2xRDd2i4yuD
	opTbz79AVRRBswgvfdXTkvERgD4susfwVp6TCIqRX0shWsi53iArFGdY9c+hjPKkeqqA=
X-Google-Smtp-Source: AGHT+IGTMsIK/+fqyiclNvnxiumOrPL+9bRBaA9Q/a+ejFhKcdGovQJz4621GOwlV2PhnNytnWUP3JoeS+CcBPepzUE=
X-Received: by 2002:a05:600c:258:b0:434:a0fd:95d9 with SMTP id
 5b1f17b1804b1-4364ad50a2bmr724755e9.5.1734426072395; Tue, 17 Dec 2024
 01:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-16-qperret@google.com>
In-Reply-To: <20241216175803.2716565-16-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 09:00:36 +0000
Message-ID: <CA+EHjTx-2vBMY67Y6hm4U-DFirM93BK-CQOvcnBgYXO75xhmFw@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_010114_086741_E8B1D837 
X-CRM114-Status: GOOD (  18.41  )
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
> Plumb the kvm_pgtable_stage2_mkyoung() callback into pKVM for
> non-protected guests. It will be called later from the fault handling
> path.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 19 ++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 20 +++++++++++++++++++
>  4 files changed, 41 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 4f97155d6323..a3b07db2776c 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -70,6 +70,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index b3aaad150b3e..65c34753d86c 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -44,6 +44,7 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>  int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
>  int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>  int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
> +int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
>
>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 616e172a9c48..32c4627b5b5b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -324,6 +324,24 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
>         cpu_reg(host_ctxt, 1) = ret;
>  }
>
> +static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(u64, gfn, host_ctxt, 1);
> +       struct pkvm_hyp_vcpu *hyp_vcpu;
> +       int ret = -EINVAL;
> +
> +       if (!is_protected_kvm_enabled())
> +               goto out;
> +
> +       hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> +       if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> +               goto out;
> +
> +       ret = __pkvm_host_mkyoung_guest(gfn, hyp_vcpu);
> +out:
> +       cpu_reg(host_ctxt, 1) =  ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -538,6 +556,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_relax_perms_guest),
>         HANDLE_FUNC(__pkvm_host_wrprotect_guest),
>         HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
> +       HANDLE_FUNC(__pkvm_host_mkyoung_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 0e42c3baaf4b..eae03509d371 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1549,3 +1549,23 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *
>
>         return ret;
>  }
> +
> +int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
> +{
> +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> +       u64 ipa = hyp_pfn_to_phys(gfn);
> +       u64 phys;
> +       int ret;
> +
> +       host_lock_component();
> +       guest_lock_component(vm);
> +
> +       ret = __check_host_shared_guest(vm, &phys, ipa);
> +       if (!ret)
> +               kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
> +
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

