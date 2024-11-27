Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230E2D609D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwDmA6skYXcjb+3giHmONmMK1TWUq1rfdu1TdOWnKkM=; b=hiO2LSomtrxp+c9mJXsEyvuAx0
	68oOEAjtGiy2h+vHdvBsxVusrtusHRoFOfyC6qnK4zQCfQJEAd/cLXS7VweKI+K2Txi5QSm23q06j
	a89ggSC26SoFfKAaOD48hoXSQfgOYYSoxG0k2mUXcaojymdfJNmB+sTJB9KR2O+EpXwnCxWaV+TOj
	jAvjbLmO7YV+ssJT+RZQCPq/e5iF7QEND7UINOQwegk4waQxDpfdxMVOfAyTy7Mg/ZagEXjYXb1bw
	OpJzCGpxHmrKy4yHFqFDvhvTXU8maKh577P1t/r4yZG8nDn2zTsyZdR+/WMrSTsOei8mW++Bs2jnC
	q3DRwAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG3L-0000000Cyqu-33ak;
	Wed, 27 Nov 2024 11:17:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFqu-0000000Cwic-2Sy9;
	Wed, 27 Nov 2024 11:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dwDmA6skYXcjb+3giHmONmMK1TWUq1rfdu1TdOWnKkM=; b=jC4Qf6Z34pla9wt4LKBGTlfWtf
	cWD+9s5TgURjpIWz0uM9A3O5+0FIPGktRKmtjnI7ram+gnDjCNigmqEAkMq5OuM5A+zcpE5Q/BpIk
	i+pKu4k5i1jzBh4BZnr94KiJEJYGgzgQ2+n0OZDfnISGiOpQpM4Ejwq+/AepupXeZ1eIHfXgpNVyT
	weWadve+G1HSIgiRejBUud034nzQ/UqdsLCqL2kmItTErhbTBYq/hALKnP1A45xL1GG1zc5Pvpn50
	fbhKGBDsKEUvjsZ1OWsRmhJNnsvzNcHB+f84hCOYYqDHg/Ph6JWOWH7XjmnRrbXIUFwwnvnKACHT2
	DPINEu5g==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tGFqj-0000Hk-5v; Wed, 27 Nov 2024 12:04:49 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support for eDP
 mode
Date: Wed, 27 Nov 2024 12:04:48 +0100
Message-ID: <2131853.KlZ2vcFHjT@diego>
In-Reply-To: <8df0acc8-b7aa-453f-b55c-30144f51d7cf@rock-chips.com>
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <4260470.1IzOArtZ34@diego>
 <8df0acc8-b7aa-453f-b55c-30144f51d7cf@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_030500_619101_84E53088 
X-CRM114-Status: GOOD (  31.53  )
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

Hi Damon,

Am Mittwoch, 27. November 2024, 12:00:10 CET schrieb Damon Ding:
> Hi Heiko:
>=20
> On 2024/11/27 17:29, Heiko St=FCbner wrote:
> > Hi Damon,
> >=20
> > Am Mittwoch, 27. November 2024, 08:51:51 CET schrieb Damon Ding:
> >> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing a=
nd
> >> pre-emphasis configurations of each link rate have been verified accor=
ding
> >> to the eDP 1.3 requirements.
> >>
> >> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >> ---
> >=20
> > [ ... huge block of DP phy support ...]
> >=20
> > yes that block was huge, but I also don't see a way to split that up in=
 a
> > useful way, so it should be fine.
> >=20
>=20
> As for the huge block of DP phy support, I will try to use the existing=20
> rk_hdptx_multi_reg_write() to set regs in next version, maybe the way=20
> can make the codes more concise.

I actually did like the the dp-side of the phy code.

That you need to add all the DP stuff can't be helped and I actually find
real functions nicer than having anonymous register writes.

I.e. the hdmi-side with its register lists does write "magic" values to
registers.

So personally I'd just leave the dp-functions as is please, until someone
does complain (I was not trying to complain, just mentioned why I cut
it from the reply :-) )


Thanks
Heiko


> >> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
> >> +				 int submode)
> >> +{
> >> +	return 0;
> >> +}
> >=20
> > I think it might make sense to go the same way as the DCPHY and also
> > naneng combophy, to use #phy-cells =3D 1 to select the phy-mode via DT .
> >=20
> > See [0] for Sebastians initial suggestion regarding the DC-PHY.
> > The naneng combophy already uses that scheme of mode-selection too.
> >=20
> > There is of course the issue of backwards-compatibility, but that can be
> > worked around in the binding with something like:
> >=20
> >   '#phy-cells':
> >      enum: [0, 1]
> >      description: |
> >        If #phy-cells is 0, PHY mode is set to PHY_TYPE_HDMI
> >        If #phy-cells is 1 mode is set in the PHY cells. Supported modes=
 are:
> >          - PHY_TYPE_HDMI
> >          - PHY_TYPE_DP
> >        See include/dt-bindings/phy/phy.h for constants.
> >=20
> > PHY_TYPE_HDMI needs to be added to include/dt-bindings/phy/phy.h
> > but PHY_TYPE_DP is already there.
> >=20
> > That way we would standardize on one form of accessing phy-types
> > on rk3588 :-) .
> >=20
> > Also see the Mediatek CSI rx phy doing this too already [1]
> >=20
> >=20
> > Heiko
> >=20
> > [0] https://lore.kernel.org/linux-rockchip/udad4qf3o7kt45nuz6gxsvsmprh4=
rnyfxfogopmih6ucznizih@7oj2jrnlfonz/
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> >=20
>=20
> It is really a nice way to separate HDMI and DP modes.
>=20
> >=20
> >=20
> >=20
> >=20
>=20
> Best regards,
> Damon
>=20
>=20





