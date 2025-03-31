Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C4CC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8d4g9wEquUrOEcli/D/aANZ3jmocVZYpI2mvNFSYRA=; b=HOovlgGMasczB+SSB00fKCWVsa
	q7j2xXzZ+5d693U+CSKGTjJX10zZPGzjxHBPyv1DiHgfizujj6iT2JA1HBMsrXKf7Sr4E6q88dLxC
	nAWoS0sBrPZ6lzLzVf6BQliv3dbB1cpiyv5MTn4FXXZbav+Nez2bnn3Fvv6QztmLVeziqx01PmHYE
	NwQ9ApI+HrRvig66P1Q3fyP6+CprSHyPMRl7+fCB6LbBXOvKYvs9v23tW95Z0XxtbrXN8f0UXUAGP
	KbHUThLvAH32X2XMtNcTzucqmGdPt3jkNnk1iHMSuniUBwxUL8m3fe0jQm2SohjtAui/0jhER8iIL
	5bnqNtcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIC4-000000010In-1wN4;
	Mon, 31 Mar 2025 16:41:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIAL-0000000100l-0bu2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 16:39:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43948021a45so47391185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743439151; x=1744043951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8d4g9wEquUrOEcli/D/aANZ3jmocVZYpI2mvNFSYRA=;
        b=HtrBuCyDl9U8+DhFPtIcewN6VHxfNxDviaBBeHePm+l8lfwugv/Obo1KB6CS8Oq8ER
         /KpLu6kxIZigwSW4E8TcTLj2mV/r1rM71M6P9h6Sf47qLkKU4x9qeyphR0J8fkSXzFre
         +DbIBp2+Ij375Ik94T2uvtSOvZypDohNYxDzStTorIRGZ4iAC1H2no3qz12ba/aRHo9E
         xBaaksWi9YsZMkHRjCLmqXQbFERtje1VxAyxGhktt8ZadWzCMrr5YpOe99tCnhpGcAZW
         5LbEN7SUkxrm9nIgUW+bXcY5JcMtCVMuKvWhtWv+bJwcPRF+xF2A36ZzqFhMdkZ4Mj7g
         VLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439151; x=1744043951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8d4g9wEquUrOEcli/D/aANZ3jmocVZYpI2mvNFSYRA=;
        b=IRNQsKxo7FaLQxCfz4F4cYAFCqK4ROS92vevFUNzQy47UJyMZaY9eU91POu7HC6nVC
         CdrnZRdiAzNnbxQxCB6ZOvHK8NaRJcg8SMb2MOQrcZCsUvnTVfujnYtOV2Z8Dc0K3TtU
         0mDGA1MxLKX7Vrl/2qfgabMeYtV6W1ynHzYwmmjm7vYJGGMZASm9nCIoopBaNaif7Vp9
         nU+vaksGnTUhPStJxErW0213gEZisnz2Ge7rguflSRoJLIHSO9TGhqjuSd7otl+loPOz
         fRPHi3rsHKKmwBBP2G5XnNos/OT0BhHt7GILIfukJQP6Q2PI8SXGpbEuESUyB2vW0Zv+
         5nAg==
X-Forwarded-Encrypted: i=1; AJvYcCWT8Ih3KAFatAkoKt0/wdVFskET9rruVzgCCWRKUVMxrDHTAhoZteQZqFRaXSWHx5KSxbs5Y+ZmlffUXAYqI5VC@lists.infradead.org
X-Gm-Message-State: AOJu0YyyOzHtp6k5tFlWjdydU5GG3Sb964My7L6lVeoGrz5lznSwc5Vn
	6ANtsIY4SIubUv1v6Ik8iKCoE+EzSucOVT5DP3eI99IqSHQu8Acdlsqp1VBAVieXkIa98dQa3A2
	61LJSzlfQ2qf1y8az7qMT0VKeb3c=
X-Gm-Gg: ASbGncuhcJrv0d8/hkG0Nrr93/zYQTy7/0GxtqLujTForDnMcJJtVLK+N+uBjvXfOp/
	OXlQwGcWG1nlCriBoaSDwwxP5+1djHDvM2SaD0zKhgKE74w7DwiVzfYQigYhXQ2+6BH2cCAxND9
	gXdl0Szfjcrgnrm+cRoHh5VGKu306cu/62+iOx2NaP/OkYOGsQTaF0ursIeS8=
X-Google-Smtp-Source: AGHT+IHZzXLpgViYZ4N1izMamI668R2BU8hGvXjTj9xo36k3cDMT/lFyo33eVfGT780WUYBHXlsgJZJWvr5rEwj0YiM=
X-Received: by 2002:a05:600c:5489:b0:43c:fda5:41e9 with SMTP id
 5b1f17b1804b1-43dbc419540mr92229645e9.31.1743439150876; Mon, 31 Mar 2025
 09:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
 <20250307173611.129125-10-maxime.chevallier@bootlin.com> <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
 <20250328090621.2d0b3665@fedora-2.home> <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
 <12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch> <CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
 <02c401a4-d255-4f1b-beaf-51a43cc087c5@lunn.ch> <Z-qsnN4umaz0QrG0@shell.armlinux.org.uk>
 <20250331182000.0d94902a@fedora.home>
In-Reply-To: <20250331182000.0d94902a@fedora.home>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 31 Mar 2025 09:38:34 -0700
X-Gm-Features: AQ5f1Jo4H2kJVBl3bUTBM3aQvZN8Nc6GirQhFLcIGY7KsXCNVmJ2NznhupG4LQQ
Message-ID: <CAKgT0UdJHkGRh5S4hHg0V=Abd7UizH49F+V2QJJQxguHvCYhMg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, 
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	=?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, 
	Romain Gantois <romain.gantois@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_093913_192959_712A954F 
X-CRM114-Status: GOOD (  58.79  )
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

On Mon, Mar 31, 2025 at 9:20=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> On Mon, 31 Mar 2025 15:54:20 +0100
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
>
> > On Mon, Mar 31, 2025 at 04:17:02PM +0200, Andrew Lunn wrote:
> > > On Fri, Mar 28, 2025 at 04:26:04PM -0700, Alexander Duyck wrote:
> > > > A serdes PHY is part of it, but not a traditional twisted pair PHY =
as
> > > > we are talking about 25R, 50R(50GAUI & LAUI), and 100P interfaces. =
I
> > > > agree it is a different beast, but are we saying that the fixed-lin=
k
> > > > is supposed to be a twisted pair PHY only?
> > >
> > > With phylink, the PCS enumerates its capabilities, the PHY enumerates
> > > its capabilities, and the MAC enumerates it capabilities. phylink the=
n
> > > finds the subset which all support.
> > >
> > > As i said, historically, fixed_link was used in place of a PHY, since
> > > it emulated a PHY. phylinks implementation of fixed_link is however
> > > different. Can it be used in place of both a PCS and a PHY? I don't
> > > know.
> >
> > In fixed-link mode, phylink will use a PCS if the MAC driver says there
> > is one, but it will not look for a PHY.

Admittedly the documentation does reference much lower speeds as being
the use case. I was a bit of an eager beaver and started assembling
things without really reading the directions. I just kind of assumed
what I could or couldn't get away with within the interface.

> > > You are pushing the envelope here, and maybe we need to take a step
> > > back and consider what is a fixed link, how does it fit into the MAC,
> > > PCS, PHY model of enumeration? Maybe fixed link should only represent
> > > the PHY and we need a second sort of fixed_link object to represent
> > > the PCS? I don't know?
> >
> > As I previously wrote today in response to an earlier email, the
> > link modes that phylink used were the first-match from the old
> > settings[] array in phylib which is now gone. This would only ever
> > return _one_ link mode, which invariably was a baseT link mode for
> > the slower speeds.
> >
> > Maxime's first approach at adapting this to his new system was to
> > set every single link mode that corresponded with the speed. I
> > objected to that, because it quickly gets rediculous when we end
> > up with lots of link modes being indicated for e.g. 10, 100M, 1G
> > but the emulated PHY for these speeds only indicates baseT. That's
> > just back-compatibility but... in principle changing the link modes
> > that are reported to userspace for a fixed link is something we
> > should not be doing - we don't know if userspace tooling has come
> > to rely on that.
> >
> > Yes, it's a bit weird to be reporting 1000baseT for a 1000BASE-X
> > interface mode, but that's what we've always done in the past and
> > phylink was coded to maintain that (following the principle that
> > we shouldn't do gratuitous changes to the information exposed to
> > userspace.)
> >
> > Maxime's replacement approach is to just expose baseT, which
> > means that for the speeds which do not have a baseT mode, we go
> > from supporting it but with a weird link mode (mostly baseCR*)
> > based on first-match in the settings[] table, to not supporting the
> > speed.
>
> I very wrongfully considered that there was no >10G fixed-link users, I
> plan to fix that with something like the proposed patch in the
> discussion, that reports all linkmodes for speeds above 10G (looks less
> like a randomly selected mode, you can kind-of see what's going on as
> you get all the linkmodes) but is a change in what we expose to
> userspace.

I am not sure if there are any >10G users. I haven't landed anything
in the kernel yet and like I said what I was doing was more of a hack
to enable backwards compatibility on older kernels w/ the correct
supported and advertised modes. If I have to patch one kernel to make
it work for me that would be manageable.

One thing I was thinking about that it looks like this code might
prevent would be reinterpreting the meaning of duplex. Currently we
only have 3 values for it 0 (half), 1 (Full), and ~0 (Unknown). One
thought I had is that once we are over 1G we don't really care about
that anymore as everything is Full duplex and instead care about
lanes. As it turns out the duplex values currently used would work
well to be extended out to lanes. Essentially 0 would still be half, 1
would be 1 lane full duplex, 2-8 could be the number of full duplex
lanes the interface is using, and unknown lane count would still be ~0
since it is unlikely we will end up with anything other than a power
of 2 number of lanes anyway. With that you could greatly sort out a
number of modes in your setup. We would then have to do some cleanups
here and there to do something like "duplex =3D=3D DUPLEX_UNKNOWN ? duplex
: !!duplex" to clean up any cases where the legacy values are
expected.

Likewise if you were to look at adding the port type that might allow
for further division and cleanup. With that someone could specify the
speed, duplex, and port type and they would be able to pretty
precisely pick out a specific fixed mode.

> Or maybe simpler, I could extend the list of compat fixed-link linkmodes
> to all speeds with the previous arbitrary values that Russell listed in
> the other mail (that way, no user-visible changes :) )
>
> I was hoping Alexander could give option 1 a try, but let me know if
> you think we should instead adopt option 2, which is probably the safer
> on.

I can try to get to it, but I have a number of meetings today so I may
not be able to get to it until tomorrow morning.

Also I suspect this may have an impact outside of just the fixed link
setup. I will have to try some other spots to see if I see anything
odd pop up as I suspect that I will have issues with 50R2/50R running
over top of each other after these changes.

Thanks,

- Alex

