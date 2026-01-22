Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36945D3EE75
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SOD/6X3mG1xpZ/GXzcTSM0w0ZvUC8Ff0nJjpMA7FEg=; b=jxcY190JYef2TSdhPxI8iLU7IA
	xxNCbitq1npwPj30JpCbbeVCnSmaK39JbcOiMpvY8JUnmjjg7RZ3CUGrO/tBIHcMp8WCBOT53CUtI
	iFsqQi9BdRYBug2I/GjnG2NMUTBxRS9il4Ny8FmK2zn/VTGkgC4X93h+yHTIvBuDXGh3FLMs2dbnd
	cwTaQt9rET7y2OVe+i/ZoX1KV/lcdb10avTaL9AmV3gXrPTai6+dyA2rMyfZN1w5XewzVJTNErQtO
	c+rTS/EnD4irT5HnNgD1EsJc4gua/eurhCZOk/Bo1qqv+GNQlxBxFOSHBXjHsjJngQPs3lqaPn5tb
	5XSIQQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwJb-00000007Itw-41Gs;
	Thu, 22 Jan 2026 15:09:43 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwJZ-00000007ItL-1YPU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:09:43 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50299648ae9so360361cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 07:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769094579; cv=none;
        d=google.com; s=arc-20240605;
        b=GxrUqJJUhdBMoQzTw9LtI+pjOPaBwquFq4PuLJXdUDmJGjTOEKraIRqwOFNyJEtKDP
         M/Bl7Fd/9FRh3loANqb6a/WVf7cO0TnhcdwotzLFaFVMFplHMAQDBuWWi06b0w+eZSDG
         6BkeBvSq6gJFysIB8KC0ZILXGei5AQNN8JekeDSiTrvk1+AP/2U8wnKmuYsDvSoLaOJj
         vmZZe8wcaMc9dgOudOwLm/PdgXhYTOsOxCqqfzqvYo6NL+8DJYQL1cUXtUBPIdcOoOxP
         uNGDlBmRQHlpQrqbgSTiHsNF3WziXlGrwZbHXC8VWTUB2yaO84di5wFiIH/G3pdPm7PC
         dSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0SOD/6X3mG1xpZ/GXzcTSM0w0ZvUC8Ff0nJjpMA7FEg=;
        fh=uRGtR07YJNalVBim930zPTq9/MeTiqugrDrB5syv/0c=;
        b=JbY8N+x+lTCDKTyRPbfNuO7bNQgDhm/izrOBVNMTaGnbLN8l81gAsFrE6lR8fDjNaN
         wKU6B6WeNmk1avSTLrC0dKAwxKcZ9ylHs9LmqlsUV55Na/Ogz1v51gxaLYHZzcqJjo1L
         9jvLSPuNcT6mgAmi3+/w1pqlm2ywo92mBvMjtaNBSh2IlkxoG5a/a2c7NoenyU0Omvpx
         dzkTmiUdiVOO/KW/vUKd4aIb75tZr17i+gXqBMDBNlBPx53uMUTaBIzLa/T7cdCNkZep
         cbD2wQ0BADgK+wh0rqko7oyfoygR0Z/lh/vqihr24pCJulwPAxWM2f0MvBd1jRg7lumw
         Eryw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769094579; x=1769699379; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0SOD/6X3mG1xpZ/GXzcTSM0w0ZvUC8Ff0nJjpMA7FEg=;
        b=l0r5wL4ctIY1tNpzaX20rVcdRYnPec1cWfA3Z+2l5fVl1jhm8e3VaDxKGHk0SOEtZ2
         Pa3Hxxh7ahuqnNBgC2UoqkjibEoHZgh85XWKkIl9M3BvK8xBpi9aCLgh6+tOV0GUTEvj
         Ph0lnQ6k10/gA6B3rzLFpsOPK4qzgOiNgH23oRmEAD9vgaQtVTsN1LuhqFuFUJxhNF0y
         YCcyM+rtvkftVz505+FXU/Bwm9L8QcrslfFQndCxi+9z97h8IVWUoEj28fzPZCb6yUwM
         CEH9z1goLOTHWbv4Ann/ZojHcupQf6rfy4z6TINpRCtDNXmoyv0EpxUbtSRgC4GY6WY7
         RmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094579; x=1769699379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SOD/6X3mG1xpZ/GXzcTSM0w0ZvUC8Ff0nJjpMA7FEg=;
        b=ZB+QWBD9iGjdUI+Ohi0E/pnU5Z9Hw4B5F7XDqpsXEURxFDMvWUZ+3y3EOeWACn70qN
         8CV/r8M2/tvo/9Ie/oKo0z+L6/QvkJXQTvV/A1darSi9qt1YIDbaxc/5Qh1uHAsx+btD
         elNX8tLjxqSZQSfdxZk3poMLUU1XoSMhm2T9rb2JlpCL02SoThYCIb7hVeQKGa+SljAt
         6MnBTJrCkpnrW7Nzl/XKxdypwX10DnXUXpYNfj6HZj8tMwCIxN0Yh+oxGU5oRLdBmwCe
         4H+fae87Vjtok8JW1kNr+SOTS6K4XprkdYY6A5QBrBf4QrfheokkEXfvoF8WPKFMJUxv
         oTig==
X-Forwarded-Encrypted: i=1; AJvYcCU7WGLSjSEf65GyEKvC7KdkhHR4oE7Z4W9YfVIYmx2WDOxLHdc4KymIjS3JPhgVeBgi763xliY75EWffJv3G7Qe@lists.infradead.org
X-Gm-Message-State: AOJu0YyjuZ4z2+ftPCYKVzwqJevsR5WY4VTcOuwteCzPwhjBpyR1Gx4K
	J6CGeNJWHhmB4iM6C80/KI7Q61tRGxFrtJ5WjytqigGrR0neXnHV8ks1aM5gT5slwzUqHOGxBpF
	XtQHM7ki6FlO3MfZW7AeSkb1cZ8fLrE11x558HMBxQLBW0nvX6rNs7449ubet3A==
X-Gm-Gg: AZuq6aIQJNPHUYI1IKyiHqUp+7XlYSBohRRme4at6w5i6KoLHHZMCTy9SadU81NhTRc
	dAMRR+jsWjYO+mOOvxEXXzUavFV7sVmUr+dk6axYjAPWSUab4SpsUuYCtR3qzZQ3bMPbD0JATpM
	m9PaSCxf1xhY6mCbBtvKzamQoDniHPGqdB8UnL35nrElaWEF4reliw79S45cOzanPSWunLRmP3C
	RPH8PXCu8DU4NzVYrL/pz4qyzgT/P0mmSmuJIsBeQfKw+sokkkBbdDpTZ9nEmnX9fVI+9aiTCLc
	m1ra1e2DqkzHSJaXib8xmEfuBQ==
X-Received: by 2002:ac8:5d14:0:b0:4f3:7b37:81b with SMTP id
 d75a77b69052e-502ebd86d8bmr12814351cf.18.1769094578876; Thu, 22 Jan 2026
 07:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20260119105651.255693-1-maz@kernel.org> <20260119105651.255693-6-maz@kernel.org>
In-Reply-To: <20260119105651.255693-6-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 22 Jan 2026 15:09:02 +0000
X-Gm-Features: AZwV_Qglbu-3ILOIPveU_u2g6xgRdY1YcuVAE1z9RXMZISdkRuf-Fa9wT3aB0x0
Message-ID: <CA+EHjTyUdCAB+-sPsK3r+jwJK_tHc52_6q=iZ9UvBWE_7=8Yjw@mail.gmail.com>
Subject: Re: [PATCH 5/6] KVM: arm64: Kill KVM_PGTABLE_S2_NOFWB
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070941_427701_9080A0A1 
X-CRM114-Status: GOOD (  22.28  )
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

On Mon, 19 Jan 2026 at 10:56, Marc Zyngier <maz@kernel.org> wrote:
>
> Nobody is using this flag anymore, so remove it. This allows
> some cleanup for stage2_has_fwb(), whic doesn't need to take the

nit: s/whic/which

> pgt as a parameter anymore.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad




> ---
>  arch/arm64/include/asm/kvm_pgtable.h |  7 ++-----
>  arch/arm64/kvm/hyp/pgtable.c         | 17 +++++++----------
>  2 files changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 9ce51a637da0a..2198b62428832 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -229,15 +229,12 @@ struct kvm_pgtable_mm_ops {
>
>  /**
>   * enum kvm_pgtable_stage2_flags - Stage-2 page-table flags.
> - * @KVM_PGTABLE_S2_NOFWB:      Don't enforce Normal-WB even if the CPUs have
> - *                             ARM64_HAS_STAGE2_FWB.
>   * @KVM_PGTABLE_S2_IDMAP:      Only use identity mappings.
>   * @KVM_PGTABLE_S2_AS_S1:      Final memory attributes are that of Stage-1.
>   */
>  enum kvm_pgtable_stage2_flags {
> -       KVM_PGTABLE_S2_NOFWB                    = BIT(0),
> -       KVM_PGTABLE_S2_IDMAP                    = BIT(1),
> -       KVM_PGTABLE_S2_AS_S1                    = BIT(2),
> +       KVM_PGTABLE_S2_IDMAP                    = BIT(0),
> +       KVM_PGTABLE_S2_AS_S1                    = BIT(1),
>  };
>
>  /**
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 07561a227f75e..3c2f7967fdc03 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -631,12 +631,9 @@ u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
>         return vtcr;
>  }
>
> -static bool stage2_has_fwb(struct kvm_pgtable *pgt)
> +static bool stage2_has_fwb(void)
>  {
> -       if (!cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
> -               return false;
> -
> -       return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
> +       return cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);
>  }
>
>  void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> @@ -664,10 +661,10 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
>                 kvm_pte_t __attr;                                       \
>                 if((pgt)->flags & KVM_PGTABLE_S2_AS_S1)                 \
>                         __attr = PAGE_S2_MEMATTR(AS_S1,                 \
> -                                                stage2_has_fwb(pgt));  \
> +                                                stage2_has_fwb());     \
>                 else                                                    \
>                         __attr = PAGE_S2_MEMATTR(attr,                  \
> -                                                stage2_has_fwb(pgt));  \
> +                                                stage2_has_fwb());     \
>                                                                         \
>                 __attr;                                                 \
>         })
> @@ -879,7 +876,7 @@ static bool stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
>          * system supporting FWB as the optimization is entirely
>          * pointless when the unmap walker needs to perform CMOs.
>          */
> -       return system_supports_tlb_range() && stage2_has_fwb(pgt);
> +       return system_supports_tlb_range() && stage2_has_fwb();
>  }
>
>  static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
> @@ -1167,7 +1164,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>                 if (mm_ops->page_count(childp) != 1)
>                         return 0;
>         } else if (stage2_pte_cacheable(pgt, ctx->old)) {
> -               need_flush = !stage2_has_fwb(pgt);
> +               need_flush = !stage2_has_fwb();
>         }
>
>         /*
> @@ -1397,7 +1394,7 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
>                 .arg    = pgt,
>         };
>
> -       if (stage2_has_fwb(pgt))
> +       if (stage2_has_fwb())
>                 return 0;
>
>         return kvm_pgtable_walk(pgt, addr, size, &walker);
> --
> 2.47.3
>

