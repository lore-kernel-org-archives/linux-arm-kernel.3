Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE3E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oo3menW0cQpST6JzATpIJfUIQbPsEjgJ47y7gQ4Tejs=; b=rBb/UxlMLzTX4j53flnyi7rPfj
	u/mTWKZReCJnmF2zaJ1fYwe9vT5Xj5u65qTGHvVvNVJnR4w5a4bOAcHuJaKAZdFVZWlPqqRI9VfMN
	80wPw/o3ghIuhbMdrlt84NRGx1D/0t7f1UftukwSS84M0C3vyZlRmI7jaE5qisSs0tHK3ZA96uF4C
	/2AHJpJRAQqbW/sKJ/uF4CTwrP5gZfHDSbSBgf9u52CR6Pi1wU6vPY3eRLMBpiIJkjksGVNt/+PQl
	tSQhKgPyiIUm6sX2zzqDxOg42xXrPO6oyUiuabb/fBCNcjqW1cIn9O/I4+P4hyd/+Ropqz7xwpIdM
	8IlUPOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIYG-0000000EJWs-29W4;
	Wed, 11 Dec 2024 08:58:36 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIXB-0000000EJD1-30ZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 08:57:30 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso1241769866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 00:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733907448; x=1734512248; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oo3menW0cQpST6JzATpIJfUIQbPsEjgJ47y7gQ4Tejs=;
        b=NdEODAuu5O5Mm5yvmwiUGW4uc8VGNHDeXsMB/zLt0fd6RNL3NPovQjSUY/RBBtjODq
         b5qEBC/8U5efI1daVdGG4RWWpgx17Mf/WMlUU8g/yTvMsedWLj8nX/wutvuNrJ0TjJd6
         66NmWULVMJKdLLkZ3GukqPkCB9EcCAwyo5iuEEMgOTwYynaOMWUpJT6bJH3/YqWq2A2U
         q8lHp7zBSoyz4iOZIhd7XH1AwztC5WQHLKU3tjjVoEACcyFpL0NIGprT8DF9JLUcUU4E
         qT6YZg9Z0MTZBvFBVqbAQmpIOqmjyu/ljmGtHt7eT1IIwU2Ed3u2GpJGavd9YaMaI/zL
         lqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733907448; x=1734512248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo3menW0cQpST6JzATpIJfUIQbPsEjgJ47y7gQ4Tejs=;
        b=a2gkPNw6kDSEh+gbgl2EerlEK/tb35OeJDd36PN+RizuQE2ARJinaHp8an6RMKKASQ
         pi5HDjqI9LegeUZylfViI+jTHAMk+hRMcIFHfE0+qngO78mSsqh8QARf1xKzv79K+jBr
         QuYlxPfsXU3qL3VoLCWQyA2ijFPlBQuR28Y2nR1BgTDo4JqKaEoZ69z5nkoL/uzGvFyD
         fHwtZ9UOBIJSZSjVcPETJ5tKrE3FDEPlD2QvOar0V1tGcU1TIIIY03JeYTtDD58B4Z4R
         m9sSiMUqppZKUj3Mrv0JnqieLUDVXdcKuKxxvKB6WlTg7aHWMjmK5k5DmrHy79pjrVi9
         usnA==
X-Forwarded-Encrypted: i=1; AJvYcCVcoZy9SBI36LhBYSf4fipoYwbgPJkua7iOBiJVNpO4t2wXEmqFPxFnWVpGgmgRQTLsqJmvaaDHZ0ulM38SYX1X@lists.infradead.org
X-Gm-Message-State: AOJu0YwwAuenDhz74eM0RxIiAl+VPDc6hjlPBMq4Jd3dC/rb2Q3trwWj
	Sm+5SuyJG+mjTQ+ttQJyjveoAKmskUMfhC2zBhpWofA0YTLI8v9wRwGMwJ9Rcg==
X-Gm-Gg: ASbGncuRiRfcG3dKc4M2GsoUc92Nv1s8DloH8JWnlqOE4JT9V25m7IwHjVPyHbKF+zU
	/0QZ0+TYrScNGkekPZr+2T3lvxyJLriCJVxfO9QngvhHK3fS0JAdxezj1vgUVJHWsaR9oplRC+X
	PQSV4Nt4TEF+G8kWC4bqSvXICNKLoagnRmudO6TrUnwQKIGT2M8ZbCOlovq5wEf9/kaux6flskt
	ahnXH7lPNMlvJnDuEiRs39hx9V2zxiOdDKcJfRTd6nXPsJ9SSXwWADMPwhBGlLAryzMmaD1cazk
	Bp/dtyLvMQtR
X-Google-Smtp-Source: AGHT+IFqR5S7WtoTxZn/dwkqI2hfNcplXWeCmCphFUX2+vkF0OoBPoS7u02WD5rzLiYhib1xK/ZI0g==
X-Received: by 2002:a17:907:6194:b0:aa6:6c08:dc71 with SMTP id a640c23a62f3a-aa6b11d6ba7mr149850466b.23.1733907446424;
        Wed, 11 Dec 2024 00:57:26 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68f4eb962sm383187366b.3.2024.12.11.00.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:57:25 -0800 (PST)
Date: Wed, 11 Dec 2024 08:57:22 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/18] KVM: arm64: Introduce
 __pkvm_host_relax_guest_perms()
Message-ID: <Z1lT8nGwEMqkedQs@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-13-qperret@google.com>
 <CA+EHjTwNgf5fPuWMaPaN4mcdd5y4uydJsXi-zEBatFnbwoaLLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwNgf5fPuWMaPaN4mcdd5y4uydJsXi-zEBatFnbwoaLLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_005729_770532_68151C83 
X-CRM114-Status: GOOD (  27.13  )
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

On Tuesday 10 Dec 2024 at 14:56:05 (+0000), Fuad Tabba wrote:
> Hi Quentin,
> 
> On Tue, 3 Dec 2024 at 10:38, Quentin Perret <qperret@google.com> wrote:
> >
> > Introduce a new hypercall allowing the host to relax the stage-2
> > permissions of mappings in a non-protected guest page-table. It will be
> > used later once we start allowing RO memslots and dirty logging.
> >
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_asm.h              |  1 +
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 20 ++++++++++++++++
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 23 +++++++++++++++++++
> >  4 files changed, 45 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index 0b6c4d325134..5d51933e44fb 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -67,6 +67,7 @@ enum __kvm_host_smccc_func {
> >         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> >         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> >         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
> > +       __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
> >         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
> >         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
> >         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index e528a42ed60e..db0dd83c2457 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -41,6 +41,7 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
> >  int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
> > +int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
> 
> The parameters are the same as __pkvm_host_share_guest, but in a
> different order. I looked ahead at later patches in the series, and similar
> issues regarding parameter type and ordering, so I won't mention it
> for the later patches.

Ack to this and the other comment below, thanks for the review!

> 
> >  bool addr_is_memory(phys_addr_t phys);
> >  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 04a9053ae1d5..60dd56bbd743 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -267,6 +267,25 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
> >         cpu_reg(host_ctxt, 1) =  ret;
> >  }
> >
> > +static void handle___pkvm_host_relax_guest_perms(struct kvm_cpu_context *host_ctxt)
> > +{
> > +       DECLARE_REG(u64, gfn, host_ctxt, 1);
> > +       DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 2);
> > +       struct pkvm_hyp_vcpu *hyp_vcpu;
> > +       int ret = -EINVAL;
> > +
> > +       if (!is_protected_kvm_enabled())
> > +               goto out;
> > +
> > +       hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> > +       if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +               goto out;
> > +
> > +       ret = __pkvm_host_relax_guest_perms(gfn, prot, hyp_vcpu);
> > +out:
> > +       cpu_reg(host_ctxt, 1) = ret;
> > +}
> > +
> >  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
> >  {
> >         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> > @@ -478,6 +497,7 @@ static const hcall_t host_hcall[] = {
> >         HANDLE_FUNC(__pkvm_host_unshare_hyp),
> >         HANDLE_FUNC(__pkvm_host_share_guest),
> >         HANDLE_FUNC(__pkvm_host_unshare_guest),
> > +       HANDLE_FUNC(__pkvm_host_relax_guest_perms),
> >         HANDLE_FUNC(__kvm_adjust_pc),
> >         HANDLE_FUNC(__kvm_vcpu_run),
> >         HANDLE_FUNC(__kvm_flush_vm_context),
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index aa27a3e42e5e..d4b28e93e790 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -1480,3 +1480,26 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm)
> >
> >         return ret;
> >  }
> > +
> > +int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu)
> > +{
> > +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> > +       u64 ipa = hyp_pfn_to_phys(gfn);
> > +       u64 phys;
> > +       int ret;
> > +
> > +       if ((prot & KVM_PGTABLE_PROT_RWX) != prot)
> > +               return -EPERM;
> 
> Why not
> 
> +       if (prot & ~KVM_PGTABLE_PROT_RWX)
> 
> Simpler and consistent with similar checks in the file (e.g.,
> __pkvm_host_share_guest)
> 
> Cheers,
> /fuad
> 
> 
> > +
> > +       host_lock_component();
> > +       guest_lock_component(vm);
> > +
> > +       ret = __check_host_unshare_guest(vm, &phys, ipa);
> > +       if (!ret)
> > +               ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
> > +
> > +       guest_unlock_component(vm);
> > +       host_unlock_component();
> > +
> > +       return ret;
> > +}
> > --
> > 2.47.0.338.g60cca15819-goog
> >

