Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ABCC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 22:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+hSR1+tIbx5yMHcV2MZCy95L6aErMxELApRXynVAjg=; b=n3NqYc5tE+pcIM+TVtkfNWlzc0
	hakodfSqNPqrGPNrwglD5G2q1biPtlxnlwzHZXB2hNTWfiaeL+h8xcxjoeCVwTx8Tztg1nSycdV+w
	asm12v3aWJn0cz387Akk+9Zz3M7+Evv0Pn02F8idgZSalIG2t9cptyoW/Juo2uwWIjUyocF7GmveS
	nJYw1D0YK9qggM7X0eql55Rqh1rbdT4nuNihSHKP6exMIJqGn9+g+8DGA0RBP/k5vm/ND34xAnMhW
	UB73/ioidaAm7DuozjVwHgV70hHjdZ9sMwBz4Sqf1i1iBLJYgYPNtDRHLYsAq/fHK4HO6g2zjnYml
	ecDKchMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzNVu-00000001Upw-2iOg;
	Mon, 31 Mar 2025 22:21:50 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzNU8-00000001Ui0-3NOs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 22:20:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39ac56756f6so4209902f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743459599; x=1744064399; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+hSR1+tIbx5yMHcV2MZCy95L6aErMxELApRXynVAjg=;
        b=LLFRHdtaJiVe+89dnAjfYReSRtiegVHfRYDw80qiNYLjZUBUKj2OTa+0ckgv0/l/3l
         jKc3JoUpbGbqU/wk/PT/S8Dofk8wAKBkzQD/Fh40HyfcKqAnWC+N9L+G+Y/b5MLMfggC
         l5diJHSijCCZEypIb22YMHowmPdlz0ksFZX07BiOs5USt9OfJpXCGB01tmO7hkvj5tSl
         GEeeyxtpMYzCxmUxH2xxWd/CWxsosR/I/UxE2pbKhn85kmnXA8ioIs/MmOl4vCZoSF/R
         MF5RBXxBu07yJDkXbynbmmFoDAH4OcZ+qlK1CE98EoatZV0vk3WWpfbP2GVP+j2qrbTY
         suVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743459599; x=1744064399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+hSR1+tIbx5yMHcV2MZCy95L6aErMxELApRXynVAjg=;
        b=ug22xlbKbuMcFsYLptGMqFtkHFadWUzSW2K2g6ENTNBd8bZ+oikKIJJKf6OQibyo3i
         Tb/7hDlHu7D6gJp2nr6FM5NBBgRaXp7TzuXmEpeasxR29g/3MtSQubvTTflAt5p6IvRN
         UKINUvdGu0SYySlfjSN10q7hx7X1qT80KecfK/zQFIZ8+rFN+7d+TZrKQSraR/jc+6k4
         UgX+doRwZfrS3VqhnbEM8lByQTD+JUssGIp1Yn1VV2Rwwppxz6X1EfeepvOTPvRLl9Qq
         nfFO9n1/a3zfsYBE/hVFp2sP9AHPbDUmwkjSsOxtiUU4w5E9WmPubA0aSvLfCz5kUMpL
         Utbw==
X-Forwarded-Encrypted: i=1; AJvYcCUcXuvE9DeeDMu/Tu/mx1iGH4ny8OX0TTfwGVMBgmEi1okLlIUrWYUPc84p5EOGAFSzFIvMfiImo7V3P/GNC1c2@lists.infradead.org
X-Gm-Message-State: AOJu0YxX//MuHB5JraA4khaVbG48vW7Z8/53ywsr4zVqEUmNV6FlMgW8
	YHtT/A3VF8mXbuGm3C3oNI8mROChVtNm7n2urx/f6JSYtRuSTwk3sZPMeoNggOZSl96U7nOTzqz
	UbKQSzfMkHjF8k2gVdHoX0kTYmTo=
X-Gm-Gg: ASbGnctDeBHW/XaKOnZC2+oDP0J1X/JfeNuCb/FVQBEvKXxO6W5m1MQBIO+eUMcF2V0
	GpYS1jLc9ul+kvixL1PwdH1NzJcT3D15/MLYEiB+C7PVQ2Q1jcEQmEiMfXJLLWTYXlWf0Eh4EZp
	TE9bO4mptAcpGuma+u/vbYq+hwnRDD9CX7StnUL5Mhb/+u/T/2cg74MjEMwPw=
X-Google-Smtp-Source: AGHT+IFgSysh56KurewSd3Nk/bNUGW3qwrcRPIQP/JUmaMtg6PyNAGFcsjnPPM0EApLH1ebhQAo8saKc84XBpk9ytY0=
X-Received: by 2002:a05:6000:2405:b0:39c:140b:feec with SMTP id
 ffacd0b85a97d-39c140bff36mr6815630f8f.7.1743459598932; Mon, 31 Mar 2025
 15:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
 <20250307173611.129125-10-maxime.chevallier@bootlin.com> <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
 <Z-qPs7y8C09xh5_b@shell.armlinux.org.uk>
In-Reply-To: <Z-qPs7y8C09xh5_b@shell.armlinux.org.uk>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 31 Mar 2025 15:19:22 -0700
X-Gm-Features: AQ5f1JoSBA9-etYU7M7NADKlb-o6h_I8MawO0ZvLruH8CUNhEKhc15qJBi4pe_E
Message-ID: <CAKgT0Ud1ZRBiaDGzHmgWWNjZgGHTbcGUNFzftD3e0ndy2E9nyw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net, 
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	=?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, 
	Romain Gantois <romain.gantois@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_152000_850865_14D56354 
X-CRM114-Status: GOOD (  39.95  )
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

On Mon, Mar 31, 2025 at 5:51=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Mar 27, 2025 at 06:16:00PM -0700, Alexander H Duyck wrote:
> > On Fri, 2025-03-07 at 18:36 +0100, Maxime Chevallier wrote:
> > > When phylink creates a fixed-link configuration, it finds a matching
> > > linkmode to set as the advertised, lp_advertising and supported modes
> > > based on the speed and duplex of the fixed link.
> > >
> > > Use the newly introduced phy_caps_lookup to get these modes instead o=
f
> > > phy_lookup_settings(). This has the side effect that the matched
> > > settings and configured linkmodes may now contain several linkmodes (=
the
> > > intersection of supported linkmodes from the phylink settings and the
> > > linkmodes that match speed/duplex) instead of the one from
> > > phy_lookup_settings().
> > >
> > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > ---
> > >  drivers/net/phy/phylink.c | 44 +++++++++++++++++++++++++++----------=
--
> > >  1 file changed, 31 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > > index cf9f019382ad..8e2b7d647a92 100644
> > > --- a/drivers/net/phy/phylink.c
> > > +++ b/drivers/net/phy/phylink.c
> > > @@ -802,12 +802,26 @@ static int phylink_validate(struct phylink *pl,=
 unsigned long *supported,
> > >     return phylink_validate_mac_and_pcs(pl, supported, state);
> > >  }
> > >
> > > +static void phylink_fill_fixedlink_supported(unsigned long *supporte=
d)
> > > +{
> > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, supported);
> > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, supported);
> > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, supported);
> > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, supported);
> > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, supported)=
;
> > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, supported)=
;
> > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported)=
;
> > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, supported)=
;
> > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, supported=
);
> > > +}
> > > +
> >
> > Any chance we can go with a different route here than just locking
> > fixed mode to being only for BaseT configurations?
> >
> > I am currently working on getting the fbnic driver up and running and I
> > am using fixed-link mode as a crutch until I can finish up enabling
> > QSFP module support for phylink and this just knocked out the supported
> > link modes as I was using 25CR, 50CR, 50CR2, and 100CR2.
> >
> > Seems like this should really be something handled by some sort of
> > validation function rather than just forcing all devices using fixed
> > link to assume that they are BaseT. I know in our direct attached
> > copper case we aren't running autoneg so that plan was to use fixed
> > link until we can add more flexibility by getting QSFP support going.
>
> Please look back at phylink's historical behaviour. Phylink used to
> use phy_lookup_setting() to locate the linkmode for the speed and
> duplex. That is the behaviour that we should be aiming to preserve.
>
> We were getting:
>
> speed   duplex  linkmode
> 10M     Half    10baseT_Half
> 10M     Full    10baseT_Full
> 100M    Half    100baseT_Half
> 100M    Full    100baseT_Full
> 1G      Half    1000baseT_Half
> 1G      Full    1000baseT_Full (this changed over time)
> 2.5G    Full    2500baseT_Full
> 5G      Full    5000baseT_Full
>
> At this point, things get weird because of the way linkmodes were
> added, as we return the _first_ match. Before commit 3c6b59d6f07c
> ("net: phy: Add more link modes to the settings table"):
>
> 10G     Full    10000baseKR_Full
> Faster speeds not supported
>
> After the commit:
> 10G     Full    10000baseCR_Full
> 20G     Full    20000baseKR2_Full
> 25G     Full    25000baseCR_Full
> 40G     Full    40000baseCR4_Full
> 50G     Full    50000baseCR2_Full
> 56G     Full    56000baseCR4_Full
> 100G    Full    100000baseCR4_Full
>
> It's all a bit random. :(

I agree. I was using pcs_validate to overcome some of that by limiting
myself to *mostly* one link type at each speed. The only spot that got
a bit iffy was the 50G as I support 50GAUI and LAUI-2. I was
overcoming that by tracking the number of lanes expected and filtering
for one or the other.

One thought I had proposed in another email was to look at adding more
data to the fields. In the case of duplex we could overload it to also
be the number of lanes as they represent full duplex lanes anyway.
With that you could sort out some of the CR vs CR2 noise.

In addition I wonder if we shouldn't also look at including port type
in the data. Using that you could essentially go through the
post-validated supported values and OR in the types that belong to the
various link modes for TP, FIBER, DA, ect. That would sort out some of
the KR vs CR vs SR vs LR noise.

