Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1BBC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/uIe95x5lZqYdBnQQKG7OEQU1TEeF9VXSEERIroTJo=; b=O6VsgkXKxaM+12YH7JZuBvTIF/
	sROh7wRt9XeRm6WAOJBfw4+7FwuHWayTks8W6hkqu9EMIcG9FHCkNsNy5ezrxmofEZewhkz0Sw8Jh
	0xMosCV9HTGhBEB9a3AtvrHqJdkWlPfT36Vc6lb2jT7UNpG54uElfVBsEGKzCXDE31ugGP5JAs187
	Rr6z+IzO8WHEM1e5JsoglEi8XE4TWY6oJtuVEQe7XX/oH84ufaK13aqc0og0ghvMHcnYkwTb1gNm3
	jKN63wOeXNTyhq2/Qw8YUwB071x7tA7OpHfuL3iiijbCDIO60Pi6N7agB0q5j9fCHNkweKSfyXlBD
	VzCJPMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnpw-0000000HKk3-0Fsw;
	Tue, 29 Jul 2025 17:10:00 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnco-0000000HJXQ-0Rjw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:56:27 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso18931cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753808184; x=1754412984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/uIe95x5lZqYdBnQQKG7OEQU1TEeF9VXSEERIroTJo=;
        b=4mD29FxRuhWZX9Y2U9gK1Nv2lYy/5CI0R+jbOw1rX0yr27e1uLVJcYZi+VC0AgWYqS
         ebAm+Ml9Am6YwDlrmffRvSIgQ6TN1nBfxHS/cr8R3Sxr1WXk2DjipuT+lKpsDJg3ONut
         QzvFSCEGQWECOWZgKJrTJLNm+R9KB9PYzA9LNGF9enen3nCJ6e1fyaxONwe/siiT3jWb
         OWCM2beOrIc02OfEMg2U22oRbM+yfeIivpPk944rHTzVU4uKHQQw4jFHKv2TFmpVF9/q
         lYPp1R0nUr37cd3u2EK30tr32liTSOjoJokwt//1Fcyl0/VC+ARquSCNkc1PvB4SWlu7
         pN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753808184; x=1754412984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/uIe95x5lZqYdBnQQKG7OEQU1TEeF9VXSEERIroTJo=;
        b=OSFGiIdrZkscMk5jw5KmcVdWkHvfl078rBwBeak32binFVWJsF0KuA4AfAQV2uHWpW
         6Ofgb1cN69fDJ8d/iWSZRDsHl5/DZcwzyEa2B1binwMqBVAOg528XMJPm9inWZnatyGK
         E+wbITxq6RS6SKiExquvxGQGnxLEX4UzXLFXXahCZGQDeWR6uLSYwk0NbaKNIg5W8Xvs
         Ufc5+2cGa0OZh0IHjydmaU+1thM+Uak63oaaIRhNal82oygEQxa4F8QKFzItSwf46+cd
         t1DkJayEYutJ2g+HtUrxDVFlsm6hBFyKs6rA8wmXviRNBqmxs10FErRHKYQURBFJH97a
         QOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKXVCDU8Y7QA2u5dsuJz52dTXUls77F0aq6tpQyZMnO8Nw+IjNMo3aoA8t8FiqUsPhEJpuDvaiRpCufZBA19ok@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi9n2aEzL6WZEc8PTrHY3hYSU/9ojra53UvpeAAFN30ndKXEj0
	P1npD+TFd5cq3A3M+0jJuU0MmfCFDiMDpMtznNXiU5p2z2QQNJWEDmNltTEnX7Z+keL5RigkJ4c
	TCI2/qcTppy5PQp2G3pF8KeB4IbGwMhawdUCPbZ7bH2uVXjCNbn9oPg==
X-Gm-Gg: ASbGnctT7bI3VGCZuDNux3hwtJup+RkfwFkkzJgLesg5bDj+3WU7YUf8GEiNgI3RpyF
	CAglbQ5uTB+2WtfiD98pQ3ReeFPJTWgLeFhkIm1aNmepy3LGXSDgJW3qHfJ0VNrkEs9UIfQ7Tqa
	LmZmaGER3MaFdHT1t2TdYe3r/9Jdyx/YStlzvw+Zl1xNCMO+zSNizR1vXLgHOTUZdLg3sBGZb0k
	CwOz6Y=
X-Google-Smtp-Source: AGHT+IG8U03UpiLYKbtFizbKfv9yB5x8yYCq7RDDBBmKtZwiOn8gG/X4U3tVssvjQCIruMENSE23SwYyH5DXYbZYSsw=
X-Received: by 2002:a05:622a:1884:b0:4a9:e34a:58a1 with SMTP id
 d75a77b69052e-4aecf9d1b90mr4112341cf.21.1753808183683; Tue, 29 Jul 2025
 09:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250728223710.129440-1-rananta@google.com> <aIjcmquPNOdE5l4K@linux.dev>
In-Reply-To: <aIjcmquPNOdE5l4K@linux.dev>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue, 29 Jul 2025 09:56:12 -0700
X-Gm-Features: Ac12FXzGVONWVZtJXMRcendx58YZR793CWu4R9YnCYvWGKAJQzZFsbX55XCdkxs
Message-ID: <CAJHc60xPKgVn96azWhP1NbfKioEZj68APQPf=zKRMuHB7-goqA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Set/unset vGIC v4 forwarding if direct IRQs
 are supported
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_095626_144155_713DEB3C 
X-CRM114-Status: GOOD (  20.89  )
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

On Tue, Jul 29, 2025 at 7:37=E2=80=AFAM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> Hi Raghu,
>
> Thanks for reporting this so quickly :)
>
> On Mon, Jul 28, 2025 at 10:37:10PM +0000, Raghavendra Rao Ananta wrote:
> > diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v=
4.c
> > index e7e284d47a77..873a190bcff7 100644
> > --- a/arch/arm64/kvm/vgic/vgic-v4.c
> > +++ b/arch/arm64/kvm/vgic/vgic-v4.c
> > @@ -433,7 +433,7 @@ int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int=
 virq,
> >       unsigned long flags;
> >       int ret =3D 0;
> >
> > -     if (!vgic_supports_direct_msis(kvm))
> > +     if (!vgic_supports_direct_irqs(kvm))
> >               return 0;
> >
> >       /*
> > @@ -533,7 +533,7 @@ int kvm_vgic_v4_unset_forwarding(struct kvm *kvm, i=
nt host_irq)
> >       unsigned long flags;
> >       int ret =3D 0;
> >
> > -     if (!vgic_supports_direct_msis(kvm))
> > +     if (!vgic_supports_direct_irqs(kvm))
> >               return 0;
>
> I'm not sure this is what we want, since a precondition of actually
> doing vLPI injection is the guest having an ITS. Could you try the
> following?
>
> Thanks,
> Oliver
>
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgi=
c-mmio-v3.c
> index a3ef185209e9..70d50c77e5dc 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> @@ -50,6 +50,14 @@ bool vgic_has_its(struct kvm *kvm)
>
>  bool vgic_supports_direct_msis(struct kvm *kvm)
>  {
> +       /*
> +        * Deliberately conflate vLPI and vSGI support on GICv4.1 hardwar=
e,
> +        * indirectly allowing userspace to control whether or not vPEs a=
re
> +        * allocated for the VM.
> +        */
> +       if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(k=
vm))
> +               return false;
> +
>         return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
>  }
>
> diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
> index 1384a04c0784..de1c1d3261c3 100644
> --- a/arch/arm64/kvm/vgic/vgic.h
> +++ b/arch/arm64/kvm/vgic/vgic.h
> @@ -396,15 +396,7 @@ bool vgic_supports_direct_sgis(struct kvm *kvm);
>
>  static inline bool vgic_supports_direct_irqs(struct kvm *kvm)
>  {
> -       /*
> -        * Deliberately conflate vLPI and vSGI support on GICv4.1 hardwar=
e,
> -        * indirectly allowing userspace to control whether or not vPEs a=
re
> -        * allocated for the VM.
> -        */
> -       if (system_supports_direct_sgis())
> -               return vgic_supports_direct_sgis(kvm);
> -
> -       return vgic_supports_direct_msis(kvm);
> +       return vgic_supports_direct_msis(kvm) || vgic_supports_direct_sgi=
s(kvm);
>  }
>
>  int vgic_v4_init(struct kvm *kvm);

Yes, the diff seems fine (tested as well). Would you be pushing a v2
or do you want me to (on your behalf)?

Thank you.
Raghavendra

