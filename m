Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D65BD59F5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeWA172BYFuvJUs17jk2BLJpPj+VSqEWSdhQr3Tt5lU=; b=aEBCqFR1Ht/icp4fvUp1BvHJxr
	9Cpy/BkilMlP0ob7RJIYF6f8aVupYFlw1ZImnoa4Vq7l7T+nZYI2DfR+JtrBpxEzqfQKiY+t9lvuh
	1nF6zZBrjusf3+JDiGV4j5qSM0apQO6WrwQkUbhYGbypni8zKqsnAXt3SXE8VHcGGeKM8PrApMA+K
	hPBkdFTEFV2t0Tx38aRG4WZjWEXOsgSR1+ecyIM9LG5426tYYwyudb9nTGD9UXqhkJCq/U7wJWn+D
	UNiluwOCRiTMakwXAQ0tbeOmKsNux0+xuyLOJCYx66mfSa7KR1Bk9bolfjppuzvdQkHqcNxUyzKmt
	8i1ody7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kcA-00000004Js4-3Sa0;
	Wed, 06 Nov 2024 18:18:46 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kaF-00000004JSR-07ST
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:16:48 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539f1292a9bso7537e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 10:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730917005; x=1731521805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeWA172BYFuvJUs17jk2BLJpPj+VSqEWSdhQr3Tt5lU=;
        b=yUEk4cbfn84eji0TrIAgr/mCKw8BhzL0f4HgJ9q9fHbXXIywjzl1wthhk6emws+mmX
         IdRNJ82yWkH8cYmw3zFBWd+E26BaASLUupmyhpYKKLqZKJJRHppH0KKa0ZOL/mUI7qaV
         7RrCXGzq69AhKnx6eE208ROPhNSi/gCU93yRgVSs7AqNjqnJxNhvWr2Cke6j/GFd262P
         AE9a/Bww0aKFvGxowgM96pGL2iSHi02QCJPF/PK36FxvqXH6rF11cSaNBqTy3M9FqlHt
         lpA1Rn+nIp40egVv3AzIb6Ba47wDO7myTt15CQaAchVa2LVH5iBVahRAMr86BFQaZP95
         L2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730917005; x=1731521805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeWA172BYFuvJUs17jk2BLJpPj+VSqEWSdhQr3Tt5lU=;
        b=b43ehWVpPxwGxa0wwRYzTQeW0r1K3bU1SXSDfcUw6oyKYhIYMparRgu1i7ZDXtoxvw
         2WkfPytsK4zDFS7RtOZ0qx/zK9NgR5lUDGu1P0Ym/JWS+KQKFMVrdKwE+sbbWWiujuXp
         uK5o1jBveUM/ebE3L7VOP8gnexzG8Ix93tkseYym4EBmO4F59p8eUmFIOJ8yBwAz8Gnl
         Z/qvs6ypDEJDj0M1LF87yupdCeOfNjb13TECqwJE/V/ISxVn/C5/ZwrkYbbvKSqS4yTO
         QF0URy8h37o+MVeUYiaif888AsLkTs2o9FTxQL4VYQJtDQ+IXBzkFKKRVR2iorrk0h6r
         +dAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8OF6WE4owVRGF+Nssnn8hXFpUkggE/RPUSb58frKBsbFHLbRVI1257fDvMGu0xZ4eYirar66/NInEopk3KnxU@lists.infradead.org
X-Gm-Message-State: AOJu0YwPHtGBA7hGPXgXPLN2LZb0GSnXUG142kZSFHSIVygjuDbeGx3P
	9SBoahlE0RsTYVQPHqpnVD29x+X4QTuiCbT5o4zXUk/EG+m3AOFBZellaS7S82Jf7+lscEYvVkI
	20yotfd1loSgC1NEYoAaa4Vb+5Frsr5CpeyTa
X-Google-Smtp-Source: AGHT+IH0eyYrDiApka0FCPYt2gCEKlK4/mAq7uw29tSP1xJ7qJxDTSHGX9xhi6kEHhZbsrB00EH2FETbJzZH1P9TZow=
X-Received: by 2002:a05:6512:12c5:b0:539:e88f:23a1 with SMTP id
 2adb3069b0e04-53b3491c80emr21831365e87.44.1730917005120; Wed, 06 Nov 2024
 10:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20241106083035.2813799-1-jingzhangos@google.com>
 <20241106083035.2813799-2-jingzhangos@google.com> <86cyj81sdl.wl-maz@kernel.org>
In-Reply-To: <86cyj81sdl.wl-maz@kernel.org>
From: Jing Zhang <jingzhangos@google.com>
Date: Wed, 6 Nov 2024 10:16:33 -0800
Message-ID: <CAAdAUtgiWxhY6DQrS_B=6PhL3+V-qfJVSsqWWeVuGqW7DLcotw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
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
X-CRM114-CacheID: sfid-20241106_101647_093189_DCCC9AFD 
X-CRM114-Status: GOOD (  22.01  )
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

On Wed, Nov 6, 2024 at 4:03=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 06 Nov 2024 08:30:32 +0000,
> Jing Zhang <jingzhangos@google.com> wrote:
> >
> > From: Kunkun Jiang <jiangkunkun@huawei.com>
> >
> > In all the vgic_its_save_*() functinos, they do not check whether
> > the data length is 8 bytes before calling vgic_write_guest_lock.
> > This patch adds the check. To prevent the kernel from being blown up
> > when the fault occurs, KVM_BUG_ON() is used. And the other BUG_ON()s
> > are replaced together.
> >
> > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> > Signed-off-by: Jing Zhang <jingzhangos@google.com>
> > ---
> >  arch/arm64/kvm/vgic/vgic-its.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-=
its.c
> > index ba945ba78cc7..2381bc5ce544 100644
> > --- a/arch/arm64/kvm/vgic/vgic-its.c
> > +++ b/arch/arm64/kvm/vgic/vgic-its.c
> > @@ -2095,6 +2095,10 @@ static int vgic_its_save_ite(struct vgic_its *it=
s, struct its_device *dev,
> >              ((u64)ite->irq->intid << KVM_ITS_ITE_PINTID_SHIFT) |
> >               ite->collection->collection_id;
> >       val =3D cpu_to_le64(val);
> > +
> > +     if (KVM_BUG_ON(ite_esz !=3D sizeof(val), kvm))
> > +             return -EINVAL;
> > +
> >       return vgic_write_guest_lock(kvm, gpa, &val, ite_esz);
> >  }
> >
> > @@ -2250,6 +2254,10 @@ static int vgic_its_save_dte(struct vgic_its *it=
s, struct its_device *dev,
> >              (itt_addr_field << KVM_ITS_DTE_ITTADDR_SHIFT) |
> >               (dev->num_eventid_bits - 1));
> >       val =3D cpu_to_le64(val);
> > +
> > +     if (KVM_BUG_ON(dte_esz !=3D sizeof(val), kvm))
> > +             return -EINVAL;
> > +
> >       return vgic_write_guest_lock(kvm, ptr, &val, dte_esz);
> >  }
> >
> > @@ -2431,12 +2439,17 @@ static int vgic_its_save_cte(struct vgic_its *i=
ts,
> >                            struct its_collection *collection,
> >                            gpa_t gpa, int esz)
> >  {
> > +     struct kvm *kvm =3D its->dev->kvm;
>
> nit: just use its->dev->kvm consistently, as this is what we are
> already doing in this function.

Sure. Will do.
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

