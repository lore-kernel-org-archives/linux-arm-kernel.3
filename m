Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7B1C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3tZpMYh27w/dm8oruC2ikSebTIKfee6UIDxXeFEmbY=; b=i0oIRl9K7gvpQp
	gA1ziiP9yUBP2ueKuK2IbLqCx9asOY0mK5jV8qLRb0AMt8koGaNgZKWXQ8EJAD/ev676ZlseUFBGJ
	H8p4F1/X7fiB9ey4mYr8+SQ0+U7dpZelX80DC/o/RYHdLp2QsulgrzWBU8A3L0mGu5yhE0w97izUA
	UZmUsliWioa25T9oXe4P84+RoAB4zYu3z3H9AK5+pfYIqv2ZahIqweFuWIiITW6Kp1E3w4d5hQ4FC
	VGc2j3w4FqqmQ9dYAfYIJhxroVA3Oh6h+4mWM3tns4LorBm7SoHex/+5iwV9PPUjSvLJAyxub6zfq
	XSdBb4hvfZzaSilcIPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hhM-00000008KrC-3HeP;
	Wed, 16 Sep 2026 04:56:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hhL-00000008Kr6-2lsp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:56:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C95D43EE8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 04:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53C71F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 04:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789534602;
	bh=C3tZpMYh27w/dm8oruC2ikSebTIKfee6UIDxXeFEmbY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UropqgucTk1RLrJBamQ3AklerGyhVADL72cabcJr+qZiALC9/pt00Six1PqD/aBWp
	 IjQoI5eEEc9XLBgpC6ZuL9CIe1FxKMhm4kmmiDZ+t8ChixGlHWjVGbFcB5SKFcDO7y
	 rfKDerJ430tO0RXwSgEXx7sykmqAQu32509yFRqrY47Js4c6V+os/iOcIvCozIlZqM
	 Fyrw1stapVkSsw2zz3EzIz1adYgf3ei4Xyl+MiIA4wZ3V29U2Dub/L+QSZe5swtJ5e
	 z7v6TW2YZ62M0k3suNhAi0GKNZHCObVneAyhnTkZ2WmQA8gATF/s1Foe7pHhrroFSx
	 U8aGmSxEREqQg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so452302e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 21:56:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDcSXGMvpqOdzZvQrdoEz7+bXfqNoqiveVJUZMTJPHwRcX3VrzwX4Otgw5T8bw8yeX/cUlARYM9HijXrxh98GY@lists.infradead.org
X-Gm-Message-State: AFuF++lEJAXTyjUfHfP7z6ElYWMO8lx6asmGB49p2bql+jy5pdRHgnvP
	Md+xoH+jL2YWUk/by31L1xpJTsO93MaAE6ZA8CNTq/23IB+EIQw1kpsy5ouXuzVh2E3k61CNUzv
	m13GPpEhuY4MavwLRki0/0YmfmsOCL6w=
X-Received: by 2002:a05:6512:b87:b0:5b6:1a7c:fd86 with SMTP id
 2adb3069b0e04-5b8b6652ac6mr244953e87.44.1789534601132; Tue, 15 Sep 2026
 21:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org>
In-Reply-To: <20260916044119.475666-1-alastair@d-silva.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 16 Sep 2026 12:56:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
X-Gm-Features: AcwNN1UfVwvH_TTNjxWxYFWqmDiwY6R0M22kYyQVnOwJYHGWocQFI_cDBu05Ups
Message-ID: <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] net: Add Allwinner H616/H618 EMAC1 and AC300
 EPHY support
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	James Hilliard <james.hilliard1@gmail.com>
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

On Wed, Sep 16, 2026 at 12:41=E2=80=AFPM Alastair D'Silva <alastair@d-silva=
.org> wrote:
>
> This series adds support for the secondary Ethernet MAC controller (EMAC1=
)
> and the co-packaged AC300 Fast Ethernet Physical Layer (EPHY) found on
> Allwinner H616 and H618 SoCs.
>
> The Allwinner H616/H618 SoCs feature two EMAC instances: EMAC0 (typically
> used with an external RGMII Gigabit PHY) and EMAC1 (Fast Ethernet,
> connected internally to the co-packaged AC300 EPHY). EMAC1 uses a
> dedicated clock control register in the syscon register space, which is
> accessed via an offset index in the DT syscon property.
>
> The AC300 is an integrated 10/100M (100BASE-TX / 10BASE-T) Fast Ethernet
> PHY communicating over MDIO at address 16 + phy_addr. It requires
> retrieving factory bandgap calibration data from the SID nvmem controller=
,
> managing internal power rails and clocks, and optimizing transceiver sign=
al
> parameters.

There is already a series from James covering the same thing. Please check
the mailing list and possibly our wiki (linux-sunxi.org) to avoid duplicate
work and subjecting the maintainers to the same discussions again.


ChenYu

> To ensure reliable link establishment and MAC software reset with the
> internal PHY, dwmac-sun8i is updated to defer MAC software reset until
> sun8i_dwmac_init() after the internal PHY has powered on and begun
> clock generation.
>
> The series is structured as follows:
> - Patch 1: DT binding for Allwinner AC300 EPHY.
> - Patch 2: PHY driver for Allwinner AC300 EPHY.
> - Patch 3: DT binding update for Allwinner H616 EMAC1 and syscon index.
> - Patch 4: dwmac-sun8i driver support for H616 EMAC1 clock index and
>            internal PHY deferred reset.
>
> Testing:
> - Tested on physical Mellow Fly-C5 hardware (Allwinner H618) running
>   Armbian with sustained 100Mbps full-duplex network traffic (DHCP,
>   iperf3, NFS rootfs).
> - Device tree bindings validated with dt_binding_check.
> - Separate SoC and board DTS additions will be submitted via the
>   linux-sunxi tree.
>
> Alastair D'Silva (4):
>   dt-bindings: net: phy: Add Allwinner AC300 EPHY binding
>   net: phy: Add Allwinner AC300 EPHY driver
>   dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1
>     and syscon index
>   net: stmmac: dwmac-sun8i: Add Allwinner H616 EMAC clock index and
>     internal PHY support
>
>  .../net/allwinner,sun50i-h618-ac300-ephy.yaml |  79 +++++
>  .../net/allwinner,sun8i-a83t-emac.yaml        |  14 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  65 +++-
>  drivers/net/phy/Kconfig                       |   9 +
>  drivers/net/phy/Makefile                      |   1 +
>  drivers/net/phy/ac300-phy.c                   | 331 ++++++++++++++++++
>  6 files changed, 486 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun50=
i-h618-ac300-ephy.yaml
>  create mode 100644 drivers/net/phy/ac300-phy.c
>
> --
> 2.53.0
>

