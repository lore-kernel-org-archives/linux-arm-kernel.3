Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09018E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGp4xmxqvFNS4aKzzUdEFGSpZc9CuS65nIZ2CXfL9DI=; b=W2D7P01gt/u4EOnKFhBzGwjMls
	QV3SJoVC0mA7w/X6pw4V0ggI6RDhLoCER9hgllTIG+CQENPxtBuppHk8lYnwn3yX4o1RLWyfdDzVo
	HesGUAw3Xkj3jG0UDh8o4rDNqR+GPMXOFha3wfQdWN6lWQ7GPerZNVZhLDv8a+2d/5ZE6Gto1fBir
	VZAlZP4yWnrrXuSKe07jswH3yApY19VeoH4pBGAYSuQ08VLDhxZ/xtqO3rmkligrbxMYRwqBg01Tw
	VZzAqjTNAh20LHx+uL/Z84NeTWEdMHtUU3VVei7JZQ7xAYSEepPyOBfZypa3IDpda6QtLoRCMU1GI
	K6tCe7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1xm-0000000BuVO-2Pib;
	Tue, 10 Dec 2024 15:15:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1wg-0000000BuOD-26tI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:14:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434f150e9b5so44635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733843680; x=1734448480; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aGp4xmxqvFNS4aKzzUdEFGSpZc9CuS65nIZ2CXfL9DI=;
        b=yH6fF2Kc75XD1kw5Jxo9DdT2UTiXoFElnbX7yGyyMadQCioLKpWD3j4vF4o9SuDBT3
         sjUnVLa2M4Rq2lD/JO1nliyuUtYlSQTMBdDOexYSpjSaHTQxA7bizTmO2e0Tz4JRilyd
         TtcLd+OLlt3HCP8gngQcRYnCvWMuJzhVNNCcD3bssJUNb8abmrYXlGsadRaV74VbF2hm
         FxzHZtbK7ZuYvfDWKexEajAl7BwH23k5CqaSd3sEvWaT4cm/dhOYu5auX2O/ShFUZb7y
         +TxRSASdxBeL2ebOsws9n6vgxf38rGK2MYuROdoYdLdh9xorDdoeHb2GWPMjgGbZRa+c
         RbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843680; x=1734448480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGp4xmxqvFNS4aKzzUdEFGSpZc9CuS65nIZ2CXfL9DI=;
        b=LuZDIwImb7n0yzwnzLHCscAtGgO26qXmynuEF3o0DQK/XBE/e2KVxri2xxXNYmH6tu
         jTYQzxY9CkApVcO1klKMAUcw3G6VGP4XC21Ez+s9+cUvzcdxEXJPjtdo982Btk/CQO33
         Tjo+ApW1EedxGN2MimSCABj8vNfWrM1H+LigJ2Kqwj4kCDXbWjje8/3Z7V6USpcYTz7n
         +jvzQ/QI9jM9vP1dutda1tV189hhO4EHS/P8qyNlPObmyvcTjuL8KwV8GoOcQG7BIWI6
         /h0G37hx78SGpJR9B+TGpTE7ITEwhlL6emmmNNyN6uVme1nyE2lEBhlj8ioet0+ARu9k
         rIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwaoBtd2FOR4gO907JqmgiwB2y5ekViTswS5ykG46rX3TmqwWQxYTg/bT+YfoTihdQyaN1VQb5EQqcj09mA+mw@lists.infradead.org
X-Gm-Message-State: AOJu0YzwswumI0rU9FoD+8JxQ8oWFC3A1iJtRQJc5N3yC8zY/kCHGRZQ
	qvxqdsDOxBOCV42VDnhk1Gq0CUsTUkr9Y1n9pLzs92h847oGetesipfATDl8M65xqvmAW+juJVG
	6kvA1k8XUYNGUKUkS+ZkvvrZViO13+pWBOx0r
X-Gm-Gg: ASbGnctghZJPVcJ+lyI2+uFMuQaShAwW4NZ4y09sCn0jdxB6gupucPG0Bm3XuDeseKm
	k5623VEUoo+m5CvNF/dPsuATRo3CzMv3CK6YnOxt7HO7ydZi34t+cXEzgT7cCccsm
X-Google-Smtp-Source: AGHT+IExtEJYbzPbhtvTj138hbJaUMAGq3rsSDYLbkcmP/S+jYpwTOuL2FE8QW/DEJ3y6pie8o3bjxV+CMjjg3V8Q7Q=
X-Received: by 2002:a05:600c:6b06:b0:434:9e1d:44ef with SMTP id
 5b1f17b1804b1-43539dd9773mr1230565e9.7.1733843680024; Tue, 10 Dec 2024
 07:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-16-qperret@google.com>
In-Reply-To: <20241203103735.2267589-16-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Dec 2024 15:14:03 +0000
Message-ID: <CA+EHjTzOjwNyUkS5_zSUiAbiCauLKKgkKU6TM_-+Wsh9A0FdRQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_071442_547938_F158786B 
X-CRM114-Status: GOOD (  19.18  )
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
> Plumb the kvm_pgtable_stage2_mkyoung() callback into pKVM for
> non-protected guests. It will be called later from the fault handling
> path.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 19 ++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 20 +++++++++++++++++++
>  4 files changed, 41 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index cb676017d591..6178e12a0dbc 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -70,6 +70,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 554ce31882e6..3ae0c3ecff48 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -44,6 +44,7 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>  int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
>  int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>  int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
> +int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
>
>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 67cb6e284180..de0012a75827 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -333,6 +333,24 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
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
> @@ -547,6 +565,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_relax_guest_perms),
>         HANDLE_FUNC(__pkvm_host_wrprotect_guest),
>         HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
> +       HANDLE_FUNC(__pkvm_host_mkyoung_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 0e064a7ed7c4..7605bd7f80b5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1541,3 +1541,23 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *
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
> +       ret = __check_host_unshare_guest(vm, &phys, ipa);

While I'm bikeshedding some more, does the name
__check_host_unshare_guest() make sense? Should it be something like
__check_host_changeperm_guest(), or something along those lines? (feel
free to ignore this :) )

Thanks,
/fuad

> +       if (!ret)
> +               kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
> +
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> --
> 2.47.0.338.g60cca15819-goog
>

