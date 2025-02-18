Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9F5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJd7nq6QzBYjb9npIZDy/jgRU4O0VseneW2dwq1EDmY=; b=d6zCTx2t+ptyX2yW6EYGLdrTql
	i5tCTM4CxU+P1xzhx6tVDd2d5S/2ie4sn7aDg7Fqs9J0b76Imi6sJlVOnUqbIofdwEjfqPH+fBpAb
	z4BBYiQe9XuYuj0WdJrpooydmZlaOlPCxcQinEaJwpYwNiMuDE6TAOBcVOjOnhBFyiTau6RGgt/pr
	UacfsVQ+zVAQNIoXZ6w+OtCM68V2CWKzZWxoAH8Mq100PIGTY+X0OBRJWPpHFdIJ4P/t02zJwfA1P
	eNyPOBEUAQWn4qiSqXVzzGE/SzflOZMZiLcY9N2m0vfvW0XGO6PWu08gKtDJeARMwTHwQgMu8l7qc
	DieyvOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJK4-00000007Mgy-3FKx;
	Tue, 18 Feb 2025 08:51:20 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJFF-00000007LW9-2lRE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:46:22 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5f4d935084aso2551030eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739868380; x=1740473180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJd7nq6QzBYjb9npIZDy/jgRU4O0VseneW2dwq1EDmY=;
        b=cgfDC1ETsnAapAKGDb6uQfaJ68zDf+ZrdP1kDAgtI+f4gBw/jkU8DALEk/Tb3/Ig+2
         q4S4m59k6CJFZ1RXz7wI9zP9y+YxZ9953Y0TTBgpY+HupzoVo+gz27ElCJ0QaB+5VQnQ
         EfJEUpy3UYa346iLPIp/qPAoZ9KpSivkEcC4a2bjk5L5sM1VSMY8nC568xSih8bpUSZ9
         kka7wNMasAkvSmlFQnWwbLJKce/3kL4v7d71eaIS+Jy9qF91QXu7bbtKO7vGJOdE3DVJ
         vwFHe9alq67QbMBFBFiZp7FD3LO6ikSHWKfDa1sne3vPcFlIS4FRnDja73ZvFb3iWe67
         Ozjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868380; x=1740473180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJd7nq6QzBYjb9npIZDy/jgRU4O0VseneW2dwq1EDmY=;
        b=vc5wHAVBbDcuGcbMi8UfTcKPsCTc8bAyO0H4Nq0CnrJtCDQCB2CeC4usjsCj6r/SPL
         tAn06qdSDZYkEWTXQAqglU6ojumx4vZZWcc0C3uHPeYG4PwFVQUmo6gFOvP/6kyYnIFS
         AHuYybY41+MyxBM4HGvlgggwQ67nPLo/JIJRrFRz+jfZS8c4mccxukSBxb8mfEBYp1H6
         A3y7w9/BkvH58JDhfm7NMxjWSNgFLW6YfrqS317Gbfl1IBRCJ2nnadnzjox0A7FozIm4
         OHzkcLf2FnslD+sRxUFB1DWr/sP7ceJ+Bg0Q4CD1n+OHi2Ek+AIj8VN19cjMLDjnhh7R
         qwfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy2jUtwCz/qCgQ00tjhseitz9PLaue0XRHIc6iJCBJ6dd7UU2cCW8W52X7HMEgO/PwwY33koXDoK9cg+XPaKLU@lists.infradead.org
X-Gm-Message-State: AOJu0YyZQYlSKvvggaRS9oIfIUqrE262LMmm/Xzefnt8N30X2Zk3Bn3R
	wpgxCGe+ulJYj7GdqiQ57h4qY3tag2Q60sLsy7HqvG0lr6sdDn1utIaUhNIN1xOnfyDwN22l/y1
	rrhhWXoNDpdn3hCXGf/IwyomLPDDHZAMiaRp+Fg==
X-Gm-Gg: ASbGncsZ1fopVycpnumLHzl6goYsDGR65W+O9Fd7i3YX9LMLoC7vxi5OWMm3Hbq6Y3A
	pCBL0ah/tQzNPQ/dhlMroSjOIDS0fgRDhn0rmrF97B3Kduva8SM4IvLDjqpwLhlVDRHJM+RipQL
	I=
X-Google-Smtp-Source: AGHT+IFm9vNEQ8X126IwADvLb9rT5XMr1pesOHyHKgcPIaN+xUJPxTGUWHrghfMYHG0o0nWqEBP/oKVjpG31b6OWn1o=
X-Received: by 2002:a05:6870:b623:b0:297:23cf:d3db with SMTP id
 586e51a60fabf-2bc99dcc23fmr8163637fac.37.1739868380048; Tue, 18 Feb 2025
 00:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20250208104002.60332-1-cuiyunhui@bytedance.com>
 <20250208104002.60332-3-cuiyunhui@bytedance.com> <2fedcf43-05f9-40da-a4f7-1b836f30b0df@linux.alibaba.com>
In-Reply-To: <2fedcf43-05f9-40da-a4f7-1b836f30b0df@linux.alibaba.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 18 Feb 2025 16:46:08 +0800
X-Gm-Features: AWEUYZlKaYI0ZGCGtjcpg77WiA6ZuKperDHgxYMipoc-2RT3j86BH0keI_z0DXQ
Message-ID: <CAEEQ3wk5AhHK5cbZ-m1ibz93qqGJ1OPXM_NE_6rWjkuPM=Gw=g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 2/2] perf/dwc_pcie: fix duplicate
 pci_dev devices
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_004621_700833_201F735C 
X-CRM114-Status: GOOD (  23.51  )
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

On Tue, Feb 11, 2025 at 4:02=E2=80=AFPM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
>
>
> =E5=9C=A8 2025/2/8 18:40, Yunhui Cui =E5=86=99=E9=81=93:
> > During platform_device_register, wrongly using struct device
> > pci_dev as platform_data caused a kmemdup copy of pci_dev. Worse
> > still, accessing the duplicated device leads to list corruption as its
> > mutex content (e.g., list, magic) remains the same as the original.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >   drivers/perf/dwc_pcie_pmu.c | 20 +++++++++++++-------
> >   1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> > index 19fa2ba8dd67..4f6599e32bba 100644
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
> > @@ -616,18 +614,26 @@ static struct notifier_block dwc_pcie_pmu_nb =3D =
{
> >
> >   static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
> >   {
> > -     struct pci_dev *pdev =3D plat_dev->dev.platform_data;
> > +     struct pci_dev *pdev;
> >       struct dwc_pcie_pmu *pcie_pmu;
> >       char *name;
> >       u32 sbdf;
> >       u16 vsec;
> >       int ret;
> >
> > +     sbdf =3D plat_dev->id;
> > +     pdev =3D pci_get_domain_bus_and_slot(sbdf >> 16, PCI_BUS_NUM(sbdf=
 & 0xffff),
> > +                                        sbdf & 0xff);
> > +     if (!pdev) {
> > +             pr_err("No pdev found for the sbdf 0x%x\n", sbdf);
> > +             return -ENODEV;
> > +     }
> > +
> >       vsec =3D dwc_pcie_des_cap(pdev);
> >       if (!vsec)
> >               return -ENODEV;
>
> pci_dev_put(pdev) should move ahead to aovid return here.
>
> >
> > -     sbdf =3D plat_dev->id;
> > +     pci_dev_put(pdev);
> >       name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport=
_%x", sbdf);
> >       if (!name)
> >               return -ENOMEM;
> > @@ -642,7 +648,7 @@ static int dwc_pcie_pmu_probe(struct platform_devic=
e *plat_dev)
> >       pcie_pmu->on_cpu =3D -1;
> >       pcie_pmu->pmu =3D (struct pmu){
> >               .name           =3D name,
> > -             .parent         =3D &pdev->dev,
> > +             .parent         =3D &plat_dev->dev,
> >               .module         =3D THIS_MODULE,
> >               .attr_groups    =3D dwc_pcie_attr_groups,
> >               .capabilities   =3D PERF_PMU_CAP_NO_EXCLUDE,
> > @@ -729,7 +735,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cp=
u, struct hlist_node *cpuhp_n
> >
> >   static struct platform_driver dwc_pcie_pmu_driver =3D {
> >       .probe =3D dwc_pcie_pmu_probe,
> > -     .driver =3D {.name =3D "dwc_pcie_pmu",},
> > +     .driver =3D {.name =3D "platform_dwc_pcie",},
>
> Aha, it is very difficult to come up with a name that satisfies everyone.=
 The
> original name uses the '_pmu' suffix to follow the unwritten convention o=
f
> other PMU drivers.
>
> Personally, I think the original name is more appropriate, but I'll leave=
 the
> decision to @Will.

Since Will hasn't replied, I'll update to the next version to keep the
original name.

>
> Thanks.
> Best Regards.
> Shuai

Thanks,
Yunhui

