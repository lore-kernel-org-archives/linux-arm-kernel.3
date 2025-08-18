Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32EBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NduKahaSsHRwJryndzTREtjDiwEP6iz1IQoYnQXnz+8=; b=N0M8qQTrTiKMamc7UuA7El/Jh+
	viBjtjgG60Ib8k+dZf1GffRvkHfW8/tJ4/3yyNCd6M/bbYuCLWzqNkdF783oUlc6TPCIw2E1kJlpu
	VUxopTFrm4JOywjT3J5TtLKpc7P05G2xw488S48FoHYXWTgTDiYTWFnk9SUe3FimB7TKX6vTRFigO
	yRsd5ASYAc09LkHf7qmDujfMfHBIJbeoXJJ2e1ZO810aTLaciG9oFo0omrBX4mRw0p03/yUb694ii
	wG1FVqvKB2cH2bo9oBD+avSBHgyaclF7kdBbcbstxNtVVyAC4iznqwq63Tgqad3xlX2xZ4d+ngJkT
	RmxxhPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1B4-00000007pnt-3iiO;
	Mon, 18 Aug 2025 14:49:38 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unzWv-00000007Ord-0Fpv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 13:04:06 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-afcb7a3a085so642451266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755522242; x=1756127042; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NduKahaSsHRwJryndzTREtjDiwEP6iz1IQoYnQXnz+8=;
        b=CJJM1gqsHCxBj0oT4NZap1bNN0pAvJ4K+f8S0hUrdTTSwAJgP47WPHSLjgxUD2Bfqs
         iw86nTs7G8KNC6PE/ZMq5DvYQV+2C0z1WGEi2N6txvgs0xWlwVHbwcoVROP04ToqGZH9
         ceictiNmOUryFo7gEzkpjTy7ayKdA4t6lJaXROkpUl082ATPlgFlJFrLeUH0oBvNKRQS
         hH/48L76ElebcIX5F03q1PowCWkOkSqfrupx1ZsKgffTGfgD5rbV95RL7Mvrq8KaEJCe
         JjWSdz0xGcxVBNDKsshk5mxEYudWARobN/is3L/+Xn548grD2n0+5isZ2aFw49sgdoaa
         D7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755522242; x=1756127042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NduKahaSsHRwJryndzTREtjDiwEP6iz1IQoYnQXnz+8=;
        b=DoIqM1L/acAmeHqFg4iBUdI/NYgkypG3f/tXBkPJac9vm1nLA82tmTXUyBfK3l/oAs
         DM4M74e1Sz6c2ixNlScfLOttW3OX+MRYseue/XfDXZJQ3nBOAdA4ifn5O+9S5nKEthQo
         SBdIAk39TfV6fVQvxT4loTkw/Ceda2B1FpPhj2brt6tXKhA14Xf91x1Ft9bEIqwZcM+f
         hAUiWKwYL0ILLX5nnVdBP5b9xrxLUDC1qmOLW99KNj+F9r+MbgEBtlbcNU8fSumFgDy/
         OXhdu0FSR9k9aXL5zcxiFTlzgIibQYtT36zbDWyAp0F1LWK/7pps8nn4owWdOPiH5Oqb
         z5/g==
X-Forwarded-Encrypted: i=1; AJvYcCV3KCuBb5JSG6oA2Idm6jxYxne0OagQiHNEmpHdiGK7EkSp1Ml0apgcs/iSlRkcGedMjkxPTXqVMBsukdxZN5wa@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh69iRBdgzSGDTs3SEgdJ5ZlvePS6ITgriEACkTS34mj7BoKy3
	vtg+Cku6t7r5GvkjibhmmBaSrd07hheBTScZEj/i2qh0p3qrPgeuCgO0WZvODRFZO0dCjyEg3TH
	KlyA1tKvX
X-Gm-Gg: ASbGncu8C+5mX2dybz0fdB8dIgIWrAGB8rcGI4QpscfxEUki4ESo9KwDiaS+fiWkAu+
	Qk7jlTMJHZNXzxrvz/S9HQH2JmLNDWjyTS1mXZuoHLKPYIDMN8DaiAGdvDvCK8gefE6N1BcH42h
	KKGP+mqrFnoR1IqCKo6W9Mf1AsqLP65PBIk1uvyur2AYJTaOYUpy3sCsYTLhjBFpiWvSsKe9+If
	xvhEN6Sk2KU0Ysz5kI4Swtg9GUrzsYv5d89JW1VDTfYt3kuqz1TJYy1m0CsqPI2kFcPnrgld4CA
	u6/nY0kfvnJbbfVr3mYvUatNDFGUQAX4TWtDs3oSSR4bI0NiPfRiu2TvXiS0Y3vpQsOONG9+qnQ
	uKEL/7u9LL4sDOr/Qi80O9ysjTCL2D/jBArJjj4gQq3QIKKXLkw+YNwF7qevSkYE=
X-Google-Smtp-Source: AGHT+IHw9k3Ozl8ODhQt1aTftbUxAvnT87BIGBhJUDtNJHRuqigi8Ct6sSymmRAchwlefla4IBRy/w==
X-Received: by 2002:a17:906:c04f:b0:afd:bd24:4de7 with SMTP id a640c23a62f3a-afdbd2497f1mr391580566b.29.1755522241561;
        Mon, 18 Aug 2025 06:04:01 -0700 (PDT)
Received: from google.com (211.29.195.35.bc.googleusercontent.com. [35.195.29.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcce69sm785410866b.82.2025.08.18.06.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 06:04:01 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:03:57 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, james.morse@arm.com, tabba@google.com,
	Quentin Perret <qperret@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix debug checking for np-guests using huge
 mappings
Message-ID: <aKMkvQEyeK1QH12X@google.com>
References: <20250815162655.121108-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815162655.121108-1-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_060405_106758_672F3AED 
X-CRM114-Status: GOOD (  24.99  )
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

Thanks for the fix!

On Fri, Aug 15, 2025 at 05:26:55PM +0100, Ben Horgan wrote:
> When running with transparent huge pages and CONFIG_NVHE_EL2_DEBUG then
> the debug checking in assert_host_shared_guest() fails on the launch of an
> np-guest. This WARN_ON() causes a panic and generates the stack below.
> 
> In __pkvm_host_relax_perms_guest() the debug checking assumes the mapping
> is a single page but it may be a block map. Update the checking so that
> the size is not checked and just assumes the correct size.
> 
> While we're here make the same fix in __pkvm_host_mkyoung_guest().
> 
>   Info: # lkvm run -k /share/arch/arm64/boot/Image -m 704 -c 8 --name guest-128
>   Info: Removed ghost socket file "/.lkvm//guest-128.sock".
> [ 1406.521757] kvm [141]: nVHE hyp BUG at: arch/arm64/kvm/hyp/nvhe/mem_protect.c:1088!
> [ 1406.521804] kvm [141]: nVHE call trace:
> [ 1406.521828] kvm [141]:  [<ffff8000811676b4>] __kvm_nvhe_hyp_panic+0xb4/0xe8
> [ 1406.521946] kvm [141]:  [<ffff80008116d12c>] __kvm_nvhe_assert_host_shared_guest+0xb0/0x10c
> [ 1406.522049] kvm [141]:  [<ffff80008116f068>] __kvm_nvhe___pkvm_host_relax_perms_guest+0x48/0x104
> [ 1406.522157] kvm [141]:  [<ffff800081169df8>] __kvm_nvhe_handle___pkvm_host_relax_perms_guest+0x64/0x7c
> [ 1406.522250] kvm [141]:  [<ffff800081169f0c>] __kvm_nvhe_handle_trap+0x8c/0x1a8
> [ 1406.522333] kvm [141]:  [<ffff8000811680fc>] __kvm_nvhe___skip_pauth_save+0x4/0x4
> [ 1406.522454] kvm [141]: ---[ end nVHE call trace ]---
> [ 1406.522477] kvm [141]: Hyp Offset: 0xfffece8013600000
> [ 1406.522554] Kernel panic - not syncing: HYP panic:
> [ 1406.522554] PS:834003c9 PC:0000b1806db6d170 ESR:00000000f2000800
> [ 1406.522554] FAR:ffff8000804be420 HPFAR:0000000000804be0 PAR:0000000000000000
> [ 1406.522554] VCPU:0000000000000000
> [ 1406.523337] CPU: 3 UID: 0 PID: 141 Comm: kvm-vcpu-0 Not tainted 6.16.0-rc7 #97 PREEMPT
> [ 1406.523485] Hardware name: FVP Base RevC (DT)
> [ 1406.523566] Call trace:
> [ 1406.523629]  show_stack+0x18/0x24 (C)
> [ 1406.523753]  dump_stack_lvl+0xd4/0x108
> [ 1406.523899]  dump_stack+0x18/0x24
> [ 1406.524040]  panic+0x3d8/0x448
> [ 1406.524184]  nvhe_hyp_panic_handler+0x10c/0x23c
> [ 1406.524325]  kvm_handle_guest_abort+0x68c/0x109c
> [ 1406.524500]  handle_exit+0x60/0x17c
> [ 1406.524630]  kvm_arch_vcpu_ioctl_run+0x2e0/0x8c0
> [ 1406.524794]  kvm_vcpu_ioctl+0x1a8/0x9cc
> [ 1406.524919]  __arm64_sys_ioctl+0xac/0x104
> [ 1406.525067]  invoke_syscall+0x48/0x10c
> [ 1406.525189]  el0_svc_common.constprop.0+0x40/0xe0
> [ 1406.525322]  do_el0_svc+0x1c/0x28
> [ 1406.525441]  el0_svc+0x38/0x120
> [ 1406.525588]  el0t_64_sync_handler+0x10c/0x138
> [ 1406.525750]  el0t_64_sync+0x1ac/0x1b0
> [ 1406.525876] SMP: stopping secondary CPUs
> [ 1406.525965] Kernel Offset: disabled
> [ 1406.526032] CPU features: 0x0000,00000080,8e134ca1,9446773f
> [ 1406.526130] Memory Limit: none
> [ 1406.959099] ---[ end Kernel panic - not syncing: HYP panic:
> [ 1406.959099] PS:834003c9 PC:0000b1806db6d170 ESR:00000000f2000800
> [ 1406.959099] FAR:ffff8000804be420 HPFAR:0000000000804be0 PAR:0000000000000000
> [ 1406.959099] VCPU:0000000000000000 ]
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Fixes: db14091d8f75 ("KVM: arm64: Stage-2 huge mappings for np-guests")

Not sure if it really matters but it's more about fixing f28f1d02f4ea (KVM: arm64: Add a range
to __pkvm_host_unshare_guest()) which introduced the check size !=
kvm_granule_size(). Even though this is noop until db14091d8f75

> Cc: Vincent Donnefort <vdonnefort@google.com>
> Cc: Quentin Perret <qperret@google.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Vincent Donnefort <vdonnefort@google.com> 

> 
> ---
> 
> This addresses the bug I raised here:
> https://lore.kernel.org/linux-arm-kernel/17b526ff-b824-4c24-8ac0-6821e5cc8900@arm.com/
> 
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 8957734d6183..ddc8beb55eee 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1010,9 +1010,12 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
>  		return ret;
>  	if (!kvm_pte_valid(pte))
>  		return -ENOENT;
> -	if (kvm_granule_size(level) != size)
> +	if (size && kvm_granule_size(level) != size)
>  		return -E2BIG;
>  
> +	if (!size)
> +		size = kvm_granule_size(level);
> +
>  	state = guest_get_page_state(pte, ipa);
>  	if (state != PKVM_PAGE_SHARED_BORROWED)
>  		return -EPERM;
> @@ -1100,7 +1103,7 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_
>  	if (prot & ~KVM_PGTABLE_PROT_RWX)
>  		return -EINVAL;
>  
> -	assert_host_shared_guest(vm, ipa, PAGE_SIZE);
> +	assert_host_shared_guest(vm, ipa, 0);
>  	guest_lock_component(vm);
>  	ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
>  	guest_unlock_component(vm);
> @@ -1156,7 +1159,7 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>  	if (pkvm_hyp_vm_is_protected(vm))
>  		return -EPERM;
>  
> -	assert_host_shared_guest(vm, ipa, PAGE_SIZE);
> +	assert_host_shared_guest(vm, ipa, 0);
>  	guest_lock_component(vm);
>  	kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
>  	guest_unlock_component(vm);
> -- 
> 2.43.0
> 

