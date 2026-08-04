Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F57C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 04:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=; b=A5JwVksqtd3JyHpVm7QR9Ir2uD
	w1HY7fGLjIrTM7g6bTz183JJAxWRLflpLrhKb8RI/ro7e3vz1v+DB8XluXzwVUOk51CuhLajwAltr
	v6HnKj47q+6oGssp9yvXMs1JRcanAjD7A17TTmjgwV9tzWAFcaRCq6TIPP9W2S47mr9rVI+XLeAcP
	zALEyW32GG8v1QjuzznmvZTJaiFQw1ubqsClmiN9gll2JuAKnpADTjg9Vz3bZCbRr8fqfbsdasIqL
	Paph3eIHa58gfiE9LMzUv058satsDnicu/DlsSmUQZDQieT05V6z9UZOiEjKxnkxUKJCH9nJr+1xC
	+U0q6klw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6uk-00000000zoe-1sgr;
	Tue, 04 Aug 2026 04:38:06 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6uh-00000000zny-2r2I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 04:38:04 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-977bbf2eb3aso1002790241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 21:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785818282; cv=none;
        d=google.com; s=arc-20260327;
        b=qJXiLl6g7gAVE5oCQwpO2p15zkANj9+2GJ5AtCNUy8oPawiKmgfYWpjNcmLofLsYIu
         l4nx5gaZ+1b/m9enJkr18v/VwBQgRmQ0tBbzMa/zGgseIDHzTG4TsXgMQPiXJzqfkT/G
         1/yFuGJ6J/oRsZFg86YTJjoS/NqjxWy22FIVuGGl/apc47PZs/YL4vd4+OmwEERMemGZ
         vsI3pU5bprz/ZNpMgMZaEqgHG6M7ppaYsj89Oponhe6DrktO+/HOqkMf5nhR9572u4UN
         xSOaFH9lPJyZ1ibyk0eSGSF4pVdyx06vTod8sjkybgiHUcAMp9wxQVKfS5/rts+5MxLv
         cqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        fh=/3ndS81GiEaljt72+QAXyE6Hj3Y9j5e1t7Ofg1GgznY=;
        b=B3mFwsyUUCtSX8ImzfeRZru+Uo7UZk1Vu5bLm9JHb9NlBVG5s4PxGL5PjDkAQgNv5N
         xBTALHSp4fTd1+Eq6gvKA5bG62WuZPgSlO8IEDSJ6ntVdwXl6wDTXsoh4vS0MYOplEHD
         kI1Nt2mYcMUz05eFTtXcqTaN3GfqLH0jZjURq/aopIYRpXIO1mSqpi7qwEVL/HZQSAdz
         /eeIrbVcGlVZDwsXaLy0N9NeqnqfshzMcknHWQbUqwYf6BiE9Bk7ylSNTHqBb7oNjh4+
         a8LTfnMF5qKxBJwnCNipmM5FQBU/OTGJpHS2riT3NWyy1civcZXycQD06fk+oW4Gy3Z5
         8fEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785818282; x=1786423082; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        b=RU0uQx3L3fSegyVk4+7w6tQboaCD7RdwzHHJgP3o7zOQXYvUvevL1f08AikhUt1Dw9
         sT5qnWZbSM/WhwI6yrWvchLwK/lzWe9AKm3vdRXBGy13GCKSDTsdruC0p3Lk6eXEKcZy
         TZOaa+1xoHoLdx2Zd/o1urMRfx+x0zFEhQ2+WbtkKwvUEvZflsVDIsFDWLDFfjajO7UX
         DCVaIK5ZgV7Hrb8JE7qE9C76h+GXaSdD96WKXEgr0c+pfJTfBZH9FAgVyvWM2/CJ0B8p
         QaZ9YCYAFTLcXxFwK/Kk8e6vv2MJL7B2v4iWGtiSFLE47tvMHcPJ+k8UlkJQiXLGEs8p
         oLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785818282; x=1786423082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        b=ndeNAOfHcw51ZJTe2L9PcsDQkEd+8Xq+Fpgwj6zyYLZdk0A+2I6D/g0IzYUottN+lx
         LY+woxoz7wZpEzPyIUadhP0C+lIJJjx25wRHm6LTRf9HPaAcWWeIGS9gx3Rai0e7GINg
         AZXjZu913REvNpUm3aEF5aH9SYJEZn+AEqA9ZTGEeyqa7/V/XkW9A2dFlZizkGW+QHdl
         AbcT9O+g925lN4jJG3O64Oim9xdowY0tMLNcpTjzdITzK1ALvnprerC7VAKBIfdkbaVx
         fhwPgmngqXxGZb4C0QeqiR6vI2W7kALFGnwvulLE/r1CPYjkg8EvZNTHpHsCl7wsOzkR
         8wLA==
X-Forwarded-Encrypted: i=1; AHgh+RpMS/37WAjLZ7BjbIhSzcMRqJOFjULK2JZXs03t4dpfu48mqDy3qXB04DfRNPD6D1IH+gz8izGtw0QBiS6Jszhi@lists.infradead.org
X-Gm-Message-State: AOJu0YwG4x2jjoU3L2FHMD5VJRjH96Wlq24ItXBMx0q+xLDQwbZPWIGw
	141sGDRNgTp6OaRi0SgKpEOXzIKpAvdq8rPyWI6bjt0L7w352xVb+DFzFrQv0VYYqB6tke8ZEKV
	l9yhEO6OVtGdouh81uxvGftUDwReC/6s=
X-Gm-Gg: AR+sD11l9MJz9QRR0y5TJNCDrvl5VAdB91CFAub2Yx6zfrq5T/6w6GbJ9uysn1+0rCl
	bMd0068VThtcGbyMLv4sJwCnVy3iWsmkDf25CXJcJWxaTCZhJcYaq1MTn4hSXcw4vVgcEyY5mAR
	dt17UQRMb6wMgz41Rrd70twlQGhD1t0sbvP7Reg6naF5A9Z7S+qQiHT7msC2LTlR9yqQLsPFa9e
	1OXNKJ6npUGrc+ohSAYuQaveWj7BbWszc7V124fjPMumgPnc7lrAO9hCQvKiimQIadLgXf0R94E
	vfVNnD1REx8kpX5J1shOmshhRbgcycRIwGmZpvhggEYBhESnvwGI2cawyVE0ZCx5uTGdgzH5GYc
	u/qQ1JTjvo5XvBbgjWQKgAk3u/6J6zrj8ZXcJhrWPfnUJtQh6spKOhrfgMnesHGEy54nK8vk4Td
	3lLY3cmIpXN8MmgmcgLIsiZboXHaULFfSeaci0sDc4IsvxNty7
X-Received: by 2002:a05:6102:1492:b0:745:78d4:4856 with SMTP id
 ada2fe7eead31-75b2226b36dmr8916982137.7.1785818282020; Mon, 03 Aug 2026
 21:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch> <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
 <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch>
In-Reply-To: <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 22:37:51 -0600
X-Gm-Features: AUfX_my4YsBDZd6K0e5M7YLW68aLI1B4Ub2Wc8OS8k7km2q52f4ciX_OEuUghsE
Message-ID: <CADvTj4qpHU3F0DrEmc0vFi+JiwTNERniiMHKo1LmBd8sg58wJA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260803_213803_735027_5C99F46C 
X-CRM114-Status: GOOD (  30.58  )
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

On Mon, Aug 3, 2026 at 8:22=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
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
>
> Given how messy this hardware is, i doubt it is discoverable. We have
> been pushing back on hacks to enable various things before probe in
> order to make it discoverable. So you are going to end up putting IDs
> in DT so that the driver probes without it being discovered. That
> means you can put any ID you want in DT, and the driver. So you have
> two different phy driver structs, two different probe functions, etc.

I agree that the link PHY cannot be identified by reading its
registers before the package control sequence has run. I do not agree
that this means an arbitrary ID should be placed in DT, though.

The Ethernet PHY binding explicitly defines
ethernet-phy-idAAAA.BBBB as the correct contents of the PHY identifier
registers. It also documents using that compatible when clocks,
resets, supplies, or another initialization sequence must be applied
before those registers can be read. That is exactly our situation, so
ethernet-phy-id0044.1400 lets phylib create the phy_device without an
initial MDIO read. Once the selected control provider has powered the
hardware, the driver can read MII_PHYSID1 and MII_PHYSID2 and validate
that ID.

Both AC200 and AC300 expose the same link-side PHY ID and register
layout. The package choice changes how that PHY is initialized, not
the identity of the link PHY itself. Inventing separate IDs would turn
the compatible into a Linux driver selector and would describe values
which the hardware never reports.

The package variant is discoverable independently through the SID
configuration field. Fixed boards can reference one control provider,
while boards shipped with either package can use SID to select between
the AC200 I2C control provider and the AC300 MDIO control provider.

For that reason, I do not think two phy_driver structures and two PHY
probe functions model the hardware correctly. There is one common
link PHY, so its Clause 22 implementation should remain in one PHY
driver. The two different implementations belong at the control
endpoints, where AC200 and AC300 genuinely differ in transport,
resources, and lifetime.

