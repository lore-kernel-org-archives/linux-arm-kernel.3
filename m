Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1701CCFA464
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q26rjq4zEqIRz8Vcg16r3D/o40rTFfW2jfuSpqI9ulo=; b=06BTHEUiKPV8o5AI5Ymx17C2TL
	1BrRYbBFMmeW0flZBH+ZgzkIf840wiiZz1RYYiFSxJstsi5R3MJrM3jX2+vZZe8w2oO1e80wNZQuf
	CFJUxSwp+sQxBTV2CcIBmgpk5u008KRtr7fKr0wAxjJR+GZEfQ3QND7q0HncXYF2X62VLcIi0bCq3
	mRkRH0lQrhmZfGMoGHFU1OTKrwEDvJAIWnyeV9Lrf+ii0O/f+edO2pwp4+6zgrKUildwke/etfS0U
	NzYY17QPnkxRsMnMsXd6eGUW39seVnyZBpJbHhLNfgCdSV7ptp0vNLItGm3ZsZtTUaVw8AI8T+PSH
	8D5nV22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hyt-0000000FpZl-17H9;
	Wed, 23 Oct 2024 20:29:23 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hxM-0000000FpRp-2tRq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:27:49 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so1726211fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 13:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729715267; x=1730320067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q26rjq4zEqIRz8Vcg16r3D/o40rTFfW2jfuSpqI9ulo=;
        b=XVaoBYAMF6Ml087KaaV5d84CJs0Fua1oLUbTgVn8gWKrsSZ9DSng5knUlzxPL9o2kz
         NLVlvwV+MTe8m/SA0x7ufiIziFuEU8RRX5PteVWn+6h21VhLFobRHULZ7PjxRMF8w+/L
         fUeUG6hAxSId5/fJtZu7UDfBhRJKZHAXt2Fppsd/8fyUWG1dUJ+y9RTDcM9aBMm1FiwC
         HoO4J297FMDPJg2drxxNJ3kvrRhmFboNeIBsveZRxDKJRamj+1g5oTNBFfBwO+SnA4eD
         +Df5Jm9hJfG04GWUzJmUFjdXsjLkZkwbD8J32vEq53kpFvhV4YGbL8PF2pTNLLigrB3C
         pplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729715267; x=1730320067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q26rjq4zEqIRz8Vcg16r3D/o40rTFfW2jfuSpqI9ulo=;
        b=PilA+L0JY5HV5E6JWgnQWYWhB967ydu0FCiax6/9stOiTlFPTdEqwAy8oVLIPiM+Qp
         VatBg9QW1b2OwA4q2q5+hD/37rLs/jS9NsbMpuOf09msPrHt3t3e3snzPOM96hNPRq/N
         a7gJZRHCnflg1UTNBLWCX7rm4+7Z/ueZMuSjjPLjQHqJnq8q0hSAKbCsGuiig05FYy44
         K2too2X5e7+PUdc97zWFxis8oDmffHlpnntAkHbHqscnIUBPmchjiBQkb4ze7hpzJtee
         EQEeLsJUaCQGcPLbYN4YZNyIPhbHOupG50c+w+OXaRb+uRkzCIcNAE9ud2C0tZr/T3SY
         EfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoFr5qOpFeK8mfk4QmerQ7eeIApeZ/+GVaD+bf/v7oDEptyLsZeUYt/cRQ12I0JywmrZ7ufdYfBAOnOBau7yOL@lists.infradead.org
X-Gm-Message-State: AOJu0YxnjUL1eGcLBktlpFyc+hA/K2C8lHnT5KN6ykZdj2IKVWv+f8e0
	m7I2qKfK9PhmyYN8Ne5JKJ3IrD+u7ypYemevpmMbJY7cAazXSQL3kPi7+jfcBhP+gfzIZeuX8Nv
	kjXRcOfiCQOkPS8sPz66mAHEljjnR+SC/+zuJbqofTTAFaCXh7g==
X-Google-Smtp-Source: AGHT+IG+PCsts43OphHvhZhAIxkFG77LQ241b/e0BeNW2BtEwVtREehGvVJqVHr1dr/PkLFD1+MnSMDI9zjrCuj7re8=
X-Received: by 2002:a05:6512:1250:b0:539:959e:f0e8 with SMTP id
 2adb3069b0e04-53b1a3115bcmr2546071e87.21.1729715266559; Wed, 23 Oct 2024
 13:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240704142319.728-1-jiangkunkun@huawei.com> <20240704142319.728-4-jiangkunkun@huawei.com>
In-Reply-To: <20240704142319.728-4-jiangkunkun@huawei.com>
From: Jing Zhang <jingzhangos@google.com>
Date: Wed, 23 Oct 2024 13:27:35 -0700
Message-ID: <CAAdAUtioh5DoZd+afryv+K1H4nPCVUoNpdFuu2vKpM92++Qqqw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: vgic-its: Clear ite when discard frees
 an ite
To: Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Eric Auger <eauger@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	wanghaibin.wang@huawei.com, lishusen2@huawei.com, tangnianyao@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_132748_756848_98D6D85D 
X-CRM114-Status: GOOD (  18.14  )
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

Hi Kunkun,

On Thu, Jul 4, 2024 at 7:23=E2=80=AFAM Kunkun Jiang <jiangkunkun@huawei.com=
> wrote:
>
> When discard frees an ite, we do not invalidate the
> corresponding ite. In the scenario of continuous save and
> restore, there may be a situation where an ite is not saved
> but is restored. This is unreasonable and may cause restore
> to fail. This patch clears the corresponding ite when discard
> frees a ite.
nit: ite -> ITE
>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-it=
s.c
> index 223a5f1d6a3d..cf4a85a29504 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -782,6 +782,10 @@ static int vgic_its_cmd_handle_discard(struct kvm *k=
vm, struct vgic_its *its,
>
>         ite =3D find_ite(its, device_id, event_id);
>         if (ite && its_is_collection_mapped(ite->collection)) {
> +               struct its_device *device =3D find_its_device(its, device=
_id);
> +               int ite_esz =3D vgic_its_get_abi(its)->ite_esz;
> +               gpa_t gpa =3D device->itt_addr + ite->event_id * ite_esz;
> +               u64 val =3D 0;
>                 /*
>                  * Though the spec talks about removing the pending state=
, we
>                  * don't bother here since we clear the ITTE anyway and t=
he
> @@ -790,6 +794,11 @@ static int vgic_its_cmd_handle_discard(struct kvm *k=
vm, struct vgic_its *its,
>                 vgic_its_invalidate_cache(its);
>
>                 its_free_ite(kvm, ite);
> +
> +               if (KVM_BUG_ON(ite_esz !=3D sizeof(val), kvm))
> +                       return -EINVAL;
> +
> +               vgic_write_guest_lock(kvm, gpa, &val, ite_esz);
>                 return 0;
>         }
>
> --
> 2.27.0
>
>

Jing

