Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14817CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSCczuntyrjypJFmPl75f311GtN50oo2b0NuRkLWiBY=; b=lHtsYOZdaXHRKD94qnHiugmiau
	caqtcMpZQcV6almIhiqKRYfBwcxrahAWMMQ0i3saGtm6tN2dNOBgv4Wi4cDCLmUJJPJj4sHrVf4w9
	H+NQNb9euevDW0mWAI5izVHuBQ7a3dwaTbH338KODLRR3gyTfqzr91vYFPdwbpXyl9Em+u9V/egNc
	vjFqgv660ALh0PJ7OWzt8v/yHcATWLN1BGGxiYIs1uae9oHcGXWmw/pUXr/OsbSlUr8NQaWdgxlgv
	LXn6gsftze6wu1gFH4TYJFFflDpSjHIom6FVuDq2a557tnkSTZYfeEKG55dpSXD0zSdIHXHmToo8H
	C+Y+YZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwbs-0000000FtPB-3YhZ;
	Mon, 17 Nov 2025 10:37:24 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwbq-0000000FtOn-28ZJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 10:37:23 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ed67a143c5so543921cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 02:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763375841; x=1763980641; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cSCczuntyrjypJFmPl75f311GtN50oo2b0NuRkLWiBY=;
        b=HFzz5fTEf2iJZvLHzc7K5YOX3O33pv7dDmaV1MGn27OMfEBx5VSUIvNrgJ/45fUcR9
         SbBZb600MaP4YBsVNAmOo18194A58vVqJ7LYY9ADyXOabCBcQixnXZz9AEHk2r2cRKOA
         60lJBg3ji0eAaUmCxTWEWQ0/WmElWN1fcpnJkWQHVjte4kfQfjdIxFTtx4wfJx0QSLC8
         XHGzb4TkXgfN5k0092R8JgLHwSo5eBwiZBBfrg6/T8+kYU4tuukztMLbTGh+m47VwJT3
         VeQ/SHWwN29NtN229aXBIkflXLt1cwunLBx1WYxBcD5Szqa4i2pTv6Wa8ilMAhXydM1f
         JHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763375841; x=1763980641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSCczuntyrjypJFmPl75f311GtN50oo2b0NuRkLWiBY=;
        b=D+AUumfnlMkAi267VwrvLYOP4GwsKx87zepoezvCXQHiOAJp3gcT6DSkzY/TinXY3h
         LdBreeRGmBDfKXrdG0QAHKpTfj3EaIlvJgpI5BUlG/WON0vmN/Yg0DhfI0OoxardA3cd
         7ywhneWFHDl5MMlKcO0fGln3lxsztuP6ZIjy7xZYn/fcsAEdkvnixWJPG7SfTSU6Ba87
         I1H/JyHGnvCSkpGQp16PWyho9KlUqLpMihkZRWe15iOvRhf199LMpvqDX1BxSc8kuYcZ
         ou228/vxP2hAvWK6Gjv7noXBsFzZxQStO+LoekN7prwbhMV23kUYYbtA8mXH5FWloJbV
         +9Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVs1Zg5ts9Uqt2z0TPV8YXgdMrsgU2+NyTnnxOvMtjX50W4kkGQuazgw+7vKGwW4E4WALmUCwRhtfbhRGZzGQjR@lists.infradead.org
X-Gm-Message-State: AOJu0YxkvFuKwmFKLCI5d8s97OSqx19FmgULxCDa/hqt+wkVSirzQalU
	eYIW7JFiDhh96GLHW/r4H3YjEsytTz7ed7NtIyAtJyoTYhLzqKJpcWQGGVcWBw1+ONGK6RYFRtr
	3PFcb+1OBlWOMLeicQNOdwqCTbVuKQAnnFqHgUAqs
X-Gm-Gg: ASbGncuOT5xAyTpJVKBn39bUnp3WW35Ic8HRVkBzRc7OMJhwLzODTHNCbZouakCvB5o
	ZcC1YuS+sI1rlIYdJYTa2cF6lLID4W50lLMhZkpP1sNoq4VQjyQvw7Ng0g1GYn/6k2Q3+O6oXTC
	0k1g9q/erBQojZ6UjtB19W3b9hvNsrzCGWGrksS591cdNngmCf2OcfstsKLklwbaCX2p9PZ6lzk
	V1BoQMuEIyFvt4aGO7RM1O3LqoY2vrDpSLoK28RY5r4Am/rZB3ecrbEdEJ6BD7GhCUZ3wo8YOBa
	Sp3OHw==
X-Google-Smtp-Source: AGHT+IFFM24GESKuymha8lz4kxmnQKTDe1ajE7ALZIAlCW3kwiBwOHxbJvkmtglaccu5bdOdgggOwWj6OAOtjgUpEJU=
X-Received: by 2002:a05:622a:1196:b0:4ed:7c45:9908 with SMTP id
 d75a77b69052e-4ee02abc1c8mr11423671cf.10.1763375841094; Mon, 17 Nov 2025
 02:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <20251117091527.1119213-3-maz@kernel.org>
In-Reply-To: <20251117091527.1119213-3-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 10:36:44 +0000
X-Gm-Features: AWmQ_bkOHIvxxrAN0Ta8I3LCFjnIE-AQuTMgHtHd82ZTpr8YLnfGv1xtAWeYWMw
Message-ID: <CA+EHjTy-vmMrOR_-BAd4q2JG99afzd3cisvf-VP6uM+M9Pg2=g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] KVM: arm64: GICv3: Completely disable trapping on
 vcpu exit
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_023722_556974_5688DE87 
X-CRM114-Status: GOOD (  19.14  )
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

On Mon, 17 Nov 2025 at 09:20, Marc Zyngier <maz@kernel.org> wrote:
>
> Fuad reports that on QEMU, the DIR trapping is still effective after
> a vcpu exit and that the host is running nVHE, resulting in a BUG()
> (we only expect DIR to be trapped for the guest, and never the host).
>
> As it turns out, this is an implementation-dependent behaviour, which
> the architecture allows, but that seem to be relatively uncommon across
> implementations.
>
> Fix this by completely zeroing the ICH_HCR_EL2 register when the
> vcpu exits.
>
> Reported-by: Fuad Tabba <tabba@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> Fixes: ca30799f7c2d0 ("KVM: arm64: Turn vgic-v3 errata traps into a patched-in constant")
> Closes: https://lore.kernel.org/r/CA+EHjTzRwswNq+hZQDD5tXj+-0nr04OmR201mHmi82FJ0VHuJA@mail.gmail.com
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/vgic-v3-sr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> index e950efa225478..71199e1a92940 100644
> --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> @@ -243,7 +243,7 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
>                 cpu_if->vgic_hcr |= val & ICH_HCR_EL2_EOIcount;
>         }
>
> -       write_gicreg(compute_ich_hcr(cpu_if) & ~ICH_HCR_EL2_En, ICH_HCR_EL2);
> +       write_gicreg(0, ICH_HCR_EL2);
>  }
>
>  void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
> --
> 2.47.3
>
>

