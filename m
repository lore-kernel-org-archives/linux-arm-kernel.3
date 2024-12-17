Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBB1E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hCYoIRnSlinICHyKBQa7JIGTnDJ2BuS+GfwqYyMo7E=; b=QBKTD8Qt01a9mZm3Xe5xsQQxkK
	/3TEpaeYHgk8YuOLEO2zHHtnW3DgdRcxeap0rYiHSYDGmGy3l+gErYXCK2v9PIZ30sHPGIf7xKYCZ
	RRuK/V08oQTUFe7ZBOupVx0KtDt6GNJF6lgVQoGDlF2yGWIfxFHsryRKZWk40FQqwi4dl0WTM6gF5
	0qMies+5I6pqRCvjcoEuL4aUYK3hV3vDtVnqD5sOaZKj0ArO8E4uj/3ljY4SGLzCQfXu3Zq0Ngu3n
	1qYHI1U/XzixhUWgEzYy8h7sl9Kat4dngY1ECdEFobBx+Go7qLgyW3yooPAq+TEKd4kYWjq933d/u
	AUOQz3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTMH-0000000Cn9H-0Y55;
	Tue, 17 Dec 2024 08:55:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTFL-0000000ClKo-07we
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:48:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4361d5730caso27155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425281; x=1735030081; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6hCYoIRnSlinICHyKBQa7JIGTnDJ2BuS+GfwqYyMo7E=;
        b=gul0XrP/i7ChFC787CGFXBJRJRJS2ydj7LJTR1Vw8rp44TUqb9uoXBZNIWqkb6S2w9
         kxMHWgITmuoXrEj/zvvCjy0aMijm91TURjnad/msjr62vIwFr34p3tgSNPtv5c0ebzUK
         tXlB4jQaarnODMTGX8W+2vGyEAzBYTSiTOmWoEW1nK8iYa6bq0hW18QJtW1p8mOpOwA5
         yGaGbmM98GDPL0DAB2PPlA+l6I4J9ANB3STgMx7GFeAd/ZrYa7sUaggRQE6R0HBLBf55
         Jy/+Uxo9NObA1LSBPCHWO5mBivEGHK9iKUqosI0utRw2cDqNTIC2TkfScdgghg2gfn/x
         65Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425281; x=1735030081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hCYoIRnSlinICHyKBQa7JIGTnDJ2BuS+GfwqYyMo7E=;
        b=W/vdyeOIrPc4MRjSo355+mRJoehj80PdKZGMa4Gh3ERCsIiSpP+eJCfYsiSGE34ngh
         XLYJ3y9FWy75l2+pksayxoF+vsCGBXSPSft61TYEnfptY/gtj5ZN2Lo3r/I3qAptU3pR
         3KRPcFVs9o/RKAtM5BytjNKqLouJSX2O8z722trmYYmthq8GKtOwcEPGYyIir3QJOTRu
         eIygUTnN7SfmtiXHZ1hJq9FL5xEeIK37YU4I4V/cl4mFbDA8WsHVNWDwThCOhu1w8Re3
         vUaqJvhZlHMaZJ/kotH7xT38gIgIWOula9RBpXPwl8NTm697xK5xP6quSZOYoxPd8KbK
         S8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVPymHX5HgfBb2Xatl4pQ0eArIJBbN+2mg2KDaze3+iun/NYIdk6PWAhuqu2sKU2FHlKRwpkxZ3zcWIRprotpeU@lists.infradead.org
X-Gm-Message-State: AOJu0YzRoDg2KDQlEgMiC0/cjMdFaPzNYl4ICK6Q6tia8NX5vKBL/urI
	A5SdEnnN8TARYaXfNscn30jl4pTBNFATkRMxzfWhpxexhk1KEEG0j4NTrEIBQHGDJ/xJexYcfEF
	QmDqlLx+qYC9mnJjBhNTCBc67R76yC8h6bDLP
X-Gm-Gg: ASbGncs/kGt5EKUzbf6KrVmI7FaYZuzxFkqNyYgdeBPZjf5rIIRqDvU7jJV9zpN5BvK
	6b9Qu2enFj6Adc5bdCt8/1lkfgKeoez5FaDIqP5QRl/zobKmcH8QwJNr4RLwaG5wNkFA=
X-Google-Smtp-Source: AGHT+IFxXKN9usqQV3kNbNh4Lz31/fk7TbK5vkz5uPgTlGxQEqYyZajHdqHVpeCOx8ECqjWbYxVv8GfDoeuTtmoKPxQ=
X-Received: by 2002:a7b:ce88:0:b0:436:186e:13a6 with SMTP id
 5b1f17b1804b1-436492cf51dmr1039795e9.6.1734425281269; Tue, 17 Dec 2024
 00:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-6-qperret@google.com>
In-Reply-To: <20241216175803.2716565-6-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:47:24 +0000
Message-ID: <CA+EHjTzfqR8=g=VzazL3__TyGpJJtPCoG20sJeUnY+d0b6NSBA@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004803_066663_F05E3D4D 
X-CRM114-Status: GOOD (  21.77  )
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
> kvm_pgtable_stage2_mkyoung currently assumes that it is being called
> from a 'shared' walker, which will not be true once called from pKVM.
> To allow for the re-use of that function, make the walk flags one of
> its parameters.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
>  arch/arm64/kvm/hyp/pgtable.c         | 7 +++----
>  arch/arm64/kvm/mmu.c                 | 3 ++-
>  3 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index aab04097b505..38b7ec1c8614 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -669,13 +669,15 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
>   * kvm_pgtable_stage2_mkyoung() - Set the access flag in a page-table entry.
>   * @pgt:       Page-table structure initialised by kvm_pgtable_stage2_init*().
>   * @addr:      Intermediate physical address to identify the page-table entry.
> + * @flags:     Flags to control the page-table walk (ex. a shared walk)
>   *
>   * The offset of @addr within a page is ignored.
>   *
>   * If there is a valid, leaf page-table entry used to translate @addr, then
>   * set the access flag in that entry.
>   */
> -void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
> +void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
> +                               enum kvm_pgtable_walk_flags flags);
>
>  /**
>   * kvm_pgtable_stage2_test_clear_young() - Test and optionally clear the access
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 40bd55966540..0470aedb4bf4 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1245,14 +1245,13 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>                                         NULL, NULL, 0);
>  }
>
> -void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
> +void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
> +                               enum kvm_pgtable_walk_flags flags)
>  {
>         int ret;
>
>         ret = stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF, 0,
> -                                      NULL, NULL,
> -                                      KVM_PGTABLE_WALK_HANDLE_FAULT |
> -                                      KVM_PGTABLE_WALK_SHARED);
> +                                      NULL, NULL, flags);
>         if (!ret)
>                 dsb(ishst);
>  }
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c9d46ad57e52..a2339b76c826 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1718,13 +1718,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  /* Resolve the access fault by making the page young again. */
>  static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>  {
> +       enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
>         struct kvm_s2_mmu *mmu;
>
>         trace_kvm_access_fault(fault_ipa);
>
>         read_lock(&vcpu->kvm->mmu_lock);
>         mmu = vcpu->arch.hw_mmu;
> -       kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
> +       kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa, flags);
>         read_unlock(&vcpu->kvm->mmu_lock);
>  }
>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

