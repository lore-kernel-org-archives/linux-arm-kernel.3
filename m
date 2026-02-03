Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABDDE83057
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 06:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPfG7IVpjEneMOzN4kNdadNHZSe9In0bxUCOtJ3itiY=; b=qE5VtZHemlyyScueFHnyDznCvl
	IZg5Qaniot+5IxUU+1m7tWGg5vnHV5H6FoXUcVbkTrObFrI6pECpcHvEwuYyHaC+uMLibP06S094a
	WcGcteKZl+If8m7mt6AF+YGiWuRHfkap+iTubJ+X+hvB/aN6T04mInXo1RcBNXdhrwNjQQdb9kAjG
	QM/uHmw/ud940w2rDoGuhCUCQouCF7YUnx7M5CUKnNTNLsREw3zgH92vb3ReWWF4yljXYPbXHqBVD
	IfxiQVBrADnCmu9YIwBgwysKmQSetLdv4orn6Rh5+zSIlavyEKzM2zkUbbzrSWkA5Y0bJ9r10uphP
	6cx/MKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnAL0-00000006DIG-2zNw;
	Tue, 03 Feb 2026 06:56:38 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnAKy-00000006DHr-3x67
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 06:56:38 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b87677a8abeso794634066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 22:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770101794; cv=none;
        d=google.com; s=arc-20240605;
        b=XcDUa9CP791Qo72x6I54UdrVDgUXNMweXx4N62rTEnA7d0t0n3wrdIB9qXZftcuNLi
         3jCw2xawWr2FxfxgenfAdYcLObhS6DqRd1kOuMPY6T7rj8D8lRK33JX7Uqy0Qe0WdU0f
         8VP4DCCMFiM3xZT1cpSEollY9fsrfk4SNdlO2Tk5uLKYKm08dnWOlgwh1Ued4tA4gx4E
         7DN6J1vHbf5IC+FrIVR46FGBpsx2sdLu2xb8Dc2rGU56Bz2g2KftmFioljHl0B7+3WEB
         11aKw99A918tG2QKFg74Z/GuQMgM14rxGzCVHFhj5skICEjlbAI7SaGUNXB7clUAicbW
         +mbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hPfG7IVpjEneMOzN4kNdadNHZSe9In0bxUCOtJ3itiY=;
        fh=9F+GFcvyHzkTgL3/XYhhj641Hj+QnDfJ+47muhIKI3g=;
        b=HUP9+NuENd4AfRiOkMjkKulUvlAMKt8yea4YG2ITUlryoxwn5wm+iFZ2LfIy6JljIt
         Tl4AJynHD3EYDH4U2vvgVpPdiF2WUApQL7uuMms1OzzD1qCIBbyc03qiu3YUaViDpQ0U
         BMGrWUyRxV8zh7R4ACy13dEmLbD8qFvPAG5H9oYiK7K2pPXrJXGVVIs4LFvaNXmw7GfD
         fQo3FwkhB2qtKneWOJkNLx2POmMGjGhvPAxTWNlVkJs5enGTkPPXqjTFWtyotDhvKPhn
         7C6gE0pOlNcHSYD37iTKKbPTfgQRsqVLP/hSu5cUveAe9yRPzlzoGJ5KdcZq2opTwbgi
         NCNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770101794; x=1770706594; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hPfG7IVpjEneMOzN4kNdadNHZSe9In0bxUCOtJ3itiY=;
        b=Xhfe0aCovELZnQh8D2YwsLw2Dh3LOwvSMDDBm8jbMd/C4pDf135xgWdSGdJLH2SGeC
         xO8BxotfUkZWsU6pwl3S7XB/oCFnieSTL04/eDkxdlXHfKFiqph2ybM7uZIpNgoSVGn7
         EtJcQ8mUUcjPOopIhMg6KMFNO4iQ8+tbCDHHC1RNWaCcxduyMrngLJ1PTP2+mC57+0qV
         KU7AhHBMzDRFr7kpl8KUo1wzm+flEwoW3bm+qBnuuJEH2s/p+fAFw20Li1/NKDuBiHbC
         Ok7QpkIJI5hm0O1PRDdExe41tRsjpXGFvNsrsRlBJ5K3Z1bpUEsMFIBt6RqiDB5srHqC
         rTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770101794; x=1770706594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPfG7IVpjEneMOzN4kNdadNHZSe9In0bxUCOtJ3itiY=;
        b=Ftp2CoWzIBqlGQOFAbloEfuF2pu9YYF63eK5RhU05SbpA2Eu4GRNjYo552hIsNjCZj
         sOoMiEQNXFtcnbqmrDwRPZ+AyL+V2nFLTODgPHMMBINRIv2PquQ4NLPQ50gqDocoQyWV
         prkDMUUdRRelefuVjHFDyNw4SXq8FpDwpyyn+uxl7r8fSis6TPH6r45mn1v8P/YJeMBh
         ZqQ0V1HKs8Qw0b+GKyEBLbthWJEb1VbiUghXZVo3Yuc5DyCsGF/doBP9od2xfLrHhk94
         d3bYQfva3Fau45U2HUPQf6hsxnWvDP/8RRZhTYx67fSffaVMYHd6UxEOpPNzq/vadwTp
         7yLg==
X-Forwarded-Encrypted: i=1; AJvYcCXVTv2F7B5xU3yPa1qPRcFbmFKb1Zd6T42p2LpNrEJ5HT3as/2vlUFxcKJIjV/kWw3RR57IFtpBzAskm0Yb95p2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/gfLN2JKYt7Ib7YkvF17P10wtwWqZrcBynaltrmEVfseu/J9e
	wDciY8vqwC0bk1tXqGiiRjFEAldzbMOxaooMLUaZeRLo5WvijC3uK78l/LNJgmgzrtdQHleX6/4
	8/3PouggwppFMm+BliQVck6XuKC5GIqmQhfdCSRX7b5GdF3mCtIxWPLE=
X-Gm-Gg: AZuq6aLG0xOo7ygMUyDMfmbIdCsfIoqICn1vdra/cl4gHYC9ISk1fCN6X+9u5+s5D6E
	U+nu/isds/6bdKDv/wP7owmIAbwjx4DlPNG1qX66j7LWnASRn2J9Aq5/+Ao5gv8SgjxQbdDWB6r
	ORT8BPi0LfTCUdrhbrP369KbyaFgwzkDp0sf0PCE96EVHy71eEyyGq/KKV6MTdAmKaKmToJKeyB
	DIKHur7vZ8Z2lv1ygo7IiMItzU9lZP/ewvsj4bSo31sVPkaBUmEezoBpQwsiHl/XwrNsUDobryC
	vMcym/xEj5rHgMS6+cgGow==
X-Received: by 2002:a17:907:94d0:b0:b87:892:f43b with SMTP id
 a640c23a62f3a-b8dff68456emr931355166b.42.1770101794402; Mon, 02 Feb 2026
 22:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20260202151050.1446165-1-vincent.guittot@linaro.org>
 <aYDiFpGT5hEDDFhV@lizhi-Precision-Tower-5810> <CAKfTPtDjad7aowTQ3UJPi5Qqgzf3q8J=kASa-t3YM4zfjUv3-w@mail.gmail.com>
 <aYD+/iTSF8ikTLIY@lizhi-Precision-Tower-5810>
In-Reply-To: <aYD+/iTSF8ikTLIY@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 3 Feb 2026 07:56:23 +0100
X-Gm-Features: AZwV_Qg5Kwi9KHew4ku1K5fA0TmRsp-hVv0jTdHdOIruFI5le9h55MG348VMg14
Message-ID: <CAKfTPtDcKw0qc3o70AT9_n2omejNrh9fnkwS5NWKQpqjaCnBdg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: s32g: Fix ports parsing
To: Frank Li <Frank.li@nxp.com>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_225637_021641_1EBBCB57 
X-CRM114-Status: GOOD (  25.55  )
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

On Mon, 2 Feb 2026 at 20:46, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Feb 02, 2026 at 08:23:30PM +0100, Vincent Guittot wrote:
> > On Mon, 2 Feb 2026 at 18:42, Frank Li <Frank.li@nxp.com> wrote:
> > >
> > > On Mon, Feb 02, 2026 at 04:10:50PM +0100, Vincent Guittot wrote:
> > > > No error return is missing after the loop resulting in removing the
> > > > ports from the list.
> > > >
> > > > Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > ---
> > > >
> > > > Change since v1:
> > > > - handle correctly the case when there is no child port
> > > >
> > > >  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > index 47745749f75c..b3ec38099fa3 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > @@ -282,12 +282,12 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
> > > >
> > > >               ret = s32g_pcie_parse_port(s32g_pp, of_port);
> > > >               if (ret)
> > > > -                     goto err_port;
> > > > +                     break;
> > > >       }
> > > >
> > > > -err_port:
> > > > -     list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> > > > -             list_del(&port->list);
> > >
> > > break and goto is logical equal here. So only need below if (ret).
> >
> > Yes it's similar that why I removed it, the goto becomes useless and
> > make code less readable
>
> But don't suggest change in this fixes patch, which should focus on the
> key part.

It's not a suggested change, it's the fix. err_port is now wrong
because it's the path for all cases.

>
> Frank
>
> >
> > >
> > > Frank
> > >
> > > > +     if (ret)
> > > > +             list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> > > > +                     list_del(&port->list);
> > > >
> > > >       return ret;
> > > >  }
> > > > --
> > > > 2.43.0
> > > >

