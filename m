Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501BBC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZORe/+VwOmTKCnEN5Tm3BfvX4hAqdI2noG2Lc0f2jfY=; b=oL6WZ+bAmZbKTmoLY7qqfa5OyC
	8dNhiymyRp4NxSE1GETUfMQ/A+yy8ny0OlLX0eOtsPQAib9xqn+rkA3y93XjJydW5Y6azaziyc5mk
	RykVCYCZojn8rnGpsHjLW+xI0VmgZgAYls8v7q+AK9n0/yhm9dUiX+gIPMv8GBeRdBtP05JnYr6T4
	aN2MPL4Qx5rxN3sHFWlHB1h1md2fSVD2PTMtzgcE6WEdB+yyOoeZXdqa/Mvij24cpDsdBiaCVQnLA
	r7we/ivB1vyanyN7PgGpNQFQMtoQecxM/vJgKMNtKKNxsRxteV0Va6kKLE7POEo0n4P8uu/lbRAdr
	qvUDjoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNDS-0000000GZRD-0mEd;
	Wed, 08 Jul 2026 08:01:10 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNDN-0000000GZPU-3Mq5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZORe/+VwOmTKCnEN5Tm3BfvX4hAqdI2noG2Lc0f2jfY=; b=k8JGePCWEmP9lewiLETUuZkBzQ
	CWE/AxtZe1AN3MG+/zZ6MoVwMbbNJTDpsssebY9AQnnjKsvwEoKq+2tstg/ItaopZe8i0KyzZ1nQ1
	K4FJA0A4SQJ/QSg0B30NIT2jcfyNDXk8FDc4SczxBbfHqgPWBMM6+EN4kHpzteI+8Wcjy+w2P/nB8
	IiU4upvt4Hr++wiiCezCOcZzC/NB5r9AUhOgL16fq3qv/KZ7r0VpNnf33QHVvIbZa1LpiQ2QQ2M9d
	d0hK2OR63mQohnqWI3o2aJ7aQdRSwUSopZjcsakaMuGgkBMibqMB1YPaFr+zh3AHY9KllbOd4uSZp
	LTnyClRg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1whNDE-00086x-1w;
	Wed, 08 Jul 2026 10:00:56 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1whNDE-000Pap-30;
	Wed, 08 Jul 2026 10:00:56 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Stefan Agner <stefan@agner.ch>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev,
 Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH net v2] net: stmmac: resume PHY before hardware setup when opening
 the interface
Date: Wed, 08 Jul 2026 10:00:55 +0200
Message-ID: <5162542.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260707195425.405989-1-stefan@agner.ch>
References: <20260707195425.405989-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28054/Wed Jul  8 08:24:53 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_010105_957308_A10D56D5 
X-CRM114-Status: GOOD (  22.55  )
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

Hi Stefan,

thanks for the patch.

Am Dienstag, 7. Juli 2026, 21:54:25 CEST schrieb Stefan Agner:
> Since the referenced commit, changing the MTU on a running interface no
> longer disconnects and reconnects the PHY; __stmmac_release() merely
> stops phylink, which also suspends the PHY (BMCR power-down) when WoL
> is not enabled. __stmmac_open() then performs the DMA software reset in
> stmmac_hw_setup() before phylink_start() resumes the PHY again.
>=20
> IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
> powered down, and stmmac requires a running receive clock for the DMA
> software reset to complete (the phylink config sets mac_requires_rxc).
> On such setups, e.g. the RK3566-based Home Assistant Green with an
> RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
> leaves the interface dead:
>=20
>   rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
>   rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initi=
alization failed
>   rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
>   rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface af=
ter MTU change
>=20
> In the field this is triggered by NetworkManager applying an MTU while
> activating the connection, breaking networking entirely.
>=20
> Resume the PHY in __stmmac_open() before the hardware setup, making it
> the counterpart of the phylink_stop() in __stmmac_release(), like
> stmmac_resume() already does for the same reason. phylink_start() also
> resumes the PHY, but only after stmmac_hw_setup(), and it cannot be
> moved before the hardware setup since it may bring the link up
> immediately from a workqueue, racing with the initialization (see the
> comment in stmmac_resume()). For the regular ndo_open path the PHY has
> just been attached and is not suspended, in which case
> phylink_prepare_resume() does nothing.
>=20
> Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open=
()/release()")
> Link: https://github.com/home-assistant/operating-system/issues/4858
> Signed-off-by: Stefan Agner <stefan@agner.ch>

=46WIW imx8mp based platforms (TQMa8MPxL in my case) are also affected, see=
 [1].

This patch fixes the problem here as well, so:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

[1] https://lore.kernel.org/all/8409022.LvFx2qVVIh@steina-w/

> ---
> Changes in v2:
> - Move the PHY resume from stmmac_change_mtu() into __stmmac_open() so
>   that it also counters the PHY suspend caused by __stmmac_release()
>   (suggested by Andrew Lunn), placed before stmmac_reset_queues_param()
>   to match the ordering used in stmmac_resume()
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4147,6 +4147,15 @@
>  			dma_conf->tx_queue[i].tbs =3D priv->dma_conf.tx_queue[i].tbs;
>  	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));
> =20
> +	/* The PHY is suspended when the interface is reopened without
> +	 * disconnecting the PHY, e.g. on MTU change. IEEE 802.3 allows PHYs
> +	 * to stop their receive clock while powered down, but the DMA
> +	 * software reset in stmmac_hw_setup() requires a running receive
> +	 * clock, and phylink_start() below resumes the PHY only after the
> +	 * hardware setup. Resume a suspended PHY here first.
> +	 */
> +	phylink_prepare_resume(priv->phylink);
> +
>  	stmmac_reset_queues_param(priv);
> =20
>  	ret =3D stmmac_hw_setup(dev);
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



