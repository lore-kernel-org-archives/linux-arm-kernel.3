Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461C0CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rx2Dp8F0G79AkzZ8TkfSoNMZCeNYUm4dgXzgVmBJYYU=; b=CwXKLUHLlHeORcZ5tolhV0He6M
	L8sqhDp/p5v4Ogse1ip3OMixOarV9htRpS4AB21Neu5nMRP3QZrzwcNsmlsdJ9t74GjSIgfIFGafv
	7Fopw6gT5JpcoLyw5HmE/GXzH+iKhJIUxPrBUh/ZFadfrewUvK73towO3IEYmPOH5uF6rpVBIPGlc
	HGzv7G3JOh3adVbXXxe9g+OsfEuq8OiCuPtFfZpfrLYqY2KrEj600JPwS7W1Iq62l/I7U1jLFfb9r
	UYIpnZKYAuHudRZpXVYPCDMbmou+AGfrD8r3EFJISLcBMEv8PiE7pkHkIfOYqfs3FG4b1n/hJlPRS
	oZphPwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFek-00000001Fyv-2IpA;
	Mon, 28 Sep 2026 18:00:50 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFei-00000001FyD-3GE8;
	Mon, 28 Sep 2026 18:00:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790618430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LPNI4MswH7Lzntzn90zDKT599utqlLYYxB65mXavT7wDLugpHBgF6zCKDAVr3jpuTuWKpt7nSHohwlogSJNXIQu63ODrw5AlEo1wbT/uAOB1meoE0y/JOIZWObjS48MJzKNOWXR+/Gwpfeu0NsS/MqRC8ilLhMcFIKhPRJGZWes=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790618430; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rx2Dp8F0G79AkzZ8TkfSoNMZCeNYUm4dgXzgVmBJYYU=; 
	b=RQOMq9AHmT+JrwZb2c/bEpey0HjPjzJTWBWcDG727xpNONUU4xzfZPVGClzjnSnSWqpz4kQW0cAE8356G+oMxtia1EF6JRlNsd7Jy7hDRolt9GgGnqWRrFRAq0C10TQG7cRhZ1qgaLy5N/O59MY1uPqZ5GdezLaa6LjwQZVjRAI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790618430;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=rx2Dp8F0G79AkzZ8TkfSoNMZCeNYUm4dgXzgVmBJYYU=;
	b=kNNoiGV6doOW3mVcl+p8MW6tf2EKhNZuGCmyzX6mJpdPZNghSdU5Lb7032525Zvi
	WsihPJchqqZ/b++ELDdBz3wbWea72I1hph29bZ1pwvO4itw20C2m2xDLzMPCcn5HWxP
	hmUx8QU2gtztNZf44iZHQ22CZGuiMMVwjsOqZUzY=
Received: by smtp.zohomail.com with SMTPS id 1790618428921626.3807045692041;
	Mon, 28 Sep 2026 11:00:28 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 9FC5618081B; Mon, 28 Sep 2026 20:00:24 +0200 (CEST)
Date: Mon, 28 Sep 2026 20:00:24 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com
Subject: Re: [PATCH] phy: rockchip: inno-usb2: ensure PHY is running when
 clock is requested
Message-ID: <arqnn8s5yFmZzQvG@venus>
References: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
 <xnvakstneih6njyxfe27kdx54vy3zpnth24o4mjlzuoykb2pfh@np7dx62waujo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="untgwae5zqmwhmvm"
Content-Disposition: inline
In-Reply-To: <xnvakstneih6njyxfe27kdx54vy3zpnth24o4mjlzuoykb2pfh@np7dx62waujo>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.602.86
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_110048_879199_1B9D9577 
X-CRM114-Status: GOOD (  36.85  )
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


--untgwae5zqmwhmvm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] phy: rockchip: inno-usb2: ensure PHY is running when
 clock is requested
MIME-Version: 1.0

Hello Mani,

On Sat, Sep 26, 2026 at 04:50:07AM +0200, Manivannan Sadhasivam wrote:
> On Tue, Sep 08, 2026 at 06:07:42PM +0200, Sebastian Reichel wrote:
> > On RK3588 the OHCI controller registers can only be accessed when the
> > PHY's 480MHz clock is running. After system suspend the controller is
> > resumed before the PHY.
>=20
> This statement is slightly confusing. There is no PM ops in this
> PHY driver.

I will take a closer look how it is powered off during suspend.
Generally I expect it to loose state in any case as the related
power domain should be disabled.

> > The controller requests the clock, which opens
> > the gate in the PHY's clock prepare function. But with the PHY suspended
> > this just results in a dead clock being routed. The OHCI driver will
> > then continue to access its registers resulting in a board hang.
> >=20
> > Fix this by resuming the suspended PHY in the clock's prepare function,
> > so that the clock is really prepared once the function returns.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> > This was noticed on RK3588 EVB1 when resuming from system suspend. This
> > is technically a fix, but its unclear when the bug was introduced and
> > system suspend is broken on RK3588 for quite a while and not just due
> > to this problem. So I think this fix can be merged the normal way via
> > linux-next.
> > ---
> >  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 37 +++++++++++++++++++=
++++++++
> >  1 file changed, 37 insertions(+)
> >=20
> > diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/ph=
y/rockchip/phy-rockchip-inno-usb2.c
> > index 7d8a533f24ae..07d400967def 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > @@ -332,6 +332,39 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw =
*hw, struct regmap **base,
> >  	}
> >  }
> > =20
> > +static int rockchip_usb2phy_clk480m_leave_suspend(struct clk_hw *hw)
> > +{
> > +	struct rockchip_usb2phy *rphy =3D container_of(hw, struct rockchip_us=
b2phy, clk480m_hw);
> > +	bool relock =3D false;
> > +	int ret, i;
> > +
> > +	/* Limit to single port; it's unclear how multi-port should be handle=
d */
> > +	if (rphy->phy_cfg->num_ports > 1)
> > +		return 0;
> > +
> > +	for (i =3D 0; i < rphy->phy_cfg->num_ports; i++) {
> > +		struct rockchip_usb2phy_port *rport =3D &rphy->ports[i];
> > +		const struct rockchip_usb2phy_port_cfg *port_cfg =3D rport->port_cfg;
> > +
> > +		if (!rport->phy || !port_cfg || !port_cfg->phy_sus.enable)
> > +			continue;
> > +		if (property_enabled(rphy->grf, &port_cfg->phy_sus)) {
> > +			property_enable(rphy->grf, &port_cfg->phy_sus,
> > +					false);
> > +			relock =3D true;
> > +		}
> > +	}
> > +
> > +	if (relock) {
> > +		ret =3D rockchip_usb2phy_reset(rphy);
> > +		if (ret)
> > +			return ret;
> > +		usleep_range(1500, 2000);
> > +	}
> > +
>=20
> This looks like a duplication of rockchip_usb2phy_power_on(). So I'm assu=
ming
> that phy_power_on() is not called by the OHCI driver before accessing the
> registers. So why don't you fix that instead?

I can look into it. My way of thinking was, that the clock should be
running independently of that when the clock has been requested via
common clock framework.

Greetings,

-- Sebastian

--untgwae5zqmwhmvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmq6qzQACgkQ2O7X88g7
+pog+A/+MEyOCVKuYQ5mvlVbb5Ag+syHiOeLRFUzhUivNdnzrXzfdkriXModstAY
TFfa4898XF49E/Ru7SIFZBvG/X+K0TwZmezCy6NKxZKAkxbt13pc8x4gxwMaalKb
Pf7G51RdsaL+QVUGKiHzqjt2Ij8J3qvOp6QUTceI6kKA8xIg4D8ObWXi1m9FV0vT
ep8U5w/l8/ZJ+8wTDawVBPMG/IZ03HoviEfeN7YB3Bbu7unEWkWUKWLAaa3o5Bj2
urmwDdGa4AI7v8AQqg8hapFNDWNbW+0ltgv0fLBRJl9jyN49BVjDHbK/3YNFW4Vk
nchGhClmnnc7g+Arwj+ddamMh42B52eXdN062igi1+9omeDm7QdXNoIyyuLT+Jwm
Yu+fB+HiiOe2AKHNdB4mi85Z4D2p9eTNbA7xXgAAA+BGb7mNm02wdY3zvUC2mtCU
6a/5qXzoypPq+WkbcKPOKfESeQ7wNcdETRAnHfSg8izrfW5lZ9ZsC2amUVDkWLo9
VRJ61SESKkPvgTaqscTNIBFX20I46FU0noS/JSe6jTL7j+Phn36Ert4ZIH6JRZZK
8ADc8nasbNs7VJ6AERiF5Z34j8uL36z7oRDiK7CzlYWhQGg9mbvfH5PjBZwuoYkr
IGuop0RFl3hrViQsLJ4KPhyfNPUKIFPB+SbuAV0wy08eia2W4YU=
=dCQG
-----END PGP SIGNATURE-----

--untgwae5zqmwhmvm--

