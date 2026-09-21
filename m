Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3733EC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G4T0MAWfyxwtdo4bQIzxWIk9EaFzA8n4tVd4B6WzeM=; b=yro230W1lCTZDjePsfxmR7bM3A
	WGAByCxGyCB/TV2AZb7nT0Nd+IiXuezzVGm4nNSrSEUXkqC+kpHpb06HaeWmZ3KgkZzbkhOFIya+E
	KlDyfPdB7DP8id1iCMJyURCShhMibROmOBikSl7fDIAwDVAXHF67jOArOHrJ7O/4ZpTYON9WYw/Xe
	TXgHZbDxuxWwT2dCvkYYawQxV1eWPV7vP9QGRTA8aqBqHbn/2xAEV2t4qSr20CqqMR4z2MnjzVUM3
	SrDxwvXYBStcQmIKmfx4L1UXSQHNHrm/NTU/CtqGmVW+ORa6GVFTklvf6VzTY4X83Ldj3nUcutB/f
	/eh8RJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ks2-00000003NyP-2WSq;
	Mon, 21 Sep 2026 20:44:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ks1-00000003Nxv-0NN2;
	Mon, 21 Sep 2026 20:44:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BD0B60142;
	Mon, 21 Sep 2026 20:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BABE1F000FF;
	Mon, 21 Sep 2026 20:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790023451;
	bh=2G4T0MAWfyxwtdo4bQIzxWIk9EaFzA8n4tVd4B6WzeM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ASIU3ya9AEqjh0TgaUFHTneshyOF8JcyNqC6qjhRySf+P4e1oLzWTERmhhS4TA9Qy
	 S1c6KSAEbHoTp+V0PNCA2K0aQLqjp5vZU6TlG87HDkHN7w2kMHKX0uycI5RmMTxkF8
	 cYi4/moQoOzVByogBDPqkRoKweQUrgje6uHCpA57c7znu6veEA04uBhRHpj7cA/0Dm
	 4GQEMw9PkFlWjVW3K6lmM+DpJgKZ2s3/A4nyZhBU0IqrYuUDFWTQi1zYdL5ke3Rm6G
	 4MyFxZBWDJzQHzwEdYFlGe+tk7eoHXjM2AUw6/d5lA6KxRA6udR/8+Y2qxHkyXIf8b
	 jnUzOI5r3o8ew==
Date: Mon, 21 Sep 2026 13:44:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vladimir
 Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle
 <daniel@makrotopia.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell
 King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v22 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
Message-ID: <20260921134410.13a7173c@kernel.org>
In-Reply-To: <20260915123812.14747-5-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
	<20260915123812.14747-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2026 14:38:01 +0200 Christian Marangi wrote:
> Add support for Airoha AN8855 Switch that provide support for a DSA
> switch and a NVMEM provider.
>=20
> Also make use of the mdio-regmap driver and register a regmap for each
> internal PHY of the switch.
> This is needed to handle the double usage of the PHYs as both PHY and
> Switch accessor.

GCC spews warnings:

drivers/mfd/airoha-an8855.c: In function =E2=80=98an8855_mdio_register=E2=
=80=99:
drivers/mfd/airoha-an8855.c:438:48: warning: =E2=80=98-phy=E2=80=99 directi=
ve output may be truncated writing 4 bytes into a region of size between 1 =
and 61 [-Wformat-truncation=3D]
  438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus->=
id, addr);
      |                                                ^~~~
In function =E2=80=98an8855_phy_bus_register=E2=80=99,
    inlined from =E2=80=98an8855_mdio_register=E2=80=99 at ../drivers/mfd/a=
iroha-an8855.c:469:9:
drivers/mfd/airoha-an8855.c:438:45: note: using the range [-2147483648, 214=
7483647] for directive argument
  438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus->=
id, addr);
      |                                             ^~~~~~~~~~
drivers/mfd/airoha-an8855.c:438:9: note: =E2=80=98snprintf=E2=80=99 output =
between 6 and 76 bytes into a destination of size 61
  438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus->=
id, addr);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~


