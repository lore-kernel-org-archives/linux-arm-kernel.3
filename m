Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC73D185F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsWJYiBpuqd1lpucQWTI3gkEjPm0VqxDENR2bRnkxcI=; b=FiNRGoEQCt9hInkc85lP/0wmqz
	U3Kj2vf1HJ3EzdgtN3DuSxtGajw9Rqqy1j2Vian+0gqWSPYD2WOW4YXITDIFa2GR3YeAw8FPE9jIU
	mLt2PdiRv4G6uEWyZq2tI+jbJMYAbWT8J4ci2km8Gb4oER8i1FgXu2cnlqsc0eJIv31H+XRip1vXp
	Dt930IDJVHOh+MMHevVblQHOXC3hXjYjo190zrO1L3YJApggX3z8cNvRH7fnP+RXtZwuRoRpteftn
	mzl3uWGSigpKdVNg3i+QHakUgzJUI6M1Dz958eO/1FN3lzUSMdpcMOX6QILsUZB+Bcq/UmbzcIGQR
	N5yQGXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpyq-0000000H9GZ-1b6v;
	Thu, 08 Jan 2026 13:23:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpyn-0000000H9Fw-0zmO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:23:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdpyU-0005cJ-PR; Thu, 08 Jan 2026 14:22:50 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdpyS-009gXW-2F;
	Thu, 08 Jan 2026 14:22:48 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdpyS-000000007uP-1b8C;
	Thu, 08 Jan 2026 14:22:48 +0100
Message-ID: <1fe08251f091bd695f630b7b46ae8c8d85d664a3.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] net: stmmac: socfpga: add call to
 assert/deassert ahb reset line
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dinh Nguyen <dinguyen@kernel.org>, Maxime Chevallier	
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue	 <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mamta Shukla	 <mamta.shukla@leica-geosystems.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: bsp-development.geo@leica-geosystems.com, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Thu, 08 Jan 2026 14:22:48 +0100
In-Reply-To: <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
	 <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_052309_278713_4E5183A5 
X-CRM114-Status: GOOD (  21.54  )
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

On Do, 2026-01-08 at 07:08 -0600, Dinh Nguyen wrote:
> The "stmmaceth-ocp" reset line of stmmac controller on the SoCFPGA
> platform is essentially the "ahb" reset on the standard stmmac
> controller. But since stmmaceth-ocp has already been introduced into
> the wild, we cannot just remove support for it. But what we can do is
> to support both "stmmaceth-ocp" and "ahb" reset names. Going forward we
> will be using "ahb", but in order to not break ABI, we will be call reset
> assert/de-assert both ahb and stmmaceth-ocp.
>=20
> The ethernet hardware on SoCFPGA requires either the stmmaceth-ocp or
> ahb reset to be asserted every time before changing the phy mode, then
> de-asserted when the phy mode has been set.
>=20
> With this change, we should be able to revert patch:
> commit 62a40a0d5634 ("arm: dts: socfpga: use reset-name "stmmaceth-ocp"
> instead of "ahb"")
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index a2b52d2c4eb6f..79df55515c718 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -407,6 +407,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_d=
wmac *dwmac)
> =20
>  	/* Assert reset to the enet controller before changing the phy mode */
>  	reset_control_assert(dwmac->stmmac_ocp_rst);
> +	reset_control_assert(dwmac->plat_dat->stmmac_ahb_rst);

Since these two are just different names for the same reset,
I think it would be cleaner to rename dwmac->stmmac_ocp_rst to
dwmac->stmmac_ahb_rst and assign this either to
dwmac->plat_dat->stmmac_ahb_rst or to the stmmac-ocp reset during
probe.

Also, a comment explaining that the dem_reset_control_get_optional(dev,
"stmmaceth-ocp") is for backwards compatibility with legacy device
trees could be helpful to future readers.


regards
Philipp

