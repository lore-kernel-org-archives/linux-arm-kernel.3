Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959C6CFA464
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/J5U+OF3K0AErChj6IORznXj9y2ILqqHHrJf2bXcts=; b=MK/rx9Goc7c/cSmJMV5cSTN8VN
	LZEGrTIKv+kqFBMlLY78kiP8pwoDgoreHODmX0oN03rZR+RYh7oHI+x1EwGsemj9r9tK0VvsnHd/p
	V414mu6QU95F4ao9oXLyV1wGeej5l0Zzkb5HFUIWvrOUmyF6FImEiJBdgqqRfdEhyYgpsYfsBzHdi
	AYdltDduNU+MpDSHy025RHh0tZ0qrzMCYNzVrJY3x6L4QaeVohHvZCQ9cXWcr2YYaZqrNeYXqE6lv
	RAfet2F8W43yVQFm6DOXmR9kci+e6rYT2AqXp3p6AiC3uKeNDl5mpdDaD9CGxHjAPCUoixx1Bt89q
	Gcsm7fAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hw9-0000000FpKn-1iGY;
	Wed, 23 Oct 2024 20:26:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3huc-0000000FpC7-2g6n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:25:00 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so197095e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729715096; x=1730319896; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/J5U+OF3K0AErChj6IORznXj9y2ILqqHHrJf2bXcts=;
        b=fXCLu1a2FP0rMNFjdV7u4ajJmuDtXOwV8mFkq84SU5bDwQ3aceCSTlR8UhRr+2KejT
         ZyKjQAOd0d/4UzDof4X8kyuv1jZdckMACdGPfdR/iZmpJvVXzAHjzo272AHNmhaZV8ch
         XXkcekepsyzMVDT9LYKnNMeH1I/HCk/leiMtR4uFGEXyyVmRApoFSCOe0U3pN08lOxo/
         rqGZV6jylLaP5xnlfpq7ECezzJf7ohgz3Voc9TsVhQetrmSqWvka+YJWQ75eAR+WlU4s
         BQOjfOdfsJr1R+LkMaygHi/CPOjJ/kiUwclNn4DleXx/4wUhVpEhWH2ttaBt15Bz8Biq
         evFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729715096; x=1730319896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/J5U+OF3K0AErChj6IORznXj9y2ILqqHHrJf2bXcts=;
        b=G04/CuEYLsJTH3aRMHYkRUJugvkYQ3kboEKUogUjHgn6uLjHSjKNGkBUDSYw4X3UZm
         gtMvx7jQR0ONFNU+2A0PhoP134laRMN2HeIvOBdST/syppkKlrqa9IlKhZFshgzbNKxa
         d+mhU2tV6a205P7rGDZCu+hXQhq8EQ0gwoe+UU6m2DtvwyVRpb2EMredIdX5Uujn4Yyo
         2QP3lUECmf9+cNLTz0NdsqVIf8Nin7/GilyBx3xOUY3+X34KPJtaBrbL2izVkhUlqLAc
         tLivw5/Q8GdXVB9SNDKNjhohM9f+qWclv3BjoyaSkk/lz1saG7Ctn6F91naoEe10jBvA
         XnWA==
X-Forwarded-Encrypted: i=1; AJvYcCX0QcFdR/1te5xkYI+NUTMs16lNa+Y3vY7KTb3YJ9B7i7qZuZQLmgLaj4e6UIWthFr6vJ8qz9AjTl4Ec1LVX4mO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm/oFQWWGkAu0G7mliwcAuXEYNBPdsvZBmYDQL+ng9F5TeHJEa
	TLfJMvdXY5JcV1eRYCm0rB2hmrWwbD0bSC1bE4XVu+pzW8KpG+f5EVRbp+HnLRgiI1po5161P+a
	Uj89mLwKF28UVmWT3JSwx+MxWIe5Qqmpy5VpX
X-Google-Smtp-Source: AGHT+IHSCllmfqejwDRgdq9fg0cwSTgDHJ9uCrH0pP5pEKEvOyQTqWtxF24V69vdYn/lXl2ijuB2u9hDFq2MvYh8EMA=
X-Received: by 2002:a05:6512:1246:b0:536:9f72:c427 with SMTP id
 2adb3069b0e04-53b1a343cfamr1983190e87.28.1729715096162; Wed, 23 Oct 2024
 13:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240704142319.728-1-jiangkunkun@huawei.com> <20240704142319.728-2-jiangkunkun@huawei.com>
In-Reply-To: <20240704142319.728-2-jiangkunkun@huawei.com>
From: Jing Zhang <jingzhangos@google.com>
Date: Wed, 23 Oct 2024 13:24:45 -0700
Message-ID: <CAAdAUtjOMtE-f6L1YZn339MPSUtVHm72cT+F-vDLT2bXJ+HNtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
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
X-CRM114-CacheID: sfid-20241023_132458_688450_AAC26323 
X-CRM114-Status: GOOD (  18.10  )
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
> In all the vgic_its_save_*() functinos, it does not check whether
typo: functions
> the data length is 8 bytes before calling vgic_write_guest_lock.
> This patch add the check. To prevent the kernel from being blown up
typo: adds
> when the fault occurs, KVM_BUG_ON() is used. And the other BUG_ON()'s
> are replaced together.
>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-it=
s.c
> index 40bb43f20bf3..344bd8c20f67 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -2094,6 +2094,10 @@ static int vgic_its_save_ite(struct vgic_its *its,=
 struct its_device *dev,
>                ((u64)ite->irq->intid << KVM_ITS_ITE_PINTID_SHIFT) |
>                 ite->collection->collection_id;
>         val =3D cpu_to_le64(val);
> +
> +       if (KVM_BUG_ON(ite_esz !=3D sizeof(val), kvm))
> +               return -EINVAL;
> +
>         return vgic_write_guest_lock(kvm, gpa, &val, ite_esz);
>  }
>
> @@ -2246,6 +2250,10 @@ static int vgic_its_save_dte(struct vgic_its *its,=
 struct its_device *dev,
>                (itt_addr_field << KVM_ITS_DTE_ITTADDR_SHIFT) |
>                 (dev->num_eventid_bits - 1));
>         val =3D cpu_to_le64(val);
> +
> +       if (KVM_BUG_ON(dte_esz !=3D sizeof(val), kvm))
> +               return -EINVAL;
> +
>         return vgic_write_guest_lock(kvm, ptr, &val, dte_esz);
>  }
>
> @@ -2427,12 +2435,17 @@ static int vgic_its_save_cte(struct vgic_its *its=
,
>                              struct its_collection *collection,
>                              gpa_t gpa, int esz)
>  {
> +       struct kvm *kvm =3D its->dev->kvm;
>         u64 val;
>
>         val =3D (1ULL << KVM_ITS_CTE_VALID_SHIFT |
>                ((u64)collection->target_addr << KVM_ITS_CTE_RDBASE_SHIFT)=
 |
>                collection->collection_id);
>         val =3D cpu_to_le64(val);
> +
> +       if (KVM_BUG_ON(esz !=3D sizeof(val), kvm))
> +               return -EINVAL;
> +
>         return vgic_write_guest_lock(its->dev->kvm, gpa, &val, esz);
>  }
>
> @@ -2449,7 +2462,9 @@ static int vgic_its_restore_cte(struct vgic_its *it=
s, gpa_t gpa, int esz)
>         u64 val;
>         int ret;
>
> -       BUG_ON(esz > sizeof(val));
> +       if (KVM_BUG_ON(esz !=3D sizeof(val), kvm))
> +               return -EINVAL;
> +
>         ret =3D kvm_read_guest_lock(kvm, gpa, &val, esz);
>         if (ret)
>                 return ret;
> @@ -2513,7 +2528,9 @@ static int vgic_its_save_collection_table(struct vg=
ic_its *its)
>          * with valid bit unset
>          */
>         val =3D 0;
> -       BUG_ON(cte_esz > sizeof(val));
> +       if (KVM_BUG_ON(cte_esz !=3D sizeof(val), its->dev->kvm))
> +               return -EINVAL;
> +
>         ret =3D vgic_write_guest_lock(its->dev->kvm, gpa, &val, cte_esz);
>         return ret;
>  }
> --
> 2.27.0
>
>

Jing

