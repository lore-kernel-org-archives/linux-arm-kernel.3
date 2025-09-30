Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2502FCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxp5oWG2zYQb/bAadgrp+7BT1AfD0ElhKVNTGDmQyfk=; b=NtNVOMIs5HQ5ppqoq54K37oK9O
	KjZm04yQ6CLHuNKZrx3hwHlAK9nS3dGNUnFrwO/MRy1yhPEx3O4BeEqNIUrLhyxfoT33rK2OjQwbf
	j3EcaLNZkhKD5fkQI6/pdf3FpTTJ3xOz2ZNymosDQKYSoqp1buCz++lZfPkw+wxx3AChw72FviiQH
	0tRL1f+IsjOXVSGQ9ragqEcDp0nkk6ZvnXE70jVDwwXMcNcUZJVmyX/dfaVO/qf2IQOc1RlGeHBy6
	SDkM5g2/gwETjOJMXGBqlsfFZi433UqGXx1fidYiusAV7bXg5iMM9R19fS85fKVM7wMl+ijmlQ0hn
	vX+zTIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cwi-00000005kNN-3aCC;
	Tue, 30 Sep 2025 16:11:20 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cwg-00000005kMx-3EDz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 16:11:19 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-62fc686dc41so6104375a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759248677; x=1759853477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxp5oWG2zYQb/bAadgrp+7BT1AfD0ElhKVNTGDmQyfk=;
        b=TDF4JOWuhO/m6PGf963dX0ZlcxGk93HgstErkO0FqOI0rCk4IT7+gmO2tFS3jTIwS8
         u4P0kxRoK2p1SvvkeVII6NGPp8I1CP9Yg2FQoGI0+BGu0CQpx0Nk9GLocADaGPEKYuxK
         SlDIsLbVEDcmYLNdtAaf5Jpw5TSsxkpRF7AxXHvHlP7T4QLW/Q/iaZr9X/FAoOguZVGe
         MbZG80pRSx4RMSxuXK6+Axhp6GKS7K2AtQH90jHmrp61/OxzYUsfonUFvgnwvnpf7cNK
         W6UwjjNaH31wN4TKadS5jTWzEWrSANRSsj7jzzDPrkN9F/9APQrn90wF8LPqMPddIQ2c
         oeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759248677; x=1759853477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxp5oWG2zYQb/bAadgrp+7BT1AfD0ElhKVNTGDmQyfk=;
        b=u4+yxmyRZphYQsLHqh0TEhVoQ8n7XeqBO/m/atq/j3QkpM6TF/UuCeFq820gRLVQ2I
         JWPk+8utOtSfHq5WDUm3enqqI5T0iOKAiRDYyD0BnAANbDk3cONuTmYx2bs44jiin0V0
         1n6l29I2hr9wkWQcB915DSf8gn6wELoJ/wwZVAy19PrZDmowj0tEBOWK6frDg89FIekJ
         UI8xGH6kMzd46iQ7/uVbSmPUmumBMoAZteATAAdUk7qgmL/eeJKcUpA7eUsCEH0dLbg3
         zuu51+fYogz7NN6EEbqXSh6QdfRjsNVkarKtztLtMfbGXlr6v7LbFX142SSyhsfLcqFO
         2Mrg==
X-Forwarded-Encrypted: i=1; AJvYcCU4JYzmYBRmmBxC4sspc1mquSKDzikuVNWHjpUk+nJXHq/800BiMG8EmZBLGKcO10cHSqICxzxfuqjOM3fTiA6Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxBUUPjJC+BAQyZO6UjxnKyKTV7YXv6zXpFAzj724PZjywVkFPr
	tWfAHloHqj8niqHbQahytYvFtDB2DcM0vc4ODLytUHCoY5HWCEylMfBOHlCSFvbH/uwnM4vLATt
	349kItl03w/9voOpUBHYZ8gMQYumMOqZRmzj2LR9F4w==
X-Gm-Gg: ASbGncuFVAa2ltwpu/l2xbzSPrBBOc45rh4Zy6fpQjJLjRCydxQsCym0ZJfM7v/DKgD
	TMaeFG+jjLRHPZPxZkZ/Q3k+6h+jPV/gUfNERHj4RRz1Z+ICa1O/jJNW4VI1ixNkLfAt2BgZxm9
	t72cUS3Mord6DRz4jJXjFtlsaE+e5GnKauDSOeOfHTA+eurgiRNpANlXy/0+MCjpv8HNoPU98kP
	fcjUqonTJ9jFYt4gZplEZHZ9IKzTwf1OSH4181+ynerz46o4b33ajrsssRBoG8X75+mPXk=
X-Google-Smtp-Source: AGHT+IHcT65SCb0YDaj8HXJyzDEr17zNKjdB+wgbHVUN98mdk2+pEmJMBE3H+oYu+G7ZvB3GLkI42wO9NC0FtjKrGmM=
X-Received: by 2002:a05:6402:3584:b0:634:abb6:8b4b with SMTP id
 4fb4d7f45d1cf-63678d0a45amr507520a12.22.1759248676729; Tue, 30 Sep 2025
 09:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-3-vincent.guittot@linaro.org> <4ee5tqdjv5ogcdtysiebtoxmrvrzhkar4bjcsqi47dxtgwac4c@rezn4waubroh>
 <CAKfTPtAEkegCV-9_x-dXSWQFOoG6kO5JbJq_LToY9YuuRusoVA@mail.gmail.com>
 <lmczw5agheqbcl6xcomlhf7yfbdvfx45pozmaxjmbkkqudsxlu@c7u6s5h4xm6j>
 <CAKfTPtCacFhJztYvWycSdoWMUStaf1WAcGJKHwk3y4n-uEELSw@mail.gmail.com> <xmjgs5ssolugcq2ogjc5j3ccwalcc4q3whl64fcra2aiebhtci@qwobbjtb2wcl>
In-Reply-To: <xmjgs5ssolugcq2ogjc5j3ccwalcc4q3whl64fcra2aiebhtci@qwobbjtb2wcl>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 30 Sep 2025 18:11:05 +0200
X-Gm-Features: AS18NWCijqY2xYOImmRNqiG0s-RQFrJ1uFUZhBOTuBa0xoCxbLUGNkckGMVPh8A
Message-ID: <CAKfTPtDva4fUQty8b5b=tLEHcd+OGFSS9i0DJqnn3vFvgG9wrA@mail.gmail.com>
Subject: Re: [PATCH 2/3 v2] PCI: s32g: Add initial PCIe support (RC)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_091118_829064_3F2DD92E 
X-CRM114-Status: GOOD (  26.84  )
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

On Mon, 29 Sept 2025 at 18:32, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:
>
> On Mon, Sep 29, 2025 at 06:23:05PM +0200, Vincent Guittot wrote:
>
> [...]
>
> > > > > > +static int s32g_pcie_resume(struct device *dev)
> > > > > > +{
> > > > > > +     struct s32g_pcie *s32g_pp =3D dev_get_drvdata(dev);
> > > > > > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > > > > > +     struct dw_pcie_rp *pp =3D &pci->pp;
> > > > > > +     int ret =3D 0;
> > > > > > +
> > > > > > +     ret =3D s32g_pcie_init(dev, s32g_pp);
> > > > > > +     if (ret < 0)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     ret =3D dw_pcie_setup_rc(pp);
> > > > > > +     if (ret) {
> > > > > > +             dev_err(dev, "Failed to resume DW RC: %d\n", ret)=
;
> > > > > > +             goto fail_host_init;
> > > > > > +     }
> > > > > > +
> > > > > > +     ret =3D dw_pcie_start_link(pci);
> > > > > > +     if (ret) {
> > > > > > +             /*
> > > > > > +              * We do not exit with error if link up was unsuc=
cessful
> > > > > > +              * Endpoint may not be connected.
> > > > > > +              */
> > > > > > +             if (dw_pcie_wait_for_link(pci))
> > > > > > +                     dev_warn(pci->dev,
> > > > > > +                              "Link Up failed, Endpoint may no=
t be connected\n");
> > > > > > +
> > > > > > +             if (!phy_validate(s32g_pp->phy, PHY_MODE_PCIE, 0,=
 NULL)) {
> > > > > > +                     dev_err(dev, "Failed to get link up with =
EP connected\n");
> > > > > > +                     goto fail_host_init;
> > > > > > +             }
> > > > > > +     }
> > > > > > +
> > > > > > +     ret =3D pci_host_probe(pp->bridge);
> > > > >
> > > > > Oh no... Do not call pci_host_probe() directly from glue drivers.=
 Use
> > > > > dw_pcie_host_init() to do so. This should simplify suspend and re=
sume functions.
> > > >
> > > > dw_pcie_host_init() is doing much more than just init the controlle=
r
> > > > as it gets resources which we haven't released during suspend.
> > > >
> > >
> > > Any specific reason to keep resources enabled, even though you were r=
emoving the
> > > Root bus? This doesn't make sense to me.
> >
> > By ressources I mean everything before  dw_pcie_setup_rc()  in
> > dw_pcie_host_init() which are still there after dw_pcie_host_deinit()
> > in addition to being a waste of time. Also we don't need to remove
> > edma and free msi
> >
>
> Let me take a step back and ask, why do you need to remove Root bus durin=
g
> suspend() and not just disable LTSSM with dw_pcie_stop_link()?

That's something that I'm trying to clarify but it's so far the only
way to get suspend/resume working. I have some hypotheses that I need
to get confirmed but it doesn't have full control of clocks and power
domain

Vincent

>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

