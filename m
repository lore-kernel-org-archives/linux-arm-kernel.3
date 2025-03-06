Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA613C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRrVZ0Qb4mFOKQncQdIGVomsgNpOi0dxaE9w627ruA0=; b=nvPLR5gfY6J6kterRy1wlHTnW4
	Po0f/2B/WPUd/AH9LYNhKo+9Rg4MTURv0B6Dv03y8Ys4/QvzErQmVEEBFwXWCNWpYnN+uUAeIsJLI
	0MbW3z8gnk16PhsSjyC/5uM4FoWuN6H3UZbC8HeeoNmmDoIrBAL70WPOBHo3KaoK1iX6771pmBpuj
	qyM7QyHWw32IdxOcEiUVVUUr8SPANdPbYYKX3K3YV3HIZ1OeEpd69cgePv7soOWl7dfzn03aBBBpt
	Fvp4ivGeXtXpl90MVccTkrFEsbeTCh3B9DgRp+S03eDJmVUFv4PHyF/X2om6Cw8nXsx51RBTtDsRk
	lO6iqULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7c2-0000000AUwB-1FzM;
	Thu, 06 Mar 2025 09:33:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6VM-0000000AKH7-31kb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 08:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=FRrVZ0Qb4mFOKQncQdIGVomsgNpOi0dxaE9w627ruA0=; b=UYhNVdB7cVR95GaqSkz+Xfecpz
	YRP/ln9F1JGIeRryMlxklh0PKFSU/Z3VxcCX9qUvtuWH4TcvDfMzcPu6CGZk/S2rA9y6XDYGTwLV2
	BtE/x3MtDp4SzihmAmYdLy5EVQhc3KjUE4WHZ+zfcld5yw1V306IOUhvgVFl/vnbLJwDP/C5rNjI8
	eNbfDNwJErb3YOSzqsI3o0vMEzyCsgkAU5QmM+VngM7tnyxyMg+tNWWZ9ZDrPjeiajKPC09VHQOV3
	OWl5KW1JAh9/HSoSint77jSODxDOJNF375GaRg73OT6a6BBh+37em7xJG5Yg0N+N1XnOLWmsHtJeV
	0WFSm9bQ==;
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6VJ-0000000743I-3KUd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:22:55 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-523bf140eccso510539e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 00:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741249368; x=1741854168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRrVZ0Qb4mFOKQncQdIGVomsgNpOi0dxaE9w627ruA0=;
        b=mfDUWTEXAO8WNk2ljqS/jhazydTsPEbSAurLCbTZm5XRAoxxwa2XP11iJcHuyC4liu
         VODaNjsED1CR+2ZugsZtGTU8aCb7Ay+zAqh5jCMXinBWStOyvnFgMT147A4TWj12zT2N
         t7iWM5FKgkvdWAQhCuUGDaxLMkWScadk3L8WIN8JZm+A3VXnhcdrexsmfvynxQV5vzK3
         T4qbJChF1ntoyAv/28IoaSOj7jVPVsMpg6KwHtmJp2Dvv4NyDPuHpVT74fkxHGZrafVC
         3IYLhBPc4J9Ln0/0XJSXvB1Y2l0l1NGl4UszSHi/aboqU2HXdInnLPByfwf6uWiCp6H3
         5g1A==
X-Forwarded-Encrypted: i=1; AJvYcCUdKFq2st165V2OoHHp7bPK1ssHwoQAC1/F5ItahsulmVyXAWwYxOfHqQlTUFh/tEQeGv4QxyGFj+RACJXp0PZ9@lists.infradead.org
X-Gm-Message-State: AOJu0YyB3QUPqFIoHk9dJ8MY9J+VnEeXDmOCLTfF5aV1yFizXcqRX00b
	Jr0Epamqnr/XJ77I3TgwFsXSUEcOaRhNeW3CML+dWJeGxa+7n8JEOp8SgNs4
X-Gm-Gg: ASbGncsI5KhRWZRmxQb7XliF5Uhk65a+V2ZlDO6Nyb6qjIRRbJDCSBDLOQp9ZFZIbLz
	nxOSr8J0o0MahU8IgbJf7fPzZAt3ZyhmtwKV58LtFwpOfAW12JTmXKZSC0y1AFCzvERat0zLp01
	4HX5oe1f6/05fopg4jC/DdoGuuuPITduhi0NHGVNgXQSZd6rhRmf5DHaSB9o2fgOaTvAyXh8anW
	5r2qdo4tuSdwWGRCJqECCqLldGZybJ31o/gUHqtlVXCSkw8VHPur91/eF0eJuQoH32ZtKN+7P3h
	3yCbehMo66j/KS2/sSiuE4Cd4rZIiIoBf+4dgFQZWSrarfoPY5PnH+h1lKWV9tSDiLwu+c3zzM9
	QGDCx7jo=
X-Google-Smtp-Source: AGHT+IE5mxaJydlZSajs3Q3W9jJk/H2LCtqWd4kuCb85FzGRk/JslpGwuaBmTgWesQkZU5C3u+Gv4Q==
X-Received: by 2002:a05:6122:32ce:b0:51e:ffd1:67f3 with SMTP id 71dfb90a1353d-523d5054442mr1250100e0c.7.1741249368188;
        Thu, 06 Mar 2025 00:22:48 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8ac1ec7sm116094e0c.11.2025.03.06.00.22.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 00:22:46 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86718541914so1587169241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 00:22:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvLwJc1G34zUhqXY/rhqMhU4Z8XD2VS3mNgy/xI2pCDUrZil7MR6rXIMUukP57X0LSR+N0HlieJ7fG2GsLle3w@lists.infradead.org
X-Received: by 2002:a67:f948:0:b0:4c1:b01f:8c7 with SMTP id
 ada2fe7eead31-4c2f66d367bmr1172152137.8.1741249365980; Thu, 06 Mar 2025
 00:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20250304171154.njoygsvfd567pb66@thinkpad> <20250305173826.GA303920@bhelgaas>
 <20250305182833.cgrwbrcwzjscxmku@thinkpad> <20250305190955.GK847772@rocinante>
In-Reply-To: <20250305190955.GK847772@rocinante>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 09:22:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRSjkss3gPnocXpfPQ=mEo4AevpaU=fdGvm=kb3RTmcQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrhQM2yc1IEyYpQi2IEGHYpY6yhiE8-bZMdZwiJJ0QwJlNhyHxfSkZ8qMU
Message-ID: <CAMuHMdVRSjkss3gPnocXpfPQ=mEo4AevpaU=fdGvm=kb3RTmcQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Fan Ni <nifan.cxl@gmail.com>, Shradha Todi <shradha.t@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com, a.manzanares@samsung.com, 
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com, 
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com, will@kernel.org, 
	mark.rutland@arm.com, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082253_839045_F4CCBD25 
X-CRM114-Status: GOOD (  25.10  )
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

Hi Krzysztof,

On Wed, 5 Mar 2025 at 20:10, Krzysztof Wilczy=C5=84ski <kw@linux.com> wrote=
:
> [...]
> > > > Even though debugfs_init() failure is not supposed to fail the prob=
e(),
> > > > dwc_pcie_rasdes_debugfs_init() has a devm_kzalloc() and propagating=
 that
> > > > failure would be canolically correct IMO.
> > >
> > > I'm not sure about this.  What's the requirement to propagate
> > > devm_kzalloc() failures?  I think devres will free any allocs that
> > > were successful regardless.
> > >
> > > IIUC, we resolved the Gray Hawk Single issue by changing
> > > dwc_pcie_rasdes_debugfs_init() to return success without doing
> > > anything when there's no RAS DES Capability.
> > >
> > > But dwc_pcie_debugfs_init() can still return failure, and that still
> > > causes dw_pcie_ep_init_registers() to fail, which breaks the "don't
> > > propagate debugfs issues upstream" rule:
> > >
> > >   int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> > >   {
> > >           ...
> > >           ret =3D dwc_pcie_debugfs_init(pci);
> > >           if (ret)
> > >                   goto err_remove_edma;
> > >
> > >           return 0;
> > >
> > >   err_remove_edma:
> > >           dw_pcie_edma_remove(pci);
> > >
> > >           return ret;
> > >   }
> > >
> > > We can say that kzalloc() failure should "never" happen, and therefor=
e
> > > it's OK to fail the driver probe if it happens, but that doesn't seem
> > > like a strong argument for breaking the "don't propagate debugfs
> > > issues" rule.  And someday there may be other kinds of failures from
> > > dwc_pcie_debugfs_init().

pcie-designware-debugfs.c only does small allocations.  If any of
these fail, you have much bigger problems, and the system will die soon,
irrespective of propagating the -ENOMEM or not...

Another issue is that the caller does not handle failures correctly,
given (A) the irqdomain WARNING I got, and (B) the half-registered
PCI bus, oopsing on "lspci"...

> > Fine with me. I was not too sure about propagating failure either.
>
> What if we do this?
>
> diff --git i/drivers/pci/controller/dwc/pcie-designware-debugfs.c w/drive=
rs/pci/controller/dwc/pcie-designware-debugfs.c
> index 586a9d107434..fddf71f014c4 100644
> --- i/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> +++ w/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> @@ -162,7 +162,7 @@ void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
>         debugfs_remove_recursive(pci->debugfs->debug_dir);
>  }
>
> -int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> +void dwc_pcie_debugfs_init(struct dw_pcie *pci)
>  {
>         char dirname[DWC_DEBUGFS_BUF_MAX];
>         struct device *dev =3D pci->dev;
> @@ -174,17 +174,15 @@ int dwc_pcie_debugfs_init(struct dw_pcie *pci)
>         snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(de=
v));
>         dir =3D debugfs_create_dir(dirname, NULL);
>         debugfs =3D devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> -       if (!debugfs)
> -               return -ENOMEM;
> +       if (!debugfs) {
> +               dev_err(dev, "failed to allocate memory for debugfs\n");

There is no need to print an error message when a memory allocation
fails, as the memory allocation core already takes care of that.
So please drop the dev_err() call.

> +               return;
> +       }
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

