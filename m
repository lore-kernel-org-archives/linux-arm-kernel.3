Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC861CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 04:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXmX4652OyxNZpkLaFjf3pxd7mO626emV2iP/O0tuC4=; b=yq3C5fNpUSyrgK
	hG/PN8H3Yxdxq65jah3ZPRSenSbXWvXHpY0Q/3Rb+c7fpMxjQbWoMKQwRcvN74ajhnLt1C+Kf3TIq
	4pi22huYR0yQumx5MZEFtH2lcP0lg2lleLMODXOEhwb1iViD57AYue1Huz/jZbwmI4/vYogelEMbt
	8ZIgsVcFZzjWSD4CcRahM/hwB3B3PbKWo8p0S8043kvE1+WlncdW4STvNOBfkRc1YpNzGp+q1xx6l
	IC1MK9QAGDg9KOtREh1ND7gos7AZNMcXdqBpvwiNJnm3EHhpiABlFHaexYKmb1fLFnB3+SXbNGYFZ
	5GzxSvLW7L14bwhF5D8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwvJC-00000006xi0-0EKl;
	Fri, 12 Sep 2025 04:22:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwvJ9-00000006xhJ-0RYu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 04:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6262443FF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DF1C4CEFA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757650965;
	bh=Vv2YrcjBvxFvZZi58UBaLJNHyadz2sEpT9KVQerfpjQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=mTZi9oqPQCUG17+6d+Y0N/T40s6bdZXvcoppvr+58VDrpnyc5bKxHCYZR4ogxBiY9
	 j6opu1C0Ipp3RsrRZ949zRP969yzGQR560hkMDPPw8hjuPvjXZ3i6y8jShJqX/kVBP
	 k7eJdsps0TDdLQn0shhwv+KLvQv9PTb0vVKe7ErNeJ4qvk1r0i33ScXowCqET2ARxe
	 +LMN4HsCqgMCk63VnnRXsLp+I8Ta4ZVfe5S51cC9qfZx1wf2E9grIuAw4jivjXySax
	 Es1D8hKj+NI2chI6GhzIaUtevkFg2fExyyYZjV+Mpt4+F/BdNMXzdTNSQTyUsZkJiO
	 99AkHKnhVXJkA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f74c6d316so1622486e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 21:22:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3mRll2hV7vUKyLt7Tz3N9jyQ6C5WAapRWYVcdkJfrRfyx1hsFr9L48YxTNS3I9ghSLCFG4V4ur6wvwO7EYRRw@lists.infradead.org
X-Gm-Message-State: AOJu0YwG+xL5MqEGM68hKdIrsRpFhBz3VVDGwcq9KVEsbqsudKrYThMd
	Tr+sdlSgjZ0NfeKeJlLBEWyobGsZ3m5Bvx1rinRcUh1YatwrO5FIWVgZQOpYAyToxEjj3oHka/S
	XtBt9f3A7DBNAbeVMb/bvpM3/KFfqNys=
X-Google-Smtp-Source: AGHT+IHbHGyZZve3/p2hQZn8nRc22BGYEXQJpdLfsbDiglhu6zahB25whpo6UiHtPzKB79uDzR6h/pwt7mPQi7mAzl0=
X-Received: by 2002:a2e:ae18:0:10b0:337:f025:512 with SMTP id
 38308e7fff4ca-35139e509c9mr2890861fa.16.1757650963840; Thu, 11 Sep 2025
 21:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250908181059.1785605-1-wens@kernel.org> <20250908181059.1785605-3-wens@kernel.org>
 <aMMQSR7yYBQkY4CI@shell.armlinux.org.uk> <CAGb2v64n_eMBiUaT1S=V6v4Bqv5hLP8vP3=20sp4w4Fxh7RcOQ@mail.gmail.com>
 <DU0P190MB244515E7CE0741A1E47E0543BC08A@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
In-Reply-To: <DU0P190MB244515E7CE0741A1E47E0543BC08A@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 12 Sep 2025 12:22:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v64JvE=9PvaLYi50uK_dNsP6Sdw34H+d0-vCs2GSSoiocQ@mail.gmail.com>
X-Gm-Features: Ac12FXzFUjZYvnptlxG7S8Tq_6X0mBNQa2E6WmUp7iQd5dFFSAZgzFUYRyKwirM
Message-ID: <CAGb2v64JvE=9PvaLYi50uK_dNsP6Sdw34H+d0-vCs2GSSoiocQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 02/10] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: Muhammed Subair <msubair@hotmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_212247_189728_5B8DDEF0 
X-CRM114-Status: GOOD (  23.67  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 12, 2025 at 12:09=E2=80=AFPM Muhammed Subair <msubair@hotmail.c=
om> wrote:
>
> Hi
>
> There are A527 boards with 25 Mhz clock from PH13 ( rgmii-0) and PJ10 (rg=
mii-1). See the attached .
> I believe that a patch is required to support this. Not sure it can be a =
global or board specific.

This is board specific. If you have such a board you can send a patch
on top of this series for it.

ChenYu

> Subair
>
> -----Original Message-----
> From: Chen-Yu Tsai <wens@kernel.org>
> Sent: Thursday, 11 September 2025 10:18 PM
> To: Russell King (Oracle) <linux@armlinux.org.uk>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller <davem@davemloft=
.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>=
; Paolo Abeni <pabeni@redhat.com>; Rob Herring <robh@kernel.org>; Krzysztof=
 Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jernej=
 Skrabec <jernej@kernel.org>; Samuel Holland <samuel@sholland.org>; netdev@=
vger.kernel.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infrade=
ad.org; linux-sunxi@lists.linux.dev; linux-kernel@vger.kernel.org; Andre Pr=
zywara <andre.przywara@arm.com>
> Subject: Re: [PATCH net-next v4 02/10] net: stmmac: Add support for Allwi=
nner A523 GMAC200
>
> On Fri, Sep 12, 2025 at 2:09=E2=80=AFAM Russell King (Oracle) <linux@arml=
inux.org.uk> wrote:
> >
> > Hi,
> >
> > I drafted this but never sent it and can't remember why, but it's
> > relevant for v5 that you recently posted. Same concern with v5.
> >
> > On Tue, Sep 09, 2025 at 02:10:51AM +0800, Chen-Yu Tsai wrote:
> > > +     switch (plat->mac_interface) {
> > > +     case PHY_INTERFACE_MODE_MII:
> > > +             /* default */
> > > +             break;
> > > +     case PHY_INTERFACE_MODE_RGMII:
> > > +     case PHY_INTERFACE_MODE_RGMII_ID:
> > > +     case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +     case PHY_INTERFACE_MODE_RGMII_TXID:
> > > +             reg |=3D SYSCON_EPIT | SYSCON_ETCS_INT_GMII;
> > > +             break;
> > > +     case PHY_INTERFACE_MODE_RMII:
> > > +             reg |=3D SYSCON_RMII_EN;
> > > +             break;
> > > +     default:
> > > +             return dev_err_probe(dev, -EINVAL, "Unsupported interfa=
ce mode: %s",
> > > +                                  phy_modes(plat->mac_interface));
> >
> > I'm guessing that there's no way that plat->phy_interface !=3D
> > plat->mac_interface on this platform? If so, please use phy_interface
> > plat->here.
>
> Makes sense. Looking at stmmac_platform.c, for us mac_interface only come=
s from phy_interface.
>
> I'll wait a day before sending yet another version.
>
> ChenYu
>

