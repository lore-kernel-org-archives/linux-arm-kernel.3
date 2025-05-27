Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807EAC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 00:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOcEbDk1qfiDcX5DWviKvVm3NUschFW/SlGs49rdunw=; b=lcPUc/EhFdlRE0fecHqMPenY3y
	Z0aow3wwyQkzskN3payXINnsNAJmGBRKa7TFEEgZ3v9AhYU1Zi9ze8tzAlWhqCQIibTgY1LdJFzQY
	VKpUUo7dZpHCVCMZ5RhwGdKcUlsgVUovyGZU038RWMHuGGsEzsg+97ZHa/y5uoxQzPt28icgadWGP
	noqF6l9LbMjjucY/dTQQtJTnVb43kQQmHQwX8BckKZssUKKz+2M+V3NP5Ky3z9xPCIpVPk1YU6rpz
	7vwejos26uoyF07ZSXOdGdJrF4ZNxZ2oQCepyy05ne51h6dA/0C7gUgpY0gn0yVyxb9e0TJ6udYwJ
	o/WIp26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJi1m-00000009fIK-2S3a;
	Tue, 27 May 2025 00:18:46 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJhzf-00000009fAB-0WbY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 00:16:36 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4e59012c7eeso17008137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 17:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748304994; x=1748909794; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOcEbDk1qfiDcX5DWviKvVm3NUschFW/SlGs49rdunw=;
        b=c5qhhag5iKpvxCYPTQVzH7CymkqIY2Eyh31alV0aPG5vZ5Y+z9h4pcbP+7IlO9l4Ja
         rVWC8izcTekBt24DuHsiQYlRF2SYybRkzF732oIY1GHvIIBgdMilneFw7fxIgxItQ3WD
         V1Fobi2Th0AC334B+lzTj8O6G2h6mFmmdGI5Q+qyOnY1JxLx7PPvuiv4o+mzO/NRR9dX
         XLSkFWnBP3bCqnwF7M28TQsWAtLSAQI3C37fS87vnVHSCWcTN7Qy869bzKaqYJrgHSkh
         qE9hQO2Jz1I/QgKn0GL0d+MxLDKfYu/8CMjy2CMhrFQ3WK7uTOwbcj/clZgWfoya3hwO
         tJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748304994; x=1748909794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOcEbDk1qfiDcX5DWviKvVm3NUschFW/SlGs49rdunw=;
        b=LdPTJWhKyWPTXXQdTmrlqEaE7K6NuRR85Xtj74gH2d/96RWBJL/cbMStUChxbzI52x
         Emzvo9juucH+pewMWmFTQ7FXqsaiqfdHGznOucb1jYKMH/fJBncLi7+Cpe9IxF0Y0V9Q
         xAVJ4hjD4dG6VPx6m1sKtkgZ0hHCKo5tnapVMWF1Nmo9pVRkmrP8UU2hY+rKyBnERfo2
         bwsftP3J2If+h3mRsGN6MNaodfrbCmTXqGPaayhBwMIihTXQ5NdOg36QoPtpguQSiOSR
         ahrIclwHeBaDlKKnj3LZYpitdhOmHMlnJILIJWNk0BtY1wzBMxysm0HLMAh2+dG/7xcQ
         iG+g==
X-Forwarded-Encrypted: i=1; AJvYcCU8lRNhaoOYsWcqmyIleH+NP2rzI3BO2Kis5mCBsj8BE66WG4OvDXy2LNkF7z96YBvDC6onlClzNIZbvCvOEOb0@lists.infradead.org
X-Gm-Message-State: AOJu0YzoZUeY3KUUv8H4Nc3syPLWCK2mWBhbisfqpSEsSr4ORVXzVvj/
	+XlKFCZqleS7hO/2XzU0GUG0Zf9oyUHxrJhpvl8pnXAzRtkz8O/O8DQZFM6TBhyPV+Gev21quBC
	rjPyi9P67QAIj8Rl0FvqJ9SmhL0C87wM=
X-Gm-Gg: ASbGncvXhXsJFl6yoWucIWYF7po1s0ixFgiM8Dohci6BBSiIK1niPce+vs8pOqCDWKo
	4xz9/zMUhdKtdXK50L2gJhoGlT3UOfe1vqHOJLMFEwn3N3H0dDUsAd/kwAQiHK6Jkcjp/J9//k6
	8+trpEtCEsUAuWc+/PREd1neZHydGCcp3DlQ==
X-Google-Smtp-Source: AGHT+IHSdJELAoc1OfbG1X3kZVb5ldqSTuSeYhI72dMXIJ0HLefmckoLWqzNnulr7EDgBDJ6rEKu7PIcDwC6U64zr2w=
X-Received: by 2002:a05:6102:cd1:b0:4e2:91ce:8cad with SMTP id
 ada2fe7eead31-4e4241911f0mr9215317137.24.1748304993817; Mon, 26 May 2025
 17:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com> <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
 <CADvTj4oqjCkMeK0p8ZBa8PQmctc77hpiFK2pqgBJaxRFDgQoDQ@mail.gmail.com>
 <d4109cc5-83d5-4acd-b0fb-39a50043060b@lunn.ch> <CADvTj4qdoD-mo7CxNW8VitZf+wXTiZ7m28R4JPQ9kQJGhUH7bA@mail.gmail.com>
 <d9d0881b-12cd-40af-bb22-d84236d2e04d@lunn.ch>
In-Reply-To: <d9d0881b-12cd-40af-bb22-d84236d2e04d@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 18:16:22 -0600
X-Gm-Features: AX0GCFsNBL9BmJB3bZajN52hoBf0v04Bs4dxVYW5eiTI4xBSNVhcu5-DVu6exkM
Message-ID: <CADvTj4qZz5q7x3_+OB8FiSnkEehzzjikVcCaqdcwHDYesMzpWw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_171635_171725_9FE50ED8 
X-CRM114-Status: GOOD (  53.21  )
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

On Mon, May 26, 2025 at 5:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 26, 2025 at 05:22:48PM -0600, James Hilliard wrote:
> > On Mon, May 26, 2025 at 4:38=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Mon, May 26, 2025 at 03:32:03PM -0600, James Hilliard wrote:
> > > > On Mon, May 26, 2025 at 1:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch=
> wrote:
> > > > >
> > > > > > +        phy-mode =3D "rgmii";
> > > > >
> > > > > Does the PCB have extra long clock lines?
> > > >
> > > > I'm not sure, it's a copackaged(maybe on-die is the wrong terminolo=
gy)
> > > > PHY I think so I assume the clock lines are internal, in the device=
 specific
> > > > dts we set something like this on the emac1 node:
> > > > allwinner,rx-delay-ps =3D <3100>;
> > > > allwinner,tx-delay-ps =3D <700>;
> > >
> > > Those values are just weird. The RGMII delay should be 2000ps. 3100 i=
s
> > > way too big, and 700 is way too small.
> >
> > I think these may not actually be required when using the internal
> > EPHY's now that I think about it again.
> >
> > > I think phy-mode =3D "internal" would be better, and just hard code t=
he
> > > delays either in the MAC or PHY driver.
> >
> > Hmm, would that make sense even though the MAC driver also
> > supports external PHY's?
>
> If an external PHY is being used, i would not expect a phy-mode of
> internal.

Ok, I guess this is a bit of a separate issue vs phy selection right?

> > > Thanks for the link to the old thread, which was 5 years
> > > ago. Hopefully since then, a bit more has been learnt. Quickly readin=
g
> > > through that thread, i don't think an MFD is not the correct solution=
.
> >
> > Well the current patches I've been playing around with for the AC200
> > phy are pretty similar to those patches still.
> >
> > Here's a branch that works on both AC200/AC300 but only if I do
> > the PHY initialization in u-boot:
> > https://github.com/jameshilliard/linux-h616/commits/acx00
>
> I personally don't like depending on the bootloader. I often replace
> the bootloader, because it is a crippled version that does not let me
> TFTP boot, does not have flash enabled for saving configuration, and i
> want to use barebox etc. I think it is much better when Linux drives
> the hardware, not the bootloader.

Yeah, I'm just using that for verifying the PHY selection logic at the
moment is functional and that Linux can handle the PHY's once in
an initialized state. The initialization sequence I'm using in u-boot
is pretty far from being suitable for upstream as well.

> > > In the last 5 years we have had to deal with more chicken/egg problem=
s
> > > with PHYs. It has now become pretty much standard practice to put the
> > > ID values in DT, to get the driver probed when the device does not
> > > respond on the bus.
> >
> > This is what I'm doing right? I mean I'm putting the phy ID in the
> > DT for both the AC200 and AC300. When doing the reset driver
> > for say the AC200 I would wire that up to only the AC200 phy
> > node and not the AC300 node(since the AC300 reset is MDIO
> > based while the AC200 is i2c based).
> >
> > > The DT node can then use phandles to the reset and
> > > clock controller to configure them as needed, the core will probably
> > > do that. I2C is a bit messier, you probably want a phandle pointing t=
o
> > > the i2c_adapter, so you can use i2c_transfer() on it in the probe()
> > > function.
> >
> > Without a MFD or some other node that exposes a reset I'm a bit
> > confused about what driver would actually issue the reset.
> >
> > Yeah, we need a phandle to the i2c_adapter, but since the resets
> > would be under the AC200 PHY node I assume there would need
> > to be some sort of intermediary driver implementing the i2c reset
> > right?
>
> You need an reset controller, yes, but is that an MFD? Or just a reset
> controller? Where does this reset controller live?

Well at least the AC200(the i2c one) appears to be a full MFD:
https://github.com/DeciHD/allwinner_docs/blob/main/mfd_xpowers/AC200_Datash=
eet_V1.1.pdf

The AC300 appears to only have EPHY related functionality:
https://github.com/DeciHD/allwinner_docs/blob/main/mfd_xpowers/AC300_User_M=
anual_V1.0.pdf

> Question like this show we are missing the big picture. What are all
> the different parts, how are they interconnected? Once we see that, we
> can give you better advice.

If you look at the block diagrams here it should hopefully give you
a better idea of how the AC200 and AC300 PHY's are connected
on the H616:
http://file.whycan.com/files/202304/V85x/Linux_EMAC_%e5%bc%80%e5%8f%91%e6%8=
c%87%e5%8d%97.pdf

