Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE15CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 07:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oSZTMv5D/sOGGLnpJ+IvuCz5xyHo5sq+jQga6CKtnM=; b=iKU2kOHEK3DgnwM5aZ6fbBAl1g
	MWSXj2zaOMJ4NVefc2YvfaODfKW2SONCvdU+eNfbjF8dxC+ypq0ly6d+729sEUZU6GU/rKJzm1it4
	l6KTxByIlsN9zigLgejYp6Bi+cKLgOG8a4qCzUqMdO1V5+E08YXbEU4neVkW9CU+BhL4v/xy+ofNJ
	JO4locM/Jx0tomZG4653SjuOcY72qkzymieeGnaWDqp4q+5vs+2HPGJScAdLvuyqKVt0XoolGX1WE
	rLRMf5e0KUFYL8hcHctsHaobSKnSCccSYeCJ+QuLBfIqjPghlOE+dIVmCYifUV6Z79zjzS7NHcEL/
	uORtQn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuli-0000000F1YN-3TUQ;
	Thu, 06 Nov 2025 07:50:54 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGulf-0000000F1Xx-3m7g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 07:50:53 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b3e9d633b78so118557766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 23:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762415450; x=1763020250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oSZTMv5D/sOGGLnpJ+IvuCz5xyHo5sq+jQga6CKtnM=;
        b=JHsEMo8p8nwkCSHwPCSVkkMobLwXeIc/Uv+9Raa6XZe5wMr2KbG200AXWey7W1AsQF
         m0sZ4GS3Vp90r2sf4dSJbpb4knKzXNEuklWV40PSoHahxfs6Gj7TmGYVDqZxT+Vo6wl7
         5q+xmd0qilL/7YIo4Nnxt+hQ31d/PtkmQ0wuLRjI63SyM0n+tWNTzEJtSf/3EVHBFwGJ
         9RiJzlmtm1GU5tI6cdj8e4fI6esmErbEqV82ECK2aMQTiqv6OHcIXLORb9Ag5xfGwzbe
         qHfJWHWzkjKnh3Fhk30RM2b9xqHOxxNCmrGAdXmwTep/v2PXC0HCBclETvViOWRnKVb/
         x2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762415450; x=1763020250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4oSZTMv5D/sOGGLnpJ+IvuCz5xyHo5sq+jQga6CKtnM=;
        b=Qo5cCUgitLJr0LGV1se3XpENCJCIvQySz6QovYLQiEJe3y4I66eBWEPJT+f3tWW9Gs
         5XgJTEDF88u1b0jOZbAwg4VlpxreXukPhj/B8KiEP1qJixm6/JmUkPcG9YXPTr5Vj6j4
         QnyfqmZYaerChdGk09Ygo3ITeJBU9d3Duda/utfkvANDmwqLrTQsJvV06iBcVt4oG6gU
         WBeWp29yS830JpSFUbqTR5ZT8XwMcT84rEoSsn43R5MSnvRiuRi8TECSSvPqm0ThmisR
         MZFYHdbEUHGj416hH06HnXk/FCCyhjMMRsNkFJHKI8T7V9LtOCnP1G7/rBGnAmFEBx+x
         +gZA==
X-Forwarded-Encrypted: i=1; AJvYcCUDhDyk/NxN2pcUCYX0NzblGIqyUBGBDPsM30RGcLIXE2JES1j6uAmphJ9J0xbn34P77WpU3x3vKjg74dwDRSOM@lists.infradead.org
X-Gm-Message-State: AOJu0YwIqqxCvXBLLUn6rulduAlZImnrvAqHBhz5nHEfOGJGiFxP3v7M
	qADnXMHM3plgITEUf9XRzDzHP6w5YlEWij1KCJ0bpYu0EKj+XSjaD0wij330vCd9ApfYopkgS+6
	u2bzGG28S00a+Uk1KPF2SrbjGccKGKTSr3GftQ9fUVA==
X-Gm-Gg: ASbGncul9x0R0MacVxPvIoCs6/KBdiYHaM2KPLiyifBgWyAW2u/VjNHXlwKAwwPC+tE
	E1izOTsvIjf+8/s4BKQ4+az4ryOKFj2w2YYHX/ZUoygCOgMh5XP5xw2Z4yUbR/LghoaXcjSDELJ
	fpQzJ8rxVsMO4xrmIar2h0CBxvh1eUVFP/o8o6OhjmkLETQ3vLP7+T4QojCGSwTiFHY+Wu5jTyT
	JTmEOQ0mzZ5vTMVvDveDaVHem3Jr4KKVWOiVz0Oua5Lpfa0M2XUdO7MG99L6g==
X-Google-Smtp-Source: AGHT+IGTqwA2P7XvjyYF/Izos2lVy+T5to2mL8X2E6WlWDzOEu9Bmz8GxKORg8EJlnHJ5cxaDH8TQQoU0UmnunUk7JI=
X-Received: by 2002:a17:907:94d2:b0:b72:6d68:6663 with SMTP id
 a640c23a62f3a-b728964dea0mr251219566b.31.1762415449844; Wed, 05 Nov 2025
 23:50:49 -0800 (PST)
MIME-Version: 1.0
References: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
 <20251106000531.GA1930429@bhelgaas> <vrgjkulv22hzbx65olh3zpyqxq6dr7d5mepngjwgc3gudjoxwo@ll7xc2teya2s>
In-Reply-To: <vrgjkulv22hzbx65olh3zpyqxq6dr7d5mepngjwgc3gudjoxwo@ll7xc2teya2s>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 08:50:37 +0100
X-Gm-Features: AWmQ_bkYpQyZF7OktEjeeIhdfj_KOUOxVV3OYB8DSDbc8qdV2MpPBlN_Lqu--DE
Message-ID: <CAKfTPtB=oMPsfjRFcQrAKM1m97B1LL9RJYVix+ea9Vb0FqDk3A@mail.gmail.com>
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com, 
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_235051_991598_81738D96 
X-CRM114-Status: GOOD (  39.49  )
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

On Thu, 6 Nov 2025 at 07:24, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Wed, Nov 05, 2025 at 06:05:31PM -0600, Bjorn Helgaas wrote:
> > [+cc imx6, layerscape, stm32 maintainers for possible suspend bug]
> >
> > On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> > > On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrot=
e:
> > > > On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > > > > Add initial support of the PCIe controller for S32G Soc family. O=
nly
> > > > > host mode is supported.
> >
> > > > > +static void s32g_init_pcie_controller(struct s32g_pcie *s32g_pp)
> > > > > +{
> > > > > ...
> > > > > +     /*
> > > > > +      * Make sure we use the coherency defaults (just in case th=
e settings
> > > > > +      * have been changed from their reset values)
> > > > > +      */
> > > > > +     s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> > > >
> > > > This seems sketchy and no other driver uses memblock_start_of_DRAM(=
).
> > > > Shouldn't a physical memory address like this come from devicetree
> > > > somehow?
> > >
> > > I was using DT but has been asked to not use it and was proposed to
> > > use memblock_start_of_DRAM() instead
> >
> > Can you point me to that conversation?
> >
> > > > > +     s32g_pp->ctrl_base =3D devm_platform_ioremap_resource_bynam=
e(pdev, "ctrl");
> > > > > +     if (IS_ERR(s32g_pp->ctrl_base))
> > > > > +             return PTR_ERR(s32g_pp->ctrl_base);
> > > >
> > > > This looks like the first DWC driver that uses a "ctrl" resource.  =
Is
> > > > this something unique to s32g, or do other drivers have something
> > > > similar but use a different name?
> > >
> > > AFAICT this seems to be s32g specific in the RM
> >
> > It does look like there's very little consistency in reg-names across
> > drivers, so I guess it's fine.
> >
> > > > > +static int s32g_pcie_suspend_noirq(struct device *dev)
> > > > > +{
> > > > > +     struct s32g_pcie *s32g_pp =3D dev_get_drvdata(dev);
> > > > > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > > > > +
> > > > > +     if (!dw_pcie_link_up(pci))
> > > > > +             return 0;
> > > >
> > > > Does something bad happen if you omit the link up check and the lin=
k
> > > > is not up when we get here?  The check is racy (the link could go d=
own
> > > > between dw_pcie_link_up() and dw_pcie_suspend_noirq()), so it's not
> > > > completely reliable.
> > > >
> > > > If you have to check, please add a comment about why this driver ne=
eds
> > > > it when no other driver does.
> > >
> > > dw_pcie_suspend_noirq returns an error and the suspend fails
> >
> > The implication is that *every* user of dw_pcie_suspend_noirq() would
> > have to check for the link being up.  There are only three existing
> > callers:
> >
> >   imx_pcie_suspend_noirq()
> >   ls_pcie_suspend_noirq()
> >   stm32_pcie_suspend_noirq()
> >
> > but none of them checks for the link being up.
> >
>
> If no devices are attached to the bus, then there is no need to broadcast
> PME_Turn_Off and wait for L2/L3. I've just sent out a series that fixes i=
t [1].
> Hopefully, this will allow Vincent to use dw_pcie_{suspend/resume}_noirq(=
) APIs.

I'm going to test it

Thanks

>
> - Mani
>
> [1] https://lore.kernel.org/linux-pci/20251106061326.8241-1-manivannan.sa=
dhasivam@oss.qualcomm.com/
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

