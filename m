Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667F3E9128C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 07:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ntdpc/kmU25S8F1eDNB57650TuUB4jKAVLcNz3WP428=; b=UCwh01Q4bzwlb7uVJbGCulgwZT
	MmPPjmeyW92BJMy1mPcCzijd3DVSMHajc363fe75GrnQ2qwPG2+OHI8O1UuM/4rr3RWWGu6MTSSCd
	R67ciAV+0aGz4frd/qGxnsx4ORQt309aHzEJBoP8M/hIG2NPsuiqPCxQ5xbscK10QHp9xvaEEqkDk
	/n70nckkZ1lPF6DmVPoDpo9kHAL2HpsApx/g28W4pqym4dUDYJm88JrM/70Sm0P1Dm65J4rEm4FIr
	3v7liRwQI9w0347EaauWo6MAXQHhXNQ8YAEFlO2NbMtdD+JyypaOo9SPevIxQXHmNAomwjdGpyriP
	yRyCYRjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnu2N-00000009Zob-151X;
	Thu, 05 Feb 2026 07:44:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnu2I-00000009ZnJ-3xk6;
	Thu, 05 Feb 2026 07:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Ntdpc/kmU25S8F1eDNB57650TuUB4jKAVLcNz3WP428=; b=JD9cFskb0ndPxsKG6mTXNaig4G
	AjzKOFM/uI2N0j2aUVwUgcC3SwPYbKsfsc1pabUNvUYnLLVx209LS6nhZAnvXY5BX8ICUrdVb19fB
	wewmjBHYAs1usCTPHRkN+XodwpBydq99GjSElbGrZ60yAKYLCsDkDcI2lDDLpJbL4ceI7O3CDkc9e
	gcwDxAN6xJeO50QVSckVR8cfFj13SswOLKmnJ2uunwIVKPVIny+RCf1Dqu85I4ryNCdQe+UbEhdnH
	/3DMcq2+DuBck+ZT3iQb9/jkiVArfTRJLr/lktcrqnP/yb2Z08mPU/+Yf0zqn1Ed+RylgHGgzBWXu
	ch73Pyqg==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnu28-0074Ju-66; Thu, 05 Feb 2026 08:44:12 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/6] net: stmmac: rk: use rk_encode_wm16() for clock
 selection
Date: Thu, 05 Feb 2026 08:44:11 +0100
Message-ID: <3561842.ZfL8zNpBrT@diego>
In-Reply-To: <aYPHjS0wrtXlRb1a@shell.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk> <20297648.sWSEgdgrri@diego>
 <aYPHjS0wrtXlRb1a@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_234423_041382_0C7AA8C4 
X-CRM114-Status: GOOD (  33.18  )
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

Hi Russell,

Am Mittwoch, 4. Februar 2026, 23:26:21 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Russell King (Oracle):
> On Wed, Feb 04, 2026 at 11:03:51PM +0100, Heiko St=C3=BCbner wrote:
> > Am Mittwoch, 4. Februar 2026, 10:14:38 Mitteleurop=C3=A4ische Normalzei=
t schrieb Russell King (Oracle):
> > > Use rk_encode_wm16() for RMII clock gating control, and also for the
> > > io_clksel bit used to select the transmit clock between CRU-derived
> > > and IO-derived clock sources.
> > >=20
> > > Both of these were configured via the "set_clock_selection" method in
> > > the SoC specific operations, but there is no requirement to change the
> > > io_clksel except when enabling clocks.
> > >=20
> > > It is also possible that we don't need to ungate the RMII clock if we
> > > are operating in RGMII mode, but this commit makes no change there.
> > >=20
> > > Split up the configuration of these as separate functions, and remove
> > > the set_clock_selection() method. Since these clocking bits are in the
> > > same register that we call the "speed" register, move the logic for
> > > writing that register into rk_write_speed_grf_reg().
> > >=20
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 174 ++++++++--------=
=2D-
> > >  1 file changed, 75 insertions(+), 99 deletions(-)
> > >=20
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers=
/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > index 4099cbc5d0de..ed9adac70f0a 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > @@ -27,8 +27,17 @@
> > >  struct rk_priv_data;
> > > =20
> > >  struct rk_clock_fields {
> > > +	/* io_clksel_cru_mask - io_clksel bit in clock GRF register which,
> > > +	 * when set, selects the tx clock from CRU.
> > > +	 */
> > > +	u16 io_clksel_cru_mask;
> > > +	/* io_clksel_io_mask - io_clksel bit in clock GRF register which,
> > > +	 * when set, selects the tx clock from IO.
> > > +	 */
> >=20
> > nit: comment stile does not seem to follow the kernel coding style
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/coding-style.rst#n622
>=20
> netdev has historically had this style which is separate from the rest
> of the kernel. The file already uses this comment style, so it is
> entirely correct to keep to the style which already exists in this
> file, rather than mixing styles and turning it into a mess.

thanks for the clarification. Then the comment style is obviously fine.

Regards
Heiko


> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Tested-by: Heiko Stuebner <heiko@sntech.de> #px30,rk3328,rk3568,rk3588
>=20
>=20





