Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD96D59F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbT+MVFmQWldHSwvQIAZqRuAjWXImGGsq+3vijULiGE=; b=Duios73GaZI5H/wiCjeTZbGcgY
	fOPyPWRr6v/PqqQN9S8CYA/AWLYLIVaC0G75DLy+KDJUAXU0oWk64mKplva7SPZ58+WK1kpqicPTk
	6C3Y1y6QjfX/MnZK+f5mK5FTWHU2QT60Bv8kLBkR9OfpjaKs3dQ5MFempz3qCpFCLvZKH10sJO15a
	JP2Czf+bYOGlGFmfmcdKErxTa0IzQrgIQaUMBuo2fWFf0TrAafWSaK1rkq0kgZ5tDUgwrbFjy3d3e
	aqrxkDKuNIjxn/5WHt8XEW3ZkRtKP3aVFxUXQVI12iY2/DU+9YdaOdhDvUGr85ZvzT9kmhdXQPCQE
	td7eMCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kpU-00000004LmJ-1YJn;
	Wed, 06 Nov 2024 18:32:32 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8knX-00000004LPe-2aAY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:30:33 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so16874e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730917830; x=1731522630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbT+MVFmQWldHSwvQIAZqRuAjWXImGGsq+3vijULiGE=;
        b=g0ArEkFVOhFa6qwCRxqmI5GX0ri7RP35npHVA2pT81JELwIAEt5LE3a3UFTR/PJIlq
         Hpj09rmg1dWbKH5FrI7fm2MHPyvlkW8EiSPUjYAax5OzG+TVirT4WJ7DViL41I51Pag9
         j5kps+9hYIgR+pu6rPIo6YEX248CJ86jnQTLFh5E/32deVY4hRlsDBzAkBzZFljoOZLG
         OhUjUCvm/oyruzlPbwNExOJ20wc0aQoNReVXaVgRVu+102qMW9hNOWh/ztPEWX8PhP3c
         4yllOsmMiH5QEleVfZ55bZnGWVEfikXegnoo2MB4AwYXXFPiAiIo3pNroDqfBZRs2pci
         WHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730917830; x=1731522630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbT+MVFmQWldHSwvQIAZqRuAjWXImGGsq+3vijULiGE=;
        b=MBeKYrol0Y2pUQ4TTWD62t1ATIQA3ZeLCrWun8IxnhbfTdc7FlFNMC/AGABjAipC7w
         xJqjvL+OpIEsCR9i5ygO9gynAh/NzwytMcwBSsZJdx6x6hEqkuAEF0UK+ZznPimy39Ug
         +HAfyLikKAcrhC3BfHzg6CgbfMcjFu3WmFh2FHoFiANdvRnOg22cK63L3IQ6OAsFBSwe
         lv6uU8mI7LDqQTc3YV7BiCNFR/AYE0ce9M+NfDTC1txIRAkbaMSxa1HvBetPHDenElhL
         8Zy1JYd6O6DBLd7L68+DK4k9wyXkwF5iPZMx3D4JTU50p2Tgs2X/JSdBloQl4RM9N/Nt
         Kc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBpLHKQkmgMTBeTz2NNO3VZNhAKwqSFXfq7glIKNhXs5Vty1v//sm3fYFtmBKfggsHz4L0wyOiCIEl8QZkI5Oo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi5sUeX7O9lfPxnvU033adWxblK+WBnkzDyhLADb9535evcfyA
	lwbNRMaPVRw/yCQPPif9dJ7ZonWLXiAiqO0rye5Ka86uFG+CJJ2pihbNfJvuLdlwPuSuS6FaPpJ
	p3L7MEZmdh9QS6EsSjSD0NSakecuj+0UWSXdV
X-Google-Smtp-Source: AGHT+IGYKAJXEmT25HizfPd98EM7DkJ/wBTM9jTTkKgsvpun+NHaqwmwMvXWcTOmNi+oHO6/SxiZtFDZUwiPL4oYAew=
X-Received: by 2002:a05:6512:159c:b0:539:8f3c:4586 with SMTP id
 2adb3069b0e04-53d65e16881mr14669176e87.55.1730917829767; Wed, 06 Nov 2024
 10:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20241106083035.2813799-1-jingzhangos@google.com>
 <20241106083035.2813799-3-jingzhangos@google.com> <86bjys1p45.wl-maz@kernel.org>
In-Reply-To: <86bjys1p45.wl-maz@kernel.org>
From: Jing Zhang <jingzhangos@google.com>
Date: Wed, 6 Nov 2024 10:30:17 -0800
Message-ID: <CAAdAUthN14kLmeH0eLK991soGeZD8qzD+Sp1jR2gZjqLVE771Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] KVM: arm64: vgic-its: Clear DTE when MAPD unmaps a device
To: Marc Zyngier <maz@kernel.org>
Cc: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Oliver Upton <oupton@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Kunkun Jiang <jiangkunkun@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Shusen Li <lishusen2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_103031_721698_8DB12954 
X-CRM114-Status: GOOD (  32.13  )
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

On Wed, Nov 6, 2024 at 5:14=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 06 Nov 2024 08:30:33 +0000,
> Jing Zhang <jingzhangos@google.com> wrote:
> >
> > From: Kunkun Jiang <jiangkunkun@huawei.com>
> >
> > vgic_its_save_device_tables will traverse its->device_list to
> > save DTE for each device. vgic_its_restore_device_tables will
> > traverse each entry of device table and check if it is valid.
> > Restore if valid.
> >
> > But when MAPD unmaps a device, it does not invalidate the
> > corresponding DTE. In the scenario of continuous saves
> > and restores, there may be a situation where a device's DTE
> > is not saved but is restored. This is unreasonable and may
> > cause restore to fail. This patch clears the corresponding
> > DTE when MAPD unmaps a device.
> >
> > Co-developed-by: Shusen Li <lishusen2@huawei.com>
> > Signed-off-by: Shusen Li <lishusen2@huawei.com>
> > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> > Signed-off-by: Jing Zhang <jingzhangos@google.com>
> > ---
> >  arch/arm64/kvm/vgic/vgic-its.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-=
its.c
> > index 2381bc5ce544..7c57c7c6fbff 100644
> > --- a/arch/arm64/kvm/vgic/vgic-its.c
> > +++ b/arch/arm64/kvm/vgic/vgic-its.c
> > @@ -1140,8 +1140,9 @@ static int vgic_its_cmd_handle_mapd(struct kvm *k=
vm, struct vgic_its *its,
> >       u8 num_eventid_bits =3D its_cmd_get_size(its_cmd);
> >       gpa_t itt_addr =3D its_cmd_get_ittaddr(its_cmd);
> >       struct its_device *device;
> > +     gpa_t gpa;
> >
> > -     if (!vgic_its_check_id(its, its->baser_device_table, device_id, N=
ULL))
> > +     if (!vgic_its_check_id(its, its->baser_device_table, device_id, &=
gpa))
> >               return E_ITS_MAPD_DEVICE_OOR;
> >
> >       if (valid && num_eventid_bits > VITS_TYPER_IDBITS)
> > @@ -1161,8 +1162,17 @@ static int vgic_its_cmd_handle_mapd(struct kvm *=
kvm, struct vgic_its *its,
> >        * The spec does not say whether unmapping a not-mapped device
> >        * is an error, so we are done in any case.
> >        */
> > -     if (!valid)
> > +     if (!valid) {
> > +             struct kvm *kvm =3D its->dev->kvm;
> > +             int dte_esz =3D vgic_its_get_abi(its)->dte_esz;
> > +             u64 val =3D 0;
> > +
> > +             if (KVM_BUG_ON(dte_esz !=3D sizeof(val), kvm))
> > +                     return -EINVAL;
>
> I find it pretty odd to bug only in that case, and the sprinkling of
> these checks all over the place is horrible. I'm starting to wonder if
> we shouldn't simply wrap vgic_write_guest() and co to do the checking.
>
> > +
> > +             vgic_write_guest_lock(kvm, gpa, &val, dte_esz);
>
> I'm thinking of something like:
>
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-it=
s.c
> index ba945ba78cc7d..d8e57aefcd3a5 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -1128,6 +1128,19 @@ static struct its_device *vgic_its_alloc_device(st=
ruct vgic_its *its,
>         return device;
>  }
>
> +
> +#define its_write_entry_lock(i, g, valp, t)                            \
> +       ({                                                              \
> +               struct kvm *__k =3D (i)->dev->kvm;                       =
 \
> +               int __sz =3D vgic_its_get_abi(i)->t;                     =
 \
> +               int __ret =3D 0;                                         =
 \
> +               if (KVM_BUG_ON(__sz !=3D sizeof(*(valp)), __k))          =
 \
> +                       __ret =3D -EINVAL;                               =
 \
> +               else                                                    \
> +                       vgic_write_guest_lock(__k, (g), (valp), __sz);  \
> +               __ret;                                                  \
> +       })
> +
>  /*
>   * MAPD maps or unmaps a device ID to Interrupt Translation Tables (ITTs=
).
>   * Must be called with the its_lock mutex held.
> @@ -1140,8 +1153,9 @@ static int vgic_its_cmd_handle_mapd(struct kvm *kvm=
, struct vgic_its *its,
>         u8 num_eventid_bits =3D its_cmd_get_size(its_cmd);
>         gpa_t itt_addr =3D its_cmd_get_ittaddr(its_cmd);
>         struct its_device *device;
> +       gpa_t gpa;
>
> -       if (!vgic_its_check_id(its, its->baser_device_table, device_id, N=
ULL))
> +       if (!vgic_its_check_id(its, its->baser_device_table, device_id, &=
gpa))
>                 return E_ITS_MAPD_DEVICE_OOR;
>
>         if (valid && num_eventid_bits > VITS_TYPER_IDBITS)
> @@ -1161,8 +1175,10 @@ static int vgic_its_cmd_handle_mapd(struct kvm *kv=
m, struct vgic_its *its,
>          * The spec does not say whether unmapping a not-mapped device
>          * is an error, so we are done in any case.
>          */
> -       if (!valid)
> -               return 0;
> +       if (!valid) {
> +               u64 val =3D 0;
> +               return its_write_entry_lock(its, gpa, &val, dte_esz);
> +       }
>
>         device =3D vgic_its_alloc_device(its, device_id, itt_addr,
>                                        num_eventid_bits);
>
> which can be generalised everywhere (you can even extract the check
> and move it to an out-of-line helper as required).

Sounds good. Will do as you suggested.

Jing
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

