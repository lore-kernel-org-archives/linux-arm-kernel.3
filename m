Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FF5C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktJ1TUfqLx16vP/MAvZ075WUJwVncZtbcK2MP7W0fJA=; b=dwEReG5ZaV9b1i
	3GlPO4j33uN+YVE5+bvsQey7Txi0Aokq0TvYsiKFjJ3YLcXXBmKp7r8piXkb1ErvE3zN0Bw72g1Ak
	t6BZUV+Mr31hOrsCVaIkQMVF0vsovi9RGG9MjhD7O529EfhyYT6PdIIcRvIG5PcCOUOidDTWpgE4H
	WC+2NJXWeXryN8gUmrHUKnWOOxTrEGV0WjBaHzgehZ7S1Bz5g2XThqPw3/xg3PQwEklUWWgCfocJl
	BT/zkQgWJpt7Hf0Hw5i6PGCeCgJbdw2O4zmb7b96o2wXwN7IJoFb6W4LMd1m6KHeyGi7HgrPW29iM
	S6XLEaPReT5reVKoVpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvtd-000000009Pj-47yr;
	Mon, 03 Aug 2026 16:52:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvtd-000000009PI-2Ycn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:52:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1430660AA3
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99F91F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775932;
	bh=ktJ1TUfqLx16vP/MAvZ075WUJwVncZtbcK2MP7W0fJA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=W4ObqZm1721yih5Cc72KTg1SNORcLauLEAeTR/pQvfulljFV1MY786WAqOG+xn40r
	 Nm6krj9Zt3xk+1UjcfnwqMXNgD5eKdkTOopLe6stmk4hDhhDo+pnbC9woAg+LNhCEU
	 rfOXG8bFLRNqvzlg52wWAsCZKeZXzzsFdGKuftIB4RdoErFBA6IpAs8GvfEfVtD0yT
	 DhNz6Rmwo19vJ3v461khXi2B3D+UUxZ8Sr0FXMUTiYY9fXY8So5/RbjYmIoC3rlDmt
	 zeYYhcpO9uCkfPhrdg0r6h8cpqA0QbjEIp0DoSaTgZbDBaLOxjRM7OGX/eWpQiklrP
	 fO7+/JOLtU5hA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so3416772e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:52:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq9TdsrgPbpQU4L+YeIIOWw1KXvvn4IzYOaEzscEj4qfQVC6hlDWPaLRx0T0wIJIuMroxI28KbBbC7A1PNUCDMU@lists.infradead.org
X-Gm-Message-State: AOJu0YyU0onXxtGjrYCdzoUQx0dWCeFDwMNqRmqJ7olBtMHveAwHPXD7
	ogbETx1ooyBd3ztAOdnb4wFkxNlY0FnMNJZ5tKfRcIPWi/LcFR+h9lzzIAjuChvBR4Em3knGWWz
	UTwCZmhdw7nhNYynihEk1fTB0hWLF61U=
X-Received: by 2002:ac2:5218:0:b0:5b2:9c0e:a2d9 with SMTP id
 2adb3069b0e04-5b2e4f9dd16mr1400790e87.65.1785775931139; Mon, 03 Aug 2026
 09:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch> <CADvTj4pfNFVGrQV86T7X+nZQYUamxEYLLWuxVXk=av0da_XocQ@mail.gmail.com>
In-Reply-To: <CADvTj4pfNFVGrQV86T7X+nZQYUamxEYLLWuxVXk=av0da_XocQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:51:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Wo+WG47jF_vBUOwv0Vw1SDygXMdBgpsy3R1AQ_LLfHw@mail.gmail.com>
X-Gm-Features: AUfX_my4aoD19Jk3-8CcfeDfaoI0T_9zWEBW-1SE8UXOLwMz9Yfo_iLW9hIPcwI
Message-ID: <CAGb2v67Wo+WG47jF_vBUOwv0Vw1SDygXMdBgpsy3R1AQ_LLfHw@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: James Hilliard <james.hilliard1@gmail.com>
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

On Tue, Aug 4, 2026 at 12:45=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Mon, Aug 3, 2026 at 7:18=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
> >
> > > +            ethernet-phy-control {
> > > +                compatible =3D "x-powers,ac200-ephy-ctl";
> > > +                nvmem-cells =3D <&ephy_calibration>;
> > > +                nvmem-cell-names =3D "calibration";
> > > +                phy-mode =3D "rmii";
> > > +            };
> >
> > What do you mean by an ethernet PHY control?
> >
> > I assume this is not an actual Ethernet PHY, but some control logic
> > around it? Where is the ethernet PHY itself?
>
> Correct, this is not the Ethernet PHY itself. It is the package-specific
> sideband control block that must be configured before the normal Clause 2=
2
> PHY registers become usable. For AC200, this control block is accessed
> through the parent AC200 I2C regmap. For AC300, the equivalent control bl=
ock
> is accessed through a separate non-PHY Clause 22 address.

Basically, all the PHY behavior that is normally configured using strapping
pins on a discrete PHY is done over this I2C channel.

> The actual Ethernet PHY is a separate device on the MAC's MDIO bus. The
> shared PHY driver for that device is added in patch 16:
>
> https://lore.kernel.org/linux-sunxi/20260802-submit-acx00-of-dynamic-v1-v=
1-16-0a53cd9e21cc@gmail.com/
>
> The later board DTS patches instantiate it as an ethernet-phy node beneat=
h
> the MAC's MDIO bus and reference the appropriate sideband control provide=
r.
>
> >
> >        Andrew

