Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42E7E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMYpfoWdpBNaOFR2NyYkq3I9j/Q/VkoKRerwMIo78jE=; b=plwHjsCUjj3u6Fg1wyPNnnA8Ni
	peCGyHhRSiC7BPoZLg8v/rUrj+3633UN0NQG/RMqf/AslAz4aDm7vPTikya9FMl5eCNkSOQ3G8G+r
	7DavihcCIJxFx65B00vOkPRYYJZKqibXRW2BPRtKukc3d/iZTXZgizOKAvDqpLVk9rsdfXpuOSe86
	L/vIgp7NuPeGgP1qFalAPCCRD+ka0/leKGM4A3TfCzquBjsdCwRIiZWYPW/yN+1vq4pmH0IrGwHu2
	4SUatx14VZLWJHgyGhHd1ZdhkOjMN0RLqEk2J4L1gJh6lF1Nm7LSk+PNmybTf8AGj4A5reBt7gDOn
	H6vKe0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTNK-0000000CnQG-3FKs;
	Tue, 17 Dec 2024 08:56:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTFW-0000000ClNF-3gPp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:48:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361d5730caso27225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425293; x=1735030093; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gMYpfoWdpBNaOFR2NyYkq3I9j/Q/VkoKRerwMIo78jE=;
        b=E7JmcAHkLKAAdBxIUtpISxH2CS2rq5lvgjyWZ9o5tmmzT3qCRf7mf0k6qsy4XS/oHH
         khujxTd1OWeLVaq1eREaJaWfRynnFmQWkEV/OJFzhAGAixHgUfnEfCLucQm1NXsDAsEb
         H/NY5b4LR5fcOhZpFjO0sPTHzbsl1PD/TLpgX15bYHTomLm3OTjEUN6nSp/7OKH3q8ZW
         3NYWOXrUCwDFCvPgwKLMygqCriOxoanZ+BxcYxdKMFw1jGRcdq9Rt7EYpn1rkk73OaTe
         dYsvw/+MgjjHpexC5H4V9zLtjbC55SmAw2mgx5gtwNgjbaBRxVPmD9CeOI4sfNSb3sKu
         8iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425293; x=1735030093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMYpfoWdpBNaOFR2NyYkq3I9j/Q/VkoKRerwMIo78jE=;
        b=jM+T3AhcaXQcy7lQ/VhkTGZ7UvS8/SPWlChJrK8Ih+uml7KtPwl9hhD9f/cbkjtrvX
         VEqn+7IwEIa76fW7YBQNUZKtMEQykfXGUkeTzrYeJfeanNIy9XF0dXr7iUpObphVf1pB
         DJ3fD0OcUFrf6iWbMG1NtoCQ1tYBqrB0R6i39BtT9e0YHJIAumERwBUcnLggn7Fr16vo
         iavuV3lrp6Yse7bq7jFdNTrR8alypZ3dd883mnnWiciEWyXec1QmD59oTsZAmpv7Jc6a
         Adwcue2rDSzTcHGgeArHV9kHQ3hRbZ71BB3gHFc2mguv4o4ArEjPCVhI+YBWLwZ4j1hW
         6XAA==
X-Forwarded-Encrypted: i=1; AJvYcCU1x01zRQKsFGBczgQ2PR6MVlydUzW2jKYpg1EQo951z/ye26dw0H2OYU6rbPBvaKOif0LWkEa2gbPmPaU40WiB@lists.infradead.org
X-Gm-Message-State: AOJu0YwfkltJ7GNxZMjsxg6C8BoYl9/SfHazYPX6nd60Y5IfOkRdebd6
	Xem57L7NmRhUD6neX7ACyjUt1Suj3NXBZg96yZ2+XHmlRwzGtLT0VsAIdL6X7rkfBNU89kPLXiU
	iSVuvdGRf2BPk/S3rpwg8UhpowPuEd/wDx38E
X-Gm-Gg: ASbGncsnGxlbNUdQfw/Wb/J7cu1rjzYGtsGfW9Ga5p6bx/w45Akbre6YfWBGmfsXa2b
	uWsQFkSJ+eMWHEtJtVlsNuPl7dPWN789GZq0xad6ubRRGAi2bTBP46ZLkTL1SMl1QMaE=
X-Google-Smtp-Source: AGHT+IG/Se7TNjDy/dA04D4nI9U71yqzcRt/JnA8mD3zMM8rr+IipCSu6Ag3mBRutPKt603pm6N3vN4f+iqaAFukznc=
X-Received: by 2002:a05:600c:5707:b0:434:f7fc:1b18 with SMTP id
 5b1f17b1804b1-436492cfbfamr896425e9.4.1734425293043; Tue, 17 Dec 2024
 00:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-7-qperret@google.com>
In-Reply-To: <20241216175803.2716565-7-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:47:35 +0000
Message-ID: <CA+EHjTyf+yjBsQ5zGs+PZJGUJSSftyEepo6A7YmgMnf8cTMH1w@mail.gmail.com>
Subject: Re: [PATCH v3 06/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004814_913936_58FA6C6F 
X-CRM114-Status: GOOD (  20.79  )
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
> kvm_pgtable_stage2_relax_perms currently assumes that it is being called
> from a 'shared' walker, which will not be true once called from pKVM. To
> allow for the re-use of that function, make the walk flags one of its
> parameters.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
>  arch/arm64/kvm/hyp/pgtable.c         | 6 ++----
>  arch/arm64/kvm/mmu.c                 | 7 +++----
>  3 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 38b7ec1c8614..c2f4149283ef 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -707,6 +707,7 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
>   * @pgt:       Page-table structure initialised by kvm_pgtable_stage2_init*().
>   * @addr:      Intermediate physical address to identify the page-table entry.
>   * @prot:      Additional permissions to grant for the mapping.
> + * @flags:     Flags to control the page-table walk (ex. a shared walk)
>   *
>   * The offset of @addr within a page is ignored.
>   *
> @@ -719,7 +720,8 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
>   * Return: 0 on success, negative error code on failure.
>   */
>  int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
> -                                  enum kvm_pgtable_prot prot);
> +                                  enum kvm_pgtable_prot prot,
> +                                  enum kvm_pgtable_walk_flags flags);
>
>  /**
>   * kvm_pgtable_stage2_flush_range() - Clean and invalidate data cache to Point
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 0470aedb4bf4..b7a3b5363235 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1307,7 +1307,7 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
>  }
>
>  int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
> -                                  enum kvm_pgtable_prot prot)
> +                                  enum kvm_pgtable_prot prot, enum kvm_pgtable_walk_flags flags)
>  {
>         int ret;
>         s8 level;
> @@ -1325,9 +1325,7 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
>         if (prot & KVM_PGTABLE_PROT_X)
>                 clr |= KVM_PTE_LEAF_ATTR_HI_S2_XN;
>
> -       ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level,
> -                                      KVM_PGTABLE_WALK_HANDLE_FAULT |
> -                                      KVM_PGTABLE_WALK_SHARED);
> +       ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level, flags);
>         if (!ret || ret == -EAGAIN)
>                 kvm_call_hyp(__kvm_tlb_flush_vmid_ipa_nsh, pgt->mmu, addr, level);
>         return ret;
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index a2339b76c826..641e4fec1659 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1452,6 +1452,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>         enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>         struct kvm_pgtable *pgt;
>         struct page *page;
> +       enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
>
>         if (fault_is_perm)
>                 fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
> @@ -1695,13 +1696,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>                  * PTE, which will be preserved.
>                  */
>                 prot &= ~KVM_NV_GUEST_MAP_SZ;
> -               ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
> +               ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot, flags);
>         } else {
>                 ret = kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
>                                              __pfn_to_phys(pfn), prot,
> -                                            memcache,
> -                                            KVM_PGTABLE_WALK_HANDLE_FAULT |
> -                                            KVM_PGTABLE_WALK_SHARED);
> +                                            memcache, flags);
>         }
>
>  out_unlock:
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

