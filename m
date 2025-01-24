Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0B0C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MohKCVwaV6eyLihdD2bVSeyaXrhr1TtTgD4wyqMZ7DM=; b=eCuhzhO8Pu+hseoG9kzbBjDqGV
	U1lPrQSrm2N69jmVjklCmr96rbW0b3H+hys5uLliPt5/axInNWdwyA0JFJrllTDnEG5fAbFjuA7sU
	1LI/sL4NT4H+5pcRNGZs/CMUfAKVSt4tSqCJ38QP7iAwE8MABehAq7nLugRizKAzxIFQFABZL8PwS
	BG1+n3XjLB4CKVc+1ehrb98S7aXPbSoQIqqxk6gaPMEuMV6SWeFvbZHbKWxmzPz5ymNxCqzulKBdm
	bdLjOPb07EcOt1EBPqeRkXX31jZ8VYQxxJz9K3xAd9wlqxDxGOBuAd1evMaWOAUXy14ILQsfkgzk7
	VqFWoruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFmd-0000000ELTa-1q92;
	Fri, 24 Jan 2025 09:15:23 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFij-0000000EKsm-0ZYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 09:11:22 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so1095806fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 01:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737709876; x=1738314676; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MohKCVwaV6eyLihdD2bVSeyaXrhr1TtTgD4wyqMZ7DM=;
        b=ODBMntR5SmbzBRboAg4LoeFOE54SD6m4yVg6qIx6osO7ApSlCT1QVdS6Es94lDdzGv
         gPfC3rSFQkJaqrB4xUdHjmmTAvxnz0WBaIyGBrAbhbRaohViObzvkW2y1LbnwfXXi9oA
         zcYDFPLhrR/Pp47ZufL97q+EFR9BVjAyIVg4+jo/7Cb6H52LTpr/YqLXSXx1sQsK1cB9
         Rfxc1XvCxf116ROdNbjU8RY/ZC9knVKnBOqG0v3/V9NT9pIOqYGulu2xH54szVMOMbP1
         7MvNP3cGUFWQuEUPhhdOMsiDbBxNyX7oaLE+Kuu++N9sPnyISVI/WmsUKeWmlvxjlpZc
         FhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709876; x=1738314676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MohKCVwaV6eyLihdD2bVSeyaXrhr1TtTgD4wyqMZ7DM=;
        b=Lzz4v7BPOx1OGGDWIph7qXOupdjP63VKC3JPfjZeQXWpBNxNpDL6zymGVji8mkq3m4
         hLRU+eBDN3W1tVu0P6/NmgsatXQ1KHPR/lqHD6wMiHYlIyzVA7sl6CkMqgifW0jkH0Bl
         DaN3VPbaMrA678N8QpcTEQte6rQq+Mem85WfwL51kdEqwXjRtTSLNtu1P2luasGYt5dk
         ovNgtoIRoMVB1SASnjOznZ0kPeAzLiDMvBskIJ4haFnZOAtkoyZWjsntspGEhmEa6SDs
         aA5ULDbFDuGkCswKIIJjE+IwC9OpVorT0lX8cGR9V93xHhA3dPg59FjCLVJnjrQpogYY
         bjZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXptJF4B+tXYwXaVt5+7VmdD1J++qTUUHv6jnivC/ZDLodJXYA1Iqtg/g182veFMf9j9gv0BdrwImKZ6ZaUiKCX@lists.infradead.org
X-Gm-Message-State: AOJu0YxjZDbUnqCgMq8p6GiSYhl2BkemvdEiXzaHagtJMLCi9JjldPwc
	fwYPvgolpcBY5ZvcOBff4Jb8ztqY6qv8Wx4suvDZkLkZUKQGBctC2MgG/rdY6AaP6bcrtzimevZ
	v7fd2u7aU0NRw3ZmlD3jzdKMGAU0exvdb1c/Zag==
X-Gm-Gg: ASbGncspuZXT58GIgonw82j+iBOhAz7JOxY4g0cQnKdwc/Wb7/lZDWBPpTOrygAOUDv
	H0FH0IZn3JeAcHLCaz/Ax7L8ANsNoClchu/78/6L0LVcebyCxFPLnQASv2J692fIGgFwVl+g9J1
	o=
X-Google-Smtp-Source: AGHT+IHMglpELSThhHo8nROkg3DoafohvFAQ3oJ0ePqP1cakPUnQMtH2cEZnnfZgzU10EslTCXGCEq096KVOEgJPQ4M=
X-Received: by 2002:a05:6871:6181:b0:29e:3c90:148b with SMTP id
 586e51a60fabf-2b1c0bf7b45mr17853494fac.26.1737709876405; Fri, 24 Jan 2025
 01:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20250123074830.90923-1-cuiyunhui@bytedance.com>
 <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com> <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
 <31e00081-8695-4ca6-a1ef-af5a007a7565@linux.alibaba.com>
In-Reply-To: <31e00081-8695-4ca6-a1ef-af5a007a7565@linux.alibaba.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 24 Jan 2025 17:11:05 +0800
X-Gm-Features: AWEUYZmykPrt0I5q4ySCyT3YSRadhZWk3QmMa3gmOm6Vn0EAmAwMUxJ5DzbwMnA
Message-ID: <CAEEQ3wm+f_SM7evwL=YrGy8gPLS5YdJm=qhJNT8bbMH7QBOzEA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev devices
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_011121_353731_1915D2CF 
X-CRM114-Status: GOOD (  26.36  )
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

On Fri, Jan 24, 2025 at 2:48=E2=80=AFPM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
>
>
> =E5=9C=A8 2025/1/24 10:56, yunhui cui =E5=86=99=E9=81=93:
> > Hi Shuai,
> >
> > On Thu, Jan 23, 2025 at 5:50=E2=80=AFPM Shuai Xue <xueshuai@linux.aliba=
ba.com> wrote:
> >>
> >>
> >>
> >> =E5=9C=A8 2025/1/23 15:48, Yunhui Cui =E5=86=99=E9=81=93:
> >>> During platform_device_register, wrongly using struct device
> >>> pci_dev as platform_data caused a kmemdup copy of pci_dev. Worse
> >>> still, accessing the duplicated device leads to list corruption as it=
s
> >>> mutex content (e.g., list, magic) remains the same as the original.
> >>>
> >>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> >>> ---
> >>>    drivers/perf/dwc_pcie_pmu.c | 25 ++++++++++++++++++-------
> >>>    1 file changed, 18 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.=
c
> >>> index cccecae9823f..8b208f287a1f 100644
> >>> --- a/drivers/perf/dwc_pcie_pmu.c
> >>> +++ b/drivers/perf/dwc_pcie_pmu.c
> >>> @@ -565,9 +565,7 @@ static int dwc_pcie_register_dev(struct pci_dev *=
pdev)
> >>>        u32 sbdf;
> >>>
> >>>        sbdf =3D (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bu=
s->number, pdev->devfn);
> >>> -     plat_dev =3D platform_device_register_data(NULL, "dwc_pcie_pmu"=
, sbdf,
> >>> -                                              pdev, sizeof(*pdev));
> >>> -
> >>> +     plat_dev =3D platform_device_register_simple("platform_dwc_pcie=
", sbdf, NULL, 0);
> >>>        if (IS_ERR(plat_dev))
> >>>                return PTR_ERR(plat_dev);
> >>>
> >>> @@ -614,19 +612,32 @@ static struct notifier_block dwc_pcie_pmu_nb =
=3D {
> >>>
> >>>    static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
> >>>    {
> >>> -     struct pci_dev *pdev =3D plat_dev->dev.platform_data;
> >>> +     struct pci_dev *pdev =3D NULL;
> >>>        struct dwc_pcie_pmu *pcie_pmu;
> >>> +     bool found =3D false;
> >>>        char *name;
> >>>        u32 sbdf;
> >>>        u16 vsec;
> >>>        int ret;
> >>>
> >>> +     for_each_pci_dev(pdev) {
> >>> +             sbdf =3D (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(p=
dev->bus->number, pdev->devfn);
> >>> +             if (sbdf =3D=3D plat_dev->id) {
> >>> +                     found =3D true;
> >>> +                     break;
> >>> +             }
> >>> +     }
> >>> +     if (!found) {
> >>> +             pr_err("The plat_dev->id does not match the sbdf");
> >>> +             return -ENODEV;
> >>> +     }
> >>> +
> >>
> >> How about using pci_get_domain_bus_and_slot() to find pci_dev?
> > It's not necessary. pci_get_domain_bus_and_slot also invokes
> > for_each_pci_dev, and it further requires splitting the sbdf.
>
> Compose sbdf from domain, bus number, and devfn is almost essentially
> corresponding opposite operation. And I think we should grab a reference
> count of pdev and handle it properly.
>
> Personally speaking, I prefer pci_get_domain_bus_and_slot() because it is
> simple and robust.
>
> >
> >>
> >>>        vsec =3D dwc_pcie_des_cap(pdev);
> >>>        if (!vsec)
> >>>                return -ENODEV;
> >>>
> >>>        sbdf =3D plat_dev->id;
> >>> -     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootpo=
rt_%x", sbdf);
> >>> +     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootpo=
rt_%d_pmu", sbdf);
> >>
> >> A new name will break previous user tools.
> > This name isn't suitable. It can't clearly show which is the PMU
> > device. Userspace tools don't have binding relationships, like perf.
> > Tools must traverse PMU devices before use.
>
> The device is under /sys/bus/event_source/ which indates it is PMU device=
.
> As far as I know, most of PMU devices do not endup with a '_pmu' prefix.

The point is the name "dwc_rootport_" is misleading, suggesting an
extra PCIE RP in the system. Best to change the name to intuitive
"xx_pmu".

>
> Thanks.
>
> Shuai
>

Thanks,
Yunhui

