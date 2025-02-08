Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8519C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 03:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvHvDYPRlwuJsPWLTplnt5i05PwJjOrBanqn75v6zZE=; b=IPG4yc9sGT/8Jv1H7KAtdkL7cR
	wUN/RgszheA1VL+CRDOletTBJAi939yUI+B/C1Jq8ECRejCHVZMoiV+pObsVs7+wPykeCXSaaUXq3
	drzD0YmMC2nvTKKBIFbGMPl3Vcpv38L0iv0r0tK75FPfOzZnTIxas1ROKTDLX/wZ/yri6tVBoPXY8
	e0tq+kyjU4SAo2baW/othmi3rhkV7E2bLqk/qk2LndVp+BG/nb90cr4AM5M/rue662Z51sNOAGp+E
	czO1TAqfQEqAeAa+57Y1VLtslz+H6BpmYUbrCJ3o2e34TAv3h6/9UZ9j6jYQSRoM52yt9l4GQrMAB
	E0RDelyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgb5q-0000000ByAK-2Or3;
	Sat, 08 Feb 2025 03:01:18 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgb4R-0000000By0l-2R7B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 02:59:52 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-71e3f291ad6so1962814a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 18:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738983590; x=1739588390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvHvDYPRlwuJsPWLTplnt5i05PwJjOrBanqn75v6zZE=;
        b=FhYlZ2M/sA0GyOo9BNjAX3fGw9xRq7x+A+lPbLlX71SDyaLBbC+pjbAhr/vroigLi1
         5ZdST8RPC9EkPNT4onWOToe4zMPbtL3iYhfDV/wNhGRF6tXZkBBJTW5ji8KUCu5USU6W
         S5wg4oHg7rPi+16t1x6BDiQjaUAtVUOuog9IGkA5v9vONBtoxKWDZCetlV/lAzdFUVvV
         WJm6En79SgTULISm/2mSNYH8erQkZ2inmvsyIBDQ5P78zMj9Ib2Y50YU8ijvRlpIUcaM
         CO6UxS1ZJdILLzrQD4oNb4yY5fGTN/SczWB9QWzPlZ1HtRXVFZsViIKEfRej4yFNgV41
         CuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738983590; x=1739588390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvHvDYPRlwuJsPWLTplnt5i05PwJjOrBanqn75v6zZE=;
        b=J84Z3190k89iF0Oy34yImMLLv+9WVnxkO0mvtOJbC4YI6RDcDfBrcQRBpT16h6dctv
         XZjJ0a8yR71AlPpwKE6rmQ/arxMTUNCLNixAZ/VYtLlOLgcUDdWHQdL8dF0iRVmJd94H
         AMFayNs0SFhuV/9VXPhLZfo+tA9p1vmCa89rfbmi9tZwq8rUonCyMN7gCpb5ntjlE3gl
         O4vvAXTK6ZvLASC7robapnlN4/DO2BiKWIv8ff6iEqwKNRv+tMeQCpgQXc5zBhAYRv3m
         vu9XcWo1H4bQ6oRU2diFh6eIHdI/kSYxlRNnMf4zNM6u6lolxEXJZR/oOeoNHKmOoBTD
         hnsw==
X-Forwarded-Encrypted: i=1; AJvYcCWSKTAVj1N90ponCPbqh/U6/yr8gcyHaB+0Ha+DE3fuVGpB6tZl0gMXEZDyxUoZ6+MuubJR/zBtPKEO0Y3o6w8x@lists.infradead.org
X-Gm-Message-State: AOJu0YzZLMKyfQRsfZJea74hjW/+lVo5pgaetr0O9nuu2w/0o5UsKbMF
	NwilxlizZTccQadtc9aR6bTwJmRE/x+4cK2IEdTzhCtTqD3ps8JS8hWfuVsDoBHGZS0Y1lbtzuc
	UrXfsLtzZviMEi5kJ4/OwnQ4wh6UPLUy3ZbjCmA==
X-Gm-Gg: ASbGncvfU38GeBTpev90YfTvaQibsI/oM1cc3GXgXvIBT254HrOLOAp4B1ozGjUi5Ob
	3HIYOroqAVGRLXuuLtNwn/kzwfQzyg1635Vx9CLpG86INJZoDFLwbzH6ztddZ4RLUAFJzhZmRsF
	M=
X-Google-Smtp-Source: AGHT+IFfCgmR8iwTSKqI7U2HdoYDqvph6iBamD8uzFVFSvAH4DmSsPQRkRlpYANAxnvRjFuZETIUtoRlunikEsWu7t8=
X-Received: by 2002:a05:6830:6383:b0:71d:548d:6f76 with SMTP id
 46e09a7af769-726b88ad8dfmr3715898a34.26.1738983590587; Fri, 07 Feb 2025
 18:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20250205031425.67265-1-cuiyunhui@bytedance.com>
 <20250205031425.67265-3-cuiyunhui@bytedance.com> <0961be9f-87be-4ecc-9e60-faa78119affc@linux.alibaba.com>
In-Reply-To: <0961be9f-87be-4ecc-9e60-faa78119affc@linux.alibaba.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 8 Feb 2025 10:59:39 +0800
X-Gm-Features: AWEUYZnr_NMxngTAzPNVuIY-6PvoCxF0axRwCuZj-ABVShCDvBpbuzCDyPoFijY
Message-ID: <CAEEQ3wnJ1ihu62JDwEhVRBjddQpm4xC-CYhj2QTa4P6EbO_hcg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 2/2] perf/dwc_pcie: fix duplicate
 pci_dev devices
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_185951_621048_B150C584 
X-CRM114-Status: GOOD (  21.18  )
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

On Fri, Feb 7, 2025 at 10:36=E2=80=AFAM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
>
>
> =E5=9C=A8 2025/2/5 11:14, Yunhui Cui =E5=86=99=E9=81=93:
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
> > index 4ac53167d7ab..fd9d87b4f201 100644
> > --- a/drivers/perf/dwc_pcie_pmu.c
> > +++ b/drivers/perf/dwc_pcie_pmu.c
> > @@ -566,9 +566,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pd=
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
> > @@ -620,18 +618,26 @@ static struct notifier_block dwc_pcie_pmu_nb =3D =
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
> > +             pr_err("No pdev found for the sbdf");
>
> How about also adding the sbdf to print?
OK, I'll update to v3.

>
> > +             return -ENODEV;
> > +     }
> > +
> >       vsec =3D dwc_pcie_des_cap(pdev);
> >       if (!vsec)
> >               return -ENODEV;
> >
> > -     sbdf =3D plat_dev->id;
> > +     pci_dev_put(pdev);
> >       name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport=
_%x", sbdf);
> >       if (!name)
> >               return -ENOMEM;
> > @@ -646,7 +652,7 @@ static int dwc_pcie_pmu_probe(struct platform_devic=
e *plat_dev)
> >       pcie_pmu->on_cpu =3D -1;
> >       pcie_pmu->pmu =3D (struct pmu){
> >               .name           =3D name,
> > -             .parent         =3D &pdev->dev,
> > +             .parent         =3D &plat_dev->dev,
> >               .module         =3D THIS_MODULE,
> >               .attr_groups    =3D dwc_pcie_attr_groups,
> >               .capabilities   =3D PERF_PMU_CAP_NO_EXCLUDE,
> > @@ -733,7 +739,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cp=
u, struct hlist_node *cpuhp_n
> >
> >   static struct platform_driver dwc_pcie_pmu_driver =3D {
> >       .probe =3D dwc_pcie_pmu_probe,
> > -     .driver =3D {.name =3D "dwc_pcie_pmu",},
> > +     .driver =3D {.name =3D "platform_dwc_pcie",},
> >   };
> >
> >   static void dwc_pcie_cleanup_devices(void)
>

Thanks,
Yunhui

