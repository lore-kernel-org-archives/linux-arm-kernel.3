Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A02C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhCHZs/g7TB5oMS7PG09o+GsecOnKpnv54KT75DfOGo=; b=X8LjPuwMasgeiKq6wLAGGbs8Dh
	bByaxsPedT+0cSP+TeNHtBqBTDeb14WbYxzfviVYiNUL76P2jaJZdxKWa7DSiWMOdRq07uJeWUL+U
	Ljq8mSIrcJyOdd5RK7RoMovd4IEcPz6jzw7dL+ol50JZPaoLUTFriROwOkatshuGofqG9fxzFAq6Z
	H6F+M5vmMWxCYrYF9/m6bn2li7pAVBlopSsjH8EzVv8K75Bh1KHvgEk8kBYL9qos1lUlHxHbaIdlw
	Pjs0VXU7VWxNoqHKKIFVKTqui6jdyqy2btgd3ABoQlauiREyjdPWewW9iy14I+njVvJBB106BWjRp
	yHOgkM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxfA-00000000ORs-3QZg;
	Mon, 03 Aug 2026 18:45:24 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxf7-00000000OQw-41fn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:45:23 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-74748e3a4d1so1733396137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785782720; cv=none;
        d=google.com; s=arc-20260327;
        b=hq4ShILOV1Wj4MRc7aXS0JwmABkSlrttFsDQqk88gXVeTckl7marSv58Piq+3VXBdM
         HVK+T5tQHdSf+ccc9CrLB5jK4gASysv5QQlQisRlPmU9e8kRqvFTRPpWWMGiR7HWvU0o
         IHA+Yr5jxG1h3Kqvg1ItKktOMvkDYR/qLbqCN8RggQBrojH3f9BQyV7djU8tAKPx4BGO
         yDNAoy4M+UhRVwSZMpaoCDpa6aZ8b75tPt6fN5qQz3gR/lIVpLvuvzRMlgl4nY4wWe2h
         jyhV1B/K/xScUFyBewSqcaNEOV74GkjA1E9QVFk2gKhZ7VAuZ8M510ASm5O3B01juxBL
         pYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lhCHZs/g7TB5oMS7PG09o+GsecOnKpnv54KT75DfOGo=;
        fh=82VwquUC36OO7rZsy9zH5TmL9Ys/HpU500Zd1hFd6Ek=;
        b=n/Z/9pnx2hx5ashk63wd5woxdvO3iPz7bm4cwS6PPbMVC9DZfj8IjayMAt1Bi1TUb+
         q7RqtUnSjl6jzPO/12sX34dODHQadE8/Jos1E+Fgvs00YCuvXU841ZjWaYNT06ghwOfk
         TJiP2/fDgx/fFrOUsbCwgZmJ6R956hkvFR675JEPliPonqASAIm8XIocWbXD8SNd33+h
         cXgWYOb+EhIg08af2lhqUYfJ/VuphVVwvfLUJj3QgiXKU7FIP9Qtp4Ubnoj3pb/52w7p
         naH+wzxSn5ehgqYOBYZ7pKP8zE6PcLZXpmtV0ReuiNGgnHCmdCLhh21fN3Me8CsiMWKu
         0O1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782720; x=1786387520; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lhCHZs/g7TB5oMS7PG09o+GsecOnKpnv54KT75DfOGo=;
        b=Ka46xBVjznqzQELk0b7MRuHXylkVoPzCKHzloFRY9rpBhHNcNYhXomcb8ZJ9iMPj7b
         YpgmJhwvG+ixTgowKJw4ev5t+TTAgtkupDufdo0zIfeMXJ6f9BgfF+JfSt8Nu8Nin6Wt
         ifi4MjbEThNbdPVgTVJAFkzmfiPo22NmafvtGRcpCKtdPJDzePBiJ7Ho6uymBDN/shbU
         KzKKZLQ1OWydTfBQIQQQ79PEievqQYsJUkZj25UxQnV7sq+WROthM/JjtfJ57i9e645c
         eNBJiIhnslGy8AbkRS/hB3zFxJjADo8dB3Wy2zl5u4Ial2bvzbLb8ru7rSmmej1m3HJC
         9rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782720; x=1786387520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhCHZs/g7TB5oMS7PG09o+GsecOnKpnv54KT75DfOGo=;
        b=a4q9sD3b4Z+IJO+YwWKOv5QIbFX253BeMY7f7yA4SQacoqdx+0bi8nlFzclp5X1YeD
         dBgo/COnrCut1IKXn0OhG19SrrjizGXvAJnbzi7B/eGzEAjyYAyS5WID1gjSNBFbjtQj
         Rk9eepAo/Ejg0QDmLHd73Ommm27l+oa9N2ZYd47EefkoqTPF9sT1tkOegZkH3AVoUwJs
         vCq8BdzPuDyS4Ol++bxJ5l/bOhuXmP8KRHYFwTXzqL0rhjbU2lx/UUEWC3HyXgFQLMD3
         hsoUdmNR6wPk11Jbagz2WWDhuVcw+82btPWHkbF/CHgLaZbkE4pvaxB5mFh+wpXdVM25
         NE7w==
X-Forwarded-Encrypted: i=1; AHgh+RrRTeFxrLaQE+8Z6pJVRqE80Cqom5RyiFgwdAe3254doF1WWB0e29/vB5XpM/ibx0fTfK7mq2n66eki1ZQun3ig@lists.infradead.org
X-Gm-Message-State: AOJu0YwzCpwOccyScPlDk741PCU2gECLt7levYY7A7hEwTXC60Iw2+0i
	HEVXEGHidCIbE6OrWrsWlYQIQLcBlJBAN3oAwNOftukCqLmkD37MTrq/QZl2LBnsdBO00eYGcde
	vaw4KyQ6f2ySkhdeB+GnGXL0CXD34C+c=
X-Gm-Gg: AR+sD12YEm7meo1KdpHFiffizk1LOsrTFM1T9aIaFNlz/N0N0ApJBKOC9iLrzE/Ek/Q
	fQ488phDUZ8q0cyFxsqxbaQCtBFQ6boDK+XCPdsIl+iYWVvbZDBg7hBmeH3j3TBo9SUa4ck3mJw
	dO8GVA9Ydy02CSLwY9QTSStmYXegFwh5m9yLGUh6B7VnE5pRC99aQ/g+KpoXWKnbkJ9ASwRjEOn
	QIpFG7X9fZ+7Js7AIcWIYadnpRSq2WFvY5V5HnZQWhIrG4DBc1xXUwVdg6TuKPx1E5XfmpCbVwf
	ch1yYWUnYo28lm5QMjMsIwRN8Dv3acdBUa7HcgmInmoFOzXn4tBMFZKiV5maZlzibAcojHbTdE8
	gLCFOoSZieS4kxE3bLuYsWkihMY1YQPlt9xDde4lv1Jh0gTMDTi/jqdjvjoQF23H0QC0Y9cOqdX
	lzKPr4QZoupWFVYFiI0uDFy5klw41XDI39oMRk
X-Received: by 2002:a05:6102:fa5:b0:74a:b492:3a62 with SMTP id
 ada2fe7eead31-75b21e6b74emr8853495137.4.1785782720194; Mon, 03 Aug 2026
 11:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch>
In-Reply-To: <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 12:45:07 -0600
X-Gm-Features: AUfX_mxrC1O9cxNBLhvxxOGulQcP38PJEIX9XeOzWBEdBf_aYCt8UZQ5evY-RxY
Message-ID: <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_114522_017286_B88729E9 
X-CRM114-Status: GOOD (  27.50  )
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

On Mon, Aug 3, 2026 at 11:57=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 03, 2026 at 10:09:01AM -0600, James Hilliard wrote:
> > On Mon, Aug 3, 2026 at 7:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > > +static int
> > > > +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *control,
> > > > +                            unsigned long outputs)
> > > > +{
> > > > +}
> > >
> > > > +static int
> > > > +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *control=
,
> > > > +                             bool active_low)
> > > > +{
> > > > +}
> > >
> > > I've not looked into the details, but these look like pinmux. Does
> > > this I2C device have a GPIO controller? Can these pins be used for
> > > other things than LEDs? Maybe you should be implementing a GPIO and
> > > pinmux driver. The Ethernet PHY driver can then just select the
> > > correct pinmux configuration.
> >
> > These do not appear to be GPIO or muxable pins. The AC200
> > documentation describes them as three dedicated EPHY LED
> > outputs: link/activity, speed, and duplex. The bits in SYS_EPHY_CTL1
> > enable those output pads, while EPHY_CTL provides their shared
> > polarity setting. I have not found any documented GPIO data
> > registers or alternative functions for these pins.
>
> So what i'm trying to do with both of these is make it look more like
> standard Linux building blocks.
>
> If that is not possible, i would actually put all this code into the
> PHY driver. You then have a regmap property to gain access to the I2C
> registers.

I understand the goal of using standard Linux building blocks where they
fit, but I do not think folding these control paths into the common PHY
driver gives the right device model here.

The AC200 and AC300 expose the same Clause 22 PHY interface, but their
control functions are separate devices with different transports and
lifetimes. The AC200 control function is an MFD child accessed through
the parent I2C regmap. The AC300 control function is a separately
addressed non-PHY MDIO device. A regmap reference only describes the
AC200 transport; it does not represent the AC300 control device.

Folding both implementations into the common PHY driver would make that
driver manage AC200 MFD registers and resources as well as an AC300 MDIO
control endpoint. That would mix the package-specific control transports
with the otherwise common Clause 22 implementation.

The current split uses standard subsystems wherever they provide a
matching abstraction: MFD, regmap, MDIO devices, clocks, regulators,
NVMEM, device links, and the PHY LED framework. The narrow private
interface covers only the compound operation which those frameworks
cannot express: calibrating, addressing, configuring, and sequencing the
package control block before the Clause 22 interface becomes usable.

The link address is an important example. It is defined once by
phydev->mdio.addr. AC200 must program that value through its I2C control
interface, while AC300 must validate it against the address of its MDIO
control endpoint. Generic PHY operations do not carry a consumer MDIO
address. Encoding it in a phys specifier or control-node property would
duplicate the PHY node's reg value. Giving the common PHY driver a raw
regmap avoids passing the address only by moving the provider-specific
implementation across the driver boundary.

The LED pad-enable and polarity bits are similarly part of the package
control function. They control dedicated EPHY outputs rather than GPIOs
or muxable pins. The common PHY driver still owns the PHY LED semantics,
while the selected control driver performs the package-specific register
access.

For those reasons, I think keeping the transport-specific control drivers
and the common Clause 22 PHY driver separate is the cleaner division.

>
>        Andrew
>

