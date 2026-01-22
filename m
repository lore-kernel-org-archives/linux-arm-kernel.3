Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE19D3EE75
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvCkmh9jlVByBeKIvdOHUOcBwUtzU/25mi8V73JbEG0=; b=wBVGM7s5h0HB1/Eb1eOveqtiNf
	8AZ25KJa0hC7Uf/2/jKGA2MGxoYP75t0wZl/AZgmb5hfKyCoZ+E8gdrsbPXgA/UYVl4P0uxEyOorw
	zWVMIQxzVELu/yA8k8wjoPoWT2x3w2uHfxvZmfKsR9Om+AEUrKOp3vsvHe+C7sUaJWOyMK32TngYB
	YE8djkFyuftkVU3ecBtZLQ2DeSizMlxHqNaR1GgJTTINbRT1Gd+zHqXMmx2g/ij+Tzor5X0oNzp7o
	1ZIbyIgcpN+p49tsp99I0C5ZlngiBR58G9N+WDNybZTGxdR3ETtlRcfr/lvdZwC1vs2G3pH7XUgGU
	9h6ZzSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwJt-00000007Iyy-3TIb;
	Thu, 22 Jan 2026 15:10:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwJs-00000007IyH-0SSX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 15:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vvCkmh9jlVByBeKIvdOHUOcBwUtzU/25mi8V73JbEG0=; b=EDS4s6EVitpzWgkOOp8rscm2Zt
	2JgfJtiCbRw40WeZbXsFcwFP8kjij57xbBPgpMd9HqR5wNwHVGAVLaW7cK4OpWEvbCmacPtPxqBsa
	ouU6C73AIgwKxlq9yuFtTNx52rjwVwNtcFDlkBv7Eb/+QkItk5o7MlcuEgVhEbxEyHYhC9AHDQyLN
	RDrDVjBqeT5aNHbMMJUGfGra5A5O1uN42nnEY6zmse7Pzz/bAiMvEXVqLdpe4WY4ol6cJIgFA6dp2
	IYAutg3xRDquGN6e9ugvUr51QX+zDuqmzzm1U+GTm1Wp5TNe9aZsTGzKBM8packpb2CehAZb1Ghfu
	T1bSNtvg==;
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwJp-00000000aVm-03ko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:09:58 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-501511aa012so379771cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 07:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769094594; cv=none;
        d=google.com; s=arc-20240605;
        b=kLouPafBHjdjaUYQdUsCGKX6ncm/ARSVX6p9k9DNIYkz9uvdwtySEMy1Co6i11Tdmq
         6l/b+Tko9XUMyO/UI9aPxXDtM8IVKAb6e8wc1Exqju6V0BEd7m8pSHga29imVr+cl5Rb
         bwydJdwIAYs8hhIIxAj0bZuXfm4jMrjYt39vY/TZYFWKvz8TUmucQ+OxkBEjIIQq4sCl
         KMpLOfiZDf5HGSEjwAqrJPKcwVqXNKAL21rprYJRtMriUyNAOLVp6V9FjmYwYgEi/Kof
         fAbA7U8Ne0Amu6qx6Gd+zprFF5jkZii5rlar8ho1PeJyUBXkzuqMZI/yaC4YMQwQET1b
         Ffaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vvCkmh9jlVByBeKIvdOHUOcBwUtzU/25mi8V73JbEG0=;
        fh=kt0k4BU4FOMp5KMuTZ6Tyd6TVKBohX0YEtbJFxyg2KM=;
        b=anUPfdVaZtU5GpBoHfyaPtWOYj/QR7CT/qu6AxA90eiV1LYkBlr4aZpo5PB4TmVOi8
         XMc+/CSVxVZZfBawJVaFHiK/9HTiGnEDOIObKtLrcMGoayHe6LsYVbD6DhEHXyAbETbl
         5vX1BGCi2EEK7Mv89NTTQRhk3PUYAJn+gd/grLYppgyopHbi8v2QVGObm4jVL62cCmAJ
         pkVZs5T3+MKqbPFC6knMHVpFSSERph5grQJ5tfwGMtY2Yu5WL+wigOtxIN/tk8KTlBYc
         UKd3q5HXs6RPwTWpH8907rWJEDbaLtbk0Oyfdtco7IGs8VOWvN21Xewr1QA35WRxkSnr
         +2/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769094594; x=1769699394; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vvCkmh9jlVByBeKIvdOHUOcBwUtzU/25mi8V73JbEG0=;
        b=xNdvwioXw9TAuxAYqKlMtwXAs7m1kzE9DO8Ih8pu3tCYV2QGk8EkRHlLbwvUd5ahwf
         ghkVVrWZs3lEe0EspiA3cgOKoPUXXc0f69khOUc9QDYeaVgRhFZlc5Ga8tUezGIOiwam
         ywqcSFJldR/cWBqDFm8Ze7aZZ/DiVXtIzOaRAEwKt37bKiwztHbA8MsDNjMeyRLYiZSL
         G7+8eR3uvOPNkGMvTQmVvaVB3JC/ZTTRVNVQw4ZBF5uc+XObbzCydIV403Bz+Z4ZaabN
         EM42+a/PHL1JeJWrYv5mj44ZduHgi7BXpWXUwLJlqpZbdefJHWFb+HqulhxEgEuy+QJ5
         qQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094594; x=1769699394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvCkmh9jlVByBeKIvdOHUOcBwUtzU/25mi8V73JbEG0=;
        b=p6DzgYs/yeXPOwVcVqpryk5sOrvNH9IkDqmKJVseI1KcsBTRaTKc6eGXTj3s2fgDqQ
         Z5AyIGW3BuDtmUDFCL0zxP4AHsiLERGJXdi/9lDAKjLhibJaHU4KMfy1BNkptb9CxROt
         kfeGrxEnjM5uCsFf9w7sZqdWkkB76Xc4KocadNXwNBUH9TthzsdWU6l0QSKWw1jFdmIi
         RpQH1Y3pV1vfFoa+8GbYChrT+GLvnlqvLepwamPipPsw7/dmCdSNc0USJSh6mgwJ6fBf
         WpIlRuNAUGa/aJLWZyoQ/6n6QKU250N0kIpuHLptcTL5NzzHTPAspSMHcjWl5wh50NO2
         cg4w==
X-Forwarded-Encrypted: i=1; AJvYcCUTPM3S3FJU6X0Ax0E6OD3xLKm8PDDp6v+vMePKERKLYBXRR/4qGDAKtNFPvbheImBeH2II7eX+MnqBBQch9Drw@lists.infradead.org
X-Gm-Message-State: AOJu0YzYGqwdi0NuVqfwevoXyUlrr9clr7lk4R757v6VoeQAnAM6fjsG
	F5g4nD/vnDWnfTLG42/iq1Ef8eFRX4klt38rlIF0gBlpkHU+rruHBVy4Ddn0J9fX2BwCB5+DsSK
	sZIgFmbI3b3Z+M6FEjR105SuwGjXBa+oD3WbriWgd
X-Gm-Gg: AZuq6aK0nN+/62H2ihiPkOVNv3GEvk/ivPFoyE7PwIp8TvyCIEqVynpsp5ZGlTc6URX
	EoC6/ozVduPK6rEbjRBtOaL80jZJmfN8GwwugYcghyiNXPpLlE9SVRkPBo5M7NgEU1raFU6OpaK
	HihWtP/OxZ4XUt6z6GAaOPA93NETfoaeiCgtiqczbOn3ad4zw+wvOfT7QBnmeX6+P/fJ1ez0uPK
	tvAWQwFNaiVKlJc1hmk19T3xQNB+NlryF1cr3G0j4+96wpeKf+ojw0RApu1oUGcFVnOe3kuncVQ
	DugaGH0yy12DR5kr+grSIA6ShhscIHvHnnNZ
X-Received: by 2002:a05:622a:994:b0:4ff:bf96:db86 with SMTP id
 d75a77b69052e-502ebd89420mr14663551cf.16.1769094593435; Thu, 22 Jan 2026
 07:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20260119105651.255693-1-maz@kernel.org> <20260119105651.255693-5-maz@kernel.org>
In-Reply-To: <20260119105651.255693-5-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 22 Jan 2026 15:09:16 +0000
X-Gm-Features: AZwV_Qgn974Rn-FnK4kC6GfYpfe9Us7HnF_BLs1xt04WEDzmacqD6_IPgM9DxZw
Message-ID: <CA+EHjTyWGmnJ+xMGJ4oGaP1pPGWA7tJD9kxDxhdtxAAj6dnFLg@mail.gmail.com>
Subject: Re: [PATCH 4/6] KVM: arm64: Switch pKVM host S2 over to KVM_PGTABLE_S2_AS_S1
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_150957_242354_C536314D 
X-CRM114-Status: GOOD (  17.19  )
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
> Since we have the basics to use the S1 memory attributes as the
> final ones with FWB, flip the host over to that when FWB is present.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 49db32f3ddf71..38f66a56a7665 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -19,7 +19,7 @@
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/mm.h>
>
> -#define KVM_HOST_S2_FLAGS (KVM_PGTABLE_S2_NOFWB | KVM_PGTABLE_S2_IDMAP)
> +#define KVM_HOST_S2_FLAGS (KVM_PGTABLE_S2_AS_S1 | KVM_PGTABLE_S2_IDMAP)
>
>  struct host_mmu host_mmu;
>
> @@ -324,6 +324,8 @@ int __pkvm_prot_finalize(void)
>         params->vttbr = kvm_get_vttbr(mmu);
>         params->vtcr = mmu->vtcr;
>         params->hcr_el2 |= HCR_VM;
> +       if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
> +               params->hcr_el2 |= HCR_FWB;

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>         /*
>          * The CMO below not only cleans the updated params to the
> --
> 2.47.3
>

