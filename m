Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACD3C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 18:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ/DTelLQW8X8WLIzdKUZ9IVFS1QEQ7S0xRLul8dB6U=; b=dE06os1Xfd1lLyA9ZvZT3tpT53
	w/fxz5GwHBK53Bzd8QvO8SZjqugxMGUldV728pIEOFZDFJ5sOtaB5aVIGYQPfASmn1RGXz1Ar0Kk9
	DVanNmPc/MVlZPuBume47ZVxM4+2PTx0sbTNKUY62LFp8sbDefzKSnX8GifHgWAFmqhYMg153JBtw
	oY8cWcwPMewuJTnL5RnBZMg41swqxgKGRcW+EGtF0w4is/86tNkbrij7Gi3b/BQcJvxUQkVoBU9TG
	VUesdpETPxkGPAXF4oXFEl3Lhvdld+E85xbQnpFos/nQfFZ3gD4X+WPWfhpnF9y11neEUFgTejjFB
	YFkzqfqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuDkF-0000000GqoP-3Yen;
	Sun, 22 Feb 2026 17:59:51 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuDkD-0000000Gqo4-3Owc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 17:59:50 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5069a785ed2so620661cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 09:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771783188; cv=none;
        d=google.com; s=arc-20240605;
        b=VKbZMutKcjl9jaNo7W/y+Ej2w2K1mj5poZ9Q6uOBoU4D/PSNePhHDYbR+Ao7GG9MoR
         MRqvWmppv9S/RVUzGA3SE13VDbR0kM7dho8voD2P6DQFyq5kpPrqKd1Qdr7klK4Y0KP2
         L6crF5ADRgr/64GZoTY2RehBV3Xl/oZNedQNE7oRfpshNutbJzQ0Eu6oqYCEmNRAo8Zq
         3rTgrloR5aFesRHTYfQU+fcCMzd7IKLLPGBJYWAOm24XvpJWKRS9veNQ9Yg0HY/CJI/D
         3OeJe7wuBts2GqcZUoM3b8w8ej3Aed6RU/7+EGLaOWmeTEayKK699KDfCOr2jdG4ZMW2
         siHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pQ/DTelLQW8X8WLIzdKUZ9IVFS1QEQ7S0xRLul8dB6U=;
        fh=akvb7QwUe4a7j7UOMMnMCwy7Xeedh7vnPy3OcLnpqbA=;
        b=PhpOzz/TUyA6FXimF6LU+KWue5QRTtyKG6R7YNzjWeCHteQwLfMrWmsUp5zN28NAEy
         WQmxYO8p6qDqJociWDp92EqkD6E6i0r2FiylZyIQVp2OWc/L3fpGKddz0hL9CXc/GrHX
         xYXxXj4MNgS2zrmzABcD9gloywndYsb3kjuzbZaCsmwFcRMaPqO4KNCzyLK3P0ZIrtpB
         vttIwISOW7kj8RjMZSuWIL2Muh6LvlcBt/Wa+7R0IyjN9d2VEye6RDL18aoa35HtBeuq
         sk8jqQ0cMmI7tArkYEXKpmWaImSIJOrBSeJr1EmJS9Rxg5TXZbW6eUZxZUwRbDpTyMBo
         k6jA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771783188; x=1772387988; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pQ/DTelLQW8X8WLIzdKUZ9IVFS1QEQ7S0xRLul8dB6U=;
        b=h/fpoomF87xw6bs6cUuKWrMCA62gMSkRMHunGP2YZZ2sbuiOSfWc1eiRb2AiJ7zK26
         MkKKVhnockMTrpc3fI/j3XkoPBgYl2XQZ4clrM0CGjefXfOdO3eGAyt9yGdUkNOTSLDq
         R3hySm5PQFBgX2OlYE2a4Gyn+G/O9wdzjqzKiYPb7qrLkUqg/PxOOQdWT0Dogu7u9VhG
         9+WfiI7d+Jr7yBl57KezLBE+T0FicuM78/e6jXKQn/zR6lZh2NCyODVklgm9/Tg/3799
         2u+MdZuh/f1HNchZ1gV0XzBUXckHhtYqCHNaPIm4L5c5glGhg4k/9KlsKEj113L7902E
         D+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771783188; x=1772387988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQ/DTelLQW8X8WLIzdKUZ9IVFS1QEQ7S0xRLul8dB6U=;
        b=PmqHlvMjk/i00pJocrtO/QZq5PAomSzCTv8dn09CpqD4JnpsyAX3Ap794CwsE5FcqS
         eVnLHGwY16Xn1EDt4UmxER62rIWjkq0W6LJWfEa76cf29swzXEp7R1yY5dbbbZzI/bml
         BIw42kQVox1AH7rejpP1rKOrvLgi0aU9WdUuA7lbp0kq7ojBI7LU/Qq3VKy45hpyp6Pr
         bbbfdQvAIYfjV1qC/UByS7cUi/6MaomSKTmk/HcQd0AzAXRl77LtPEUi6+2XhRdXxppr
         6Ki6HDr8o2/ZVygDBaVz7oAp6A7b8DMEX9ua69eUAI7VRejSL7OyGk5NLDAPIMzIS3Sc
         k7yA==
X-Forwarded-Encrypted: i=1; AJvYcCVzEyBGtfUQNMIdjda3UFZkfKx/FN0RiYVikUTUKAG2bhtnl/SP0zqaS9j+EqLRldpbq/DIC0TszdviU66bCRTV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv5ngnzz4kF7QCmdo9OhcfSezYsz0uLN/TOLb7/0sjx/gkdxyZ
	bW8tyt18es9jdDDxB6erDfWTU/iB9DBu1ZvvFuQL5u/jESZdgjhg5JeXHfqbjgQXcjxv57CT4D5
	UcAAXUDOY5pjB7kudTsiK/7X0Rx+0skcD7Zz+0NNj
X-Gm-Gg: AZuq6aJQU4L2ZAkpPVpmhLAG8Zw0L2hkRIIHYf4TpkXc2wrKpyLsxWy1ouwjz/eXMTO
	4Mzm2It2KGeCNTQSHZKXgdKAblmInUxFotCnxD+ad6SJA6jZFjZXF/yeYEjz4TZ9LfpYooIn4dc
	LEvKSyGrk3ZK1cslx2T+rhkiLpX2NJFz7GAyl4oAv1pJlNkAkfBozuKF6INOPNGsSdYRrrI5wCA
	ihopjymKY6NVlhbpyOSUqTcIX7h5CuXzfxF+/jtA9KupjQHsPMFzUUOc84U6hfCT/f9nVO7bH8K
	FZzQJ1hf
X-Received: by 2002:a05:622a:1451:b0:4ff:bffa:d9e4 with SMTP id
 d75a77b69052e-5070e8c5755mr13358721cf.13.1771783188028; Sun, 22 Feb 2026
 09:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20260222141000.3084258-1-maz@kernel.org>
In-Reply-To: <20260222141000.3084258-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 22 Feb 2026 17:58:00 +0000
X-Gm-Features: AaiRm50zqZjqoVrNG72cEBICJ3I1cXMK2s6jm__GSaPoqNDpAt8k3N-biQWzjiE
Message-ID: <CA+EHjTy4p-Mbfr86NR9n1LgHC0EWrkdVjYb8O3z7k=Lv1entQg@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Fix protected mode handling of pages larger
 than 4kB
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_095949_898537_44DA4619 
X-CRM114-Status: GOOD (  33.79  )
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

Hi Marc,

On Sun, 22 Feb 2026 at 14:10, Marc Zyngier <maz@kernel.org> wrote:
>
> Since 3669ddd8fa8b5 ("KVM: arm64: Add a range to pkvm_mappings"),
> pKVM tracks the memory that has been mapped into a guest in a
> side data structure. Crucially, it uses it to find out whether
> a page has already been mapped, and therefore refuses to map it
> twice. So far, so good.
>
> However, this very patch completely breaks non-4kB page support,
> with guests being unable to boot. The most obvious symptom is that
> we take the same fault repeatedly, and not making forward progress.
> A quick investigation shows that this is because of the above
> rejection code.
>
> As it turns out, there are multiple issues at play:
>
> - while the HPFAR_EL2 register gives you the faulting IPA minus
>   the bottom 12 bits, it will still give you the extra bits that
>   are part of the page offset for anything larger than 4kB,
>   even for a level-3 mapping

Matches the ARM ARM.

> - pkvm_kvm_pgtable_stage2_map() assumes that the address passed
>   as a parameter is aligned to the size of the intended mapping

nit: pkvm_kvm_pgtable_stage2_map() -> kvm_pgtable_stage2_map()

> - the faulting address is only aligned for a non-page mapping
>
> When the planets are suitably aligned (pun intended), the guest
> faults a page by accessing it past the bottom 4kB, and extra bits
> get set in the HPFAR_EL2 register. If this results in a page mapping
> (which is likely with large granule sizes), nothing aligns it further
> down, and pkvm_mapping_iter_first() finds an intersection that
> doesn't really exist. We assume this is a spurious fault and return
> -EAGAIN. And again.
>
> This doesn't hit outside of the protected code, as the page table
> code always aligns the IPA down to a page boundary, hiding the issue
> for everyone else.
>
> Fix it by always forcing the alignment on vma_pagesize, irrespective
> of the value of vma_pagesize.
>
> Fixes: 3669ddd8fa8b5 ("KVM: arm64: Add a range to pkvm_mappings")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/kvm/mmu.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 8c5d259810b2f..aa587f2e28264 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1753,14 +1753,12 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>         }
>
>         /*
> -        * Both the canonical IPA and fault IPA must be hugepage-aligned to
> -        * ensure we find the right PFN and lay down the mapping in the right
> -        * place.
> +        * Both the canonical IPA and fault IPA must be aligned to the
> +        * mapping size to ensure we find the right PFN and lay down the
> +        * mapping in the right place.
>          */
> -       if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE) {
> -               fault_ipa &= ~(vma_pagesize - 1);
> -               ipa &= ~(vma_pagesize - 1);
> -       }
> +       fault_ipa &= ~(vma_pagesize - 1);
> +       ipa &= ~(vma_pagesize - 1);

nit: Since we're changing this code anyway, should we use the ALIGN
macros instead?

Reviewed-by: Fuad Tabba <tabba@google.com>

and using 4, 16, and 64KB pages:

Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>
>         gfn = ipa >> PAGE_SHIFT;
>         mte_allowed = kvm_vma_mte_allowed(vma);
> --
> 2.47.3
>

