Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F69C02182
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 02:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+UEYg8yBcvYvQRoa6Z9nHSLCJyT1DAKK6Q+y1yd4C4=; b=u+hmmo0D804SBBMX9K6ZWjzhm0
	ZV5EJlIPK81JZuh9dIR29RWNbSrf9tF+jSucGOXKrpsQLrqpkmOypsElJoSmIP/0TvstOuZhruDDI
	wpqI9pPcC+FfjBNnZ7s9/qTX3oIHLwTSjRlgLMjjIaHrPsYT86P4aRWGz8VUouvR1u4nkq/cskZ7j
	eqfZBdKd714NOkxB0BnBrD4ZblC4bqJn0CjmufVEYpT9s33F52deFdY2XgWoDPs2RMlpHA6upGmQv
	jvfgdbG4ZSVY2P+L/Rwe24x2iKO4Dk1IzRcaIaLwM+PMN/Y3nRN3OdFSw2lPxKOFilB+OF/mRBX7y
	kkJfiiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb9tU-0000000Dm7l-3eFf;
	Fri, 24 Jan 2025 02:58:04 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb9sC-0000000Dm41-1Qoo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 02:56:45 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2b29662f823so74797fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 18:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737687402; x=1738292202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+UEYg8yBcvYvQRoa6Z9nHSLCJyT1DAKK6Q+y1yd4C4=;
        b=aJZXFwNjRRAlsHD9kztsmPmd5xQzax2dPJU3EOPKZUCloiFErVNp1D3fI/GV8fPqh8
         1EaW4ELGehtE3EqmyEp3L3HXnDSw6cWiSRtdJkRwJHhxy+QW8Laj/NBiowvYxw1ciMFR
         DH2k/od7PV3MEwOea8tV0/77mOJABoR7CBJ9G3smq8pFIqrrZ/hjfQvMg/637VPNJLxT
         b739J8iYS2z4B0Asg/J/rXuq57qqweM0G9nyqvuRshzg0mMPe4B9z/zq+Vm9eOrk1CuS
         QPPBu4CczslTjPR3Lwl/gnL+tUikTgb/NmmEUKNrY4LuI5+meg3jOso1ohPtggp4Q9hG
         ca3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737687402; x=1738292202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+UEYg8yBcvYvQRoa6Z9nHSLCJyT1DAKK6Q+y1yd4C4=;
        b=stjefuvdoIcFuDBmk6DOk+xDcVP0/STZJYaN/8q/L0y40Yy3HN3PsOOrwsYjM3qLjV
         fhG9G/fwIKGJk0BvIBLqN6Iv5NaLADJJ8dqpnx9Var+aWHlFgRcAv3FfDtrxBZIUzHkf
         qZ807ODO6BwsJx7DuXBQn7kCWGolyysa9PRJ8F+87IXgm79J2di7LFIj8sm6NxooYzkT
         vBmucv4hufl9CVD9ccyDrQSoKUm8dMWlqyc9wBhoxqbkmocvnW/CuC8V8m+KIBQ2IKHQ
         sbDKaGl9jvDbNFFcFLd+j3DfA/SbrwbuHCJZWQSeLS5SdHeJS4vpXiPzYT/s1j8g/Wdu
         gNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxcfYFLPJZyWdJ3a1GSNg9e+DN7uE0a6ZJt1ocORC1rLUOSaVNZryXkg2kTXKe+Vxa1DWF2lrWjR8TCyEnetvK@lists.infradead.org
X-Gm-Message-State: AOJu0YxuM5rmrSYasNt18XSmVX1w+mHWTmoQzEUINvgz0Rk23je4jPfM
	y9Y2kdNl1Q7VQHoyhXfrXBhx3UUf9dlK6p+l3QSQmoRjKT8MVXnmHhAziyaJe+p8VzkBrmNWXXW
	Tbx3Xu/4yi+0v9LLUeofnDAwx96VxS7pLLvMofw==
X-Gm-Gg: ASbGncsKW9ST555qWKnQBVAuMvmFI8D0U/aTaPkT7aM5oOurmkKo8CUs8IKDCK+WSvo
	wvJtpbdCCFPKmqtKzBGPzcFV74L17m0oonkooVqwRVl/jo4vvq5LRfp4H1R6aLV+kSGILosLF+b
	Y=
X-Google-Smtp-Source: AGHT+IFvccqYDtTosunleX52S76fRS2nHOiXrmTkjIrWtcBaeAa/R0S2lFwUYOrpQh4wE0C+yQ74/Ca3nlf0RyKXIA4=
X-Received: by 2002:a05:6871:3a88:b0:29e:2422:49f9 with SMTP id
 586e51a60fabf-2b1c0aee5efmr15513286fac.25.1737687402270; Thu, 23 Jan 2025
 18:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20250123074830.90923-1-cuiyunhui@bytedance.com> <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com>
In-Reply-To: <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 24 Jan 2025 10:56:31 +0800
X-Gm-Features: AWEUYZl4Lf_RFEPxQH5F4xNkyRUuNIZoJ2aW5YdkMvz7JRVMtXEGdp033WP-qYk
Message-ID: <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev devices
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_185644_552122_72F4AAA0 
X-CRM114-Status: GOOD (  22.68  )
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

Hi Shuai,

On Thu, Jan 23, 2025 at 5:50=E2=80=AFPM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
>
>
> =E5=9C=A8 2025/1/23 15:48, Yunhui Cui =E5=86=99=E9=81=93:
> > During platform_device_register, wrongly using struct device
> > pci_dev as platform_data caused a kmemdup copy of pci_dev. Worse
> > still, accessing the duplicated device leads to list corruption as its
> > mutex content (e.g., list, magic) remains the same as the original.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >   drivers/perf/dwc_pcie_pmu.c | 25 ++++++++++++++++++-------
> >   1 file changed, 18 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> > index cccecae9823f..8b208f287a1f 100644
> > --- a/drivers/perf/dwc_pcie_pmu.c
> > +++ b/drivers/perf/dwc_pcie_pmu.c
> > @@ -565,9 +565,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pd=
ev)
> >       u32 sbdf;
> >
> >       sbdf =3D (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->=
number, pdev->devfn);
> > -     plat_dev =3D platform_device_register_data(NULL, "dwc_pcie_pmu", =
sbdf,
> > -                                              pdev, sizeof(*pdev));
> > -
> > +     plat_dev =3D platform_device_register_simple("platform_dwc_pcie",=
 sbdf, NULL, 0);
> >       if (IS_ERR(plat_dev))
> >               return PTR_ERR(plat_dev);
> >
> > @@ -614,19 +612,32 @@ static struct notifier_block dwc_pcie_pmu_nb =3D =
{
> >
> >   static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
> >   {
> > -     struct pci_dev *pdev =3D plat_dev->dev.platform_data;
> > +     struct pci_dev *pdev =3D NULL;
> >       struct dwc_pcie_pmu *pcie_pmu;
> > +     bool found =3D false;
> >       char *name;
> >       u32 sbdf;
> >       u16 vsec;
> >       int ret;
> >
> > +     for_each_pci_dev(pdev) {
> > +             sbdf =3D (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pde=
v->bus->number, pdev->devfn);
> > +             if (sbdf =3D=3D plat_dev->id) {
> > +                     found =3D true;
> > +                     break;
> > +             }
> > +     }
> > +     if (!found) {
> > +             pr_err("The plat_dev->id does not match the sbdf");
> > +             return -ENODEV;
> > +     }
> > +
>
> How about using pci_get_domain_bus_and_slot() to find pci_dev?
It's not necessary. pci_get_domain_bus_and_slot also invokes
for_each_pci_dev, and it further requires splitting the sbdf.

>
> >       vsec =3D dwc_pcie_des_cap(pdev);
> >       if (!vsec)
> >               return -ENODEV;
> >
> >       sbdf =3D plat_dev->id;
> > -     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport=
_%x", sbdf);
> > +     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport=
_%d_pmu", sbdf);
>
> A new name will break previous user tools.
This name isn't suitable. It can't clearly show which is the PMU
device. Userspace tools don't have binding relationships, like perf.
Tools must traverse PMU devices before use.

>
> >       if (!name)
> >               return -ENOMEM;
> >
> > @@ -640,7 +651,7 @@ static int dwc_pcie_pmu_probe(struct platform_devic=
e *plat_dev)
> >       pcie_pmu->on_cpu =3D -1;
> >       pcie_pmu->pmu =3D (struct pmu){
> >               .name           =3D name,
> > -             .parent         =3D &pdev->dev,
> > +             .parent         =3D &plat_dev->dev,
> >               .module         =3D THIS_MODULE,
> >               .attr_groups    =3D dwc_pcie_attr_groups,
> >               .capabilities   =3D PERF_PMU_CAP_NO_EXCLUDE,
> > @@ -727,7 +738,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cp=
u, struct hlist_node *cpuhp_n
> >
> >   static struct platform_driver dwc_pcie_pmu_driver =3D {
> >       .probe =3D dwc_pcie_pmu_probe,
> > -     .driver =3D {.name =3D "dwc_pcie_pmu",},
> > +     .driver =3D {.name =3D "platform_dwc_pcie",},
> >   };
> >
> >   static int __init dwc_pcie_pmu_init(void)
>
> Thanks.
>
> Best Regards,
> Shuai
>

Thanks,
Yunhui

