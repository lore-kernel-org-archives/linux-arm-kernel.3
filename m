Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE06C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 00:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=344ZXOydtru+LtTP4kRXS0HZ8/NsKlEl+mhmACEHqDs=; b=H3lyEEChesi3HC1tsrxwE4P1vU
	DhedOc0TbCz98tpM6Qo8JhZuhyFWF67r0c3rQP3L7UdY6J/H1A6frMtXzQ/91B+6c9X+rdDf3tlEA
	uw00VkfNIM7Qi0bc7ck5FaGfdh+MtpbLBYJGEa+giDiagUSvOYF100GR8tD+Drb7utgM9kXvGNHW6
	ExofB3OpCrLUAYqlAbkjIYMwCtAbHBlfScf4sTNwtimjN6jQq3PtdZqyYM2dxjQEg73OAiC7INb7v
	5id7ofQiIxyX0WYW5ZrNseAHFBCBkxriRsB8Nmayj5acByABMA9hMJR7m17E9+8sMY8Dzu9CK2NTQ
	MhffwyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLARk-00000002o6s-3Ya8;
	Sat, 31 May 2025 00:51:36 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLAPa-00000002nOQ-4ApG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 00:49:24 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-52eec011ff2so872599e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 17:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748652561; x=1749257361; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=344ZXOydtru+LtTP4kRXS0HZ8/NsKlEl+mhmACEHqDs=;
        b=gxOPfYr5iaWpW68laYmiJu84/E0FGzQCi7lsyUct8ojdR7+nDN4trb/eUaHcPN/Nzo
         N1NOmFjEsKx9VknyF2M/4xu5/M3mhv7SnRF47dPO4jV3phwUgJdmfPup7qQHgzetdvI7
         vh/H6divwIqww+AMrO2rRpXgbmEwsflAe4t+lbBFHhds8kmpZpEtp/zTnWvc7j2PCXoL
         oAxgrdqaN4xFP8dV7ScDzwkQlc/C7t0yaHvH5SojF6Y/yedR9UId4aaUQOTG9K40yI16
         VKkMWM5GLvMDX29PfQWM6zAD1Fw0yPvooBwBlGUofDUsXnTo56J54oQiupkVifl9NYN/
         lz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748652561; x=1749257361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=344ZXOydtru+LtTP4kRXS0HZ8/NsKlEl+mhmACEHqDs=;
        b=ljMp+T5o/0nWhkprTGdIuQ4kPlXT6XWsvapTIvvWDePqiHmPa0PSDaKYSB84b5BW1m
         gpqqpWUTPIW39F3KoMBddysHVZ8BtDqJvQLN+VliJrbMWsYToRyB6q1o24TWMdguHSor
         Pd1yNVsW21dpGQX86Dfz/8MYXPgIIlOlTMUN+DF9jZZSW95FrDpfHJQxqelkEuEkuRrR
         yQQs6w6GQp/y/JUph8d8wI2u7SYpx29pQpq3QTSZor6RuSyR2gqmDICVOKgKIIVILABg
         VU8/Po0k6y5TcKHhObLjFGmGDP7YaWldntR+bkwWvgqDSl6OOKCDVDBDKiWK0UVSRl2T
         rQPw==
X-Forwarded-Encrypted: i=1; AJvYcCV8vlrNMoTVqCejEWAZvxNlI2yuxpAlyTBYoUWeBTeFjrvpqINXBPTV1Ga06a+XpmGixBWoGw+Rg+1ojl+JEP8y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/m3F3Iss+G9Wh5vRnOBFH/EfCpfIQkHkDLIP5vHPMldlfUK+G
	N38/43mejmZTgNBMITRtvNixlD5uzsjgAfMj3PdNTPWO4v2pRDuWw1RmD0BWD/lJsgbVrL7Jwvx
	25YhGKp4JyFxG+9Ll0rZBRzFM/msp9RI=
X-Gm-Gg: ASbGnctUMU5JDgPGS7ViE+A/WXyh6O9RaccwikI1p3LpCQkbKC0PVy8dc6zRhy+Yb5G
	hg6I3feAsEVgaQH7zIrKuaVD9Klwy8sDrzsDLDLOP17a90Bb51OidSiV87bGhL6w8CIDb+Cdl0q
	htnGlWQAJhDEW0m7xTDUXTGpLKJoBiWkQg3vsYxQ8KuWWE
X-Google-Smtp-Source: AGHT+IGXJmVpo36K5gmhxZOj9Z0RnB1rGuSi9/anoCRMQ6XHT10/qBZWClCon53dYhxQ1OUjw4aaz69nJ9Y0sSEFAok=
X-Received: by 2002:a05:6102:d8a:b0:4e6:245b:cf5e with SMTP id
 ada2fe7eead31-4e6ece4b027mr3457384137.17.1748652561434; Fri, 30 May 2025
 17:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
 <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com> <CADvTj4oSbYLy3-w7m19DP-p0vwaJ8swNhoOFjOQiPFA24JKfMQ@mail.gmail.com>
 <f5461b58-79ad-40b0-becd-3af61658bf61@gmail.com>
In-Reply-To: <f5461b58-79ad-40b0-becd-3af61658bf61@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 May 2025 18:49:09 -0600
X-Gm-Features: AX0GCFupWsNFi2CuUY75nrFXpih2klRDW7O5Fm08l0tn6Tcu2AX3UTC3nexx8v4
Message-ID: <CADvTj4pZrOo8O=kH_RzoTNMG3vHEzwy8KsgP9eWSic46o9cAdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_174923_046128_989F6234 
X-CRM114-Status: GOOD (  55.82  )
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

On Fri, May 30, 2025 at 6:24=E2=80=AFPM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
>
> On 5/30/25 17:02, James Hilliard wrote:
> > On Fri, May 30, 2025 at 5:56=E2=80=AFPM Florian Fainelli <f.fainelli@gm=
ail.com> wrote:
> >>
> >> On 5/30/25 16:46, James Hilliard wrote:
> >>> On Tue, May 27, 2025 at 2:02=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> =
wrote:
> >>>>
> >>>> On Tue, May 27, 2025 at 01:21:21PM -0600, James Hilliard wrote:
> >>>>> On Tue, May 27, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch=
> wrote:
> >>>>>>
> >>>>>> On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> >>>>>>> Some devices like the Allwinner H616 need the ability to select a=
 phy
> >>>>>>> in cases where multiple PHY's may be present in a device tree due=
 to
> >>>>>>> needing the ability to support multiple SoC variants with runtime
> >>>>>>> PHY selection.
> >>>>>>
> >>>>>> I'm not convinced about this yet. As far as i see, it is different
> >>>>>> variants of the H616. They should have different compatibles, sinc=
e
> >>>>>> they are not actually compatible, and you should have different DT
> >>>>>> descriptions. So you don't need runtime PHY selection.
> >>>>>
> >>>>> Different compatibles for what specifically? I mean the PHY compati=
bles
> >>>>> are just the generic "ethernet-phy-ieee802.3-c22" compatibles.
> >>>>
> >>>> You at least have a different MTD devices, exporting different
> >>>> clocks/PWM/Reset controllers. That should have different compatibles=
,
> >>>> since they are not compatible. You then need phandles to these
> >>>> different clocks/PWM/Reset controllers, and for one of the PHYs you
> >>>> need a phandle to the I2C bus, so the PHY driver can do the
> >>>> initialisation. So i think in the end you know what PHY you have on
> >>>> the board, so there is no need to do runtime detection.
> >>>
> >>> Hmm, thinking about this again, maybe it makes sense to just
> >>> do the runtime detection in the MFD driver entirely, as it turns
> >>> out the AC300 initialization sequence is largely a subset of the
> >>> AC200 initialization sequence(AC300 would just not need any
> >>> i2c part of the initialization sequence). So if we use the same
> >>> MFD driver which internally does autodetection then we can
> >>> avoid the need for selecting separate PHY's entirely. This at
> >>> least is largely how the vendor BSP driver works at the moment.
> >>>
> >>> Would this approach make sense?
> >>
> >> This has likely been discussed, but cannot you move the guts of patch =
#2
> >> into u-boot or the boot loader being used and have it patch the PHY
> >> Device Tree node's "reg" property accordingly before handing out the D=
TB
> >> to the kernel?
> >
> > No, that's not really the issue, the "reg" property can actually be
> > the same for both the AC200 and AC300 phy's, both support using
> > address 0, the AC200 additionally supports address 1. In my example
> > they are different simply so that they don't conflict in the device tre=
e.
> >
> > The actual issue is that they have differing initialization sequences a=
nd
> > won't appear in mdio bus scans until after the initialization is comple=
te.
>  > >> Another way to address what you want to do is to remove the "reg"
> >> property from the Ethernet PHY node and just let of_mdiobus_register()
> >> automatically scan, you have the advantage of having the addresses
> >> consecutive so this won't dramatically increase the boot time... I do
> >> that on the boards I suppose that have a removable mezzanine card that
> >> includes a PHY address whose address is dictated by straps so we don't
> >> want to guess, we let the kernel auto detect instead.
> >
> > Yeah, I noticed this, but it doesn't really help since it's not the add=
ress
> > that's incompatible but the reset sequence, I'm having trouble finding
> > examples for mdio based reset drivers in the kernel however.
>
> Fair enough, but it seems like we need to dig up a bit more here on that
> topic. There is an opportunity for a MDIO driver to implement a
> "pre-scan" reset by filling in a mdio_bus::reset callback and there you
> can do various things to ensure that your Ethernet PHY will be
> responsive. You can see an example under
> drivers/net/mdio/mdio-bcm-unimac.c to address a deficiency of certain
> Ethernet PHYs.

So if I need to do custom stuff to make the generic PHY's addresses
on the mdio bus live would I replace the generic "snps,dwmac-mdio"
compatible with a custom compatible maybe?

> Through Device Tree you can use the standard properties "reset-gpios",
> "reset-assert-us", "reset-deassert-us" to implement a basic reset
> sequence on a per-PHY basis, there are other properties that apply to
> the MDIO bus/controller specifically that are also documented.

The mdio initialization sequence for both PHY's is custom from my
understanding so presumably we can't use the generic "reset-gpios"
and such.

> How does it currently work given that your example Device Tree uses:
>
> compatible =3D "ethernet-phy-ieee802.3-c22"
>
> this will still require the OF MDIO bus layer to read the
> PHYSID1/PHYSID2 registers in order to match your PHY device with its
> driver. You indicated that the PHYs "won't appear in mdio bus scan"
> unless that sequence is implemented. How would they currently respond
> given the example?

In my example it's not actually doing the initialization part yet, that's
all being done in some super hacky u-boot code. My assumption was
that we need different generic phy nodes to differentiate the resets
but I suppose that could all be done elsewhere in whichever driver
implements the initialization sequence.

> If you can involve the boot loader, you can create a compatible string
> for your PHY of the form:
>
> compatible =3D "ethernet-phy-idae02.5090"
>
> that includes the PHY OUI, and that will tell the OF MDIO bus code to
> bind the PHY device with the driver specified in the compatible string
> without reading the PHYSID1/PHYSID2 registers. Since you can detect the
> boards variants, you could do that.

The address 0 and 1 PHY OUI's are the same for the AC200/AC300,
the AC300 PHY however has a different PHY OUI for address 0x10
which is effectively used in place of the i2c initialization sequence in
the AC200. Note this 0x10 address is not usable for normal operations,
it's essentially only used to activate the main mdio address 0 used
for normal operations.

> It then becomes highly desirable to have a "dedicated" (as opposed to
> using the "Generic PHY") driver that within the .probe function can take
> care of putting the PHY in a working state.
> --
> Florian

