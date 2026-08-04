Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5243C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Eo5XMI33rsANiXMc677tWslAYQ4Uqg6+HGv1+1GEcY=; b=24EjE478kqelR9FJAaYSd6uEQt
	tquqxKzgbTwPAK7XhQ1/5YQFbMcmT5pUX9/2YMaMmTeYiR9BedklUe/41hRp2vUjGKf7h20WEppXX
	OiuCVgQLVvJ0s8HFZNVtUeZcNNHUfeSzQLJKtyUtHDEyrFnGDLOvu9aDlvZiZwmnHsLc+Pdy8ZJsx
	ctOCEJtZKqmDZtbTjwB4QTwmSS9eGx6KabEp5Lwsd5DT3VmMSO7s4DNh5SRh129/6hWS5IBnM6q2q
	QI+cZUXr2gJCpbprcH79rQO0J601bmpKju8JnTHWNBuTK7Y4fyz4I0bgKuGYNGsG7tjQmyUwRbfGp
	2i3txHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJtr-00000002cHy-3b3L;
	Tue, 04 Aug 2026 18:30:03 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJtq-00000002cGw-0FjC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 18:30:03 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-747355a8565so21984137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 11:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785868201; cv=none;
        d=google.com; s=arc-20260327;
        b=TPo2da0KjYcy8T3xRvm4fcgCm68MWJRVuaHWM7utdwtK6M7SQpvzT/3T9UCfR5dxFj
         USbTAcFVmyD423dpsuwjx/DQgGvi1c3KgpFH46k+cBYnRvQP0dTmdFl9X7frZ9M10r/C
         j5seg0pQgyy75ZmovHOFFhIcMUh0RClU1RRr7u0koenrIaubfld2FRqnjU83mAMvBxCO
         YdK4nNRNNwAoVJc96t52ecSOkXRRnhMFVK0LRNio4boYEO8sUfDjTJrmF/INjCO5nFkx
         lkTTG1OuBCfp3FIn/38ZZGFT+aJlmw+0Mx75kgKUENtxiioMKUqlXn6gsam2QFhYtYVu
         S84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Eo5XMI33rsANiXMc677tWslAYQ4Uqg6+HGv1+1GEcY=;
        fh=hB25+48OYfmWQnHB4khfkIvPuH2esViLyrjK+BiXLzY=;
        b=Tg68D/p2PaVyo/VK+Snsmh8CKKo5GssLW5harg2Jjn3Zjbbzh7rdkTePOscEmE11b9
         3dYZdHpmXAJ1ByO+GOyQiZMOdMyE2f6tzPyBsjlQXE5dTbRilhXEw9xgln1QiRGNJ7rh
         FOW3PFJKPhnh+2hrPjRszpLqszcaqQUrG8Yxd2vtMqIjkuAascyTXNW92C6WhW5n4BXU
         voUc/QWtjyNDyOJM9zKELG+W/AMwI7sJlIKtNsaYX5Fkv1NMra9gemAb4RO/K/6UwVvr
         6p9AUaUB8e+ufJIaIETSrH9wqOwjLmA3PdC8HD8Q3Pcktj7kzOBcok8qLqNww/ycZ3vZ
         McSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785868201; x=1786473001; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Eo5XMI33rsANiXMc677tWslAYQ4Uqg6+HGv1+1GEcY=;
        b=Anq/5ZATWIE7jhOzdawYzmfTImPIFuRDw3tzgDcLXztPYgXgPYv2Kvgj17uWEX2IlO
         hlNN5UnFJO9V5ETPd7dsYaKVNItWJXniu90eas2puHako1PTPqWXtjHxy9UTlm+y+2CQ
         lV81K3yHW2A6P3rI3RgJmnN2/wSiNZXICgiO6DqymWexs+74tE0E4n5ih6bqKVd8H8WX
         HF7jSs1mljskKisC4ytR02qC1DEG7NR+fwWZEHTdNXV9p7/d1fO1plwTFkYWzeJPLtR0
         wVRXTd+/r7OTyCuw5odGUIxCFfniVUUfyefHnTdhVK9SojXq7gPk29D55sryCOVJ1yRP
         9OzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785868201; x=1786473001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Eo5XMI33rsANiXMc677tWslAYQ4Uqg6+HGv1+1GEcY=;
        b=YAw7shAonjE805DlFqFR1zdR5vI5ANwR+8jgJ5f7B3C2YQBdqDX1cZZXcy+ijKiLZX
         6XSCEI9qX3jH4/mdwGRvjN5UqdTpYjCyWl4AQEy3vQ1k4pW3GLfVboPOLT5lL1f+9WY7
         VAwaq3pc3ynU37tDdNYiUqfKzsNKgZ621DqM1oPYTzsG8Z87bMVkOX4/pzGGSGg1BuyZ
         AhnPRG00fhc4jHo3QJ2QxcvKw+cB1fkTFG5FtzjG/zif1sbdXiU12Bx5qghvtQWiz5UC
         3eY02YrsfWC1TYK6H94y2SXPtNoMgvL5jD3O5eMVFkIE+bP3GcP4QBWzyPs6IFWWa5ol
         cdaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGOhBpl8uh/hyOxVrXO6xT+Sn3H+1LRWtrCN0UT9FQOVK/a6SkonPCu+vgIkAQ8SCGuHHoukL3k82H+UXqg6bR@lists.infradead.org
X-Gm-Message-State: AOJu0YxnX7LmuRKo/zZmGiTX/N/1rnWu1EXT7FUqejVTPPyfm4hQxRuu
	BcKDTVi0pKKHoxfgIE/ylCl8x1+Sb57tWMcwDZv5uDrkWWunhatzhXzchqt9C7cmTMYPhH8Xv39
	LYw8y1+fsMxsE6Ak5bjrfkLOSF0akMOk=
X-Gm-Gg: AR+sD13ORoBMT2+tkQvDe9jjSkO9W6clJx0AGr2niAZ+45p2yGgt8dMpQ70ABsj38cw
	Ru+GotSXLw2pDnbBcCs3+OGpYcxwIhWQr979gREnGvEm3q6XyiU3L2Lb5kvSZVioq0dzbUjX+zi
	/a+UtU7WJ5mVjmH4l3vUux2VKhFetgSjs88PE9K1GsdO0lTUtvrrzsLrwlUggoOZBKsJnFvdKc4
	ztPevcZcFEqJ4hZRtwxYtIB5j0QN3pXf/p3o3FRkhR8pYVxSNi73Xw/gkgyN4L8I2v7KSW1O+6e
	EKGDHDO6+QoZqOu+JY1lwYPkNQ47y4iKh3Ds1kaUj7OT+lCrqGfzCB/3TA3EwjeGiZi2PQS4vJr
	6wbhaabnEKN7e82c78HxefPQFj/kaBZXQz2Cd0gKVpuzu4u67e8E7FXSOABB/Glw7kosRRMRVpl
	oGJ8lxN8MaVjSP06YszI7wm5RgbTOi3ks3ko7W
X-Received: by 2002:a05:6102:6892:b0:740:2974:1b19 with SMTP id
 ada2fe7eead31-760e81ffa54mr232158137.4.1785868200546; Tue, 04 Aug 2026
 11:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch> <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
 <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch> <CADvTj4qpHU3F0DrEmc0vFi+JiwTNERniiMHKo1LmBd8sg58wJA@mail.gmail.com>
 <205e9051-8e43-44bb-a4b5-4ec69a192fa3@lunn.ch> <CADvTj4qmXWbDsc-vigcSrF1N=zpxmZWGp3YaZ9PFcWK551h3mg@mail.gmail.com>
 <fb6f8065-a655-4d53-acfb-8171b2e003dc@lunn.ch>
In-Reply-To: <fb6f8065-a655-4d53-acfb-8171b2e003dc@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Aug 2026 12:29:48 -0600
X-Gm-Features: AUfX_myhAv4fr3OX-v7_1toN9rBz9cnAh8mnRXYrH0R-kOg3uw2jZVSUuGWjruc
Message-ID: <CADvTj4pdZN4Jmx0D4Yh0KDPkh_-zJ5iXCM=vUybGn0aFAAqAgg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260804_113002_116126_571B5D16 
X-CRM114-Status: GOOD (  32.15  )
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

On Tue, Aug 4, 2026 at 12:04=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > No they don't. There are extra registers in different address domains=
.
> >
> > The block diagrams make the distinction clearer. Both diagrams depict
> > an EPHY block with the same internal organization: MII/RMII, auto
> > negotiation, auto-MDIX, 10/100 TX and RX PCS/PMA blocks, LED logic,
> > clock/reset, PLL and EPHY AFE.
>
> The block diagram is a vendor diagram, the vendor can draw whatever
> diagram they want. What does the Mainline Linux networking block
> diagram look like?

I agree that a vendor block diagram is not normative for the Linux
device model. I cited it as corroborating evidence, not as the sole
basis for the design.

The stronger evidence is the observable interface: after the required
control sequence, both link endpoints report PHY ID 0x00441400 and
provide the same link-side paged registers and behavior. The additional
registers are not extra registers at that Clause 22 endpoint. AC200
exposes the corresponding package controls through its MFD regmap,
whereas AC300 exposes them through a separately addressed non-PHY MDIO
device.

The Linux device model follows those addressable devices and their
dependencies rather than treating a physical package as one indivisible
driver. I think the relevant Linux diagram is:

                         MAC / phylink
                               |
                               | MDIO
                               v
                    +-----------------------+
                    | link phy_device       |
                    | common ACx00 PHY      |
                    | driver                |
                    +-----------+-----------+
                                |
                                | required control provider
                                |
                         one of:
                    +-----------+-----------+
                    |                       |
          +---------v----------+  +---------v----------+
          | AC200 MFD child    |  | AC300 mdio_device |
          | TWI/RSB regmap     |  | control address   |
          +--------------------+  +--------------------+

For AC200, the surrounding MFD topology is additionally:

                    +----------------------+
          TWI/RSB ->| AC200 MFD core       |
                    +----------+-----------+
                               |
                 +-------------+-------------+----------+
                 |             |             |          |
              EPHY ctl       audio          RTC        TVE

Only the selected EPHY control provider is connected to the link
phy_device. With a fixed AC200 or AC300 description, that topology is
entirely static and does not require CONFIG_OF_DYNAMIC.

The common PHY driver already drives the PHY in the phylib sense: it
owns the link-side reset and initialization, auto-negotiation, link
status, MDI/MDI-X, analog tuning, interrupts, statistics, EEE, LEDs,
Wake-on-LAN and suspend/resume behavior. The provider owns only the
package-specific operation needed to make that MDIO endpoint usable
through the bus which actually exposes the relevant registers.

This is similar to other places in mainline where EPHY clocks, resets,
power and address selection are outside the link-PHY driver, including
dwmac-sun8i and dwmac-rk. It is also consistent with the general MFD
model, where a function driver accesses its portion of a parent regmap
without taking ownership of the entire multifunction device.

CONFIG_OF_DYNAMIC is not what motivates this split. It is only an
optional way to select which of the two provider devices exists on a
dual-source system. If runtime selection were removed and the
bootloader always selected the package, the Linux diagram above would
remain the same.

> O.K. I've somewhat had enough of this discussion.
>
> For the Networking parts: NACK
>
> To get that revoked, make the PHY driver drive the PHY.

I am not clear which concrete ownership problem in the diagram above
is resolved by moving the provider implementations into the link-PHY
driver.

The link-PHY driver already drives all common link-PHY functionality.
Making it directly access the other control devices would instead make
one driver bound to one MDIO address also operate:

- an AC200 MFD child and its parent regmap on fixed AC200 systems; or
- another mdio_device at a different address on fixed AC300 systems.

That does not remove either device. It bypasses their normal bus
ownership and combines different device lifetimes inside the driver
bound to the link endpoint.

It is especially problematic for AC200 because the AC200 is an MFD, not
an Ethernet PHY. Its parent clock, supplies, interrupt controller,
regmap and global state can be shared by audio, RTC and TVE children.
The link-PHY driver should not assume ownership of that parent or
perform operations which may affect its sibling functions.

If the objection is specifically to the private provider interface, I
am open to discussing whether some operations can instead use existing
clock, reset, power-sequencing or generic-PHY abstractions. That would
still leave the AC200 MFD child and AC300 MDIO control device as
separately owned devices, however.

Likewise, if the objection is specifically to the MDIO OF_DYNAMIC
changes, those can be reviewed or narrowed independently. Rejecting
runtime DT selection would mean that firmware must resolve dual-source
systems. It would not remove the justification for separate AC200 and
AC300 control drivers on fixed systems or justify duplicating their
common link-PHY implementation.

> Hide away as much of this bad networking design in the bootloader.

The bootloader can identify the package, perform the initial power-up
sequence and enable the selected provider node. That is fully compatible
with this model, but it cannot replace the Linux control path.

Linux still needs to reapply the package configuration after PHY reset,
system suspend, provider power loss or driver reprobe. It also needs to
coordinate Wake-on-LAN, interrupts, LEDs and power management with the
selected control device. Relying on undocumented bootloader state for
those operations would make the driver less self-contained and more
fragile.

Even when the bootloader resolves the variant, Linux still sees either
an AC200 MFD control function or an AC300 MDIO control endpoint plus the
common link PHY. The bootloader can select the left or right branch in
the diagram; it cannot make those devices become registers of the link
phy_device.

Again, this remains true with CONFIG_OF_DYNAMIC disabled. Dynamic OF
handling only allows Linux to make the same deterministic selection
from SID when firmware has not already done so.

> You are free to continue working on the MFD and other parts which are
> not networking, because i'm not a Maintainer there.

I can separate the MFD, fixed AC200 networking, fixed AC300 networking
and optional runtime-selection work so that each part can be reviewed
on its own merits.

However, the MFD and networking portions necessarily meet at the AC200
EPHY function. I do not think the correct way to avoid that
cross-subsystem dependency is to make a driver bound to an MDIO
phy_device take ownership of registers and resources belonging to an
MFD device.

I would therefore like clarification on whether the NACK is against:

- the common link-PHY implementation;
- the existence of separately bound control devices;
- the private interface between the PHY and those devices; or
- only the optional CONFIG_OF_DYNAMIC selection mechanism.

Those are independent design choices. In particular, removing
CONFIG_OF_DYNAMIC does not collapse the fixed AC200 MFD child or fixed
AC300 MDIO control endpoint into the link phy_device.

>     Andrew

