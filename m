Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2F8EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGYStsQlHuKPzU2WNtYOMLZuzbUrY0YdQicljirRGq0=; b=oiESACUMlk5hILpRZ0Ksz8YdTH
	I0XfFL1UklYLghXPVy8t65w1Sml9kaDvBN2Dy9TkBFm1sB8lYi6ZpQP1F+ZQEBDvfqhrP6axWvsqK
	nQhQow/njuer3nZ7WZ6Jx442iCEBJ0ZuoDu9oZD7B4BqzsCW21BLBu0YZIO6aN7ZvXQ9NEhk3fdU9
	01fRquD52sg/Wc58+T3RIYi/utaABzH3Jy+Orh+BySCx6isE+JMsMp1mjePKjux0G7fga5F355ze2
	4Gvfk13Hj+3Ja5aTayzATbKS1P8tt0BC667/E0tEDowmlnE2AgYSte+sXyONSwSRKvNtgtwm3dOgk
	akjSXf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUD8-00000000C21-2uDw;
	Mon, 23 Feb 2026 11:34:46 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUD5-00000000C0q-2qWH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:34:44 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so4377381a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771846483; cv=none;
        d=google.com; s=arc-20240605;
        b=i3T3Ievcecd7ASsfh4ziBD1Yvghif6vUcHcW4MpFtvbkZH8axS5j98JFMOHLM9X6mU
         U55hAziCjTXXaXSHoQl8TshYdlq37Jpwi9XF4jrgZJJHUPj40Ezskn1P706DHrCEWttu
         RIjaZJo/lxuvDEjm7v7dxuhD8xRSyxvVwC85BkOmKIbR9f1y4AEmKqn221stnzrGVT4P
         n7bN1+95PHkXsyjvyLDwi+Rissw77etA/CoRSco8LYPWT/mhxI1GrF9L+Cz2ed5OFZa0
         ETLI/NRpqGJ/CMcsniHdsZ6ZjzgLP32WooeukwfUTL/QxtlDwvCZL8YwNwx6QIxVtSkb
         NZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mGYStsQlHuKPzU2WNtYOMLZuzbUrY0YdQicljirRGq0=;
        fh=WRQ+lYfq41M8atXePZEOxwN1X9OCPqDusjfEdSthS7Y=;
        b=C0Cq8iVK3mRDCJKBvrlayvCF6FCiVrBlrNV3oODKmLmadiuFSYam7bSPHS1y43IHj1
         1MRKLvymk3ibRTmaJ+UuUBFPK5d0LIpH84+kPEQ6UnFyOynXqo6Ho/6A4Mbrhkxfik9Y
         tQYX8rgcpfAr8WXvW4+MQTpi0hOF69IX6tddwqCwQItbOpCWcEthG1PvzVlTKokFNCaB
         SbJ6/kfiHIbF0SojIXm3WJOsBrlEh8g4TBW2ooUwJ6fwz5fjnBHSck9Z2GuESrP1hiWU
         35tvizPaMAU9d3Kc67CaUZYdXiq1MIUf/7oJIPND241t0mBuNSyTaCQi3nIarJH9oPHx
         r3Jw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771846483; x=1772451283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGYStsQlHuKPzU2WNtYOMLZuzbUrY0YdQicljirRGq0=;
        b=bNPENvg62GvmftnnKfD6lnnCLS57xPpOrj37ouwTb5i1zea+wvIAvd/EJcal4nHE0G
         ORr+wUdpQs1pyF2wshLNkDZfzQBrQAHzGVRq45BsVwCRU3pg+ErZX9xFm1FkL01xGC76
         JXcy/RGw/IfDFNTsVVO4v6J5koDobwgGz4Q24QW+SyJmINEMqiNoHeSUvgNy+Y8qeIkU
         oybxo8Nlvo//UTrlbHI6gjKL7ctJgZkD0XGUBuwC3UpL6zRc1CxgYj7itvM2imG3fRY/
         k3z9AYxnH6SNLaPG1fvUG1FplKi8+QCAm8VfT4E+QoLjx5551g+nQma/qvltSZgWMPqn
         xMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846483; x=1772451283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGYStsQlHuKPzU2WNtYOMLZuzbUrY0YdQicljirRGq0=;
        b=lXHJPY0QY2egjtWrbPwwJ+vSerpXpqzmbaF1iZ0Tn203OovSUETtWzcz8c2OSoxzaw
         sjULLMXjuOWh8wCltmhV2ahyxCvK2fTKERRgXXY+ip7bCd990lb/3gqTKWayIVjpHFuE
         lQvMmovsCuQEr8cfurisiPcbdy809mj/jE+e3cZqYKblzlXDd647FOW2sKV0ld8ZL5pP
         eJK+mfeAmKZxoYvDgqVU1ogA/QRF6oN+3s1zqX54jghNjoC7QsS3TAwJJMgJ2YncNORK
         DercEMxCnvn9PpFxITdobrq0pbBXOVP/CMiarMpoXq0xYaHH2sqQfYJVxpnlglnLD3me
         yuOw==
X-Forwarded-Encrypted: i=1; AJvYcCWvnUtBNqek+d9QBl59+Ohu5yQhOVUFrLWH4ddlZ4LpXI8InmPfBdT5upT3GQu0Sl0zw4IvtXsPAuizVPFAJSeH@lists.infradead.org
X-Gm-Message-State: AOJu0Yze6PINXykseug8U3oin5K3s9a9Anxqdy3HxDkmTe3Gh3dOYC4i
	sQfqkBaFO+WLXMYdva1giR+wKAVzs9ldLgFxwMUHtrdGsE+LeACh2aErUSgRymhQzINGqwrGTFh
	UTVG6AM6dP7VFCuyQBHWZKMEes5pHhGg1AmG4
X-Gm-Gg: ATEYQzzfTDERHzhfvjh/Z7/1+TRK1xkIbryxS2m7RD7a/pWaRZUnrXbnb5jS8eNjRbK
	EvMHmEcNnyvAHRmQbUywQAipaZimEFMeVQvpX6hZCwTFFG5CLP/V/Edg239PlIXpV/Ga22Sj/aZ
	X0yPH5CAH+OSvtF0vMYk5Rws+WEA4dtdh00mC1i4XImriWNForDbZ5dHDYpwA3/TDlO00NgBdnK
	44/StPlakGD3EqACbnR5YtdO50CJP4US6uyTm9POMsAWLmMzp9RROOpBhNwDu4mwmcD0XNhgoWj
	c91kfDut
X-Received: by 2002:a17:90b:1d82:b0:354:c7f8:6d7b with SMTP id
 98e67ed59e1d1-358ae8d0700mr7036064a91.27.1771846482857; Mon, 23 Feb 2026
 03:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
 <20260130-yv5_revise_dts-v4-6-4d924455f3a7@gmail.com> <62b7557d7af89742d142c1c8d317b8fa14f7ba24.camel@codeconstruct.com.au>
In-Reply-To: <62b7557d7af89742d142c1c8d317b8fa14f7ba24.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:34:31 +0800
X-Gm-Features: AaiRm506Z318uNW6kWrp7bDcWB7y0VDBV6c7Bjo1a43ppRROQOdO1rn-vpstytM
Message-ID: <CABh9gBduHH5qN7Sv_Baoj=khADxEDv2zJFgXWBQi1K7SS6bRGQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] ARM: dts: aspeed: yosemite5: Add PDB IO expander
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>, Jackson Liu <Jackson.Liu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_033443_724308_D74001C2 
X-CRM114-Status: GOOD (  23.34  )
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

On Mon, Feb 9, 2026 at 2:27=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Fri, 2026-01-30 at 16:20 +0800, Kevin Tung wrote:
> > The new hardware design adds an IO expander on the PDB
> >
>
> What does "PDB" mean? Can you please expand this in the commit message?
>
> >  to support
> > fan presence detection and HSC
> >
>
> What does "HSC" mean? Can you please expand this in the commit message?
>
Hi Andrew,

Sure, I have expanded both abbreviations in the commit message as requested=
.

Kevin

> >  fault monitoring. So Add the PDB
> > IO expander device node to the DTS.
> >
> > The IO expander interrupt is connected to SGPIO92, which was
> > previously named ALERT_PADDLE2_SMB_N and not used by the system.
> > This pin is now repurposed and renamed to FM_IOE_ALT_N to reflect
> > its function as the PDB IO expander interrupt.
> >
> > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> > ---
> >  .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts    | 21 +++++++++++++=
+++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > index 524597a81365ef10cd03b67d35eeb88a965cbe0a..48f864b52d1a22b12f8a39b=
a9703a90349ed930d 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > @@ -389,6 +389,25 @@ adc@1d {
> >               ti,mode =3D /bits/ 8 <1>;
> >       };
> >
> > +     /* PDB IOEXP */
> > +     gpio-expander@24 {
> > +             compatible =3D "nxp,pca9555";
> > +             reg =3D <0x24>;
> > +             interrupt-parent =3D <&sgpiom0>;
> > +             interrupts =3D <92 IRQ_TYPE_LEVEL_LOW>;
> > +             gpio-controller;
> > +             #gpio-cells =3D <2>;
> > +             gpio-line-names =3D
> > +                     "FM_P52V_AUX_FLT_N", "FM_P12V_AUX_PWRGD",
> > +                     "FM_SLOTX_HSC_FAULT_N_FF", "",
> > +                     "","",
> > +                     "","",
> > +                     "PRSNT_FAN0","PRSNT_FAN1",
> > +                     "PRSNT_FAN2","PRSNT_FAN3",
> > +                     "","",
> > +                     "","";
> > +     };
> > +
> >       power-sensor@40 {
> >               compatible =3D "ti,ina238";
> >               reg =3D <0x40>;
> > @@ -937,7 +956,7 @@ &sgpiom0 {
> >       "ALERT_OC_PADDLE2_N","",
> >       "ALERT_OC_PWR2_N","",
> >       "ALERT_OC_PWR11_N","",
> > -     "ALERT_PADDLE2_SMB_N","",
> > +     "FM_IOE_ALT_N","",
> >       "ALERT_PWR14_SB2_LEAK_DETECT_N","",
> >       /*bit48-bit55*/
> >       "ALERT_PWR14_SB3_LEAK_DETECT_N","",

