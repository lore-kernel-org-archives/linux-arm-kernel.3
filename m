Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5947AC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6sblODMsE+vI2Xzad5DK+Y6Y7xOicsx/NBPPr92E1Q=; b=EqN9Pb00I0ga+uu0fGBK/GcvA2
	Y/cEzIcHtc1cOAsw0Ml+kspFpN9Lt7kt0ZhP77MJRIQnPEsRUJKjxSQ+7u8AyIGlD9AixwyTv2pmE
	xs8ZfQ+6rLzM8JFBzcuI6bnYSvzOXkBURUnrW0GgExAeXq3ayvCuJ7sPshfA1UU86SfUa/l9t9Zct
	PLkiNdK6g0ECV6mAntrUEiRsUDv0lq3ODQ+9eyP7tx4N7mH10GJdA+jfKSHT2uO+Z/+PYXrFnMMfV
	Nwta15Z8y23HsciVPBYaxegNE2mAXS5SZ4pmbwg0mS6u6UJ+Q29x31ZPbSs0tHTIVWAB4bnSSNFZG
	eLwTHRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFlH-0000000ELJ8-1lwU;
	Fri, 24 Jan 2025 09:13:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFhG-0000000EKbj-43ze
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 09:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CEFB2A4130D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 09:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A031C4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737709789;
	bh=6ODapJhhQGi6PIhN0lVMoDCWGSUnfR1hVh+dZ2hFuZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D/CNhJT1iq1VYsG5Y2ZI8HFz67jLp/v0T6K+8uGnhtITcpn7w55gY+nNXFi1PUGHY
	 l2drx1RXWkDsIIi1BCW3GplM8xyKT6x9jvnK/utNeFTjjCzM8jdxSmHSOdczFlrx2b
	 6E+gGqSBwvPb1Qwz+cKoOI1oyv5M0mGn54CK/AUArIOyU/n4NRxMIMqx5Ji1aLJ8bM
	 02XRZ6Nx2xU1yMlsOWCamUbqdTR8xROse9WOfTKyrKty0xBpRg9bRTXYGjVnumg80n
	 YYZNm+PB9WGgPQbnBYrRQX7VNzDaVgjflgFpXSsBMs5BZ/buTxOJJkUABZpy4HUGJ8
	 8o/D3FdiyZsMw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso375167266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 01:09:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKsv7PEu5OOUBQtdkuuJ358KYZwRk5jlFbtDODX/tPPhZTPsOutdrYGH01IqPm0smPHC1nRiA9zGk4smO2FhyJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzIpkmTnA7BGkdO7G8ek3MdRDSx6awJlMSFh1197mjpSG+yD7ht
	BAarlmn7hU1eBughc53ZEFEwr2c9IFTaXPed0V0GzSE8DOz6Tnn6yy9o1SqEvL7BqcTQuOzjJuX
	j6Alz3mNhn8PCJXC/JIVfp3aEJ1U=
X-Google-Smtp-Source: AGHT+IGTuAf8HhxS55jC5emGy1X+8qNgDIgPU/o1SgJWkl820wvVBBoCo7jL58E2K6QC878sjf/FnZgeOx4+ewldUuc=
X-Received: by 2002:a17:907:7fa4:b0:ab6:511d:8908 with SMTP id
 a640c23a62f3a-ab6511d8af9mr1112359566b.40.1737709787937; Fri, 24 Jan 2025
 01:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20250121093703.2660482-1-chenhuacai@loongson.cn> <20250122133450.GI390877@kernel.org>
In-Reply-To: <20250122133450.GI390877@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Jan 2025 17:09:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4=FQbZakx_=V-qcoWuBzbVyL31qmStNS9OFt-49w20bw@mail.gmail.com>
X-Gm-Features: AWEUYZlq08fDdXgdubKEAY1DJZk-M0VOQOeQI5in40fIJ5XHXxgmvkwOvdPO5R4
Message-ID: <CAAhV-H4=FQbZakx_=V-qcoWuBzbVyL31qmStNS9OFt-49w20bw@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-loongson: Set correct {tx,rx}_fifo_size
To: Simon Horman <horms@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Chong Qiao <qiaochong@loongson.cn>, Feiyang Chen <chenfeiyang@loongson.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Serge Semin <fancer.lancer@gmail.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_010951_135968_6F806C94 
X-CRM114-Status: GOOD (  26.89  )
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

On Wed, Jan 22, 2025 at 9:34=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> + Feiyang Chen, Yanteng Si, Alexandre Torgue, Maxime Coquelin, Serge Semi=
n,
>   linux-arm-kernel
>
> On Tue, Jan 21, 2025 at 05:37:03PM +0800, Huacai Chen wrote:
> > Now for dwmac-loongson {tx,rx}_fifo_size are uninitialised, which means
> > zero. This means dwmac-loongson doesn't support changing MTU, so set th=
e
> > correct tx_fifo_size and rx_fifo_size for it (16KB multiplied by channe=
l
> > counts).
> >
> > Note: the Fixes tag is not exactly right, but it is a key commit of the
> > dwmac-loongson series.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: ad72f783de06827a1f ("net: stmmac: Add multi-channel support")
> > Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> Thanks, this change looks good to me.
> And I agree that MTU setting cannot succeed without it.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>
> Some process notes regarding Networking patches to keep
> in mind for next time.
>
> 1. Please set the target tree. In this case, as this is a fix
>    for code present in net. In general, otherwise it would be net-next.
>
>    Subject: [PATCH net] ...
>
> 2. Please generate a CC list using
>
>    ./scripts/get_maintainer.pl this.patch
>
>    The b4 tool can help with this.
>
> Link: https://docs.kernel.org/process/maintainer-netdev.html
OK, thanks.

Huacai
>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/dri=
vers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > index bfe6e2d631bd..79acdf38c525 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> > @@ -574,6 +574,9 @@ static int loongson_dwmac_probe(struct pci_dev *pde=
v, const struct pci_device_id
> >       if (ret)
> >               goto err_disable_device;
> >
> > +     plat->tx_fifo_size =3D SZ_16K * plat->tx_queues_to_use;
> > +     plat->rx_fifo_size =3D SZ_16K * plat->rx_queues_to_use;
> > +
> >       if (dev_of_node(&pdev->dev))
> >               ret =3D loongson_dwmac_dt_config(pdev, plat, &res);
> >       else
> > --
> > 2.47.1
> >
> >

