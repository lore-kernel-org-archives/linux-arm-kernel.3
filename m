Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6383ACFA464
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga5iUl1w2BkdYZ5rnWwUX+rnruTQCDzgYbSTQOQPjWI=; b=OvxyhlUEG9HgiuOoGWQoa+xYqc
	A3I9mECseiDzsNlLW9bVN1rYT7BFKBV10Rq3jl6oeu8JkNn2o+kzQeNObwxbxdzxRCblNc8R7raLg
	RYzexB6btkjwjX1fG1XjNjMerrpwVfZ2AbQFFUrZntAM2XaLFJOHsb5XRiTGvfVKMKR2r5JfXe8mr
	z2nt5p2E+UOTy7cS3wW8H7eYn88Vm1kT5kSQlcW6GSGVpP+lb3DW8TNrlpVgNdors0cLHyaLLZtrZ
	R+W6LiUuOQR8VX7pIUPzIadrURsuN3KgswR79oP0Ncl5daI3ez0RplzuDlJOiI69TOxLKx//7YEzU
	7ctY2czw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i2D-0000000FqEi-3wYI;
	Wed, 23 Oct 2024 20:32:49 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i0a-0000000FpxN-1axj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:31:10 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539983beb19so215493e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 13:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729715465; x=1730320265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ga5iUl1w2BkdYZ5rnWwUX+rnruTQCDzgYbSTQOQPjWI=;
        b=3fbm35jN8riUxemgVvOVbLqXEFxaPLYUZjvcgyw6rIHNX2BP7NGnjzfkG0398XG5+g
         vaEm9GqbeymNhvrtJ4xuq73PeDf4ax2STF01NyPfvlq54sdGcNCj1PQyBp0UiS+g0A9R
         vAkI3gHyXZBi2P5/YyRQJ+BJeDTtmg+MYKtrEh6tQyKh2BS6b56SAl2AZ6qkUwq+R4yN
         u6pCLAZZbSKI1DdzqMQ4Hc4VqBmWr7Z/itCtjN9/CB+XuB5CAzJRC2blfUE82lyiZBEM
         KQBX4vXK1z4Gr0DHmO4Fks7HVWZRnC1wVB7cFxi5gwy49xABALmA+Xnug0AzssiK/7OD
         SF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729715465; x=1730320265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ga5iUl1w2BkdYZ5rnWwUX+rnruTQCDzgYbSTQOQPjWI=;
        b=hbJFTq4beGnZnAQhlcG5hMmLrMw84JW+Ocbe1ds4AfaR5VeEegqZnnqVgKYVd6a5RI
         cyhUrDOyJjmxFKYdvU280jnBpv7z3j+UJJXRxP5kJaUfVZF8afvcO7Mlg6Cxz+M2XkvL
         k8dQzjMO17pLKx8IbPw63vZDLmz5DvLAzGMvg0KwYpB8DtakupNR9DzMKMBzbH/UpJ2p
         uKwUhD3SDjMzTfRAS8uAZzHkw42TkSZ2wm1f4Ljkcc5gM7FTFMsYD7EUjn3m6Q4Ds6Te
         yP6LFhS5+6SXU54tapByXHBGiat1oob43c2R4OPWkHKoFbl1rW4Rn3N5ax99GQcxA2Ay
         fvNA==
X-Forwarded-Encrypted: i=1; AJvYcCUz3/I1VS904lhIyY0AFvoDx/AvnPADIYXHpT+uGcJnXHhNA86aqGS65xTxX6cJCqPskIMbg1tmm8nFZGTtb+ow@lists.infradead.org
X-Gm-Message-State: AOJu0YzOylNSprQWyGBaJ7uIxJ8hMIPJEn1YRBHXxngmrw2d2rQhhXgx
	2Z6yb4eklNR89gsqiVkt27CEuMUFlYjgCL6OZ0k+Rep0S914FEKUgcX4mrLMsYK+C8xBtYXdKJR
	ARXAuAOpXesFdq2nav8wyF2qCdYSWeh2YbPI2
X-Google-Smtp-Source: AGHT+IFOB5hl9xCTQi6KADVj+Ygz/KDWtgtceEAnJGc5F5DcfIsupKdCkMoYXTkWNpc4In12Fan0dWm/m/6oFWaM4OA=
X-Received: by 2002:a05:6512:308d:b0:539:f23b:59db with SMTP id
 2adb3069b0e04-53b1a2fb0b9mr2186529e87.5.1729715465274; Wed, 23 Oct 2024
 13:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240704142319.728-1-jiangkunkun@huawei.com> <20240704142319.728-3-jiangkunkun@huawei.com>
In-Reply-To: <20240704142319.728-3-jiangkunkun@huawei.com>
From: Jing Zhang <jingzhangos@google.com>
Date: Wed, 23 Oct 2024 13:30:54 -0700
Message-ID: <CAAdAUtgYzQe+G7nWuNLpOadGhC9XKQpoXt-He8cTyMHiUDLPVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] KVM: arm64: vgic-its: Clear dte when mapd unmaps a device
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
X-CRM114-CacheID: sfid-20241023_133108_506938_A25B2958 
X-CRM114-Status: GOOD (  21.53  )
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
> vgic_its_save_device_tables will traverse its->device_list to
> save dte for each device. vgic_its_restore_device_tables will
> traverse each entry of device table and check if it is valid.
> Restore if valid.
>
> But when mapd unmaps a devices, we do not invalidate the
type: devices -> device
> corresponding dte. In the scenario of continuous save
> and restore, there may be a situation where a device's dte
> is not saved but is restored. This is unreasonable and may
> cause restore to fail. This patch clears the corresponding
> dte when mapd unmaps a device.
>
> Co-developed-by: Shusen Li <lishusen2@huawei.com>
> Singed-off-by: Shusen Li <lishusen2@huawei.com>
typo: Signed
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-it=
s.c
> index 344bd8c20f67..223a5f1d6a3d 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -1140,8 +1140,9 @@ static int vgic_its_cmd_handle_mapd(struct kvm *kvm=
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
> @@ -1161,8 +1162,17 @@ static int vgic_its_cmd_handle_mapd(struct kvm *kv=
m, struct vgic_its *its,
>          * The spec does not say whether unmapping a not-mapped device
>          * is an error, so we are done in any case.
>          */
> -       if (!valid)
> +       if (!valid) {
> +               struct kvm *kvm =3D its->dev->kvm;
> +               int dte_esz =3D vgic_its_get_abi(its)->dte_esz;
> +               u64 val =3D 0;
> +
> +               if (KVM_BUG_ON(dte_esz !=3D sizeof(val), kvm))
> +                       return -EINVAL;
> +
> +               vgic_write_guest_lock(kvm, gpa, &val, dte_esz);
>                 return 0;
> +       }
>
>         device =3D vgic_its_alloc_device(its, device_id, itt_addr,
>                                        num_eventid_bits);
> --
> 2.27.0
>
>

Jing

