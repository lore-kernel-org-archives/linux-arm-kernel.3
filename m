Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAB0FD88F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2p5KSxTIRfOC6O2ujvV2QHurJepZe9V2nPJahGajPeQ=; b=lwbZBY/bm+vx7Vot5mZQ99DsC8
	B5oQ0xKcx3VYA1/lg4o0Oew/GWj1eMOQI5ktc8T2lYriS8rzHnUxBso20v3awOizmeyJDyiXnZnIT
	Gs4W30Yw96zkjE23kfVXYQPi4+UPmqqTBIeerdQWZvL+jPFTuMrMyu99aRfj09TMvaTNJHiISmyUa
	uQ1JYu+8U+EsuZXV0eH5q8MoWvkoMje3rwwNMwO7i5dBJz1N0O3KC6bLEXQBo4hAJRfbuTXrWPISJ
	HqVI7zqE3UiNwDqJ11kDVt0LvfllqkaCmeBb80bbnDeNcHKNT6BzsV0vDz/LugoEbo2EmdhAnWyZt
	s8FWv5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gd9-0000000BOKu-0S29;
	Wed, 11 Mar 2026 10:17:31 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gd7-0000000BOKJ-29sg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:17:30 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5091ed02c54so401111cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224248; cv=none;
        d=google.com; s=arc-20240605;
        b=BBwXAGnQVVTdn7z+/6O0px+ol8Qfzu1PQcPaLlXhvhYk1vCkEN0uPXsgJsbXWHIL4x
         D4eDsLoz8dmzrj3n8PO+r+yzP5EqYG6RkBpv4IlMHtkBXfr213AcrHa3ma7fbCNBV1d+
         ok8OrqhRKiiMjnFttZrxGHfUGL0FB/ZKu1Hi7DdePeZr6BN4DH8Wam374n+5cy/XZ2Cp
         7jAvHCSBuquCDloPWY8alIwdxahwKy62kXVUbMZJ9ljOnZTPluK+xBbqZNtZ0MIz5A2u
         kSN1SMaoacv7r/cX5GcclHYbGAWhGJIZIS7IbicfRL+RWiulGXcRIzCdHohzCFLKDaFc
         OFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2p5KSxTIRfOC6O2ujvV2QHurJepZe9V2nPJahGajPeQ=;
        fh=uPXzzxHUe5Dlvl4B1iib4cqZAxp5F/q/6Sta7i8fec4=;
        b=SKqGg/gRsSZmpmc51lw+wlhmUPJgMBqFH3yuu96y89iV4iuhyQc7uE0kyQ7jlCtyI0
         7hwGHVBxU04M3fpicTFEehW+dfp4NYV6mT1DMGYLPwWVnIpKiAygP+ukK6DOKN8ZzjR0
         DEBy/3Yv6876LTl0GFnzU9WXacvm+btA3cqlYehsmDGURvk4+WX6qYboFgl4iVE9+NM9
         pByzE0n94w9Jqi5LOnISO2VSeHKyWZf5p+0j9tOdcX2lN6xqC3VNq67ZxFV2cYnsTpOM
         uFxbI/dDWypzG6eO3lFTy4GFU7NRWG809A/ApVjjq3sEEZtdxucCtdHKMSWeLM2kWyrE
         s6QA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224248; x=1773829048; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2p5KSxTIRfOC6O2ujvV2QHurJepZe9V2nPJahGajPeQ=;
        b=OWzN9eOXHDsvbrOKh0T+JGDP29JAAxODdubd6LcWISiBrRZ9uQoc+bp5lkgANxoRIx
         qJBgFJGksP8y2YRl+d2mkYOnqSH8B7xsnyXntPI1WSzIzeucEKnSB6LtzHPWGh5asmK7
         1yZrsdBYZvXgij8ieuHc8TZ+i9H0cT83AToY2dMEdvTf+Yd0KeaDOv+BWvi+62mu9cXp
         2tj0TQB1f/N6GY3ImoRSCP4PQqk7PvgVh0fc0RNlgb8vMb95uAi0vVqRvx/INh3gMZfp
         H8aggJnmbz4PWEfFF6h+vaxi/51KO/SQn33PpBJem5F+m3u6fpo3/SY4BYZhuvaQPTnI
         wXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224248; x=1773829048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p5KSxTIRfOC6O2ujvV2QHurJepZe9V2nPJahGajPeQ=;
        b=jDB/UEhWHve73pilWhhEvjg2lfGsGF2GEeJXU1pinptevbfhVEXAECBTcxbidjt+9H
         DbZCf/BwHYpMtKxILyiJIWdtCU4DjeXG46Qd7g5Jr5GWpBGxtEjTHFofVhmGOB3Bnh1Z
         MMh5k0vWQOHUqRDz0Q8txm2cNP8BISxjp+pjUO4MNAynEXSjLxZi8/nFEnAQVU2ExGJb
         wy0QZpqFWansLZ80vVH8UK1eGKjAgH5eYyGkJEi/8WMrlI9to8PWFt8yza1jfZq5V1bp
         ntpETfXBzaIaQ92p2/rATu11DgQJ23lfTj+ItPDT5b/ASW++6J4DD4q7Uu8cyybzM93W
         GXsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+pnob3/JESS1xQLi6lmJuVNV9cpey+ob+ae97xHs+zDcfxZNcCfLqShrT3wXVV5Ubyiu1WTbyGmmfeeINofy/@lists.infradead.org
X-Gm-Message-State: AOJu0YzXJ+3ChsAZYN+PlM6vsjwV6fA+n1BH0cNhH7mWypbvEksVeuG9
	IE0WnbA/+SYifruETYAtD5MF61cKXAB4cgJUThh6UtTvBrEhBmUZNvpQY+XMP2G85VRQjkX4hM6
	Q20sI6lvajTpOB1YRByz/AnRB1gmlcR6M57ZTZgIU
X-Gm-Gg: ATEYQzwdsqHUbtApK3jQlYjRcjx1i8fBZvKE1QwuC3oq4qnV63OwfyMpnHVeeKmmDNq
	OthETTPXQA42TRsUVaxTsfPPvRRq3/cv1pYqm/HgMPOtomBz5KcbjCSDoXdzlhmzFUURiKu78GK
	e/C1SJLWAaohfO7GQLXTWob47Y0ZsSP3eE0NwdNMxhq7AiQ6IY9WhdZp76/bXftrzj2y6ZE0dRc
	XhUycp2N8PDCjwSXvpv5lHh3XVgQMfwBZVdGd68FGKon9giauEzc4Wq6iWrKc0PxkS6jp0baFAS
	aN9ZPhNwZRrs56jkXR5qnNynbxOmE9dics6x5g==
X-Received: by 2002:ac8:5ad4:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-50939a0fdb6mr8651281cf.5.1773224247734; Wed, 11 Mar 2026
 03:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-9-will@kernel.org>
In-Reply-To: <20260305144351.17071-9-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:16:51 +0000
X-Gm-Features: AaiRm50pq-gU1BFu0dPs0mu11fXQQe_BYCcsIQ1e_bsJwGqZuSAvXZICi-mcJAo
Message-ID: <CA+EHjTz7XW7uPxAmE-EqCjQHCf_eYajwT+kedZ2gPOLMuNGqJA@mail.gmail.com>
Subject: Re: [PATCH v3 08/36] KVM: arm64: Prevent unsupported memslot
 operations on protected VMs
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_031729_560524_C3833C61 
X-CRM114-Status: GOOD (  18.00  )
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

On Thu, 5 Mar 2026 at 14:44, Will Deacon <will@kernel.org> wrote:
>
> Protected VMs do not support deleting or moving memslots after first
> run nor do they support read-only or dirty logging.
>
> Return -EPERM to userspace if such an operation is attempted.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 43632c69adaf..9d183df0b0ac 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2410,6 +2410,19 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>         hva_t hva, reg_end;
>         int ret = 0;
>
> +       if (kvm_vm_is_protected(kvm)) {
> +               /* Cannot modify memslots once a pVM has run. */
> +               if (pkvm_hyp_vm_is_created(kvm) &&
> +                   (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
> +                       return -EPERM;
> +               }
> +
> +               if (new &&
> +                   new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
> +                       return -EPERM;
> +               }
> +       }
> +
>         if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
>                         change != KVM_MR_FLAGS_ONLY)
>                 return 0;
> --
> 2.53.0.473.g4a7958ca14-goog
>

