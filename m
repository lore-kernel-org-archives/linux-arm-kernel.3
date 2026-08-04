Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00151C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 04:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=; b=XPdR2ZEfl7w+3CUaTCparSuZX7
	wcCasdxJiKZRsVdJtGpjdyXrMerIIFufCVT8gdlJ2+A97loWP8aB24KBFS+mX37s81x38lNzQJGW8
	VkDbpEISonb5vLZJhC4+Goczu/ea17ha857x8YLJoGmbRTP3/u3G7PwtMkDV1iaw61uKBvas4GsFA
	28NaqBKKc2qmpqXS15hmxjBYGamWq231HtpOosSK/jkuMw2HgfQiB72RPoxciAF5FvL/3ayaMUQwd
	wJ8VruYjuwyAO99BTILYV5tw68jirNkjlRCGu6QuNfQn/9Mqa2gtOPAEFZhr/uoCkIHYaq7NgFLyV
	EUSD5OPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6pA-00000000zVI-0UMX;
	Tue, 04 Aug 2026 04:32:20 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6p6-00000000zUW-33PF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 04:32:19 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1666212e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 21:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785817935; cv=none;
        d=google.com; s=arc-20260327;
        b=qDtbuMD2mQ0hpLpV2mFrjN/mJZTzvLuqPIMeTkrN+ybx0GP8rPBTR78tnUPs+tYUIa
         m1MYCdxpoalmGXxpw1LrvIM0i3Wy4qTlyV21smuNjFUb1/gLYxZuPp0znw43yfWtgkfw
         ePX99JRZ7oNAxSiTSJQByaotlrIPc9anAgd6aQ3ATHmuIgddxyYFhu6CZB/51KfXkkIb
         +1R+QgmBMbhwVQLvO4dZ3OqQlHEYBdqD7fkr5ZU24ywTMq4MWOBLD9fGxNBEidqm1qor
         fTIO+Fzfkiq7zDRFrCO+iDCzi1i85g7zT3k7MzwssfMkkVvlkWmL7So3g5Pb3ul5yn3x
         cYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=;
        fh=2bqvIXRXCDGjBOxhHowB5awnxElfwEaQePSG4nTYtUg=;
        b=GUeZ0KyEWd3Twq7+N/Zto4xah/ctbvof8VaoSB3DRRbRPS1KHf4ZL80rVMSbEs4ujX
         r65bANNqVLMEWRb0DUnNNOEtDnEOoKEdtxvW2KSrryAhTo+p/bA3Zk7D+2iEc6Ly2VMR
         wK80V9X/QyOdpToGyXBfUkl6dqBBeeU0yz/HNKkBgXoe+qSBn+2HBkMc8R/pUcfWxrDW
         JFIxzx8oAIyjCf6U5YDN3981fCY4aojiKyTm0kOEiXaczxgyiFY+zCvsXjFa1ln7stH/
         r9J6ccOdbKJYMHhO2djFe0Gk2ISnNwV2pUcUOnlzybWL9MkcL8925EiiZ7wNMBlFRr6x
         KIhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785817935; x=1786422735; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=;
        b=d24laNRfvziXRLBWozz6lgb/sQqPhMAih+UKLg+EfTvFIqRBc2B6tUCNL+v0De8d3y
         ErmCYSatsKZizEM/4X2hcouhBt7/wQ8QAeZh/v6vQ2YfScm15AB5F4JJU1fzr8vjyw2b
         +DE9AYIWw1bSBPAYni8Jh0YYZR/0xizHt0bTxqxCk60A87WOT4u5uTd9vhgfxB67f00w
         qmkKkDILNVn1c3APw/4LXZgDhU4lp4qqUCmlV+vx8k8qsfac1mC22f6gCjabPZ6JKfCt
         lXxcbCv2CcPm+LIU2AbLbqyQjaqSvr45mGghw1wSFLtgnXWV33dT+MNMc6miuZm2088Y
         MwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817935; x=1786422735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=;
        b=M2ceMIIyx+2wcHC2QU7bqnSu4uJNPbaToOox9RVXkOZs+BIAVuaVgAkVX9jT/jhHmB
         E6d5HQbf/0bILrskPu6jRjwnNWmsBnVrHko7biMN5s6fPiFOj2acDi4eb6oM2Y0LJISE
         NBNwLlz3dNZ2DluvyvN/9lgpqsUIvqusZqhPzor9soWSEwyEl7NnirFooHQxxZnX4ueJ
         2IxvuTvax5itzTlY2FP6dRYGCfhx7bbI1rCpvZ7YABKVRLA7x3B4Pq8l0BQ83zhumE8D
         AZOScAAPzbTaCg44NiNsY4WqTBoVrSxRNpXh+zZAEhJmBYu+w9pyCMcjTWvH4B7Q7jO8
         ttwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRla+8WgyKwtNrfEp1tYez1O+5Ibj6jCOJ1qTcX0DS2GZl9hnnn12/CCfpcKr1iCZSeCA/b7Yi7Oe43jWS0k9n@lists.infradead.org
X-Gm-Message-State: AOJu0YzbkDhu8vFUV9MgTDSkOgYmMw1RLF0k6JmRLvKF+sVOZWvqYLjE
	RZ2dOnXb4fIcGjin8sd0QNNcsxRb37Gpu1NWCwrhhvE77ng0UK51yxvjF+Z+UVv0/SMU0rgGePn
	QuT8mCj2EaasCBUtzfJT5Ntqu+Cm62JE=
X-Gm-Gg: AR+sD10/4Ha9jFe5CowV0F/aFHTM+4KszRKUW5tv6+OToZVqWheC7luii+qn4DUSSqP
	jaEyBMdv2oHNO5KJTq4L1d0jsz9ez7NQ1NemCIrGoeB02dJDK+r/oLXmLHfVaoj4U0Anz1tmcGb
	AnLwtsRwMXb5s+qbQDUZ8eCsaYVFZPMJ4ptWIwu+E+VR6QOpjDgMcQmcR1xNn/8y2o+vWjdHhhl
	V1Q2Nzl2hb0SJR6aZ9Py67//ak7bk3QLfn9ol8CqLSVvccjpH0O9GstyiYOmBJcKwh08aP+vw9G
	L0yb+0A71MfTYYBAFlSGuahnmdyJYeNAg+c0YJimvIR5vOcqG8ktytkjG3/3DqnK04edbrq50B9
	MWda/QEh9y7l+hUeorxsvalJPpCoT1pEdonpxlCVip2bdkloRT3TCcdgNWhKfGEvbEcsVmnFxkV
	/FbRk2ozpWc5xiPAtNV4sdKyZiiWgAlnyI7Coi
X-Received: by 2002:a05:6102:15a3:b0:738:be73:55e0 with SMTP id
 ada2fe7eead31-75b237677ffmr8262959137.12.1785817935136; Mon, 03 Aug 2026
 21:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch> <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
 <CAGb2v64U9ZQxfb7M3VfoGH60iMHL01XDy6tjs8VbFPLfyaJWgw@mail.gmail.com>
In-Reply-To: <CAGb2v64U9ZQxfb7M3VfoGH60iMHL01XDy6tjs8VbFPLfyaJWgw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 22:32:04 -0600
X-Gm-Features: AUfX_mzUkHY4di871Z-oeEmg1mv3oYLeo3scVGxNss1cbpF1OmuFzb1N7ZoUB_U
Message-ID: <CADvTj4rCaL+Kf5C_Sd8-p5nJHxF8GR2i8oHFJd1Nz=egx9RcYg@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: wens@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_213216_793585_1CE317C9 
X-CRM114-Status: GOOD (  45.32  )
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

On Mon, Aug 3, 2026 at 8:07=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Tue, Aug 4, 2026 at 2:45=E2=80=AFAM James Hilliard <james.hilliard1@gm=
ail.com> wrote:
> >
> > On Mon, Aug 3, 2026 at 11:57=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Mon, Aug 03, 2026 at 10:09:01AM -0600, James Hilliard wrote:
> > > > On Mon, Aug 3, 2026 at 7:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch>=
 wrote:
> > > > >
> > > > > > +static int
> > > > > > +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *cont=
rol,
> > > > > > +                            unsigned long outputs)
> > > > > > +{
> > > > > > +}
> > > > >
> > > > > > +static int
> > > > > > +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *con=
trol,
> > > > > > +                             bool active_low)
> > > > > > +{
> > > > > > +}
> > > > >
> > > > > I've not looked into the details, but these look like pinmux. Doe=
s
> > > > > this I2C device have a GPIO controller? Can these pins be used fo=
r
> > > > > other things than LEDs? Maybe you should be implementing a GPIO a=
nd
> > > > > pinmux driver. The Ethernet PHY driver can then just select the
> > > > > correct pinmux configuration.
> > > >
> > > > These do not appear to be GPIO or muxable pins. The AC200
> > > > documentation describes them as three dedicated EPHY LED
> > > > outputs: link/activity, speed, and duplex. The bits in SYS_EPHY_CTL=
1
> > > > enable those output pads, while EPHY_CTL provides their shared
> > > > polarity setting. I have not found any documented GPIO data
> > > > registers or alternative functions for these pins.
> > >
> > > So what i'm trying to do with both of these is make it look more like
> > > standard Linux building blocks.
> > >
> > > If that is not possible, i would actually put all this code into the
> > > PHY driver. You then have a regmap property to gain access to the I2C
> > > registers.
> >
> > I understand the goal of using standard Linux building blocks where the=
y
> > fit, but I do not think folding these control paths into the common PHY
> > driver gives the right device model here.
> >
> > The AC200 and AC300 expose the same Clause 22 PHY interface, but their
> > control functions are separate devices with different transports and
> > lifetimes. The AC200 control function is an MFD child accessed through
> > the parent I2C regmap. The AC300 control function is a separately
> > addressed non-PHY MDIO device. A regmap reference only describes the
> > AC200 transport; it does not represent the AC300 control device.
> >
> > Folding both implementations into the common PHY driver would make that
> > driver manage AC200 MFD registers and resources as well as an AC300 MDI=
O
> > control endpoint. That would mix the package-specific control transport=
s
> > with the otherwise common Clause 22 implementation.
> >
> > The current split uses standard subsystems wherever they provide a
> > matching abstraction: MFD, regmap, MDIO devices, clocks, regulators,
> > NVMEM, device links, and the PHY LED framework. The narrow private
> > interface covers only the compound operation which those frameworks
> > cannot express: calibrating, addressing, configuring, and sequencing th=
e
> > package control block before the Clause 22 interface becomes usable.
> >
> > The link address is an important example. It is defined once by
> > phydev->mdio.addr. AC200 must program that value through its I2C contro=
l
> > interface, while AC300 must validate it against the address of its MDIO
> > control endpoint. Generic PHY operations do not carry a consumer MDIO
> > address. Encoding it in a phys specifier or control-node property would
> > duplicate the PHY node's reg value. Giving the common PHY driver a raw
> > regmap avoids passing the address only by moving the provider-specific
> > implementation across the driver boundary.
> >
> > The LED pad-enable and polarity bits are similarly part of the package
> > control function. They control dedicated EPHY outputs rather than GPIOs
> > or muxable pins. The common PHY driver still owns the PHY LED semantics=
,
> > while the selected control driver performs the package-specific registe=
r
> > access.
> >
> > For those reasons, I think keeping the transport-specific control drive=
rs
> > and the common Clause 22 PHY driver separate is the cleaner division.
>
> I think what Andrew is saying is that you can expose the regmap from the
> MFD node, which you then reference from the PHY node with a custom phandl=
e.
>
> In the PHY driver, the first thing to do is retrieve the syscon, and if i=
t
> is not available yet, return -EPROBE_DEFER. Then you program all the bits
> you currently do, just without going through a layer of redirection.
> You can fetch the PHY address to program from the device tree. The downsi=
de
> to doing all the setup in the PHY driver is that the PHY node has to have
> the PHY ID in the compatible, as it is no longer generic. But you already
> have that.

I agree that direct regmap access would be reasonable for an
AC200-only driver, but I do not think it is a good fit for the
combined AC200/AC300 case.

The proposed phandle only models AC200. AC300 has no corresponding
MFD regmap: its control block is a separate non-PHY Clause 22
endpoint, with its own clock, regulator and sequencing requirements.
Folding everything into the link-PHY driver would therefore still
require two transport-specific implementations -- raw AC200 I2C
regmap access and raw AC300 MDIO access -- plus conditional resource
acquisition and cleanup. It would remove the function-pointer calls,
but merely replace them with AC200/AC300 branches throughout the
common driver.

This also matters for boards sharing one board identity but
containing either package, as selected by SID. Fixed boards can
reference one control provider, while variant boards can reference
both and let the common link-PHY driver select exactly one. The
selected provider then owns its transport-specific resources and
lifetime. That avoids making an MDIO PHY driver directly manage an
I2C MFD function on one system and a second MDIO device on another.

The control interface is also used for more than initial probe. It
participates in suspend/resume and reset sequencing, interface-mode
changes once the MAC attaches, and package LED-pad configuration.
Consequently, exposing a raw regmap would not reduce this to a
one-time register setup; the common driver would still need
package-specific implementations of all those operations.

The PHY address should not be read from firmware again. The MDIO core
has already parsed reg, and the authoritative address is
phydev->mdio.addr. Passing that address to the selected provider
avoids duplicating or independently interpreting the firmware
description. Similarly, the forced ethernet-phy-id0044.1400
compatible is required in either design because the identification
registers are inaccessible until the package control block has been
initialized; it is not a consequence of using a separate control
driver.

Also, AC200 is an I2C MFD rather than a syscon. Exposing its regmap as
a syscon solely so another bus device can perform raw accesses would
blur the ownership of the AC200 function.

The private interface is intentionally narrow: it contains only the
operations whose implementation differs between the two packages,
while all normal Clause 22 behavior remains in one shared PHY driver.
Given the AC200-only, AC300-only and runtime-selected board
configurations, I think that separation provides a cleaner boundary
than moving both control backends into the common link-PHY driver.

