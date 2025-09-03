Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6D7CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 22:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZo1QLahALrmkDN63JQmCMj7vBZnmPYdOiAkRsEwF88=; b=qGYzMuidZTpM3RBkorKoCzHunu
	Qm6EXlnBlRmGpyb/qDZwGJmC8W03g6FmdVyzgdtgHNQT9QOT8UJGkh8/eLZD14cPHL6FRwr2PiyrO
	mxjxdjl+D4oHf2kgdrbjCZ9G5CyzORQ69QK5m/2BJIk+q9vqsShX9AO1pJt9w5xjpOGQS2NRqyl/b
	qRGh52gO5c3NLSOiqGw7ygfRa+zRedbxc7VJTnyqkgHSpdNRuqXIwJ0MkxROr9by5u+ySCDPIulR3
	LiqZAok/wde9ALdk7SMzZPP425Ulab9WHyyh8w5kFzEq1iU0hU+uSejl3jhC8C93R7RszlBxnAu3Z
	o1pgTQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvYt-00000007kXe-0dPX;
	Wed, 03 Sep 2025 22:02:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpQT-00000006uw0-35WS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70CE744C51
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 15:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5711CC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 15:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756913373;
	bh=VIC3yESeSFavKGxbmPdXIWhH/KHmeXOIED4A31+ezvE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=apnG0CKTdKsdZHcilpZah+9QTA9Pp8xfDSZM28TFW3A/lnYW/imlO23Yo30cBBGaJ
	 FGaW8LjAN6LvwhElgRSMceeMZhJdfeQch20cEt+2eLyIYVIcWPKPhzis378GXOVOSM
	 jZiRhphCsvLh/+yrR3YM5mGsSC7HH+IEl+AXnJIDJHknOwJdQfat/egCULhZnnLEUe
	 tTRhCLKOwRFcv6zrXJeugd5cWol4mRcJv3i7ZPisLE331rl0JAm+ardoLSW1juW5Ns
	 5n1yLqrkqufDz+9UnhKbMuf1iwzKDdbeM/RYv18Y6UiAX4k03p72QHiR/DCDZnjUVJ
	 bl+uTgi5gThcQ==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso9766949a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 08:29:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4tOynIT9JBGSxEnWYzoJQ8SSXPecNSzhTJV3mnCOdqqVH/r9UBNpO3ePiz+LbxvXXQHLS/4FU2gI/Ato0SJpd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+9oXpioGoj0vRdykZlA4+LhUtZD24Z2siUJS9vTZ9wG5VpbOM
	fw+d8ry9n38aFJftTowfCugK1I5NUVTJH/vQE0QBPPFG9wYsiNaBMRsDddgSqYMbtXN+lJhN4jF
	MjnuGS/MJcsu/bOixX7ZQO3a/oL4YPQ==
X-Google-Smtp-Source: AGHT+IHIZntuL2/Ac5u2OaDFAuRDB+LbG/bkyWkqoVLmP8JAXC3VGc5IAFp7aOeSXvXSi7KwhtkL+44jIjkwTuJse7Y=
X-Received: by 2002:a05:6402:3594:b0:61e:49dc:171f with SMTP id
 4fb4d7f45d1cf-61e49dc176fmr10199592a12.1.1756913371891; Wed, 03 Sep 2025
 08:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250902151543.147439-1-klaus.kudielka@gmail.com> <hiu2ouj4f7zak2ovtwtigf6fylz4c7fdyyqiqezsddoouzr4n5@bfs7kudjfnp5>
In-Reply-To: <hiu2ouj4f7zak2ovtwtigf6fylz4c7fdyyqiqezsddoouzr4n5@bfs7kudjfnp5>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Sep 2025 10:29:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLo8WbHMtjdbsauncusFh--OkNWXcN_pkpPxxT8xAmBNA@mail.gmail.com>
X-Gm-Features: Ac12FXy3-NzR24Y_vWe7NkORfh2uesLtfRvYO0BBWxGtos2fLyE26nKGT2Xfr8k
Message-ID: <CAL_JsqLo8WbHMtjdbsauncusFh--OkNWXcN_pkpPxxT8xAmBNA@mail.gmail.com>
Subject: Re: [PATCH] PCI: mvebu: Fix the use of the for_each_of_range() iterator
To: Jan Palus <jpalus@fastmail.com>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_082933_814269_C2DD77A8 
X-CRM114-Status: GOOD (  26.86  )
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

On Wed, Sep 3, 2025 at 7:44=E2=80=AFAM Jan Palus <jpalus@fastmail.com> wrot=
e:
>
> On 02.09.2025 17:13, Klaus Kudielka wrote:
> > The blamed commit simplifies code, by using the for_each_of_range()
> > iterator. But it results in no pci devices being detected anymore on
> > Turris Omnia (and probably other mvebu targets).
> >
> > Analysis:
> >
> > To determine range.flags, of_pci_range_parser_one() uses bus->get_flags=
(),
> > which resolves to of_bus_pci_get_flags(). That function already returns=
 an
> > IORESOURCE bit field, and NOT the original flags from the "ranges"
> > resource.
> >
> > Then mvebu_get_tgt_attr() attempts the very same conversion again.
> > But this is a misinterpretation of range.flags.
> >
> > Remove the misinterpretation of range.flags in mvebu_get_tgt_addr(),
> > to restore the intended behavior.
> >
> > Signed-off-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> > Fixes: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for =
parsing "ranges"")
> > Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> > Closes: https://lore.kernel.org/r/20250820184603.GA633069@bhelgaas/
> > Reported-by: Jan Palus <jpalus@fastmail.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220479
> > ---
> >  drivers/pci/controller/pci-mvebu.c | 14 ++------------
> >  1 file changed, 2 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controlle=
r/pci-mvebu.c
> > index 755651f338..4e2e1fa197 100644
> > --- a/drivers/pci/controller/pci-mvebu.c
> > +++ b/drivers/pci/controller/pci-mvebu.c
> > @@ -1168,9 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(str=
uct platform_device *pdev,
> >       return devm_ioremap_resource(&pdev->dev, &port->regs);
> >  }
> >
> > -#define DT_FLAGS_TO_TYPE(flags)       (((flags) >> 24) & 0x03)
> > -#define    DT_TYPE_IO                 0x1
> > -#define    DT_TYPE_MEM32              0x2
> >  #define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
> >  #define DT_CPUADDR_TO_ATTR(cpuaddr)   (((cpuaddr) >> 48) & 0xFF)
> >
> > @@ -1189,17 +1186,10 @@ static int mvebu_get_tgt_attr(struct device_nod=
e *np, int devfn,
> >               return -EINVAL;
> >
> >       for_each_of_range(&parser, &range) {
> > -             unsigned long rtype;
> >               u32 slot =3D upper_32_bits(range.bus_addr);
> >
> > -             if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_IO)
> > -                     rtype =3D IORESOURCE_IO;
> > -             else if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_MEM=
32)
> > -                     rtype =3D IORESOURCE_MEM;
> > -             else
> > -                     continue;
> > -
> > -             if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D rtype) {
> > +             if (slot =3D=3D PCI_SLOT(devfn) &&
> > +                 type =3D=3D (range.flags & IORESOURCE_TYPE_BITS)) {
> >                       *tgt =3D DT_CPUADDR_TO_TARGET(range.cpu_addr);
> >                       *attr =3D DT_CPUADDR_TO_ATTR(range.cpu_addr);
>
> Thanks for the patch Klaus! While it does improve situation we're not
> quite there yet. It appears that what used to be stored in `cpuaddr` var
> is also very different from `range.cpu_addr` value so the results
> in both `*tgt` and `*attr` are both wrong.
>
> Previously `cpuaddr` had a value like ie 0x8e8000000000000 or
> 0x4d0000000000000. Now `range.cpu_addr` is always 0xffffffffffffffff.
> Luckily what used to be stored in `cpuaddr`:

~0 is OF_BAD_ADDR which means we couldn't translate the address. Seems
it is not needed here, but it should work. Can you define DEBUG in
drivers/of/address.c and post the log?

Rob

