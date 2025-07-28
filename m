Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BD6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 16:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNLH1XGynTNpYBFmaK8XIye+5/rKMPGnnVK77mDGOUE=; b=i9emTDccJi0Cnlr3RoDwsSOiGX
	CJNI7Y4DD/993f7K+wJQAq03XX93BjsOhDpoaiB7uGxEatDLAB6DoH5SsDakZjIM09pEnG0mL+8KW
	2FWsYDdALvGnOG1ZYvXUH58Qi6UCM5cFoYkGK6edQD/Mk9vTwzZqhJUg467PLS34S2t3jsMGIqPSU
	PzxCluDoapIsY9O+2IFkglEfTfLktyMxvUHqBRybkNrsLTlz4LouzAx3R5w8miBI/6mCazecwn91a
	xx6DIYcGKDvz+nbaqTXB87Zrv0ZoHFc7peyYu2tvpRPZA6ZCiyeXnVjNBqJImCcTKQetWA+ysDqHm
	TkzK6woQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQq1-0000000EznL-40Ub;
	Mon, 28 Jul 2025 16:36:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPw5-0000000Eqh6-3StM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:38:47 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso4779361e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 08:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753717123; x=1754321923; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNLH1XGynTNpYBFmaK8XIye+5/rKMPGnnVK77mDGOUE=;
        b=C51Y/hwQhWkuMFIiNg+joR36VOiPQQsnXDVmYfemyWRYHj4Z+B1pqL4iEkbvpwjWLN
         +9SRSQCiZMk6Mv3YTcshOB/jCLIWPZU91SMl3+fLnWevtHan5fkeu3T0w3Yl4mVCQ4KR
         dUnX1cL2todjN7PuUJa4/MP60RMI1LFu8gfZEcwnjfARm9M1LQPKalC3MFZoXBtwK7Gu
         8RGjJsEQqcvOa1revzpBkDQQ94fLxSt6VphEbpgmsljEWUWTmMO8feD5cDOxouXq1qMz
         fpX+8UFHt4IwICpVXJCFOtTfv4WPZ4ktPIXBO/kBfKK2HCRysBSiuO4RWmBAerA6f16B
         y8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753717123; x=1754321923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNLH1XGynTNpYBFmaK8XIye+5/rKMPGnnVK77mDGOUE=;
        b=wD7az0Dib261M+DktG1TjrhSEqUqTnGHkff6akFUVmBHx2p9V8krtlbmcH4yQIQ90c
         IOKyjX9wzoVXvoJVN70/64i0Cmv2ntCAljEFLJe+DUnjCvR5ELteUMG8gSDM+KrgR52S
         U7LHV4ribCblZaxhq+r6MaXNMWtZch2rooVKMQ5B/SpF2Y+F/bwI9essXxMLRazA7F+a
         k3RxLxN5Cq18F5aYzNUIe+bR4adnKts7ziwqxLPt7Z7B6c9nvzywRRs5lAbehWW+nrKA
         Uf25Qw/Cd65swguZEjSYATdw9aTl7Z720Q47XQtUqFILmF0fh/GezErUEYLQReeOaYmn
         HN0g==
X-Forwarded-Encrypted: i=1; AJvYcCX2NjH/5fz3Psi4QREwg5LhgPMmeAvIzmEsF/xFORygu2NM/eLoEge9Etcn8GwxpVShZUqcgjKYSVpmDzAfeQSm@lists.infradead.org
X-Gm-Message-State: AOJu0YxXwKgovBF8gSFe918HSsdjyeCnzlQfSpSCIzCGE0aVWZXp+mOK
	+rPRZ29jwmSGqkk64rMSlje/hnUokKHm83NWaN4JicFG5LiEh6U3/A7+Wn+c7ehdpQ==
X-Gm-Gg: ASbGnctTw0HjZe2TJYlg6NANX4UhIk4hOhTAtBeZqCPSFPeyAfOk29XgbgkazNsAjDn
	Vwb7qUn1QjxStz24PKHgauVBbbkU2bK4dBgiJyo2K+SclCobIeH3TAJIgIWBjcG4DOJqNALIZe5
	jXop8nEgXuyT5RSiETGNs8BipDGBztgMlOgSCR2CKs3Zx4zCwcbcaol3c1N5ehvEGx7OUKmmLRz
	It7bnsUY5CQmfu4hevTpb5Qqc88mJs06xqzPSzENrnHQMPB0nSx2QG1+L1DrogNYOGAv0/k70VS
	NL9FxsnnMGo1ZM6xrNNUz5TqebArInEL4SyfFPfIiwwN0to4rJV09opZq3yL6/6Mlfb83H9v3eb
	agaJisaJUU78sQf6Sfvho33BTGLHR9ILUxQ4b6y6jU8O+uSQ0nYCFYMmmElQJdQ==
X-Google-Smtp-Source: AGHT+IH6F0Hy391rO/cn41nSe03RC63gIk43a9xDAqTl5D1CjpIWHOxWG5o4zt9CXrYkBVmu/NZp4Q==
X-Received: by 2002:a05:6512:2242:b0:553:d9ba:a171 with SMTP id 2adb3069b0e04-55b5f4abb6dmr3149291e87.43.1753717122920;
        Mon, 28 Jul 2025 08:38:42 -0700 (PDT)
Received: from google.com (103.245.228.35.bc.googleusercontent.com. [35.228.245.103])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63363a80sm1316646e87.85.2025.07.28.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 08:38:42 -0700 (PDT)
Date: Mon, 28 Jul 2025 15:38:39 +0000
From: Quentin Perret <qperret@google.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, "yuzenghui@huawei.com >> Zenghui Yu" <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, vdonnefort@google.com, 
	Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ryan.Roberts@arm.com
Subject: Re: [bug report] KVM: arm64: Add a range to
 __pkvm_host_unshare_guest()
Message-ID: <qos5jspmx6p7js3eflgrv62ocn5guhoaqoz7pnlsn5ylkjlusk@klq26b5l7wdz>
References: <17b526ff-b824-4c24-8ac0-6821e5cc8900@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b526ff-b824-4c24-8ac0-6821e5cc8900@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_083845_873348_D3074F4B 
X-CRM114-Status: GOOD (  19.10  )
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

Hi Ben,

On Tuesday 22 Jul 2025 at 13:59:06 (+0100), Ben Horgan wrote:
> Hi,
> 
> On trying to boot a pkvm guest when using transparent huge pages I see the
> crash below. I'm using v6.6-rc7.
>
> kvm [141]: nVHE hyp BUG at: arch/arm64/kvm/hyp/nvhe/mem_protect.c:1088!
> 
> It looks pkvm_pgtable_stage_relax_perms() can be called with a block mapping
> but in __pkvm_host_relax_perms_guest() it assumes page size for the
> assert_host_shared_guest() check. With the following patch, I no longer see
> the crash:
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 8957734d6183..52c802da4172 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1010,9 +1010,12 @@ static int __check_host_shared_guest(struct
> pkvm_hyp_vm *vm, u64 *__phys, u64 ip
>                 return ret;
>         if (!kvm_pte_valid(pte))
>                 return -ENOENT;
> -       if (kvm_granule_size(level) != size)
> +       if (size && kvm_granule_size(level) != size)
>                 return -E2BIG;
> 
> +       if (!size)
> +               size = kvm_granule_size(level);
> +
>         state = guest_get_page_state(pte, ipa);
>         if (state != PKVM_PAGE_SHARED_BORROWED)
>                 return -EPERM;
> @@ -1100,7 +1103,7 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct
> pkvm_hyp_vcpu *vcpu, enum kvm_
>         if (prot & ~KVM_PGTABLE_PROT_RWX)
>                 return -EINVAL;
> 
> -       assert_host_shared_guest(vm, ipa, PAGE_SIZE);
> +       assert_host_shared_guest(vm, ipa, 0);
>         guest_lock_component(vm);
>         ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
>         guest_unlock_component(vm);

Aha, indeed, that looks broken with CONFIG_NVHE_EL2_DEBUG=y...

Your patch has the correct approach, but we have the same issue in
__pkvm_host_mkyoung_guest() which needs s/PAGE_SIZE/0 too I think.

Thanks for the report!
Quentin

